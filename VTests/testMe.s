	.arch armv8-a
	.file	"testMe.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.local	testPCB
	.comm	testPCB,464,8
	.align	2
	.global	stuffIt
	.type	stuffIt, %function
stuffIt:
.LFB2:
	.file 1 "testMe.c"
	.loc 1 13 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	.loc 1 14 0
	ldr	x0, [sp, 8]
	str	xzr, [x0]
	.loc 1 15 0
	ldr	x0, [sp, 8]
	mov	x1, 8
	str	x1, [x0, 8]
	.loc 1 16 0
	ldr	x0, [sp, 8]
	mov	x1, 16
	str	x1, [x0, 16]
	.loc 1 17 0
	ldr	x0, [sp, 8]
	mov	x1, 24
	str	x1, [x0, 24]
	.loc 1 18 0
	ldr	x0, [sp, 8]
	mov	x1, 32
	str	x1, [x0, 32]
	.loc 1 19 0
	mov	w0, 0
	.loc 1 20 0
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	stuffIt, .-stuffIt
	.section	.rodata
	.align	3
.LC0:
	.string	"\n** redline    is %ld"
	.align	3
.LC1:
	.string	"\n** frame_base is %ld"
	.align	3
.LC2:
	.string	"\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB3:
	.loc 1 22 0
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	.loc 1 23 0
	adrp	x0, testPCB
	add	x0, x0, :lo12:testPCB
	bl	stuffIt
	.loc 1 24 0
	adrp	x0, testPCB
	add	x0, x0, :lo12:testPCB
	ldr	x1, [x0, 8]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	.loc 1 25 0
	adrp	x0, testPCB
	add	x0, x0, :lo12:testPCB
	ldr	x1, [x0, 24]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	.loc 1 26 0
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	puts
	.loc 1 27 0
	mov	w0, 0
	.loc 1 28 0
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/lib/gcc/aarch64-linux-gnu/6/include/stddef.h"
	.file 3 "/usr/include/aarch64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/aarch64-linux-gnu/bits/sys_errlist.h"
	.file 7 "/usr/include/stdint.h"
	.file 8 "/usr/include/aarch64-linux-gnu/bits/time.h"
	.file 9 "/usr/include/unistd.h"
	.file 10 "/usr/include/getopt.h"
	.file 11 "/usr/include/netinet/in.h"
	.file 12 "/usr/include/aarch64-linux-gnu/sys/time.h"
	.file 13 "/home/kendi3he/Scheme/VicareScheme/src/internals.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x92d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF148
	.byte	0xc
	.4byte	.LASF149
	.4byte	.LASF150
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x2
	.byte	0xd8
	.4byte	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x3
	.byte	0x83
	.4byte	0x69
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x3
	.byte	0x84
	.4byte	0x69
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x3
	.byte	0x8b
	.4byte	0x69
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x3
	.byte	0x8d
	.4byte	0x69
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.4byte	0xab
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.uleb128 0x7
	.4byte	0xab
	.uleb128 0x8
	.4byte	.LASF43
	.byte	0xd8
	.byte	0x4
	.byte	0xf1
	.4byte	0x234
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x4
	.byte	0xf2
	.4byte	0x62
	.byte	0
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x4
	.byte	0xf7
	.4byte	0xa5
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x4
	.byte	0xf8
	.4byte	0xa5
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x4
	.byte	0xf9
	.4byte	0xa5
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x4
	.byte	0xfa
	.4byte	0xa5
	.byte	0x20
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x4
	.byte	0xfb
	.4byte	0xa5
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x4
	.byte	0xfc
	.4byte	0xa5
	.byte	0x30
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x4
	.byte	0xfd
	.4byte	0xa5
	.byte	0x38
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x4
	.byte	0xfe
	.4byte	0xa5
	.byte	0x40
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x100
	.4byte	0xa5
	.byte	0x48
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x101
	.4byte	0xa5
	.byte	0x50
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x102
	.4byte	0xa5
	.byte	0x58
	.uleb128 0xa
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x104
	.4byte	0x26c
	.byte	0x60
	.uleb128 0xa
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x106
	.4byte	0x272
	.byte	0x68
	.uleb128 0xa
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x108
	.4byte	0x62
	.byte	0x70
	.uleb128 0xa
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x10c
	.4byte	0x62
	.byte	0x74
	.uleb128 0xa
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x10e
	.4byte	0x70
	.byte	0x78
	.uleb128 0xa
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x112
	.4byte	0x46
	.byte	0x80
	.uleb128 0xa
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x113
	.4byte	0x54
	.byte	0x82
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x114
	.4byte	0x278
	.byte	0x83
	.uleb128 0xa
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x118
	.4byte	0x288
	.byte	0x88
	.uleb128 0xa
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x121
	.4byte	0x7b
	.byte	0x90
	.uleb128 0xa
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x129
	.4byte	0xa3
	.byte	0x98
	.uleb128 0xa
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x12a
	.4byte	0xa3
	.byte	0xa0
	.uleb128 0xa
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x12b
	.4byte	0xa3
	.byte	0xa8
	.uleb128 0xa
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x12c
	.4byte	0xa3
	.byte	0xb0
	.uleb128 0xa
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x12e
	.4byte	0x2d
	.byte	0xb8
	.uleb128 0xa
	.4byte	.LASF41
	.byte	0x4
	.2byte	0x12f
	.4byte	0x62
	.byte	0xc0
	.uleb128 0xa
	.4byte	.LASF42
	.byte	0x4
	.2byte	0x131
	.4byte	0x28e
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF151
	.byte	0x4
	.byte	0x96
	.uleb128 0x8
	.4byte	.LASF44
	.byte	0x18
	.byte	0x4
	.byte	0x9c
	.4byte	0x26c
	.uleb128 0x9
	.4byte	.LASF45
	.byte	0x4
	.byte	0x9d
	.4byte	0x26c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF46
	.byte	0x4
	.byte	0x9e
	.4byte	0x272
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF47
	.byte	0x4
	.byte	0xa2
	.4byte	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.4byte	0x23b
	.uleb128 0x6
	.byte	0x8
	.4byte	0xb7
	.uleb128 0xc
	.4byte	0xab
	.4byte	0x288
	.uleb128 0xd
	.4byte	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.4byte	0x234
	.uleb128 0xc
	.4byte	0xab
	.4byte	0x29e
	.uleb128 0xd
	.4byte	0x86
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.4byte	.LASF152
	.uleb128 0xf
	.4byte	.LASF48
	.byte	0x4
	.2byte	0x13b
	.4byte	0x29e
	.uleb128 0xf
	.4byte	.LASF49
	.byte	0x4
	.2byte	0x13c
	.4byte	0x29e
	.uleb128 0xf
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x13d
	.4byte	0x29e
	.uleb128 0x6
	.byte	0x8
	.4byte	0xb2
	.uleb128 0x7
	.4byte	0x2c7
	.uleb128 0x10
	.4byte	.LASF51
	.byte	0x5
	.byte	0xaa
	.4byte	0x272
	.uleb128 0x10
	.4byte	.LASF52
	.byte	0x5
	.byte	0xab
	.4byte	0x272
	.uleb128 0x10
	.4byte	.LASF53
	.byte	0x5
	.byte	0xac
	.4byte	0x272
	.uleb128 0x10
	.4byte	.LASF54
	.byte	0x6
	.byte	0x1a
	.4byte	0x62
	.uleb128 0xc
	.4byte	0x2cd
	.4byte	0x309
	.uleb128 0x11
	.byte	0
	.uleb128 0x7
	.4byte	0x2fe
	.uleb128 0x10
	.4byte	.LASF55
	.byte	0x6
	.byte	0x1b
	.4byte	0x309
	.uleb128 0x2
	.4byte	.LASF56
	.byte	0x7
	.byte	0x30
	.4byte	0x3f
	.uleb128 0x2
	.4byte	.LASF57
	.byte	0x7
	.byte	0x31
	.4byte	0x46
	.uleb128 0x2
	.4byte	.LASF58
	.byte	0x7
	.byte	0x33
	.4byte	0x4d
	.uleb128 0x2
	.4byte	.LASF59
	.byte	0x7
	.byte	0x37
	.4byte	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF60
	.uleb128 0x8
	.4byte	.LASF61
	.byte	0x10
	.byte	0x8
	.byte	0x1e
	.4byte	0x371
	.uleb128 0x9
	.4byte	.LASF62
	.byte	0x8
	.byte	0x20
	.4byte	0x8d
	.byte	0
	.uleb128 0x9
	.4byte	.LASF63
	.byte	0x8
	.byte	0x21
	.4byte	0x98
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF64
	.uleb128 0xf
	.4byte	.LASF65
	.byte	0x9
	.2byte	0x222
	.4byte	0x384
	.uleb128 0x6
	.byte	0x8
	.4byte	0xa5
	.uleb128 0x10
	.4byte	.LASF66
	.byte	0xa
	.byte	0x39
	.4byte	0xa5
	.uleb128 0x10
	.4byte	.LASF67
	.byte	0xa
	.byte	0x47
	.4byte	0x62
	.uleb128 0x10
	.4byte	.LASF68
	.byte	0xa
	.byte	0x4c
	.4byte	0x62
	.uleb128 0x10
	.4byte	.LASF69
	.byte	0xa
	.byte	0x50
	.4byte	0x62
	.uleb128 0x12
	.byte	0x10
	.byte	0xb
	.byte	0xd5
	.4byte	0x3e0
	.uleb128 0x13
	.4byte	.LASF70
	.byte	0xb
	.byte	0xd7
	.4byte	0x3e0
	.uleb128 0x13
	.4byte	.LASF71
	.byte	0xb
	.byte	0xd9
	.4byte	0x3f0
	.uleb128 0x13
	.4byte	.LASF72
	.byte	0xb
	.byte	0xda
	.4byte	0x400
	.byte	0
	.uleb128 0xc
	.4byte	0x319
	.4byte	0x3f0
	.uleb128 0xd
	.4byte	0x86
	.byte	0xf
	.byte	0
	.uleb128 0xc
	.4byte	0x324
	.4byte	0x400
	.uleb128 0xd
	.4byte	0x86
	.byte	0x7
	.byte	0
	.uleb128 0xc
	.4byte	0x32f
	.4byte	0x410
	.uleb128 0xd
	.4byte	0x86
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.4byte	.LASF73
	.byte	0x10
	.byte	0xb
	.byte	0xd3
	.4byte	0x429
	.uleb128 0x9
	.4byte	.LASF74
	.byte	0xb
	.byte	0xdc
	.4byte	0x3b6
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	0x410
	.uleb128 0x10
	.4byte	.LASF75
	.byte	0xb
	.byte	0xe5
	.4byte	0x429
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0xb
	.byte	0xe6
	.4byte	0x429
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.4byte	.LASF77
	.uleb128 0x8
	.4byte	.LASF78
	.byte	0x8
	.byte	0xc
	.byte	0x37
	.4byte	0x470
	.uleb128 0x9
	.4byte	.LASF79
	.byte	0xc
	.byte	0x39
	.4byte	0x62
	.byte	0
	.uleb128 0x9
	.4byte	.LASF80
	.byte	0xc
	.byte	0x3a
	.4byte	0x62
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.4byte	0x44b
	.uleb128 0x14
	.4byte	0x470
	.uleb128 0x15
	.4byte	.LASF81
	.byte	0xd
	.2byte	0x232
	.4byte	0x33a
	.uleb128 0x15
	.4byte	.LASF82
	.byte	0xd
	.2byte	0x234
	.4byte	0x33a
	.uleb128 0x16
	.4byte	.LASF83
	.byte	0x10
	.byte	0xd
	.2byte	0x23d
	.4byte	0x4bb
	.uleb128 0xa
	.4byte	.LASF84
	.byte	0xd
	.2byte	0x23e
	.4byte	0x47b
	.byte	0
	.uleb128 0xa
	.4byte	.LASF85
	.byte	0xd
	.2byte	0x23f
	.4byte	0x4bb
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.4byte	0x493
	.uleb128 0x15
	.4byte	.LASF83
	.byte	0xd
	.2byte	0x240
	.4byte	0x493
	.uleb128 0x16
	.4byte	.LASF86
	.byte	0x18
	.byte	0xd
	.2byte	0x244
	.4byte	0x502
	.uleb128 0xa
	.4byte	.LASF84
	.byte	0xd
	.2byte	0x245
	.4byte	0x47b
	.byte	0
	.uleb128 0xa
	.4byte	.LASF87
	.byte	0xd
	.2byte	0x246
	.4byte	0x62
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF85
	.byte	0xd
	.2byte	0x247
	.4byte	0x502
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.4byte	0x4cd
	.uleb128 0x15
	.4byte	.LASF86
	.byte	0xd
	.2byte	0x248
	.4byte	0x4cd
	.uleb128 0x16
	.4byte	.LASF88
	.byte	0x20
	.byte	0xd
	.2byte	0x24e
	.4byte	0x556
	.uleb128 0xa
	.4byte	.LASF89
	.byte	0xd
	.2byte	0x24f
	.4byte	0xa3
	.byte	0
	.uleb128 0xa
	.4byte	.LASF90
	.byte	0xd
	.2byte	0x250
	.4byte	0xa3
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF91
	.byte	0xd
	.2byte	0x251
	.4byte	0x47b
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF85
	.byte	0xd
	.2byte	0x252
	.4byte	0x556
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.4byte	0x514
	.uleb128 0x15
	.4byte	.LASF88
	.byte	0xd
	.2byte	0x253
	.4byte	0x514
	.uleb128 0x17
	.4byte	.LASF92
	.2byte	0x1000
	.byte	0xd
	.2byte	0x25c
	.4byte	0x59e
	.uleb128 0xa
	.4byte	.LASF93
	.byte	0xd
	.2byte	0x25d
	.4byte	0x487
	.byte	0
	.uleb128 0xa
	.4byte	.LASF85
	.byte	0xd
	.2byte	0x25e
	.4byte	0x59e
	.byte	0x8
	.uleb128 0x18
	.string	"ptr"
	.byte	0xd
	.2byte	0x25f
	.4byte	0x5a4
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.4byte	0x568
	.uleb128 0xc
	.4byte	0x47b
	.4byte	0x5b5
	.uleb128 0x19
	.4byte	0x86
	.2byte	0x1fd
	.byte	0
	.uleb128 0x15
	.4byte	.LASF92
	.byte	0xd
	.2byte	0x260
	.4byte	0x568
	.uleb128 0x17
	.4byte	.LASF94
	.2byte	0x1d0
	.byte	0xd
	.2byte	0x264
	.4byte	0x888
	.uleb128 0xa
	.4byte	.LASF95
	.byte	0xd
	.2byte	0x267
	.4byte	0x47b
	.byte	0
	.uleb128 0xa
	.4byte	.LASF96
	.byte	0xd
	.2byte	0x268
	.4byte	0x47b
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF97
	.byte	0xd
	.2byte	0x269
	.4byte	0x47b
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF98
	.byte	0xd
	.2byte	0x26a
	.4byte	0x47b
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF99
	.byte	0xd
	.2byte	0x26b
	.4byte	0x47b
	.byte	0x20
	.uleb128 0xa
	.4byte	.LASF100
	.byte	0xd
	.2byte	0x26c
	.4byte	0x47b
	.byte	0x28
	.uleb128 0xa
	.4byte	.LASF101
	.byte	0xd
	.2byte	0x26d
	.4byte	0x47b
	.byte	0x30
	.uleb128 0xa
	.4byte	.LASF102
	.byte	0xd
	.2byte	0x26e
	.4byte	0x47b
	.byte	0x38
	.uleb128 0xa
	.4byte	.LASF103
	.byte	0xd
	.2byte	0x26f
	.4byte	0x47b
	.byte	0x40
	.uleb128 0xa
	.4byte	.LASF104
	.byte	0xd
	.2byte	0x270
	.4byte	0x47b
	.byte	0x48
	.uleb128 0xa
	.4byte	.LASF105
	.byte	0xd
	.2byte	0x271
	.4byte	0x47b
	.byte	0x50
	.uleb128 0xa
	.4byte	.LASF106
	.byte	0xd
	.2byte	0x272
	.4byte	0x47b
	.byte	0x58
	.uleb128 0xa
	.4byte	.LASF107
	.byte	0xd
	.2byte	0x273
	.4byte	0x47b
	.byte	0x60
	.uleb128 0xa
	.4byte	.LASF108
	.byte	0xd
	.2byte	0x27e
	.4byte	0x888
	.byte	0x68
	.uleb128 0xa
	.4byte	.LASF109
	.byte	0xd
	.2byte	0x27f
	.4byte	0x888
	.byte	0x70
	.uleb128 0xa
	.4byte	.LASF110
	.byte	0xd
	.2byte	0x280
	.4byte	0x888
	.byte	0x78
	.uleb128 0xa
	.4byte	.LASF111
	.byte	0xd
	.2byte	0x281
	.4byte	0x888
	.byte	0x80
	.uleb128 0xa
	.4byte	.LASF112
	.byte	0xd
	.2byte	0x282
	.4byte	0x888
	.byte	0x88
	.uleb128 0xa
	.4byte	.LASF113
	.byte	0xd
	.2byte	0x283
	.4byte	0x888
	.byte	0x90
	.uleb128 0xa
	.4byte	.LASF114
	.byte	0xd
	.2byte	0x284
	.4byte	0x888
	.byte	0x98
	.uleb128 0xa
	.4byte	.LASF115
	.byte	0xd
	.2byte	0x285
	.4byte	0x888
	.byte	0xa0
	.uleb128 0xa
	.4byte	.LASF116
	.byte	0xd
	.2byte	0x286
	.4byte	0x888
	.byte	0xa8
	.uleb128 0xa
	.4byte	.LASF117
	.byte	0xd
	.2byte	0x287
	.4byte	0x888
	.byte	0xb0
	.uleb128 0xa
	.4byte	.LASF118
	.byte	0xd
	.2byte	0x28f
	.4byte	0x47b
	.byte	0xb8
	.uleb128 0xa
	.4byte	.LASF119
	.byte	0xd
	.2byte	0x290
	.4byte	0x47b
	.byte	0xc0
	.uleb128 0xa
	.4byte	.LASF120
	.byte	0xd
	.2byte	0x2a1
	.4byte	0x88e
	.byte	0xc8
	.uleb128 0xa
	.4byte	.LASF121
	.byte	0xd
	.2byte	0x2a2
	.4byte	0x88e
	.byte	0xd0
	.uleb128 0xa
	.4byte	.LASF122
	.byte	0xd
	.2byte	0x2b4
	.4byte	0x88e
	.byte	0xd8
	.uleb128 0xa
	.4byte	.LASF123
	.byte	0xd
	.2byte	0x2e6
	.4byte	0x47b
	.byte	0xe0
	.uleb128 0xa
	.4byte	.LASF124
	.byte	0xd
	.2byte	0x2e7
	.4byte	0x487
	.byte	0xe8
	.uleb128 0xa
	.4byte	.LASF125
	.byte	0xd
	.2byte	0x2e8
	.4byte	0x894
	.byte	0xf0
	.uleb128 0xa
	.4byte	.LASF126
	.byte	0xd
	.2byte	0x2ec
	.4byte	0x47b
	.byte	0xf8
	.uleb128 0x1a
	.4byte	.LASF127
	.byte	0xd
	.2byte	0x2ed
	.4byte	0x487
	.2byte	0x100
	.uleb128 0x1a
	.4byte	.LASF128
	.byte	0xd
	.2byte	0x31d
	.4byte	0x47b
	.2byte	0x108
	.uleb128 0x1a
	.4byte	.LASF129
	.byte	0xd
	.2byte	0x31e
	.4byte	0x62
	.2byte	0x110
	.uleb128 0x1a
	.4byte	.LASF130
	.byte	0xd
	.2byte	0x31f
	.4byte	0x89a
	.2byte	0x118
	.uleb128 0x1a
	.4byte	.LASF131
	.byte	0xd
	.2byte	0x320
	.4byte	0x89a
	.2byte	0x120
	.uleb128 0x1a
	.4byte	.LASF132
	.byte	0xd
	.2byte	0x323
	.4byte	0xa5
	.2byte	0x128
	.uleb128 0x1a
	.4byte	.LASF133
	.byte	0xd
	.2byte	0x328
	.4byte	0x8a0
	.2byte	0x130
	.uleb128 0x1a
	.4byte	.LASF134
	.byte	0xd
	.2byte	0x32c
	.4byte	0x62
	.2byte	0x138
	.uleb128 0x1a
	.4byte	.LASF135
	.byte	0xd
	.2byte	0x353
	.4byte	0x47b
	.2byte	0x140
	.uleb128 0x1a
	.4byte	.LASF136
	.byte	0xd
	.2byte	0x354
	.4byte	0x47b
	.2byte	0x148
	.uleb128 0x1a
	.4byte	.LASF137
	.byte	0xd
	.2byte	0x357
	.4byte	0x47b
	.2byte	0x150
	.uleb128 0x1a
	.4byte	.LASF138
	.byte	0xd
	.2byte	0x359
	.4byte	0x47b
	.2byte	0x158
	.uleb128 0x1a
	.4byte	.LASF139
	.byte	0xd
	.2byte	0x35f
	.4byte	0x8a6
	.2byte	0x160
	.uleb128 0x1a
	.4byte	.LASF140
	.byte	0xd
	.2byte	0x370
	.4byte	0x62
	.2byte	0x188
	.uleb128 0x1a
	.4byte	.LASF141
	.byte	0xd
	.2byte	0x37e
	.4byte	0x62
	.2byte	0x18c
	.uleb128 0x1a
	.4byte	.LASF142
	.byte	0xd
	.2byte	0x37f
	.4byte	0x62
	.2byte	0x190
	.uleb128 0x1a
	.4byte	.LASF143
	.byte	0xd
	.2byte	0x382
	.4byte	0x34c
	.2byte	0x198
	.uleb128 0x1a
	.4byte	.LASF144
	.byte	0xd
	.2byte	0x383
	.4byte	0x34c
	.2byte	0x1a8
	.uleb128 0x1a
	.4byte	.LASF145
	.byte	0xd
	.2byte	0x384
	.4byte	0x34c
	.2byte	0x1b8
	.uleb128 0x1a
	.4byte	.LASF146
	.byte	0xd
	.2byte	0x387
	.4byte	0xa3
	.2byte	0x1c8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.4byte	0x47b
	.uleb128 0x6
	.byte	0x8
	.4byte	0x32f
	.uleb128 0x6
	.byte	0x8
	.4byte	0x508
	.uleb128 0x6
	.byte	0x8
	.4byte	0x4c1
	.uleb128 0x6
	.byte	0x8
	.4byte	0x55c
	.uleb128 0xc
	.4byte	0x8b6
	.4byte	0x8b6
	.uleb128 0xd
	.4byte	0x86
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.4byte	0x5b5
	.uleb128 0xf
	.4byte	.LASF147
	.byte	0xd
	.2byte	0x85f
	.4byte	0x384
	.uleb128 0x1b
	.4byte	.LASF153
	.byte	0x1
	.byte	0xb
	.4byte	0x5c1
	.uleb128 0x9
	.byte	0x3
	.8byte	testPCB
	.uleb128 0x1c
	.4byte	.LASF154
	.byte	0x1
	.byte	0x16
	.4byte	0x62
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.4byte	.LASF155
	.byte	0x1
	.byte	0xc
	.4byte	0x62
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x92a
	.uleb128 0x1e
	.string	"pcb"
	.byte	0x1
	.byte	0xc
	.4byte	0x92a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.4byte	0x5c1
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"__off_t"
.LASF93:
	.string	"count"
