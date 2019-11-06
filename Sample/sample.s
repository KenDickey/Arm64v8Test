	.arch armv8-a
	.file	"sample.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.data
	.align	3
	.type	v, %object
	.size	v, 40
v:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.file 1 "sample.c"
	.loc 1 5 0
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	add	x29, sp, 0
	.cfi_def_cfa_register 29
	str	x19, [sp, 16]
	.cfi_offset 19, -64
	.loc 1 8 0
	str	wzr, [x29, 76]
	b	.L2
.L3:
	.loc 1 9 0 discriminator 3
	adrp	x0, v
	add	x0, x0, :lo12:v
	ldrsw	x1, [x29, 76]
	ldr	w19, [x0, x1, lsl 2]
	mov	w1, 5
	ldr	w0, [x29, 76]
	bl	add
	mul	w2, w19, w0
	ldrsw	x0, [x29, 76]
	lsl	x0, x0, 2
	add	x1, x29, 32
	str	w2, [x1, x0]
	.loc 1 8 0 discriminator 3
	ldr	w0, [x29, 76]
	add	w0, w0, 1
	str	w0, [x29, 76]
.L2:
	.loc 1 8 0 is_stmt 0 discriminator 1
	ldr	w0, [x29, 76]
	cmp	w0, 9
	ble	.L3
	.loc 1 10 0 is_stmt 1
	mov	w0, 0
	.loc 1 11 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.global	add
	.type	add, %function
add:
.LFB1:
	.loc 1 12 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]
	str	w1, [sp, 8]
	.loc 1 13 0
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 8]
	add	w0, w1, w0
	.loc 1 14 0
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	add, .-add
.Letext0:
	.file 2 "/usr/lib/gcc/aarch64-linux-gnu/6/include/stddef.h"
	.file 3 "/usr/include/aarch64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/aarch64-linux-gnu/bits/sys_errlist.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x395
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF55
	.byte	0xc
	.4byte	.LASF56
	.4byte	.LASF57
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
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.4byte	0x95
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.uleb128 0x7
	.4byte	0x95
	.uleb128 0x8
	.4byte	.LASF41
	.byte	0xd8
	.byte	0x4
	.byte	0xf1
	.4byte	0x21e
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x4
	.byte	0xf2
	.4byte	0x62
	.byte	0
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x4
	.byte	0xf7
	.4byte	0x8f
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x4
	.byte	0xf8
	.4byte	0x8f
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x4
	.byte	0xf9
	.4byte	0x8f
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x4
	.byte	0xfa
	.4byte	0x8f
	.byte	0x20
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x4
	.byte	0xfb
	.4byte	0x8f
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x4
	.byte	0xfc
	.4byte	0x8f
	.byte	0x30
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x4
	.byte	0xfd
	.4byte	0x8f
	.byte	0x38
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x4
	.byte	0xfe
	.4byte	0x8f
	.byte	0x40
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x100
	.4byte	0x8f
	.byte	0x48
	.uleb128 0xa
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x101
	.4byte	0x8f
	.byte	0x50
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x102
	.4byte	0x8f
	.byte	0x58
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x104
	.4byte	0x256
	.byte	0x60
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x106
	.4byte	0x25c
	.byte	0x68
	.uleb128 0xa
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x108
	.4byte	0x62
	.byte	0x70
	.uleb128 0xa
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x10c
	.4byte	0x62
	.byte	0x74
	.uleb128 0xa
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x10e
	.4byte	0x70
	.byte	0x78
	.uleb128 0xa
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x112
	.4byte	0x46
	.byte	0x80
	.uleb128 0xa
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x113
	.4byte	0x54
	.byte	0x82
	.uleb128 0xa
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x114
	.4byte	0x262
	.byte	0x83
	.uleb128 0xa
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x118
	.4byte	0x272
	.byte	0x88
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x121
	.4byte	0x7b
	.byte	0x90
	.uleb128 0xa
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x129
	.4byte	0x8d
	.byte	0x98
	.uleb128 0xa
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x12a
	.4byte	0x8d
	.byte	0xa0
	.uleb128 0xa
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x12b
	.4byte	0x8d
	.byte	0xa8
	.uleb128 0xa
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x12c
	.4byte	0x8d
	.byte	0xb0
	.uleb128 0xa
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x12e
	.4byte	0x2d
	.byte	0xb8
	.uleb128 0xa
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x12f
	.4byte	0x62
	.byte	0xc0
	.uleb128 0xa
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x131
	.4byte	0x278
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF58
	.byte	0x4
	.byte	0x96
	.uleb128 0x8
	.4byte	.LASF42
	.byte	0x18
	.byte	0x4
	.byte	0x9c
	.4byte	0x256
	.uleb128 0x9
	.4byte	.LASF43
	.byte	0x4
	.byte	0x9d
	.4byte	0x256
	.byte	0
	.uleb128 0x9
	.4byte	.LASF44
	.byte	0x4
	.byte	0x9e
	.4byte	0x25c
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF45
	.byte	0x4
	.byte	0xa2
	.4byte	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.4byte	0x225
	.uleb128 0x6
	.byte	0x8
	.4byte	0xa1
	.uleb128 0xc
	.4byte	0x95
	.4byte	0x272
	.uleb128 0xd
	.4byte	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.4byte	0x21e
	.uleb128 0xc
	.4byte	0x95
	.4byte	0x288
	.uleb128 0xd
	.4byte	0x86
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.4byte	.LASF59
	.uleb128 0xf
	.4byte	.LASF46
	.byte	0x4
	.2byte	0x13b
	.4byte	0x288
	.uleb128 0xf
	.4byte	.LASF47
	.byte	0x4
	.2byte	0x13c
	.4byte	0x288
	.uleb128 0xf
	.4byte	.LASF48
	.byte	0x4
	.2byte	0x13d
	.4byte	0x288
	.uleb128 0x6
	.byte	0x8
	.4byte	0x9c
	.uleb128 0x7
	.4byte	0x2b1
	.uleb128 0x10
	.4byte	.LASF49
	.byte	0x5
	.byte	0xaa
	.4byte	0x25c
	.uleb128 0x10
	.4byte	.LASF50
	.byte	0x5
	.byte	0xab
	.4byte	0x25c
	.uleb128 0x10
	.4byte	.LASF51
	.byte	0x5
	.byte	0xac
	.4byte	0x25c
	.uleb128 0x10
	.4byte	.LASF52
	.byte	0x6
	.byte	0x1a
	.4byte	0x62
	.uleb128 0xc
	.4byte	0x2b7
	.4byte	0x2f3
	.uleb128 0x11
	.byte	0
	.uleb128 0x7
	.4byte	0x2e8
	.uleb128 0x10
	.4byte	.LASF53
	.byte	0x6
	.byte	0x1b
	.4byte	0x2f3
	.uleb128 0xc
	.4byte	0x62
	.4byte	0x313
	.uleb128 0xd
	.4byte	0x86
	.byte	0x9
	.byte	0
	.uleb128 0x12
	.string	"v"
	.byte	0x1
	.byte	0x2
	.4byte	0x303
	.uleb128 0x9
	.byte	0x3
	.8byte	v
	.uleb128 0x13
	.string	"add"
	.byte	0x1
	.byte	0xc
	.4byte	0x62
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x360
	.uleb128 0x14
	.string	"v"
	.byte	0x1
	.byte	0xc
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x14
	.string	"t"
	.byte	0x1
	.byte	0xc
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x15
	.4byte	.LASF60
	.byte	0x1
	.byte	0x5
	.4byte	0x62
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.string	"i"
	.byte	0x1
	.byte	0x6
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x16
	.4byte	.LASF54
	.byte	0x1
	.byte	0x7
	.4byte	0x303
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
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
	.uleb128 0x34
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
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
.LASF20:
	.string	"_IO_buf_end"
