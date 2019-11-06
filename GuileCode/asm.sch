;;; Scheme "asm.sch" aarch64 assembler
;;;

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
        (loop (+ result (%place (caar lis) (cadar lis)))
              (cdr lis)))))

;; (->hex (%list-place '([1 2][3 4][#xff 16]))) --> "#xff0034"

(define-syntax gather-bits
  (syntax-rules ()
    ((gather-bits a-pair ...) (%list-place '(a-pair ...)))))

;; (->hex (gather-bits [1 2] [3 4] [#xff 16]))  --> "#xff0034"

;; ========================================================== ;;

;; ===========================E=O=F========================== ;;