.LASF15:
	.string	"_IO_read_ptr"
.LASF27:
	.string	"_chain"
.LASF123:
	.string	"heap_nursery_hot_block_base"
.LASF89:
	.string	"callable_pointer"
.LASF74:
	.string	"__in6_u"
.LASF7:
	.string	"size_t"
.LASF99:
	.string	"frame_redline"
.LASF33:
	.string	"_shortbuf"
.LASF50:
	.string	"_IO_2_1_stderr_"
.LASF21:
	.string	"_IO_buf_base"
.LASF136:
	.string	"weak_pairs_ep"
.LASF64:
	.string	"long long unsigned int"
.LASF100:
	.string	"next_k"
.LASF120:
	.string	"segment_vector_base"
.LASF85:
	.string	"next"
.LASF98:
	.string	"frame_base"
.LASF128:
	.string	"cached_pages_base"
.LASF60:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF155:
	.string	"stuffIt"
.LASF87:
	.string	"size"
.LASF148:
	.string	"GNU C11 6.3.0 20170516 -march=armv8-a -mlittle-endian -mabi=lp64 -g"
.LASF28:
	.string	"_fileno"
.LASF16:
	.string	"_IO_read_end"
.LASF90:
	.string	"closure"
.LASF71:
	.string	"__u6_addr16"