.LASF28:
	.string	"_old_offset"
.LASF54:
	.string	"array"
.LASF52:
	.string	"sys_nerr"
.LASF23:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF10:
	.string	"sizetype"
.LASF33:
	.string	"_offset"
.LASF17:
	.string	"_IO_write_ptr"
.LASF12:
	.string	"_flags"
.LASF19:
	.string	"_IO_buf_base"
.LASF24:
	.string	"_markers"
.LASF14:
	.string	"_IO_read_end"
.LASF51:
	.string	"stderr"
.LASF56:
	.string	"sample.c"
.LASF57:
	.string	"/home/kendi3he/arm64Test/Sample"
.LASF32:
	.string	"_lock"
.LASF6:
	.string	"long int"
.LASF29:
	.string	"_cur_column"
.LASF48:
	.string	"_IO_2_1_stderr_"
.LASF59:
	.string	"_IO_FILE_plus"
.LASF45:
	.string	"_pos"
.LASF44:
	.string	"_sbuf"
.LASF41:
	.string	"_IO_FILE"
.LASF1:
	.string	"unsigned char"
.LASF4:
	.string	"signed char"
.LASF46:
	.string	"_IO_2_1_stdin_"
.LASF3:
	.string	"unsigned int"
.LASF42:
	.string	"_IO_marker"
.LASF31:
	.string	"_shortbuf"
.LASF16:
	.string	"_IO_write_base"
.LASF40:
	.string	"_unused2"
.LASF55:
	.string	"GNU C11 6.3.0 20170516 -march=armv8-a -mlittle-endian -mabi=lp64 -g"
.LASF2:
	.string	"short unsigned int"
.LASF11:
	.string	"char"
.LASF60:
	.string	"main"
.LASF43:
	.string	"_next"
.LASF34:
	.string	"__pad1"
.LASF35:
	.string	"__pad2"
.LASF36:
	.string	"__pad3"
.LASF37:
	.string	"__pad4"
.LASF38:
	.string	"__pad5"
.LASF0:
	.string	"long unsigned int"
.LASF18:
	.string	"_IO_write_end"
.LASF9:
	.string	"__off64_t"
.LASF8:
	.string	"__off_t"
.LASF25:
	.string	"_chain"
.LASF22:
	.string	"_IO_backup_base"
.LASF49:
	.string	"stdin"
.LASF27:
	.string	"_flags2"
.LASF39:
	.string	"_mode"
.LASF15:
	.string	"_IO_read_base"
.LASF30:
	.string	"_vtable_offset"
.LASF21:
	.string	"_IO_save_base"
.LASF53:
	.string	"sys_errlist"
.LASF26:
	.string	"_fileno"
.LASF13:
	.string	"_IO_read_ptr"
.LASF50:
	.string	"stdout"
.LASF47:
	.string	"_IO_2_1_stdout_"
.LASF58:
	.string	"_IO_lock_t"
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
