;;;FILE: "asm.sch"
;;;IMPLEMENTS: simple aarch64/arm64 assembler
;;;LANGUAGE: Guile Scheme
;;;AUTHOR: Kenneth A Dickey
;;;COPYRIGHT 2019 Kenneth A Dickey

;; helpers

(define (->hex n) (string-append "#x" (number->string n 16)))
(define (->bin n) (string-append "#b" (number->string n  2)))

; place n at position bitpos
(define (%place n bitpos) (ash n bitpos))

; assemble list of (n pos) as a single fixnum
(define (%list-place list-of-n-bitpos-pairs)
  (let loop ( (result 0) (lis list-of-n-bitpos-pairs) )
    (if (null? lis)
        result
        (loop (logior result (%place (caar lis) (cadar lis)))
              (cdr lis)))))

;; (->hex (%list-place '([1 2][3 4][#xff 16]))) --> "#xff0034"

(define-syntax gather-bits
  (syntax-rules ()
    ((gather-bits [lft rt] ...)
     (%list-place (list [list lft rt] ...)))))

;; (->hex (gather-bits [1 2] [3 4] [#xff 16]))  --> "#xff0034"

(define (rassq val alist) ;; reverse assq
  (let loop ( (lis alist) )
    (cond
     ((null? lis) #f)
     ((eq? val (cdar lis)) (car lis))
     (else (loop (cdr lis))))))

;; Assume alist is well formed ( (key-symbol some-value) ..)
(define alist-assq
  (lambda (alist failmsg)
    (lambda (key)
      (cond
       ((assq key alist) => cdr)
       (else (error failmsg key)))
) ) )

(define alist-rassq
  (lambda (alist failmsg)
    (lambda (val)
      (cond
       ((rassq val alist) => car)
       (else (error failmsg val)))
) ) )

(define (alistify list start)
  (let loop ( (result '()) (lis list) (idx start))
    (if (null? lis)
        result
        (loop (cons (cons (car lis) idx) result)
              (cdr lis)
              (+ 1 idx))))
)

(define list-append append)

;; ========================================================== ;;
;;; REGISTERS

;;; C call ABI:
;;;  Register usage: [Xn=>Double[64bits], Wn=>Word[32bits]]
;;;   XZR:	Zero register -- reads zero, writes ignored
;;;   X0-X7:	C argument/result registers;   calleR-save
;;;   X8:	C address of structure result; calleR-save
;;;   X9-X15	Scratch/Temp registers, calleR-save [calleE scratch]
;;;   X16-X17 [IP0,IP1]: intra-procedure-call scratch registers (linker uses)
;;;   X18:	Platform specific use [avoid]
;;;   X19-X28	calleE-save
;;;   X29=FP:	frame-pointer
;;;   X30=LR:	link-register
;;;   SP:	Stack Pointer [4 lower bits 0 -> 16-byte aligned]
;;;   NZCV:	Status/flags Register [Neg/Zero/Carry/oVerflow]
;;; [NB: r31 encodes as SP or XZR depending on instruction]
;;; [NB: PC is _NOT_ a named register and is not directly available; use ADR/ADRP]
;;; Floating Point Registers [D=Double[64],Q=Quad[128],W=Word[32],H=Half[16],B=Byte[8]]
;;;   D0-D7	floating point arg/result; calleR-save
;;;   D8-D15:	calleE-MUST-save
;;;   D16-D31:	Scratch/Temp; calleR-save
;;;   FPSR:	Floating Point Status Register

;;; Float  values returned in D0-D7
;;; Scalar values returned in X0-X7; Struct Addr in X8 [NB!]
;;;
;;; Struct return space alloc'ed by Caller and address is passed in X8

;;; Alignment:
;;;   double-floats & 64-bit integers are 8-byte aligned in structs
;;;   double-floats & 64-bit integers are 8-byte aligned on the stack
;;;   stack must be 16-byte/quad-word aligned (SP mod 16 == 0)

;;; Addressing:
;;;  Where the PC is read by an instruction to compute a PC-relative address,
;;;   then its value is the address of THAT instruction. Unlike A32 and T32,
;;;   there is _NO_ implied offset of 4 or 8 bytes.

;;;  Any scalar 64-bit index register to be added to the 64-bit base register,
;;;   with optional scaling of the index by the access size.
;;;  Additionally, optional sign or zero-extension of a 32-bit value
;;;   within an index register, again with optional scaling.

;;; Scalar Registers
(define callee-save-regnames
  '(X0 X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15))
(define ipc-temp-regnames ;; never saved
  '(X16 X17)) ;; used in call veneers; temp between calls
;; X18 is reserved for platform use
(define caller-save-regnames
  '(X19 X20 X21 X22 X23 X24 X25 XX26 X27 X28))
(define special-regnames
  '(FP   ; Frame Pointer =X29
    LR   ; Link Register =X30
    SP   ; Stack Pointer =X31
    NZCV ; Flags
    ZXR) ; Zero Nota Bene: also =X31 !!
;; NB: PC register UNavailable on arch64; Use ADR/ADRP instructions
  )

(define scalar-regs-alist
  (cons '(XZR . 31)
        (alistify
         (list-append callee-save-regnames
                      ipc-temp-regnames
                      caller-save-regnames
                      '(FP LE SP))
         0))
)

(define regname->encoding
  (alist-assq scalar-regs-alist
              "unrecognized register name:"))

(define regnum regname->encoding)

;;; PC
;;;  The only instructions that read the PC are those whose function it is to compute a
;;; PC-relative address (ADR, ADRP, literal load, and direct branches), and the
;;; branch-and-link instructions that store a return address in the link register (BL and
;;; BLR). The only way to modify the program counter is using branch, exception
;;; generation and exception return instructions.
;;; Where the PC is read by an instruction to compute a PC-relative address, then its
;;; value is the address of _that_ instruction. Unlike A32 and T32, there is no implied
;;; offset of 4 or 8 bytes.

;;; Float Registers
(define float-regnames
  '(D0  D1  D2  D3  D4  D5  D6  D7  D8  D9
    D10 D11 D12 D13 D14 D15 D16 D17 D18 D19
    D20 D21 D22 D23 D24 D25 D26 D27 D28 D29
    D30 D31))

(define float-regs-alist
  (alistify float-regnames 0))

(define float-regname->encoding
  (alist-assq float-regs-alist
              "unrecognized register name:"))

(define fregnum float-regname->encoding)

;; ========================================================== ;;
;;; INSTRUCTION ENCODINGS

(define condition-code-alist
  ;; Negative Zero Carry oVerflow = NZCV
  '( [EQ . #b0000] ; Z=1 Equal
     [NE . #b0001] ; Z=0 Not Equal
     [CS . #b0010] ; C=1 Carry Set
     [HS . #b0010] ; Higher or Same == CS
     [CC . #b0011] ; C=0 Carry Clear
     [LO . #b0011] ; Unsigned Less Than == CC
     [MI . #b0100] ; N=1 Minus/Negative
     [PL . #b0101] ; N=0 Plus or Zero
     [VS . #b0110] ; V=1 Signed oVerflow
     [VC . #b0111] ; V=0 No Signed oVerflow
     [HI . #b1000] ; C=1 && Z=0 Greater Than
     [LS . #b1001] ; C=0 $$ Z=1 Less or Same/Equal
     [GE . #b1010] ; signed N=V  Greater or Equal
     [LT . #b1011] ; signed N!=V Less Than
     [GT . #b1100] ; signed Z=0 && N!=V  Greater Than
     [LE . #b1101] ; signed Z=1 && N!=V Less than or Equal
     [AL . #b1110] ; ALways [NZCV ignored]
;;   [NV . #b1111] ; ALways -- NB: wacky alias !!
) )

(define ccname->encoding
  (alist-assq condition-code-alist
              "unrecognized condition code:"))

(define encoding->ccname
  (alist-rassq condition-code-alist
              "unrecognized condition code:"))

(define ccnum ccname->encoding)

(define cc-invert-alist
  ;; Negative Zero Carry oVerflow = NZCV
  '( [EQ . NE]
     [NE . EQ]
     [CS . CC]
     [HS . CC]
     [CC . CS]
     [LO . CS]
     [MI . PL]
     [PL . MI]
     [VS . VC]
     [VC . VS]
     [HI . LS]
     [LS . HI]
     [GE . LT]
     [LT . GE]
     [GT . LE]
     [LE . GT]
) )

(define cc-invert
  (alist-assq cc-invert-alist
              "No invert for Condition:"))


(define shift-type-alist
  '( [LSL . #b00]
     [LSR . #b01]
     [ASR . #b10]
     [ROR . #b11]
) )

(define shift-typenum
  (alist-assq shift-type-alist
             "Unrecognized shift type [LSL|LSR|ASR|ROR]:"))

;; ========================================================== ;;
;;; Opcode Bits [28..25]  x => specified elsewhere
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;     100x - Data Processing -- Immediate
;;     101x - Branches, Exception, System
;;     x1x0 - Loads & Stores
;;     x101 - Data Processing -- Register
;;     x111 - Data Processing -- SIMD/Floating Point


;; ========================================================== ;;
;;; INTEGER OPERATIONS

;;; Integer Data Processing, Immediate
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;     100
;;        00x -- PC-relative
;;        010 -- Add/Sub Immediate
;;        011 -- Add/Sub Immedite+Tag
;;        100 -- Logical Immediate
;;        101 -- Move Wide Immediate
;;        110 -- Bitfield
;;        111 -- Extract


;;; PC-relative ADdress to Register [ADR/ADRPaged]
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 0im10000immed-high---------Rdest	ADR  (+/- 1MB)
;; PC + (signed) immed-hi:im to Rdest ;; NB: relative to THIS instruction
;;; 1im10000immed-high---------Rdest	ADRP (+/- 4GB)
;; (PC + ((signed) immed-hi:im << 12)) & ~#xfff to Rdest [4K Page selection (think BIBOP)]

(define (ADR rdest immed19offset)
  (gather-bits
;  [#b0                           31]
   [(logand #b11   immed19offset) 29] ;; lower 2 bits
   [#b10000                       24] ;; opcode
   [(logand #x7fffc immed19offset) 3] ;; upper 17 bits
   [(regnum rdest)                 0]))

(define (ADRP rdest immed19offset)
  (gather-bits
   [#b1                           31]
   [(logand #b11   immed19offset) 29] ;; lower 2 bits
   [#b10000                       24] ;; opcode
   [(logand #x7fffc immed19offset) 3] ;; upper 17 bits
   [(regnum rdest)    0]))

;;; ADD/SUB Immediate
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; sOS100010s----Imm12---RnnnnRdest
;;  0 = 32 bit
;;  1 = 64 bit
;;   0 = ADD
;;   1 = SUB
;;    0 = Don't set Condition Codes
;;    1 = Set CCs
;;           s = Logical Shift Left (LSL) 0=>0, 1=>12
;; Alias: MOV to/from SP when shift=0, imm12=0, Rd|Rn = #b11111

(define (ADDi rdest rsrc imm12 left-shift12?)
  (gather-bits
   [#b100100010            23]
   [(if left-shift12? 1 0) 22]
   [immed12                11]
   [(regnum rsrc)           5]
   [(regnum rdest)          0]))

(define (ADDiCC rdest rsrc imm12 left-shift12?)
  (gather-bits
   [#b101100010            23]
   [(if left-shift12? 1 0) 22]
   [immed12                11]
   [(regnum rsrc)           5]
   [(regnum rdest)          0]))

(define (SUBi rdest rsrc imm12 left-shift12?)
  (gather-bits
   [#b110100010            23]
   [(if left-shift12? 1 0) 22]
   [immed12                11]
   [(regnum rsrc)           5]
   [(regnum rdest)          0]))

(define (SUBiCC rdest rsrc imm12 left-shift12?)
  (gather-bits
   [#b111100010            23]
   [(if left-shift12? 1 0) 22]
   [immed12                11]
   [(regnum rsrc)           5]
   [(regnum rdest)          0]))

;;; Move Wide Immediate [MOV*]
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 1op100101sh-----imm16------Rdest
;;   00 MOVN -- MOVe-Not -- like MOVZ but invert imm16
;;   10 MOVZ -- MOVe & Zero other bits
;;   11 MOVK -- MOVe & Keep other bits
;;           00 -- imm16 LSL 0
;;           01 -- imm16 LSL 16
;;           10 -- imm16 LSL 32
;;           11 -- imm16 LSL 48

(define (MOVN rdest immed16 shift-amt)
  (when (shift-amt > #b11)
    (error "MOVN can only shift 0/16/32/48 => 2 bits" shift-amt))
  (gather-bits
   [#b100100101   24]
   [shift-amt     21]
   [immed16        5]
   [(regnum rdest) 0]))

(define (MOVZ rdest immed16 shift-amt)
  (when (shift-amt > #b11)
    (error "MOVZ can only shift 0/16/32/48 => 2 bits" shift-amt))
  (gather-bits
   [#b110100101   24]
   [shift-amt     21]
   [immed16        5]
   [(regnum rdest) 0]))

(define (MOVK rdest immed16 shift-amt)
  (when (shift-amt > #b11)
    (error "MOVK can only shift 0/16/32/48 => 2 bits" shift-amt))
  (gather-bits
   [#b111100101   24]
   [shift-amt     21]
   [immed16        5]
   [(regnum rdest) 0]))

;;; Logical Immediate
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; sop1001000---Imm12----Rsrc-Rdest
;;  0 = 32 bit
;;  1 = 64 bit
;;   00 = AND
;;   01 = ORR  (Inclusive OR)
;;   10 = EOR  (Excusive OR)
;;   11 = ANDS (S => Set CCs) [Alias: TST (immediate) when Rdest is ZR=#b11111]

(define (ANDi rdest rsrc imm12)
  (gather-bits
   [#b1001001000  22]
   [imm12         10]
   [(regnum rsrc)  5]
   [(regnum rdest) 0]))

(define (ANDiCC rdest rsrc imm12) ;; ANDS
  (gather-bits
   [#b1111001000  22]
   [imm12         10]
   [(regnum rsrc)  5]
   [(regnum rdest) 0]))

(define (ORRi rdest rsrc imm12) ;; ior
  (gather-bits
   [#b1011001000   22]
   [imm12          10]
   [(regnum rsrc)   5]
   [(regnum rdest)  0]))

(define IORi ORRi)

(define (EORi rdest rsrc imm12) ;; xor
  (gather-bits
   [#b1101001000  22]
   [imm12         10]
   [(regnum rsrc)  5]
   [(regnum rdest) 0]))

(define XORi EORi)

;;; Logical Shifted Register
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; sop01010shNRmmmm-Imm6-Rsrc-Rdest
;;  0 = 32 bit
;;  1 = 64 bit
;;          00 - LSL
;;          01 - LSR
;;          10 - ASR
;;          11 - ROR
;;   00       0 - AND
;;   00       1 - BIC
;;   01       0 - ORR
;;   01       1 - ORN
;;   10       0 - EOR
;;   10       1 - EON
;;   11       0 - ANDS
;;   11       1 - BICS
;; -Imm6- is shift amount
;;; Move Register is alias of shifted ORR w XZR
;;; sop01010shNRmmmmmImm6-Rsrc-Rdest
;;  10101010000Rmmmmm0000011111Rdest - Move (Register)

(define (AND rdest ra rb imm6 shift-amt)
  (gather-bits
   [#b10001010    24]
   [shift-amt     22]
   [#b0           21]
   [(regnum ra)   16]
   [imm6          10]
   [(regnum rb)    5]
   [(regnum rdest) 0]))

(define (ANDCC rdest ra rb imm6 shift-amt)
  (gather-bits
   [#b11101010    24]
   [shift-amt     22]
   [#b0           21]
   [(regnum ra)   16]
   [imm6          10]
   [(regnum rb)    5]
   [(regnum rdest) 0]))

(define (BIC rdest ra rb imm6 shift-amt)
  (gather-bits
   [#b10001010    24]
   [shift-amt     22]
   [#b1           21]
   [(regnum ra)   16]
   [imm6          10]
   [(regnum rb)    5]
   [(regnum rdest) 0]))

(define (BICCC rdest ra rb imm6 shift-amt)
  (gather-bits
   [#b11101010    24]
   [shift-amt     22]
   [#b1           21]
   [(regnum ra)   16]
   [imm6          10]
   [(regnum rb)    5]
   [(regnum rdest) 0]))

(define (ORR rdest ra rb imm6 shift-amt)
  (gather-bits
   [#b10101010    24]
   [shift-amt     22]
   [#b0           21]
   [(regnum ra)   16]
   [imm6          10]
   [(regnum rb)    5]
   [(regnum rdest) 0]))

(define IOR ORR)

(define (ORN rdest ra rb imm6 shift-amt)
  (gather-bits
   [#b10101010    24]
   [shift-amt     22]
   [#b1           21]
   [(regnum ra)   16]
   [imm6          10]
   [(regnum rb)    5]
   [(regnum rdest) 0]))

(define IOR-not ORN)

(define (EOR rdest ra rb imm6 shift-amt)
  (gather-bits
   [#b11001010    24]
   [shift-amt     22]
   [#b0           21]
   [(regnum ra)   16]
   [imm6          10]
   [(regnum rb)    5]
   [(regnum rdest) 0]))

(define XOR EOR)

(define (EON rdest ra rb imm6 shift-amt)
  (gather-bits
   [#b11001010    24]
   [shift-amt     22]
   [#b1           21]
   [(regnum ra)   16]
   [imm6          10]
   [(regnum rb)    5]
   [(regnum rdest) 0]))

(define XOR-not EON)

(define (MOV rdest rsrc)
  ;; (ORR rdest rsrc 'XZR 0 0)
  (gather-bits
   [#b10101010000 21]
   [(regnum rsrc) 16]
   [#b11111        5] ;; (regnum 'XZR)
   [(regnum rdest) 0]))


;;; Bitfield Move Immediate [*BFM]
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; sop100110NImmR--ImmS--Rsrc-Rdest
;;  0        0 = 32 bit
;;  1        1 = 64 bit
;;   00 = SBFM Signed (=>sign extend; lower bits to Zero) [Also alias for ASR]
;;   01 =  BFM keep other bits  [Alias: BFInsert; BFClear when Rsrc is ZR=#b1111]]
;;   11 = UBFM Unsigned (upper & lower bits to Zero)
;; BFM can
;;   [A] can copy a span of bits from an offset in Rsrc to bit0 in Rdest.   [SourceOffset]
;;or [B] can copy a span of bits from bit0 of Rsrc into an offset in Rdest. [DestOffset]
;; if ImmS >= ImmR then copy (ImmS-ImmR+1) bits starting at SourceOffset ImmR in Rsrc to bit0 in Rdest. [A]
;; else copy (ImmS+1) bits from bit0 in Rsrc to DestOffset (RegSize-ImmR) in Rdest. [B]
;; [A] => immS = Span+R-1 ; immR = SourceOffset
;; [B] => immS = Span+1   ; immR = RegSize-DestOffset (RegSize is 64 or 32)

;NB: **Little Endian**
;"BFM  W1, WZR, #3, #4" Encodes as:
;	ARM64 GDB/LLDB - 330313E1
; But in memory shows as (bytes reversed!):
;	ARM64 HEX - E1130333
; e.g. objdump -d foo.o -> shows in HEX (byte reversed) order

;; Note other Bitfield ops:
;;	CLZ   - Count Leading Zeros
;;	RBIT  - Reverse all BITs in a register
;;	REV   - REVerse the order of bytes in a register
;;	REV16 - REVerse the byte order in each Halfword
;;	REV32 - REVerse the byte order in each Word
;; All but REV32 can operate on Word [Wn] or Double [Xn] registers, except REV32 (Xn only)


;;; Extract Immediate  [EXTR]
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; s00100111N0Rmmmm-Imm6-RnnnnRdest
;;  0        0 = 32 bit
;;  1        1 = 64 bit
;; Extract a register from a pair of registers
;;   Rn:Rm
;; Imm6 is least significant bit position to extract from
;; [Alias: ROR when Rn=Rm, then Imm6 is called 'shift']


;;; Conditional Branch Immediate [B.cond]
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 01010100-----Imm19---------0Cond
;; Cond is one of the Condition Codes (encoded as above)
;; Immed19 is relative to the address of THIS instruction, in the range ±1MB.

(define (BCOND imm19 cond-sym)
  ;; e.g. B.eq -> (BCOND 64 'EQ) -> if Z=1, PC := PC+64
  (gather-bits
   [#b01010100      24]
   [imm19            5]
;  [#b0              4] ; defaults to zero
   [(ccnum cond-sym) 0]))

;;; Note on Conditional Branch range
;;   B.cond:    +/-  1 MB
;;   CBZ, CBNZ: +/-  1 MB
;;   TBZ, TBNZ: +/- 32 KB
;;
;; Unconditional Branch [B, BL] is +/- 128MB
;; BR, BLR range is unconstrained

;; CoMPare register values and set CCs
(define (CMP ra rb shift-type shift-amt)
  (SUBSr 'XZR ra rb shift-type shift-amt))

;;; Conditional Compare
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; sOS11010010imm5-Cond10Rnnnn0NZCV  (Immediate)
;;; sOS11010010RmmmmCond00Rnnnn0NZCV  (Register)
;;  0 - 32 bit
;;  1 - 64 bit
;;   01 - CCMN
;;   11 - CCMP
;; Compare Rn with Rm/Imm5 and set CCs

(define (CCMNi reg imm5 cond-sym flags)
  (gather-bits
   [#b10111010010    21]
   [imm5             16]
   [(ccnum cond-sym) 12]
   [#b10             10]
   [(regnum reg)      5]
   [flags             0]))

(define (CCMN ra rb cond-sym flags)
  (gather-bits
   [#b10111010010    21]
   [(regnum ra)      16]
   [(ccnum cond-sym) 12]
   [#b00             10]
   [(regnum rb)       5]
   [flags             0]))

(define (CCMPi reg imm5 cond-sym flags)
  (gather-bits
   [#b11111010010    21]
   [imm5             16]
   [(ccnum cond-sym) 12]
   [#b10             10]
   [(regnum reg)      5]
   [flags             0]))

(define (CCMP ra rb cond-sym flags)
  (gather-bits
   [#b11111010010    21]
   [(regnum ra)      16]
   [(ccnum cond-sym) 12]
;  [#b00             10]
   [(regnum rb)       5]
   [flags             0]))

;;; Conditional Select
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; so011010100RelseCondOpRthenRdest
;;  0 - 32 bit
;;  1 - 64 bit
;;   0                  00 - CSEL
;;   0                  01 - CINC/CSINC
;;   1                  00 - CINV/CSINV
;;   1                  01 - CNEG/CSNEG
;; If Cond(ition) in CC holds,
;;   RDest gets Rn else Rm; as-is/incremented/inverted/negated

(define (CSEL rdest rthen relse cond-sym)
  (gather-bits
   [#b10011010100    21]
   [(regnum relse)   16]
   [(ccnum cond-sym) 12]
;  [#b00             10]
   [(regnum rthen)    5]
   [(regnum rdest)    0]))

(define (CSINC rdest rthen relse cond-sym)
  (gather-bits
   [#b10011010100    21]
   [(regnum relse)   16]
   [(ccnum cond-sym) 12]
   [#b01             10]
   [(regnum rthen)    5]
   [(regnum rdest)    0]))

(define (CSINV rdest rthen relse cond-sym)
  (gather-bits
   [#b11011010100    21]
   [(regnum relse)   16]
   [(ccnum cond-sym) 12]
;  [#b00             10]
   [(regnum rthen)    5]
   [(regnum rdest)    0]))

(define (CSNEG rdest rthen relse cond-sym)
  (gather-bits
   [#b11011010100    21]
   [(regnum relse)   16]
   [(ccnum cond-sym) 12]
   [#b01             10]
   [(regnum rthen)    5]
   [(regnum rdest)    0]))

(define (CSET rdest cond-sym)
  (CSINC rdest 'XZR 'XZR (cc-invert cond-sym)))

(define (CSETM rdest cond-sym)
  (CSINV rdest 'XZR 'XZR (cc-invert cond-sym)))

(define (CINC rdest rsrc cond-sym)
  (CSINC rdest rsrc rsrc (cc-invert cond-sym)))

(define (CINV rdest rsrc cond-sym)
  (CSINV rdest rsrc rsrc (cc-invert cond-sym)))

(define (CNEG rdest rsrc cond-sym)
  (CSNEG rdest rsrc rsrc (cc-invert cond-sym)))


;;; No-Operation [NOP]
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 11010101000000110010000000011111
;; ; Takes up space..
(define NOOP #b11010101000000110010000000011111)

;;; System Register Move
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 1101010100L1OOp1CRn-CRm-Op2Rtttt
;;            0 - MSR Move to System   from Register
;;            1 - MRS Move to Register from System
;; E.g.
;; MRS X0, CNTFRQ_EL0 -- Get Timer Frequency [Hz]
;; MRS X0, CNTVCT_EL0 -- Get Timer value     [count]


;;; Unconditional Branch (Register) [BR]
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 1101011opc-11111000000Rnnnn00000
;;         0000 - BR  Branch to address in Register
;;         0001 - BLR Branch w Link to Reg addr
;;         0010 - RET RETurn through Link Register

;;; Compare and Branch (Immediate)
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; s011010o-----Imm19---------Rtttt
;;  0 - 32 bit
;;  1 - 64 bit
;;         0 - CBZ  Compare and Branch if Zero
;;         1 - CBNZ Compare and Branch if Non-Zero
;; Range +/- 1 MB


;;; Test and Branch Zero (Immediate)
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; x011011oBitPo---Immed14----Rtttt
;;         0 - TBZ   Branch if test bit is Zero
;;         1 - TBNZ  Branch if test bit is Not-Zero
;;          BitPos: 6 bits (x:BitPo) -> Bit # To Test (0..63)
;;  Immed14 -- relative branch
;;; Note: Does NOT set/change Condition Flags
;; Range: +/- 32 KB


;;; Unconditional Branch (Immediate)
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; o00101---Immed26----------------
;;  0 - B
;;  1 - BL
;; Range is +/- 128 MB


;;; Unconditional Branch (Register)
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 1101011Opc-Op2--Op3---RnnnnOp4--
;;         000011111000000     00000 - BR
;;         000111111000000     00000 - BLR
;;         001011111000000     00000 - RET
;;         0100111110000001111100000 - ERET ExceptionRET
;;         0101111110000001111100000 - DRPS DebugReturn


;;; Load Register (Literal)
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; op011v00---Imm19-----------Rdest
;;  00   0 - LDR (literal)           32 bit (unsigned)
;;  00   1 - LDR (literal, SIMD/FP)  32 bit
;;  01   0 - LDR (literal)           64 bit
;;  01   1 - LDR (literal, SIMD/FP)  64 bit
;;  10   0 - LDRSW (literal) Signed Word (sign extend 32 bits)
;;  10   1 - LDR (literal, SIMD/FP) 128 bit

;; Note also: LDRB -- LoaD Regsiter Byte (next)


;;; Load/Store Register
;; ; 3    __   2        _1         0
;; ;10987654321098765432109876543210
;;; sz111vT1op0-Immed9--T2RnnnnRdest
;;        00            01  Immediate, Post-Indexed
;;        00            11  Immediate, PRE-Indexed
;;        00            00  Unscaled immediate offset
;;; sz111v00op1RmmmmXXXS10RnnnnRdest
;;        00            10  Register Offset
;;; sz111v01op--Immed12---RnnnnRdest
;;        01            xx  UnSigned Immediate Offset
;;  00   0  00 - STRB 
;;  00   0  01 - LDRB 
;;  00   0  10 - LDRSB             64 bit
;;  00   0  11 - LDRSB             32 bit
;;  00   1  00 - STR   (SIMD/FP)    8 bit 
;;  00   1  01 - LDR   (SIMD/FP)    8 bit 
;;  00   1  10 - STR   (SIMD/FP)  128 bit 
;;  00   1  11 - LDR   (SIMD/FP)  128 bit
;;  01   0  00 - STRH
;;  01   0  01 - LDRH
;;  01   0  10 - LDRSH             64 bit
;;  01   0  11 - LDRSH             32 bit
;;  01   1  00 - STR   (SIMD/FP)   16 bit 
;;  01   1  01 - LDR   (SIMD/FP)   16 bit 
;;  10   0  00 - STR               32 bit
;;  10   0  01 - LDR               32 bit
;;  10   0  10 - LDRSW  
;;  10   1  00 - STR   (SIMD/FP)   32 bit
;;  10   1  01 - LDR   (SIMD/FP)   32 bit
;;  11   0  00 - STR               64 bit
;;  11   0  01 - LDR               64 bit
;;  11   1  00 - STR   (SIMD/FP)   64 bit
;;  11   1  01 - LDR   (SIMD/FP)   64 bit


;;;  Load/Store Register Pair
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; op101VxxxL-Imm7--Rt2--RnnnnRt1--
;;        001  Post-Indexed
;;        010  Offset
;;        011  PRE-Indexed
;;  00   0   0 - STP               32 bit
;;  00   0   1 - LDP               32 bit
;;  00   1   0 - STP (SIMD/FP)     32 bit
;;  00   1   1 - LTP (SIMD/FP)     32 bit
;;  01   0   1 - LDPSW
;;  01   1   0 - STP (SIMD/FP)     64 bit
;;  01   1   1 - LTP (SIMD/FP)     64 bit
;;  10   0   0 - STP               64 bit
;;  10   0   1 - LTP               64 bit
;;  10   1   0 - STP (SIMD/FP)    128 bit
;;  10   1   1 - LTP (SIMD/FP)    128 bit


;;; Integer Data Processing (Register) -- Extend
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; skk01011001RmmmmOptLsfRnnnnRdest (Extended Register)
;;                     Lsf (Left Shift 0..3)
;;                  000 - UXTB 
;;                  001 - UXTH
;;                  010 - UXTW
;;                  011 - UXTX (LSL if Rn is ZR)
;;                  100 - SXTB
;;                  101 - SXTH
;;                  110 - SXTW
;;                  111 - SXT
;; ;10987654321098765432109876543210
;;; skk01011sh0Rmmmm-Imm6-RnnnnRdest (Shifted Register)
;;; skkk11010000Rmmmm00000RnnnnRdest (with Carry)
;;  0 - 32 bit
;;  1 - 64 bit
;;   00         ADD  
;;   01         ADDS 
;;   10         SUB  
;;   11         SUBS

;; ADD shifted register
(define (ADDr rdest ra rb shift-type shift-amt)
  (gather-bits
   [#b1           31]
;  [#b00          29]
   [#b01011       24]
   [(shift-typenum shift-type) 22]
;  [#b0           21]
   [(regnum ra)   16]
   [shift-amt     10]
   [(regnum rb)    5]
   [(regnum rdest) 0]))

(define (ADDSr rdest ra rb shift-type shift-amt)
  (gather-bits
   [#b1           31]
   [#b01          29]
   [#b01011       24]
   [(shift-typenum shift-type) 22]
;  [#b0           21]
   [(regnum ra)   16]
   [shift-amt     10]
   [(regnum rb)    5]
   [(regnum rdest) 0]))

;; SUBtract shifted register
(define (SUBr rdest ra rb shift-type shift-amt)
  (gather-bits
   [#b1           31]
   [#b10          29]
   [#b01011       24]
   [(shift-typenum shift-type) 22]
;  [#b0           21]
   [(regnum ra)   16]
   [shift-amt     10]
   [(regnum rb)    5]
   [(regnum rdest) 0]))

(define (SUBSr rdest ra rb shift-type shift-amt)
  (gather-bits
   [#b1           31]
   [#b11          29]
   [#b01011       24]
   [(shift-typenum shift-type) 22]
;  [#b0           21]
   [(regnum ra)   16]
   [shift-amt     10]
   [(regnum rb)    5]
   [(regnum rdest) 0]))


;;; Invert Carry Flag  CFINV
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 11010101000000000100000000011111


;;; Integer Data Processing (1 source)
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; s101101011000000opcodeRnnnnRdest
;;  0 - 32 bit
;;  1 - 64 bit
;;                  000000 - RBIT  Reverse BIT Order
;;                  000001 - REV16 Reverse Bytes in Register HalfWords
;;                  000010 - REV32 Reverse Bytes in Register Words
;;                  000011 - REV   Reverse Bytes in Register [Alias: REV64 when 64 bit]
;;                  000100 - CLZ   Count Leading Zeros
;;                  000101 - CLS   Count Leading Sign Bits


;;;Integer Data Processing (2 source)
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; s0011010110RmmmmOpcodeRnnnnRdest
;;  0 - 32 bit
;;  1 - 64 bit
;; Divide returns quotient, rounded toward zero;
;;  remainder is (numerator - (quotient * denominator)), using MSUB
;; No indication of overflow if divide by zero (Rd <- 0)
;;  or if (most-negative-integer / -1) exceeds range (Rd <- most-neg-int)
;;                  000010 - UDIV  UnSigned Divide
;;                  000011 - SDIV  Signed Divide
;; Variable shifts: Rm holds shift amount
;;                  001000 - LSLV
;;                  001001 - LSRV
;;                  001010 - ASRV
;;                  001011 - RORV
;;  0               010000 - CRC32B
;;  0               010001 - CRC32H
;;  0               010010 - CRC32W
;;  0               010100 - CRC32CB
;;  0               010101 - CRC32CH
;;  0               010110 - CRC32CW
;;  1               010011 - CRC32X
;;  1               010111 - CRC32CX


;;;Integer Data Processing (3 source)
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; s0011011opcRmmmmORaaaaRnnnnRdest
;;  0       000     0 - MADD   32 bit  Wd = (Wm * Wn) + Wa
;;  0       000     1 - MSUB   32 bit  Wd = (Wm * Wn) - Ws
;;  1       000     0 - MADD   64 bit  Xd = (Xm * Xn) + Xa
;;  1       000     1 - MSUB   64 bit  Xd = (Xm * Xn) - Xs
;;  1       001     0 - SMADDL Xd = (Wm * Wn) + Xa
;;  1       001     1 - SMSUBL Xd = (Wm * Wn) - Xa
;;  1       010     0 - SMULH  Signed Multiply High (Xm * Xn) -> result bits 127:64 -> Xd
;;  1       101     0 - UMADDL
;;  1       101     1 - UMSUBL
;;  1       110     0 - UMULH  UnSigned Multiply High

;;
;;; FLOATING POINT et al.. OPERATIONS


;;; Floating-Point <--> Fixed-Point
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; s0011110pt0mdOpcScale-RnnnnRdest
;;  0 - 32 bit^
;;  1 - 64 bit
;;          00 00010 - SCVTF 
;;          00 00011 - UCVTF 
;;          00 11000 - FCVTZS
;;          00 11001 - FCVTZU
;;          01 00010 - SCVTF
;;          01 00011 - UCVTF
;;          01 11000 - FCVTZS
;;          01 11001 - FCVTZU
;;          11 00010 - SCVTF
;;          11 00011 - UCVTF
;;          11 11000 - FCVTZS
;;          11 11001 - FCVTZU


;;; Floating-Point <--> Integer
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; s0011110pt1mdOpc000000RnnnnRdest
;;  0 - 32 bit^
;;  1 - 64 bit
;;          00=Single Precision
;;          01=Double Precision
;;          11=Half   Precision
;;             00000 - FCVTNS
;;             00001 - FCVTNU
;;             00010 - SCVTF
;;             00011 - UCVTF
;;             00100 - FCVTAS
;;             00101 - FCVTAU
;;             00110 - FMOV
;;             00111 - FMOV
;;             01000 - FCVTPS
;;             01001 - FCVTPU
;;             10000 - FCVTMS
;;             10001 - FCVTMU
;;             11000 - FCVTZS
;;             11001 - FCVTZU


;;; Floating-Point Data Processing (1 source)
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 00011110pt1Opcode10000RnnnnRdest
;;            ^      ^
;;          00=Single Precision
;;          01=Double Precision
;;          11=Half   Precision
;;             000000 - FMOV
;;             000001 - FABS
;;             000010 - FNEG
;;             000011 - FSQRT
;;             000100 - FCVT
;;             000101 - FCVT
;;             001000 - FRINTN
;;             001001 - FRINTP
;;             001010 - FRINTM
;;             001011 - FRINTZ
;;             001100 - FRINTA
;;             001110 - FRINTX
;;             001111 - FRINTI


;;; Floating-Point Compare
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 00011110pt1Rmmmm001000RnnnnOpcod
;;            ^      ^
;;          00=Single Precision
;;          01=Double Precision
;;          11=Half   Precision
;;                             00000 - FCMP
;;                             01000 - FCMP
;;                             10000 - FCMPE
;;                             11000 - FCMPE


;;; Floating-Point Immediate: FMOV
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 00011110pt1imm8----100imm5-Rdest
;;          00=Single Precision
;;          01=Double Precision
;;          11=Half   Precision


;;; Floating-Point Conditional Compare
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 00011110pt1RmmmmCond01RnnnnoNZCV
;;          00=Single Precision
;;          01=Double Precision
;;          11=Half   Precision
;;                             0 - FCCMP
;;                             1 - FCCMPE
;; Sets CC flags
;; Note: Can generate floating point exceptions


;;; Floating-Point Data Processing (2 source)
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 000111110pt1RmmmOpcd10RnnnnRdest
;;          00=Single Precision
;;          01=Double Precision
;;          11=Half   Precision
;;                  0000 - FMUL
;;                  0001 - FDIV
;;                  0010 - FADD
;;                  0011 - FSUB
;;                  0100 - FMAX
;;                  0101 - FMIN
;;                  0110 - FMAXNM
;;                  0111 - FMINNM
;;                  1000 - FNMUL
;; Rdest = If Rn > Rm then Rn else Rm


;;; Floating-Point Conditional Select [FCSEL]
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 00011110pt1RmmmmCond11RnnnnRdest
;;          00=Single Precision
;;          01=Double Precision
;;          11=Half   Precision
;; Rdest = If Cond, then Rn else Rm
;; Note: Can generate floating point exceptions


;;; Floating-Point Data Processing (3 source)
;; ; 3         2         1         0
;; ;10987654321098765432109876543210
;;; 00011111ptXRmmmmoRaaaaRnnnnRdest
;;          00=Single Precision
;;          01=Double Precision
;;          11=Half   Precision
;;            0     0 - FMADD   Fdest = (Fm * Fn) + Fa
;;            0     1 - FMSUB   Fdest = (Fm * Fn) - Fa
;;            1     0 - FNMADD  Fdest = negate(Fm * Fn) + Fa
;;            1     1 - FNMSUB  Fdest = negate(Fm * Fn) - Fa
;; Note: Can generate floating point exceptions

;;
;;; SIMD



;; ========================================================== ;;
;;; ..WHATEVER..

;; ===========================E=O=F========================== ;;