.LASF6:
	.string	"long int"
.LASF72:
	.string	"__u6_addr32"
.LASF14:
	.string	"_flags"
.LASF86:
	.string	"ikmemblock_t"
.LASF22:
	.string	"_IO_buf_end"
.LASF31:
	.string	"_cur_column"
.LASF144:
	.string	"collect_stime"
.LASF57:
	.string	"uint16_t"
.LASF19:
	.string	"_IO_write_ptr"
.LASF30:
	.string	"_old_offset"
.LASF35:
	.string	"_offset"
.LASF76:
	.string	"in6addr_loopback"
.LASF106:
	.string	"base_rtd"
.LASF103:
	.string	"arg_list"
.LASF141:
	.string	"allocation_count_minor"
.LASF78:
	.string	"timezone"
.LASF101:
	.string	"system_stack"
.LASF126:
	.string	"stack_base"
.LASF44:
	.string	"_IO_marker"
.LASF51:
	.string	"stdin"
.LASF3:
	.string	"unsigned int"
.LASF149:
	.string	"testMe.c"
.LASF82:
	.string	"ikuword_t"
.LASF69:
	.string	"optopt"
.LASF0:
	.string	"long unsigned int"
.LASF152:
	.string	"_IO_FILE_plus"
.LASF12:
	.string	"__suseconds_t"
.LASF137:
	.string	"symbol_table"
.LASF54:
	.string	"sys_nerr"
.LASF46:
	.string	"_sbuf"
.LASF91:
	.string	"data"
.LASF105:
	.string	"interrupted"
.LASF2:
	.string	"short unsigned int"
.LASF108:
	.string	"root0"
.LASF143:
	.string	"collect_utime"
.LASF23:
	.string	"_IO_save_base"
.LASF125:
	.string	"full_heap_nursery_segments"
.LASF147:
	.string	"environ"
.LASF133:
	.string	"callbacks"
.LASF119:
	.string	"memory_end"
.LASF34:
	.string	"_lock"
.LASF29:
	.string	"_flags2"
.LASF61:
	.string	"timeval"
.LASF83:
	.string	"ikpage_t"
.LASF52:
	.string	"stdout"
.LASF48:
	.string	"_IO_2_1_stdin_"
.LASF109:
	.string	"root1"
.LASF110:
	.string	"root2"
.LASF111:
	.string	"root3"
.LASF112:
	.string	"root4"
.LASF113:
	.string	"root5"
.LASF114:
	.string	"root6"
.LASF115:
	.string	"root7"
.LASF116:
	.string	"root8"
.LASF117:
	.string	"root9"
.LASF66:
	.string	"optarg"
.LASF10:
	.string	"sizetype"
.LASF67:
	.string	"optind"
.LASF20:
	.string	"_IO_write_end"
.LASF102:
	.string	"dirty_vector"
.LASF59:
	.string	"uint64_t"
.LASF139:
	.string	"protected_list"
.LASF151:
	.string	"_IO_lock_t"
.LASF75:
	.string	"in6addr_any"
.LASF43:
	.string	"_IO_FILE"
.LASF65:
	.string	"__environ"
.LASF134:
	.string	"last_errno"
.LASF47:
	.string	"_pos"
.LASF145:
	.string	"collect_rtime"
.LASF55:
	.string	"sys_errlist"
.LASF95:
	.string	"allocation_pointer"
.LASF153:
	.string	"testPCB"
.LASF124:
	.string	"heap_nursery_hot_block_size"
.LASF84:
	.string	"base"
.LASF92:
	.string	"ik_ptr_page_t"
.LASF1:
	.string	"unsigned char"
.LASF135:
	.string	"weak_pairs_ap"
.LASF5:
	.string	"short int"
.LASF62:
	.string	"tv_sec"
.LASF94:
	.string	"ikpcb_t"
.LASF32:
	.string	"_vtable_offset"
.LASF49:
	.string	"_IO_2_1_stdout_"
.LASF79:
	.string	"tz_minuteswest"
.LASF130:
	.string	"cached_pages"
.LASF26:
	.string	"_markers"
.LASF73:
	.string	"in6_addr"
.LASF118:
	.string	"memory_base"
.LASF63:
	.string	"tv_usec"
.LASF41:
	.string	"_mode"
.LASF129:
	.string	"cached_pages_size"
.LASF96:
	.string	"allocation_redline"
.LASF81:
	.string	"ikptr_t"
.LASF131:
	.string	"uncached_pages"
.LASF150:
	.string	"/home/kendi3he/arm64Test/VTests"
.LASF77:
	.string	"long double"
.LASF13:
	.string	"char"
.LASF140:
	.string	"collection_id"
.LASF70:
	.string	"__u6_addr8"
.LASF68:
	.string	"opterr"
.LASF146:
	.string	"not_to_be_collected"
.LASF45:
	.string	"_next"
.LASF9:
	.string	"__off64_t"
.LASF17:
	.string	"_IO_read_base"
.LASF25:
	.string	"_IO_save_end"
.LASF122:
	.string	"dirty_vector_base"
.LASF138:
	.string	"gensym_table"
.LASF36:
	.string	"__pad1"
.LASF37:
	.string	"__pad2"
.LASF38:
	.string	"__pad3"
.LASF39:
	.string	"__pad4"
.LASF40:
	.string	"__pad5"
.LASF11:
	.string	"__time_t"
.LASF42:
	.string	"_unused2"
.LASF53:
	.string	"stderr"
.LASF132:
	.string	"argv0"
.LASF104:
	.string	"engine_counter"
.LASF142:
	.string	"allocation_count_major"
.LASF80:
	.string	"tz_dsttime"
.LASF56:
	.string	"uint8_t"
.LASF24:
	.string	"_IO_backup_base"
.LASF97:
	.string	"frame_pointer"
.LASF88:
	.string	"ik_callback_locative_t"
.LASF127:
	.string	"stack_size"
.LASF121:
	.string	"segment_vector"
.LASF107:
	.string	"collect_key"
.LASF154:
	.string	"main"
.LASF18:
	.string	"_IO_write_base"
.LASF58:
	.string	"uint32_t"
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
