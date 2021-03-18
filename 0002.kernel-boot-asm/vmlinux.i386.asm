
../kernel/linux-4.19.157/arch/x86/boot/compressed/vmlinux:     file format elf64-x86-64


Disassembly of section .head.text:

0000000000000000 <startup_32>:
   0:	fc                   	cld    
   1:	f6 86 11 02 00 00 40 	testb  $0x40,0x211(%rsi)
   8:	75 0c                	jne    16 <startup_32+0x16>
   a:	fa                   	cli    
   b:	b8 18 00 00 00       	mov    $0x18,%eax
  10:	8e d8                	mov    %eax,%ds
  12:	8e c0                	mov    %eax,%es
  14:	8e d0                	mov    %eax,%ss
  16:	8d a6 e8 01 00 00    	lea    0x1e8(%rsi),%esp
  1c:	e8 00 00 00 00       	callq  21 <startup_32+0x21>
  21:	5d                   	pop    %rbp
  22:	81 ed 21 00 00 00    	sub    $0x21,%ebp
  28:	b8 00 a1 a6 00       	mov    $0xa6a100,%eax
  2d:	01 e8                	add    %ebp,%eax
  2f:	89 c4                	mov    %eax,%esp
  31:	e8 ea a4 a4 00       	callq  a4a520 <verify_cpu>
  36:	85 c0                	test   %eax,%eax
  38:	0f 85 d2 a4 a4 00    	jne    a4a510 <no_longmode>
  3e:	89 eb                	mov    %ebp,%ebx
  40:	8b 86 30 02 00 00    	mov    0x230(%rsi),%eax
  46:	48 01 c3             	add    %rax,%rbx
  49:	f7 d0                	not    %eax
  4b:	21 c3                	and    %eax,%ebx
  4d:	81 fb 00 00 00 01    	cmp    $0x1000000,%ebx
  53:	73 05                	jae    5a <startup_32+0x5a>
  55:	bb 00 00 00 01       	mov    $0x1000000,%ebx
  5a:	8b 86 60 02 00 00    	mov    0x260(%rsi),%eax
  60:	2d 00 00 a8 00       	sub    $0xa80000,%eax
  65:	01 c3                	add    %eax,%ebx
  67:	01 ad 72 5e a5 00    	add    %ebp,0xa55e72(%rbp)
  6d:	0f 01 95 70 5e a5 00 	lgdt   0xa55e70(%rbp)
  74:	0f 20 e0             	mov    %cr4,%rax
  77:	83 c8 20             	or     $0x20,%eax
  7a:	0f 22 e0             	mov    %rax,%cr4
  7d:	e8 ce fc a4 00       	callq  a4fd50 <get_sev_encryption_bit>
  82:	31 d2                	xor    %edx,%edx
  84:	85 c0                	test   %eax,%eax
  86:	74 06                	je     8e <startup_32+0x8e>
  88:	83 e8 20             	sub    $0x20,%eax
  8b:	0f ab c2             	bts    %eax,%edx
  8e:	8d bb 00 e0 a6 00    	lea    0xa6e000(%rbx),%edi
  94:	31 c0                	xor    %eax,%eax
  96:	b9 00 18 00 00       	mov    $0x1800,%ecx
  9b:	f3 ab                	rep stos %eax,%es:(%rdi)
  9d:	8d bb 00 e0 a6 00    	lea    0xa6e000(%rbx),%edi
  a3:	8d 87 07 10 00 00    	lea    0x1007(%rdi),%eax
  a9:	89 07                	mov    %eax,(%rdi)
  ab:	01 57 04             	add    %edx,0x4(%rdi)
  ae:	8d bb 00 f0 a6 00    	lea    0xa6f000(%rbx),%edi
  b4:	8d 87 07 10 00 00    	lea    0x1007(%rdi),%eax
  ba:	b9 04 00 00 00       	mov    $0x4,%ecx
  bf:	89 07                	mov    %eax,(%rdi)
  c1:	01 57 04             	add    %edx,0x4(%rdi)
  c4:	05 00 10 00 00       	add    $0x1000,%eax
  c9:	83 c7 08             	add    $0x8,%edi
  cc:	49 75 f0             	rex.WB jne bf <startup_32+0xbf>
  cf:	8d bb 00 00 a7 00    	lea    0xa70000(%rbx),%edi
  d5:	b8 83 01 00 00       	mov    $0x183,%eax
  da:	b9 00 08 00 00       	mov    $0x800,%ecx
  df:	89 07                	mov    %eax,(%rdi)
  e1:	01 57 04             	add    %edx,0x4(%rdi)
  e4:	05 00 00 20 00       	add    $0x200000,%eax
  e9:	83 c7 08             	add    $0x8,%edi
  ec:	49 75 f0             	rex.WB jne df <startup_32+0xdf>
  ef:	8d 83 00 e0 a6 00    	lea    0xa6e000(%rbx),%eax
  f5:	0f 22 d8             	mov    %rax,%cr3
  f8:	b9 80 00 00 c0       	mov    $0xc0000080,%ecx
  fd:	0f 32                	rdmsr  
  ff:	0f ba e8 08          	bts    $0x8,%eax
 103:	0f 30                	wrmsr  
 105:	31 c0                	xor    %eax,%eax
 107:	0f 00 d0             	lldt   %ax
 10a:	b8 20 00 00 00       	mov    $0x20,%eax
 10f:	0f 00 d8             	ltr    %ax
 112:	6a 10                	pushq  $0x10
 114:	8d 85 00 02 00 00    	lea    0x200(%rbp),%eax
 11a:	8b 9d a8 5e a5 00    	mov    0xa55ea8(%rbp),%ebx
 120:	83 fb 00             	cmp    $0x0,%ebx
 123:	74 06                	je     12b <startup_32+0x12b>
 125:	8d 85 40 03 00 00    	lea    0x340(%rbp),%eax
 12b:	50                   	push   %rax
 12c:	b8 01 00 00 80       	mov    $0x80000001,%eax
 131:	0f 22 c0             	mov    %rax,%cr0
 134:	cb                   	lret   
	...

0000000000000190 <efi32_stub_entry>:
 190:	83 c4 04             	add    $0x4,%esp
 193:	59                   	pop    %rcx
 194:	5a                   	pop    %rdx
 195:	5e                   	pop    %rsi
 196:	8d a6 e8 01 00 00    	lea    0x1e8(%rsi),%esp
 19c:	e8 00 00 00 00       	callq  1a1 <efi32_stub_entry+0x11>
 1a1:	5d                   	pop    %rbp
 1a2:	81 ed a1 01 00 00    	sub    $0x1a1,%ebp
 1a8:	89 8d a8 5e a5 00    	mov    %ecx,0xa55ea8(%rbp)
 1ae:	89 95 b0 5e a5 00    	mov    %edx,0xa55eb0(%rbp)
 1b4:	0f 01 85 48 5f a5 00 	sgdt   0xa55f48(%rbp)
 1bb:	8d 85 a8 5e a5 00    	lea    0xa55ea8(%rbp),%eax
 1c1:	89 85 a0 5e a5 00    	mov    %eax,0xa55ea0(%rbp)
 1c7:	0f 20 c0             	mov    %cr0,%rax
 1ca:	0f ba f0 1f          	btr    $0x1f,%eax
 1ce:	0f 22 c0             	mov    %rax,%cr0
 1d1:	e9 2a fe ff ff       	jmpq   0 <startup_32>
	...

0000000000000200 <startup_64>:
 200:	31 c0                	xor    %eax,%eax
 202:	8e d8                	mov    %eax,%ds
 204:	8e c0                	mov    %eax,%es
 206:	8e d0                	mov    %eax,%ss
 208:	8e e0                	mov    %eax,%fs
 20a:	8e e8                	mov    %eax,%gs
 20c:	48 8d 2d ed fd ff ff 	lea    -0x213(%rip),%rbp        # 0 <startup_32>
 213:	8b 86 30 02 00 00    	mov    0x230(%rsi),%eax
 219:	ff c8                	dec    %eax
 21b:	48 01 c5             	add    %rax,%rbp
 21e:	48 f7 d0             	not    %rax
 221:	48 21 c5             	and    %rax,%rbp
 224:	48 81 fd 00 00 00 01 	cmp    $0x1000000,%rbp
 22b:	73 07                	jae    234 <startup_64+0x34>
 22d:	48 c7 c5 00 00 00 01 	mov    $0x1000000,%rbp
 234:	8b 9e 60 02 00 00    	mov    0x260(%rsi),%ebx
 23a:	81 eb 00 00 a8 00    	sub    $0xa80000,%ebx
 240:	48 01 eb             	add    %rbp,%rbx
 243:	48 8d a3 00 a1 a6 00 	lea    0xa6a100(%rbx),%rsp
 24a:	48 31 c0             	xor    %rax,%rax
 24d:	e8 00 00 00 00       	callq  252 <startup_64+0x52>
 252:	5f                   	pop    %rdi
 253:	48 81 ef 52 02 00 00 	sub    $0x252,%rdi
 25a:	e8 14 a2 a4 00       	callq  a4a473 <adjust_got>
 25f:	48 8d 05 0a 5c a5 00 	lea    0xa55c0a(%rip),%rax        # a55e70 <gdt>
 266:	48 89 05 f5 5b a5 00 	mov    %rax,0xa55bf5(%rip)        # a55e62 <_data+0x2>
 26d:	0f 01 15 ec 5b a5 00 	lgdt   0xa55bec(%rip)        # a55e60 <_data>
 274:	56                   	push   %rsi
 275:	48 89 f7             	mov    %rsi,%rdi
 278:	e8 43 fb a4 00       	callq  a4fdc0 <paging_prepare>
 27d:	5e                   	pop    %rsi
 27e:	48 89 c1             	mov    %rax,%rcx
 281:	48 8d 3d 0c 00 00 00 	lea    0xc(%rip),%rdi        # 294 <trampoline_return>
 288:	6a 08                	pushq  $0x8
 28a:	48 8d 80 00 10 00 00 	lea    0x1000(%rax),%rax
 291:	50                   	push   %rax
 292:	48 cb                	lretq  

0000000000000294 <trampoline_return>:
 294:	48 8d a3 00 a1 a6 00 	lea    0xa6a100(%rbx),%rsp
 29b:	56                   	push   %rsi
 29c:	48 8d bb 00 f0 a7 00 	lea    0xa7f000(%rbx),%rdi
 2a3:	e8 f8 fd a4 00       	callq  a500a0 <cleanup_trampoline>
 2a8:	5e                   	pop    %rsi
 2a9:	6a 00                	pushq  $0x0
 2ab:	9d                   	popfq  
 2ac:	e8 00 00 00 00       	callq  2b1 <trampoline_return+0x1d>
 2b1:	58                   	pop    %rax
 2b2:	48 2d b1 02 00 00    	sub    $0x2b1,%rax
 2b8:	48 89 df             	mov    %rbx,%rdi
 2bb:	e8 b3 a1 a4 00       	callq  a4a473 <adjust_got>
 2c0:	56                   	push   %rsi
 2c1:	48 8d 35 30 5e a5 00 	lea    0xa55e30(%rip),%rsi        # a560f8 <_DYNAMIC+0x150>
 2c8:	48 8d bb f8 60 a5 00 	lea    0xa560f8(%rbx),%rdi
 2cf:	48 c7 c1 00 61 a5 00 	mov    $0xa56100,%rcx
 2d6:	48 c1 e9 03          	shr    $0x3,%rcx
 2da:	fd                   	std    
 2db:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
 2de:	fc                   	cld    
 2df:	5e                   	pop    %rsi
 2e0:	48 8d 83 30 a4 a4 00 	lea    0xa4a430(%rbx),%rax
 2e7:	ff e0                	jmpq   *%rax
 2e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000002f0 <efi_pe_entry>:
 2f0:	48 89 0d e2 5b a5 00 	mov    %rcx,0xa55be2(%rip)        # a55ed9 <efi64_config>
 2f7:	48 89 15 e3 5b a5 00 	mov    %rdx,0xa55be3(%rip)        # a55ee1 <efi64_config+0x8>
 2fe:	48 8d 05 d4 5b a5 00 	lea    0xa55bd4(%rip),%rax        # a55ed9 <efi64_config>
 305:	48 89 05 94 5b a5 00 	mov    %rax,0xa55b94(%rip)        # a55ea0 <efi_config>
 30c:	e8 00 00 00 00       	callq  311 <efi_pe_entry+0x21>
 311:	5d                   	pop    %rbp
 312:	48 81 ed 11 03 00 00 	sub    $0x311,%rbp
 319:	48 01 2d e1 5b a5 00 	add    %rbp,0xa55be1(%rip)        # a55f01 <efi64_config+0x28>
 320:	48 89 c7             	mov    %rax,%rdi
 323:	e8 98 03 a5 00       	callq  a506c0 <make_boot_params>
 328:	48 83 f8 00          	cmp    $0x0,%rax
 32c:	74 3f                	je     36d <fail>
 32e:	48 89 c6             	mov    %rax,%rsi
 331:	48 8d 05 c8 fc ff ff 	lea    -0x338(%rip),%rax        # 0 <startup_32>
 338:	89 86 14 02 00 00    	mov    %eax,0x214(%rsi)
 33e:	eb 18                	jmp    358 <handover_entry+0x18>

0000000000000340 <handover_entry>:
 340:	e8 00 00 00 00       	callq  345 <handover_entry+0x5>
 345:	5d                   	pop    %rbp
 346:	48 81 ed 45 03 00 00 	sub    $0x345,%rbp
 34d:	48 8b 05 4c 5b a5 00 	mov    0xa55b4c(%rip),%rax        # a55ea0 <efi_config>
 354:	48 01 68 28          	add    %rbp,0x28(%rax)
 358:	48 8b 3d 41 5b a5 00 	mov    0xa55b41(%rip),%rdi        # a55ea0 <efi_config>
 35f:	e8 bc 06 a5 00       	callq  a50a20 <efi_main>
 364:	48 89 c6             	mov    %rax,%rsi
 367:	48 83 f8 00          	cmp    $0x0,%rax
 36b:	75 03                	jne    370 <fail+0x3>

000000000000036d <fail>:
 36d:	f4                   	hlt    
 36e:	eb fd                	jmp    36d <fail>
 370:	67 8b 86 14 02 00 00 	mov    0x214(%esi),%eax
 377:	48 8d 80 00 02 00 00 	lea    0x200(%rax),%rax
 37e:	ff e0                	jmpq   *%rax
	...

0000000000000390 <efi64_stub_entry>:
 390:	48 89 3d 42 5b a5 00 	mov    %rdi,0xa55b42(%rip)        # a55ed9 <efi64_config>
 397:	48 89 35 43 5b a5 00 	mov    %rsi,0xa55b43(%rip)        # a55ee1 <efi64_config+0x8>
 39e:	48 8d 05 34 5b a5 00 	lea    0xa55b34(%rip),%rax        # a55ed9 <efi64_config>
 3a5:	48 89 05 f4 5a a5 00 	mov    %rax,0xa55af4(%rip)        # a55ea0 <efi_config>
 3ac:	48 89 d6             	mov    %rdx,%rsi
 3af:	eb 8f                	jmp    340 <handover_entry>

Disassembly of section .text:

0000000000a4a430 <_text>:
  a4a430:	31 c0                	xor    %eax,%eax
  a4a432:	48 8d 3d c7 bc 00 00 	lea    0xbcc7(%rip),%rdi        # a56100 <_bss>
  a4a439:	48 8d 0d 50 35 02 00 	lea    0x23550(%rip),%rcx        # a6d990 <_ebss>
  a4a440:	48 29 f9             	sub    %rdi,%rcx
  a4a443:	48 c1 e9 03          	shr    $0x3,%rcx
  a4a447:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  a4a44a:	56                   	push   %rsi
  a4a44b:	48 89 f7             	mov    %rsi,%rdi
  a4a44e:	48 8d 35 ab bc 00 00 	lea    0xbcab(%rip),%rsi        # a56100 <_bss>
  a4a455:	48 8d 15 55 5f 5b ff 	lea    -0xa4a0ab(%rip),%rdx        # 3b1 <_ehead>
  a4a45c:	b9 77 a0 a4 00       	mov    $0xa4a077,%ecx
  a4a461:	49 89 e8             	mov    %rbp,%r8
  a4a464:	49 c7 c1 78 ba 02 02 	mov    $0x202ba78,%r9
  a4a46b:	e8 40 2f 00 00       	callq  a4d3b0 <extract_kernel>
  a4a470:	5e                   	pop    %rsi
  a4a471:	ff e0                	jmpq   *%rax

0000000000a4a473 <adjust_got>:
  a4a473:	48 8d 15 e6 b9 00 00 	lea    0xb9e6(%rip),%rdx        # a55e60 <_data>
  a4a47a:	48 8d 0d df b9 00 00 	lea    0xb9df(%rip),%rcx        # a55e60 <_data>
  a4a481:	48 39 ca             	cmp    %rcx,%rdx
  a4a484:	73 0c                	jae    a4a492 <adjust_got+0x1f>
  a4a486:	48 29 02             	sub    %rax,(%rdx)
  a4a489:	48 01 3a             	add    %rdi,(%rdx)
  a4a48c:	48 83 c2 08          	add    $0x8,%rdx
  a4a490:	eb ef                	jmp    a4a481 <adjust_got+0xe>
  a4a492:	c3                   	retq   
  a4a493:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4a49a:	00 00 00 00 
  a4a49e:	66 90                	xchg   %ax,%ax

0000000000a4a4a0 <trampoline_32bit_src>:
  a4a4a0:	b8 18 00 00 00       	mov    $0x18,%eax
  a4a4a5:	8e d8                	mov    %eax,%ds
  a4a4a7:	8e d0                	mov    %eax,%ss
  a4a4a9:	8d a1 00 20 00 00    	lea    0x2000(%rcx),%esp
  a4a4af:	0f 20 c0             	mov    %cr0,%rax
  a4a4b2:	0f ba f0 1f          	btr    $0x1f,%eax
  a4a4b6:	0f 22 c0             	mov    %rax,%cr0
  a4a4b9:	83 fa 00             	cmp    $0x0,%edx
  a4a4bc:	74 0c                	je     a4a4ca <trampoline_32bit_src+0x2a>
  a4a4be:	0f 20 e0             	mov    %cr4,%rax
  a4a4c1:	a9 00 10 00 00       	test   $0x1000,%eax
  a4a4c6:	75 11                	jne    a4a4d9 <trampoline_32bit_src+0x39>
  a4a4c8:	eb 0a                	jmp    a4a4d4 <trampoline_32bit_src+0x34>
  a4a4ca:	0f 20 e0             	mov    %cr4,%rax
  a4a4cd:	a9 00 10 00 00       	test   $0x1000,%eax
  a4a4d2:	74 05                	je     a4a4d9 <trampoline_32bit_src+0x39>
  a4a4d4:	8d 01                	lea    (%rcx),%eax
  a4a4d6:	0f 22 d8             	mov    %rax,%cr3
  a4a4d9:	51                   	push   %rcx
  a4a4da:	52                   	push   %rdx
  a4a4db:	b9 80 00 00 c0       	mov    $0xc0000080,%ecx
  a4a4e0:	0f 32                	rdmsr  
  a4a4e2:	0f ba e8 08          	bts    $0x8,%eax
  a4a4e6:	0f 30                	wrmsr  
  a4a4e8:	5a                   	pop    %rdx
  a4a4e9:	59                   	pop    %rcx
  a4a4ea:	b8 20 00 00 00       	mov    $0x20,%eax
  a4a4ef:	83 fa 00             	cmp    $0x0,%edx
  a4a4f2:	74 05                	je     a4a4f9 <trampoline_32bit_src+0x59>
  a4a4f4:	0d 00 10 00 00       	or     $0x1000,%eax
  a4a4f9:	0f 22 e0             	mov    %rax,%cr4
  a4a4fc:	8d 81 6e 10 00 00    	lea    0x106e(%rcx),%eax
  a4a502:	6a 10                	pushq  $0x10
  a4a504:	50                   	push   %rax
  a4a505:	b8 01 00 00 80       	mov    $0x80000001,%eax
  a4a50a:	0f 22 c0             	mov    %rax,%cr0
  a4a50d:	cb                   	lret   

0000000000a4a50e <paging_enabled>:
  a4a50e:	ff e7                	jmpq   *%rdi

0000000000a4a510 <no_longmode>:
  a4a510:	f4                   	hlt    
  a4a511:	eb fd                	jmp    a4a510 <no_longmode>
  a4a513:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4a51a:	00 00 00 00 
  a4a51e:	66 90                	xchg   %ax,%ax

0000000000a4a520 <verify_cpu>:
  a4a520:	9c                   	pushfq 
  a4a521:	6a 00                	pushq  $0x0
  a4a523:	9d                   	popfq  
  a4a524:	b8 00 00 00 00       	mov    $0x0,%eax
  a4a529:	0f a2                	cpuid  
  a4a52b:	83 f8 01             	cmp    $0x1,%eax
  a4a52e:	0f 82 d2 00 00 00    	jb     a4a606 <verify_cpu+0xe6>
  a4a534:	66 31 ff             	xor    %di,%di
  a4a537:	81 fb 41 75 74 68    	cmp    $0x68747541,%ebx
  a4a53d:	75 16                	jne    a4a555 <verify_cpu+0x35>
  a4a53f:	81 fa 65 6e 74 69    	cmp    $0x69746e65,%edx
  a4a545:	75 0e                	jne    a4a555 <verify_cpu+0x35>
  a4a547:	81 f9 63 41 4d 44    	cmp    $0x444d4163,%ecx
  a4a54d:	75 06                	jne    a4a555 <verify_cpu+0x35>
  a4a54f:	66 bf 01 00          	mov    $0x1,%di
  a4a553:	eb 4d                	jmp    a4a5a2 <verify_cpu+0x82>
  a4a555:	81 fb 47 65 6e 75    	cmp    $0x756e6547,%ebx
  a4a55b:	75 45                	jne    a4a5a2 <verify_cpu+0x82>
  a4a55d:	81 fa 69 6e 65 49    	cmp    $0x49656e69,%edx
  a4a563:	75 3d                	jne    a4a5a2 <verify_cpu+0x82>
  a4a565:	81 f9 6e 74 65 6c    	cmp    $0x6c65746e,%ecx
  a4a56b:	75 35                	jne    a4a5a2 <verify_cpu+0x82>
  a4a56d:	b8 01 00 00 00       	mov    $0x1,%eax
  a4a572:	0f a2                	cpuid  
  a4a574:	89 c1                	mov    %eax,%ecx
  a4a576:	25 00 0f f0 0f       	and    $0xff00f00,%eax
  a4a57b:	c1 e8 08             	shr    $0x8,%eax
  a4a57e:	83 f8 06             	cmp    $0x6,%eax
  a4a581:	77 10                	ja     a4a593 <verify_cpu+0x73>
  a4a583:	72 1d                	jb     a4a5a2 <verify_cpu+0x82>
  a4a585:	81 e1 f0 00 0f 00    	and    $0xf00f0,%ecx
  a4a58b:	c1 e9 04             	shr    $0x4,%ecx
  a4a58e:	83 f9 0d             	cmp    $0xd,%ecx
  a4a591:	72 0f                	jb     a4a5a2 <verify_cpu+0x82>
  a4a593:	b9 a0 01 00 00       	mov    $0x1a0,%ecx
  a4a598:	0f 32                	rdmsr  
  a4a59a:	0f ba f2 02          	btr    $0x2,%edx
  a4a59e:	73 02                	jae    a4a5a2 <verify_cpu+0x82>
  a4a5a0:	0f 30                	wrmsr  
  a4a5a2:	b8 01 00 00 00       	mov    $0x1,%eax
  a4a5a7:	0f a2                	cpuid  
  a4a5a9:	81 e2 61 81 00 07    	and    $0x7008161,%edx
  a4a5af:	81 f2 61 81 00 07    	xor    $0x7008161,%edx
  a4a5b5:	75 4f                	jne    a4a606 <verify_cpu+0xe6>
  a4a5b7:	b8 00 00 00 80       	mov    $0x80000000,%eax
  a4a5bc:	0f a2                	cpuid  
  a4a5be:	3d 01 00 00 80       	cmp    $0x80000001,%eax
  a4a5c3:	72 41                	jb     a4a606 <verify_cpu+0xe6>
  a4a5c5:	b8 01 00 00 80       	mov    $0x80000001,%eax
  a4a5ca:	0f a2                	cpuid  
  a4a5cc:	81 e2 00 00 00 20    	and    $0x20000000,%edx
  a4a5d2:	81 f2 00 00 00 20    	xor    $0x20000000,%edx
  a4a5d8:	75 2c                	jne    a4a606 <verify_cpu+0xe6>
  a4a5da:	b8 01 00 00 00       	mov    $0x1,%eax
  a4a5df:	0f a2                	cpuid  
  a4a5e1:	81 e2 00 00 00 06    	and    $0x6000000,%edx
  a4a5e7:	81 fa 00 00 00 06    	cmp    $0x6000000,%edx
  a4a5ed:	74 1e                	je     a4a60d <verify_cpu+0xed>
  a4a5ef:	66 85 ff             	test   %di,%di
  a4a5f2:	74 12                	je     a4a606 <verify_cpu+0xe6>
  a4a5f4:	b9 15 00 01 c0       	mov    $0xc0010015,%ecx
  a4a5f9:	0f 32                	rdmsr  
  a4a5fb:	0f ba f0 0f          	btr    $0xf,%eax
  a4a5ff:	0f 30                	wrmsr  
  a4a601:	66 31 ff             	xor    %di,%di
  a4a604:	eb d4                	jmp    a4a5da <verify_cpu+0xba>
  a4a606:	9d                   	popfq  
  a4a607:	b8 01 00 00 00       	mov    $0x1,%eax
  a4a60c:	c3                   	retq   
  a4a60d:	9d                   	popfq  
  a4a60e:	31 c0                	xor    %eax,%eax
  a4a610:	c3                   	retq   
  a4a611:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4a618:	00 00 00 
  a4a61b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000a4a620 <scroll>:
  a4a620:	8b 05 0e 0b 02 00    	mov    0x20b0e(%rip),%eax        # a6b134 <lines>
  a4a626:	48 8b 0d 13 0b 02 00 	mov    0x20b13(%rip),%rcx        # a6b140 <vidmem>
  a4a62d:	41 54                	push   %r12
  a4a62f:	44 8b 25 fa 0a 02 00 	mov    0x20afa(%rip),%r12d        # a6b130 <cols>
  a4a636:	55                   	push   %rbp
  a4a637:	8d 68 ff             	lea    -0x1(%rax),%ebp
  a4a63a:	53                   	push   %rbx
  a4a63b:	48 89 cf             	mov    %rcx,%rdi
  a4a63e:	41 0f af ec          	imul   %r12d,%ebp
  a4a642:	43 8d 34 24          	lea    (%r12,%r12,1),%esi
  a4a646:	48 63 f6             	movslq %esi,%rsi
  a4a649:	48 01 ce             	add    %rcx,%rsi
  a4a64c:	8d 5c 2d 00          	lea    0x0(%rbp,%rbp,1),%ebx
  a4a650:	41 01 ec             	add    %ebp,%r12d
  a4a653:	48 63 db             	movslq %ebx,%rbx
  a4a656:	48 89 da             	mov    %rbx,%rdx
  a4a659:	e8 02 36 00 00       	callq  a4dc60 <memmove>
  a4a65e:	44 39 e5             	cmp    %r12d,%ebp
  a4a661:	7d 19                	jge    a4a67c <scroll+0x5c>
  a4a663:	48 89 c1             	mov    %rax,%rcx
  a4a666:	43 8d 04 24          	lea    (%r12,%r12,1),%eax
  a4a66a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4a670:	c6 04 19 20          	movb   $0x20,(%rcx,%rbx,1)
  a4a674:	48 83 c3 02          	add    $0x2,%rbx
  a4a678:	39 d8                	cmp    %ebx,%eax
  a4a67a:	7f f4                	jg     a4a670 <scroll+0x50>
  a4a67c:	5b                   	pop    %rbx
  a4a67d:	5d                   	pop    %rbp
  a4a67e:	41 5c                	pop    %r12
  a4a680:	c3                   	retq   
  a4a681:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4a688:	00 00 00 00 
  a4a68c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000a4a690 <LZ4_decompress_safe>:
  a4a690:	f3 0f 1e fa          	endbr64 
  a4a694:	4c 63 d2             	movslq %edx,%r10
  a4a697:	4c 63 d9             	movslq %ecx,%r11
  a4a69a:	49 89 f8             	mov    %rdi,%r8
  a4a69d:	49 01 fa             	add    %rdi,%r10
  a4a6a0:	49 01 f3             	add    %rsi,%r11
  a4a6a3:	85 c9                	test   %ecx,%ecx
  a4a6a5:	0f 84 49 02 00 00    	je     a4a8f4 <LZ4_decompress_safe+0x264>
  a4a6ab:	41 57                	push   %r15
  a4a6ad:	49 8d 43 fb          	lea    -0x5(%r11),%rax
  a4a6b1:	48 89 f7             	mov    %rsi,%rdi
  a4a6b4:	4d 8d 4a f1          	lea    -0xf(%r10),%r9
  a4a6b8:	41 56                	push   %r14
  a4a6ba:	49 8d 4b f4          	lea    -0xc(%r11),%rcx
  a4a6be:	4d 8d 73 f9          	lea    -0x7(%r11),%r14
  a4a6c2:	41 55                	push   %r13
  a4a6c4:	4d 8d 6a f8          	lea    -0x8(%r10),%r13
  a4a6c8:	41 54                	push   %r12
  a4a6ca:	4d 8d 62 fc          	lea    -0x4(%r10),%r12
  a4a6ce:	55                   	push   %rbp
  a4a6cf:	48 89 f5             	mov    %rsi,%rbp
  a4a6d2:	53                   	push   %rbx
  a4a6d3:	48 83 ec 18          	sub    $0x18,%rsp
  a4a6d7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a4a6dc:	49 8d 70 01          	lea    0x1(%r8),%rsi
  a4a6e0:	45 0f b6 00          	movzbl (%r8),%r8d
  a4a6e4:	44 89 c2             	mov    %r8d,%edx
  a4a6e7:	41 c1 e8 04          	shr    $0x4,%r8d
  a4a6eb:	44 89 c0             	mov    %r8d,%eax
  a4a6ee:	41 83 f8 0f          	cmp    $0xf,%r8d
  a4a6f2:	0f 84 00 01 00 00    	je     a4a7f8 <LZ4_decompress_safe+0x168>
  a4a6f8:	48 8d 1c 07          	lea    (%rdi,%rax,1),%rbx
  a4a6fc:	4c 8d 04 06          	lea    (%rsi,%rax,1),%r8
  a4a700:	48 39 d9             	cmp    %rbx,%rcx
  a4a703:	0f 82 be 01 00 00    	jb     a4a8c7 <LZ4_decompress_safe+0x237>
  a4a709:	4d 39 e8             	cmp    %r13,%r8
  a4a70c:	0f 87 b5 01 00 00    	ja     a4a8c7 <LZ4_decompress_safe+0x237>
  a4a712:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4a718:	48 8b 06             	mov    (%rsi),%rax
  a4a71b:	48 83 c7 08          	add    $0x8,%rdi
  a4a71f:	48 83 c6 08          	add    $0x8,%rsi
  a4a723:	48 89 47 f8          	mov    %rax,-0x8(%rdi)
  a4a727:	48 39 df             	cmp    %rbx,%rdi
  a4a72a:	72 ec                	jb     a4a718 <LZ4_decompress_safe+0x88>
  a4a72c:	41 0f b7 30          	movzwl (%r8),%esi
  a4a730:	48 89 d8             	mov    %rbx,%rax
  a4a733:	49 83 c0 02          	add    $0x2,%r8
  a4a737:	48 29 f0             	sub    %rsi,%rax
  a4a73a:	48 39 c5             	cmp    %rax,%rbp
  a4a73d:	0f 87 9c 00 00 00    	ja     a4a7df <LZ4_decompress_safe+0x14f>
  a4a743:	89 d7                	mov    %edx,%edi
  a4a745:	89 33                	mov    %esi,(%rbx)
  a4a747:	83 e2 0f             	and    $0xf,%edx
  a4a74a:	83 e7 0f             	and    $0xf,%edi
  a4a74d:	40 80 ff 0f          	cmp    $0xf,%dil
  a4a751:	74 65                	je     a4a7b8 <LZ4_decompress_safe+0x128>
  a4a753:	48 83 c2 04          	add    $0x4,%rdx
  a4a757:	48 8d 3c 13          	lea    (%rbx,%rdx,1),%rdi
  a4a75b:	48 83 fe 07          	cmp    $0x7,%rsi
  a4a75f:	0f 86 c5 00 00 00    	jbe    a4a82a <LZ4_decompress_safe+0x19a>
  a4a765:	48 8b 30             	mov    (%rax),%rsi
  a4a768:	48 83 c0 08          	add    $0x8,%rax
  a4a76c:	48 89 33             	mov    %rsi,(%rbx)
  a4a76f:	48 39 f9             	cmp    %rdi,%rcx
  a4a772:	0f 82 00 01 00 00    	jb     a4a878 <LZ4_decompress_safe+0x1e8>
  a4a778:	48 8b 30             	mov    (%rax),%rsi
  a4a77b:	48 89 73 08          	mov    %rsi,0x8(%rbx)
  a4a77f:	48 83 fa 10          	cmp    $0x10,%rdx
  a4a783:	0f 86 53 ff ff ff    	jbe    a4a6dc <LZ4_decompress_safe+0x4c>
  a4a789:	48 83 c0 08          	add    $0x8,%rax
  a4a78d:	48 83 c3 10          	add    $0x10,%rbx
  a4a791:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4a798:	48 8b 10             	mov    (%rax),%rdx
  a4a79b:	48 83 c3 08          	add    $0x8,%rbx
  a4a79f:	48 83 c0 08          	add    $0x8,%rax
  a4a7a3:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
  a4a7a7:	48 39 df             	cmp    %rbx,%rdi
  a4a7aa:	77 ec                	ja     a4a798 <LZ4_decompress_safe+0x108>
  a4a7ac:	e9 2b ff ff ff       	jmpq   a4a6dc <LZ4_decompress_safe+0x4c>
  a4a7b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4a7b8:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4a7bd:	eb 12                	jmp    a4a7d1 <LZ4_decompress_safe+0x141>
  a4a7bf:	90                   	nop
  a4a7c0:	44 0f b6 ff          	movzbl %dil,%r15d
  a4a7c4:	4c 01 fa             	add    %r15,%rdx
  a4a7c7:	40 80 ff ff          	cmp    $0xff,%dil
  a4a7cb:	0f 85 e5 00 00 00    	jne    a4a8b6 <LZ4_decompress_safe+0x226>
  a4a7d1:	49 83 c0 01          	add    $0x1,%r8
  a4a7d5:	41 0f b6 78 ff       	movzbl -0x1(%r8),%edi
  a4a7da:	4d 39 c4             	cmp    %r8,%r12
  a4a7dd:	75 e1                	jne    a4a7c0 <LZ4_decompress_safe+0x130>
  a4a7df:	48 83 c4 18          	add    $0x18,%rsp
  a4a7e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4a7e8:	5b                   	pop    %rbx
  a4a7e9:	5d                   	pop    %rbp
  a4a7ea:	41 5c                	pop    %r12
  a4a7ec:	41 5d                	pop    %r13
  a4a7ee:	41 5e                	pop    %r14
  a4a7f0:	41 5f                	pop    %r15
  a4a7f2:	c3                   	retq   
  a4a7f3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4a7f8:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4a7fd:	eb 06                	jmp    a4a805 <LZ4_decompress_safe+0x175>
  a4a7ff:	90                   	nop
  a4a800:	80 fb ff             	cmp    $0xff,%bl
  a4a803:	75 0f                	jne    a4a814 <LZ4_decompress_safe+0x184>
  a4a805:	0f b6 1e             	movzbl (%rsi),%ebx
  a4a808:	48 83 c6 01          	add    $0x1,%rsi
  a4a80c:	48 01 d8             	add    %rbx,%rax
  a4a80f:	4c 39 ce             	cmp    %r9,%rsi
  a4a812:	72 ec                	jb     a4a800 <LZ4_decompress_safe+0x170>
  a4a814:	48 89 fb             	mov    %rdi,%rbx
  a4a817:	48 01 c3             	add    %rax,%rbx
  a4a81a:	72 c3                	jb     a4a7df <LZ4_decompress_safe+0x14f>
  a4a81c:	49 89 f0             	mov    %rsi,%r8
  a4a81f:	49 01 c0             	add    %rax,%r8
  a4a822:	0f 83 d8 fe ff ff    	jae    a4a700 <LZ4_decompress_safe+0x70>
  a4a828:	eb b5                	jmp    a4a7df <LZ4_decompress_safe+0x14f>
  a4a82a:	44 0f b6 38          	movzbl (%rax),%r15d
  a4a82e:	44 88 3b             	mov    %r15b,(%rbx)
  a4a831:	44 0f b6 78 01       	movzbl 0x1(%rax),%r15d
  a4a836:	44 88 7b 01          	mov    %r15b,0x1(%rbx)
  a4a83a:	44 0f b6 78 02       	movzbl 0x2(%rax),%r15d
  a4a83f:	44 88 7b 02          	mov    %r15b,0x2(%rbx)
  a4a843:	44 0f b6 78 03       	movzbl 0x3(%rax),%r15d
  a4a848:	44 88 7b 03          	mov    %r15b,0x3(%rbx)
  a4a84c:	4c 8d 3d 4d 97 00 00 	lea    0x974d(%rip),%r15        # a53fa0 <dec32table.3>
  a4a853:	45 8b 3c b7          	mov    (%r15,%rsi,4),%r15d
  a4a857:	4c 01 f8             	add    %r15,%rax
  a4a85a:	44 8b 38             	mov    (%rax),%r15d
  a4a85d:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
  a4a861:	4c 8d 3d 58 97 00 00 	lea    0x9758(%rip),%r15        # a53fc0 <dec64table.4>
  a4a868:	49 63 34 b7          	movslq (%r15,%rsi,4),%rsi
  a4a86c:	48 29 f0             	sub    %rsi,%rax
  a4a86f:	48 39 f9             	cmp    %rdi,%rcx
  a4a872:	0f 83 00 ff ff ff    	jae    a4a778 <LZ4_decompress_safe+0xe8>
  a4a878:	48 3b 7c 24 08       	cmp    0x8(%rsp),%rdi
  a4a87d:	0f 87 5c ff ff ff    	ja     a4a7df <LZ4_decompress_safe+0x14f>
  a4a883:	48 83 c3 08          	add    $0x8,%rbx
  a4a887:	4c 39 f3             	cmp    %r14,%rbx
  a4a88a:	72 73                	jb     a4a8ff <LZ4_decompress_safe+0x26f>
  a4a88c:	48 39 df             	cmp    %rbx,%rdi
  a4a88f:	0f 86 47 fe ff ff    	jbe    a4a6dc <LZ4_decompress_safe+0x4c>
  a4a895:	49 89 ff             	mov    %rdi,%r15
  a4a898:	31 d2                	xor    %edx,%edx
  a4a89a:	49 29 df             	sub    %rbx,%r15
  a4a89d:	0f 1f 00             	nopl   (%rax)
  a4a8a0:	0f b6 34 10          	movzbl (%rax,%rdx,1),%esi
  a4a8a4:	40 88 34 13          	mov    %sil,(%rbx,%rdx,1)
  a4a8a8:	48 83 c2 01          	add    $0x1,%rdx
  a4a8ac:	49 39 d7             	cmp    %rdx,%r15
  a4a8af:	75 ef                	jne    a4a8a0 <LZ4_decompress_safe+0x210>
  a4a8b1:	e9 26 fe ff ff       	jmpq   a4a6dc <LZ4_decompress_safe+0x4c>
  a4a8b6:	48 89 df             	mov    %rbx,%rdi
  a4a8b9:	48 01 d7             	add    %rdx,%rdi
  a4a8bc:	0f 83 91 fe ff ff    	jae    a4a753 <LZ4_decompress_safe+0xc3>
  a4a8c2:	e9 18 ff ff ff       	jmpq   a4a7df <LZ4_decompress_safe+0x14f>
  a4a8c7:	48 89 c2             	mov    %rax,%rdx
  a4a8ca:	49 39 db             	cmp    %rbx,%r11
  a4a8cd:	0f 82 0c ff ff ff    	jb     a4a7df <LZ4_decompress_safe+0x14f>
  a4a8d3:	4d 39 c2             	cmp    %r8,%r10
  a4a8d6:	0f 85 03 ff ff ff    	jne    a4a7df <LZ4_decompress_safe+0x14f>
  a4a8dc:	e8 df 33 00 00       	callq  a4dcc0 <memcpy>
  a4a8e1:	89 d8                	mov    %ebx,%eax
  a4a8e3:	48 83 c4 18          	add    $0x18,%rsp
  a4a8e7:	29 e8                	sub    %ebp,%eax
  a4a8e9:	5b                   	pop    %rbx
  a4a8ea:	5d                   	pop    %rbp
  a4a8eb:	41 5c                	pop    %r12
  a4a8ed:	41 5d                	pop    %r13
  a4a8ef:	41 5e                	pop    %r14
  a4a8f1:	41 5f                	pop    %r15
  a4a8f3:	c3                   	retq   
  a4a8f4:	83 fa 01             	cmp    $0x1,%edx
  a4a8f7:	74 34                	je     a4a92d <LZ4_decompress_safe+0x29d>
  a4a8f9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4a8fe:	c3                   	retq   
  a4a8ff:	48 89 c6             	mov    %rax,%rsi
  a4a902:	48 89 da             	mov    %rbx,%rdx
  a4a905:	0f 1f 00             	nopl   (%rax)
  a4a908:	4c 8b 3e             	mov    (%rsi),%r15
  a4a90b:	48 83 c2 08          	add    $0x8,%rdx
  a4a90f:	48 83 c6 08          	add    $0x8,%rsi
  a4a913:	4c 89 7a f8          	mov    %r15,-0x8(%rdx)
  a4a917:	49 39 d6             	cmp    %rdx,%r14
  a4a91a:	77 ec                	ja     a4a908 <LZ4_decompress_safe+0x278>
  a4a91c:	4c 89 f2             	mov    %r14,%rdx
  a4a91f:	48 29 da             	sub    %rbx,%rdx
  a4a922:	4c 89 f3             	mov    %r14,%rbx
  a4a925:	48 01 d0             	add    %rdx,%rax
  a4a928:	e9 5f ff ff ff       	jmpq   a4a88c <LZ4_decompress_safe+0x1fc>
  a4a92d:	31 c0                	xor    %eax,%eax
  a4a92f:	80 3f 00             	cmpb   $0x0,(%rdi)
  a4a932:	75 c5                	jne    a4a8f9 <LZ4_decompress_safe+0x269>
  a4a934:	c3                   	retq   
  a4a935:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4a93c:	00 00 00 00 

0000000000a4a940 <LZ4_decompress_safe_partial>:
  a4a940:	f3 0f 1e fa          	endbr64 
  a4a944:	41 57                	push   %r15
  a4a946:	4d 63 d0             	movslq %r8d,%r10
  a4a949:	48 63 c9             	movslq %ecx,%rcx
  a4a94c:	49 89 f9             	mov    %rdi,%r9
  a4a94f:	41 56                	push   %r14
  a4a951:	49 01 f2             	add    %rsi,%r10
  a4a954:	48 01 f1             	add    %rsi,%rcx
  a4a957:	41 55                	push   %r13
  a4a959:	4d 8d 5a f4          	lea    -0xc(%r10),%r11
  a4a95d:	41 54                	push   %r12
  a4a95f:	4c 63 e2             	movslq %edx,%r12
  a4a962:	55                   	push   %rbp
  a4a963:	49 01 fc             	add    %rdi,%r12
  a4a966:	53                   	push   %rbx
  a4a967:	48 83 ec 28          	sub    $0x28,%rsp
  a4a96b:	49 39 cb             	cmp    %rcx,%r11
  a4a96e:	49 0f 42 cb          	cmovb  %r11,%rcx
  a4a972:	45 85 c0             	test   %r8d,%r8d
  a4a975:	0f 84 54 02 00 00    	je     a4abcf <LZ4_decompress_safe_partial+0x28f>
  a4a97b:	49 8d 42 f9          	lea    -0x7(%r10),%rax
  a4a97f:	48 89 f5             	mov    %rsi,%rbp
  a4a982:	48 89 f7             	mov    %rsi,%rdi
  a4a985:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a4a98a:	49 8d 42 fb          	lea    -0x5(%r10),%rax
  a4a98e:	4d 8d 44 24 f1       	lea    -0xf(%r12),%r8
  a4a993:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  a4a998:	4d 8d 74 24 f8       	lea    -0x8(%r12),%r14
  a4a99d:	4d 8d 6c 24 fc       	lea    -0x4(%r12),%r13
  a4a9a2:	49 8d 71 01          	lea    0x1(%r9),%rsi
  a4a9a6:	45 0f b6 09          	movzbl (%r9),%r9d
  a4a9aa:	44 89 ca             	mov    %r9d,%edx
  a4a9ad:	41 c1 e9 04          	shr    $0x4,%r9d
  a4a9b1:	44 89 c8             	mov    %r9d,%eax
  a4a9b4:	41 83 f9 0f          	cmp    $0xf,%r9d
  a4a9b8:	0f 84 0a 01 00 00    	je     a4aac8 <LZ4_decompress_safe_partial+0x188>
  a4a9be:	48 8d 1c 07          	lea    (%rdi,%rax,1),%rbx
  a4a9c2:	48 39 d9             	cmp    %rbx,%rcx
  a4a9c5:	0f 82 d4 01 00 00    	jb     a4ab9f <LZ4_decompress_safe_partial+0x25f>
  a4a9cb:	4c 8d 0c 06          	lea    (%rsi,%rax,1),%r9
  a4a9cf:	4d 39 f1             	cmp    %r14,%r9
  a4a9d2:	0f 87 c7 01 00 00    	ja     a4ab9f <LZ4_decompress_safe_partial+0x25f>
  a4a9d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4a9df:	00 
  a4a9e0:	48 8b 06             	mov    (%rsi),%rax
  a4a9e3:	48 83 c7 08          	add    $0x8,%rdi
  a4a9e7:	48 83 c6 08          	add    $0x8,%rsi
  a4a9eb:	48 89 47 f8          	mov    %rax,-0x8(%rdi)
  a4a9ef:	48 39 df             	cmp    %rbx,%rdi
  a4a9f2:	72 ec                	jb     a4a9e0 <LZ4_decompress_safe_partial+0xa0>
  a4a9f4:	41 0f b7 31          	movzwl (%r9),%esi
  a4a9f8:	48 89 d8             	mov    %rbx,%rax
  a4a9fb:	49 83 c1 02          	add    $0x2,%r9
  a4a9ff:	48 29 f0             	sub    %rsi,%rax
  a4aa02:	48 39 c5             	cmp    %rax,%rbp
  a4aa05:	0f 87 a4 00 00 00    	ja     a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4aa0b:	89 d7                	mov    %edx,%edi
  a4aa0d:	89 33                	mov    %esi,(%rbx)
  a4aa0f:	83 e2 0f             	and    $0xf,%edx
  a4aa12:	83 e7 0f             	and    $0xf,%edi
  a4aa15:	40 80 ff 0f          	cmp    $0xf,%dil
  a4aa19:	74 65                	je     a4aa80 <LZ4_decompress_safe_partial+0x140>
  a4aa1b:	48 83 c2 04          	add    $0x4,%rdx
  a4aa1f:	48 8d 3c 13          	lea    (%rbx,%rdx,1),%rdi
  a4aa23:	48 83 fe 07          	cmp    $0x7,%rsi
  a4aa27:	0f 86 cd 00 00 00    	jbe    a4aafa <LZ4_decompress_safe_partial+0x1ba>
  a4aa2d:	48 8b 30             	mov    (%rax),%rsi
  a4aa30:	48 83 c0 08          	add    $0x8,%rax
  a4aa34:	48 89 33             	mov    %rsi,(%rbx)
  a4aa37:	49 39 fb             	cmp    %rdi,%r11
  a4aa3a:	0f 82 08 01 00 00    	jb     a4ab48 <LZ4_decompress_safe_partial+0x208>
  a4aa40:	48 8b 30             	mov    (%rax),%rsi
  a4aa43:	48 89 73 08          	mov    %rsi,0x8(%rbx)
  a4aa47:	48 83 fa 10          	cmp    $0x10,%rdx
  a4aa4b:	0f 86 51 ff ff ff    	jbe    a4a9a2 <LZ4_decompress_safe_partial+0x62>
  a4aa51:	48 83 c0 08          	add    $0x8,%rax
  a4aa55:	48 83 c3 10          	add    $0x10,%rbx
  a4aa59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4aa60:	48 8b 10             	mov    (%rax),%rdx
  a4aa63:	48 83 c3 08          	add    $0x8,%rbx
  a4aa67:	48 83 c0 08          	add    $0x8,%rax
  a4aa6b:	48 89 53 f8          	mov    %rdx,-0x8(%rbx)
  a4aa6f:	48 39 df             	cmp    %rbx,%rdi
  a4aa72:	77 ec                	ja     a4aa60 <LZ4_decompress_safe_partial+0x120>
  a4aa74:	e9 29 ff ff ff       	jmpq   a4a9a2 <LZ4_decompress_safe_partial+0x62>
  a4aa79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4aa80:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4aa85:	eb 1a                	jmp    a4aaa1 <LZ4_decompress_safe_partial+0x161>
  a4aa87:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4aa8e:	00 00 
  a4aa90:	44 0f b6 ff          	movzbl %dil,%r15d
  a4aa94:	4c 01 fa             	add    %r15,%rdx
  a4aa97:	40 80 ff ff          	cmp    $0xff,%dil
  a4aa9b:	0f 85 ed 00 00 00    	jne    a4ab8e <LZ4_decompress_safe_partial+0x24e>
  a4aaa1:	49 83 c1 01          	add    $0x1,%r9
  a4aaa5:	41 0f b6 79 ff       	movzbl -0x1(%r9),%edi
  a4aaaa:	4d 39 cd             	cmp    %r9,%r13
  a4aaad:	75 e1                	jne    a4aa90 <LZ4_decompress_safe_partial+0x150>
  a4aaaf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4aab4:	48 83 c4 28          	add    $0x28,%rsp
  a4aab8:	5b                   	pop    %rbx
  a4aab9:	5d                   	pop    %rbp
  a4aaba:	41 5c                	pop    %r12
  a4aabc:	41 5d                	pop    %r13
  a4aabe:	41 5e                	pop    %r14
  a4aac0:	41 5f                	pop    %r15
  a4aac2:	c3                   	retq   
  a4aac3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4aac8:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4aacd:	eb 06                	jmp    a4aad5 <LZ4_decompress_safe_partial+0x195>
  a4aacf:	90                   	nop
  a4aad0:	80 fb ff             	cmp    $0xff,%bl
  a4aad3:	75 0f                	jne    a4aae4 <LZ4_decompress_safe_partial+0x1a4>
  a4aad5:	0f b6 1e             	movzbl (%rsi),%ebx
  a4aad8:	48 83 c6 01          	add    $0x1,%rsi
  a4aadc:	48 01 d8             	add    %rbx,%rax
  a4aadf:	4c 39 c6             	cmp    %r8,%rsi
  a4aae2:	72 ec                	jb     a4aad0 <LZ4_decompress_safe_partial+0x190>
  a4aae4:	48 89 fb             	mov    %rdi,%rbx
  a4aae7:	48 01 c3             	add    %rax,%rbx
  a4aaea:	72 c3                	jb     a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4aaec:	49 89 f7             	mov    %rsi,%r15
  a4aaef:	49 01 c7             	add    %rax,%r15
  a4aaf2:	0f 83 ca fe ff ff    	jae    a4a9c2 <LZ4_decompress_safe_partial+0x82>
  a4aaf8:	eb b5                	jmp    a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4aafa:	44 0f b6 38          	movzbl (%rax),%r15d
  a4aafe:	44 88 3b             	mov    %r15b,(%rbx)
  a4ab01:	44 0f b6 78 01       	movzbl 0x1(%rax),%r15d
  a4ab06:	44 88 7b 01          	mov    %r15b,0x1(%rbx)
  a4ab0a:	44 0f b6 78 02       	movzbl 0x2(%rax),%r15d
  a4ab0f:	44 88 7b 02          	mov    %r15b,0x2(%rbx)
  a4ab13:	44 0f b6 78 03       	movzbl 0x3(%rax),%r15d
  a4ab18:	44 88 7b 03          	mov    %r15b,0x3(%rbx)
  a4ab1c:	4c 8d 3d 7d 94 00 00 	lea    0x947d(%rip),%r15        # a53fa0 <dec32table.3>
  a4ab23:	45 8b 3c b7          	mov    (%r15,%rsi,4),%r15d
  a4ab27:	4c 01 f8             	add    %r15,%rax
  a4ab2a:	44 8b 38             	mov    (%rax),%r15d
  a4ab2d:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
  a4ab31:	4c 8d 3d 88 94 00 00 	lea    0x9488(%rip),%r15        # a53fc0 <dec64table.4>
  a4ab38:	49 63 34 b7          	movslq (%r15,%rsi,4),%rsi
  a4ab3c:	48 29 f0             	sub    %rsi,%rax
  a4ab3f:	49 39 fb             	cmp    %rdi,%r11
  a4ab42:	0f 83 f8 fe ff ff    	jae    a4aa40 <LZ4_decompress_safe_partial+0x100>
  a4ab48:	48 3b 7c 24 10       	cmp    0x10(%rsp),%rdi
  a4ab4d:	0f 87 5c ff ff ff    	ja     a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4ab53:	48 83 c3 08          	add    $0x8,%rbx
  a4ab57:	48 3b 5c 24 08       	cmp    0x8(%rsp),%rbx
  a4ab5c:	0f 82 86 00 00 00    	jb     a4abe8 <LZ4_decompress_safe_partial+0x2a8>
  a4ab62:	48 39 df             	cmp    %rbx,%rdi
  a4ab65:	0f 86 37 fe ff ff    	jbe    a4a9a2 <LZ4_decompress_safe_partial+0x62>
  a4ab6b:	49 89 ff             	mov    %rdi,%r15
  a4ab6e:	31 d2                	xor    %edx,%edx
  a4ab70:	49 29 df             	sub    %rbx,%r15
  a4ab73:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4ab78:	0f b6 34 10          	movzbl (%rax,%rdx,1),%esi
  a4ab7c:	40 88 34 13          	mov    %sil,(%rbx,%rdx,1)
  a4ab80:	48 83 c2 01          	add    $0x1,%rdx
  a4ab84:	49 39 d7             	cmp    %rdx,%r15
  a4ab87:	75 ef                	jne    a4ab78 <LZ4_decompress_safe_partial+0x238>
  a4ab89:	e9 14 fe ff ff       	jmpq   a4a9a2 <LZ4_decompress_safe_partial+0x62>
  a4ab8e:	48 89 df             	mov    %rbx,%rdi
  a4ab91:	48 01 d7             	add    %rdx,%rdi
  a4ab94:	0f 83 81 fe ff ff    	jae    a4aa1b <LZ4_decompress_safe_partial+0xdb>
  a4ab9a:	e9 10 ff ff ff       	jmpq   a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4ab9f:	48 89 c2             	mov    %rax,%rdx
  a4aba2:	49 39 da             	cmp    %rbx,%r10
  a4aba5:	0f 82 04 ff ff ff    	jb     a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4abab:	48 01 f0             	add    %rsi,%rax
  a4abae:	49 39 c4             	cmp    %rax,%r12
  a4abb1:	0f 82 f8 fe ff ff    	jb     a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4abb7:	e8 04 31 00 00       	callq  a4dcc0 <memcpy>
  a4abbc:	89 d8                	mov    %ebx,%eax
  a4abbe:	48 83 c4 28          	add    $0x28,%rsp
  a4abc2:	29 e8                	sub    %ebp,%eax
  a4abc4:	5b                   	pop    %rbx
  a4abc5:	5d                   	pop    %rbp
  a4abc6:	41 5c                	pop    %r12
  a4abc8:	41 5d                	pop    %r13
  a4abca:	41 5e                	pop    %r14
  a4abcc:	41 5f                	pop    %r15
  a4abce:	c3                   	retq   
  a4abcf:	83 fa 01             	cmp    $0x1,%edx
  a4abd2:	0f 85 d7 fe ff ff    	jne    a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4abd8:	31 c0                	xor    %eax,%eax
  a4abda:	80 3f 00             	cmpb   $0x0,(%rdi)
  a4abdd:	0f 84 d1 fe ff ff    	je     a4aab4 <LZ4_decompress_safe_partial+0x174>
  a4abe3:	e9 c7 fe ff ff       	jmpq   a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4abe8:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  a4abed:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
  a4abf2:	48 89 c6             	mov    %rax,%rsi
  a4abf5:	48 89 da             	mov    %rbx,%rdx
  a4abf8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4abff:	00 
  a4ac00:	48 8b 06             	mov    (%rsi),%rax
  a4ac03:	48 83 c2 08          	add    $0x8,%rdx
  a4ac07:	48 83 c6 08          	add    $0x8,%rsi
  a4ac0b:	48 89 42 f8          	mov    %rax,-0x8(%rdx)
  a4ac0f:	49 39 d7             	cmp    %rdx,%r15
  a4ac12:	77 ec                	ja     a4ac00 <LZ4_decompress_safe_partial+0x2c0>
  a4ac14:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  a4ac19:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  a4ac1e:	48 89 f2             	mov    %rsi,%rdx
  a4ac21:	48 29 da             	sub    %rbx,%rdx
  a4ac24:	48 89 f3             	mov    %rsi,%rbx
  a4ac27:	48 01 d0             	add    %rdx,%rax
  a4ac2a:	e9 33 ff ff ff       	jmpq   a4ab62 <LZ4_decompress_safe_partial+0x222>
  a4ac2f:	90                   	nop

0000000000a4ac30 <LZ4_decompress_fast>:
  a4ac30:	f3 0f 1e fa          	endbr64 
  a4ac34:	41 57                	push   %r15
  a4ac36:	4c 63 da             	movslq %edx,%r11
  a4ac39:	41 56                	push   %r14
  a4ac3b:	49 01 f3             	add    %rsi,%r11
  a4ac3e:	41 55                	push   %r13
  a4ac40:	41 54                	push   %r12
  a4ac42:	49 89 fc             	mov    %rdi,%r12
  a4ac45:	48 89 f7             	mov    %rsi,%rdi
  a4ac48:	55                   	push   %rbp
  a4ac49:	53                   	push   %rbx
  a4ac4a:	48 83 ec 08          	sub    $0x8,%rsp
  a4ac4e:	41 0f b6 34 24       	movzbl (%r12),%esi
  a4ac53:	85 d2                	test   %edx,%edx
  a4ac55:	0f 84 17 02 00 00    	je     a4ae72 <LZ4_decompress_fast+0x242>
  a4ac5b:	4d 8d 43 f8          	lea    -0x8(%r11),%r8
  a4ac5f:	4c 89 e5             	mov    %r12,%rbp
  a4ac62:	4d 8d 4b f4          	lea    -0xc(%r11),%r9
  a4ac66:	4c 8d 3d 53 93 00 00 	lea    0x9353(%rip),%r15        # a53fc0 <dec64table.4>
  a4ac6d:	4c 8d 35 2c 93 00 00 	lea    0x932c(%rip),%r14        # a53fa0 <dec32table.3>
  a4ac74:	4d 8d 53 f9          	lea    -0x7(%r11),%r10
  a4ac78:	4d 8d 6b fb          	lea    -0x5(%r11),%r13
  a4ac7c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4ac80:	40 0f b6 c6          	movzbl %sil,%eax
  a4ac84:	48 83 c5 01          	add    $0x1,%rbp
  a4ac88:	c1 e8 04             	shr    $0x4,%eax
  a4ac8b:	89 c3                	mov    %eax,%ebx
  a4ac8d:	83 f8 0f             	cmp    $0xf,%eax
  a4ac90:	0f 84 ba 00 00 00    	je     a4ad50 <LZ4_decompress_fast+0x120>
  a4ac96:	48 8d 14 1f          	lea    (%rdi,%rbx,1),%rdx
  a4ac9a:	4c 39 c2             	cmp    %r8,%rdx
  a4ac9d:	0f 87 d2 00 00 00    	ja     a4ad75 <LZ4_decompress_fast+0x145>
  a4aca3:	48 89 e8             	mov    %rbp,%rax
  a4aca6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4acad:	00 00 00 
  a4acb0:	48 8b 08             	mov    (%rax),%rcx
  a4acb3:	48 83 c7 08          	add    $0x8,%rdi
  a4acb7:	48 83 c0 08          	add    $0x8,%rax
  a4acbb:	48 89 4f f8          	mov    %rcx,-0x8(%rdi)
  a4acbf:	48 39 fa             	cmp    %rdi,%rdx
  a4acc2:	77 ec                	ja     a4acb0 <LZ4_decompress_fast+0x80>
  a4acc4:	48 01 dd             	add    %rbx,%rbp
  a4acc7:	89 f7                	mov    %esi,%edi
  a4acc9:	48 89 d0             	mov    %rdx,%rax
  a4accc:	83 e6 0f             	and    $0xf,%esi
  a4accf:	0f b7 4d 00          	movzwl 0x0(%rbp),%ecx
  a4acd3:	83 e7 0f             	and    $0xf,%edi
  a4acd6:	48 83 c5 02          	add    $0x2,%rbp
  a4acda:	89 0a                	mov    %ecx,(%rdx)
  a4acdc:	48 29 c8             	sub    %rcx,%rax
  a4acdf:	40 80 ff 0f          	cmp    $0xf,%dil
  a4ace3:	0f 84 b7 00 00 00    	je     a4ada0 <LZ4_decompress_fast+0x170>
  a4ace9:	48 83 c6 04          	add    $0x4,%rsi
  a4aced:	48 8d 3c 32          	lea    (%rdx,%rsi,1),%rdi
  a4acf1:	48 83 f9 07          	cmp    $0x7,%rcx
  a4acf5:	0f 86 d5 00 00 00    	jbe    a4add0 <LZ4_decompress_fast+0x1a0>
  a4acfb:	48 8b 08             	mov    (%rax),%rcx
  a4acfe:	48 83 c0 08          	add    $0x8,%rax
  a4ad02:	48 89 0a             	mov    %rcx,(%rdx)
  a4ad05:	4c 39 cf             	cmp    %r9,%rdi
  a4ad08:	0f 87 02 01 00 00    	ja     a4ae10 <LZ4_decompress_fast+0x1e0>
  a4ad0e:	48 8b 08             	mov    (%rax),%rcx
  a4ad11:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  a4ad15:	48 83 fe 10          	cmp    $0x10,%rsi
  a4ad19:	77 0d                	ja     a4ad28 <LZ4_decompress_fast+0xf8>
  a4ad1b:	0f b6 75 00          	movzbl 0x0(%rbp),%esi
  a4ad1f:	e9 5c ff ff ff       	jmpq   a4ac80 <LZ4_decompress_fast+0x50>
  a4ad24:	0f 1f 40 00          	nopl   0x0(%rax)
  a4ad28:	48 83 c0 08          	add    $0x8,%rax
  a4ad2c:	48 83 c2 10          	add    $0x10,%rdx
  a4ad30:	48 8b 08             	mov    (%rax),%rcx
  a4ad33:	48 83 c2 08          	add    $0x8,%rdx
  a4ad37:	48 83 c0 08          	add    $0x8,%rax
  a4ad3b:	48 89 4a f8          	mov    %rcx,-0x8(%rdx)
  a4ad3f:	48 39 d7             	cmp    %rdx,%rdi
  a4ad42:	77 ec                	ja     a4ad30 <LZ4_decompress_fast+0x100>
  a4ad44:	eb d5                	jmp    a4ad1b <LZ4_decompress_fast+0xeb>
  a4ad46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4ad4d:	00 00 00 
  a4ad50:	bb 0f 00 00 00       	mov    $0xf,%ebx
  a4ad55:	0f 1f 00             	nopl   (%rax)
  a4ad58:	0f b6 55 00          	movzbl 0x0(%rbp),%edx
  a4ad5c:	48 83 c5 01          	add    $0x1,%rbp
  a4ad60:	48 01 d3             	add    %rdx,%rbx
  a4ad63:	80 fa ff             	cmp    $0xff,%dl
  a4ad66:	74 f0                	je     a4ad58 <LZ4_decompress_fast+0x128>
  a4ad68:	48 8d 14 1f          	lea    (%rdi,%rbx,1),%rdx
  a4ad6c:	4c 39 c2             	cmp    %r8,%rdx
  a4ad6f:	0f 86 2e ff ff ff    	jbe    a4aca3 <LZ4_decompress_fast+0x73>
  a4ad75:	49 39 d3             	cmp    %rdx,%r11
  a4ad78:	0f 85 02 01 00 00    	jne    a4ae80 <LZ4_decompress_fast+0x250>
  a4ad7e:	48 89 da             	mov    %rbx,%rdx
  a4ad81:	48 89 ee             	mov    %rbp,%rsi
  a4ad84:	e8 37 2f 00 00       	callq  a4dcc0 <memcpy>
  a4ad89:	48 8d 44 1d 00       	lea    0x0(%rbp,%rbx,1),%rax
  a4ad8e:	44 29 e0             	sub    %r12d,%eax
  a4ad91:	48 83 c4 08          	add    $0x8,%rsp
  a4ad95:	5b                   	pop    %rbx
  a4ad96:	5d                   	pop    %rbp
  a4ad97:	41 5c                	pop    %r12
  a4ad99:	41 5d                	pop    %r13
  a4ad9b:	41 5e                	pop    %r14
  a4ad9d:	41 5f                	pop    %r15
  a4ad9f:	c3                   	retq   
  a4ada0:	be 0f 00 00 00       	mov    $0xf,%esi
  a4ada5:	0f 1f 00             	nopl   (%rax)
  a4ada8:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  a4adac:	48 83 c5 01          	add    $0x1,%rbp
  a4adb0:	48 01 de             	add    %rbx,%rsi
  a4adb3:	80 fb ff             	cmp    $0xff,%bl
  a4adb6:	74 f0                	je     a4ada8 <LZ4_decompress_fast+0x178>
  a4adb8:	48 83 c6 04          	add    $0x4,%rsi
  a4adbc:	48 8d 3c 32          	lea    (%rdx,%rsi,1),%rdi
  a4adc0:	48 83 f9 07          	cmp    $0x7,%rcx
  a4adc4:	0f 87 31 ff ff ff    	ja     a4acfb <LZ4_decompress_fast+0xcb>
  a4adca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4add0:	0f b6 18             	movzbl (%rax),%ebx
  a4add3:	88 1a                	mov    %bl,(%rdx)
  a4add5:	0f b6 58 01          	movzbl 0x1(%rax),%ebx
  a4add9:	88 5a 01             	mov    %bl,0x1(%rdx)
  a4addc:	0f b6 58 02          	movzbl 0x2(%rax),%ebx
  a4ade0:	88 5a 02             	mov    %bl,0x2(%rdx)
  a4ade3:	0f b6 58 03          	movzbl 0x3(%rax),%ebx
  a4ade7:	88 5a 03             	mov    %bl,0x3(%rdx)
  a4adea:	41 8b 1c 8e          	mov    (%r14,%rcx,4),%ebx
  a4adee:	49 63 0c 8f          	movslq (%r15,%rcx,4),%rcx
  a4adf2:	48 01 d8             	add    %rbx,%rax
  a4adf5:	8b 18                	mov    (%rax),%ebx
  a4adf7:	48 29 c8             	sub    %rcx,%rax
  a4adfa:	89 5a 04             	mov    %ebx,0x4(%rdx)
  a4adfd:	4c 39 cf             	cmp    %r9,%rdi
  a4ae00:	0f 86 08 ff ff ff    	jbe    a4ad0e <LZ4_decompress_fast+0xde>
  a4ae06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4ae0d:	00 00 00 
  a4ae10:	4c 39 ef             	cmp    %r13,%rdi
  a4ae13:	77 6b                	ja     a4ae80 <LZ4_decompress_fast+0x250>
  a4ae15:	48 83 c2 08          	add    $0x8,%rdx
  a4ae19:	4c 39 d2             	cmp    %r10,%rdx
  a4ae1c:	72 28                	jb     a4ae46 <LZ4_decompress_fast+0x216>
  a4ae1e:	48 39 d7             	cmp    %rdx,%rdi
  a4ae21:	0f 86 f4 fe ff ff    	jbe    a4ad1b <LZ4_decompress_fast+0xeb>
  a4ae27:	48 89 fb             	mov    %rdi,%rbx
  a4ae2a:	31 c9                	xor    %ecx,%ecx
  a4ae2c:	48 29 d3             	sub    %rdx,%rbx
  a4ae2f:	90                   	nop
  a4ae30:	0f b6 34 08          	movzbl (%rax,%rcx,1),%esi
  a4ae34:	40 88 34 0a          	mov    %sil,(%rdx,%rcx,1)
  a4ae38:	48 83 c1 01          	add    $0x1,%rcx
  a4ae3c:	48 39 cb             	cmp    %rcx,%rbx
  a4ae3f:	75 ef                	jne    a4ae30 <LZ4_decompress_fast+0x200>
  a4ae41:	e9 d5 fe ff ff       	jmpq   a4ad1b <LZ4_decompress_fast+0xeb>
  a4ae46:	48 89 c6             	mov    %rax,%rsi
  a4ae49:	48 89 d1             	mov    %rdx,%rcx
  a4ae4c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4ae50:	48 8b 1e             	mov    (%rsi),%rbx
  a4ae53:	48 83 c1 08          	add    $0x8,%rcx
  a4ae57:	48 83 c6 08          	add    $0x8,%rsi
  a4ae5b:	48 89 59 f8          	mov    %rbx,-0x8(%rcx)
  a4ae5f:	49 39 ca             	cmp    %rcx,%r10
  a4ae62:	77 ec                	ja     a4ae50 <LZ4_decompress_fast+0x220>
  a4ae64:	4c 89 d1             	mov    %r10,%rcx
  a4ae67:	48 29 d1             	sub    %rdx,%rcx
  a4ae6a:	4c 89 d2             	mov    %r10,%rdx
  a4ae6d:	48 01 c8             	add    %rcx,%rax
  a4ae70:	eb ac                	jmp    a4ae1e <LZ4_decompress_fast+0x1ee>
  a4ae72:	b8 01 00 00 00       	mov    $0x1,%eax
  a4ae77:	40 84 f6             	test   %sil,%sil
  a4ae7a:	0f 84 11 ff ff ff    	je     a4ad91 <LZ4_decompress_fast+0x161>
  a4ae80:	48 83 c4 08          	add    $0x8,%rsp
  a4ae84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4ae89:	5b                   	pop    %rbx
  a4ae8a:	5d                   	pop    %rbp
  a4ae8b:	41 5c                	pop    %r12
  a4ae8d:	41 5d                	pop    %r13
  a4ae8f:	41 5e                	pop    %r14
  a4ae91:	41 5f                	pop    %r15
  a4ae93:	c3                   	retq   
  a4ae94:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4ae9b:	00 00 00 00 
  a4ae9f:	90                   	nop

0000000000a4aea0 <LZ4_setStreamDecode>:
  a4aea0:	f3 0f 1e fa          	endbr64 
  a4aea4:	48 63 d2             	movslq %edx,%rdx
  a4aea7:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
  a4aeae:	b8 01 00 00 00       	mov    $0x1,%eax
  a4aeb3:	48 89 57 18          	mov    %rdx,0x18(%rdi)
  a4aeb7:	48 01 f2             	add    %rsi,%rdx
  a4aeba:	48 89 57 10          	mov    %rdx,0x10(%rdi)
  a4aebe:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
  a4aec5:	00 
  a4aec6:	c3                   	retq   
  a4aec7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4aece:	00 00 

0000000000a4aed0 <LZ4_decompress_safe_continue>:
  a4aed0:	f3 0f 1e fa          	endbr64 
  a4aed4:	41 57                	push   %r15
  a4aed6:	49 89 d7             	mov    %rdx,%r15
  a4aed9:	4c 63 d1             	movslq %ecx,%r10
  a4aedc:	49 63 c8             	movslq %r8d,%rcx
  a4aedf:	41 56                	push   %r14
  a4aee1:	4d 89 f9             	mov    %r15,%r9
  a4aee4:	4c 89 d0             	mov    %r10,%rax
  a4aee7:	4c 01 f9             	add    %r15,%rcx
  a4aeea:	41 55                	push   %r13
  a4aeec:	49 01 f2             	add    %rsi,%r10
  a4aeef:	41 54                	push   %r12
  a4aef1:	55                   	push   %rbp
  a4aef2:	53                   	push   %rbx
  a4aef3:	48 89 f3             	mov    %rsi,%rbx
  a4aef6:	48 83 ec 48          	sub    $0x48,%rsp
  a4aefa:	4c 8b 5f 18          	mov    0x18(%rdi),%r11
  a4aefe:	4c 8b 6f 10          	mov    0x10(%rdi),%r13
  a4af02:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  a4af07:	4c 89 da             	mov    %r11,%rdx
  a4af0a:	4d 29 d9             	sub    %r11,%r9
  a4af0d:	48 f7 da             	neg    %rdx
  a4af10:	4d 39 fd             	cmp    %r15,%r13
  a4af13:	0f 84 87 02 00 00    	je     a4b1a0 <LZ4_decompress_safe_continue+0x2d0>
  a4af19:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  a4af1e:	4c 01 ea             	add    %r13,%rdx
  a4af21:	4c 89 fd             	mov    %r15,%rbp
  a4af24:	48 89 16             	mov    %rdx,(%rsi)
  a4af27:	48 8d 51 f9          	lea    -0x7(%rcx),%rdx
  a4af2b:	4c 89 5e 08          	mov    %r11,0x8(%rsi)
  a4af2f:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
  a4af34:	45 85 c0             	test   %r8d,%r8d
  a4af37:	0f 84 98 05 00 00    	je     a4b4d5 <LZ4_decompress_safe_continue+0x605>
  a4af3d:	49 89 cc             	mov    %rcx,%r12
  a4af40:	4d 89 d6             	mov    %r10,%r14
  a4af43:	4c 89 e9             	mov    %r13,%rcx
  a4af46:	4d 89 dd             	mov    %r11,%r13
  a4af49:	0f b6 3b             	movzbl (%rbx),%edi
  a4af4c:	48 8d 73 01          	lea    0x1(%rbx),%rsi
  a4af50:	89 fa                	mov    %edi,%edx
  a4af52:	c1 ef 04             	shr    $0x4,%edi
  a4af55:	89 f8                	mov    %edi,%eax
  a4af57:	83 ff 0f             	cmp    $0xf,%edi
  a4af5a:	0f 84 d8 01 00 00    	je     a4b138 <LZ4_decompress_safe_continue+0x268>
  a4af60:	48 8d 7c 05 00       	lea    0x0(%rbp,%rax,1),%rdi
  a4af65:	48 8d 1c 06          	lea    (%rsi,%rax,1),%rbx
  a4af69:	4d 8d 54 24 f4       	lea    -0xc(%r12),%r10
  a4af6e:	49 39 fa             	cmp    %rdi,%r10
  a4af71:	0f 82 03 05 00 00    	jb     a4b47a <LZ4_decompress_safe_continue+0x5aa>
  a4af77:	4d 8d 46 f8          	lea    -0x8(%r14),%r8
  a4af7b:	4c 39 c3             	cmp    %r8,%rbx
  a4af7e:	0f 87 f6 04 00 00    	ja     a4b47a <LZ4_decompress_safe_continue+0x5aa>
  a4af84:	0f 1f 40 00          	nopl   0x0(%rax)
  a4af88:	48 8b 06             	mov    (%rsi),%rax
  a4af8b:	48 83 c5 08          	add    $0x8,%rbp
  a4af8f:	48 83 c6 08          	add    $0x8,%rsi
  a4af93:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  a4af97:	48 39 fd             	cmp    %rdi,%rbp
  a4af9a:	72 ec                	jb     a4af88 <LZ4_decompress_safe_continue+0xb8>
  a4af9c:	0f b7 33             	movzwl (%rbx),%esi
  a4af9f:	49 89 fb             	mov    %rdi,%r11
  a4afa2:	48 83 c3 02          	add    $0x2,%rbx
  a4afa6:	48 89 f0             	mov    %rsi,%rax
  a4afa9:	49 29 f3             	sub    %rsi,%r11
  a4afac:	49 81 fd ff ff 00 00 	cmp    $0xffff,%r13
  a4afb3:	77 09                	ja     a4afbe <LZ4_decompress_safe_continue+0xee>
  a4afb5:	4d 39 cb             	cmp    %r9,%r11
  a4afb8:	0f 82 3e 01 00 00    	jb     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4afbe:	89 07                	mov    %eax,(%rdi)
  a4afc0:	89 d0                	mov    %edx,%eax
  a4afc2:	83 e2 0f             	and    $0xf,%edx
  a4afc5:	83 e0 0f             	and    $0xf,%eax
  a4afc8:	3c 0f                	cmp    $0xf,%al
  a4afca:	0f 84 00 01 00 00    	je     a4b0d0 <LZ4_decompress_safe_continue+0x200>
  a4afd0:	48 83 c2 04          	add    $0x4,%rdx
  a4afd4:	48 8d 2c 17          	lea    (%rdi,%rdx,1),%rbp
  a4afd8:	4d 39 df             	cmp    %r11,%r15
  a4afdb:	0f 86 8f 00 00 00    	jbe    a4b070 <LZ4_decompress_safe_continue+0x1a0>
  a4afe1:	49 8d 44 24 fb       	lea    -0x5(%r12),%rax
  a4afe6:	48 39 c5             	cmp    %rax,%rbp
  a4afe9:	0f 87 0d 01 00 00    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4afef:	4d 89 fa             	mov    %r15,%r10
  a4aff2:	48 89 ce             	mov    %rcx,%rsi
  a4aff5:	4d 29 da             	sub    %r11,%r10
  a4aff8:	4c 29 d6             	sub    %r10,%rsi
  a4affb:	4c 39 d2             	cmp    %r10,%rdx
  a4affe:	0f 86 74 01 00 00    	jbe    a4b178 <LZ4_decompress_safe_continue+0x2a8>
  a4b004:	4c 29 d2             	sub    %r10,%rdx
  a4b007:	4c 89 4c 24 28       	mov    %r9,0x28(%rsp)
  a4b00c:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
  a4b011:	4c 89 d2             	mov    %r10,%rdx
  a4b014:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
  a4b019:	4c 89 54 24 10       	mov    %r10,0x10(%rsp)
  a4b01e:	e8 9d 2c 00 00       	callq  a4dcc0 <memcpy>
  a4b023:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
  a4b028:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
  a4b02d:	48 89 c7             	mov    %rax,%rdi
  a4b030:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
  a4b035:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
  a4b03a:	4c 01 d7             	add    %r10,%rdi
  a4b03d:	48 89 f8             	mov    %rdi,%rax
  a4b040:	4c 29 f8             	sub    %r15,%rax
  a4b043:	49 39 c0             	cmp    %rax,%r8
  a4b046:	0f 86 c4 00 00 00    	jbe    a4b110 <LZ4_decompress_safe_continue+0x240>
  a4b04c:	48 39 fd             	cmp    %rdi,%rbp
  a4b04f:	0f 86 20 05 00 00    	jbe    a4b575 <LZ4_decompress_safe_continue+0x6a5>
  a4b055:	31 c0                	xor    %eax,%eax
  a4b057:	41 0f b6 14 07       	movzbl (%r15,%rax,1),%edx
  a4b05c:	88 14 07             	mov    %dl,(%rdi,%rax,1)
  a4b05f:	48 83 c0 01          	add    $0x1,%rax
  a4b063:	4c 39 c0             	cmp    %r8,%rax
  a4b066:	75 ef                	jne    a4b057 <LZ4_decompress_safe_continue+0x187>
  a4b068:	e9 dc fe ff ff       	jmpq   a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b06d:	0f 1f 00             	nopl   (%rax)
  a4b070:	48 83 fe 07          	cmp    $0x7,%rsi
  a4b074:	0f 86 bc 03 00 00    	jbe    a4b436 <LZ4_decompress_safe_continue+0x566>
  a4b07a:	49 8b 03             	mov    (%r11),%rax
  a4b07d:	49 83 c3 08          	add    $0x8,%r11
  a4b081:	48 89 07             	mov    %rax,(%rdi)
  a4b084:	49 39 ea             	cmp    %rbp,%r10
  a4b087:	0f 82 5e 03 00 00    	jb     a4b3eb <LZ4_decompress_safe_continue+0x51b>
  a4b08d:	49 8b 03             	mov    (%r11),%rax
  a4b090:	48 89 47 08          	mov    %rax,0x8(%rdi)
  a4b094:	48 83 fa 10          	cmp    $0x10,%rdx
  a4b098:	0f 86 ab fe ff ff    	jbe    a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b09e:	49 8d 43 08          	lea    0x8(%r11),%rax
  a4b0a2:	48 83 c7 10          	add    $0x10,%rdi
  a4b0a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4b0ad:	00 00 00 
  a4b0b0:	48 8b 10             	mov    (%rax),%rdx
  a4b0b3:	48 83 c7 08          	add    $0x8,%rdi
  a4b0b7:	48 83 c0 08          	add    $0x8,%rax
  a4b0bb:	48 89 57 f8          	mov    %rdx,-0x8(%rdi)
  a4b0bf:	48 39 fd             	cmp    %rdi,%rbp
  a4b0c2:	77 ec                	ja     a4b0b0 <LZ4_decompress_safe_continue+0x1e0>
  a4b0c4:	e9 80 fe ff ff       	jmpq   a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b0c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4b0d0:	49 8d 6e fc          	lea    -0x4(%r14),%rbp
  a4b0d4:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4b0d9:	eb 14                	jmp    a4b0ef <LZ4_decompress_safe_continue+0x21f>
  a4b0db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4b0e0:	44 0f b6 c0          	movzbl %al,%r8d
  a4b0e4:	4c 01 c2             	add    %r8,%rdx
  a4b0e7:	3c ff                	cmp    $0xff,%al
  a4b0e9:	0f 85 b1 02 00 00    	jne    a4b3a0 <LZ4_decompress_safe_continue+0x4d0>
  a4b0ef:	48 83 c3 01          	add    $0x1,%rbx
  a4b0f3:	0f b6 43 ff          	movzbl -0x1(%rbx),%eax
  a4b0f7:	48 39 dd             	cmp    %rbx,%rbp
  a4b0fa:	75 e4                	jne    a4b0e0 <LZ4_decompress_safe_continue+0x210>
  a4b0fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4b101:	48 83 c4 48          	add    $0x48,%rsp
  a4b105:	5b                   	pop    %rbx
  a4b106:	5d                   	pop    %rbp
  a4b107:	41 5c                	pop    %r12
  a4b109:	41 5d                	pop    %r13
  a4b10b:	41 5e                	pop    %r14
  a4b10d:	41 5f                	pop    %r15
  a4b10f:	c3                   	retq   
  a4b110:	4c 89 c2             	mov    %r8,%rdx
  a4b113:	4c 89 fe             	mov    %r15,%rsi
  a4b116:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
  a4b11b:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
  a4b120:	e8 9b 2b 00 00       	callq  a4dcc0 <memcpy>
  a4b125:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  a4b12a:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
  a4b12f:	e9 15 fe ff ff       	jmpq   a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b134:	0f 1f 40 00          	nopl   0x0(%rax)
  a4b138:	4d 8d 56 f1          	lea    -0xf(%r14),%r10
  a4b13c:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4b141:	eb 0b                	jmp    a4b14e <LZ4_decompress_safe_continue+0x27e>
  a4b143:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4b148:	41 80 f8 ff          	cmp    $0xff,%r8b
  a4b14c:	75 10                	jne    a4b15e <LZ4_decompress_safe_continue+0x28e>
  a4b14e:	44 0f b6 06          	movzbl (%rsi),%r8d
  a4b152:	48 83 c6 01          	add    $0x1,%rsi
  a4b156:	4c 01 c0             	add    %r8,%rax
  a4b159:	4c 39 d6             	cmp    %r10,%rsi
  a4b15c:	72 ea                	jb     a4b148 <LZ4_decompress_safe_continue+0x278>
  a4b15e:	48 89 ef             	mov    %rbp,%rdi
  a4b161:	48 01 c7             	add    %rax,%rdi
  a4b164:	72 96                	jb     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b166:	48 89 f3             	mov    %rsi,%rbx
  a4b169:	48 01 c3             	add    %rax,%rbx
  a4b16c:	0f 83 f7 fd ff ff    	jae    a4af69 <LZ4_decompress_safe_continue+0x99>
  a4b172:	eb 88                	jmp    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b174:	0f 1f 40 00          	nopl   0x0(%rax)
  a4b178:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
  a4b17d:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
  a4b182:	e8 d9 2a 00 00       	callq  a4dc60 <memmove>
  a4b187:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  a4b18c:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
  a4b191:	e9 b3 fd ff ff       	jmpq   a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b196:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4b19d:	00 00 00 
  a4b1a0:	48 8b 17             	mov    (%rdi),%rdx
  a4b1a3:	4c 8b 67 08          	mov    0x8(%rdi),%r12
  a4b1a7:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
  a4b1ac:	4c 89 ca             	mov    %r9,%rdx
  a4b1af:	4c 29 e2             	sub    %r12,%rdx
  a4b1b2:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  a4b1b7:	48 8d 51 f9          	lea    -0x7(%rcx),%rdx
  a4b1bb:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
  a4b1c0:	45 85 c0             	test   %r8d,%r8d
  a4b1c3:	0f 84 39 04 00 00    	je     a4b602 <LZ4_decompress_safe_continue+0x732>
  a4b1c9:	4c 89 7c 24 38       	mov    %r15,0x38(%rsp)
  a4b1ce:	4c 89 cd             	mov    %r9,%rbp
  a4b1d1:	49 89 ce             	mov    %rcx,%r14
  a4b1d4:	4d 89 d7             	mov    %r10,%r15
  a4b1d7:	0f b6 0b             	movzbl (%rbx),%ecx
  a4b1da:	48 8d 73 01          	lea    0x1(%rbx),%rsi
  a4b1de:	89 ca                	mov    %ecx,%edx
  a4b1e0:	c1 e9 04             	shr    $0x4,%ecx
  a4b1e3:	89 c8                	mov    %ecx,%eax
  a4b1e5:	83 f9 0f             	cmp    $0xf,%ecx
  a4b1e8:	0f 84 6b 01 00 00    	je     a4b359 <LZ4_decompress_safe_continue+0x489>
  a4b1ee:	49 8d 7c 05 00       	lea    0x0(%r13,%rax,1),%rdi
  a4b1f3:	48 8d 1c 06          	lea    (%rsi,%rax,1),%rbx
  a4b1f7:	49 8d 4e f4          	lea    -0xc(%r14),%rcx
  a4b1fb:	48 39 f9             	cmp    %rdi,%rcx
  a4b1fe:	0f 82 79 03 00 00    	jb     a4b57d <LZ4_decompress_safe_continue+0x6ad>
  a4b204:	4d 8d 47 f8          	lea    -0x8(%r15),%r8
  a4b208:	4c 39 c3             	cmp    %r8,%rbx
  a4b20b:	0f 87 6c 03 00 00    	ja     a4b57d <LZ4_decompress_safe_continue+0x6ad>
  a4b211:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4b218:	48 8b 06             	mov    (%rsi),%rax
  a4b21b:	49 83 c5 08          	add    $0x8,%r13
  a4b21f:	48 83 c6 08          	add    $0x8,%rsi
  a4b223:	49 89 45 f8          	mov    %rax,-0x8(%r13)
  a4b227:	49 39 fd             	cmp    %rdi,%r13
  a4b22a:	72 ec                	jb     a4b218 <LZ4_decompress_safe_continue+0x348>
  a4b22c:	44 0f b7 03          	movzwl (%rbx),%r8d
  a4b230:	48 89 fe             	mov    %rdi,%rsi
  a4b233:	48 83 c3 02          	add    $0x2,%rbx
  a4b237:	4c 89 c0             	mov    %r8,%rax
  a4b23a:	4c 29 c6             	sub    %r8,%rsi
  a4b23d:	49 81 fc ff ff 00 00 	cmp    $0xffff,%r12
  a4b244:	77 0b                	ja     a4b251 <LZ4_decompress_safe_continue+0x381>
  a4b246:	48 39 74 24 10       	cmp    %rsi,0x10(%rsp)
  a4b24b:	0f 87 ab fe ff ff    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b251:	89 07                	mov    %eax,(%rdi)
  a4b253:	89 d0                	mov    %edx,%eax
  a4b255:	83 e2 0f             	and    $0xf,%edx
  a4b258:	83 e0 0f             	and    $0xf,%eax
  a4b25b:	3c 0f                	cmp    $0xf,%al
  a4b25d:	0f 84 4e 01 00 00    	je     a4b3b1 <LZ4_decompress_safe_continue+0x4e1>
  a4b263:	48 83 c2 04          	add    $0x4,%rdx
  a4b267:	4c 8d 2c 17          	lea    (%rdi,%rdx,1),%r13
  a4b26b:	48 39 ee             	cmp    %rbp,%rsi
  a4b26e:	0f 83 8c 00 00 00    	jae    a4b300 <LZ4_decompress_safe_continue+0x430>
  a4b274:	49 8d 46 fb          	lea    -0x5(%r14),%rax
  a4b278:	49 39 c5             	cmp    %rax,%r13
  a4b27b:	0f 87 7b fe ff ff    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b281:	48 89 e9             	mov    %rbp,%rcx
  a4b284:	48 29 f1             	sub    %rsi,%rcx
  a4b287:	4c 89 e6             	mov    %r12,%rsi
  a4b28a:	48 29 ce             	sub    %rcx,%rsi
  a4b28d:	48 03 74 24 18       	add    0x18(%rsp),%rsi
  a4b292:	48 39 ca             	cmp    %rcx,%rdx
  a4b295:	0f 86 46 01 00 00    	jbe    a4b3e1 <LZ4_decompress_safe_continue+0x511>
  a4b29b:	48 29 ca             	sub    %rcx,%rdx
  a4b29e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
  a4b2a3:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
  a4b2a8:	48 89 ca             	mov    %rcx,%rdx
  a4b2ab:	e8 10 2a 00 00       	callq  a4dcc0 <memcpy>
  a4b2b0:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
  a4b2b5:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
  a4b2ba:	48 89 c7             	mov    %rax,%rdi
  a4b2bd:	48 01 cf             	add    %rcx,%rdi
  a4b2c0:	48 89 f8             	mov    %rdi,%rax
  a4b2c3:	48 29 e8             	sub    %rbp,%rax
  a4b2c6:	49 39 c0             	cmp    %rax,%r8
  a4b2c9:	76 21                	jbe    a4b2ec <LZ4_decompress_safe_continue+0x41c>
  a4b2cb:	49 39 fd             	cmp    %rdi,%r13
  a4b2ce:	0f 86 47 03 00 00    	jbe    a4b61b <LZ4_decompress_safe_continue+0x74b>
  a4b2d4:	31 c0                	xor    %eax,%eax
  a4b2d6:	0f b6 54 05 00       	movzbl 0x0(%rbp,%rax,1),%edx
  a4b2db:	88 14 07             	mov    %dl,(%rdi,%rax,1)
  a4b2de:	48 83 c0 01          	add    $0x1,%rax
  a4b2e2:	49 39 c0             	cmp    %rax,%r8
  a4b2e5:	75 ef                	jne    a4b2d6 <LZ4_decompress_safe_continue+0x406>
  a4b2e7:	e9 eb fe ff ff       	jmpq   a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b2ec:	4c 89 c2             	mov    %r8,%rdx
  a4b2ef:	48 89 ee             	mov    %rbp,%rsi
  a4b2f2:	e8 c9 29 00 00       	callq  a4dcc0 <memcpy>
  a4b2f7:	e9 db fe ff ff       	jmpq   a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b2fc:	0f 1f 40 00          	nopl   0x0(%rax)
  a4b300:	49 83 f8 07          	cmp    $0x7,%r8
  a4b304:	0f 86 e3 01 00 00    	jbe    a4b4ed <LZ4_decompress_safe_continue+0x61d>
  a4b30a:	48 8b 06             	mov    (%rsi),%rax
  a4b30d:	48 83 c6 08          	add    $0x8,%rsi
  a4b311:	48 89 07             	mov    %rax,(%rdi)
  a4b314:	4c 39 e9             	cmp    %r13,%rcx
  a4b317:	0f 82 10 02 00 00    	jb     a4b52d <LZ4_decompress_safe_continue+0x65d>
  a4b31d:	48 8b 06             	mov    (%rsi),%rax
  a4b320:	48 89 47 08          	mov    %rax,0x8(%rdi)
  a4b324:	48 83 fa 10          	cmp    $0x10,%rdx
  a4b328:	0f 86 a9 fe ff ff    	jbe    a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b32e:	48 8d 46 08          	lea    0x8(%rsi),%rax
  a4b332:	48 83 c7 10          	add    $0x10,%rdi
  a4b336:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4b33d:	00 00 00 
  a4b340:	48 8b 10             	mov    (%rax),%rdx
  a4b343:	48 83 c7 08          	add    $0x8,%rdi
  a4b347:	48 83 c0 08          	add    $0x8,%rax
  a4b34b:	48 89 57 f8          	mov    %rdx,-0x8(%rdi)
  a4b34f:	4c 39 ef             	cmp    %r13,%rdi
  a4b352:	72 ec                	jb     a4b340 <LZ4_decompress_safe_continue+0x470>
  a4b354:	e9 7e fe ff ff       	jmpq   a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b359:	4d 8d 47 f1          	lea    -0xf(%r15),%r8
  a4b35d:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4b362:	eb 0a                	jmp    a4b36e <LZ4_decompress_safe_continue+0x49e>
  a4b364:	0f 1f 40 00          	nopl   0x0(%rax)
  a4b368:	40 80 ff ff          	cmp    $0xff,%dil
  a4b36c:	75 0f                	jne    a4b37d <LZ4_decompress_safe_continue+0x4ad>
  a4b36e:	0f b6 3e             	movzbl (%rsi),%edi
  a4b371:	48 83 c6 01          	add    $0x1,%rsi
  a4b375:	48 01 f8             	add    %rdi,%rax
  a4b378:	4c 39 c6             	cmp    %r8,%rsi
  a4b37b:	72 eb                	jb     a4b368 <LZ4_decompress_safe_continue+0x498>
  a4b37d:	4c 89 ef             	mov    %r13,%rdi
  a4b380:	48 01 c7             	add    %rax,%rdi
  a4b383:	0f 82 73 fd ff ff    	jb     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b389:	48 89 f3             	mov    %rsi,%rbx
  a4b38c:	48 01 c3             	add    %rax,%rbx
  a4b38f:	0f 83 62 fe ff ff    	jae    a4b1f7 <LZ4_decompress_safe_continue+0x327>
  a4b395:	e9 62 fd ff ff       	jmpq   a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b39a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4b3a0:	48 89 f8             	mov    %rdi,%rax
  a4b3a3:	48 01 d0             	add    %rdx,%rax
  a4b3a6:	0f 83 24 fc ff ff    	jae    a4afd0 <LZ4_decompress_safe_continue+0x100>
  a4b3ac:	e9 4b fd ff ff       	jmpq   a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b3b1:	4d 8d 5f fc          	lea    -0x4(%r15),%r11
  a4b3b5:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4b3ba:	eb 13                	jmp    a4b3cf <LZ4_decompress_safe_continue+0x4ff>
  a4b3bc:	0f 1f 40 00          	nopl   0x0(%rax)
  a4b3c0:	44 0f b6 c8          	movzbl %al,%r9d
  a4b3c4:	4c 01 ca             	add    %r9,%rdx
  a4b3c7:	3c ff                	cmp    $0xff,%al
  a4b3c9:	0f 85 f5 00 00 00    	jne    a4b4c4 <LZ4_decompress_safe_continue+0x5f4>
  a4b3cf:	48 83 c3 01          	add    $0x1,%rbx
  a4b3d3:	0f b6 43 ff          	movzbl -0x1(%rbx),%eax
  a4b3d7:	4c 39 db             	cmp    %r11,%rbx
  a4b3da:	75 e4                	jne    a4b3c0 <LZ4_decompress_safe_continue+0x4f0>
  a4b3dc:	e9 1b fd ff ff       	jmpq   a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b3e1:	e8 7a 28 00 00       	callq  a4dc60 <memmove>
  a4b3e6:	e9 ec fd ff ff       	jmpq   a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b3eb:	49 8d 44 24 fb       	lea    -0x5(%r12),%rax
  a4b3f0:	48 39 c5             	cmp    %rax,%rbp
  a4b3f3:	0f 87 03 fd ff ff    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b3f9:	48 83 c7 08          	add    $0x8,%rdi
  a4b3fd:	48 3b 7c 24 30       	cmp    0x30(%rsp),%rdi
  a4b402:	0f 82 bf 01 00 00    	jb     a4b5c7 <LZ4_decompress_safe_continue+0x6f7>
  a4b408:	48 89 ee             	mov    %rbp,%rsi
  a4b40b:	31 c0                	xor    %eax,%eax
  a4b40d:	48 29 fe             	sub    %rdi,%rsi
  a4b410:	48 39 fd             	cmp    %rdi,%rbp
  a4b413:	0f 86 30 fb ff ff    	jbe    a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b419:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4b420:	41 0f b6 14 03       	movzbl (%r11,%rax,1),%edx
  a4b425:	88 14 07             	mov    %dl,(%rdi,%rax,1)
  a4b428:	48 83 c0 01          	add    $0x1,%rax
  a4b42c:	48 39 c6             	cmp    %rax,%rsi
  a4b42f:	75 ef                	jne    a4b420 <LZ4_decompress_safe_continue+0x550>
  a4b431:	e9 13 fb ff ff       	jmpq   a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b436:	41 0f b6 03          	movzbl (%r11),%eax
  a4b43a:	88 07                	mov    %al,(%rdi)
  a4b43c:	41 0f b6 43 01       	movzbl 0x1(%r11),%eax
  a4b441:	88 47 01             	mov    %al,0x1(%rdi)
  a4b444:	41 0f b6 43 02       	movzbl 0x2(%r11),%eax
  a4b449:	88 47 02             	mov    %al,0x2(%rdi)
  a4b44c:	41 0f b6 43 03       	movzbl 0x3(%r11),%eax
  a4b451:	88 47 03             	mov    %al,0x3(%rdi)
  a4b454:	48 8d 05 45 8b 00 00 	lea    0x8b45(%rip),%rax        # a53fa0 <dec32table.3>
  a4b45b:	8b 04 b0             	mov    (%rax,%rsi,4),%eax
  a4b45e:	49 01 c3             	add    %rax,%r11
  a4b461:	41 8b 03             	mov    (%r11),%eax
  a4b464:	89 47 04             	mov    %eax,0x4(%rdi)
  a4b467:	48 8d 05 52 8b 00 00 	lea    0x8b52(%rip),%rax        # a53fc0 <dec64table.4>
  a4b46e:	48 63 04 b0          	movslq (%rax,%rsi,4),%rax
  a4b472:	49 29 c3             	sub    %rax,%r11
  a4b475:	e9 0a fc ff ff       	jmpq   a4b084 <LZ4_decompress_safe_continue+0x1b4>
  a4b47a:	4c 89 e1             	mov    %r12,%rcx
  a4b47d:	48 89 c2             	mov    %rax,%rdx
  a4b480:	49 89 fc             	mov    %rdi,%r12
  a4b483:	48 39 cf             	cmp    %rcx,%rdi
  a4b486:	0f 87 70 fc ff ff    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b48c:	4c 39 f3             	cmp    %r14,%rbx
  a4b48f:	0f 85 67 fc ff ff    	jne    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b495:	48 89 ef             	mov    %rbp,%rdi
  a4b498:	4d 29 fc             	sub    %r15,%r12
  a4b49b:	e8 20 28 00 00       	callq  a4dcc0 <memcpy>
  a4b4a0:	44 89 e0             	mov    %r12d,%eax
  a4b4a3:	45 85 e4             	test   %r12d,%r12d
  a4b4a6:	0f 8e 55 fc ff ff    	jle    a4b101 <LZ4_decompress_safe_continue+0x231>
  a4b4ac:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  a4b4b1:	4d 63 e4             	movslq %r12d,%r12
  a4b4b4:	4c 89 61 18          	mov    %r12,0x18(%rcx)
  a4b4b8:	4d 01 fc             	add    %r15,%r12
  a4b4bb:	4c 89 61 10          	mov    %r12,0x10(%rcx)
  a4b4bf:	e9 3d fc ff ff       	jmpq   a4b101 <LZ4_decompress_safe_continue+0x231>
  a4b4c4:	48 89 f8             	mov    %rdi,%rax
  a4b4c7:	48 01 d0             	add    %rdx,%rax
  a4b4ca:	0f 83 93 fd ff ff    	jae    a4b263 <LZ4_decompress_safe_continue+0x393>
  a4b4d0:	e9 27 fc ff ff       	jmpq   a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b4d5:	83 f8 01             	cmp    $0x1,%eax
  a4b4d8:	0f 85 1e fc ff ff    	jne    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b4de:	31 c0                	xor    %eax,%eax
  a4b4e0:	80 3b 00             	cmpb   $0x0,(%rbx)
  a4b4e3:	0f 95 c0             	setne  %al
  a4b4e6:	f7 d8                	neg    %eax
  a4b4e8:	e9 14 fc ff ff       	jmpq   a4b101 <LZ4_decompress_safe_continue+0x231>
  a4b4ed:	0f b6 06             	movzbl (%rsi),%eax
  a4b4f0:	88 07                	mov    %al,(%rdi)
  a4b4f2:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
  a4b4f6:	88 47 01             	mov    %al,0x1(%rdi)
  a4b4f9:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
  a4b4fd:	88 47 02             	mov    %al,0x2(%rdi)
  a4b500:	0f b6 46 03          	movzbl 0x3(%rsi),%eax
  a4b504:	88 47 03             	mov    %al,0x3(%rdi)
  a4b507:	48 8d 05 92 8a 00 00 	lea    0x8a92(%rip),%rax        # a53fa0 <dec32table.3>
  a4b50e:	42 8b 04 80          	mov    (%rax,%r8,4),%eax
  a4b512:	48 01 c6             	add    %rax,%rsi
  a4b515:	8b 06                	mov    (%rsi),%eax
  a4b517:	89 47 04             	mov    %eax,0x4(%rdi)
  a4b51a:	48 8d 05 9f 8a 00 00 	lea    0x8a9f(%rip),%rax        # a53fc0 <dec64table.4>
  a4b521:	4a 63 04 80          	movslq (%rax,%r8,4),%rax
  a4b525:	48 29 c6             	sub    %rax,%rsi
  a4b528:	e9 e7 fd ff ff       	jmpq   a4b314 <LZ4_decompress_safe_continue+0x444>
  a4b52d:	49 8d 46 fb          	lea    -0x5(%r14),%rax
  a4b531:	49 39 c5             	cmp    %rax,%r13
  a4b534:	0f 87 c2 fb ff ff    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b53a:	48 83 c7 08          	add    $0x8,%rdi
  a4b53e:	48 3b 7c 24 30       	cmp    0x30(%rsp),%rdi
  a4b543:	0f 82 da 00 00 00    	jb     a4b623 <LZ4_decompress_safe_continue+0x753>
  a4b549:	4c 89 e9             	mov    %r13,%rcx
  a4b54c:	31 c0                	xor    %eax,%eax
  a4b54e:	48 29 f9             	sub    %rdi,%rcx
  a4b551:	4c 39 ef             	cmp    %r13,%rdi
  a4b554:	0f 83 7d fc ff ff    	jae    a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b55a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4b560:	0f b6 14 06          	movzbl (%rsi,%rax,1),%edx
  a4b564:	88 14 07             	mov    %dl,(%rdi,%rax,1)
  a4b567:	48 83 c0 01          	add    $0x1,%rax
  a4b56b:	48 39 c1             	cmp    %rax,%rcx
  a4b56e:	75 f0                	jne    a4b560 <LZ4_decompress_safe_continue+0x690>
  a4b570:	e9 62 fc ff ff       	jmpq   a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b575:	48 89 fd             	mov    %rdi,%rbp
  a4b578:	e9 cc f9 ff ff       	jmpq   a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b57d:	4d 89 fa             	mov    %r15,%r10
  a4b580:	48 89 c2             	mov    %rax,%rdx
  a4b583:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
  a4b588:	48 89 fd             	mov    %rdi,%rbp
  a4b58b:	4c 39 f7             	cmp    %r14,%rdi
  a4b58e:	0f 87 68 fb ff ff    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b594:	49 39 da             	cmp    %rbx,%r10
  a4b597:	0f 85 5f fb ff ff    	jne    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b59d:	4c 89 ef             	mov    %r13,%rdi
  a4b5a0:	4c 29 fd             	sub    %r15,%rbp
  a4b5a3:	e8 18 27 00 00       	callq  a4dcc0 <memcpy>
  a4b5a8:	89 e8                	mov    %ebp,%eax
  a4b5aa:	85 ed                	test   %ebp,%ebp
  a4b5ac:	0f 8e 4f fb ff ff    	jle    a4b101 <LZ4_decompress_safe_continue+0x231>
  a4b5b2:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  a4b5b7:	48 63 ed             	movslq %ebp,%rbp
  a4b5ba:	48 01 69 18          	add    %rbp,0x18(%rcx)
  a4b5be:	48 01 69 10          	add    %rbp,0x10(%rcx)
  a4b5c2:	e9 3a fb ff ff       	jmpq   a4b101 <LZ4_decompress_safe_continue+0x231>
  a4b5c7:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
  a4b5cc:	4c 89 da             	mov    %r11,%rdx
  a4b5cf:	48 89 f8             	mov    %rdi,%rax
  a4b5d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4b5d8:	48 8b 32             	mov    (%rdx),%rsi
  a4b5db:	48 83 c0 08          	add    $0x8,%rax
  a4b5df:	48 83 c2 08          	add    $0x8,%rdx
  a4b5e3:	48 89 70 f8          	mov    %rsi,-0x8(%rax)
  a4b5e7:	49 39 c0             	cmp    %rax,%r8
  a4b5ea:	77 ec                	ja     a4b5d8 <LZ4_decompress_safe_continue+0x708>
  a4b5ec:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
  a4b5f1:	48 89 d0             	mov    %rdx,%rax
  a4b5f4:	48 29 f8             	sub    %rdi,%rax
  a4b5f7:	48 89 d7             	mov    %rdx,%rdi
  a4b5fa:	49 01 c3             	add    %rax,%r11
  a4b5fd:	e9 06 fe ff ff       	jmpq   a4b408 <LZ4_decompress_safe_continue+0x538>
  a4b602:	83 f8 01             	cmp    $0x1,%eax
  a4b605:	0f 85 f1 fa ff ff    	jne    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b60b:	31 c0                	xor    %eax,%eax
  a4b60d:	80 3e 00             	cmpb   $0x0,(%rsi)
  a4b610:	0f 84 eb fa ff ff    	je     a4b101 <LZ4_decompress_safe_continue+0x231>
  a4b616:	e9 e1 fa ff ff       	jmpq   a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b61b:	49 89 fd             	mov    %rdi,%r13
  a4b61e:	e9 b4 fb ff ff       	jmpq   a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b623:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
  a4b628:	48 89 f2             	mov    %rsi,%rdx
  a4b62b:	48 89 f8             	mov    %rdi,%rax
  a4b62e:	48 8b 0a             	mov    (%rdx),%rcx
  a4b631:	48 83 c0 08          	add    $0x8,%rax
  a4b635:	48 83 c2 08          	add    $0x8,%rdx
  a4b639:	48 89 48 f8          	mov    %rcx,-0x8(%rax)
  a4b63d:	49 39 c0             	cmp    %rax,%r8
  a4b640:	77 ec                	ja     a4b62e <LZ4_decompress_safe_continue+0x75e>
  a4b642:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
  a4b647:	48 89 c8             	mov    %rcx,%rax
  a4b64a:	48 29 f8             	sub    %rdi,%rax
  a4b64d:	48 89 cf             	mov    %rcx,%rdi
  a4b650:	48 01 c6             	add    %rax,%rsi
  a4b653:	e9 f1 fe ff ff       	jmpq   a4b549 <LZ4_decompress_safe_continue+0x679>
  a4b658:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4b65f:	00 

0000000000a4b660 <LZ4_decompress_fast_continue>:
  a4b660:	f3 0f 1e fa          	endbr64 
  a4b664:	41 57                	push   %r15
  a4b666:	41 56                	push   %r14
  a4b668:	41 55                	push   %r13
  a4b66a:	41 54                	push   %r12
  a4b66c:	49 89 d4             	mov    %rdx,%r12
  a4b66f:	55                   	push   %rbp
  a4b670:	53                   	push   %rbx
  a4b671:	48 63 d9             	movslq %ecx,%rbx
  a4b674:	48 89 d8             	mov    %rbx,%rax
  a4b677:	48 83 ec 48          	sub    $0x48,%rsp
  a4b67b:	48 8b 57 18          	mov    0x18(%rdi),%rdx
  a4b67f:	4c 8b 6f 10          	mov    0x10(%rdi),%r13
  a4b683:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
  a4b688:	4c 01 e3             	add    %r12,%rbx
  a4b68b:	48 89 d1             	mov    %rdx,%rcx
  a4b68e:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
  a4b693:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
  a4b698:	48 f7 d9             	neg    %rcx
  a4b69b:	4d 39 e5             	cmp    %r12,%r13
  a4b69e:	0f 84 fa 02 00 00    	je     a4b99e <LZ4_decompress_fast_continue+0x33e>
  a4b6a4:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  a4b6a9:	4c 01 e9             	add    %r13,%rcx
  a4b6ac:	48 89 56 08          	mov    %rdx,0x8(%rsi)
  a4b6b0:	48 89 0e             	mov    %rcx,(%rsi)
  a4b6b3:	85 c0                	test   %eax,%eax
  a4b6b5:	0f 84 2f 02 00 00    	je     a4b8ea <LZ4_decompress_fast_continue+0x28a>
  a4b6bb:	48 8d 43 f9          	lea    -0x7(%rbx),%rax
  a4b6bf:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
  a4b6c4:	48 8d 6b f8          	lea    -0x8(%rbx),%rbp
  a4b6c8:	4d 89 e7             	mov    %r12,%r15
  a4b6cb:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  a4b6d0:	41 0f b6 06          	movzbl (%r14),%eax
  a4b6d4:	49 8d 4e 01          	lea    0x1(%r14),%rcx
  a4b6d8:	89 c2                	mov    %eax,%edx
  a4b6da:	c1 e8 04             	shr    $0x4,%eax
  a4b6dd:	41 89 c6             	mov    %eax,%r14d
  a4b6e0:	83 f8 0f             	cmp    $0xf,%eax
  a4b6e3:	0f 84 47 01 00 00    	je     a4b830 <LZ4_decompress_fast_continue+0x1d0>
  a4b6e9:	4b 8d 3c 37          	lea    (%r15,%r14,1),%rdi
  a4b6ed:	48 39 ef             	cmp    %rbp,%rdi
  a4b6f0:	0f 87 67 01 00 00    	ja     a4b85d <LZ4_decompress_fast_continue+0x1fd>
  a4b6f6:	48 89 c8             	mov    %rcx,%rax
  a4b6f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4b700:	48 8b 30             	mov    (%rax),%rsi
  a4b703:	49 83 c7 08          	add    $0x8,%r15
  a4b707:	48 83 c0 08          	add    $0x8,%rax
  a4b70b:	49 89 77 f8          	mov    %rsi,-0x8(%r15)
  a4b70f:	4c 39 ff             	cmp    %r15,%rdi
  a4b712:	77 ec                	ja     a4b700 <LZ4_decompress_fast_continue+0xa0>
  a4b714:	49 01 ce             	add    %rcx,%r14
  a4b717:	89 d0                	mov    %edx,%eax
  a4b719:	49 89 f8             	mov    %rdi,%r8
  a4b71c:	83 e2 0f             	and    $0xf,%edx
  a4b71f:	41 0f b7 36          	movzwl (%r14),%esi
  a4b723:	83 e0 0f             	and    $0xf,%eax
  a4b726:	49 83 c6 02          	add    $0x2,%r14
  a4b72a:	89 37                	mov    %esi,(%rdi)
  a4b72c:	49 29 f0             	sub    %rsi,%r8
  a4b72f:	3c 0f                	cmp    $0xf,%al
  a4b731:	0f 84 89 01 00 00    	je     a4b8c0 <LZ4_decompress_fast_continue+0x260>
  a4b737:	48 83 c2 04          	add    $0x4,%rdx
  a4b73b:	4c 8d 3c 17          	lea    (%rdi,%rdx,1),%r15
  a4b73f:	4d 39 c4             	cmp    %r8,%r12
  a4b742:	76 7c                	jbe    a4b7c0 <LZ4_decompress_fast_continue+0x160>
  a4b744:	48 8d 43 fb          	lea    -0x5(%rbx),%rax
  a4b748:	49 39 c7             	cmp    %rax,%r15
  a4b74b:	0f 87 a7 01 00 00    	ja     a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4b751:	4c 89 e1             	mov    %r12,%rcx
  a4b754:	4c 89 ee             	mov    %r13,%rsi
  a4b757:	4c 29 c1             	sub    %r8,%rcx
  a4b75a:	48 29 ce             	sub    %rcx,%rsi
  a4b75d:	48 39 ca             	cmp    %rcx,%rdx
  a4b760:	0f 86 7a 01 00 00    	jbe    a4b8e0 <LZ4_decompress_fast_continue+0x280>
  a4b766:	48 29 ca             	sub    %rcx,%rdx
  a4b769:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  a4b76e:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  a4b773:	48 89 ca             	mov    %rcx,%rdx
  a4b776:	e8 45 25 00 00       	callq  a4dcc0 <memcpy>
  a4b77b:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  a4b780:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
  a4b785:	48 89 c7             	mov    %rax,%rdi
  a4b788:	48 01 cf             	add    %rcx,%rdi
  a4b78b:	48 89 f8             	mov    %rdi,%rax
  a4b78e:	4c 29 e0             	sub    %r12,%rax
  a4b791:	49 39 c0             	cmp    %rax,%r8
  a4b794:	0f 86 86 00 00 00    	jbe    a4b820 <LZ4_decompress_fast_continue+0x1c0>
  a4b79a:	49 39 ff             	cmp    %rdi,%r15
  a4b79d:	0f 86 97 04 00 00    	jbe    a4bc3a <LZ4_decompress_fast_continue+0x5da>
  a4b7a3:	31 c0                	xor    %eax,%eax
  a4b7a5:	41 0f b6 14 04       	movzbl (%r12,%rax,1),%edx
  a4b7aa:	88 14 07             	mov    %dl,(%rdi,%rax,1)
  a4b7ad:	48 83 c0 01          	add    $0x1,%rax
  a4b7b1:	49 39 c0             	cmp    %rax,%r8
  a4b7b4:	75 ef                	jne    a4b7a5 <LZ4_decompress_fast_continue+0x145>
  a4b7b6:	e9 15 ff ff ff       	jmpq   a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b7bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4b7c0:	48 83 fe 07          	cmp    $0x7,%rsi
  a4b7c4:	0f 86 42 01 00 00    	jbe    a4b90c <LZ4_decompress_fast_continue+0x2ac>
  a4b7ca:	49 8b 00             	mov    (%r8),%rax
  a4b7cd:	49 83 c0 08          	add    $0x8,%r8
  a4b7d1:	48 89 07             	mov    %rax,(%rdi)
  a4b7d4:	48 8d 43 f4          	lea    -0xc(%rbx),%rax
  a4b7d8:	49 39 c7             	cmp    %rax,%r15
  a4b7db:	0f 87 77 01 00 00    	ja     a4b958 <LZ4_decompress_fast_continue+0x2f8>
  a4b7e1:	49 8b 00             	mov    (%r8),%rax
  a4b7e4:	48 89 47 08          	mov    %rax,0x8(%rdi)
  a4b7e8:	48 83 fa 10          	cmp    $0x10,%rdx
  a4b7ec:	0f 86 de fe ff ff    	jbe    a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b7f2:	49 8d 40 08          	lea    0x8(%r8),%rax
  a4b7f6:	48 83 c7 10          	add    $0x10,%rdi
  a4b7fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4b800:	48 8b 10             	mov    (%rax),%rdx
  a4b803:	48 83 c7 08          	add    $0x8,%rdi
  a4b807:	48 83 c0 08          	add    $0x8,%rax
  a4b80b:	48 89 57 f8          	mov    %rdx,-0x8(%rdi)
  a4b80f:	4c 39 ff             	cmp    %r15,%rdi
  a4b812:	72 ec                	jb     a4b800 <LZ4_decompress_fast_continue+0x1a0>
  a4b814:	e9 b7 fe ff ff       	jmpq   a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b819:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4b820:	4c 89 c2             	mov    %r8,%rdx
  a4b823:	4c 89 e6             	mov    %r12,%rsi
  a4b826:	e8 95 24 00 00       	callq  a4dcc0 <memcpy>
  a4b82b:	e9 a0 fe ff ff       	jmpq   a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b830:	41 be 0f 00 00 00    	mov    $0xf,%r14d
  a4b836:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4b83d:	00 00 00 
  a4b840:	0f b6 31             	movzbl (%rcx),%esi
  a4b843:	48 83 c1 01          	add    $0x1,%rcx
  a4b847:	49 01 f6             	add    %rsi,%r14
  a4b84a:	40 80 fe ff          	cmp    $0xff,%sil
  a4b84e:	74 f0                	je     a4b840 <LZ4_decompress_fast_continue+0x1e0>
  a4b850:	4b 8d 3c 37          	lea    (%r15,%r14,1),%rdi
  a4b854:	48 39 ef             	cmp    %rbp,%rdi
  a4b857:	0f 86 99 fe ff ff    	jbe    a4b6f6 <LZ4_decompress_fast_continue+0x96>
  a4b85d:	4c 89 f2             	mov    %r14,%rdx
  a4b860:	48 39 df             	cmp    %rbx,%rdi
  a4b863:	0f 85 8f 00 00 00    	jne    a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4b869:	48 89 ce             	mov    %rcx,%rsi
  a4b86c:	4c 89 ff             	mov    %r15,%rdi
  a4b86f:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  a4b874:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
  a4b879:	e8 42 24 00 00       	callq  a4dcc0 <memcpy>
  a4b87e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  a4b883:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  a4b888:	48 01 ca             	add    %rcx,%rdx
  a4b88b:	48 2b 54 24 20       	sub    0x20(%rsp),%rdx
  a4b890:	89 d0                	mov    %edx,%eax
  a4b892:	85 d2                	test   %edx,%edx
  a4b894:	7e 67                	jle    a4b8fd <LZ4_decompress_fast_continue+0x29d>
  a4b896:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  a4b89b:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
  a4b8a0:	48 89 71 18          	mov    %rsi,0x18(%rcx)
  a4b8a4:	48 89 59 10          	mov    %rbx,0x10(%rcx)
  a4b8a8:	48 83 c4 48          	add    $0x48,%rsp
  a4b8ac:	5b                   	pop    %rbx
  a4b8ad:	5d                   	pop    %rbp
  a4b8ae:	41 5c                	pop    %r12
  a4b8b0:	41 5d                	pop    %r13
  a4b8b2:	41 5e                	pop    %r14
  a4b8b4:	41 5f                	pop    %r15
  a4b8b6:	c3                   	retq   
  a4b8b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4b8be:	00 00 
  a4b8c0:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4b8c5:	0f 1f 00             	nopl   (%rax)
  a4b8c8:	41 0f b6 0e          	movzbl (%r14),%ecx
  a4b8cc:	49 83 c6 01          	add    $0x1,%r14
  a4b8d0:	48 01 ca             	add    %rcx,%rdx
  a4b8d3:	80 f9 ff             	cmp    $0xff,%cl
  a4b8d6:	74 f0                	je     a4b8c8 <LZ4_decompress_fast_continue+0x268>
  a4b8d8:	e9 5a fe ff ff       	jmpq   a4b737 <LZ4_decompress_fast_continue+0xd7>
  a4b8dd:	0f 1f 00             	nopl   (%rax)
  a4b8e0:	e8 7b 23 00 00       	callq  a4dc60 <memmove>
  a4b8e5:	e9 e6 fd ff ff       	jmpq   a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b8ea:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  a4b8ef:	80 38 00             	cmpb   $0x0,(%rax)
  a4b8f2:	0f 84 20 04 00 00    	je     a4bd18 <LZ4_decompress_fast_continue+0x6b8>
  a4b8f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4b8fd:	48 83 c4 48          	add    $0x48,%rsp
  a4b901:	5b                   	pop    %rbx
  a4b902:	5d                   	pop    %rbp
  a4b903:	41 5c                	pop    %r12
  a4b905:	41 5d                	pop    %r13
  a4b907:	41 5e                	pop    %r14
  a4b909:	41 5f                	pop    %r15
  a4b90b:	c3                   	retq   
  a4b90c:	41 0f b6 00          	movzbl (%r8),%eax
  a4b910:	88 07                	mov    %al,(%rdi)
  a4b912:	41 0f b6 40 01       	movzbl 0x1(%r8),%eax
  a4b917:	88 47 01             	mov    %al,0x1(%rdi)
  a4b91a:	41 0f b6 40 02       	movzbl 0x2(%r8),%eax
  a4b91f:	88 47 02             	mov    %al,0x2(%rdi)
  a4b922:	41 0f b6 40 03       	movzbl 0x3(%r8),%eax
  a4b927:	88 47 03             	mov    %al,0x3(%rdi)
  a4b92a:	48 8d 05 6f 86 00 00 	lea    0x866f(%rip),%rax        # a53fa0 <dec32table.3>
  a4b931:	8b 04 b0             	mov    (%rax,%rsi,4),%eax
  a4b934:	49 01 c0             	add    %rax,%r8
  a4b937:	41 8b 00             	mov    (%r8),%eax
  a4b93a:	89 47 04             	mov    %eax,0x4(%rdi)
  a4b93d:	48 8d 05 7c 86 00 00 	lea    0x867c(%rip),%rax        # a53fc0 <dec64table.4>
  a4b944:	48 63 04 b0          	movslq (%rax,%rsi,4),%rax
  a4b948:	49 29 c0             	sub    %rax,%r8
  a4b94b:	48 8d 43 f4          	lea    -0xc(%rbx),%rax
  a4b94f:	49 39 c7             	cmp    %rax,%r15
  a4b952:	0f 86 89 fe ff ff    	jbe    a4b7e1 <LZ4_decompress_fast_continue+0x181>
  a4b958:	48 8d 43 fb          	lea    -0x5(%rbx),%rax
  a4b95c:	49 39 c7             	cmp    %rax,%r15
  a4b95f:	77 97                	ja     a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4b961:	48 83 c7 08          	add    $0x8,%rdi
  a4b965:	48 3b 7c 24 28       	cmp    0x28(%rsp),%rdi
  a4b96a:	0f 82 d2 02 00 00    	jb     a4bc42 <LZ4_decompress_fast_continue+0x5e2>
  a4b970:	4c 39 ff             	cmp    %r15,%rdi
  a4b973:	0f 83 57 fd ff ff    	jae    a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b979:	4c 89 f9             	mov    %r15,%rcx
  a4b97c:	31 c0                	xor    %eax,%eax
  a4b97e:	48 29 f9             	sub    %rdi,%rcx
  a4b981:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4b988:	41 0f b6 14 00       	movzbl (%r8,%rax,1),%edx
  a4b98d:	88 14 07             	mov    %dl,(%rdi,%rax,1)
  a4b990:	48 83 c0 01          	add    $0x1,%rax
  a4b994:	48 39 c1             	cmp    %rax,%rcx
  a4b997:	75 ef                	jne    a4b988 <LZ4_decompress_fast_continue+0x328>
  a4b999:	e9 32 fd ff ff       	jmpq   a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b99e:	48 89 fe             	mov    %rdi,%rsi
  a4b9a1:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
  a4b9a6:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  a4b9aa:	4d 8d 3c 0c          	lea    (%r12,%rcx,1),%r15
  a4b9ae:	48 8b 36             	mov    (%rsi),%rsi
  a4b9b1:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
  a4b9b6:	45 0f b6 16          	movzbl (%r14),%r10d
  a4b9ba:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
  a4b9bf:	85 c0                	test   %eax,%eax
  a4b9c1:	0f 84 5b 03 00 00    	je     a4bd22 <LZ4_decompress_fast_continue+0x6c2>
  a4b9c7:	48 8d 43 f9          	lea    -0x7(%rbx),%rax
  a4b9cb:	4d 89 f5             	mov    %r14,%r13
  a4b9ce:	48 8d 6b f8          	lea    -0x8(%rbx),%rbp
  a4b9d2:	4d 89 fe             	mov    %r15,%r14
  a4b9d5:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  a4b9da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4b9e0:	41 0f b6 c2          	movzbl %r10b,%eax
  a4b9e4:	49 8d 4d 01          	lea    0x1(%r13),%rcx
  a4b9e8:	c1 e8 04             	shr    $0x4,%eax
  a4b9eb:	89 c6                	mov    %eax,%esi
  a4b9ed:	83 f8 0f             	cmp    $0xf,%eax
  a4b9f0:	0f 84 5d 01 00 00    	je     a4bb53 <LZ4_decompress_fast_continue+0x4f3>
  a4b9f6:	49 8d 3c 34          	lea    (%r12,%rsi,1),%rdi
  a4b9fa:	48 39 ef             	cmp    %rbp,%rdi
  a4b9fd:	0f 87 7f 02 00 00    	ja     a4bc82 <LZ4_decompress_fast_continue+0x622>
  a4ba03:	48 89 c8             	mov    %rcx,%rax
  a4ba06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4ba0d:	00 00 00 
  a4ba10:	48 8b 10             	mov    (%rax),%rdx
  a4ba13:	49 83 c4 08          	add    $0x8,%r12
  a4ba17:	48 83 c0 08          	add    $0x8,%rax
  a4ba1b:	49 89 54 24 f8       	mov    %rdx,-0x8(%r12)
  a4ba20:	4c 39 e7             	cmp    %r12,%rdi
  a4ba23:	77 eb                	ja     a4ba10 <LZ4_decompress_fast_continue+0x3b0>
  a4ba25:	48 01 f1             	add    %rsi,%rcx
  a4ba28:	44 89 d0             	mov    %r10d,%eax
  a4ba2b:	48 89 fe             	mov    %rdi,%rsi
  a4ba2e:	4c 89 d2             	mov    %r10,%rdx
  a4ba31:	44 0f b7 01          	movzwl (%rcx),%r8d
  a4ba35:	83 e0 0f             	and    $0xf,%eax
  a4ba38:	4c 8d 69 02          	lea    0x2(%rcx),%r13
  a4ba3c:	83 e2 0f             	and    $0xf,%edx
  a4ba3f:	44 89 07             	mov    %r8d,(%rdi)
  a4ba42:	4c 29 c6             	sub    %r8,%rsi
  a4ba45:	3c 0f                	cmp    $0xf,%al
  a4ba47:	0f 84 27 01 00 00    	je     a4bb74 <LZ4_decompress_fast_continue+0x514>
  a4ba4d:	48 83 c2 04          	add    $0x4,%rdx
  a4ba51:	4c 8d 24 17          	lea    (%rdi,%rdx,1),%r12
  a4ba55:	49 39 f6             	cmp    %rsi,%r14
  a4ba58:	0f 86 82 00 00 00    	jbe    a4bae0 <LZ4_decompress_fast_continue+0x480>
  a4ba5e:	48 8d 43 fb          	lea    -0x5(%rbx),%rax
  a4ba62:	49 39 c4             	cmp    %rax,%r12
  a4ba65:	0f 87 8d fe ff ff    	ja     a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4ba6b:	4d 89 f2             	mov    %r14,%r10
  a4ba6e:	49 29 f2             	sub    %rsi,%r10
  a4ba71:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  a4ba76:	4c 29 d6             	sub    %r10,%rsi
  a4ba79:	48 03 74 24 28       	add    0x28(%rsp),%rsi
  a4ba7e:	4c 39 d2             	cmp    %r10,%rdx
  a4ba81:	0f 86 0f 01 00 00    	jbe    a4bb96 <LZ4_decompress_fast_continue+0x536>
  a4ba87:	4c 29 d2             	sub    %r10,%rdx
  a4ba8a:	4c 89 54 24 08       	mov    %r10,0x8(%rsp)
  a4ba8f:	49 89 d7             	mov    %rdx,%r15
  a4ba92:	4c 89 d2             	mov    %r10,%rdx
  a4ba95:	e8 26 22 00 00       	callq  a4dcc0 <memcpy>
  a4ba9a:	4c 8b 54 24 08       	mov    0x8(%rsp),%r10
  a4ba9f:	48 89 c7             	mov    %rax,%rdi
  a4baa2:	4c 01 d7             	add    %r10,%rdi
  a4baa5:	48 89 f8             	mov    %rdi,%rax
  a4baa8:	4c 29 f0             	sub    %r14,%rax
  a4baab:	49 39 c7             	cmp    %rax,%r15
  a4baae:	0f 86 8a 00 00 00    	jbe    a4bb3e <LZ4_decompress_fast_continue+0x4de>
  a4bab4:	49 39 fc             	cmp    %rdi,%r12
  a4bab7:	0f 86 bd 01 00 00    	jbe    a4bc7a <LZ4_decompress_fast_continue+0x61a>
  a4babd:	31 c0                	xor    %eax,%eax
  a4babf:	41 0f b6 14 06       	movzbl (%r14,%rax,1),%edx
  a4bac4:	88 14 07             	mov    %dl,(%rdi,%rax,1)
  a4bac7:	48 83 c0 01          	add    $0x1,%rax
  a4bacb:	49 39 c7             	cmp    %rax,%r15
  a4bace:	75 ef                	jne    a4babf <LZ4_decompress_fast_continue+0x45f>
  a4bad0:	45 0f b6 55 00       	movzbl 0x0(%r13),%r10d
  a4bad5:	e9 06 ff ff ff       	jmpq   a4b9e0 <LZ4_decompress_fast_continue+0x380>
  a4bada:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4bae0:	49 83 f8 07          	cmp    $0x7,%r8
  a4bae4:	0f 86 bb 00 00 00    	jbe    a4bba5 <LZ4_decompress_fast_continue+0x545>
  a4baea:	48 8b 06             	mov    (%rsi),%rax
  a4baed:	48 83 c6 08          	add    $0x8,%rsi
  a4baf1:	48 89 07             	mov    %rax,(%rdi)
  a4baf4:	48 8d 43 f4          	lea    -0xc(%rbx),%rax
  a4baf8:	49 39 c4             	cmp    %rax,%r12
  a4bafb:	0f 87 ec 00 00 00    	ja     a4bbed <LZ4_decompress_fast_continue+0x58d>
  a4bb01:	48 8b 06             	mov    (%rsi),%rax
  a4bb04:	48 89 47 08          	mov    %rax,0x8(%rdi)
  a4bb08:	48 83 fa 10          	cmp    $0x10,%rdx
  a4bb0c:	76 c2                	jbe    a4bad0 <LZ4_decompress_fast_continue+0x470>
  a4bb0e:	48 8d 46 08          	lea    0x8(%rsi),%rax
  a4bb12:	48 83 c7 10          	add    $0x10,%rdi
  a4bb16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4bb1d:	00 00 00 
  a4bb20:	48 8b 10             	mov    (%rax),%rdx
  a4bb23:	48 83 c7 08          	add    $0x8,%rdi
  a4bb27:	48 83 c0 08          	add    $0x8,%rax
  a4bb2b:	48 89 57 f8          	mov    %rdx,-0x8(%rdi)
  a4bb2f:	4c 39 e7             	cmp    %r12,%rdi
  a4bb32:	72 ec                	jb     a4bb20 <LZ4_decompress_fast_continue+0x4c0>
  a4bb34:	45 0f b6 55 00       	movzbl 0x0(%r13),%r10d
  a4bb39:	e9 a2 fe ff ff       	jmpq   a4b9e0 <LZ4_decompress_fast_continue+0x380>
  a4bb3e:	4c 89 fa             	mov    %r15,%rdx
  a4bb41:	4c 89 f6             	mov    %r14,%rsi
  a4bb44:	e8 77 21 00 00       	callq  a4dcc0 <memcpy>
  a4bb49:	45 0f b6 55 00       	movzbl 0x0(%r13),%r10d
  a4bb4e:	e9 8d fe ff ff       	jmpq   a4b9e0 <LZ4_decompress_fast_continue+0x380>
  a4bb53:	be 0f 00 00 00       	mov    $0xf,%esi
  a4bb58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4bb5f:	00 
  a4bb60:	0f b6 11             	movzbl (%rcx),%edx
  a4bb63:	48 83 c1 01          	add    $0x1,%rcx
  a4bb67:	48 01 d6             	add    %rdx,%rsi
  a4bb6a:	80 fa ff             	cmp    $0xff,%dl
  a4bb6d:	74 f1                	je     a4bb60 <LZ4_decompress_fast_continue+0x500>
  a4bb6f:	e9 82 fe ff ff       	jmpq   a4b9f6 <LZ4_decompress_fast_continue+0x396>
  a4bb74:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4bb79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4bb80:	41 0f b6 4d 00       	movzbl 0x0(%r13),%ecx
  a4bb85:	49 83 c5 01          	add    $0x1,%r13
  a4bb89:	48 01 ca             	add    %rcx,%rdx
  a4bb8c:	80 f9 ff             	cmp    $0xff,%cl
  a4bb8f:	74 ef                	je     a4bb80 <LZ4_decompress_fast_continue+0x520>
  a4bb91:	e9 b7 fe ff ff       	jmpq   a4ba4d <LZ4_decompress_fast_continue+0x3ed>
  a4bb96:	e8 c5 20 00 00       	callq  a4dc60 <memmove>
  a4bb9b:	45 0f b6 55 00       	movzbl 0x0(%r13),%r10d
  a4bba0:	e9 3b fe ff ff       	jmpq   a4b9e0 <LZ4_decompress_fast_continue+0x380>
  a4bba5:	0f b6 06             	movzbl (%rsi),%eax
  a4bba8:	88 07                	mov    %al,(%rdi)
  a4bbaa:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
  a4bbae:	88 47 01             	mov    %al,0x1(%rdi)
  a4bbb1:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
  a4bbb5:	88 47 02             	mov    %al,0x2(%rdi)
  a4bbb8:	0f b6 46 03          	movzbl 0x3(%rsi),%eax
  a4bbbc:	88 47 03             	mov    %al,0x3(%rdi)
  a4bbbf:	48 8d 05 da 83 00 00 	lea    0x83da(%rip),%rax        # a53fa0 <dec32table.3>
  a4bbc6:	42 8b 04 80          	mov    (%rax,%r8,4),%eax
  a4bbca:	48 01 c6             	add    %rax,%rsi
  a4bbcd:	8b 06                	mov    (%rsi),%eax
  a4bbcf:	89 47 04             	mov    %eax,0x4(%rdi)
  a4bbd2:	48 8d 05 e7 83 00 00 	lea    0x83e7(%rip),%rax        # a53fc0 <dec64table.4>
  a4bbd9:	4a 63 04 80          	movslq (%rax,%r8,4),%rax
  a4bbdd:	48 29 c6             	sub    %rax,%rsi
  a4bbe0:	48 8d 43 f4          	lea    -0xc(%rbx),%rax
  a4bbe4:	49 39 c4             	cmp    %rax,%r12
  a4bbe7:	0f 86 14 ff ff ff    	jbe    a4bb01 <LZ4_decompress_fast_continue+0x4a1>
  a4bbed:	48 8d 43 fb          	lea    -0x5(%rbx),%rax
  a4bbf1:	49 39 c4             	cmp    %rax,%r12
  a4bbf4:	0f 87 fe fc ff ff    	ja     a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4bbfa:	48 83 c7 08          	add    $0x8,%rdi
  a4bbfe:	48 3b 7c 24 38       	cmp    0x38(%rsp),%rdi
  a4bc03:	0f 82 da 00 00 00    	jb     a4bce3 <LZ4_decompress_fast_continue+0x683>
  a4bc09:	4c 39 e7             	cmp    %r12,%rdi
  a4bc0c:	0f 83 be fe ff ff    	jae    a4bad0 <LZ4_decompress_fast_continue+0x470>
  a4bc12:	4d 89 e0             	mov    %r12,%r8
  a4bc15:	31 c0                	xor    %eax,%eax
  a4bc17:	49 29 f8             	sub    %rdi,%r8
  a4bc1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4bc20:	0f b6 14 06          	movzbl (%rsi,%rax,1),%edx
  a4bc24:	88 14 07             	mov    %dl,(%rdi,%rax,1)
  a4bc27:	48 83 c0 01          	add    $0x1,%rax
  a4bc2b:	49 39 c0             	cmp    %rax,%r8
  a4bc2e:	75 f0                	jne    a4bc20 <LZ4_decompress_fast_continue+0x5c0>
  a4bc30:	45 0f b6 55 00       	movzbl 0x0(%r13),%r10d
  a4bc35:	e9 a6 fd ff ff       	jmpq   a4b9e0 <LZ4_decompress_fast_continue+0x380>
  a4bc3a:	49 89 ff             	mov    %rdi,%r15
  a4bc3d:	e9 8e fa ff ff       	jmpq   a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4bc42:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  a4bc47:	4c 89 c2             	mov    %r8,%rdx
  a4bc4a:	48 89 f8             	mov    %rdi,%rax
  a4bc4d:	0f 1f 00             	nopl   (%rax)
  a4bc50:	48 8b 0a             	mov    (%rdx),%rcx
  a4bc53:	48 83 c0 08          	add    $0x8,%rax
  a4bc57:	48 83 c2 08          	add    $0x8,%rdx
  a4bc5b:	48 89 48 f8          	mov    %rcx,-0x8(%rax)
  a4bc5f:	48 39 c6             	cmp    %rax,%rsi
  a4bc62:	77 ec                	ja     a4bc50 <LZ4_decompress_fast_continue+0x5f0>
  a4bc64:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  a4bc69:	48 89 c8             	mov    %rcx,%rax
  a4bc6c:	48 29 f8             	sub    %rdi,%rax
  a4bc6f:	48 89 cf             	mov    %rcx,%rdi
  a4bc72:	49 01 c0             	add    %rax,%r8
  a4bc75:	e9 f6 fc ff ff       	jmpq   a4b970 <LZ4_decompress_fast_continue+0x310>
  a4bc7a:	49 89 fc             	mov    %rdi,%r12
  a4bc7d:	e9 4e fe ff ff       	jmpq   a4bad0 <LZ4_decompress_fast_continue+0x470>
  a4bc82:	49 89 f6             	mov    %rsi,%r14
  a4bc85:	48 39 df             	cmp    %rbx,%rdi
  a4bc88:	0f 85 6a fc ff ff    	jne    a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4bc8e:	48 89 f2             	mov    %rsi,%rdx
  a4bc91:	4c 89 e7             	mov    %r12,%rdi
  a4bc94:	48 89 ce             	mov    %rcx,%rsi
  a4bc97:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  a4bc9c:	e8 1f 20 00 00       	callq  a4dcc0 <memcpy>
  a4bca1:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
  a4bca6:	4b 8d 04 30          	lea    (%r8,%r14,1),%rax
  a4bcaa:	48 2b 44 24 20       	sub    0x20(%rsp),%rax
  a4bcaf:	85 c0                	test   %eax,%eax
  a4bcb1:	0f 8e 46 fc ff ff    	jle    a4b8fd <LZ4_decompress_fast_continue+0x29d>
  a4bcb7:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
  a4bcbc:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
  a4bcc1:	48 03 4b 10          	add    0x10(%rbx),%rcx
  a4bcc5:	48 8b 53 18          	mov    0x18(%rbx),%rdx
  a4bcc9:	48 89 cb             	mov    %rcx,%rbx
  a4bccc:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  a4bcd1:	48 03 54 24 30       	add    0x30(%rsp),%rdx
  a4bcd6:	48 89 51 18          	mov    %rdx,0x18(%rcx)
  a4bcda:	48 89 59 10          	mov    %rbx,0x10(%rcx)
  a4bcde:	e9 1a fc ff ff       	jmpq   a4b8fd <LZ4_decompress_fast_continue+0x29d>
  a4bce3:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  a4bce8:	48 89 f2             	mov    %rsi,%rdx
  a4bceb:	48 89 f8             	mov    %rdi,%rax
  a4bcee:	48 8b 0a             	mov    (%rdx),%rcx
  a4bcf1:	48 83 c0 08          	add    $0x8,%rax
  a4bcf5:	48 83 c2 08          	add    $0x8,%rdx
  a4bcf9:	48 89 48 f8          	mov    %rcx,-0x8(%rax)
  a4bcfd:	49 39 c0             	cmp    %rax,%r8
  a4bd00:	77 ec                	ja     a4bcee <LZ4_decompress_fast_continue+0x68e>
  a4bd02:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
  a4bd07:	48 89 c8             	mov    %rcx,%rax
  a4bd0a:	48 29 f8             	sub    %rdi,%rax
  a4bd0d:	48 89 cf             	mov    %rcx,%rdi
  a4bd10:	48 01 c6             	add    %rax,%rsi
  a4bd13:	e9 f1 fe ff ff       	jmpq   a4bc09 <LZ4_decompress_fast_continue+0x5a9>
  a4bd18:	b8 01 00 00 00       	mov    $0x1,%eax
  a4bd1d:	e9 74 fb ff ff       	jmpq   a4b896 <LZ4_decompress_fast_continue+0x236>
  a4bd22:	45 84 d2             	test   %r10b,%r10b
  a4bd25:	0f 85 cd fb ff ff    	jne    a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4bd2b:	b8 01 00 00 00       	mov    $0x1,%eax
  a4bd30:	eb 9a                	jmp    a4bccc <LZ4_decompress_fast_continue+0x66c>
  a4bd32:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4bd39:	00 00 00 00 
  a4bd3d:	0f 1f 00             	nopl   (%rax)

0000000000a4bd40 <LZ4_decompress_safe_usingDict>:
  a4bd40:	f3 0f 1e fa          	endbr64 
  a4bd44:	41 57                	push   %r15
  a4bd46:	41 56                	push   %r14
  a4bd48:	41 55                	push   %r13
  a4bd4a:	4c 63 ea             	movslq %edx,%r13
  a4bd4d:	48 63 d1             	movslq %ecx,%rdx
  a4bd50:	41 54                	push   %r12
  a4bd52:	48 89 d0             	mov    %rdx,%rax
  a4bd55:	49 89 f4             	mov    %rsi,%r12
  a4bd58:	4c 89 ee             	mov    %r13,%rsi
  a4bd5b:	55                   	push   %rbp
  a4bd5c:	49 01 fd             	add    %rdi,%r13
  a4bd5f:	48 89 fd             	mov    %rdi,%rbp
  a4bd62:	53                   	push   %rbx
  a4bd63:	48 83 ec 38          	sub    $0x38,%rsp
  a4bd67:	45 85 c9             	test   %r9d,%r9d
  a4bd6a:	0f 85 00 01 00 00    	jne    a4be70 <LZ4_decompress_safe_usingDict+0x130>
  a4bd70:	4c 01 e2             	add    %r12,%rdx
  a4bd73:	4c 89 e7             	mov    %r12,%rdi
  a4bd76:	85 c0                	test   %eax,%eax
  a4bd78:	0f 84 93 04 00 00    	je     a4c211 <LZ4_decompress_safe_usingDict+0x4d1>
  a4bd7e:	48 8d 42 fb          	lea    -0x5(%rdx),%rax
  a4bd82:	4d 8d 4d f1          	lea    -0xf(%r13),%r9
  a4bd86:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a4bd8b:	4c 8d 42 f4          	lea    -0xc(%rdx),%r8
  a4bd8f:	4d 8d 5d f8          	lea    -0x8(%r13),%r11
  a4bd93:	4d 8d 55 fc          	lea    -0x4(%r13),%r10
  a4bd97:	4c 8d 72 f9          	lea    -0x7(%rdx),%r14
  a4bd9b:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  a4bd9f:	48 8d 75 01          	lea    0x1(%rbp),%rsi
  a4bda3:	89 c1                	mov    %eax,%ecx
  a4bda5:	c1 e8 04             	shr    $0x4,%eax
  a4bda8:	41 89 c7             	mov    %eax,%r15d
  a4bdab:	83 f8 0f             	cmp    $0xf,%eax
  a4bdae:	0f 84 ac 02 00 00    	je     a4c060 <LZ4_decompress_safe_usingDict+0x320>
  a4bdb4:	4a 8d 1c 3f          	lea    (%rdi,%r15,1),%rbx
  a4bdb8:	4a 8d 2c 3e          	lea    (%rsi,%r15,1),%rbp
  a4bdbc:	49 39 d8             	cmp    %rbx,%r8
  a4bdbf:	0f 82 5c 06 00 00    	jb     a4c421 <LZ4_decompress_safe_usingDict+0x6e1>
  a4bdc5:	4c 39 dd             	cmp    %r11,%rbp
  a4bdc8:	0f 87 53 06 00 00    	ja     a4c421 <LZ4_decompress_safe_usingDict+0x6e1>
  a4bdce:	66 90                	xchg   %ax,%ax
  a4bdd0:	48 8b 06             	mov    (%rsi),%rax
  a4bdd3:	48 83 c7 08          	add    $0x8,%rdi
  a4bdd7:	48 83 c6 08          	add    $0x8,%rsi
  a4bddb:	48 89 47 f8          	mov    %rax,-0x8(%rdi)
  a4bddf:	48 39 df             	cmp    %rbx,%rdi
  a4bde2:	72 ec                	jb     a4bdd0 <LZ4_decompress_safe_usingDict+0x90>
  a4bde4:	0f b7 75 00          	movzwl 0x0(%rbp),%esi
  a4bde8:	48 89 d8             	mov    %rbx,%rax
  a4bdeb:	48 83 c5 02          	add    $0x2,%rbp
  a4bdef:	48 29 f0             	sub    %rsi,%rax
  a4bdf2:	49 39 c4             	cmp    %rax,%r12
  a4bdf5:	0f 87 f5 01 00 00    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4bdfb:	89 cf                	mov    %ecx,%edi
  a4bdfd:	89 33                	mov    %esi,(%rbx)
  a4bdff:	83 e1 0f             	and    $0xf,%ecx
  a4be02:	83 e7 0f             	and    $0xf,%edi
  a4be05:	40 80 ff 0f          	cmp    $0xf,%dil
  a4be09:	0f 84 b1 01 00 00    	je     a4bfc0 <LZ4_decompress_safe_usingDict+0x280>
  a4be0f:	48 83 c1 04          	add    $0x4,%rcx
  a4be13:	48 8d 3c 0b          	lea    (%rbx,%rcx,1),%rdi
  a4be17:	48 83 fe 07          	cmp    $0x7,%rsi
  a4be1b:	0f 86 95 04 00 00    	jbe    a4c2b6 <LZ4_decompress_safe_usingDict+0x576>
  a4be21:	48 8b 30             	mov    (%rax),%rsi
  a4be24:	48 83 c0 08          	add    $0x8,%rax
  a4be28:	48 89 33             	mov    %rsi,(%rbx)
  a4be2b:	49 39 f8             	cmp    %rdi,%r8
  a4be2e:	0f 82 3e 04 00 00    	jb     a4c272 <LZ4_decompress_safe_usingDict+0x532>
  a4be34:	48 8b 30             	mov    (%rax),%rsi
  a4be37:	48 89 73 08          	mov    %rsi,0x8(%rbx)
  a4be3b:	48 83 f9 10          	cmp    $0x10,%rcx
  a4be3f:	0f 86 56 ff ff ff    	jbe    a4bd9b <LZ4_decompress_safe_usingDict+0x5b>
  a4be45:	48 83 c0 08          	add    $0x8,%rax
  a4be49:	48 83 c3 10          	add    $0x10,%rbx
  a4be4d:	0f 1f 00             	nopl   (%rax)
  a4be50:	48 8b 08             	mov    (%rax),%rcx
  a4be53:	48 83 c3 08          	add    $0x8,%rbx
  a4be57:	48 83 c0 08          	add    $0x8,%rax
  a4be5b:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
  a4be5f:	48 39 df             	cmp    %rbx,%rdi
  a4be62:	77 ec                	ja     a4be50 <LZ4_decompress_safe_usingDict+0x110>
  a4be64:	e9 32 ff ff ff       	jmpq   a4bd9b <LZ4_decompress_safe_usingDict+0x5b>
  a4be69:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4be70:	4d 63 d1             	movslq %r9d,%r10
  a4be73:	4b 8d 0c 10          	lea    (%r8,%r10,1),%rcx
  a4be77:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
  a4be7c:	49 39 cc             	cmp    %rcx,%r12
  a4be7f:	0f 84 75 02 00 00    	je     a4c0fa <LZ4_decompress_safe_usingDict+0x3ba>
  a4be85:	4d 8d 3c 14          	lea    (%r12,%rdx,1),%r15
  a4be89:	4c 89 e2             	mov    %r12,%rdx
  a4be8c:	4c 89 e3             	mov    %r12,%rbx
  a4be8f:	4d 89 d6             	mov    %r10,%r14
  a4be92:	4c 29 d2             	sub    %r10,%rdx
  a4be95:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
  a4be9a:	49 8d 57 f9          	lea    -0x7(%r15),%rdx
  a4be9e:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
  a4bea3:	85 c0                	test   %eax,%eax
  a4bea5:	0f 84 66 03 00 00    	je     a4c211 <LZ4_decompress_safe_usingDict+0x4d1>
  a4beab:	0f b6 4d 00          	movzbl 0x0(%rbp),%ecx
  a4beaf:	48 8d 75 01          	lea    0x1(%rbp),%rsi
  a4beb3:	89 ca                	mov    %ecx,%edx
  a4beb5:	c1 e9 04             	shr    $0x4,%ecx
  a4beb8:	89 c8                	mov    %ecx,%eax
  a4beba:	83 f9 0f             	cmp    $0xf,%ecx
  a4bebd:	0f 84 f5 01 00 00    	je     a4c0b8 <LZ4_decompress_safe_usingDict+0x378>
  a4bec3:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
  a4bec7:	48 8d 2c 06          	lea    (%rsi,%rax,1),%rbp
  a4becb:	49 8d 4f f4          	lea    -0xc(%r15),%rcx
  a4becf:	48 39 cf             	cmp    %rcx,%rdi
  a4bed2:	0f 87 f5 05 00 00    	ja     a4c4cd <LZ4_decompress_safe_usingDict+0x78d>
  a4bed8:	4d 8d 45 f8          	lea    -0x8(%r13),%r8
  a4bedc:	4c 39 c5             	cmp    %r8,%rbp
  a4bedf:	0f 87 e8 05 00 00    	ja     a4c4cd <LZ4_decompress_safe_usingDict+0x78d>
  a4bee5:	0f 1f 00             	nopl   (%rax)
  a4bee8:	48 8b 06             	mov    (%rsi),%rax
  a4beeb:	48 83 c3 08          	add    $0x8,%rbx
  a4beef:	48 83 c6 08          	add    $0x8,%rsi
  a4bef3:	48 89 43 f8          	mov    %rax,-0x8(%rbx)
  a4bef7:	48 39 df             	cmp    %rbx,%rdi
  a4befa:	77 ec                	ja     a4bee8 <LZ4_decompress_safe_usingDict+0x1a8>
  a4befc:	44 0f b7 45 00       	movzwl 0x0(%rbp),%r8d
  a4bf01:	48 89 fe             	mov    %rdi,%rsi
  a4bf04:	48 83 c5 02          	add    $0x2,%rbp
  a4bf08:	4c 89 c0             	mov    %r8,%rax
  a4bf0b:	4c 29 c6             	sub    %r8,%rsi
  a4bf0e:	48 39 74 24 08       	cmp    %rsi,0x8(%rsp)
  a4bf13:	76 0d                	jbe    a4bf22 <LZ4_decompress_safe_usingDict+0x1e2>
  a4bf15:	49 81 fe ff ff 00 00 	cmp    $0xffff,%r14
  a4bf1c:	0f 86 ce 00 00 00    	jbe    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4bf22:	89 07                	mov    %eax,(%rdi)
  a4bf24:	89 d0                	mov    %edx,%eax
  a4bf26:	83 e2 0f             	and    $0xf,%edx
  a4bf29:	83 e0 0f             	and    $0xf,%eax
  a4bf2c:	3c 0f                	cmp    $0xf,%al
  a4bf2e:	0f 84 fc 02 00 00    	je     a4c230 <LZ4_decompress_safe_usingDict+0x4f0>
  a4bf34:	48 83 c2 04          	add    $0x4,%rdx
  a4bf38:	48 8d 1c 17          	lea    (%rdi,%rdx,1),%rbx
  a4bf3c:	49 39 f4             	cmp    %rsi,%r12
  a4bf3f:	0f 86 c3 00 00 00    	jbe    a4c008 <LZ4_decompress_safe_usingDict+0x2c8>
  a4bf45:	49 8d 47 fb          	lea    -0x5(%r15),%rax
  a4bf49:	48 39 c3             	cmp    %rax,%rbx
  a4bf4c:	0f 87 9e 00 00 00    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4bf52:	4c 89 e1             	mov    %r12,%rcx
  a4bf55:	48 29 f1             	sub    %rsi,%rcx
  a4bf58:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  a4bf5d:	48 29 ce             	sub    %rcx,%rsi
  a4bf60:	48 39 ca             	cmp    %rcx,%rdx
  a4bf63:	0f 86 ff 02 00 00    	jbe    a4c268 <LZ4_decompress_safe_usingDict+0x528>
  a4bf69:	48 29 ca             	sub    %rcx,%rdx
  a4bf6c:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  a4bf71:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
  a4bf76:	48 89 ca             	mov    %rcx,%rdx
  a4bf79:	e8 42 1d 00 00       	callq  a4dcc0 <memcpy>
  a4bf7e:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  a4bf83:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
  a4bf88:	48 89 c7             	mov    %rax,%rdi
  a4bf8b:	48 01 cf             	add    %rcx,%rdi
  a4bf8e:	48 89 f8             	mov    %rdi,%rax
  a4bf91:	4c 29 e0             	sub    %r12,%rax
  a4bf94:	49 39 c0             	cmp    %rax,%r8
  a4bf97:	0f 86 04 01 00 00    	jbe    a4c0a1 <LZ4_decompress_safe_usingDict+0x361>
  a4bf9d:	48 39 fb             	cmp    %rdi,%rbx
  a4bfa0:	0f 86 52 05 00 00    	jbe    a4c4f8 <LZ4_decompress_safe_usingDict+0x7b8>
  a4bfa6:	31 c0                	xor    %eax,%eax
  a4bfa8:	41 0f b6 14 04       	movzbl (%r12,%rax,1),%edx
  a4bfad:	88 14 07             	mov    %dl,(%rdi,%rax,1)
  a4bfb0:	48 83 c0 01          	add    $0x1,%rax
  a4bfb4:	4c 39 c0             	cmp    %r8,%rax
  a4bfb7:	75 ef                	jne    a4bfa8 <LZ4_decompress_safe_usingDict+0x268>
  a4bfb9:	e9 ed fe ff ff       	jmpq   a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4bfbe:	66 90                	xchg   %ax,%ax
  a4bfc0:	b9 0f 00 00 00       	mov    $0xf,%ecx
  a4bfc5:	eb 1a                	jmp    a4bfe1 <LZ4_decompress_safe_usingDict+0x2a1>
  a4bfc7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4bfce:	00 00 
  a4bfd0:	44 0f b6 ff          	movzbl %dil,%r15d
  a4bfd4:	4c 01 f9             	add    %r15,%rcx
  a4bfd7:	40 80 ff ff          	cmp    $0xff,%dil
  a4bfdb:	0f 85 1f 03 00 00    	jne    a4c300 <LZ4_decompress_safe_usingDict+0x5c0>
  a4bfe1:	48 83 c5 01          	add    $0x1,%rbp
  a4bfe5:	0f b6 7d ff          	movzbl -0x1(%rbp),%edi
  a4bfe9:	4c 39 d5             	cmp    %r10,%rbp
  a4bfec:	75 e2                	jne    a4bfd0 <LZ4_decompress_safe_usingDict+0x290>
  a4bfee:	66 90                	xchg   %ax,%ax
  a4bff0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4bff5:	48 83 c4 38          	add    $0x38,%rsp
  a4bff9:	5b                   	pop    %rbx
  a4bffa:	5d                   	pop    %rbp
  a4bffb:	41 5c                	pop    %r12
  a4bffd:	41 5d                	pop    %r13
  a4bfff:	41 5e                	pop    %r14
  a4c001:	41 5f                	pop    %r15
  a4c003:	c3                   	retq   
  a4c004:	0f 1f 40 00          	nopl   0x0(%rax)
  a4c008:	49 83 f8 07          	cmp    $0x7,%r8
  a4c00c:	0f 86 7b 04 00 00    	jbe    a4c48d <LZ4_decompress_safe_usingDict+0x74d>
  a4c012:	48 8b 06             	mov    (%rsi),%rax
  a4c015:	48 89 07             	mov    %rax,(%rdi)
  a4c018:	48 8d 46 08          	lea    0x8(%rsi),%rax
  a4c01c:	48 39 d9             	cmp    %rbx,%rcx
  a4c01f:	0f 82 20 04 00 00    	jb     a4c445 <LZ4_decompress_safe_usingDict+0x705>
  a4c025:	48 8b 08             	mov    (%rax),%rcx
  a4c028:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
  a4c02c:	48 83 fa 10          	cmp    $0x10,%rdx
  a4c030:	0f 86 75 fe ff ff    	jbe    a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c036:	48 83 c0 08          	add    $0x8,%rax
  a4c03a:	48 83 c7 10          	add    $0x10,%rdi
  a4c03e:	66 90                	xchg   %ax,%ax
  a4c040:	48 8b 10             	mov    (%rax),%rdx
  a4c043:	48 83 c7 08          	add    $0x8,%rdi
  a4c047:	48 83 c0 08          	add    $0x8,%rax
  a4c04b:	48 89 57 f8          	mov    %rdx,-0x8(%rdi)
  a4c04f:	48 39 fb             	cmp    %rdi,%rbx
  a4c052:	77 ec                	ja     a4c040 <LZ4_decompress_safe_usingDict+0x300>
  a4c054:	e9 52 fe ff ff       	jmpq   a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c059:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4c060:	41 bf 0f 00 00 00    	mov    $0xf,%r15d
  a4c066:	eb 0d                	jmp    a4c075 <LZ4_decompress_safe_usingDict+0x335>
  a4c068:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4c06f:	00 
  a4c070:	80 fb ff             	cmp    $0xff,%bl
  a4c073:	75 0f                	jne    a4c084 <LZ4_decompress_safe_usingDict+0x344>
  a4c075:	0f b6 1e             	movzbl (%rsi),%ebx
  a4c078:	48 83 c6 01          	add    $0x1,%rsi
  a4c07c:	49 01 df             	add    %rbx,%r15
  a4c07f:	4c 39 ce             	cmp    %r9,%rsi
  a4c082:	72 ec                	jb     a4c070 <LZ4_decompress_safe_usingDict+0x330>
  a4c084:	48 89 fb             	mov    %rdi,%rbx
  a4c087:	4c 01 fb             	add    %r15,%rbx
  a4c08a:	0f 82 60 ff ff ff    	jb     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c090:	48 89 f5             	mov    %rsi,%rbp
  a4c093:	4c 01 fd             	add    %r15,%rbp
  a4c096:	0f 83 20 fd ff ff    	jae    a4bdbc <LZ4_decompress_safe_usingDict+0x7c>
  a4c09c:	e9 4f ff ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c0a1:	4c 89 c2             	mov    %r8,%rdx
  a4c0a4:	4c 89 e6             	mov    %r12,%rsi
  a4c0a7:	e8 14 1c 00 00       	callq  a4dcc0 <memcpy>
  a4c0ac:	e9 fa fd ff ff       	jmpq   a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c0b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4c0b8:	4d 8d 45 f1          	lea    -0xf(%r13),%r8
  a4c0bc:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4c0c1:	eb 0b                	jmp    a4c0ce <LZ4_decompress_safe_usingDict+0x38e>
  a4c0c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4c0c8:	40 80 ff ff          	cmp    $0xff,%dil
  a4c0cc:	75 0f                	jne    a4c0dd <LZ4_decompress_safe_usingDict+0x39d>
  a4c0ce:	0f b6 3e             	movzbl (%rsi),%edi
  a4c0d1:	48 83 c6 01          	add    $0x1,%rsi
  a4c0d5:	48 01 f8             	add    %rdi,%rax
  a4c0d8:	49 39 f0             	cmp    %rsi,%r8
  a4c0db:	77 eb                	ja     a4c0c8 <LZ4_decompress_safe_usingDict+0x388>
  a4c0dd:	48 89 df             	mov    %rbx,%rdi
  a4c0e0:	48 01 c7             	add    %rax,%rdi
  a4c0e3:	0f 82 07 ff ff ff    	jb     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c0e9:	48 89 f5             	mov    %rsi,%rbp
  a4c0ec:	48 01 c5             	add    %rax,%rbp
  a4c0ef:	0f 83 d6 fd ff ff    	jae    a4becb <LZ4_decompress_safe_usingDict+0x18b>
  a4c0f5:	e9 f6 fe ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c0fa:	4c 01 e2             	add    %r12,%rdx
  a4c0fd:	41 81 f9 fe ff 00 00 	cmp    $0xfffe,%r9d
  a4c104:	0f 8e 18 02 00 00    	jle    a4c322 <LZ4_decompress_safe_usingDict+0x5e2>
  a4c10a:	4d 8d 8c 24 00 00 ff 	lea    -0x10000(%r12),%r9
  a4c111:	ff 
  a4c112:	85 c0                	test   %eax,%eax
  a4c114:	0f 84 f7 00 00 00    	je     a4c211 <LZ4_decompress_safe_usingDict+0x4d1>
  a4c11a:	48 8d 42 fb          	lea    -0x5(%rdx),%rax
  a4c11e:	4d 8d 55 f1          	lea    -0xf(%r13),%r10
  a4c122:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a4c127:	4c 8d 42 f4          	lea    -0xc(%rdx),%r8
  a4c12b:	4d 8d 75 f8          	lea    -0x8(%r13),%r14
  a4c12f:	4d 8d 5d fc          	lea    -0x4(%r13),%r11
  a4c133:	4c 8d 7a f9          	lea    -0x7(%rdx),%r15
  a4c137:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  a4c13b:	48 8d 75 01          	lea    0x1(%rbp),%rsi
  a4c13f:	89 c7                	mov    %eax,%edi
  a4c141:	c1 e8 04             	shr    $0x4,%eax
  a4c144:	89 c1                	mov    %eax,%ecx
  a4c146:	83 f8 0f             	cmp    $0xf,%eax
  a4c149:	0f 84 29 04 00 00    	je     a4c578 <LZ4_decompress_safe_usingDict+0x838>
  a4c14f:	49 8d 1c 0c          	lea    (%r12,%rcx,1),%rbx
  a4c153:	48 8d 2c 0e          	lea    (%rsi,%rcx,1),%rbp
  a4c157:	49 39 d8             	cmp    %rbx,%r8
  a4c15a:	0f 82 11 06 00 00    	jb     a4c771 <LZ4_decompress_safe_usingDict+0xa31>
  a4c160:	4c 39 f5             	cmp    %r14,%rbp
  a4c163:	0f 87 08 06 00 00    	ja     a4c771 <LZ4_decompress_safe_usingDict+0xa31>
  a4c169:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4c170:	48 8b 06             	mov    (%rsi),%rax
  a4c173:	49 83 c4 08          	add    $0x8,%r12
  a4c177:	48 83 c6 08          	add    $0x8,%rsi
  a4c17b:	49 89 44 24 f8       	mov    %rax,-0x8(%r12)
  a4c180:	49 39 dc             	cmp    %rbx,%r12
  a4c183:	72 eb                	jb     a4c170 <LZ4_decompress_safe_usingDict+0x430>
  a4c185:	0f b7 4d 00          	movzwl 0x0(%rbp),%ecx
  a4c189:	48 89 de             	mov    %rbx,%rsi
  a4c18c:	48 83 c5 02          	add    $0x2,%rbp
  a4c190:	48 29 ce             	sub    %rcx,%rsi
  a4c193:	49 39 f1             	cmp    %rsi,%r9
  a4c196:	0f 87 54 fe ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c19c:	41 89 fc             	mov    %edi,%r12d
  a4c19f:	48 89 f8             	mov    %rdi,%rax
  a4c1a2:	89 0b                	mov    %ecx,(%rbx)
  a4c1a4:	41 83 e4 0f          	and    $0xf,%r12d
  a4c1a8:	83 e0 0f             	and    $0xf,%eax
  a4c1ab:	41 80 fc 0f          	cmp    $0xf,%r12b
  a4c1af:	0f 84 30 04 00 00    	je     a4c5e5 <LZ4_decompress_safe_usingDict+0x8a5>
  a4c1b5:	48 8d 78 04          	lea    0x4(%rax),%rdi
  a4c1b9:	4c 8d 24 3b          	lea    (%rbx,%rdi,1),%r12
  a4c1bd:	48 83 f9 07          	cmp    $0x7,%rcx
  a4c1c1:	0f 86 7c 04 00 00    	jbe    a4c643 <LZ4_decompress_safe_usingDict+0x903>
  a4c1c7:	48 8b 06             	mov    (%rsi),%rax
  a4c1ca:	48 89 03             	mov    %rax,(%rbx)
  a4c1cd:	48 8d 46 08          	lea    0x8(%rsi),%rax
  a4c1d1:	4d 39 e0             	cmp    %r12,%r8
  a4c1d4:	0f 82 a8 04 00 00    	jb     a4c682 <LZ4_decompress_safe_usingDict+0x942>
  a4c1da:	48 8b 08             	mov    (%rax),%rcx
  a4c1dd:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
  a4c1e1:	48 83 ff 10          	cmp    $0x10,%rdi
  a4c1e5:	0f 86 4c ff ff ff    	jbe    a4c137 <LZ4_decompress_safe_usingDict+0x3f7>
  a4c1eb:	48 83 c0 08          	add    $0x8,%rax
  a4c1ef:	48 83 c3 10          	add    $0x10,%rbx
  a4c1f3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4c1f8:	48 8b 08             	mov    (%rax),%rcx
  a4c1fb:	48 83 c3 08          	add    $0x8,%rbx
  a4c1ff:	48 83 c0 08          	add    $0x8,%rax
  a4c203:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
  a4c207:	49 39 dc             	cmp    %rbx,%r12
  a4c20a:	77 ec                	ja     a4c1f8 <LZ4_decompress_safe_usingDict+0x4b8>
  a4c20c:	e9 26 ff ff ff       	jmpq   a4c137 <LZ4_decompress_safe_usingDict+0x3f7>
  a4c211:	83 fe 01             	cmp    $0x1,%esi
  a4c214:	0f 85 d6 fd ff ff    	jne    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c21a:	31 c0                	xor    %eax,%eax
  a4c21c:	80 7d 00 00          	cmpb   $0x0,0x0(%rbp)
  a4c220:	0f 84 cf fd ff ff    	je     a4bff5 <LZ4_decompress_safe_usingDict+0x2b5>
  a4c226:	e9 c5 fd ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c22b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4c230:	4d 8d 55 fc          	lea    -0x4(%r13),%r10
  a4c234:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4c239:	eb 14                	jmp    a4c24f <LZ4_decompress_safe_usingDict+0x50f>
  a4c23b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4c240:	44 0f b6 c8          	movzbl %al,%r9d
  a4c244:	4c 01 ca             	add    %r9,%rdx
  a4c247:	3c ff                	cmp    $0xff,%al
  a4c249:	0f 85 c2 00 00 00    	jne    a4c311 <LZ4_decompress_safe_usingDict+0x5d1>
  a4c24f:	48 83 c5 01          	add    $0x1,%rbp
  a4c253:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
  a4c257:	49 39 ea             	cmp    %rbp,%r10
  a4c25a:	75 e4                	jne    a4c240 <LZ4_decompress_safe_usingDict+0x500>
  a4c25c:	e9 8f fd ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c261:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4c268:	e8 f3 19 00 00       	callq  a4dc60 <memmove>
  a4c26d:	e9 39 fc ff ff       	jmpq   a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c272:	48 3b 7c 24 08       	cmp    0x8(%rsp),%rdi
  a4c277:	0f 87 73 fd ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c27d:	48 83 c3 08          	add    $0x8,%rbx
  a4c281:	4c 39 f3             	cmp    %r14,%rbx
  a4c284:	0f 82 27 03 00 00    	jb     a4c5b1 <LZ4_decompress_safe_usingDict+0x871>
  a4c28a:	48 39 df             	cmp    %rbx,%rdi
  a4c28d:	0f 86 08 fb ff ff    	jbe    a4bd9b <LZ4_decompress_safe_usingDict+0x5b>
  a4c293:	49 89 ff             	mov    %rdi,%r15
  a4c296:	31 c9                	xor    %ecx,%ecx
  a4c298:	49 29 df             	sub    %rbx,%r15
  a4c29b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4c2a0:	0f b6 34 08          	movzbl (%rax,%rcx,1),%esi
  a4c2a4:	40 88 34 0b          	mov    %sil,(%rbx,%rcx,1)
  a4c2a8:	48 83 c1 01          	add    $0x1,%rcx
  a4c2ac:	49 39 cf             	cmp    %rcx,%r15
  a4c2af:	75 ef                	jne    a4c2a0 <LZ4_decompress_safe_usingDict+0x560>
  a4c2b1:	e9 e5 fa ff ff       	jmpq   a4bd9b <LZ4_decompress_safe_usingDict+0x5b>
  a4c2b6:	44 0f b6 38          	movzbl (%rax),%r15d
  a4c2ba:	44 88 3b             	mov    %r15b,(%rbx)
  a4c2bd:	44 0f b6 78 01       	movzbl 0x1(%rax),%r15d
  a4c2c2:	44 88 7b 01          	mov    %r15b,0x1(%rbx)
  a4c2c6:	44 0f b6 78 02       	movzbl 0x2(%rax),%r15d
  a4c2cb:	44 88 7b 02          	mov    %r15b,0x2(%rbx)
  a4c2cf:	44 0f b6 78 03       	movzbl 0x3(%rax),%r15d
  a4c2d4:	44 88 7b 03          	mov    %r15b,0x3(%rbx)
  a4c2d8:	4c 8d 3d c1 7c 00 00 	lea    0x7cc1(%rip),%r15        # a53fa0 <dec32table.3>
  a4c2df:	45 8b 3c b7          	mov    (%r15,%rsi,4),%r15d
  a4c2e3:	4c 01 f8             	add    %r15,%rax
  a4c2e6:	44 8b 38             	mov    (%rax),%r15d
  a4c2e9:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
  a4c2ed:	4c 8d 3d cc 7c 00 00 	lea    0x7ccc(%rip),%r15        # a53fc0 <dec64table.4>
  a4c2f4:	49 63 34 b7          	movslq (%r15,%rsi,4),%rsi
  a4c2f8:	48 29 f0             	sub    %rsi,%rax
  a4c2fb:	e9 2b fb ff ff       	jmpq   a4be2b <LZ4_decompress_safe_usingDict+0xeb>
  a4c300:	48 89 df             	mov    %rbx,%rdi
  a4c303:	48 01 cf             	add    %rcx,%rdi
  a4c306:	0f 83 03 fb ff ff    	jae    a4be0f <LZ4_decompress_safe_usingDict+0xcf>
  a4c30c:	e9 df fc ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c311:	48 89 f8             	mov    %rdi,%rax
  a4c314:	48 01 d0             	add    %rdx,%rax
  a4c317:	0f 83 17 fc ff ff    	jae    a4bf34 <LZ4_decompress_safe_usingDict+0x1f4>
  a4c31d:	e9 ce fc ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c322:	85 c0                	test   %eax,%eax
  a4c324:	0f 84 e7 fe ff ff    	je     a4c211 <LZ4_decompress_safe_usingDict+0x4d1>
  a4c32a:	48 8d 42 fb          	lea    -0x5(%rdx),%rax
  a4c32e:	4d 8d 55 f1          	lea    -0xf(%r13),%r10
  a4c332:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a4c337:	4c 8d 4a f4          	lea    -0xc(%rdx),%r9
  a4c33b:	4d 8d 75 f8          	lea    -0x8(%r13),%r14
  a4c33f:	4d 8d 5d fc          	lea    -0x4(%r13),%r11
  a4c343:	4c 8d 7a f9          	lea    -0x7(%rdx),%r15
  a4c347:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  a4c34b:	48 8d 75 01          	lea    0x1(%rbp),%rsi
  a4c34f:	89 c7                	mov    %eax,%edi
  a4c351:	c1 e8 04             	shr    $0x4,%eax
  a4c354:	89 c1                	mov    %eax,%ecx
  a4c356:	83 f8 0f             	cmp    $0xf,%eax
  a4c359:	0f 84 d6 01 00 00    	je     a4c535 <LZ4_decompress_safe_usingDict+0x7f5>
  a4c35f:	49 8d 1c 0c          	lea    (%r12,%rcx,1),%rbx
  a4c363:	48 8d 2c 0e          	lea    (%rsi,%rcx,1),%rbp
  a4c367:	49 39 d9             	cmp    %rbx,%r9
  a4c36a:	0f 82 29 04 00 00    	jb     a4c799 <LZ4_decompress_safe_usingDict+0xa59>
  a4c370:	4c 39 f5             	cmp    %r14,%rbp
  a4c373:	0f 87 20 04 00 00    	ja     a4c799 <LZ4_decompress_safe_usingDict+0xa59>
  a4c379:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4c380:	48 8b 06             	mov    (%rsi),%rax
  a4c383:	49 83 c4 08          	add    $0x8,%r12
  a4c387:	48 83 c6 08          	add    $0x8,%rsi
  a4c38b:	49 89 44 24 f8       	mov    %rax,-0x8(%r12)
  a4c390:	49 39 dc             	cmp    %rbx,%r12
  a4c393:	72 eb                	jb     a4c380 <LZ4_decompress_safe_usingDict+0x640>
  a4c395:	0f b7 4d 00          	movzwl 0x0(%rbp),%ecx
  a4c399:	48 89 de             	mov    %rbx,%rsi
  a4c39c:	48 83 c5 02          	add    $0x2,%rbp
  a4c3a0:	48 29 ce             	sub    %rcx,%rsi
  a4c3a3:	49 39 f0             	cmp    %rsi,%r8
  a4c3a6:	0f 87 44 fc ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c3ac:	41 89 fc             	mov    %edi,%r12d
  a4c3af:	48 89 f8             	mov    %rdi,%rax
  a4c3b2:	89 0b                	mov    %ecx,(%rbx)
  a4c3b4:	41 83 e4 0f          	and    $0xf,%r12d
  a4c3b8:	83 e0 0f             	and    $0xf,%eax
  a4c3bb:	41 80 fc 0f          	cmp    $0xf,%r12b
  a4c3bf:	0f 84 4e 02 00 00    	je     a4c613 <LZ4_decompress_safe_usingDict+0x8d3>
  a4c3c5:	48 8d 78 04          	lea    0x4(%rax),%rdi
  a4c3c9:	4c 8d 24 3b          	lea    (%rbx,%rdi,1),%r12
  a4c3cd:	48 83 f9 07          	cmp    $0x7,%rcx
  a4c3d1:	0f 86 2f 03 00 00    	jbe    a4c706 <LZ4_decompress_safe_usingDict+0x9c6>
  a4c3d7:	48 8b 06             	mov    (%rsi),%rax
  a4c3da:	48 89 03             	mov    %rax,(%rbx)
  a4c3dd:	48 8d 46 08          	lea    0x8(%rsi),%rax
  a4c3e1:	4d 39 e1             	cmp    %r12,%r9
  a4c3e4:	0f 82 dc 02 00 00    	jb     a4c6c6 <LZ4_decompress_safe_usingDict+0x986>
  a4c3ea:	48 8b 08             	mov    (%rax),%rcx
  a4c3ed:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
  a4c3f1:	48 83 ff 10          	cmp    $0x10,%rdi
  a4c3f5:	0f 86 4c ff ff ff    	jbe    a4c347 <LZ4_decompress_safe_usingDict+0x607>
  a4c3fb:	48 83 c0 08          	add    $0x8,%rax
  a4c3ff:	48 83 c3 10          	add    $0x10,%rbx
  a4c403:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4c408:	48 8b 08             	mov    (%rax),%rcx
  a4c40b:	48 83 c3 08          	add    $0x8,%rbx
  a4c40f:	48 83 c0 08          	add    $0x8,%rax
  a4c413:	48 89 4b f8          	mov    %rcx,-0x8(%rbx)
  a4c417:	49 39 dc             	cmp    %rbx,%r12
  a4c41a:	77 ec                	ja     a4c408 <LZ4_decompress_safe_usingDict+0x6c8>
  a4c41c:	e9 26 ff ff ff       	jmpq   a4c347 <LZ4_decompress_safe_usingDict+0x607>
  a4c421:	48 39 da             	cmp    %rbx,%rdx
  a4c424:	0f 82 c6 fb ff ff    	jb     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c42a:	4c 39 ed             	cmp    %r13,%rbp
  a4c42d:	0f 85 bd fb ff ff    	jne    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c433:	4c 89 fa             	mov    %r15,%rdx
  a4c436:	e8 85 18 00 00       	callq  a4dcc0 <memcpy>
  a4c43b:	89 d8                	mov    %ebx,%eax
  a4c43d:	44 29 e0             	sub    %r12d,%eax
  a4c440:	e9 b0 fb ff ff       	jmpq   a4bff5 <LZ4_decompress_safe_usingDict+0x2b5>
  a4c445:	49 8d 57 fb          	lea    -0x5(%r15),%rdx
  a4c449:	48 39 d3             	cmp    %rdx,%rbx
  a4c44c:	0f 87 9e fb ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c452:	48 83 c7 08          	add    $0x8,%rdi
  a4c456:	48 3b 7c 24 28       	cmp    0x28(%rsp),%rdi
  a4c45b:	0f 82 9f 00 00 00    	jb     a4c500 <LZ4_decompress_safe_usingDict+0x7c0>
  a4c461:	48 39 fb             	cmp    %rdi,%rbx
  a4c464:	0f 86 41 fa ff ff    	jbe    a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c46a:	48 89 de             	mov    %rbx,%rsi
  a4c46d:	31 d2                	xor    %edx,%edx
  a4c46f:	48 29 fe             	sub    %rdi,%rsi
  a4c472:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4c478:	0f b6 0c 10          	movzbl (%rax,%rdx,1),%ecx
  a4c47c:	88 0c 17             	mov    %cl,(%rdi,%rdx,1)
  a4c47f:	48 83 c2 01          	add    $0x1,%rdx
  a4c483:	48 39 d6             	cmp    %rdx,%rsi
  a4c486:	75 f0                	jne    a4c478 <LZ4_decompress_safe_usingDict+0x738>
  a4c488:	e9 1e fa ff ff       	jmpq   a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c48d:	0f b6 06             	movzbl (%rsi),%eax
  a4c490:	88 07                	mov    %al,(%rdi)
  a4c492:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
  a4c496:	88 47 01             	mov    %al,0x1(%rdi)
  a4c499:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
  a4c49d:	88 47 02             	mov    %al,0x2(%rdi)
  a4c4a0:	0f b6 46 03          	movzbl 0x3(%rsi),%eax
  a4c4a4:	88 47 03             	mov    %al,0x3(%rdi)
  a4c4a7:	48 8d 05 f2 7a 00 00 	lea    0x7af2(%rip),%rax        # a53fa0 <dec32table.3>
  a4c4ae:	42 8b 04 80          	mov    (%rax,%r8,4),%eax
  a4c4b2:	48 01 f0             	add    %rsi,%rax
  a4c4b5:	8b 30                	mov    (%rax),%esi
  a4c4b7:	89 77 04             	mov    %esi,0x4(%rdi)
  a4c4ba:	48 8d 35 ff 7a 00 00 	lea    0x7aff(%rip),%rsi        # a53fc0 <dec64table.4>
  a4c4c1:	4a 63 34 86          	movslq (%rsi,%r8,4),%rsi
  a4c4c5:	48 29 f0             	sub    %rsi,%rax
  a4c4c8:	e9 4f fb ff ff       	jmpq   a4c01c <LZ4_decompress_safe_usingDict+0x2dc>
  a4c4cd:	49 89 fe             	mov    %rdi,%r14
  a4c4d0:	48 89 c2             	mov    %rax,%rdx
  a4c4d3:	49 39 ed             	cmp    %rbp,%r13
  a4c4d6:	0f 85 14 fb ff ff    	jne    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c4dc:	4c 39 ff             	cmp    %r15,%rdi
  a4c4df:	0f 87 0b fb ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c4e5:	48 89 df             	mov    %rbx,%rdi
  a4c4e8:	e8 d3 17 00 00       	callq  a4dcc0 <memcpy>
  a4c4ed:	44 89 f0             	mov    %r14d,%eax
  a4c4f0:	44 29 e0             	sub    %r12d,%eax
  a4c4f3:	e9 fd fa ff ff       	jmpq   a4bff5 <LZ4_decompress_safe_usingDict+0x2b5>
  a4c4f8:	48 89 fb             	mov    %rdi,%rbx
  a4c4fb:	e9 ab f9 ff ff       	jmpq   a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c500:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
  a4c505:	48 89 c1             	mov    %rax,%rcx
  a4c508:	48 89 fa             	mov    %rdi,%rdx
  a4c50b:	48 8b 31             	mov    (%rcx),%rsi
  a4c50e:	48 83 c2 08          	add    $0x8,%rdx
  a4c512:	48 83 c1 08          	add    $0x8,%rcx
  a4c516:	48 89 72 f8          	mov    %rsi,-0x8(%rdx)
  a4c51a:	49 39 d0             	cmp    %rdx,%r8
  a4c51d:	77 ec                	ja     a4c50b <LZ4_decompress_safe_usingDict+0x7cb>
  a4c51f:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  a4c524:	48 89 ca             	mov    %rcx,%rdx
  a4c527:	48 29 fa             	sub    %rdi,%rdx
  a4c52a:	48 89 cf             	mov    %rcx,%rdi
  a4c52d:	48 01 d0             	add    %rdx,%rax
  a4c530:	e9 2c ff ff ff       	jmpq   a4c461 <LZ4_decompress_safe_usingDict+0x721>
  a4c535:	b9 0f 00 00 00       	mov    $0xf,%ecx
  a4c53a:	eb 09                	jmp    a4c545 <LZ4_decompress_safe_usingDict+0x805>
  a4c53c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4c540:	80 fb ff             	cmp    $0xff,%bl
  a4c543:	75 0f                	jne    a4c554 <LZ4_decompress_safe_usingDict+0x814>
  a4c545:	0f b6 1e             	movzbl (%rsi),%ebx
  a4c548:	48 83 c6 01          	add    $0x1,%rsi
  a4c54c:	48 01 d9             	add    %rbx,%rcx
  a4c54f:	4c 39 d6             	cmp    %r10,%rsi
  a4c552:	72 ec                	jb     a4c540 <LZ4_decompress_safe_usingDict+0x800>
  a4c554:	4c 89 e3             	mov    %r12,%rbx
  a4c557:	48 01 cb             	add    %rcx,%rbx
  a4c55a:	0f 82 90 fa ff ff    	jb     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c560:	48 89 f5             	mov    %rsi,%rbp
  a4c563:	48 01 cd             	add    %rcx,%rbp
  a4c566:	0f 83 fb fd ff ff    	jae    a4c367 <LZ4_decompress_safe_usingDict+0x627>
  a4c56c:	e9 7f fa ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c571:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4c578:	b9 0f 00 00 00       	mov    $0xf,%ecx
  a4c57d:	eb 06                	jmp    a4c585 <LZ4_decompress_safe_usingDict+0x845>
  a4c57f:	90                   	nop
  a4c580:	80 fb ff             	cmp    $0xff,%bl
  a4c583:	75 0f                	jne    a4c594 <LZ4_decompress_safe_usingDict+0x854>
  a4c585:	0f b6 1e             	movzbl (%rsi),%ebx
  a4c588:	48 83 c6 01          	add    $0x1,%rsi
  a4c58c:	48 01 d9             	add    %rbx,%rcx
  a4c58f:	4c 39 d6             	cmp    %r10,%rsi
  a4c592:	72 ec                	jb     a4c580 <LZ4_decompress_safe_usingDict+0x840>
  a4c594:	4c 89 e3             	mov    %r12,%rbx
  a4c597:	48 01 cb             	add    %rcx,%rbx
  a4c59a:	0f 82 50 fa ff ff    	jb     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c5a0:	48 89 f5             	mov    %rsi,%rbp
  a4c5a3:	48 01 cd             	add    %rcx,%rbp
  a4c5a6:	0f 83 ab fb ff ff    	jae    a4c157 <LZ4_decompress_safe_usingDict+0x417>
  a4c5ac:	e9 3f fa ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c5b1:	48 89 c6             	mov    %rax,%rsi
  a4c5b4:	48 89 d9             	mov    %rbx,%rcx
  a4c5b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4c5be:	00 00 
  a4c5c0:	4c 8b 3e             	mov    (%rsi),%r15
  a4c5c3:	48 83 c1 08          	add    $0x8,%rcx
  a4c5c7:	48 83 c6 08          	add    $0x8,%rsi
  a4c5cb:	4c 89 79 f8          	mov    %r15,-0x8(%rcx)
  a4c5cf:	49 39 ce             	cmp    %rcx,%r14
  a4c5d2:	77 ec                	ja     a4c5c0 <LZ4_decompress_safe_usingDict+0x880>
  a4c5d4:	4c 89 f1             	mov    %r14,%rcx
  a4c5d7:	48 29 d9             	sub    %rbx,%rcx
  a4c5da:	4c 89 f3             	mov    %r14,%rbx
  a4c5dd:	48 01 c8             	add    %rcx,%rax
  a4c5e0:	e9 a5 fc ff ff       	jmpq   a4c28a <LZ4_decompress_safe_usingDict+0x54a>
  a4c5e5:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4c5ea:	eb 15                	jmp    a4c601 <LZ4_decompress_safe_usingDict+0x8c1>
  a4c5ec:	0f 1f 40 00          	nopl   0x0(%rax)
  a4c5f0:	44 0f b6 e7          	movzbl %dil,%r12d
  a4c5f4:	4c 01 e0             	add    %r12,%rax
  a4c5f7:	40 80 ff ff          	cmp    $0xff,%dil
  a4c5fb:	0f 85 5f 01 00 00    	jne    a4c760 <LZ4_decompress_safe_usingDict+0xa20>
  a4c601:	48 83 c5 01          	add    $0x1,%rbp
  a4c605:	0f b6 7d ff          	movzbl -0x1(%rbp),%edi
  a4c609:	4c 39 dd             	cmp    %r11,%rbp
  a4c60c:	75 e2                	jne    a4c5f0 <LZ4_decompress_safe_usingDict+0x8b0>
  a4c60e:	e9 dd f9 ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c613:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4c618:	eb 17                	jmp    a4c631 <LZ4_decompress_safe_usingDict+0x8f1>
  a4c61a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4c620:	44 0f b6 e7          	movzbl %dil,%r12d
  a4c624:	4c 01 e0             	add    %r12,%rax
  a4c627:	40 80 ff ff          	cmp    $0xff,%dil
  a4c62b:	0f 85 14 01 00 00    	jne    a4c745 <LZ4_decompress_safe_usingDict+0xa05>
  a4c631:	48 83 c5 01          	add    $0x1,%rbp
  a4c635:	0f b6 7d ff          	movzbl -0x1(%rbp),%edi
  a4c639:	49 39 eb             	cmp    %rbp,%r11
  a4c63c:	75 e2                	jne    a4c620 <LZ4_decompress_safe_usingDict+0x8e0>
  a4c63e:	e9 ad f9 ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c643:	0f b6 06             	movzbl (%rsi),%eax
  a4c646:	88 03                	mov    %al,(%rbx)
  a4c648:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
  a4c64c:	88 43 01             	mov    %al,0x1(%rbx)
  a4c64f:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
  a4c653:	88 43 02             	mov    %al,0x2(%rbx)
  a4c656:	0f b6 46 03          	movzbl 0x3(%rsi),%eax
  a4c65a:	88 43 03             	mov    %al,0x3(%rbx)
  a4c65d:	48 8d 05 3c 79 00 00 	lea    0x793c(%rip),%rax        # a53fa0 <dec32table.3>
  a4c664:	8b 04 88             	mov    (%rax,%rcx,4),%eax
  a4c667:	48 01 f0             	add    %rsi,%rax
  a4c66a:	8b 30                	mov    (%rax),%esi
  a4c66c:	89 73 04             	mov    %esi,0x4(%rbx)
  a4c66f:	48 8d 35 4a 79 00 00 	lea    0x794a(%rip),%rsi        # a53fc0 <dec64table.4>
  a4c676:	48 63 0c 8e          	movslq (%rsi,%rcx,4),%rcx
  a4c67a:	48 29 c8             	sub    %rcx,%rax
  a4c67d:	e9 4f fb ff ff       	jmpq   a4c1d1 <LZ4_decompress_safe_usingDict+0x491>
  a4c682:	4c 3b 64 24 08       	cmp    0x8(%rsp),%r12
  a4c687:	0f 87 63 f9 ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c68d:	48 83 c3 08          	add    $0x8,%rbx
  a4c691:	4c 39 fb             	cmp    %r15,%rbx
  a4c694:	0f 82 41 01 00 00    	jb     a4c7db <LZ4_decompress_safe_usingDict+0xa9b>
  a4c69a:	49 39 dc             	cmp    %rbx,%r12
  a4c69d:	0f 86 94 fa ff ff    	jbe    a4c137 <LZ4_decompress_safe_usingDict+0x3f7>
  a4c6a3:	4c 89 e7             	mov    %r12,%rdi
  a4c6a6:	31 c9                	xor    %ecx,%ecx
  a4c6a8:	48 29 df             	sub    %rbx,%rdi
  a4c6ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4c6b0:	0f b6 34 08          	movzbl (%rax,%rcx,1),%esi
  a4c6b4:	40 88 34 0b          	mov    %sil,(%rbx,%rcx,1)
  a4c6b8:	48 83 c1 01          	add    $0x1,%rcx
  a4c6bc:	48 39 cf             	cmp    %rcx,%rdi
  a4c6bf:	75 ef                	jne    a4c6b0 <LZ4_decompress_safe_usingDict+0x970>
  a4c6c1:	e9 71 fa ff ff       	jmpq   a4c137 <LZ4_decompress_safe_usingDict+0x3f7>
  a4c6c6:	4c 3b 64 24 08       	cmp    0x8(%rsp),%r12
  a4c6cb:	0f 87 1f f9 ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c6d1:	48 83 c3 08          	add    $0x8,%rbx
  a4c6d5:	4c 39 fb             	cmp    %r15,%rbx
  a4c6d8:	0f 82 d2 00 00 00    	jb     a4c7b0 <LZ4_decompress_safe_usingDict+0xa70>
  a4c6de:	49 39 dc             	cmp    %rbx,%r12
  a4c6e1:	0f 86 60 fc ff ff    	jbe    a4c347 <LZ4_decompress_safe_usingDict+0x607>
  a4c6e7:	4c 89 e7             	mov    %r12,%rdi
  a4c6ea:	31 c9                	xor    %ecx,%ecx
  a4c6ec:	48 29 df             	sub    %rbx,%rdi
  a4c6ef:	90                   	nop
  a4c6f0:	0f b6 34 08          	movzbl (%rax,%rcx,1),%esi
  a4c6f4:	40 88 34 0b          	mov    %sil,(%rbx,%rcx,1)
  a4c6f8:	48 83 c1 01          	add    $0x1,%rcx
  a4c6fc:	48 39 cf             	cmp    %rcx,%rdi
  a4c6ff:	75 ef                	jne    a4c6f0 <LZ4_decompress_safe_usingDict+0x9b0>
  a4c701:	e9 41 fc ff ff       	jmpq   a4c347 <LZ4_decompress_safe_usingDict+0x607>
  a4c706:	0f b6 06             	movzbl (%rsi),%eax
  a4c709:	88 03                	mov    %al,(%rbx)
  a4c70b:	0f b6 46 01          	movzbl 0x1(%rsi),%eax
  a4c70f:	88 43 01             	mov    %al,0x1(%rbx)
  a4c712:	0f b6 46 02          	movzbl 0x2(%rsi),%eax
  a4c716:	88 43 02             	mov    %al,0x2(%rbx)
  a4c719:	0f b6 46 03          	movzbl 0x3(%rsi),%eax
  a4c71d:	88 43 03             	mov    %al,0x3(%rbx)
  a4c720:	48 8d 05 79 78 00 00 	lea    0x7879(%rip),%rax        # a53fa0 <dec32table.3>
  a4c727:	8b 04 88             	mov    (%rax,%rcx,4),%eax
  a4c72a:	48 01 f0             	add    %rsi,%rax
  a4c72d:	8b 30                	mov    (%rax),%esi
  a4c72f:	89 73 04             	mov    %esi,0x4(%rbx)
  a4c732:	48 8d 35 87 78 00 00 	lea    0x7887(%rip),%rsi        # a53fc0 <dec64table.4>
  a4c739:	48 63 0c 8e          	movslq (%rsi,%rcx,4),%rcx
  a4c73d:	48 29 c8             	sub    %rcx,%rax
  a4c740:	e9 9c fc ff ff       	jmpq   a4c3e1 <LZ4_decompress_safe_usingDict+0x6a1>
  a4c745:	48 89 df             	mov    %rbx,%rdi
  a4c748:	48 01 c7             	add    %rax,%rdi
  a4c74b:	0f 83 74 fc ff ff    	jae    a4c3c5 <LZ4_decompress_safe_usingDict+0x685>
  a4c751:	e9 9a f8 ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c756:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4c75d:	00 00 00 
  a4c760:	48 89 df             	mov    %rbx,%rdi
  a4c763:	48 01 c7             	add    %rax,%rdi
  a4c766:	0f 83 49 fa ff ff    	jae    a4c1b5 <LZ4_decompress_safe_usingDict+0x475>
  a4c76c:	e9 7f f8 ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c771:	48 39 d3             	cmp    %rdx,%rbx
  a4c774:	0f 87 76 f8 ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c77a:	4c 39 ed             	cmp    %r13,%rbp
  a4c77d:	0f 85 6d f8 ff ff    	jne    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c783:	48 89 ca             	mov    %rcx,%rdx
  a4c786:	4c 89 e7             	mov    %r12,%rdi
  a4c789:	e8 32 15 00 00       	callq  a4dcc0 <memcpy>
  a4c78e:	89 d8                	mov    %ebx,%eax
  a4c790:	2b 44 24 10          	sub    0x10(%rsp),%eax
  a4c794:	e9 5c f8 ff ff       	jmpq   a4bff5 <LZ4_decompress_safe_usingDict+0x2b5>
  a4c799:	49 39 ed             	cmp    %rbp,%r13
  a4c79c:	0f 85 4e f8 ff ff    	jne    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c7a2:	48 39 d3             	cmp    %rdx,%rbx
  a4c7a5:	76 dc                	jbe    a4c783 <LZ4_decompress_safe_usingDict+0xa43>
  a4c7a7:	e9 44 f8 ff ff       	jmpq   a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c7ac:	0f 1f 40 00          	nopl   0x0(%rax)
  a4c7b0:	48 89 c6             	mov    %rax,%rsi
  a4c7b3:	48 89 d9             	mov    %rbx,%rcx
  a4c7b6:	48 8b 3e             	mov    (%rsi),%rdi
  a4c7b9:	48 83 c1 08          	add    $0x8,%rcx
  a4c7bd:	48 83 c6 08          	add    $0x8,%rsi
  a4c7c1:	48 89 79 f8          	mov    %rdi,-0x8(%rcx)
  a4c7c5:	49 39 cf             	cmp    %rcx,%r15
  a4c7c8:	77 ec                	ja     a4c7b6 <LZ4_decompress_safe_usingDict+0xa76>
  a4c7ca:	4c 89 f9             	mov    %r15,%rcx
  a4c7cd:	48 29 d9             	sub    %rbx,%rcx
  a4c7d0:	4c 89 fb             	mov    %r15,%rbx
  a4c7d3:	48 01 c8             	add    %rcx,%rax
  a4c7d6:	e9 03 ff ff ff       	jmpq   a4c6de <LZ4_decompress_safe_usingDict+0x99e>
  a4c7db:	48 89 c6             	mov    %rax,%rsi
  a4c7de:	48 89 d9             	mov    %rbx,%rcx
  a4c7e1:	48 8b 3e             	mov    (%rsi),%rdi
  a4c7e4:	48 83 c1 08          	add    $0x8,%rcx
  a4c7e8:	48 83 c6 08          	add    $0x8,%rsi
  a4c7ec:	48 89 79 f8          	mov    %rdi,-0x8(%rcx)
  a4c7f0:	49 39 cf             	cmp    %rcx,%r15
  a4c7f3:	77 ec                	ja     a4c7e1 <LZ4_decompress_safe_usingDict+0xaa1>
  a4c7f5:	4c 89 f9             	mov    %r15,%rcx
  a4c7f8:	48 29 d9             	sub    %rbx,%rcx
  a4c7fb:	4c 89 fb             	mov    %r15,%rbx
  a4c7fe:	48 01 c8             	add    %rcx,%rax
  a4c801:	e9 94 fe ff ff       	jmpq   a4c69a <LZ4_decompress_safe_usingDict+0x95a>
  a4c806:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4c80d:	00 00 00 

0000000000a4c810 <LZ4_decompress_fast_usingDict>:
  a4c810:	f3 0f 1e fa          	endbr64 
  a4c814:	41 57                	push   %r15
  a4c816:	44 89 c0             	mov    %r8d,%eax
  a4c819:	41 56                	push   %r14
  a4c81b:	41 55                	push   %r13
  a4c81d:	49 89 f5             	mov    %rsi,%r13
  a4c820:	48 63 f2             	movslq %edx,%rsi
  a4c823:	41 54                	push   %r12
  a4c825:	55                   	push   %rbp
  a4c826:	53                   	push   %rbx
  a4c827:	48 83 ec 28          	sub    $0x28,%rsp
  a4c82b:	44 0f b6 07          	movzbl (%rdi),%r8d
  a4c82f:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  a4c834:	85 c0                	test   %eax,%eax
  a4c836:	0f 85 3e 02 00 00    	jne    a4ca7a <LZ4_decompress_fast_usingDict+0x26a>
  a4c83c:	4d 8d 5c 35 00       	lea    0x0(%r13,%rsi,1),%r11
  a4c841:	85 d2                	test   %edx,%edx
  a4c843:	0f 84 2a 04 00 00    	je     a4cc73 <LZ4_decompress_fast_usingDict+0x463>
  a4c849:	49 89 fc             	mov    %rdi,%r12
  a4c84c:	49 8d 73 f8          	lea    -0x8(%r11),%rsi
  a4c850:	49 8d 7b f4          	lea    -0xc(%r11),%rdi
  a4c854:	4c 8d 3d 65 77 00 00 	lea    0x7765(%rip),%r15        # a53fc0 <dec64table.4>
  a4c85b:	4c 8d 35 3e 77 00 00 	lea    0x773e(%rip),%r14        # a53fa0 <dec32table.3>
  a4c862:	4d 8d 53 f9          	lea    -0x7(%r11),%r10
  a4c866:	49 8d 6b fb          	lea    -0x5(%r11),%rbp
  a4c86a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4c870:	41 0f b6 c0          	movzbl %r8b,%eax
  a4c874:	49 83 c4 01          	add    $0x1,%r12
  a4c878:	c1 e8 04             	shr    $0x4,%eax
  a4c87b:	89 c3                	mov    %eax,%ebx
  a4c87d:	83 f8 0f             	cmp    $0xf,%eax
  a4c880:	0f 84 ca 00 00 00    	je     a4c950 <LZ4_decompress_fast_usingDict+0x140>
  a4c886:	49 8d 54 1d 00       	lea    0x0(%r13,%rbx,1),%rdx
  a4c88b:	48 39 f2             	cmp    %rsi,%rdx
  a4c88e:	0f 87 e3 00 00 00    	ja     a4c977 <LZ4_decompress_fast_usingDict+0x167>
  a4c894:	4c 89 e0             	mov    %r12,%rax
  a4c897:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4c89e:	00 00 
  a4c8a0:	48 8b 08             	mov    (%rax),%rcx
  a4c8a3:	49 83 c5 08          	add    $0x8,%r13
  a4c8a7:	48 83 c0 08          	add    $0x8,%rax
  a4c8ab:	49 89 4d f8          	mov    %rcx,-0x8(%r13)
  a4c8af:	4c 39 ea             	cmp    %r13,%rdx
  a4c8b2:	77 ec                	ja     a4c8a0 <LZ4_decompress_fast_usingDict+0x90>
  a4c8b4:	49 01 dc             	add    %rbx,%r12
  a4c8b7:	44 89 c1             	mov    %r8d,%ecx
  a4c8ba:	48 89 d0             	mov    %rdx,%rax
  a4c8bd:	41 83 e0 0f          	and    $0xf,%r8d
  a4c8c1:	45 0f b7 0c 24       	movzwl (%r12),%r9d
  a4c8c6:	83 e1 0f             	and    $0xf,%ecx
  a4c8c9:	49 83 c4 02          	add    $0x2,%r12
  a4c8cd:	44 89 0a             	mov    %r9d,(%rdx)
  a4c8d0:	4c 29 c8             	sub    %r9,%rax
  a4c8d3:	80 f9 0f             	cmp    $0xf,%cl
  a4c8d6:	0f 84 cc 00 00 00    	je     a4c9a8 <LZ4_decompress_fast_usingDict+0x198>
  a4c8dc:	49 83 c0 04          	add    $0x4,%r8
  a4c8e0:	4e 8d 2c 02          	lea    (%rdx,%r8,1),%r13
  a4c8e4:	49 83 f9 07          	cmp    $0x7,%r9
  a4c8e8:	0f 86 ea 00 00 00    	jbe    a4c9d8 <LZ4_decompress_fast_usingDict+0x1c8>
  a4c8ee:	48 8b 08             	mov    (%rax),%rcx
  a4c8f1:	48 83 c0 08          	add    $0x8,%rax
  a4c8f5:	48 89 0a             	mov    %rcx,(%rdx)
  a4c8f8:	49 39 fd             	cmp    %rdi,%r13
  a4c8fb:	0f 87 0f 01 00 00    	ja     a4ca10 <LZ4_decompress_fast_usingDict+0x200>
  a4c901:	48 8b 08             	mov    (%rax),%rcx
  a4c904:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  a4c908:	49 83 f8 10          	cmp    $0x10,%r8
  a4c90c:	77 12                	ja     a4c920 <LZ4_decompress_fast_usingDict+0x110>
  a4c90e:	45 0f b6 04 24       	movzbl (%r12),%r8d
  a4c913:	e9 58 ff ff ff       	jmpq   a4c870 <LZ4_decompress_fast_usingDict+0x60>
  a4c918:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4c91f:	00 
  a4c920:	48 83 c0 08          	add    $0x8,%rax
  a4c924:	48 83 c2 10          	add    $0x10,%rdx
  a4c928:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4c92f:	00 
  a4c930:	48 8b 08             	mov    (%rax),%rcx
  a4c933:	48 83 c2 08          	add    $0x8,%rdx
  a4c937:	48 83 c0 08          	add    $0x8,%rax
  a4c93b:	48 89 4a f8          	mov    %rcx,-0x8(%rdx)
  a4c93f:	49 39 d5             	cmp    %rdx,%r13
  a4c942:	77 ec                	ja     a4c930 <LZ4_decompress_fast_usingDict+0x120>
  a4c944:	eb c8                	jmp    a4c90e <LZ4_decompress_fast_usingDict+0xfe>
  a4c946:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4c94d:	00 00 00 
  a4c950:	bb 0f 00 00 00       	mov    $0xf,%ebx
  a4c955:	0f 1f 00             	nopl   (%rax)
  a4c958:	41 0f b6 14 24       	movzbl (%r12),%edx
  a4c95d:	49 83 c4 01          	add    $0x1,%r12
  a4c961:	48 01 d3             	add    %rdx,%rbx
  a4c964:	80 fa ff             	cmp    $0xff,%dl
  a4c967:	74 ef                	je     a4c958 <LZ4_decompress_fast_usingDict+0x148>
  a4c969:	49 8d 54 1d 00       	lea    0x0(%r13,%rbx,1),%rdx
  a4c96e:	48 39 f2             	cmp    %rsi,%rdx
  a4c971:	0f 86 1d ff ff ff    	jbe    a4c894 <LZ4_decompress_fast_usingDict+0x84>
  a4c977:	49 39 d3             	cmp    %rdx,%r11
  a4c97a:	0f 85 01 03 00 00    	jne    a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4c980:	48 89 da             	mov    %rbx,%rdx
  a4c983:	4c 89 e6             	mov    %r12,%rsi
  a4c986:	4c 89 ef             	mov    %r13,%rdi
  a4c989:	e8 32 13 00 00       	callq  a4dcc0 <memcpy>
  a4c98e:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
  a4c992:	2b 44 24 08          	sub    0x8(%rsp),%eax
  a4c996:	48 83 c4 28          	add    $0x28,%rsp
  a4c99a:	5b                   	pop    %rbx
  a4c99b:	5d                   	pop    %rbp
  a4c99c:	41 5c                	pop    %r12
  a4c99e:	41 5d                	pop    %r13
  a4c9a0:	41 5e                	pop    %r14
  a4c9a2:	41 5f                	pop    %r15
  a4c9a4:	c3                   	retq   
  a4c9a5:	0f 1f 00             	nopl   (%rax)
  a4c9a8:	41 b8 0f 00 00 00    	mov    $0xf,%r8d
  a4c9ae:	66 90                	xchg   %ax,%ax
  a4c9b0:	41 0f b6 1c 24       	movzbl (%r12),%ebx
  a4c9b5:	49 83 c4 01          	add    $0x1,%r12
  a4c9b9:	49 01 d8             	add    %rbx,%r8
  a4c9bc:	80 fb ff             	cmp    $0xff,%bl
  a4c9bf:	74 ef                	je     a4c9b0 <LZ4_decompress_fast_usingDict+0x1a0>
  a4c9c1:	49 83 c0 04          	add    $0x4,%r8
  a4c9c5:	4e 8d 2c 02          	lea    (%rdx,%r8,1),%r13
  a4c9c9:	49 83 f9 07          	cmp    $0x7,%r9
  a4c9cd:	0f 87 1b ff ff ff    	ja     a4c8ee <LZ4_decompress_fast_usingDict+0xde>
  a4c9d3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4c9d8:	0f b6 08             	movzbl (%rax),%ecx
  a4c9db:	88 0a                	mov    %cl,(%rdx)
  a4c9dd:	0f b6 48 01          	movzbl 0x1(%rax),%ecx
  a4c9e1:	88 4a 01             	mov    %cl,0x1(%rdx)
  a4c9e4:	0f b6 48 02          	movzbl 0x2(%rax),%ecx
  a4c9e8:	88 4a 02             	mov    %cl,0x2(%rdx)
  a4c9eb:	0f b6 48 03          	movzbl 0x3(%rax),%ecx
  a4c9ef:	88 4a 03             	mov    %cl,0x3(%rdx)
  a4c9f2:	43 8b 0c 8e          	mov    (%r14,%r9,4),%ecx
  a4c9f6:	48 01 c8             	add    %rcx,%rax
  a4c9f9:	8b 08                	mov    (%rax),%ecx
  a4c9fb:	89 4a 04             	mov    %ecx,0x4(%rdx)
  a4c9fe:	4b 63 0c 8f          	movslq (%r15,%r9,4),%rcx
  a4ca02:	48 29 c8             	sub    %rcx,%rax
  a4ca05:	49 39 fd             	cmp    %rdi,%r13
  a4ca08:	0f 86 f3 fe ff ff    	jbe    a4c901 <LZ4_decompress_fast_usingDict+0xf1>
  a4ca0e:	66 90                	xchg   %ax,%ax
  a4ca10:	49 39 ed             	cmp    %rbp,%r13
  a4ca13:	0f 87 68 02 00 00    	ja     a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4ca19:	48 83 c2 08          	add    $0x8,%rdx
  a4ca1d:	4c 39 d2             	cmp    %r10,%rdx
  a4ca20:	72 2d                	jb     a4ca4f <LZ4_decompress_fast_usingDict+0x23f>
  a4ca22:	49 39 d5             	cmp    %rdx,%r13
  a4ca25:	0f 86 e3 fe ff ff    	jbe    a4c90e <LZ4_decompress_fast_usingDict+0xfe>
  a4ca2b:	4d 89 e9             	mov    %r13,%r9
  a4ca2e:	31 c9                	xor    %ecx,%ecx
  a4ca30:	49 29 d1             	sub    %rdx,%r9
  a4ca33:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4ca38:	44 0f b6 04 08       	movzbl (%rax,%rcx,1),%r8d
  a4ca3d:	44 88 04 0a          	mov    %r8b,(%rdx,%rcx,1)
  a4ca41:	48 83 c1 01          	add    $0x1,%rcx
  a4ca45:	49 39 c9             	cmp    %rcx,%r9
  a4ca48:	75 ee                	jne    a4ca38 <LZ4_decompress_fast_usingDict+0x228>
  a4ca4a:	e9 bf fe ff ff       	jmpq   a4c90e <LZ4_decompress_fast_usingDict+0xfe>
  a4ca4f:	49 89 c0             	mov    %rax,%r8
  a4ca52:	48 89 d1             	mov    %rdx,%rcx
  a4ca55:	0f 1f 00             	nopl   (%rax)
  a4ca58:	4d 8b 08             	mov    (%r8),%r9
  a4ca5b:	48 83 c1 08          	add    $0x8,%rcx
  a4ca5f:	49 83 c0 08          	add    $0x8,%r8
  a4ca63:	4c 89 49 f8          	mov    %r9,-0x8(%rcx)
  a4ca67:	49 39 ca             	cmp    %rcx,%r10
  a4ca6a:	77 ec                	ja     a4ca58 <LZ4_decompress_fast_usingDict+0x248>
  a4ca6c:	4c 89 d1             	mov    %r10,%rcx
  a4ca6f:	48 29 d1             	sub    %rdx,%rcx
  a4ca72:	4c 89 d2             	mov    %r10,%rdx
  a4ca75:	48 01 c8             	add    %rcx,%rax
  a4ca78:	eb a8                	jmp    a4ca22 <LZ4_decompress_fast_usingDict+0x212>
  a4ca7a:	4c 63 d0             	movslq %eax,%r10
  a4ca7d:	4a 8d 2c 11          	lea    (%rcx,%r10,1),%rbp
  a4ca81:	49 39 ed             	cmp    %rbp,%r13
  a4ca84:	0f 84 be 02 00 00    	je     a4cd48 <LZ4_decompress_fast_usingDict+0x538>
  a4ca8a:	49 8d 5c 35 00       	lea    0x0(%r13,%rsi,1),%rbx
  a4ca8f:	85 d2                	test   %edx,%edx
  a4ca91:	0f 84 dc 01 00 00    	je     a4cc73 <LZ4_decompress_fast_usingDict+0x463>
  a4ca97:	48 8d 43 f9          	lea    -0x7(%rbx),%rax
  a4ca9b:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
  a4caa0:	4c 8d 63 f8          	lea    -0x8(%rbx),%r12
  a4caa4:	4d 89 ee             	mov    %r13,%r14
  a4caa7:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  a4caac:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
  a4cab1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4cab8:	41 0f b6 c0          	movzbl %r8b,%eax
  a4cabc:	49 83 c7 01          	add    $0x1,%r15
  a4cac0:	c1 e8 04             	shr    $0x4,%eax
  a4cac3:	89 c2                	mov    %eax,%edx
  a4cac5:	83 f8 0f             	cmp    $0xf,%eax
  a4cac8:	0f 84 77 01 00 00    	je     a4cc45 <LZ4_decompress_fast_usingDict+0x435>
  a4cace:	49 8d 3c 16          	lea    (%r14,%rdx,1),%rdi
  a4cad2:	4c 39 e7             	cmp    %r12,%rdi
  a4cad5:	0f 87 72 04 00 00    	ja     a4cf4d <LZ4_decompress_fast_usingDict+0x73d>
  a4cadb:	4c 89 f8             	mov    %r15,%rax
  a4cade:	66 90                	xchg   %ax,%ax
  a4cae0:	48 8b 08             	mov    (%rax),%rcx
  a4cae3:	49 83 c6 08          	add    $0x8,%r14
  a4cae7:	48 83 c0 08          	add    $0x8,%rax
  a4caeb:	49 89 4e f8          	mov    %rcx,-0x8(%r14)
  a4caef:	4c 39 f7             	cmp    %r14,%rdi
  a4caf2:	77 ec                	ja     a4cae0 <LZ4_decompress_fast_usingDict+0x2d0>
  a4caf4:	49 01 d7             	add    %rdx,%r15
  a4caf7:	44 89 c0             	mov    %r8d,%eax
  a4cafa:	49 89 fa             	mov    %rdi,%r10
  a4cafd:	4c 89 c2             	mov    %r8,%rdx
  a4cb00:	41 0f b7 37          	movzwl (%r15),%esi
  a4cb04:	83 e0 0f             	and    $0xf,%eax
  a4cb07:	49 83 c7 02          	add    $0x2,%r15
  a4cb0b:	83 e2 0f             	and    $0xf,%edx
  a4cb0e:	89 37                	mov    %esi,(%rdi)
  a4cb10:	49 29 f2             	sub    %rsi,%r10
  a4cb13:	3c 0f                	cmp    $0xf,%al
  a4cb15:	0f 84 06 01 00 00    	je     a4cc21 <LZ4_decompress_fast_usingDict+0x411>
  a4cb1b:	48 83 c2 04          	add    $0x4,%rdx
  a4cb1f:	4c 8d 34 17          	lea    (%rdi,%rdx,1),%r14
  a4cb23:	4d 39 d5             	cmp    %r10,%r13
  a4cb26:	0f 86 84 00 00 00    	jbe    a4cbb0 <LZ4_decompress_fast_usingDict+0x3a0>
  a4cb2c:	48 8d 43 fb          	lea    -0x5(%rbx),%rax
  a4cb30:	49 39 c6             	cmp    %rax,%r14
  a4cb33:	0f 87 48 01 00 00    	ja     a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4cb39:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  a4cb3e:	4c 89 e9             	mov    %r13,%rcx
  a4cb41:	4c 29 d1             	sub    %r10,%rcx
  a4cb44:	48 29 ce             	sub    %rcx,%rsi
  a4cb47:	48 39 ca             	cmp    %rcx,%rdx
  a4cb4a:	0f 86 15 01 00 00    	jbe    a4cc65 <LZ4_decompress_fast_usingDict+0x455>
  a4cb50:	48 29 ca             	sub    %rcx,%rdx
  a4cb53:	48 89 0c 24          	mov    %rcx,(%rsp)
  a4cb57:	48 89 d5             	mov    %rdx,%rbp
  a4cb5a:	48 89 ca             	mov    %rcx,%rdx
  a4cb5d:	e8 5e 11 00 00       	callq  a4dcc0 <memcpy>
  a4cb62:	48 8b 0c 24          	mov    (%rsp),%rcx
  a4cb66:	48 89 c7             	mov    %rax,%rdi
  a4cb69:	48 01 cf             	add    %rcx,%rdi
  a4cb6c:	48 89 f8             	mov    %rdi,%rax
  a4cb6f:	4c 29 e8             	sub    %r13,%rax
  a4cb72:	48 39 c5             	cmp    %rax,%rbp
  a4cb75:	0f 86 92 00 00 00    	jbe    a4cc0d <LZ4_decompress_fast_usingDict+0x3fd>
  a4cb7b:	49 39 fe             	cmp    %rdi,%r14
  a4cb7e:	0f 86 c1 03 00 00    	jbe    a4cf45 <LZ4_decompress_fast_usingDict+0x735>
  a4cb84:	31 c0                	xor    %eax,%eax
  a4cb86:	41 0f b6 54 05 00    	movzbl 0x0(%r13,%rax,1),%edx
  a4cb8c:	88 14 07             	mov    %dl,(%rdi,%rax,1)
  a4cb8f:	48 83 c0 01          	add    $0x1,%rax
  a4cb93:	48 39 c5             	cmp    %rax,%rbp
  a4cb96:	75 ee                	jne    a4cb86 <LZ4_decompress_fast_usingDict+0x376>
  a4cb98:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4cb9f:	00 
  a4cba0:	45 0f b6 07          	movzbl (%r15),%r8d
  a4cba4:	e9 0f ff ff ff       	jmpq   a4cab8 <LZ4_decompress_fast_usingDict+0x2a8>
  a4cba9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4cbb0:	48 83 fe 07          	cmp    $0x7,%rsi
  a4cbb4:	0f 86 19 01 00 00    	jbe    a4ccd3 <LZ4_decompress_fast_usingDict+0x4c3>
  a4cbba:	49 8b 02             	mov    (%r10),%rax
  a4cbbd:	48 89 07             	mov    %rax,(%rdi)
  a4cbc0:	49 8d 42 08          	lea    0x8(%r10),%rax
  a4cbc4:	48 8d 4b f4          	lea    -0xc(%rbx),%rcx
  a4cbc8:	49 39 ce             	cmp    %rcx,%r14
  a4cbcb:	0f 87 c4 00 00 00    	ja     a4cc95 <LZ4_decompress_fast_usingDict+0x485>
  a4cbd1:	48 8b 08             	mov    (%rax),%rcx
  a4cbd4:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
  a4cbd8:	48 83 fa 10          	cmp    $0x10,%rdx
  a4cbdc:	76 c2                	jbe    a4cba0 <LZ4_decompress_fast_usingDict+0x390>
  a4cbde:	48 83 c0 08          	add    $0x8,%rax
  a4cbe2:	48 83 c7 10          	add    $0x10,%rdi
  a4cbe6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4cbed:	00 00 00 
  a4cbf0:	48 8b 10             	mov    (%rax),%rdx
  a4cbf3:	48 83 c7 08          	add    $0x8,%rdi
  a4cbf7:	48 83 c0 08          	add    $0x8,%rax
  a4cbfb:	48 89 57 f8          	mov    %rdx,-0x8(%rdi)
  a4cbff:	4c 39 f7             	cmp    %r14,%rdi
  a4cc02:	72 ec                	jb     a4cbf0 <LZ4_decompress_fast_usingDict+0x3e0>
  a4cc04:	45 0f b6 07          	movzbl (%r15),%r8d
  a4cc08:	e9 ab fe ff ff       	jmpq   a4cab8 <LZ4_decompress_fast_usingDict+0x2a8>
  a4cc0d:	48 89 ea             	mov    %rbp,%rdx
  a4cc10:	4c 89 ee             	mov    %r13,%rsi
  a4cc13:	e8 a8 10 00 00       	callq  a4dcc0 <memcpy>
  a4cc18:	45 0f b6 07          	movzbl (%r15),%r8d
  a4cc1c:	e9 97 fe ff ff       	jmpq   a4cab8 <LZ4_decompress_fast_usingDict+0x2a8>
  a4cc21:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4cc26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4cc2d:	00 00 00 
  a4cc30:	41 0f b6 0f          	movzbl (%r15),%ecx
  a4cc34:	49 83 c7 01          	add    $0x1,%r15
  a4cc38:	48 01 ca             	add    %rcx,%rdx
  a4cc3b:	80 f9 ff             	cmp    $0xff,%cl
  a4cc3e:	74 f0                	je     a4cc30 <LZ4_decompress_fast_usingDict+0x420>
  a4cc40:	e9 d6 fe ff ff       	jmpq   a4cb1b <LZ4_decompress_fast_usingDict+0x30b>
  a4cc45:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4cc4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4cc50:	41 0f b6 0f          	movzbl (%r15),%ecx
  a4cc54:	49 83 c7 01          	add    $0x1,%r15
  a4cc58:	48 01 ca             	add    %rcx,%rdx
  a4cc5b:	80 f9 ff             	cmp    $0xff,%cl
  a4cc5e:	74 f0                	je     a4cc50 <LZ4_decompress_fast_usingDict+0x440>
  a4cc60:	e9 69 fe ff ff       	jmpq   a4cace <LZ4_decompress_fast_usingDict+0x2be>
  a4cc65:	e8 f6 0f 00 00       	callq  a4dc60 <memmove>
  a4cc6a:	45 0f b6 07          	movzbl (%r15),%r8d
  a4cc6e:	e9 45 fe ff ff       	jmpq   a4cab8 <LZ4_decompress_fast_usingDict+0x2a8>
  a4cc73:	b8 01 00 00 00       	mov    $0x1,%eax
  a4cc78:	45 84 c0             	test   %r8b,%r8b
  a4cc7b:	0f 84 15 fd ff ff    	je     a4c996 <LZ4_decompress_fast_usingDict+0x186>
  a4cc81:	48 83 c4 28          	add    $0x28,%rsp
  a4cc85:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4cc8a:	5b                   	pop    %rbx
  a4cc8b:	5d                   	pop    %rbp
  a4cc8c:	41 5c                	pop    %r12
  a4cc8e:	41 5d                	pop    %r13
  a4cc90:	41 5e                	pop    %r14
  a4cc92:	41 5f                	pop    %r15
  a4cc94:	c3                   	retq   
  a4cc95:	48 8d 53 fb          	lea    -0x5(%rbx),%rdx
  a4cc99:	49 39 d6             	cmp    %rdx,%r14
  a4cc9c:	77 e3                	ja     a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4cc9e:	48 83 c7 08          	add    $0x8,%rdi
  a4cca2:	48 3b 7c 24 18       	cmp    0x18(%rsp),%rdi
  a4cca7:	72 6d                	jb     a4cd16 <LZ4_decompress_fast_usingDict+0x506>
  a4cca9:	4c 39 f7             	cmp    %r14,%rdi
  a4ccac:	0f 83 ee fe ff ff    	jae    a4cba0 <LZ4_decompress_fast_usingDict+0x390>
  a4ccb2:	4c 89 f6             	mov    %r14,%rsi
  a4ccb5:	31 d2                	xor    %edx,%edx
  a4ccb7:	48 29 fe             	sub    %rdi,%rsi
  a4ccba:	0f b6 0c 10          	movzbl (%rax,%rdx,1),%ecx
  a4ccbe:	88 0c 17             	mov    %cl,(%rdi,%rdx,1)
  a4ccc1:	48 83 c2 01          	add    $0x1,%rdx
  a4ccc5:	48 39 d6             	cmp    %rdx,%rsi
  a4ccc8:	75 f0                	jne    a4ccba <LZ4_decompress_fast_usingDict+0x4aa>
  a4ccca:	45 0f b6 07          	movzbl (%r15),%r8d
  a4ccce:	e9 e5 fd ff ff       	jmpq   a4cab8 <LZ4_decompress_fast_usingDict+0x2a8>
  a4ccd3:	41 0f b6 02          	movzbl (%r10),%eax
  a4ccd7:	88 07                	mov    %al,(%rdi)
  a4ccd9:	41 0f b6 42 01       	movzbl 0x1(%r10),%eax
  a4ccde:	88 47 01             	mov    %al,0x1(%rdi)
  a4cce1:	41 0f b6 42 02       	movzbl 0x2(%r10),%eax
  a4cce6:	88 47 02             	mov    %al,0x2(%rdi)
  a4cce9:	41 0f b6 42 03       	movzbl 0x3(%r10),%eax
  a4ccee:	88 47 03             	mov    %al,0x3(%rdi)
  a4ccf1:	48 8d 05 a8 72 00 00 	lea    0x72a8(%rip),%rax        # a53fa0 <dec32table.3>
  a4ccf8:	8b 04 b0             	mov    (%rax,%rsi,4),%eax
  a4ccfb:	4c 01 d0             	add    %r10,%rax
  a4ccfe:	8b 08                	mov    (%rax),%ecx
  a4cd00:	89 4f 04             	mov    %ecx,0x4(%rdi)
  a4cd03:	48 8d 0d b6 72 00 00 	lea    0x72b6(%rip),%rcx        # a53fc0 <dec64table.4>
  a4cd0a:	48 63 0c b1          	movslq (%rcx,%rsi,4),%rcx
  a4cd0e:	48 29 c8             	sub    %rcx,%rax
  a4cd11:	e9 ae fe ff ff       	jmpq   a4cbc4 <LZ4_decompress_fast_usingDict+0x3b4>
  a4cd16:	48 89 c1             	mov    %rax,%rcx
  a4cd19:	48 89 fa             	mov    %rdi,%rdx
  a4cd1c:	48 8b 31             	mov    (%rcx),%rsi
  a4cd1f:	48 83 c2 08          	add    $0x8,%rdx
  a4cd23:	48 83 c1 08          	add    $0x8,%rcx
  a4cd27:	48 89 72 f8          	mov    %rsi,-0x8(%rdx)
  a4cd2b:	48 39 54 24 18       	cmp    %rdx,0x18(%rsp)
  a4cd30:	77 ea                	ja     a4cd1c <LZ4_decompress_fast_usingDict+0x50c>
  a4cd32:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  a4cd37:	48 89 f2             	mov    %rsi,%rdx
  a4cd3a:	48 29 fa             	sub    %rdi,%rdx
  a4cd3d:	48 89 f7             	mov    %rsi,%rdi
  a4cd40:	48 01 d0             	add    %rdx,%rax
  a4cd43:	e9 61 ff ff ff       	jmpq   a4cca9 <LZ4_decompress_fast_usingDict+0x499>
  a4cd48:	48 01 ee             	add    %rbp,%rsi
  a4cd4b:	3d fe ff 00 00       	cmp    $0xfffe,%eax
  a4cd50:	0f 8e 55 02 00 00    	jle    a4cfab <LZ4_decompress_fast_usingDict+0x79b>
  a4cd56:	85 d2                	test   %edx,%edx
  a4cd58:	0f 84 15 ff ff ff    	je     a4cc73 <LZ4_decompress_fast_usingDict+0x463>
  a4cd5e:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  a4cd63:	4c 8d 4e f8          	lea    -0x8(%rsi),%r9
  a4cd67:	48 8d 7e f4          	lea    -0xc(%rsi),%rdi
  a4cd6b:	4c 8d 3d 4e 72 00 00 	lea    0x724e(%rip),%r15        # a53fc0 <dec64table.4>
  a4cd72:	4c 8d 35 27 72 00 00 	lea    0x7227(%rip),%r14        # a53fa0 <dec32table.3>
  a4cd79:	4c 8d 5e f9          	lea    -0x7(%rsi),%r11
  a4cd7d:	4c 8d 6e fb          	lea    -0x5(%rsi),%r13
  a4cd81:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4cd88:	41 0f b6 c0          	movzbl %r8b,%eax
  a4cd8c:	48 83 c3 01          	add    $0x1,%rbx
  a4cd90:	c1 e8 04             	shr    $0x4,%eax
  a4cd93:	41 89 c4             	mov    %eax,%r12d
  a4cd96:	83 f8 0f             	cmp    $0xf,%eax
  a4cd99:	0f 84 a7 00 00 00    	je     a4ce46 <LZ4_decompress_fast_usingDict+0x636>
  a4cd9f:	4a 8d 54 25 00       	lea    0x0(%rbp,%r12,1),%rdx
  a4cda4:	4c 39 ca             	cmp    %r9,%rdx
  a4cda7:	0f 87 6a 01 00 00    	ja     a4cf17 <LZ4_decompress_fast_usingDict+0x707>
  a4cdad:	48 89 d8             	mov    %rbx,%rax
  a4cdb0:	48 8b 08             	mov    (%rax),%rcx
  a4cdb3:	48 83 c5 08          	add    $0x8,%rbp
  a4cdb7:	48 83 c0 08          	add    $0x8,%rax
  a4cdbb:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
  a4cdbf:	48 39 ea             	cmp    %rbp,%rdx
  a4cdc2:	77 ec                	ja     a4cdb0 <LZ4_decompress_fast_usingDict+0x5a0>
  a4cdc4:	4c 01 e3             	add    %r12,%rbx
  a4cdc7:	44 89 c0             	mov    %r8d,%eax
  a4cdca:	49 89 d4             	mov    %rdx,%r12
  a4cdcd:	4c 89 c1             	mov    %r8,%rcx
  a4cdd0:	44 0f b7 13          	movzwl (%rbx),%r10d
  a4cdd4:	83 e0 0f             	and    $0xf,%eax
  a4cdd7:	48 83 c3 02          	add    $0x2,%rbx
  a4cddb:	83 e1 0f             	and    $0xf,%ecx
  a4cdde:	44 89 12             	mov    %r10d,(%rdx)
  a4cde1:	4d 29 d4             	sub    %r10,%r12
  a4cde4:	3c 0f                	cmp    $0xf,%al
  a4cde6:	74 7c                	je     a4ce64 <LZ4_decompress_fast_usingDict+0x654>
  a4cde8:	48 83 c1 04          	add    $0x4,%rcx
  a4cdec:	48 8d 2c 0a          	lea    (%rdx,%rcx,1),%rbp
  a4cdf0:	49 83 fa 07          	cmp    $0x7,%r10
  a4cdf4:	0f 86 99 00 00 00    	jbe    a4ce93 <LZ4_decompress_fast_usingDict+0x683>
  a4cdfa:	49 8b 04 24          	mov    (%r12),%rax
  a4cdfe:	48 89 02             	mov    %rax,(%rdx)
  a4ce01:	49 8d 44 24 08       	lea    0x8(%r12),%rax
  a4ce06:	48 39 fd             	cmp    %rdi,%rbp
  a4ce09:	0f 87 c4 00 00 00    	ja     a4ced3 <LZ4_decompress_fast_usingDict+0x6c3>
  a4ce0f:	4c 8b 00             	mov    (%rax),%r8
  a4ce12:	4c 89 42 08          	mov    %r8,0x8(%rdx)
  a4ce16:	48 83 f9 10          	cmp    $0x10,%rcx
  a4ce1a:	77 09                	ja     a4ce25 <LZ4_decompress_fast_usingDict+0x615>
  a4ce1c:	44 0f b6 03          	movzbl (%rbx),%r8d
  a4ce20:	e9 63 ff ff ff       	jmpq   a4cd88 <LZ4_decompress_fast_usingDict+0x578>
  a4ce25:	48 83 c0 08          	add    $0x8,%rax
  a4ce29:	48 83 c2 10          	add    $0x10,%rdx
  a4ce2d:	0f 1f 00             	nopl   (%rax)
  a4ce30:	48 8b 08             	mov    (%rax),%rcx
  a4ce33:	48 83 c2 08          	add    $0x8,%rdx
  a4ce37:	48 83 c0 08          	add    $0x8,%rax
  a4ce3b:	48 89 4a f8          	mov    %rcx,-0x8(%rdx)
  a4ce3f:	48 39 d5             	cmp    %rdx,%rbp
  a4ce42:	77 ec                	ja     a4ce30 <LZ4_decompress_fast_usingDict+0x620>
  a4ce44:	eb d6                	jmp    a4ce1c <LZ4_decompress_fast_usingDict+0x60c>
  a4ce46:	41 bc 0f 00 00 00    	mov    $0xf,%r12d
  a4ce4c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4ce50:	0f b6 13             	movzbl (%rbx),%edx
  a4ce53:	48 83 c3 01          	add    $0x1,%rbx
  a4ce57:	49 01 d4             	add    %rdx,%r12
  a4ce5a:	80 fa ff             	cmp    $0xff,%dl
  a4ce5d:	74 f1                	je     a4ce50 <LZ4_decompress_fast_usingDict+0x640>
  a4ce5f:	e9 3b ff ff ff       	jmpq   a4cd9f <LZ4_decompress_fast_usingDict+0x58f>
  a4ce64:	b9 0f 00 00 00       	mov    $0xf,%ecx
  a4ce69:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4ce70:	44 0f b6 03          	movzbl (%rbx),%r8d
  a4ce74:	48 83 c3 01          	add    $0x1,%rbx
  a4ce78:	4c 01 c1             	add    %r8,%rcx
  a4ce7b:	41 80 f8 ff          	cmp    $0xff,%r8b
  a4ce7f:	74 ef                	je     a4ce70 <LZ4_decompress_fast_usingDict+0x660>
  a4ce81:	48 83 c1 04          	add    $0x4,%rcx
  a4ce85:	48 8d 2c 0a          	lea    (%rdx,%rcx,1),%rbp
  a4ce89:	49 83 fa 07          	cmp    $0x7,%r10
  a4ce8d:	0f 87 67 ff ff ff    	ja     a4cdfa <LZ4_decompress_fast_usingDict+0x5ea>
  a4ce93:	41 0f b6 04 24       	movzbl (%r12),%eax
  a4ce98:	88 02                	mov    %al,(%rdx)
  a4ce9a:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  a4cea0:	88 42 01             	mov    %al,0x1(%rdx)
  a4cea3:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
  a4cea9:	88 42 02             	mov    %al,0x2(%rdx)
  a4ceac:	41 0f b6 44 24 03    	movzbl 0x3(%r12),%eax
  a4ceb2:	88 42 03             	mov    %al,0x3(%rdx)
  a4ceb5:	43 8b 04 96          	mov    (%r14,%r10,4),%eax
  a4ceb9:	4c 01 e0             	add    %r12,%rax
  a4cebc:	44 8b 00             	mov    (%rax),%r8d
  a4cebf:	44 89 42 04          	mov    %r8d,0x4(%rdx)
  a4cec3:	4f 63 04 97          	movslq (%r15,%r10,4),%r8
  a4cec7:	4c 29 c0             	sub    %r8,%rax
  a4ceca:	48 39 fd             	cmp    %rdi,%rbp
  a4cecd:	0f 86 3c ff ff ff    	jbe    a4ce0f <LZ4_decompress_fast_usingDict+0x5ff>
  a4ced3:	4c 39 ed             	cmp    %r13,%rbp
  a4ced6:	0f 87 a5 fd ff ff    	ja     a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4cedc:	48 83 c2 08          	add    $0x8,%rdx
  a4cee0:	4c 39 da             	cmp    %r11,%rdx
  a4cee3:	0f 82 97 00 00 00    	jb     a4cf80 <LZ4_decompress_fast_usingDict+0x770>
  a4cee9:	48 39 d5             	cmp    %rdx,%rbp
  a4ceec:	0f 86 2a ff ff ff    	jbe    a4ce1c <LZ4_decompress_fast_usingDict+0x60c>
  a4cef2:	49 89 ea             	mov    %rbp,%r10
  a4cef5:	31 c9                	xor    %ecx,%ecx
  a4cef7:	49 29 d2             	sub    %rdx,%r10
  a4cefa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4cf00:	44 0f b6 04 08       	movzbl (%rax,%rcx,1),%r8d
  a4cf05:	44 88 04 0a          	mov    %r8b,(%rdx,%rcx,1)
  a4cf09:	48 83 c1 01          	add    $0x1,%rcx
  a4cf0d:	49 39 ca             	cmp    %rcx,%r10
  a4cf10:	75 ee                	jne    a4cf00 <LZ4_decompress_fast_usingDict+0x6f0>
  a4cf12:	e9 05 ff ff ff       	jmpq   a4ce1c <LZ4_decompress_fast_usingDict+0x60c>
  a4cf17:	48 39 f2             	cmp    %rsi,%rdx
  a4cf1a:	0f 85 61 fd ff ff    	jne    a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4cf20:	4c 89 e2             	mov    %r12,%rdx
  a4cf23:	48 89 de             	mov    %rbx,%rsi
  a4cf26:	48 89 ef             	mov    %rbp,%rdi
  a4cf29:	e8 92 0d 00 00       	callq  a4dcc0 <memcpy>
  a4cf2e:	4a 8d 04 23          	lea    (%rbx,%r12,1),%rax
  a4cf32:	2b 44 24 08          	sub    0x8(%rsp),%eax
  a4cf36:	48 83 c4 28          	add    $0x28,%rsp
  a4cf3a:	5b                   	pop    %rbx
  a4cf3b:	5d                   	pop    %rbp
  a4cf3c:	41 5c                	pop    %r12
  a4cf3e:	41 5d                	pop    %r13
  a4cf40:	41 5e                	pop    %r14
  a4cf42:	41 5f                	pop    %r15
  a4cf44:	c3                   	retq   
  a4cf45:	49 89 fe             	mov    %rdi,%r14
  a4cf48:	e9 53 fc ff ff       	jmpq   a4cba0 <LZ4_decompress_fast_usingDict+0x390>
  a4cf4d:	48 39 fb             	cmp    %rdi,%rbx
  a4cf50:	0f 85 2b fd ff ff    	jne    a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4cf56:	4c 89 fe             	mov    %r15,%rsi
  a4cf59:	4c 89 f7             	mov    %r14,%rdi
  a4cf5c:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  a4cf61:	4c 89 3c 24          	mov    %r15,(%rsp)
  a4cf65:	e8 56 0d 00 00       	callq  a4dcc0 <memcpy>
  a4cf6a:	48 8b 0c 24          	mov    (%rsp),%rcx
  a4cf6e:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  a4cf73:	48 8d 04 11          	lea    (%rcx,%rdx,1),%rax
  a4cf77:	2b 44 24 08          	sub    0x8(%rsp),%eax
  a4cf7b:	e9 16 fa ff ff       	jmpq   a4c996 <LZ4_decompress_fast_usingDict+0x186>
  a4cf80:	49 89 c0             	mov    %rax,%r8
  a4cf83:	48 89 d1             	mov    %rdx,%rcx
  a4cf86:	4d 8b 10             	mov    (%r8),%r10
  a4cf89:	48 83 c1 08          	add    $0x8,%rcx
  a4cf8d:	49 83 c0 08          	add    $0x8,%r8
  a4cf91:	4c 89 51 f8          	mov    %r10,-0x8(%rcx)
  a4cf95:	49 39 cb             	cmp    %rcx,%r11
  a4cf98:	77 ec                	ja     a4cf86 <LZ4_decompress_fast_usingDict+0x776>
  a4cf9a:	4c 89 d9             	mov    %r11,%rcx
  a4cf9d:	48 29 d1             	sub    %rdx,%rcx
  a4cfa0:	4c 89 da             	mov    %r11,%rdx
  a4cfa3:	48 01 c8             	add    %rcx,%rax
  a4cfa6:	e9 3e ff ff ff       	jmpq   a4cee9 <LZ4_decompress_fast_usingDict+0x6d9>
  a4cfab:	85 d2                	test   %edx,%edx
  a4cfad:	0f 84 c0 fc ff ff    	je     a4cc73 <LZ4_decompress_fast_usingDict+0x463>
  a4cfb3:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  a4cfb8:	4c 8d 4e f8          	lea    -0x8(%rsi),%r9
  a4cfbc:	48 8d 7e f4          	lea    -0xc(%rsi),%rdi
  a4cfc0:	4c 8d 3d f9 6f 00 00 	lea    0x6ff9(%rip),%r15        # a53fc0 <dec64table.4>
  a4cfc7:	4c 8d 35 d2 6f 00 00 	lea    0x6fd2(%rip),%r14        # a53fa0 <dec32table.3>
  a4cfce:	4c 8d 5e f9          	lea    -0x7(%rsi),%r11
  a4cfd2:	4c 8d 6e fb          	lea    -0x5(%rsi),%r13
  a4cfd6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4cfdd:	00 00 00 
  a4cfe0:	41 0f b6 c0          	movzbl %r8b,%eax
  a4cfe4:	48 83 c3 01          	add    $0x1,%rbx
  a4cfe8:	c1 e8 04             	shr    $0x4,%eax
  a4cfeb:	41 89 c4             	mov    %eax,%r12d
  a4cfee:	83 f8 0f             	cmp    $0xf,%eax
  a4cff1:	0f 84 af 00 00 00    	je     a4d0a6 <LZ4_decompress_fast_usingDict+0x896>
  a4cff7:	4a 8d 54 25 00       	lea    0x0(%rbp,%r12,1),%rdx
  a4cffc:	4c 39 ca             	cmp    %r9,%rdx
  a4cfff:	0f 87 12 ff ff ff    	ja     a4cf17 <LZ4_decompress_fast_usingDict+0x707>
  a4d005:	48 89 d8             	mov    %rbx,%rax
  a4d008:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4d00f:	00 
  a4d010:	48 8b 08             	mov    (%rax),%rcx
  a4d013:	48 83 c5 08          	add    $0x8,%rbp
  a4d017:	48 83 c0 08          	add    $0x8,%rax
  a4d01b:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
  a4d01f:	48 39 ea             	cmp    %rbp,%rdx
  a4d022:	77 ec                	ja     a4d010 <LZ4_decompress_fast_usingDict+0x800>
  a4d024:	4c 01 e3             	add    %r12,%rbx
  a4d027:	44 89 c0             	mov    %r8d,%eax
  a4d02a:	49 89 d4             	mov    %rdx,%r12
  a4d02d:	4c 89 c1             	mov    %r8,%rcx
  a4d030:	44 0f b7 13          	movzwl (%rbx),%r10d
  a4d034:	83 e0 0f             	and    $0xf,%eax
  a4d037:	48 83 c3 02          	add    $0x2,%rbx
  a4d03b:	83 e1 0f             	and    $0xf,%ecx
  a4d03e:	44 89 12             	mov    %r10d,(%rdx)
  a4d041:	4d 29 d4             	sub    %r10,%r12
  a4d044:	3c 0f                	cmp    $0xf,%al
  a4d046:	74 7c                	je     a4d0c4 <LZ4_decompress_fast_usingDict+0x8b4>
  a4d048:	48 83 c1 04          	add    $0x4,%rcx
  a4d04c:	48 8d 2c 0a          	lea    (%rdx,%rcx,1),%rbp
  a4d050:	49 83 fa 07          	cmp    $0x7,%r10
  a4d054:	0f 86 99 00 00 00    	jbe    a4d0f3 <LZ4_decompress_fast_usingDict+0x8e3>
  a4d05a:	49 8b 04 24          	mov    (%r12),%rax
  a4d05e:	48 89 02             	mov    %rax,(%rdx)
  a4d061:	49 8d 44 24 08       	lea    0x8(%r12),%rax
  a4d066:	48 39 fd             	cmp    %rdi,%rbp
  a4d069:	0f 87 c4 00 00 00    	ja     a4d133 <LZ4_decompress_fast_usingDict+0x923>
  a4d06f:	4c 8b 00             	mov    (%rax),%r8
  a4d072:	4c 89 42 08          	mov    %r8,0x8(%rdx)
  a4d076:	48 83 f9 10          	cmp    $0x10,%rcx
  a4d07a:	77 09                	ja     a4d085 <LZ4_decompress_fast_usingDict+0x875>
  a4d07c:	44 0f b6 03          	movzbl (%rbx),%r8d
  a4d080:	e9 5b ff ff ff       	jmpq   a4cfe0 <LZ4_decompress_fast_usingDict+0x7d0>
  a4d085:	48 83 c0 08          	add    $0x8,%rax
  a4d089:	48 83 c2 10          	add    $0x10,%rdx
  a4d08d:	0f 1f 00             	nopl   (%rax)
  a4d090:	48 8b 08             	mov    (%rax),%rcx
  a4d093:	48 83 c2 08          	add    $0x8,%rdx
  a4d097:	48 83 c0 08          	add    $0x8,%rax
  a4d09b:	48 89 4a f8          	mov    %rcx,-0x8(%rdx)
  a4d09f:	48 39 d5             	cmp    %rdx,%rbp
  a4d0a2:	77 ec                	ja     a4d090 <LZ4_decompress_fast_usingDict+0x880>
  a4d0a4:	eb d6                	jmp    a4d07c <LZ4_decompress_fast_usingDict+0x86c>
  a4d0a6:	41 bc 0f 00 00 00    	mov    $0xf,%r12d
  a4d0ac:	0f 1f 40 00          	nopl   0x0(%rax)
  a4d0b0:	0f b6 13             	movzbl (%rbx),%edx
  a4d0b3:	48 83 c3 01          	add    $0x1,%rbx
  a4d0b7:	49 01 d4             	add    %rdx,%r12
  a4d0ba:	80 fa ff             	cmp    $0xff,%dl
  a4d0bd:	74 f1                	je     a4d0b0 <LZ4_decompress_fast_usingDict+0x8a0>
  a4d0bf:	e9 33 ff ff ff       	jmpq   a4cff7 <LZ4_decompress_fast_usingDict+0x7e7>
  a4d0c4:	b9 0f 00 00 00       	mov    $0xf,%ecx
  a4d0c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4d0d0:	44 0f b6 03          	movzbl (%rbx),%r8d
  a4d0d4:	48 83 c3 01          	add    $0x1,%rbx
  a4d0d8:	4c 01 c1             	add    %r8,%rcx
  a4d0db:	41 80 f8 ff          	cmp    $0xff,%r8b
  a4d0df:	74 ef                	je     a4d0d0 <LZ4_decompress_fast_usingDict+0x8c0>
  a4d0e1:	48 83 c1 04          	add    $0x4,%rcx
  a4d0e5:	48 8d 2c 0a          	lea    (%rdx,%rcx,1),%rbp
  a4d0e9:	49 83 fa 07          	cmp    $0x7,%r10
  a4d0ed:	0f 87 67 ff ff ff    	ja     a4d05a <LZ4_decompress_fast_usingDict+0x84a>
  a4d0f3:	41 0f b6 04 24       	movzbl (%r12),%eax
  a4d0f8:	88 02                	mov    %al,(%rdx)
  a4d0fa:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  a4d100:	88 42 01             	mov    %al,0x1(%rdx)
  a4d103:	41 0f b6 44 24 02    	movzbl 0x2(%r12),%eax
  a4d109:	88 42 02             	mov    %al,0x2(%rdx)
  a4d10c:	41 0f b6 44 24 03    	movzbl 0x3(%r12),%eax
  a4d112:	88 42 03             	mov    %al,0x3(%rdx)
  a4d115:	43 8b 04 96          	mov    (%r14,%r10,4),%eax
  a4d119:	4c 01 e0             	add    %r12,%rax
  a4d11c:	44 8b 00             	mov    (%rax),%r8d
  a4d11f:	44 89 42 04          	mov    %r8d,0x4(%rdx)
  a4d123:	4f 63 04 97          	movslq (%r15,%r10,4),%r8
  a4d127:	4c 29 c0             	sub    %r8,%rax
  a4d12a:	48 39 fd             	cmp    %rdi,%rbp
  a4d12d:	0f 86 3c ff ff ff    	jbe    a4d06f <LZ4_decompress_fast_usingDict+0x85f>
  a4d133:	4c 39 ed             	cmp    %r13,%rbp
  a4d136:	0f 87 45 fb ff ff    	ja     a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4d13c:	48 83 c2 08          	add    $0x8,%rdx
  a4d140:	4c 39 da             	cmp    %r11,%rdx
  a4d143:	72 32                	jb     a4d177 <LZ4_decompress_fast_usingDict+0x967>
  a4d145:	48 39 d5             	cmp    %rdx,%rbp
  a4d148:	0f 86 2e ff ff ff    	jbe    a4d07c <LZ4_decompress_fast_usingDict+0x86c>
  a4d14e:	49 89 ea             	mov    %rbp,%r10
  a4d151:	31 c9                	xor    %ecx,%ecx
  a4d153:	49 29 d2             	sub    %rdx,%r10
  a4d156:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4d15d:	00 00 00 
  a4d160:	44 0f b6 04 08       	movzbl (%rax,%rcx,1),%r8d
  a4d165:	44 88 04 0a          	mov    %r8b,(%rdx,%rcx,1)
  a4d169:	48 83 c1 01          	add    $0x1,%rcx
  a4d16d:	49 39 ca             	cmp    %rcx,%r10
  a4d170:	75 ee                	jne    a4d160 <LZ4_decompress_fast_usingDict+0x950>
  a4d172:	e9 05 ff ff ff       	jmpq   a4d07c <LZ4_decompress_fast_usingDict+0x86c>
  a4d177:	49 89 c0             	mov    %rax,%r8
  a4d17a:	48 89 d1             	mov    %rdx,%rcx
  a4d17d:	4d 8b 10             	mov    (%r8),%r10
  a4d180:	48 83 c1 08          	add    $0x8,%rcx
  a4d184:	49 83 c0 08          	add    $0x8,%r8
  a4d188:	4c 89 51 f8          	mov    %r10,-0x8(%rcx)
  a4d18c:	49 39 cb             	cmp    %rcx,%r11
  a4d18f:	77 ec                	ja     a4d17d <LZ4_decompress_fast_usingDict+0x96d>
  a4d191:	4c 89 d9             	mov    %r11,%rcx
  a4d194:	48 29 d1             	sub    %rdx,%rcx
  a4d197:	4c 89 da             	mov    %r11,%rdx
  a4d19a:	48 01 c8             	add    %rcx,%rax
  a4d19d:	eb a6                	jmp    a4d145 <LZ4_decompress_fast_usingDict+0x935>
  a4d19f:	90                   	nop

0000000000a4d1a0 <__putstr>:
  a4d1a0:	f3 0f 1e fa          	endbr64 
  a4d1a4:	8b 35 32 e0 01 00    	mov    0x1e032(%rip),%esi        # a6b1dc <early_serial_base>
  a4d1aa:	49 89 f9             	mov    %rdi,%r9
  a4d1ad:	85 f6                	test   %esi,%esi
  a4d1af:	74 62                	je     a4d213 <__putstr+0x73>
  a4d1b1:	0f b6 07             	movzbl (%rdi),%eax
  a4d1b4:	84 c0                	test   %al,%al
  a4d1b6:	74 5b                	je     a4d213 <__putstr+0x73>
  a4d1b8:	49 89 f8             	mov    %rdi,%r8
  a4d1bb:	41 bb 0d 00 00 00    	mov    $0xd,%r11d
  a4d1c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4d1c8:	8d 7e 05             	lea    0x5(%rsi),%edi
  a4d1cb:	3c 0a                	cmp    $0xa,%al
  a4d1cd:	0f 84 3d 01 00 00    	je     a4d310 <__putstr+0x170>
  a4d1d3:	49 83 c0 01          	add    $0x1,%r8
  a4d1d7:	89 fa                	mov    %edi,%edx
  a4d1d9:	45 0f b6 50 ff       	movzbl -0x1(%r8),%r10d
  a4d1de:	ec                   	in     (%dx),%al
  a4d1df:	a8 20                	test   $0x20,%al
  a4d1e1:	75 22                	jne    a4d205 <__putstr+0x65>
  a4d1e3:	b9 fe ff 00 00       	mov    $0xfffe,%ecx
  a4d1e8:	eb 0b                	jmp    a4d1f5 <__putstr+0x55>
  a4d1ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4d1f0:	83 e9 01             	sub    $0x1,%ecx
  a4d1f3:	74 10                	je     a4d205 <__putstr+0x65>
  a4d1f5:	f3 90                	pause  
  a4d1f7:	8b 35 df df 01 00    	mov    0x1dfdf(%rip),%esi        # a6b1dc <early_serial_base>
  a4d1fd:	8d 56 05             	lea    0x5(%rsi),%edx
  a4d200:	ec                   	in     (%dx),%al
  a4d201:	a8 20                	test   $0x20,%al
  a4d203:	74 eb                	je     a4d1f0 <__putstr+0x50>
  a4d205:	44 89 d0             	mov    %r10d,%eax
  a4d208:	89 f2                	mov    %esi,%edx
  a4d20a:	ee                   	out    %al,(%dx)
  a4d20b:	41 0f b6 00          	movzbl (%r8),%eax
  a4d20f:	84 c0                	test   %al,%al
  a4d211:	75 b5                	jne    a4d1c8 <__putstr+0x28>
  a4d213:	8b 05 1b df 01 00    	mov    0x1df1b(%rip),%eax        # a6b134 <lines>
  a4d219:	85 c0                	test   %eax,%eax
  a4d21b:	0f 84 e8 00 00 00    	je     a4d309 <__putstr+0x169>
  a4d221:	8b 05 09 df 01 00    	mov    0x1df09(%rip),%eax        # a6b130 <cols>
  a4d227:	85 c0                	test   %eax,%eax
  a4d229:	0f 84 da 00 00 00    	je     a4d309 <__putstr+0x169>
  a4d22f:	55                   	push   %rbp
  a4d230:	53                   	push   %rbx
  a4d231:	49 8d 59 01          	lea    0x1(%r9),%rbx
  a4d235:	48 83 ec 08          	sub    $0x8,%rsp
  a4d239:	48 8b 35 d0 ce 01 00 	mov    0x1ced0(%rip),%rsi        # a6a110 <boot_params>
  a4d240:	41 0f b6 11          	movzbl (%r9),%edx
  a4d244:	0f b6 0e             	movzbl (%rsi),%ecx
  a4d247:	0f b6 6e 01          	movzbl 0x1(%rsi),%ebp
  a4d24b:	41 89 c8             	mov    %ecx,%r8d
  a4d24e:	89 ef                	mov    %ebp,%edi
  a4d250:	84 d2                	test   %dl,%dl
  a4d252:	75 1b                	jne    a4d26f <__putstr+0xcf>
  a4d254:	eb 6f                	jmp    a4d2c5 <__putstr+0x125>
  a4d256:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4d25d:	00 00 00 
  a4d260:	89 c5                	mov    %eax,%ebp
  a4d262:	31 c9                	xor    %ecx,%ecx
  a4d264:	0f b6 13             	movzbl (%rbx),%edx
  a4d267:	48 83 c3 01          	add    $0x1,%rbx
  a4d26b:	84 d2                	test   %dl,%dl
  a4d26d:	74 44                	je     a4d2b3 <__putstr+0x113>
  a4d26f:	80 fa 0a             	cmp    $0xa,%dl
  a4d272:	74 22                	je     a4d296 <__putstr+0xf6>
  a4d274:	8b 35 b6 de 01 00    	mov    0x1deb6(%rip),%esi        # a6b130 <cols>
  a4d27a:	48 8b 3d bf de 01 00 	mov    0x1debf(%rip),%rdi        # a6b140 <vidmem>
  a4d281:	89 f0                	mov    %esi,%eax
  a4d283:	0f af c5             	imul   %ebp,%eax
  a4d286:	01 c8                	add    %ecx,%eax
  a4d288:	83 c1 01             	add    $0x1,%ecx
  a4d28b:	01 c0                	add    %eax,%eax
  a4d28d:	48 98                	cltq   
  a4d28f:	88 14 07             	mov    %dl,(%rdi,%rax,1)
  a4d292:	39 ce                	cmp    %ecx,%esi
  a4d294:	7f ce                	jg     a4d264 <__putstr+0xc4>
  a4d296:	8d 45 01             	lea    0x1(%rbp),%eax
  a4d299:	3b 05 95 de 01 00    	cmp    0x1de95(%rip),%eax        # a6b134 <lines>
  a4d29f:	7c bf                	jl     a4d260 <__putstr+0xc0>
  a4d2a1:	e8 7a d3 ff ff       	callq  a4a620 <scroll>
  a4d2a6:	0f b6 13             	movzbl (%rbx),%edx
  a4d2a9:	48 83 c3 01          	add    $0x1,%rbx
  a4d2ad:	31 c9                	xor    %ecx,%ecx
  a4d2af:	84 d2                	test   %dl,%dl
  a4d2b1:	75 bc                	jne    a4d26f <__putstr+0xcf>
  a4d2b3:	48 8b 35 56 ce 01 00 	mov    0x1ce56(%rip),%rsi        # a6a110 <boot_params>
  a4d2ba:	8b 05 70 de 01 00    	mov    0x1de70(%rip),%eax        # a6b130 <cols>
  a4d2c0:	41 89 c8             	mov    %ecx,%r8d
  a4d2c3:	89 ef                	mov    %ebp,%edi
  a4d2c5:	0f af e8             	imul   %eax,%ebp
  a4d2c8:	44 88 06             	mov    %r8b,(%rsi)
  a4d2cb:	8b 35 67 de 01 00    	mov    0x1de67(%rip),%esi        # a6b138 <vidport>
  a4d2d1:	b8 0e 00 00 00       	mov    $0xe,%eax
  a4d2d6:	48 8b 15 33 ce 01 00 	mov    0x1ce33(%rip),%rdx        # a6a110 <boot_params>
  a4d2dd:	01 e9                	add    %ebp,%ecx
  a4d2df:	40 88 7a 01          	mov    %dil,0x1(%rdx)
  a4d2e3:	89 f2                	mov    %esi,%edx
  a4d2e5:	01 c9                	add    %ecx,%ecx
  a4d2e7:	ee                   	out    %al,(%dx)
  a4d2e8:	8d 7e 01             	lea    0x1(%rsi),%edi
  a4d2eb:	89 c8                	mov    %ecx,%eax
  a4d2ed:	c1 f8 09             	sar    $0x9,%eax
  a4d2f0:	89 fa                	mov    %edi,%edx
  a4d2f2:	ee                   	out    %al,(%dx)
  a4d2f3:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4d2f8:	89 f2                	mov    %esi,%edx
  a4d2fa:	ee                   	out    %al,(%dx)
  a4d2fb:	89 c8                	mov    %ecx,%eax
  a4d2fd:	89 fa                	mov    %edi,%edx
  a4d2ff:	d1 f8                	sar    %eax
  a4d301:	ee                   	out    %al,(%dx)
  a4d302:	48 83 c4 08          	add    $0x8,%rsp
  a4d306:	5b                   	pop    %rbx
  a4d307:	5d                   	pop    %rbp
  a4d308:	c3                   	retq   
  a4d309:	c3                   	retq   
  a4d30a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4d310:	89 fa                	mov    %edi,%edx
  a4d312:	ec                   	in     (%dx),%al
  a4d313:	a8 20                	test   $0x20,%al
  a4d315:	75 20                	jne    a4d337 <__putstr+0x197>
  a4d317:	b9 fe ff 00 00       	mov    $0xfffe,%ecx
  a4d31c:	eb 07                	jmp    a4d325 <__putstr+0x185>
  a4d31e:	66 90                	xchg   %ax,%ax
  a4d320:	83 e9 01             	sub    $0x1,%ecx
  a4d323:	74 12                	je     a4d337 <__putstr+0x197>
  a4d325:	f3 90                	pause  
  a4d327:	8b 35 af de 01 00    	mov    0x1deaf(%rip),%esi        # a6b1dc <early_serial_base>
  a4d32d:	8d 7e 05             	lea    0x5(%rsi),%edi
  a4d330:	89 fa                	mov    %edi,%edx
  a4d332:	ec                   	in     (%dx),%al
  a4d333:	a8 20                	test   $0x20,%al
  a4d335:	74 e9                	je     a4d320 <__putstr+0x180>
  a4d337:	44 89 d8             	mov    %r11d,%eax
  a4d33a:	89 f2                	mov    %esi,%edx
  a4d33c:	ee                   	out    %al,(%dx)
  a4d33d:	e9 91 fe ff ff       	jmpq   a4d1d3 <__putstr+0x33>
  a4d342:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4d349:	00 00 00 00 
  a4d34d:	0f 1f 00             	nopl   (%rax)

0000000000a4d350 <__puthex>:
  a4d350:	f3 0f 1e fa          	endbr64 
  a4d354:	41 54                	push   %r12
  a4d356:	b8 30 00 00 00       	mov    $0x30,%eax
  a4d35b:	55                   	push   %rbp
  a4d35c:	48 89 fd             	mov    %rdi,%rbp
  a4d35f:	53                   	push   %rbx
  a4d360:	bb 3c 00 00 00       	mov    $0x3c,%ebx
  a4d365:	48 83 ec 10          	sub    $0x10,%rsp
  a4d369:	66 89 44 24 0e       	mov    %ax,0xe(%rsp)
  a4d36e:	4c 8d 64 24 0e       	lea    0xe(%rsp),%r12
  a4d373:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4d378:	89 d9                	mov    %ebx,%ecx
  a4d37a:	48 89 e8             	mov    %rbp,%rax
  a4d37d:	4c 89 e7             	mov    %r12,%rdi
  a4d380:	48 d3 e8             	shr    %cl,%rax
  a4d383:	83 e0 0f             	and    $0xf,%eax
  a4d386:	8d 48 30             	lea    0x30(%rax),%ecx
  a4d389:	48 83 f8 09          	cmp    $0x9,%rax
  a4d38d:	8d 50 57             	lea    0x57(%rax),%edx
  a4d390:	89 c8                	mov    %ecx,%eax
  a4d392:	0f 47 c2             	cmova  %edx,%eax
  a4d395:	83 eb 04             	sub    $0x4,%ebx
  a4d398:	88 44 24 0e          	mov    %al,0xe(%rsp)
  a4d39c:	e8 ff fd ff ff       	callq  a4d1a0 <__putstr>
  a4d3a1:	83 fb fc             	cmp    $0xfffffffc,%ebx
  a4d3a4:	75 d2                	jne    a4d378 <__puthex+0x28>
  a4d3a6:	48 83 c4 10          	add    $0x10,%rsp
  a4d3aa:	5b                   	pop    %rbx
  a4d3ab:	5d                   	pop    %rbp
  a4d3ac:	41 5c                	pop    %r12
  a4d3ae:	c3                   	retq   
  a4d3af:	90                   	nop

0000000000a4d3b0 <extract_kernel>:
  a4d3b0:	f3 0f 1e fa          	endbr64 
  a4d3b4:	41 57                	push   %r15
  a4d3b6:	49 89 ff             	mov    %rdi,%r15
  a4d3b9:	41 56                	push   %r14
  a4d3bb:	49 89 f6             	mov    %rsi,%r14
  a4d3be:	41 55                	push   %r13
  a4d3c0:	41 54                	push   %r12
  a4d3c2:	55                   	push   %rbp
  a4d3c3:	53                   	push   %rbx
  a4d3c4:	48 89 d3             	mov    %rdx,%rbx
  a4d3c7:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
  a4d3ce:	80 a7 11 02 00 00 fd 	andb   $0xfd,0x211(%rdi)
  a4d3d5:	80 bf ef 01 00 00 00 	cmpb   $0x0,0x1ef(%rdi)
  a4d3dc:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  a4d3e1:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  a4d3e6:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
  a4d3eb:	48 c7 44 24 28 00 00 	movq   $0x1000000,0x28(%rsp)
  a4d3f2:	00 01 
  a4d3f4:	48 89 3d 15 cd 01 00 	mov    %rdi,0x1cd15(%rip)        # a6a110 <boot_params>
  a4d3fb:	0f 85 77 01 00 00    	jne    a4d578 <extract_kernel+0x1c8>
  a4d401:	41 80 7f 06 07       	cmpb   $0x7,0x6(%r15)
  a4d406:	0f 84 4c 01 00 00    	je     a4d558 <extract_kernel+0x1a8>
  a4d40c:	48 c7 05 29 dd 01 00 	movq   $0xb8000,0x1dd29(%rip)        # a6b140 <vidmem>
  a4d413:	00 80 0b 00 
  a4d417:	c7 05 17 dd 01 00 d4 	movl   $0x3d4,0x1dd17(%rip)        # a6b138 <vidport>
  a4d41e:	03 00 00 
  a4d421:	41 0f b6 47 0e       	movzbl 0xe(%r15),%eax
  a4d426:	89 05 08 dd 01 00    	mov    %eax,0x1dd08(%rip)        # a6b134 <lines>
  a4d42c:	41 0f b6 47 07       	movzbl 0x7(%r15),%eax
  a4d431:	89 05 f9 dc 01 00    	mov    %eax,0x1dcf9(%rip)        # a6b130 <cols>
  a4d437:	e8 34 0f 00 00       	callq  a4e370 <console_init>
  a4d43c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  a4d441:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  a4d446:	48 89 df             	mov    %rbx,%rdi
  a4d449:	49 8d 86 00 00 01 00 	lea    0x10000(%r14),%rax
  a4d450:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
  a4d455:	4c 89 35 ac cc 01 00 	mov    %r14,0x1ccac(%rip)        # a6a108 <free_mem_ptr>
  a4d45c:	48 81 f9 00 c0 02 02 	cmp    $0x202c000,%rcx
  a4d463:	48 89 05 96 cc 01 00 	mov    %rax,0x1cc96(%rip)        # a6a100 <free_mem_end_ptr>
  a4d46a:	b8 00 c0 02 02       	mov    $0x202c000,%eax
  a4d46f:	4c 8d 44 24 28       	lea    0x28(%rsp),%r8
  a4d474:	48 0f 43 c1          	cmovae %rcx,%rax
  a4d478:	48 89 c1             	mov    %rax,%rcx
  a4d47b:	49 89 c4             	mov    %rax,%r12
  a4d47e:	e8 bd 1a 00 00       	callq  a4ef40 <choose_random_location>
  a4d483:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
  a4d488:	41 f7 c5 ff ff 1f 00 	test   $0x1fffff,%r13d
  a4d48f:	0f 85 2d 04 00 00    	jne    a4d8c2 <extract_kernel+0x512>
  a4d495:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  a4d49a:	a9 ff ff 1f 00       	test   $0x1fffff,%eax
  a4d49f:	0f 85 41 04 00 00    	jne    a4d8e6 <extract_kernel+0x536>
  a4d4a5:	48 ba ff ff ff ff ff 	movabs $0x3fffffffffff,%rdx
  a4d4ac:	3f 00 00 
  a4d4af:	49 39 d6             	cmp    %rdx,%r14
  a4d4b2:	0f 87 22 04 00 00    	ja     a4d8da <extract_kernel+0x52a>
  a4d4b8:	4c 01 e0             	add    %r12,%rax
  a4d4bb:	48 3d 00 00 00 40    	cmp    $0x40000000,%rax
  a4d4c1:	0f 87 07 04 00 00    	ja     a4d8ce <extract_kernel+0x51e>
  a4d4c7:	4d 85 ed             	test   %r13,%r13
  a4d4ca:	0f 84 50 01 00 00    	je     a4d620 <extract_kernel+0x270>
  a4d4d0:	48 85 db             	test   %rbx,%rbx
  a4d4d3:	0f 84 57 01 00 00    	je     a4d630 <extract_kernel+0x280>
  a4d4d9:	81 3b 02 21 4c 18    	cmpl   $0x184c2102,(%rbx)
  a4d4df:	0f 85 5b 01 00 00    	jne    a4d640 <extract_kernel+0x290>
  a4d4e5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  a4d4ea:	48 83 c3 04          	add    $0x4,%rbx
  a4d4ee:	44 8b 74 03 f8       	mov    -0x8(%rbx,%rax,1),%r14d
  a4d4f3:	48 8d 68 f8          	lea    -0x8(%rax),%rbp
  a4d4f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4d4fe:	00 00 
  a4d500:	8b 03                	mov    (%rbx),%eax
  a4d502:	48 83 ed 04          	sub    $0x4,%rbp
  a4d506:	48 83 c3 04          	add    $0x4,%rbx
  a4d50a:	3d 02 21 4c 18       	cmp    $0x184c2102,%eax
  a4d50f:	74 ef                	je     a4d500 <extract_kernel+0x150>
  a4d511:	49 81 fe ff ff 7f 00 	cmp    $0x7fffff,%r14
  a4d518:	0f 87 32 01 00 00    	ja     a4d650 <extract_kernel+0x2a0>
  a4d51e:	44 89 f2             	mov    %r14d,%edx
  a4d521:	4d 89 f4             	mov    %r14,%r12
  a4d524:	4c 89 ee             	mov    %r13,%rsi
  a4d527:	48 89 df             	mov    %rbx,%rdi
  a4d52a:	e8 01 d7 ff ff       	callq  a4ac30 <LZ4_decompress_fast>
  a4d52f:	48 63 d0             	movslq %eax,%rdx
  a4d532:	85 c0                	test   %eax,%eax
  a4d534:	0f 88 2d 01 00 00    	js     a4d667 <extract_kernel+0x2b7>
  a4d53a:	4d 01 e5             	add    %r12,%r13
  a4d53d:	48 29 d5             	sub    %rdx,%rbp
  a4d540:	0f 84 2d 01 00 00    	je     a4d673 <extract_kernel+0x2c3>
  a4d546:	0f 88 5d 02 00 00    	js     a4d7a9 <extract_kernel+0x3f9>
  a4d54c:	48 01 d3             	add    %rdx,%rbx
  a4d54f:	eb af                	jmp    a4d500 <extract_kernel+0x150>
  a4d551:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4d558:	48 c7 05 dd db 01 00 	movq   $0xb0000,0x1dbdd(%rip)        # a6b140 <vidmem>
  a4d55f:	00 00 0b 00 
  a4d563:	c7 05 cb db 01 00 b4 	movl   $0x3b4,0x1dbcb(%rip)        # a6b138 <vidport>
  a4d56a:	03 00 00 
  a4d56d:	e9 af fe ff ff       	jmpq   a4d421 <extract_kernel+0x71>
  a4d572:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4d578:	b8 13 00 00 00       	mov    $0x13,%eax
  a4d57d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  a4d582:	48 8d 35 77 69 00 00 	lea    0x6977(%rip),%rsi        # a53f00 <_rodata>
  a4d589:	48 89 c1             	mov    %rax,%rcx
  a4d58c:	4c 8d 25 8d cb 01 00 	lea    0x1cb8d(%rip),%r12        # a6a120 <scratch.0>
  a4d593:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  a4d598:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  a4d59b:	4c 89 e7             	mov    %r12,%rdi
  a4d59e:	4c 8d ac 24 c8 00 00 	lea    0xc8(%rsp),%r13
  a4d5a5:	00 
  a4d5a6:	48 89 c8             	mov    %rcx,%rax
  a4d5a9:	b9 00 02 00 00       	mov    $0x200,%ecx
  a4d5ae:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  a4d5b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4d5b8:	8b 75 00             	mov    0x0(%rbp),%esi
  a4d5bb:	8b 55 04             	mov    0x4(%rbp),%edx
  a4d5be:	48 83 c5 08          	add    $0x8,%rbp
  a4d5c2:	49 8d 3c 34          	lea    (%r12,%rsi,1),%rdi
  a4d5c6:	4c 01 fe             	add    %r15,%rsi
  a4d5c9:	e8 f2 06 00 00       	callq  a4dcc0 <memcpy>
  a4d5ce:	49 39 ed             	cmp    %rbp,%r13
  a4d5d1:	75 e5                	jne    a4d5b8 <extract_kernel+0x208>
  a4d5d3:	49 8d 7f 08          	lea    0x8(%r15),%rdi
  a4d5d7:	49 8b 04 24          	mov    (%r12),%rax
  a4d5db:	4d 89 fa             	mov    %r15,%r10
  a4d5de:	4c 89 e6             	mov    %r12,%rsi
  a4d5e1:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  a4d5e5:	49 29 fa             	sub    %rdi,%r10
  a4d5e8:	49 89 07             	mov    %rax,(%r15)
  a4d5eb:	48 8b 05 26 db 01 00 	mov    0x1db26(%rip),%rax        # a6b118 <scratch.0+0xff8>
  a4d5f2:	4c 29 d6             	sub    %r10,%rsi
  a4d5f5:	41 81 c2 00 10 00 00 	add    $0x1000,%r10d
  a4d5fc:	41 c1 ea 03          	shr    $0x3,%r10d
  a4d600:	49 89 87 f8 0f 00 00 	mov    %rax,0xff8(%r15)
  a4d607:	44 89 d1             	mov    %r10d,%ecx
  a4d60a:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  a4d60d:	4c 8b 3d fc ca 01 00 	mov    0x1cafc(%rip),%r15        # a6a110 <boot_params>
  a4d614:	e9 e8 fd ff ff       	jmpq   a4d401 <extract_kernel+0x51>
  a4d619:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4d620:	48 8d 3d e9 6d 00 00 	lea    0x6de9(%rip),%rdi        # a54410 <efi_MemoryOverWriteRequest_name+0xf0>
  a4d627:	e8 24 0b 00 00       	callq  a4e150 <error>
  a4d62c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4d630:	48 8d 3d 11 6e 00 00 	lea    0x6e11(%rip),%rdi        # a54448 <efi_MemoryOverWriteRequest_name+0x128>
  a4d637:	e8 14 0b 00 00       	callq  a4e150 <error>
  a4d63c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4d640:	48 8d 3d 1d 6f 00 00 	lea    0x6f1d(%rip),%rdi        # a54564 <efi_MemoryOverWriteRequest_name+0x244>
  a4d647:	e8 04 0b 00 00       	callq  a4e150 <error>
  a4d64c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4d650:	49 81 ee 00 00 80 00 	sub    $0x800000,%r14
  a4d657:	ba 00 00 80 00       	mov    $0x800000,%edx
  a4d65c:	41 bc 00 00 80 00    	mov    $0x800000,%r12d
  a4d662:	e9 bd fe ff ff       	jmpq   a4d524 <extract_kernel+0x174>
  a4d667:	48 8d 3d 05 6f 00 00 	lea    0x6f05(%rip),%rdi        # a54573 <efi_MemoryOverWriteRequest_name+0x253>
  a4d66e:	e8 dd 0a 00 00       	callq  a4e150 <error>
  a4d673:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
  a4d678:	49 8b 55 08          	mov    0x8(%r13),%rdx
  a4d67c:	49 8b 45 00          	mov    0x0(%r13),%rax
  a4d680:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
  a4d685:	49 8b 55 10          	mov    0x10(%r13),%rdx
  a4d689:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  a4d68e:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
  a4d693:	49 8b 55 18          	mov    0x18(%r13),%rdx
  a4d697:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
  a4d69c:	49 8b 55 20          	mov    0x20(%r13),%rdx
  a4d6a0:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
  a4d6a5:	49 8b 55 28          	mov    0x28(%r13),%rdx
  a4d6a9:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
  a4d6ae:	49 8b 55 30          	mov    0x30(%r13),%rdx
  a4d6b2:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
  a4d6b7:	49 8b 55 38          	mov    0x38(%r13),%rdx
  a4d6bb:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
  a4d6c0:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  a4d6c5:	0f 85 4b 02 00 00    	jne    a4d916 <extract_kernel+0x566>
  a4d6cb:	48 8b 05 56 da 01 00 	mov    0x1da56(%rip),%rax        # a6b128 <malloc_ptr>
  a4d6d2:	44 0f b7 74 24 68    	movzwl 0x68(%rsp),%r14d
  a4d6d8:	41 6b d6 38          	imul   $0x38,%r14d,%edx
  a4d6dc:	48 85 c0             	test   %rax,%rax
  a4d6df:	48 0f 44 05 21 ca 01 	cmove  0x1ca21(%rip),%rax        # a6a108 <free_mem_ptr>
  a4d6e6:	00 
  a4d6e7:	44 89 f5             	mov    %r14d,%ebp
  a4d6ea:	48 8d 58 03          	lea    0x3(%rax),%rbx
  a4d6ee:	48 83 e3 fc          	and    $0xfffffffffffffffc,%rbx
  a4d6f2:	89 d0                	mov    %edx,%eax
  a4d6f4:	48 8b 15 05 ca 01 00 	mov    0x1ca05(%rip),%rdx        # a6a100 <free_mem_end_ptr>
  a4d6fb:	48 01 d8             	add    %rbx,%rax
  a4d6fe:	48 89 05 23 da 01 00 	mov    %rax,0x1da23(%rip)        # a6b128 <malloc_ptr>
  a4d705:	48 85 d2             	test   %rdx,%rdx
  a4d708:	0f 85 a7 00 00 00    	jne    a4d7b5 <extract_kernel+0x405>
  a4d70e:	44 8b 25 0b da 01 00 	mov    0x1da0b(%rip),%r12d        # a6b120 <malloc_count>
  a4d715:	41 8d 44 24 01       	lea    0x1(%r12),%eax
  a4d71a:	89 05 00 da 01 00    	mov    %eax,0x1da00(%rip)        # a6b120 <malloc_count>
  a4d720:	48 85 db             	test   %rbx,%rbx
  a4d723:	0f 84 95 00 00 00    	je     a4d7be <extract_kernel+0x40e>
  a4d729:	0f b7 c5             	movzwl %bp,%eax
  a4d72c:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
  a4d731:	48 89 df             	mov    %rbx,%rdi
  a4d734:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  a4d73b:	00 
  a4d73c:	48 29 c2             	sub    %rax,%rdx
  a4d73f:	4c 01 ee             	add    %r13,%rsi
  a4d742:	48 c1 e2 03          	shl    $0x3,%rdx
  a4d746:	e8 75 05 00 00       	callq  a4dcc0 <memcpy>
  a4d74b:	66 85 ed             	test   %bp,%bp
  a4d74e:	0f 84 7c 00 00 00    	je     a4d7d0 <extract_kernel+0x420>
  a4d754:	41 8d 46 ff          	lea    -0x1(%r14),%eax
  a4d758:	48 83 c0 01          	add    $0x1,%rax
  a4d75c:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  a4d763:	00 
  a4d764:	48 29 c2             	sub    %rax,%rdx
  a4d767:	48 8d 2c d3          	lea    (%rbx,%rdx,8),%rbp
  a4d76b:	eb 0c                	jmp    a4d779 <extract_kernel+0x3c9>
  a4d76d:	0f 1f 00             	nopl   (%rax)
  a4d770:	48 83 c3 38          	add    $0x38,%rbx
  a4d774:	48 39 dd             	cmp    %rbx,%rbp
  a4d777:	74 57                	je     a4d7d0 <extract_kernel+0x420>
  a4d779:	83 3b 01             	cmpl   $0x1,(%rbx)
  a4d77c:	75 f2                	jne    a4d770 <extract_kernel+0x3c0>
  a4d77e:	f7 43 30 ff ff 1f 00 	testl  $0x1fffff,0x30(%rbx)
  a4d785:	0f 85 97 01 00 00    	jne    a4d922 <extract_kernel+0x572>
  a4d78b:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  a4d78f:	48 8b 43 18          	mov    0x18(%rbx),%rax
  a4d793:	48 8b 53 20          	mov    0x20(%rbx),%rdx
  a4d797:	4c 01 ee             	add    %r13,%rsi
  a4d79a:	49 8d bc 05 00 00 00 	lea    -0x1000000(%r13,%rax,1),%rdi
  a4d7a1:	ff 
  a4d7a2:	e8 b9 04 00 00       	callq  a4dc60 <memmove>
  a4d7a7:	eb c7                	jmp    a4d770 <extract_kernel+0x3c0>
  a4d7a9:	48 8d 3d d3 6d 00 00 	lea    0x6dd3(%rip),%rdi        # a54583 <efi_MemoryOverWriteRequest_name+0x263>
  a4d7b0:	e8 9b 09 00 00       	callq  a4e150 <error>
  a4d7b5:	48 39 d0             	cmp    %rdx,%rax
  a4d7b8:	0f 82 50 ff ff ff    	jb     a4d70e <extract_kernel+0x35e>
  a4d7be:	48 8d 3d d3 6c 00 00 	lea    0x6cd3(%rip),%rdi        # a54498 <efi_MemoryOverWriteRequest_name+0x178>
  a4d7c5:	e8 86 09 00 00       	callq  a4e150 <error>
  a4d7ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4d7d0:	44 89 25 49 d9 01 00 	mov    %r12d,0x1d949(%rip)        # a6b120 <malloc_count>
  a4d7d7:	45 85 e4             	test   %r12d,%r12d
  a4d7da:	75 0e                	jne    a4d7ea <extract_kernel+0x43a>
  a4d7dc:	48 8b 05 25 c9 01 00 	mov    0x1c925(%rip),%rax        # a6a108 <free_mem_ptr>
  a4d7e3:	48 89 05 3e d9 01 00 	mov    %rax,0x1d93e(%rip)        # a6b128 <malloc_ptr>
  a4d7ea:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  a4d7ef:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
  a4d7f4:	48 81 ea 00 00 00 01 	sub    $0x1000000,%rdx
  a4d7fb:	0f 84 a7 00 00 00    	je     a4d8a8 <extract_kernel+0x4f8>
  a4d801:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  a4d806:	49 8d b0 00 30 b3 01 	lea    0x1b33000(%r8),%rsi
  a4d80d:	49 8d b8 00 00 00 7f 	lea    0x7f000000(%r8),%rdi
  a4d814:	49 8d 4c 00 fc       	lea    -0x4(%r8,%rax,1),%rcx
  a4d819:	48 63 01             	movslq (%rcx),%rax
  a4d81c:	85 c0                	test   %eax,%eax
  a4d81e:	74 22                	je     a4d842 <extract_kernel+0x492>
  a4d820:	48 01 f8             	add    %rdi,%rax
  a4d823:	49 39 c0             	cmp    %rax,%r8
  a4d826:	0f 87 de 00 00 00    	ja     a4d90a <extract_kernel+0x55a>
  a4d82c:	48 39 c6             	cmp    %rax,%rsi
  a4d82f:	0f 82 d5 00 00 00    	jb     a4d90a <extract_kernel+0x55a>
  a4d835:	48 83 e9 04          	sub    $0x4,%rcx
  a4d839:	01 10                	add    %edx,(%rax)
  a4d83b:	48 63 01             	movslq (%rcx),%rax
  a4d83e:	85 c0                	test   %eax,%eax
  a4d840:	75 de                	jne    a4d820 <extract_kernel+0x470>
  a4d842:	48 63 41 fc          	movslq -0x4(%rcx),%rax
  a4d846:	4c 8d 49 fc          	lea    -0x4(%rcx),%r9
  a4d84a:	85 c0                	test   %eax,%eax
  a4d84c:	75 05                	jne    a4d853 <extract_kernel+0x4a3>
  a4d84e:	eb 6d                	jmp    a4d8bd <extract_kernel+0x50d>
  a4d850:	49 89 c9             	mov    %rcx,%r9
  a4d853:	48 01 f8             	add    %rdi,%rax
  a4d856:	49 39 c0             	cmp    %rax,%r8
  a4d859:	0f 87 93 00 00 00    	ja     a4d8f2 <extract_kernel+0x542>
  a4d85f:	48 39 c6             	cmp    %rax,%rsi
  a4d862:	0f 82 8a 00 00 00    	jb     a4d8f2 <extract_kernel+0x542>
  a4d868:	29 10                	sub    %edx,(%rax)
  a4d86a:	49 63 41 fc          	movslq -0x4(%r9),%rax
  a4d86e:	49 8d 49 fc          	lea    -0x4(%r9),%rcx
  a4d872:	85 c0                	test   %eax,%eax
  a4d874:	75 da                	jne    a4d850 <extract_kernel+0x4a0>
  a4d876:	49 63 41 f8          	movslq -0x8(%r9),%rax
  a4d87a:	49 8d 49 f8          	lea    -0x8(%r9),%rcx
  a4d87e:	85 c0                	test   %eax,%eax
  a4d880:	74 21                	je     a4d8a3 <extract_kernel+0x4f3>
  a4d882:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4d888:	48 01 f8             	add    %rdi,%rax
  a4d88b:	49 39 c0             	cmp    %rax,%r8
  a4d88e:	77 6e                	ja     a4d8fe <extract_kernel+0x54e>
  a4d890:	48 39 c6             	cmp    %rax,%rsi
  a4d893:	72 69                	jb     a4d8fe <extract_kernel+0x54e>
  a4d895:	48 83 e9 04          	sub    $0x4,%rcx
  a4d899:	48 01 10             	add    %rdx,(%rax)
  a4d89c:	48 63 01             	movslq (%rcx),%rax
  a4d89f:	85 c0                	test   %eax,%eax
  a4d8a1:	75 e5                	jne    a4d888 <extract_kernel+0x4d8>
  a4d8a3:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
  a4d8a8:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
  a4d8af:	4c 89 c0             	mov    %r8,%rax
  a4d8b2:	5b                   	pop    %rbx
  a4d8b3:	5d                   	pop    %rbp
  a4d8b4:	41 5c                	pop    %r12
  a4d8b6:	41 5d                	pop    %r13
  a4d8b8:	41 5e                	pop    %r14
  a4d8ba:	41 5f                	pop    %r15
  a4d8bc:	c3                   	retq   
  a4d8bd:	49 89 c9             	mov    %rcx,%r9
  a4d8c0:	eb b4                	jmp    a4d876 <extract_kernel+0x4c6>
  a4d8c2:	48 8d 3d 97 6a 00 00 	lea    0x6a97(%rip),%rdi        # a54360 <efi_MemoryOverWriteRequest_name+0x40>
  a4d8c9:	e8 82 08 00 00       	callq  a4e150 <error>
  a4d8ce:	48 8d 3d fb 6a 00 00 	lea    0x6afb(%rip),%rdi        # a543d0 <efi_MemoryOverWriteRequest_name+0xb0>
  a4d8d5:	e8 76 08 00 00       	callq  a4e150 <error>
  a4d8da:	48 8d 3d 65 6c 00 00 	lea    0x6c65(%rip),%rdi        # a54546 <efi_MemoryOverWriteRequest_name+0x226>
  a4d8e1:	e8 6a 08 00 00       	callq  a4e150 <error>
  a4d8e6:	48 8d 3d ab 6a 00 00 	lea    0x6aab(%rip),%rdi        # a54398 <efi_MemoryOverWriteRequest_name+0x78>
  a4d8ed:	e8 5e 08 00 00       	callq  a4e150 <error>
  a4d8f2:	48 8d 3d f7 6b 00 00 	lea    0x6bf7(%rip),%rdi        # a544f0 <efi_MemoryOverWriteRequest_name+0x1d0>
  a4d8f9:	e8 52 08 00 00       	callq  a4e150 <error>
  a4d8fe:	48 8d 3d 1b 6c 00 00 	lea    0x6c1b(%rip),%rdi        # a54520 <efi_MemoryOverWriteRequest_name+0x200>
  a4d905:	e8 46 08 00 00       	callq  a4e150 <error>
  a4d90a:	48 8d 3d e7 6b 00 00 	lea    0x6be7(%rip),%rdi        # a544f8 <efi_MemoryOverWriteRequest_name+0x1d8>
  a4d911:	e8 3a 08 00 00       	callq  a4e150 <error>
  a4d916:	48 8d 3d 5b 6b 00 00 	lea    0x6b5b(%rip),%rdi        # a54478 <efi_MemoryOverWriteRequest_name+0x158>
  a4d91d:	e8 2e 08 00 00       	callq  a4e150 <error>
  a4d922:	48 8d 3d 97 6b 00 00 	lea    0x6b97(%rip),%rdi        # a544c0 <efi_MemoryOverWriteRequest_name+0x1a0>
  a4d929:	e8 22 08 00 00       	callq  a4e150 <error>
  a4d92e:	66 90                	xchg   %ax,%ax

0000000000a4d930 <memcmp>:
  a4d930:	f3 0f 1e fa          	endbr64 
  a4d934:	48 89 d1             	mov    %rdx,%rcx
  a4d937:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  a4d939:	0f 95 c0             	setne  %al
  a4d93c:	0f b6 c0             	movzbl %al,%eax
  a4d93f:	c3                   	retq   

0000000000a4d940 <bcmp>:
  a4d940:	f3 0f 1e fa          	endbr64 
  a4d944:	48 89 d1             	mov    %rdx,%rcx
  a4d947:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  a4d949:	0f 95 c0             	setne  %al
  a4d94c:	0f b6 c0             	movzbl %al,%eax
  a4d94f:	c3                   	retq   

0000000000a4d950 <strcmp>:
  a4d950:	f3 0f 1e fa          	endbr64 
  a4d954:	31 c9                	xor    %ecx,%ecx
  a4d956:	eb 10                	jmp    a4d968 <strcmp+0x18>
  a4d958:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4d95f:	00 
  a4d960:	48 83 c1 01          	add    $0x1,%rcx
  a4d964:	29 d0                	sub    %edx,%eax
  a4d966:	75 12                	jne    a4d97a <strcmp+0x2a>
  a4d968:	0f b6 04 0f          	movzbl (%rdi,%rcx,1),%eax
  a4d96c:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
  a4d970:	41 89 c0             	mov    %eax,%r8d
  a4d973:	41 08 d0             	or     %dl,%r8b
  a4d976:	75 e8                	jne    a4d960 <strcmp+0x10>
  a4d978:	31 c0                	xor    %eax,%eax
  a4d97a:	c3                   	retq   
  a4d97b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000a4d980 <strncmp>:
  a4d980:	f3 0f 1e fa          	endbr64 
  a4d984:	48 89 d1             	mov    %rdx,%rcx
  a4d987:	48 85 d2             	test   %rdx,%rdx
  a4d98a:	74 24                	je     a4d9b0 <strncmp+0x30>
  a4d98c:	31 c0                	xor    %eax,%eax
  a4d98e:	eb 0d                	jmp    a4d99d <strncmp+0x1d>
  a4d990:	84 d2                	test   %dl,%dl
  a4d992:	74 1c                	je     a4d9b0 <strncmp+0x30>
  a4d994:	48 83 c0 01          	add    $0x1,%rax
  a4d998:	48 39 c8             	cmp    %rcx,%rax
  a4d99b:	74 13                	je     a4d9b0 <strncmp+0x30>
  a4d99d:	0f b6 14 07          	movzbl (%rdi,%rax,1),%edx
  a4d9a1:	3a 14 06             	cmp    (%rsi,%rax,1),%dl
  a4d9a4:	74 ea                	je     a4d990 <strncmp+0x10>
  a4d9a6:	19 c0                	sbb    %eax,%eax
  a4d9a8:	83 c8 01             	or     $0x1,%eax
  a4d9ab:	c3                   	retq   
  a4d9ac:	0f 1f 40 00          	nopl   0x0(%rax)
  a4d9b0:	31 c0                	xor    %eax,%eax
  a4d9b2:	c3                   	retq   
  a4d9b3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4d9ba:	00 00 00 00 
  a4d9be:	66 90                	xchg   %ax,%ax

0000000000a4d9c0 <strnlen>:
  a4d9c0:	f3 0f 1e fa          	endbr64 
  a4d9c4:	80 3f 00             	cmpb   $0x0,(%rdi)
  a4d9c7:	74 27                	je     a4d9f0 <strnlen+0x30>
  a4d9c9:	48 85 f6             	test   %rsi,%rsi
  a4d9cc:	74 22                	je     a4d9f0 <strnlen+0x30>
  a4d9ce:	48 89 f8             	mov    %rdi,%rax
  a4d9d1:	eb 0a                	jmp    a4d9dd <strnlen+0x1d>
  a4d9d3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4d9d8:	80 38 00             	cmpb   $0x0,(%rax)
  a4d9db:	74 0f                	je     a4d9ec <strnlen+0x2c>
  a4d9dd:	48 83 c0 01          	add    $0x1,%rax
  a4d9e1:	48 89 f2             	mov    %rsi,%rdx
  a4d9e4:	48 29 c2             	sub    %rax,%rdx
  a4d9e7:	48 01 fa             	add    %rdi,%rdx
  a4d9ea:	75 ec                	jne    a4d9d8 <strnlen+0x18>
  a4d9ec:	48 29 f8             	sub    %rdi,%rax
  a4d9ef:	c3                   	retq   
  a4d9f0:	31 c0                	xor    %eax,%eax
  a4d9f2:	c3                   	retq   
  a4d9f3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4d9fa:	00 00 00 00 
  a4d9fe:	66 90                	xchg   %ax,%ax

0000000000a4da00 <atou>:
  a4da00:	f3 0f 1e fa          	endbr64 
  a4da04:	0f be 07             	movsbl (%rdi),%eax
  a4da07:	45 31 c0             	xor    %r8d,%r8d
  a4da0a:	8d 50 d0             	lea    -0x30(%rax),%edx
  a4da0d:	83 fa 09             	cmp    $0x9,%edx
  a4da10:	77 1e                	ja     a4da30 <atou+0x30>
  a4da12:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4da18:	43 8d 14 80          	lea    (%r8,%r8,4),%edx
  a4da1c:	48 83 c7 01          	add    $0x1,%rdi
  a4da20:	44 8d 44 50 d0       	lea    -0x30(%rax,%rdx,2),%r8d
  a4da25:	0f be 07             	movsbl (%rdi),%eax
  a4da28:	8d 50 d0             	lea    -0x30(%rax),%edx
  a4da2b:	83 fa 09             	cmp    $0x9,%edx
  a4da2e:	76 e8                	jbe    a4da18 <atou+0x18>
  a4da30:	44 89 c0             	mov    %r8d,%eax
  a4da33:	c3                   	retq   
  a4da34:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4da3b:	00 00 00 00 
  a4da3f:	90                   	nop

0000000000a4da40 <simple_strtoull>:
  a4da40:	f3 0f 1e fa          	endbr64 
  a4da44:	89 d1                	mov    %edx,%ecx
  a4da46:	0f b6 17             	movzbl (%rdi),%edx
  a4da49:	85 c9                	test   %ecx,%ecx
  a4da4b:	75 53                	jne    a4daa0 <simple_strtoull+0x60>
  a4da4d:	b9 0a 00 00 00       	mov    $0xa,%ecx
  a4da52:	80 fa 30             	cmp    $0x30,%dl
  a4da55:	74 79                	je     a4dad0 <simple_strtoull+0x90>
  a4da57:	45 31 c0             	xor    %r8d,%r8d
  a4da5a:	41 89 c9             	mov    %ecx,%r9d
  a4da5d:	eb 10                	jmp    a4da6f <simple_strtoull+0x2f>
  a4da5f:	90                   	nop
  a4da60:	4d 0f af c1          	imul   %r9,%r8
  a4da64:	0f b6 57 01          	movzbl 0x1(%rdi),%edx
  a4da68:	48 83 c7 01          	add    $0x1,%rdi
  a4da6c:	49 01 c0             	add    %rax,%r8
  a4da6f:	0f be c2             	movsbl %dl,%eax
  a4da72:	83 e8 30             	sub    $0x30,%eax
  a4da75:	83 f8 09             	cmp    $0x9,%eax
  a4da78:	76 15                	jbe    a4da8f <simple_strtoull+0x4f>
  a4da7a:	89 d0                	mov    %edx,%eax
  a4da7c:	83 e0 df             	and    $0xffffffdf,%eax
  a4da7f:	83 e8 41             	sub    $0x41,%eax
  a4da82:	3c 05                	cmp    $0x5,%al
  a4da84:	77 0d                	ja     a4da93 <simple_strtoull+0x53>
  a4da86:	83 ca 20             	or     $0x20,%edx
  a4da89:	0f be d2             	movsbl %dl,%edx
  a4da8c:	8d 42 a9             	lea    -0x57(%rdx),%eax
  a4da8f:	39 c8                	cmp    %ecx,%eax
  a4da91:	72 cd                	jb     a4da60 <simple_strtoull+0x20>
  a4da93:	48 85 f6             	test   %rsi,%rsi
  a4da96:	74 03                	je     a4da9b <simple_strtoull+0x5b>
  a4da98:	48 89 3e             	mov    %rdi,(%rsi)
  a4da9b:	4c 89 c0             	mov    %r8,%rax
  a4da9e:	c3                   	retq   
  a4da9f:	90                   	nop
  a4daa0:	83 f9 10             	cmp    $0x10,%ecx
  a4daa3:	75 b2                	jne    a4da57 <simple_strtoull+0x17>
  a4daa5:	80 fa 30             	cmp    $0x30,%dl
  a4daa8:	75 ad                	jne    a4da57 <simple_strtoull+0x17>
  a4daaa:	0f b6 47 01          	movzbl 0x1(%rdi),%eax
  a4daae:	83 c8 20             	or     $0x20,%eax
  a4dab1:	3c 78                	cmp    $0x78,%al
  a4dab3:	75 a2                	jne    a4da57 <simple_strtoull+0x17>
  a4dab5:	44 0f b6 47 02       	movzbl 0x2(%rdi),%r8d
  a4daba:	44 89 c2             	mov    %r8d,%edx
  a4dabd:	48 83 c7 02          	add    $0x2,%rdi
  a4dac1:	b9 10 00 00 00       	mov    $0x10,%ecx
  a4dac6:	eb 8f                	jmp    a4da57 <simple_strtoull+0x17>
  a4dac8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4dacf:	00 
  a4dad0:	0f b6 47 01          	movzbl 0x1(%rdi),%eax
  a4dad4:	b9 08 00 00 00       	mov    $0x8,%ecx
  a4dad9:	83 c8 20             	or     $0x20,%eax
  a4dadc:	3c 78                	cmp    $0x78,%al
  a4dade:	0f 85 73 ff ff ff    	jne    a4da57 <simple_strtoull+0x17>
  a4dae4:	0f be 47 02          	movsbl 0x2(%rdi),%eax
  a4dae8:	41 89 c0             	mov    %eax,%r8d
  a4daeb:	83 e8 30             	sub    $0x30,%eax
  a4daee:	83 f8 09             	cmp    $0x9,%eax
  a4daf1:	76 c7                	jbe    a4daba <simple_strtoull+0x7a>
  a4daf3:	44 89 c0             	mov    %r8d,%eax
  a4daf6:	83 e0 df             	and    $0xffffffdf,%eax
  a4daf9:	83 e8 41             	sub    $0x41,%eax
  a4dafc:	3c 05                	cmp    $0x5,%al
  a4dafe:	76 ba                	jbe    a4daba <simple_strtoull+0x7a>
  a4db00:	e9 52 ff ff ff       	jmpq   a4da57 <simple_strtoull+0x17>
  a4db05:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4db0c:	00 00 00 00 

0000000000a4db10 <simple_strtol>:
  a4db10:	f3 0f 1e fa          	endbr64 
  a4db14:	80 3f 2d             	cmpb   $0x2d,(%rdi)
  a4db17:	74 07                	je     a4db20 <simple_strtol+0x10>
  a4db19:	e9 22 ff ff ff       	jmpq   a4da40 <simple_strtoull>
  a4db1e:	66 90                	xchg   %ax,%ax
  a4db20:	48 83 c7 01          	add    $0x1,%rdi
  a4db24:	e8 17 ff ff ff       	callq  a4da40 <simple_strtoull>
  a4db29:	48 f7 d8             	neg    %rax
  a4db2c:	c3                   	retq   
  a4db2d:	0f 1f 00             	nopl   (%rax)

0000000000a4db30 <strlen>:
  a4db30:	f3 0f 1e fa          	endbr64 
  a4db34:	80 3f 00             	cmpb   $0x0,(%rdi)
  a4db37:	74 17                	je     a4db50 <strlen+0x20>
  a4db39:	48 89 f8             	mov    %rdi,%rax
  a4db3c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4db40:	48 83 c0 01          	add    $0x1,%rax
  a4db44:	80 38 00             	cmpb   $0x0,(%rax)
  a4db47:	75 f7                	jne    a4db40 <strlen+0x10>
  a4db49:	48 29 f8             	sub    %rdi,%rax
  a4db4c:	c3                   	retq   
  a4db4d:	0f 1f 00             	nopl   (%rax)
  a4db50:	31 c0                	xor    %eax,%eax
  a4db52:	c3                   	retq   
  a4db53:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4db5a:	00 00 00 00 
  a4db5e:	66 90                	xchg   %ax,%ax

0000000000a4db60 <strstr>:
  a4db60:	f3 0f 1e fa          	endbr64 
  a4db64:	80 3e 00             	cmpb   $0x0,(%rsi)
  a4db67:	48 89 f8             	mov    %rdi,%rax
  a4db6a:	49 89 f2             	mov    %rsi,%r10
  a4db6d:	0f 84 85 00 00 00    	je     a4dbf8 <strstr+0x98>
  a4db73:	48 89 f2             	mov    %rsi,%rdx
  a4db76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4db7d:	00 00 00 
  a4db80:	48 83 c2 01          	add    $0x1,%rdx
  a4db84:	80 3a 00             	cmpb   $0x0,(%rdx)
  a4db87:	75 f7                	jne    a4db80 <strstr+0x20>
  a4db89:	49 89 c1             	mov    %rax,%r9
  a4db8c:	4c 29 d2             	sub    %r10,%rdx
  a4db8f:	74 60                	je     a4dbf1 <strstr+0x91>
  a4db91:	80 38 00             	cmpb   $0x0,(%rax)
  a4db94:	74 58                	je     a4dbee <strstr+0x8e>
  a4db96:	48 89 c1             	mov    %rax,%rcx
  a4db99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4dba0:	48 83 c1 01          	add    $0x1,%rcx
  a4dba4:	80 39 00             	cmpb   $0x0,(%rcx)
  a4dba7:	75 f7                	jne    a4dba0 <strstr+0x40>
  a4dba9:	48 29 c1             	sub    %rax,%rcx
  a4dbac:	49 89 c8             	mov    %rcx,%r8
  a4dbaf:	48 39 ca             	cmp    %rcx,%rdx
  a4dbb2:	77 3a                	ja     a4dbee <strstr+0x8e>
  a4dbb4:	48 89 c7             	mov    %rax,%rdi
  a4dbb7:	4c 89 d6             	mov    %r10,%rsi
  a4dbba:	48 89 d1             	mov    %rdx,%rcx
  a4dbbd:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  a4dbbf:	74 37                	je     a4dbf8 <strstr+0x98>
  a4dbc1:	48 83 c0 01          	add    $0x1,%rax
  a4dbc5:	48 89 c1             	mov    %rax,%rcx
  a4dbc8:	48 29 d1             	sub    %rdx,%rcx
  a4dbcb:	49 01 c8             	add    %rcx,%r8
  a4dbce:	eb 16                	jmp    a4dbe6 <strstr+0x86>
  a4dbd0:	48 89 c7             	mov    %rax,%rdi
  a4dbd3:	4c 89 d6             	mov    %r10,%rsi
  a4dbd6:	48 89 d1             	mov    %rdx,%rcx
  a4dbd9:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  a4dbdb:	0f 95 c1             	setne  %cl
  a4dbde:	48 83 c0 01          	add    $0x1,%rax
  a4dbe2:	84 c9                	test   %cl,%cl
  a4dbe4:	74 0b                	je     a4dbf1 <strstr+0x91>
  a4dbe6:	49 89 c1             	mov    %rax,%r9
  a4dbe9:	4c 39 c0             	cmp    %r8,%rax
  a4dbec:	75 e2                	jne    a4dbd0 <strstr+0x70>
  a4dbee:	45 31 c9             	xor    %r9d,%r9d
  a4dbf1:	4c 89 c8             	mov    %r9,%rax
  a4dbf4:	c3                   	retq   
  a4dbf5:	0f 1f 00             	nopl   (%rax)
  a4dbf8:	49 89 c1             	mov    %rax,%r9
  a4dbfb:	4c 89 c8             	mov    %r9,%rax
  a4dbfe:	c3                   	retq   
  a4dbff:	90                   	nop

0000000000a4dc00 <strchr>:
  a4dc00:	f3 0f 1e fa          	endbr64 
  a4dc04:	48 89 f8             	mov    %rdi,%rax
  a4dc07:	eb 0f                	jmp    a4dc18 <strchr+0x18>
  a4dc09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4dc10:	48 83 c0 01          	add    $0x1,%rax
  a4dc14:	84 d2                	test   %dl,%dl
  a4dc16:	74 10                	je     a4dc28 <strchr+0x28>
  a4dc18:	0f b6 10             	movzbl (%rax),%edx
  a4dc1b:	40 38 f2             	cmp    %sil,%dl
  a4dc1e:	75 f0                	jne    a4dc10 <strchr+0x10>
  a4dc20:	c3                   	retq   
  a4dc21:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4dc28:	31 c0                	xor    %eax,%eax
  a4dc2a:	c3                   	retq   
  a4dc2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000a4dc30 <memset>:
  a4dc30:	f3 0f 1e fa          	endbr64 
  a4dc34:	48 89 d1             	mov    %rdx,%rcx
  a4dc37:	49 89 f8             	mov    %rdi,%r8
  a4dc3a:	48 89 f8             	mov    %rdi,%rax
  a4dc3d:	48 01 fa             	add    %rdi,%rdx
  a4dc40:	48 85 c9             	test   %rcx,%rcx
  a4dc43:	74 0f                	je     a4dc54 <memset+0x24>
  a4dc45:	0f 1f 00             	nopl   (%rax)
  a4dc48:	40 88 30             	mov    %sil,(%rax)
  a4dc4b:	48 83 c0 01          	add    $0x1,%rax
  a4dc4f:	48 39 c2             	cmp    %rax,%rdx
  a4dc52:	75 f4                	jne    a4dc48 <memset+0x18>
  a4dc54:	4c 89 c0             	mov    %r8,%rax
  a4dc57:	c3                   	retq   
  a4dc58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4dc5f:	00 

0000000000a4dc60 <memmove>:
  a4dc60:	f3 0f 1e fa          	endbr64 
  a4dc64:	49 89 f8             	mov    %rdi,%r8
  a4dc67:	48 39 f7             	cmp    %rsi,%rdi
  a4dc6a:	76 2c                	jbe    a4dc98 <memmove+0x38>
  a4dc6c:	48 89 f8             	mov    %rdi,%rax
  a4dc6f:	48 29 f0             	sub    %rsi,%rax
  a4dc72:	48 39 d0             	cmp    %rdx,%rax
  a4dc75:	73 21                	jae    a4dc98 <memmove+0x38>
  a4dc77:	48 8d 42 ff          	lea    -0x1(%rdx),%rax
  a4dc7b:	48 85 d2             	test   %rdx,%rdx
  a4dc7e:	74 2d                	je     a4dcad <memmove+0x4d>
  a4dc80:	0f b6 14 06          	movzbl (%rsi,%rax,1),%edx
  a4dc84:	41 88 14 00          	mov    %dl,(%r8,%rax,1)
  a4dc88:	48 83 e8 01          	sub    $0x1,%rax
  a4dc8c:	73 f2                	jae    a4dc80 <memmove+0x20>
  a4dc8e:	4c 89 c0             	mov    %r8,%rax
  a4dc91:	c3                   	retq   
  a4dc92:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4dc98:	48 89 d1             	mov    %rdx,%rcx
  a4dc9b:	4c 89 c7             	mov    %r8,%rdi
  a4dc9e:	83 e2 07             	and    $0x7,%edx
  a4dca1:	48 c1 e9 03          	shr    $0x3,%rcx
  a4dca5:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  a4dca8:	48 89 d1             	mov    %rdx,%rcx
  a4dcab:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  a4dcad:	4c 89 c0             	mov    %r8,%rax
  a4dcb0:	c3                   	retq   
  a4dcb1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4dcb8:	00 00 00 00 
  a4dcbc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000a4dcc0 <memcpy>:
  a4dcc0:	f3 0f 1e fa          	endbr64 
  a4dcc4:	48 89 f8             	mov    %rdi,%rax
  a4dcc7:	48 39 f7             	cmp    %rsi,%rdi
  a4dcca:	76 0b                	jbe    a4dcd7 <memcpy+0x17>
  a4dccc:	48 89 f9             	mov    %rdi,%rcx
  a4dccf:	48 29 f1             	sub    %rsi,%rcx
  a4dcd2:	48 39 d1             	cmp    %rdx,%rcx
  a4dcd5:	72 19                	jb     a4dcf0 <memcpy+0x30>
  a4dcd7:	48 89 d1             	mov    %rdx,%rcx
  a4dcda:	48 89 c7             	mov    %rax,%rdi
  a4dcdd:	83 e2 07             	and    $0x7,%edx
  a4dce0:	48 c1 e9 03          	shr    $0x3,%rcx
  a4dce4:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  a4dce7:	48 89 d1             	mov    %rdx,%rcx
  a4dcea:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  a4dcec:	c3                   	retq   
  a4dced:	0f 1f 00             	nopl   (%rax)
  a4dcf0:	48 83 ec 28          	sub    $0x28,%rsp
  a4dcf4:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  a4dcf9:	48 8d 3d b0 68 00 00 	lea    0x68b0(%rip),%rdi        # a545b0 <efi_MemoryOverWriteRequest_name+0x290>
  a4dd00:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
  a4dd05:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
  a4dd0a:	e8 11 04 00 00       	callq  a4e120 <warn>
  a4dd0f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  a4dd14:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  a4dd19:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  a4dd1e:	48 83 c4 28          	add    $0x28,%rsp
  a4dd22:	48 89 c7             	mov    %rax,%rdi
  a4dd25:	e9 36 ff ff ff       	jmpq   a4dc60 <memmove>
  a4dd2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000a4dd30 <__cmdline_find_option>:
  a4dd30:	f3 0f 1e fa          	endbr64 
  a4dd34:	48 85 ff             	test   %rdi,%rdi
  a4dd37:	0f 84 00 02 00 00    	je     a4df3d <__cmdline_find_option+0x20d>
  a4dd3d:	41 55                	push   %r13
  a4dd3f:	49 89 d2             	mov    %rdx,%r10
  a4dd42:	48 89 fa             	mov    %rdi,%rdx
  a4dd45:	49 89 f1             	mov    %rsi,%r9
  a4dd48:	41 54                	push   %r12
  a4dd4a:	89 ce                	mov    %ecx,%esi
  a4dd4c:	83 e2 0f             	and    $0xf,%edx
  a4dd4f:	48 89 f9             	mov    %rdi,%rcx
  a4dd52:	55                   	push   %rbp
  a4dd53:	48 83 e1 f0          	and    $0xfffffffffffffff0,%rcx
  a4dd57:	48 83 c2 01          	add    $0x1,%rdx
  a4dd5b:	4d 89 d3             	mov    %r10,%r11
  a4dd5e:	53                   	push   %rbx
  a4dd5f:	0f b6 07             	movzbl (%rdi),%eax
  a4dd62:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  a4dd68:	bd 01 00 01 00       	mov    $0x10001,%ebp
  a4dd6d:	8d 5e ff             	lea    -0x1(%rsi),%ebx
  a4dd70:	84 c0                	test   %al,%al
  a4dd72:	74 6c                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4dd74:	3c 20                	cmp    $0x20,%al
  a4dd76:	77 1c                	ja     a4dd94 <__cmdline_find_option+0x64>
  a4dd78:	48 81 fa ff ff 00 00 	cmp    $0xffff,%rdx
  a4dd7f:	77 5f                	ja     a4dde0 <__cmdline_find_option+0xb0>
  a4dd81:	0f b6 04 11          	movzbl (%rcx,%rdx,1),%eax
  a4dd85:	48 8d 7a 01          	lea    0x1(%rdx),%rdi
  a4dd89:	84 c0                	test   %al,%al
  a4dd8b:	74 53                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4dd8d:	48 89 fa             	mov    %rdi,%rdx
  a4dd90:	3c 20                	cmp    $0x20,%al
  a4dd92:	76 e4                	jbe    a4dd78 <__cmdline_find_option+0x48>
  a4dd94:	45 0f b6 21          	movzbl (%r9),%r12d
  a4dd98:	4d 89 cd             	mov    %r9,%r13
  a4dd9b:	3c 3d                	cmp    $0x3d,%al
  a4dd9d:	0f 84 2d 01 00 00    	je     a4ded0 <__cmdline_find_option+0x1a0>
  a4dda3:	41 38 c4             	cmp    %al,%r12b
  a4dda6:	74 70                	je     a4de18 <__cmdline_find_option+0xe8>
  a4dda8:	48 81 fa ff ff 00 00 	cmp    $0xffff,%rdx
  a4ddaf:	77 2f                	ja     a4dde0 <__cmdline_find_option+0xb0>
  a4ddb1:	48 8d 42 01          	lea    0x1(%rdx),%rax
  a4ddb5:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
  a4ddb9:	84 d2                	test   %dl,%dl
  a4ddbb:	74 23                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4ddbd:	80 fa 20             	cmp    $0x20,%dl
  a4ddc0:	76 36                	jbe    a4ddf8 <__cmdline_find_option+0xc8>
  a4ddc2:	48 3d 00 00 01 00    	cmp    $0x10000,%rax
  a4ddc8:	74 16                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4ddca:	48 83 c0 01          	add    $0x1,%rax
  a4ddce:	0f b6 54 01 ff       	movzbl -0x1(%rcx,%rax,1),%edx
  a4ddd3:	84 d2                	test   %dl,%dl
  a4ddd5:	75 e6                	jne    a4ddbd <__cmdline_find_option+0x8d>
  a4ddd7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4ddde:	00 00 
  a4dde0:	85 f6                	test   %esi,%esi
  a4dde2:	74 04                	je     a4dde8 <__cmdline_find_option+0xb8>
  a4dde4:	41 c6 03 00          	movb   $0x0,(%r11)
  a4dde8:	5b                   	pop    %rbx
  a4dde9:	44 89 c0             	mov    %r8d,%eax
  a4ddec:	5d                   	pop    %rbp
  a4dded:	41 5c                	pop    %r12
  a4ddef:	41 5d                	pop    %r13
  a4ddf1:	c3                   	retq   
  a4ddf2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4ddf8:	48 3d 00 00 01 00    	cmp    $0x10000,%rax
  a4ddfe:	74 e0                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4de00:	48 8d 50 01          	lea    0x1(%rax),%rdx
  a4de04:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
  a4de08:	84 c0                	test   %al,%al
  a4de0a:	0f 85 64 ff ff ff    	jne    a4dd74 <__cmdline_find_option+0x44>
  a4de10:	eb ce                	jmp    a4dde0 <__cmdline_find_option+0xb0>
  a4de12:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4de18:	48 81 fa ff ff 00 00 	cmp    $0xffff,%rdx
  a4de1f:	77 bf                	ja     a4dde0 <__cmdline_find_option+0xb0>
  a4de21:	0f b6 04 11          	movzbl (%rcx,%rdx,1),%eax
  a4de25:	48 8d 7a 01          	lea    0x1(%rdx),%rdi
  a4de29:	84 c0                	test   %al,%al
  a4de2b:	74 b3                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4de2d:	49 83 c5 01          	add    $0x1,%r13
  a4de31:	3c 3d                	cmp    $0x3d,%al
  a4de33:	74 2b                	je     a4de60 <__cmdline_find_option+0x130>
  a4de35:	3c 20                	cmp    $0x20,%al
  a4de37:	0f 87 f3 00 00 00    	ja     a4df30 <__cmdline_find_option+0x200>
  a4de3d:	48 81 ff 00 00 01 00 	cmp    $0x10000,%rdi
  a4de44:	74 9a                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4de46:	0f b6 04 39          	movzbl (%rcx,%rdi,1),%eax
  a4de4a:	48 8d 57 01          	lea    0x1(%rdi),%rdx
  a4de4e:	84 c0                	test   %al,%al
  a4de50:	0f 85 1e ff ff ff    	jne    a4dd74 <__cmdline_find_option+0x44>
  a4de56:	eb 88                	jmp    a4dde0 <__cmdline_find_option+0xb0>
  a4de58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4de5f:	00 
  a4de60:	45 0f b6 65 00       	movzbl 0x0(%r13),%r12d
  a4de65:	45 84 e4             	test   %r12b,%r12b
  a4de68:	75 56                	jne    a4dec0 <__cmdline_find_option+0x190>
  a4de6a:	48 81 ff 00 00 01 00 	cmp    $0x10000,%rdi
  a4de71:	74 77                	je     a4deea <__cmdline_find_option+0x1ba>
  a4de73:	0f b6 14 39          	movzbl (%rcx,%rdi,1),%edx
  a4de77:	48 8d 47 01          	lea    0x1(%rdi),%rax
  a4de7b:	84 d2                	test   %dl,%dl
  a4de7d:	74 6b                	je     a4deea <__cmdline_find_option+0x1ba>
  a4de7f:	89 ef                	mov    %ebp,%edi
  a4de81:	4d 89 d3             	mov    %r10,%r11
  a4de84:	45 31 c0             	xor    %r8d,%r8d
  a4de87:	29 c7                	sub    %eax,%edi
  a4de89:	80 fa 20             	cmp    $0x20,%dl
  a4de8c:	0f 86 66 ff ff ff    	jbe    a4ddf8 <__cmdline_find_option+0xc8>
  a4de92:	44 39 c3             	cmp    %r8d,%ebx
  a4de95:	7e 07                	jle    a4de9e <__cmdline_find_option+0x16e>
  a4de97:	41 88 13             	mov    %dl,(%r11)
  a4de9a:	49 83 c3 01          	add    $0x1,%r11
  a4de9e:	41 83 c0 01          	add    $0x1,%r8d
  a4dea2:	41 39 f8             	cmp    %edi,%r8d
  a4dea5:	0f 84 35 ff ff ff    	je     a4dde0 <__cmdline_find_option+0xb0>
  a4deab:	48 83 c0 01          	add    $0x1,%rax
  a4deaf:	0f b6 54 01 ff       	movzbl -0x1(%rcx,%rax,1),%edx
  a4deb4:	84 d2                	test   %dl,%dl
  a4deb6:	75 d1                	jne    a4de89 <__cmdline_find_option+0x159>
  a4deb8:	e9 23 ff ff ff       	jmpq   a4dde0 <__cmdline_find_option+0xb0>
  a4debd:	0f 1f 00             	nopl   (%rax)
  a4dec0:	48 89 fa             	mov    %rdi,%rdx
  a4dec3:	e9 db fe ff ff       	jmpq   a4dda3 <__cmdline_find_option+0x73>
  a4dec8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4decf:	00 
  a4ded0:	45 84 e4             	test   %r12b,%r12b
  a4ded3:	75 23                	jne    a4def8 <__cmdline_find_option+0x1c8>
  a4ded5:	48 81 fa ff ff 00 00 	cmp    $0xffff,%rdx
  a4dedc:	77 0c                	ja     a4deea <__cmdline_find_option+0x1ba>
  a4dede:	48 8d 42 01          	lea    0x1(%rdx),%rax
  a4dee2:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
  a4dee6:	84 d2                	test   %dl,%dl
  a4dee8:	75 95                	jne    a4de7f <__cmdline_find_option+0x14f>
  a4deea:	4d 89 d3             	mov    %r10,%r11
  a4deed:	45 31 c0             	xor    %r8d,%r8d
  a4def0:	e9 eb fe ff ff       	jmpq   a4dde0 <__cmdline_find_option+0xb0>
  a4def5:	0f 1f 00             	nopl   (%rax)
  a4def8:	41 80 fc 3d          	cmp    $0x3d,%r12b
  a4defc:	0f 85 a6 fe ff ff    	jne    a4dda8 <__cmdline_find_option+0x78>
  a4df02:	48 81 fa ff ff 00 00 	cmp    $0xffff,%rdx
  a4df09:	0f 87 d1 fe ff ff    	ja     a4dde0 <__cmdline_find_option+0xb0>
  a4df0f:	0f b6 04 11          	movzbl (%rcx,%rdx,1),%eax
  a4df13:	48 8d 7a 01          	lea    0x1(%rdx),%rdi
  a4df17:	84 c0                	test   %al,%al
  a4df19:	0f 84 c1 fe ff ff    	je     a4dde0 <__cmdline_find_option+0xb0>
  a4df1f:	4d 8d 69 01          	lea    0x1(%r9),%r13
  a4df23:	e9 09 ff ff ff       	jmpq   a4de31 <__cmdline_find_option+0x101>
  a4df28:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4df2f:	00 
  a4df30:	45 0f b6 65 00       	movzbl 0x0(%r13),%r12d
  a4df35:	48 89 fa             	mov    %rdi,%rdx
  a4df38:	e9 66 fe ff ff       	jmpq   a4dda3 <__cmdline_find_option+0x73>
  a4df3d:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  a4df43:	44 89 c0             	mov    %r8d,%eax
  a4df46:	c3                   	retq   
  a4df47:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4df4e:	00 00 

0000000000a4df50 <__cmdline_find_option_bool>:
  a4df50:	f3 0f 1e fa          	endbr64 
  a4df54:	49 89 f1             	mov    %rsi,%r9
  a4df57:	48 85 ff             	test   %rdi,%rdi
  a4df5a:	0f 84 2b 01 00 00    	je     a4e08b <__cmdline_find_option_bool+0x13b>
  a4df60:	48 89 fe             	mov    %rdi,%rsi
  a4df63:	49 89 f8             	mov    %rdi,%r8
  a4df66:	0f b6 3f             	movzbl (%rdi),%edi
  a4df69:	b8 01 00 00 00       	mov    $0x1,%eax
  a4df6e:	83 e6 0f             	and    $0xf,%esi
  a4df71:	49 83 e0 f0          	and    $0xfffffffffffffff0,%r8
  a4df75:	48 83 c6 01          	add    $0x1,%rsi
  a4df79:	40 84 ff             	test   %dil,%dil
  a4df7c:	74 62                	je     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4df7e:	40 80 ff 20          	cmp    $0x20,%dil
  a4df82:	76 7c                	jbe    a4e000 <__cmdline_find_option_bool+0xb0>
  a4df84:	45 0f b6 11          	movzbl (%r9),%r10d
  a4df88:	89 c2                	mov    %eax,%edx
  a4df8a:	48 89 f1             	mov    %rsi,%rcx
  a4df8d:	45 84 d2             	test   %r10b,%r10b
  a4df90:	74 0e                	je     a4dfa0 <__cmdline_find_option_bool+0x50>
  a4df92:	41 38 fa             	cmp    %dil,%r10b
  a4df95:	0f 84 85 00 00 00    	je     a4e020 <__cmdline_find_option_bool+0xd0>
  a4df9b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4dfa0:	48 81 f9 ff ff 00 00 	cmp    $0xffff,%rcx
  a4dfa7:	77 37                	ja     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4dfa9:	48 8d 41 01          	lea    0x1(%rcx),%rax
  a4dfad:	83 c2 01             	add    $0x1,%edx
  a4dfb0:	41 0f b6 34 08       	movzbl (%r8,%rcx,1),%esi
  a4dfb5:	29 c2                	sub    %eax,%edx
  a4dfb7:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
  a4dfba:	40 84 f6             	test   %sil,%sil
  a4dfbd:	74 21                	je     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4dfbf:	40 80 fe 20          	cmp    $0x20,%sil
  a4dfc3:	77 23                	ja     a4dfe8 <__cmdline_find_option_bool+0x98>
  a4dfc5:	48 3d 00 00 01 00    	cmp    $0x10000,%rax
  a4dfcb:	74 13                	je     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4dfcd:	41 0f b6 3c 00       	movzbl (%r8,%rax,1),%edi
  a4dfd2:	48 8d 70 01          	lea    0x1(%rax),%rsi
  a4dfd6:	8d 41 01             	lea    0x1(%rcx),%eax
  a4dfd9:	40 84 ff             	test   %dil,%dil
  a4dfdc:	75 a0                	jne    a4df7e <__cmdline_find_option_bool+0x2e>
  a4dfde:	66 90                	xchg   %ax,%ax
  a4dfe0:	31 c0                	xor    %eax,%eax
  a4dfe2:	c3                   	retq   
  a4dfe3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4dfe8:	48 3d 00 00 01 00    	cmp    $0x10000,%rax
  a4dfee:	74 f0                	je     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4dff0:	48 83 c0 01          	add    $0x1,%rax
  a4dff4:	41 0f b6 74 00 ff    	movzbl -0x1(%r8,%rax,1),%esi
  a4dffa:	eb bb                	jmp    a4dfb7 <__cmdline_find_option_bool+0x67>
  a4dffc:	0f 1f 40 00          	nopl   0x0(%rax)
  a4e000:	48 81 fe ff ff 00 00 	cmp    $0xffff,%rsi
  a4e007:	77 d7                	ja     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4e009:	41 0f b6 3c 30       	movzbl (%r8,%rsi,1),%edi
  a4e00e:	83 c0 01             	add    $0x1,%eax
  a4e011:	48 83 c6 01          	add    $0x1,%rsi
  a4e015:	e9 5f ff ff ff       	jmpq   a4df79 <__cmdline_find_option_bool+0x29>
  a4e01a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4e020:	48 81 fe ff ff 00 00 	cmp    $0xffff,%rsi
  a4e027:	77 b7                	ja     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4e029:	48 83 c1 01          	add    $0x1,%rcx
  a4e02d:	44 8d 50 01          	lea    0x1(%rax),%r10d
  a4e031:	4d 89 cb             	mov    %r9,%r11
  a4e034:	41 0f b6 3c 30       	movzbl (%r8,%rsi,1),%edi
  a4e039:	41 29 ca             	sub    %ecx,%r10d
  a4e03c:	49 29 f3             	sub    %rsi,%r11
  a4e03f:	41 0f b6 34 0b       	movzbl (%r11,%rcx,1),%esi
  a4e044:	41 8d 14 0a          	lea    (%r10,%rcx,1),%edx
  a4e048:	40 84 f6             	test   %sil,%sil
  a4e04b:	75 13                	jne    a4e060 <__cmdline_find_option_bool+0x110>
  a4e04d:	40 84 ff             	test   %dil,%dil
  a4e050:	74 90                	je     a4dfe2 <__cmdline_find_option_bool+0x92>
  a4e052:	40 80 ff 20          	cmp    $0x20,%dil
  a4e056:	0f 87 44 ff ff ff    	ja     a4dfa0 <__cmdline_find_option_bool+0x50>
  a4e05c:	c3                   	retq   
  a4e05d:	0f 1f 00             	nopl   (%rax)
  a4e060:	40 84 ff             	test   %dil,%dil
  a4e063:	0f 84 77 ff ff ff    	je     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4e069:	40 38 fe             	cmp    %dil,%sil
  a4e06c:	0f 85 2e ff ff ff    	jne    a4dfa0 <__cmdline_find_option_bool+0x50>
  a4e072:	48 81 f9 00 00 01 00 	cmp    $0x10000,%rcx
  a4e079:	0f 84 61 ff ff ff    	je     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4e07f:	48 83 c1 01          	add    $0x1,%rcx
  a4e083:	41 0f b6 7c 08 ff    	movzbl -0x1(%r8,%rcx,1),%edi
  a4e089:	eb b4                	jmp    a4e03f <__cmdline_find_option_bool+0xef>
  a4e08b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4e090:	c3                   	retq   
  a4e091:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4e098:	00 00 00 00 
  a4e09c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000a4e0a0 <get_cmd_line_ptr>:
  a4e0a0:	f3 0f 1e fa          	endbr64 
  a4e0a4:	48 8b 15 65 c0 01 00 	mov    0x1c065(%rip),%rdx        # a6a110 <boot_params>
  a4e0ab:	8b 82 c8 00 00 00    	mov    0xc8(%rdx),%eax
  a4e0b1:	8b 8a 28 02 00 00    	mov    0x228(%rdx),%ecx
  a4e0b7:	48 c1 e0 20          	shl    $0x20,%rax
  a4e0bb:	48 09 c8             	or     %rcx,%rax
  a4e0be:	c3                   	retq   
  a4e0bf:	90                   	nop

0000000000a4e0c0 <cmdline_find_option>:
  a4e0c0:	f3 0f 1e fa          	endbr64 
  a4e0c4:	48 8b 05 45 c0 01 00 	mov    0x1c045(%rip),%rax        # a6a110 <boot_params>
  a4e0cb:	49 89 f8             	mov    %rdi,%r8
  a4e0ce:	89 d1                	mov    %edx,%ecx
  a4e0d0:	8b b8 c8 00 00 00    	mov    0xc8(%rax),%edi
  a4e0d6:	8b 90 28 02 00 00    	mov    0x228(%rax),%edx
  a4e0dc:	48 c1 e7 20          	shl    $0x20,%rdi
  a4e0e0:	48 09 d7             	or     %rdx,%rdi
  a4e0e3:	48 89 f2             	mov    %rsi,%rdx
  a4e0e6:	4c 89 c6             	mov    %r8,%rsi
  a4e0e9:	e9 42 fc ff ff       	jmpq   a4dd30 <__cmdline_find_option>
  a4e0ee:	66 90                	xchg   %ax,%ax

0000000000a4e0f0 <cmdline_find_option_bool>:
  a4e0f0:	f3 0f 1e fa          	endbr64 
  a4e0f4:	48 8b 05 15 c0 01 00 	mov    0x1c015(%rip),%rax        # a6a110 <boot_params>
  a4e0fb:	48 89 fe             	mov    %rdi,%rsi
  a4e0fe:	8b b8 c8 00 00 00    	mov    0xc8(%rax),%edi
  a4e104:	8b 90 28 02 00 00    	mov    0x228(%rax),%edx
  a4e10a:	48 c1 e7 20          	shl    $0x20,%rdi
  a4e10e:	48 09 d7             	or     %rdx,%rdi
  a4e111:	e9 3a fe ff ff       	jmpq   a4df50 <__cmdline_find_option_bool>
  a4e116:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4e11d:	00 00 00 

0000000000a4e120 <warn>:
  a4e120:	f3 0f 1e fa          	endbr64 
  a4e124:	55                   	push   %rbp
  a4e125:	48 89 fd             	mov    %rdi,%rbp
  a4e128:	48 8d 3d b3 64 00 00 	lea    0x64b3(%rip),%rdi        # a545e2 <efi_MemoryOverWriteRequest_name+0x2c2>
  a4e12f:	e8 6c f0 ff ff       	callq  a4d1a0 <__putstr>
  a4e134:	48 89 ef             	mov    %rbp,%rdi
  a4e137:	e8 64 f0 ff ff       	callq  a4d1a0 <__putstr>
  a4e13c:	48 8d 3d 9f 64 00 00 	lea    0x649f(%rip),%rdi        # a545e2 <efi_MemoryOverWriteRequest_name+0x2c2>
  a4e143:	5d                   	pop    %rbp
  a4e144:	e9 57 f0 ff ff       	jmpq   a4d1a0 <__putstr>
  a4e149:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000a4e150 <error>:
  a4e150:	f3 0f 1e fa          	endbr64 
  a4e154:	50                   	push   %rax
  a4e155:	58                   	pop    %rax
  a4e156:	48 83 ec 08          	sub    $0x8,%rsp
  a4e15a:	e8 c1 ff ff ff       	callq  a4e120 <warn>
  a4e15f:	48 8d 3d 7f 64 00 00 	lea    0x647f(%rip),%rdi        # a545e5 <efi_MemoryOverWriteRequest_name+0x2c5>
  a4e166:	e8 35 f0 ff ff       	callq  a4d1a0 <__putstr>
  a4e16b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4e170:	f4                   	hlt    
  a4e171:	eb fd                	jmp    a4e170 <error+0x20>
  a4e173:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4e17a:	00 00 00 
  a4e17d:	0f 1f 00             	nopl   (%rax)

0000000000a4e180 <has_eflag>:
  a4e180:	f3 0f 1e fa          	endbr64 
  a4e184:	9c                   	pushfq 
  a4e185:	9c                   	pushfq 
  a4e186:	58                   	pop    %rax
  a4e187:	48 89 c2             	mov    %rax,%rdx
  a4e18a:	48 31 fa             	xor    %rdi,%rdx
  a4e18d:	52                   	push   %rdx
  a4e18e:	9d                   	popfq  
  a4e18f:	9c                   	pushfq 
  a4e190:	5a                   	pop    %rdx
  a4e191:	9d                   	popfq  
  a4e192:	48 31 d0             	xor    %rdx,%rax
  a4e195:	48 85 f8             	test   %rdi,%rax
  a4e198:	0f 95 c0             	setne  %al
  a4e19b:	0f b6 c0             	movzbl %al,%eax
  a4e19e:	c3                   	retq   
  a4e19f:	90                   	nop

0000000000a4e1a0 <get_cpuflags>:
  a4e1a0:	f3 0f 1e fa          	endbr64 
  a4e1a4:	80 3d 2d d0 01 00 00 	cmpb   $0x0,0x1d02d(%rip)        # a6b1d8 <loaded_flags>
  a4e1ab:	74 03                	je     a4e1b0 <get_cpuflags+0x10>
  a4e1ad:	c3                   	retq   
  a4e1ae:	66 90                	xchg   %ax,%ax
  a4e1b0:	53                   	push   %rbx
  a4e1b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4e1b6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  a4e1bb:	c6 05 16 d0 01 00 01 	movb   $0x1,0x1d016(%rip)        # a6b1d8 <loaded_flags>
  a4e1c2:	66 89 44 24 fc       	mov    %ax,-0x4(%rsp)
  a4e1c7:	66 89 54 24 fe       	mov    %dx,-0x2(%rsp)
  a4e1cc:	0f 20 c0             	mov    %cr0,%rax
  a4e1cf:	a8 0c                	test   $0xc,%al
  a4e1d1:	74 07                	je     a4e1da <get_cpuflags+0x3a>
  a4e1d3:	48 83 e0 f3          	and    $0xfffffffffffffff3,%rax
  a4e1d7:	0f 22 c0             	mov    %rax,%cr0
  a4e1da:	db e3                	fninit 
  a4e1dc:	dd 7c 24 fe          	fnstsw -0x2(%rsp)
  a4e1e0:	d9 7c 24 fc          	fnstcw -0x4(%rsp)
  a4e1e4:	66 83 7c 24 fe 00    	cmpw   $0x0,-0x2(%rsp)
  a4e1ea:	75 13                	jne    a4e1ff <get_cpuflags+0x5f>
  a4e1ec:	0f b7 44 24 fc       	movzwl -0x4(%rsp),%eax
  a4e1f1:	66 25 3f 10          	and    $0x103f,%ax
  a4e1f5:	66 83 f8 3f          	cmp    $0x3f,%ax
  a4e1f9:	0f 84 c9 00 00 00    	je     a4e2c8 <get_cpuflags+0x128>
  a4e1ff:	9c                   	pushfq 
  a4e200:	9c                   	pushfq 
  a4e201:	58                   	pop    %rax
  a4e202:	48 89 c2             	mov    %rax,%rdx
  a4e205:	48 81 f2 00 00 20 00 	xor    $0x200000,%rdx
  a4e20c:	52                   	push   %rdx
  a4e20d:	9d                   	popfq  
  a4e20e:	9c                   	pushfq 
  a4e20f:	5a                   	pop    %rdx
  a4e210:	9d                   	popfq  
  a4e211:	48 31 d0             	xor    %rdx,%rax
  a4e214:	a9 00 00 20 00       	test   $0x200000,%eax
  a4e219:	0f 84 a2 00 00 00    	je     a4e2c1 <get_cpuflags+0x121>
  a4e21f:	31 f6                	xor    %esi,%esi
  a4e221:	89 f0                	mov    %esi,%eax
  a4e223:	89 f1                	mov    %esi,%ecx
  a4e225:	0f a2                	cpuid  
  a4e227:	89 c7                	mov    %eax,%edi
  a4e229:	8d 40 ff             	lea    -0x1(%rax),%eax
  a4e22c:	89 0d 36 cf 01 00    	mov    %ecx,0x1cf36(%rip)        # a6b168 <cpu_vendor+0x8>
  a4e232:	89 15 2c cf 01 00    	mov    %edx,0x1cf2c(%rip)        # a6b164 <cpu_vendor+0x4>
  a4e238:	89 1d 22 cf 01 00    	mov    %ebx,0x1cf22(%rip)        # a6b160 <cpu_vendor>
  a4e23e:	3d fe ff 00 00       	cmp    $0xfffe,%eax
  a4e243:	77 3c                	ja     a4e281 <get_cpuflags+0xe1>
  a4e245:	b8 01 00 00 00       	mov    $0x1,%eax
  a4e24a:	89 f1                	mov    %esi,%ecx
  a4e24c:	0f a2                	cpuid  
  a4e24e:	89 15 38 cf 01 00    	mov    %edx,0x1cf38(%rip)        # a6b18c <cpu+0xc>
  a4e254:	89 c2                	mov    %eax,%edx
  a4e256:	89 0d 40 cf 01 00    	mov    %ecx,0x1cf40(%rip)        # a6b19c <cpu+0x1c>
  a4e25c:	c1 ea 08             	shr    $0x8,%edx
  a4e25f:	89 c1                	mov    %eax,%ecx
  a4e261:	83 e2 0f             	and    $0xf,%edx
  a4e264:	c1 e9 04             	shr    $0x4,%ecx
  a4e267:	89 15 13 cf 01 00    	mov    %edx,0x1cf13(%rip)        # a6b180 <cpu>
  a4e26d:	83 e1 0f             	and    $0xf,%ecx
  a4e270:	89 15 0e cf 01 00    	mov    %edx,0x1cf0e(%rip)        # a6b184 <cpu+0x4>
  a4e276:	83 fa 05             	cmp    $0x5,%edx
  a4e279:	7f 5d                	jg     a4e2d8 <get_cpuflags+0x138>
  a4e27b:	89 0d 07 cf 01 00    	mov    %ecx,0x1cf07(%rip)        # a6b188 <cpu+0x8>
  a4e281:	83 ff 06             	cmp    $0x6,%edi
  a4e284:	76 0f                	jbe    a4e295 <get_cpuflags+0xf5>
  a4e286:	b8 07 00 00 00       	mov    $0x7,%eax
  a4e28b:	31 c9                	xor    %ecx,%ecx
  a4e28d:	0f a2                	cpuid  
  a4e28f:	89 0d 37 cf 01 00    	mov    %ecx,0x1cf37(%rip)        # a6b1cc <cpu+0x4c>
  a4e295:	31 f6                	xor    %esi,%esi
  a4e297:	b8 00 00 00 80       	mov    $0x80000000,%eax
  a4e29c:	89 f1                	mov    %esi,%ecx
  a4e29e:	0f a2                	cpuid  
  a4e2a0:	05 ff ff ff 7f       	add    $0x7fffffff,%eax
  a4e2a5:	3d fe ff 00 00       	cmp    $0xfffe,%eax
  a4e2aa:	77 15                	ja     a4e2c1 <get_cpuflags+0x121>
  a4e2ac:	b8 01 00 00 80       	mov    $0x80000001,%eax
  a4e2b1:	89 f1                	mov    %esi,%ecx
  a4e2b3:	0f a2                	cpuid  
  a4e2b5:	89 0d e9 ce 01 00    	mov    %ecx,0x1cee9(%rip)        # a6b1a4 <cpu+0x24>
  a4e2bb:	89 15 cf ce 01 00    	mov    %edx,0x1cecf(%rip)        # a6b190 <cpu+0x10>
  a4e2c1:	5b                   	pop    %rbx
  a4e2c2:	c3                   	retq   
  a4e2c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4e2c8:	0f ba 2d bc ce 01 00 	btsl   $0x0,0x1cebc(%rip)        # a6b18c <cpu+0xc>
  a4e2cf:	00 
  a4e2d0:	e9 2a ff ff ff       	jmpq   a4e1ff <get_cpuflags+0x5f>
  a4e2d5:	0f 1f 00             	nopl   (%rax)
  a4e2d8:	c1 e8 0c             	shr    $0xc,%eax
  a4e2db:	25 f0 00 00 00       	and    $0xf0,%eax
  a4e2e0:	01 c8                	add    %ecx,%eax
  a4e2e2:	89 05 a0 ce 01 00    	mov    %eax,0x1cea0(%rip)        # a6b188 <cpu+0x8>
  a4e2e8:	eb 97                	jmp    a4e281 <get_cpuflags+0xe1>
  a4e2ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000a4e2f0 <has_cpuflag>:
  a4e2f0:	f3 0f 1e fa          	endbr64 
  a4e2f4:	41 89 f8             	mov    %edi,%r8d
  a4e2f7:	e8 a4 fe ff ff       	callq  a4e1a0 <get_cpuflags>
  a4e2fc:	44 0f a3 05 88 ce 01 	bt     %r8d,0x1ce88(%rip)        # a6b18c <cpu+0xc>
  a4e303:	00 
  a4e304:	0f 92 c0             	setb   %al
  a4e307:	c3                   	retq   
  a4e308:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4e30f:	00 

0000000000a4e310 <early_serial_init>:
  a4e310:	44 8d 47 03          	lea    0x3(%rdi),%r8d
  a4e314:	b9 03 00 00 00       	mov    $0x3,%ecx
  a4e319:	89 c8                	mov    %ecx,%eax
  a4e31b:	44 89 c2             	mov    %r8d,%edx
  a4e31e:	ee                   	out    %al,(%dx)
  a4e31f:	44 8d 4f 01          	lea    0x1(%rdi),%r9d
  a4e323:	31 c0                	xor    %eax,%eax
  a4e325:	44 89 ca             	mov    %r9d,%edx
  a4e328:	ee                   	out    %al,(%dx)
  a4e329:	8d 57 02             	lea    0x2(%rdi),%edx
  a4e32c:	ee                   	out    %al,(%dx)
  a4e32d:	8d 57 04             	lea    0x4(%rdi),%edx
  a4e330:	89 c8                	mov    %ecx,%eax
  a4e332:	ee                   	out    %al,(%dx)
  a4e333:	b8 00 c2 01 00       	mov    $0x1c200,%eax
  a4e338:	99                   	cltd   
  a4e339:	f7 fe                	idiv   %esi
  a4e33b:	44 89 c2             	mov    %r8d,%edx
  a4e33e:	89 c1                	mov    %eax,%ecx
  a4e340:	ec                   	in     (%dx),%al
  a4e341:	89 c6                	mov    %eax,%esi
  a4e343:	83 c8 80             	or     $0xffffff80,%eax
  a4e346:	ee                   	out    %al,(%dx)
  a4e347:	89 c8                	mov    %ecx,%eax
  a4e349:	89 fa                	mov    %edi,%edx
  a4e34b:	ee                   	out    %al,(%dx)
  a4e34c:	89 c8                	mov    %ecx,%eax
  a4e34e:	44 89 ca             	mov    %r9d,%edx
  a4e351:	c1 e8 08             	shr    $0x8,%eax
  a4e354:	ee                   	out    %al,(%dx)
  a4e355:	89 f0                	mov    %esi,%eax
  a4e357:	44 89 c2             	mov    %r8d,%edx
  a4e35a:	83 e0 7f             	and    $0x7f,%eax
  a4e35d:	ee                   	out    %al,(%dx)
  a4e35e:	89 3d 78 ce 01 00    	mov    %edi,0x1ce78(%rip)        # a6b1dc <early_serial_base>
  a4e364:	c3                   	retq   
  a4e365:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4e36c:	00 00 00 00 

0000000000a4e370 <console_init>:
  a4e370:	f3 0f 1e fa          	endbr64 
  a4e374:	41 56                	push   %r14
  a4e376:	ba 20 00 00 00       	mov    $0x20,%edx
  a4e37b:	48 8d 3d 75 62 00 00 	lea    0x6275(%rip),%rdi        # a545f7 <efi_MemoryOverWriteRequest_name+0x2d7>
  a4e382:	41 55                	push   %r13
  a4e384:	41 54                	push   %r12
  a4e386:	55                   	push   %rbp
  a4e387:	53                   	push   %rbx
  a4e388:	48 83 ec 50          	sub    $0x50,%rsp
  a4e38c:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
  a4e391:	48 89 ee             	mov    %rbp,%rsi
  a4e394:	e8 27 fd ff ff       	callq  a4e0c0 <cmdline_find_option>
  a4e399:	85 c0                	test   %eax,%eax
  a4e39b:	7f 23                	jg     a4e3c0 <console_init+0x50>
  a4e39d:	8b 05 39 ce 01 00    	mov    0x1ce39(%rip),%eax        # a6b1dc <early_serial_base>
  a4e3a3:	85 c0                	test   %eax,%eax
  a4e3a5:	0f 84 c5 00 00 00    	je     a4e470 <console_init+0x100>
  a4e3ab:	48 83 c4 50          	add    $0x50,%rsp
  a4e3af:	5b                   	pop    %rbx
  a4e3b0:	5d                   	pop    %rbp
  a4e3b1:	41 5c                	pop    %r12
  a4e3b3:	41 5d                	pop    %r13
  a4e3b5:	41 5e                	pop    %r14
  a4e3b7:	c3                   	retq   
  a4e3b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4e3bf:	00 
  a4e3c0:	ba 06 00 00 00       	mov    $0x6,%edx
  a4e3c5:	48 8d 35 37 62 00 00 	lea    0x6237(%rip),%rsi        # a54603 <efi_MemoryOverWriteRequest_name+0x2e3>
  a4e3cc:	48 89 ef             	mov    %rbp,%rdi
  a4e3cf:	e8 ac f5 ff ff       	callq  a4d980 <strncmp>
  a4e3d4:	85 c0                	test   %eax,%eax
  a4e3d6:	0f 84 54 01 00 00    	je     a4e530 <console_init+0x1c0>
  a4e3dc:	31 db                	xor    %ebx,%ebx
  a4e3de:	80 7c 24 10 2c       	cmpb   $0x2c,0x10(%rsp)
  a4e3e3:	40 0f 94 c7          	sete   %dil
  a4e3e7:	0f 94 c3             	sete   %bl
  a4e3ea:	45 31 e4             	xor    %r12d,%r12d
  a4e3ed:	40 0f b6 ff          	movzbl %dil,%edi
  a4e3f1:	48 01 ef             	add    %rbp,%rdi
  a4e3f4:	ba 04 00 00 00       	mov    $0x4,%edx
  a4e3f9:	48 8d 35 0a 62 00 00 	lea    0x620a(%rip),%rsi        # a5460a <efi_MemoryOverWriteRequest_name+0x2ea>
  a4e400:	e8 7b f5 ff ff       	callq  a4d980 <strncmp>
  a4e405:	4c 8d 6c 24 08       	lea    0x8(%rsp),%r13
  a4e40a:	85 c0                	test   %eax,%eax
  a4e40c:	0f 84 4e 01 00 00    	je     a4e560 <console_init+0x1f0>
  a4e412:	48 63 c3             	movslq %ebx,%rax
  a4e415:	80 7c 04 10 2c       	cmpb   $0x2c,0x10(%rsp,%rax,1)
  a4e41a:	75 06                	jne    a4e422 <console_init+0xb2>
  a4e41c:	83 c3 01             	add    $0x1,%ebx
  a4e41f:	48 63 c3             	movslq %ebx,%rax
  a4e422:	48 8d 5c 05 00       	lea    0x0(%rbp,%rax,1),%rbx
  a4e427:	4c 89 ee             	mov    %r13,%rsi
  a4e42a:	31 d2                	xor    %edx,%edx
  a4e42c:	48 89 df             	mov    %rbx,%rdi
  a4e42f:	e8 0c f6 ff ff       	callq  a4da40 <simple_strtoull>
  a4e434:	89 c6                	mov    %eax,%esi
  a4e436:	85 c0                	test   %eax,%eax
  a4e438:	0f 84 12 01 00 00    	je     a4e550 <console_init+0x1e0>
  a4e43e:	48 3b 5c 24 08       	cmp    0x8(%rsp),%rbx
  a4e443:	b8 80 25 00 00       	mov    $0x2580,%eax
  a4e448:	0f 44 f0             	cmove  %eax,%esi
  a4e44b:	45 85 e4             	test   %r12d,%r12d
  a4e44e:	0f 84 49 ff ff ff    	je     a4e39d <console_init+0x2d>
  a4e454:	44 89 e7             	mov    %r12d,%edi
  a4e457:	e8 b4 fe ff ff       	callq  a4e310 <early_serial_init>
  a4e45c:	8b 05 7a cd 01 00    	mov    0x1cd7a(%rip),%eax        # a6b1dc <early_serial_base>
  a4e462:	85 c0                	test   %eax,%eax
  a4e464:	0f 85 41 ff ff ff    	jne    a4e3ab <console_init+0x3b>
  a4e46a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4e470:	ba 40 00 00 00       	mov    $0x40,%edx
  a4e475:	48 89 ee             	mov    %rbp,%rsi
  a4e478:	48 8d 3d 90 61 00 00 	lea    0x6190(%rip),%rdi        # a5460f <efi_MemoryOverWriteRequest_name+0x2ef>
  a4e47f:	e8 3c fc ff ff       	callq  a4e0c0 <cmdline_find_option>
  a4e484:	85 c0                	test   %eax,%eax
  a4e486:	0f 8e 1f ff ff ff    	jle    a4e3ab <console_init+0x3b>
  a4e48c:	ba 0c 00 00 00       	mov    $0xc,%edx
  a4e491:	48 8d 35 7f 61 00 00 	lea    0x617f(%rip),%rsi        # a54617 <efi_MemoryOverWriteRequest_name+0x2f7>
  a4e498:	48 89 ef             	mov    %rbp,%rdi
  a4e49b:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
  a4e4a0:	e8 db f4 ff ff       	callq  a4d980 <strncmp>
  a4e4a5:	85 c0                	test   %eax,%eax
  a4e4a7:	0f 85 13 01 00 00    	jne    a4e5c0 <console_init+0x250>
  a4e4ad:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  a4e4b2:	4c 8d 6c 24 08       	lea    0x8(%rsp),%r13
  a4e4b7:	31 d2                	xor    %edx,%edx
  a4e4b9:	4c 89 ee             	mov    %r13,%rsi
  a4e4bc:	48 8d 78 0c          	lea    0xc(%rax),%rdi
  a4e4c0:	e8 7b f5 ff ff       	callq  a4da40 <simple_strtoull>
  a4e4c5:	41 89 c4             	mov    %eax,%r12d
  a4e4c8:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  a4e4cd:	48 85 ff             	test   %rdi,%rdi
  a4e4d0:	74 09                	je     a4e4db <console_init+0x16b>
  a4e4d2:	80 3f 2c             	cmpb   $0x2c,(%rdi)
  a4e4d5:	0f 84 65 01 00 00    	je     a4e640 <console_init+0x2d0>
  a4e4db:	41 8d 4c 24 03       	lea    0x3(%r12),%ecx
  a4e4e0:	89 ca                	mov    %ecx,%edx
  a4e4e2:	ec                   	in     (%dx),%al
  a4e4e3:	41 89 c0             	mov    %eax,%r8d
  a4e4e6:	83 c8 80             	or     $0xffffff80,%eax
  a4e4e9:	ee                   	out    %al,(%dx)
  a4e4ea:	44 89 e2             	mov    %r12d,%edx
  a4e4ed:	ec                   	in     (%dx),%al
  a4e4ee:	0f b6 f8             	movzbl %al,%edi
  a4e4f1:	41 8d 54 24 01       	lea    0x1(%r12),%edx
  a4e4f6:	ec                   	in     (%dx),%al
  a4e4f7:	89 c6                	mov    %eax,%esi
  a4e4f9:	89 ca                	mov    %ecx,%edx
  a4e4fb:	44 89 c0             	mov    %r8d,%eax
  a4e4fe:	ee                   	out    %al,(%dx)
  a4e4ff:	40 0f b6 ce          	movzbl %sil,%ecx
  a4e503:	b8 00 c2 01 00       	mov    $0x1c200,%eax
  a4e508:	31 d2                	xor    %edx,%edx
  a4e50a:	c1 e1 08             	shl    $0x8,%ecx
  a4e50d:	09 f9                	or     %edi,%ecx
  a4e50f:	f7 f1                	div    %ecx
  a4e511:	45 85 e4             	test   %r12d,%r12d
  a4e514:	0f 84 91 fe ff ff    	je     a4e3ab <console_init+0x3b>
  a4e51a:	89 c6                	mov    %eax,%esi
  a4e51c:	44 89 e7             	mov    %r12d,%edi
  a4e51f:	e8 ec fd ff ff       	callq  a4e310 <early_serial_init>
  a4e524:	e9 82 fe ff ff       	jmpq   a4e3ab <console_init+0x3b>
  a4e529:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4e530:	80 7c 24 16 2c       	cmpb   $0x2c,0x16(%rsp)
  a4e535:	74 51                	je     a4e588 <console_init+0x218>
  a4e537:	bf 06 00 00 00       	mov    $0x6,%edi
  a4e53c:	41 bc f8 03 00 00    	mov    $0x3f8,%r12d
  a4e542:	bb 06 00 00 00       	mov    $0x6,%ebx
  a4e547:	e9 a5 fe ff ff       	jmpq   a4e3f1 <console_init+0x81>
  a4e54c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4e550:	be 80 25 00 00       	mov    $0x2580,%esi
  a4e555:	e9 f1 fe ff ff       	jmpq   a4e44b <console_init+0xdb>
  a4e55a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4e560:	8d 43 04             	lea    0x4(%rbx),%eax
  a4e563:	31 d2                	xor    %edx,%edx
  a4e565:	83 c3 05             	add    $0x5,%ebx
  a4e568:	48 98                	cltq   
  a4e56a:	80 7c 04 10 31       	cmpb   $0x31,0x10(%rsp,%rax,1)
  a4e56f:	48 8d 05 6a 5a 00 00 	lea    0x5a6a(%rip),%rax        # a53fe0 <bases.0>
  a4e576:	0f 94 c2             	sete   %dl
  a4e579:	44 8b 24 90          	mov    (%rax,%rdx,4),%r12d
  a4e57d:	e9 90 fe ff ff       	jmpq   a4e412 <console_init+0xa2>
  a4e582:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4e588:	4c 8d 74 24 17       	lea    0x17(%rsp),%r14
  a4e58d:	ba 02 00 00 00       	mov    $0x2,%edx
  a4e592:	48 8d 35 94 60 00 00 	lea    0x6094(%rip),%rsi        # a5462d <efi_MemoryOverWriteRequest_name+0x30d>
  a4e599:	4c 89 f7             	mov    %r14,%rdi
  a4e59c:	e8 df f3 ff ff       	callq  a4d980 <strncmp>
  a4e5a1:	85 c0                	test   %eax,%eax
  a4e5a3:	74 5b                	je     a4e600 <console_init+0x290>
  a4e5a5:	bf 07 00 00 00       	mov    $0x7,%edi
  a4e5aa:	41 bc f8 03 00 00    	mov    $0x3f8,%r12d
  a4e5b0:	bb 07 00 00 00       	mov    $0x7,%ebx
  a4e5b5:	e9 37 fe ff ff       	jmpq   a4e3f1 <console_init+0x81>
  a4e5ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4e5c0:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  a4e5c5:	ba 08 00 00 00       	mov    $0x8,%edx
  a4e5ca:	48 8d 35 53 60 00 00 	lea    0x6053(%rip),%rsi        # a54624 <efi_MemoryOverWriteRequest_name+0x304>
  a4e5d1:	e8 aa f3 ff ff       	callq  a4d980 <strncmp>
  a4e5d6:	85 c0                	test   %eax,%eax
  a4e5d8:	0f 85 cd fd ff ff    	jne    a4e3ab <console_init+0x3b>
  a4e5de:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  a4e5e3:	4c 8d 6c 24 08       	lea    0x8(%rsp),%r13
  a4e5e8:	31 d2                	xor    %edx,%edx
  a4e5ea:	4c 89 ee             	mov    %r13,%rsi
  a4e5ed:	48 8d 78 08          	lea    0x8(%rax),%rdi
  a4e5f1:	e8 4a f4 ff ff       	callq  a4da40 <simple_strtoull>
  a4e5f6:	41 89 c4             	mov    %eax,%r12d
  a4e5f9:	e9 ca fe ff ff       	jmpq   a4e4c8 <console_init+0x158>
  a4e5fe:	66 90                	xchg   %ax,%ax
  a4e600:	4c 8d 6c 24 08       	lea    0x8(%rsp),%r13
  a4e605:	ba 10 00 00 00       	mov    $0x10,%edx
  a4e60a:	4c 89 f7             	mov    %r14,%rdi
  a4e60d:	4c 89 ee             	mov    %r13,%rsi
  a4e610:	e8 2b f4 ff ff       	callq  a4da40 <simple_strtoull>
  a4e615:	41 89 c4             	mov    %eax,%r12d
  a4e618:	85 c0                	test   %eax,%eax
  a4e61a:	74 14                	je     a4e630 <console_init+0x2c0>
  a4e61c:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  a4e621:	4c 39 f3             	cmp    %r14,%rbx
  a4e624:	74 0a                	je     a4e630 <console_init+0x2c0>
  a4e626:	29 eb                	sub    %ebp,%ebx
  a4e628:	e9 e5 fd ff ff       	jmpq   a4e412 <console_init+0xa2>
  a4e62d:	0f 1f 00             	nopl   (%rax)
  a4e630:	41 bc f8 03 00 00    	mov    $0x3f8,%r12d
  a4e636:	bb 07 00 00 00       	mov    $0x7,%ebx
  a4e63b:	e9 d2 fd ff ff       	jmpq   a4e412 <console_init+0xa2>
  a4e640:	48 83 c7 01          	add    $0x1,%rdi
  a4e644:	31 d2                	xor    %edx,%edx
  a4e646:	4c 89 ee             	mov    %r13,%rsi
  a4e649:	e8 f2 f3 ff ff       	callq  a4da40 <simple_strtoull>
  a4e64e:	e9 be fe ff ff       	jmpq   a4e511 <console_init+0x1a1>
  a4e653:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4e65a:	00 00 00 
  a4e65d:	0f 1f 00             	nopl   (%rax)

0000000000a4e660 <store_slot_info>:
  a4e660:	48 8b 15 89 cb 01 00 	mov    0x1cb89(%rip),%rdx        # a6b1f0 <slot_area_index>
  a4e667:	48 83 fa 64          	cmp    $0x64,%rdx
  a4e66b:	74 3d                	je     a4e6aa <store_slot_info+0x4a>
  a4e66d:	48 8b 47 08          	mov    0x8(%rdi),%rax
  a4e671:	48 29 f0             	sub    %rsi,%rax
  a4e674:	48 c1 e8 15          	shr    $0x15,%rax
  a4e678:	83 c0 01             	add    $0x1,%eax
  a4e67b:	85 c0                	test   %eax,%eax
  a4e67d:	7e 2b                	jle    a4e6aa <store_slot_info+0x4a>
  a4e67f:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  a4e683:	48 c1 e2 04          	shl    $0x4,%rdx
  a4e687:	48 8b 37             	mov    (%rdi),%rsi
  a4e68a:	48 89 0d 5f cb 01 00 	mov    %rcx,0x1cb5f(%rip)        # a6b1f0 <slot_area_index>
  a4e691:	48 8d 0d 68 cb 01 00 	lea    0x1cb68(%rip),%rcx        # a6b200 <slot_areas>
  a4e698:	48 01 ca             	add    %rcx,%rdx
  a4e69b:	89 42 08             	mov    %eax,0x8(%rdx)
  a4e69e:	48 98                	cltq   
  a4e6a0:	48 01 05 51 cb 01 00 	add    %rax,0x1cb51(%rip)        # a6b1f8 <slot_max>
  a4e6a7:	48 89 32             	mov    %rsi,(%rdx)
  a4e6aa:	c3                   	retq   
  a4e6ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000a4e6b0 <process_gb_huge_pages>:
  a4e6b0:	48 8b 15 89 d1 01 00 	mov    0x1d189(%rip),%rdx        # a6b840 <max_gb_huge_pages>
  a4e6b7:	49 89 f9             	mov    %rdi,%r9
  a4e6ba:	49 89 f3             	mov    %rsi,%r11
  a4e6bd:	48 85 d2             	test   %rdx,%rdx
  a4e6c0:	0f 84 8a 00 00 00    	je     a4e750 <process_gb_huge_pages+0xa0>
  a4e6c6:	48 8b 3f             	mov    (%rdi),%rdi
  a4e6c9:	49 8b 71 08          	mov    0x8(%r9),%rsi
  a4e6cd:	4c 8d 87 ff ff ff 3f 	lea    0x3fffffff(%rdi),%r8
  a4e6d4:	48 01 fe             	add    %rdi,%rsi
  a4e6d7:	4d 89 c2             	mov    %r8,%r10
  a4e6da:	49 81 e2 00 00 00 c0 	and    $0xffffffffc0000000,%r10
  a4e6e1:	4c 39 d6             	cmp    %r10,%rsi
  a4e6e4:	76 6a                	jbe    a4e750 <process_gb_huge_pages+0xa0>
  a4e6e6:	48 89 f0             	mov    %rsi,%rax
  a4e6e9:	4c 29 d0             	sub    %r10,%rax
  a4e6ec:	48 3d 00 00 00 40    	cmp    $0x40000000,%rax
  a4e6f2:	76 5c                	jbe    a4e750 <process_gb_huge_pages+0xa0>
  a4e6f4:	48 2d 01 00 00 40    	sub    $0x40000001,%rax
  a4e6fa:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
  a4e6fe:	48 83 ec 10          	sub    $0x10,%rsp
  a4e702:	48 c1 e8 1e          	shr    $0x1e,%rax
  a4e706:	48 29 c1             	sub    %rax,%rcx
  a4e709:	48 89 d0             	mov    %rdx,%rax
  a4e70c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4e710:	48 83 e8 01          	sub    $0x1,%rax
  a4e714:	41 89 d0             	mov    %edx,%r8d
  a4e717:	41 29 c0             	sub    %eax,%r8d
  a4e71a:	48 39 c8             	cmp    %rcx,%rax
  a4e71d:	74 41                	je     a4e760 <process_gb_huge_pages+0xb0>
  a4e71f:	48 85 c0             	test   %rax,%rax
  a4e722:	75 ec                	jne    a4e710 <process_gb_huge_pages+0x60>
  a4e724:	48 c7 05 11 d1 01 00 	movq   $0x0,0x1d111(%rip)        # a6b840 <max_gb_huge_pages>
  a4e72b:	00 00 00 00 
  a4e72f:	4a 8d 04 1f          	lea    (%rdi,%r11,1),%rax
  a4e733:	4c 39 d0             	cmp    %r10,%rax
  a4e736:	76 38                	jbe    a4e770 <process_gb_huge_pages+0xc0>
  a4e738:	4d 63 c0             	movslq %r8d,%r8
  a4e73b:	49 c1 e0 1e          	shl    $0x1e,%r8
  a4e73f:	4d 01 d0             	add    %r10,%r8
  a4e742:	4c 29 c6             	sub    %r8,%rsi
  a4e745:	49 39 f3             	cmp    %rsi,%r11
  a4e748:	76 4e                	jbe    a4e798 <process_gb_huge_pages+0xe8>
  a4e74a:	48 83 c4 10          	add    $0x10,%rsp
  a4e74e:	c3                   	retq   
  a4e74f:	90                   	nop
  a4e750:	4c 89 de             	mov    %r11,%rsi
  a4e753:	4c 89 cf             	mov    %r9,%rdi
  a4e756:	e9 05 ff ff ff       	jmpq   a4e660 <store_slot_info>
  a4e75b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4e760:	48 89 05 d9 d0 01 00 	mov    %rax,0x1d0d9(%rip)        # a6b840 <max_gb_huge_pages>
  a4e767:	4a 8d 04 1f          	lea    (%rdi,%r11,1),%rax
  a4e76b:	4c 39 d0             	cmp    %r10,%rax
  a4e76e:	77 c8                	ja     a4e738 <process_gb_huge_pages+0x88>
  a4e770:	4c 89 d0             	mov    %r10,%rax
  a4e773:	48 89 3c 24          	mov    %rdi,(%rsp)
  a4e777:	4c 89 de             	mov    %r11,%rsi
  a4e77a:	48 29 f8             	sub    %rdi,%rax
  a4e77d:	48 89 e7             	mov    %rsp,%rdi
  a4e780:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a4e785:	e8 d6 fe ff ff       	callq  a4e660 <store_slot_info>
  a4e78a:	49 8b 31             	mov    (%r9),%rsi
  a4e78d:	49 03 71 08          	add    0x8(%r9),%rsi
  a4e791:	eb a5                	jmp    a4e738 <process_gb_huge_pages+0x88>
  a4e793:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4e798:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  a4e79d:	48 89 e7             	mov    %rsp,%rdi
  a4e7a0:	4c 89 de             	mov    %r11,%rsi
  a4e7a3:	4c 89 04 24          	mov    %r8,(%rsp)
  a4e7a7:	e8 b4 fe ff ff       	callq  a4e660 <store_slot_info>
  a4e7ac:	48 83 c4 10          	add    $0x10,%rsp
  a4e7b0:	c3                   	retq   
  a4e7b1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4e7b8:	00 00 00 00 
  a4e7bc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000a4e7c0 <process_mem_region.isra.0>:
  a4e7c0:	41 57                	push   %r15
  a4e7c2:	41 56                	push   %r14
  a4e7c4:	4c 8d 34 37          	lea    (%rdi,%rsi,1),%r14
  a4e7c8:	41 55                	push   %r13
  a4e7ca:	41 54                	push   %r12
  a4e7cc:	55                   	push   %rbp
  a4e7cd:	53                   	push   %rbx
  a4e7ce:	48 83 ec 20          	sub    $0x20,%rsp
  a4e7d2:	49 39 d6             	cmp    %rdx,%r14
  a4e7d5:	0f 82 52 01 00 00    	jb     a4e92d <process_mem_region.isra.0+0x16d>
  a4e7db:	4c 39 35 2e 77 00 00 	cmp    %r14,0x772e(%rip)        # a55f10 <mem_limit>
  a4e7e2:	4c 0f 46 35 26 77 00 	cmovbe 0x7726(%rip),%r14        # a55f10 <mem_limit>
  a4e7e9:	00 
  a4e7ea:	48 89 f8             	mov    %rdi,%rax
  a4e7ed:	49 39 fe             	cmp    %rdi,%r14
  a4e7f0:	0f 86 37 01 00 00    	jbe    a4e92d <process_mem_region.isra.0+0x16d>
  a4e7f6:	49 89 d5             	mov    %rdx,%r13
  a4e7f9:	4c 89 f2             	mov    %r14,%rdx
  a4e7fc:	48 29 fa             	sub    %rdi,%rdx
  a4e7ff:	48 83 3d e9 c9 01 00 	cmpq   $0x63,0x1c9e9(%rip)        # a6b1f0 <slot_area_index>
  a4e806:	63 
  a4e807:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
  a4e80c:	0f 87 1b 01 00 00    	ja     a4e92d <process_mem_region.isra.0+0x16d>
  a4e812:	49 89 cf             	mov    %rcx,%r15
  a4e815:	4c 8d 25 c4 d0 01 00 	lea    0x1d0c4(%rip),%r12        # a6b8e0 <memmap_too_large>
  a4e81c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4e820:	49 39 c5             	cmp    %rax,%r13
  a4e823:	49 89 c0             	mov    %rax,%r8
  a4e826:	4d 0f 43 c5          	cmovae %r13,%r8
  a4e82a:	49 81 c0 ff ff 1f 00 	add    $0x1fffff,%r8
  a4e831:	49 81 e0 00 00 e0 ff 	and    $0xffffffffffe00000,%r8
  a4e838:	4c 89 04 24          	mov    %r8,(%rsp)
  a4e83c:	4d 39 c6             	cmp    %r8,%r14
  a4e83f:	0f 82 e8 00 00 00    	jb     a4e92d <process_mem_region.isra.0+0x16d>
  a4e845:	48 03 44 24 08       	add    0x8(%rsp),%rax
  a4e84a:	48 89 c7             	mov    %rax,%rdi
  a4e84d:	4c 29 c0             	sub    %r8,%rax
  a4e850:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a4e855:	4c 39 f8             	cmp    %r15,%rax
  a4e858:	0f 82 cf 00 00 00    	jb     a4e92d <process_mem_region.isra.0+0x16d>
  a4e85e:	48 8d 05 fb cf 01 00 	lea    0x1cffb(%rip),%rax        # a6b860 <mem_avoid>
  a4e865:	48 89 fe             	mov    %rdi,%rsi
  a4e868:	45 31 c9             	xor    %r9d,%r9d
  a4e86b:	eb 0c                	jmp    a4e879 <process_mem_region.isra.0+0xb9>
  a4e86d:	0f 1f 00             	nopl   (%rax)
  a4e870:	48 83 c0 10          	add    $0x10,%rax
  a4e874:	4c 39 e0             	cmp    %r12,%rax
  a4e877:	74 37                	je     a4e8b0 <process_mem_region.isra.0+0xf0>
  a4e879:	48 8b 10             	mov    (%rax),%rdx
  a4e87c:	48 39 d7             	cmp    %rdx,%rdi
  a4e87f:	76 ef                	jbe    a4e870 <process_mem_region.isra.0+0xb0>
  a4e881:	4c 8b 50 08          	mov    0x8(%rax),%r10
  a4e885:	4a 8d 0c 12          	lea    (%rdx,%r10,1),%rcx
  a4e889:	49 39 c8             	cmp    %rcx,%r8
  a4e88c:	0f 92 c1             	setb   %cl
  a4e88f:	48 39 f2             	cmp    %rsi,%rdx
  a4e892:	41 0f 92 c3          	setb   %r11b
  a4e896:	44 20 d9             	and    %r11b,%cl
  a4e899:	74 d5                	je     a4e870 <process_mem_region.isra.0+0xb0>
  a4e89b:	48 83 c0 10          	add    $0x10,%rax
  a4e89f:	4c 89 d5             	mov    %r10,%rbp
  a4e8a2:	48 89 d3             	mov    %rdx,%rbx
  a4e8a5:	41 89 c9             	mov    %ecx,%r9d
  a4e8a8:	48 89 d6             	mov    %rdx,%rsi
  a4e8ab:	4c 39 e0             	cmp    %r12,%rax
  a4e8ae:	75 c9                	jne    a4e879 <process_mem_region.isra.0+0xb9>
  a4e8b0:	48 8b 05 59 b8 01 00 	mov    0x1b859(%rip),%rax        # a6a110 <boot_params>
  a4e8b7:	48 8b 80 50 02 00 00 	mov    0x250(%rax),%rax
  a4e8be:	48 85 c0             	test   %rax,%rax
  a4e8c1:	74 3d                	je     a4e900 <process_mem_region.isra.0+0x140>
  a4e8c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4e8c8:	8b 50 0c             	mov    0xc(%rax),%edx
  a4e8cb:	48 39 c7             	cmp    %rax,%rdi
  a4e8ce:	76 28                	jbe    a4e8f8 <process_mem_region.isra.0+0x138>
  a4e8d0:	48 83 c2 10          	add    $0x10,%rdx
  a4e8d4:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
  a4e8d8:	49 39 c8             	cmp    %rcx,%r8
  a4e8db:	0f 92 c1             	setb   %cl
  a4e8de:	48 39 f0             	cmp    %rsi,%rax
  a4e8e1:	41 0f 92 c2          	setb   %r10b
  a4e8e5:	44 20 d1             	and    %r10b,%cl
  a4e8e8:	48 0f 45 ea          	cmovne %rdx,%rbp
  a4e8ec:	48 0f 45 d8          	cmovne %rax,%rbx
  a4e8f0:	44 0f 45 c9          	cmovne %ecx,%r9d
  a4e8f4:	48 0f 45 f0          	cmovne %rax,%rsi
  a4e8f8:	48 8b 00             	mov    (%rax),%rax
  a4e8fb:	48 85 c0             	test   %rax,%rax
  a4e8fe:	75 c8                	jne    a4e8c8 <process_mem_region.isra.0+0x108>
  a4e900:	45 84 c9             	test   %r9b,%r9b
  a4e903:	74 63                	je     a4e968 <process_mem_region.isra.0+0x1a8>
  a4e905:	4b 8d 04 38          	lea    (%r8,%r15,1),%rax
  a4e909:	48 39 c3             	cmp    %rax,%rbx
  a4e90c:	77 32                	ja     a4e940 <process_mem_region.isra.0+0x180>
  a4e90e:	48 8d 04 2b          	lea    (%rbx,%rbp,1),%rax
  a4e912:	48 39 f8             	cmp    %rdi,%rax
  a4e915:	73 16                	jae    a4e92d <process_mem_region.isra.0+0x16d>
  a4e917:	48 29 c7             	sub    %rax,%rdi
  a4e91a:	48 83 3d ce c8 01 00 	cmpq   $0x63,0x1c8ce(%rip)        # a6b1f0 <slot_area_index>
  a4e921:	63 
  a4e922:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  a4e927:	0f 86 f3 fe ff ff    	jbe    a4e820 <process_mem_region.isra.0+0x60>
  a4e92d:	48 83 c4 20          	add    $0x20,%rsp
  a4e931:	5b                   	pop    %rbx
  a4e932:	5d                   	pop    %rbp
  a4e933:	41 5c                	pop    %r12
  a4e935:	41 5d                	pop    %r13
  a4e937:	41 5e                	pop    %r14
  a4e939:	41 5f                	pop    %r15
  a4e93b:	c3                   	retq   
  a4e93c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4e940:	48 89 d8             	mov    %rbx,%rax
  a4e943:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  a4e948:	4c 89 fe             	mov    %r15,%rsi
  a4e94b:	4c 89 44 24 10       	mov    %r8,0x10(%rsp)
  a4e950:	4c 29 c0             	sub    %r8,%rax
  a4e953:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  a4e958:	e8 53 fd ff ff       	callq  a4e6b0 <process_gb_huge_pages>
  a4e95d:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  a4e962:	48 03 3c 24          	add    (%rsp),%rdi
  a4e966:	eb a6                	jmp    a4e90e <process_mem_region.isra.0+0x14e>
  a4e968:	48 89 e7             	mov    %rsp,%rdi
  a4e96b:	4c 89 fe             	mov    %r15,%rsi
  a4e96e:	e8 3d fd ff ff       	callq  a4e6b0 <process_gb_huge_pages>
  a4e973:	eb b8                	jmp    a4e92d <process_mem_region.isra.0+0x16d>
  a4e975:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4e97c:	00 00 00 00 

0000000000a4e980 <kaslr_get_random_long>:
  a4e980:	f3 0f 1e fa          	endbr64 
  a4e984:	48 8d 15 3d 58 00 00 	lea    0x583d(%rip),%rdx        # a541c8 <build_str+0x8>
  a4e98b:	53                   	push   %rbx
  a4e98c:	31 db                	xor    %ebx,%ebx
  a4e98e:	48 b9 34 2e 31 39 2e 	movabs $0x3735312e39312e34,%rcx
  a4e995:	31 35 37 
  a4e998:	48 8d 42 60          	lea    0x60(%rdx),%rax
  a4e99c:	eb 09                	jmp    a4e9a7 <kaslr_get_random_long+0x27>
  a4e99e:	66 90                	xchg   %ax,%ax
  a4e9a0:	48 8b 0a             	mov    (%rdx),%rcx
  a4e9a3:	48 83 c2 08          	add    $0x8,%rdx
  a4e9a7:	48 c1 cb 07          	ror    $0x7,%rbx
  a4e9ab:	48 31 cb             	xor    %rcx,%rbx
  a4e9ae:	48 39 d0             	cmp    %rdx,%rax
  a4e9b1:	75 ed                	jne    a4e9a0 <kaslr_get_random_long+0x20>
  a4e9b3:	48 8b 15 56 b7 01 00 	mov    0x1b756(%rip),%rdx        # a6a110 <boot_params>
  a4e9ba:	48 8d 82 00 10 00 00 	lea    0x1000(%rdx),%rax
  a4e9c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4e9c8:	48 c1 cb 07          	ror    $0x7,%rbx
  a4e9cc:	48 83 c2 08          	add    $0x8,%rdx
  a4e9d0:	48 33 5a f8          	xor    -0x8(%rdx),%rbx
  a4e9d4:	48 39 c2             	cmp    %rax,%rdx
  a4e9d7:	75 ef                	jne    a4e9c8 <kaslr_get_random_long+0x48>
  a4e9d9:	bf 9e 00 00 00       	mov    $0x9e,%edi
  a4e9de:	e8 0d f9 ff ff       	callq  a4e2f0 <has_cpuflag>
  a4e9e3:	84 c0                	test   %al,%al
  a4e9e5:	74 14                	je     a4e9fb <kaslr_get_random_long+0x7b>
  a4e9e7:	ba 0a 00 00 00       	mov    $0xa,%edx
  a4e9ec:	0f 1f 40 00          	nopl   0x0(%rax)
  a4e9f0:	48 0f c7 f0          	rdrand %rax
  a4e9f4:	72 6a                	jb     a4ea60 <kaslr_get_random_long+0xe0>
  a4e9f6:	83 ea 01             	sub    $0x1,%edx
  a4e9f9:	75 f5                	jne    a4e9f0 <kaslr_get_random_long+0x70>
  a4e9fb:	bf 04 00 00 00       	mov    $0x4,%edi
  a4ea00:	e8 eb f8 ff ff       	callq  a4e2f0 <has_cpuflag>
  a4ea05:	84 c0                	test   %al,%al
  a4ea07:	74 27                	je     a4ea30 <kaslr_get_random_long+0xb0>
  a4ea09:	0f 31                	rdtsc  
  a4ea0b:	48 c1 e2 20          	shl    $0x20,%rdx
  a4ea0f:	48 09 c2             	or     %rax,%rdx
  a4ea12:	48 31 d3             	xor    %rdx,%rbx
  a4ea15:	48 ba d3 8d 84 f3 cb 	movabs $0x5d6008cbf3848dd3,%rdx
  a4ea1c:	08 60 5d 
  a4ea1f:	48 89 d8             	mov    %rbx,%rax
  a4ea22:	5b                   	pop    %rbx
  a4ea23:	48 f7 e2             	mul    %rdx
  a4ea26:	48 01 d0             	add    %rdx,%rax
  a4ea29:	c3                   	retq   
  a4ea2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4ea30:	be c2 ff ff ff       	mov    $0xffffffc2,%esi
  a4ea35:	0f 1f 00             	nopl   (%rax)
  a4ea38:	89 f0                	mov    %esi,%eax
  a4ea3a:	e6 43                	out    %al,$0x43
  a4ea3c:	e4 40                	in     $0x40,%al
  a4ea3e:	89 c2                	mov    %eax,%edx
  a4ea40:	e4 40                	in     $0x40,%al
  a4ea42:	0f b6 c8             	movzbl %al,%ecx
  a4ea45:	e4 40                	in     $0x40,%al
  a4ea47:	83 e2 40             	and    $0x40,%edx
  a4ea4a:	75 ec                	jne    a4ea38 <kaslr_get_random_long+0xb8>
  a4ea4c:	c1 e0 08             	shl    $0x8,%eax
  a4ea4f:	09 c8                	or     %ecx,%eax
  a4ea51:	0f b7 c0             	movzwl %ax,%eax
  a4ea54:	48 31 c3             	xor    %rax,%rbx
  a4ea57:	eb bc                	jmp    a4ea15 <kaslr_get_random_long+0x95>
  a4ea59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4ea60:	bf 04 00 00 00       	mov    $0x4,%edi
  a4ea65:	48 31 c3             	xor    %rax,%rbx
  a4ea68:	e8 83 f8 ff ff       	callq  a4e2f0 <has_cpuflag>
  a4ea6d:	84 c0                	test   %al,%al
  a4ea6f:	75 98                	jne    a4ea09 <kaslr_get_random_long+0x89>
  a4ea71:	eb a2                	jmp    a4ea15 <kaslr_get_random_long+0x95>
  a4ea73:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4ea7a:	00 00 00 00 
  a4ea7e:	66 90                	xchg   %ax,%ax

0000000000a4ea80 <slots_fetch_random.part.0>:
  a4ea80:	48 83 ec 08          	sub    $0x8,%rsp
  a4ea84:	48 8d 3d a5 5b 00 00 	lea    0x5ba5(%rip),%rdi        # a54630 <efi_MemoryOverWriteRequest_name+0x310>
  a4ea8b:	e8 f0 fe ff ff       	callq  a4e980 <kaslr_get_random_long>
  a4ea90:	31 d2                	xor    %edx,%edx
  a4ea92:	48 f7 35 5f c7 01 00 	divq   0x1c75f(%rip)        # a6b1f8 <slot_max>
  a4ea99:	48 8b 05 50 c7 01 00 	mov    0x1c750(%rip),%rax        # a6b1f0 <slot_area_index>
  a4eaa0:	48 85 c0             	test   %rax,%rax
  a4eaa3:	74 2a                	je     a4eacf <slots_fetch_random.part.0+0x4f>
  a4eaa5:	48 8d 3d 5c c7 01 00 	lea    0x1c75c(%rip),%rdi        # a6b208 <slot_areas+0x8>
  a4eaac:	31 f6                	xor    %esi,%esi
  a4eaae:	4c 63 07             	movslq (%rdi),%r8
  a4eab1:	48 63 ce             	movslq %esi,%rcx
  a4eab4:	49 39 d0             	cmp    %rdx,%r8
  a4eab7:	76 1f                	jbe    a4ead8 <slots_fetch_random.part.0+0x58>
  a4eab9:	48 8d 05 40 c7 01 00 	lea    0x1c740(%rip),%rax        # a6b200 <slot_areas>
  a4eac0:	48 c1 e1 04          	shl    $0x4,%rcx
  a4eac4:	48 c1 e2 15          	shl    $0x15,%rdx
  a4eac8:	48 03 14 08          	add    (%rax,%rcx,1),%rdx
  a4eacc:	48 89 d0             	mov    %rdx,%rax
  a4eacf:	48 83 c4 08          	add    $0x8,%rsp
  a4ead3:	c3                   	retq   
  a4ead4:	0f 1f 40 00          	nopl   0x0(%rax)
  a4ead8:	48 83 c6 01          	add    $0x1,%rsi
  a4eadc:	4c 29 c2             	sub    %r8,%rdx
  a4eadf:	48 83 c7 10          	add    $0x10,%rdi
  a4eae3:	48 39 c6             	cmp    %rax,%rsi
  a4eae6:	75 c6                	jne    a4eaae <slots_fetch_random.part.0+0x2e>
  a4eae8:	31 c0                	xor    %eax,%eax
  a4eaea:	eb e3                	jmp    a4eacf <slots_fetch_random.part.0+0x4f>
  a4eaec:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000a4eaf0 <skip_spaces>:
  a4eaf0:	f3 0f 1e fa          	endbr64 
  a4eaf4:	0f b6 17             	movzbl (%rdi),%edx
  a4eaf7:	48 8d 0d c2 55 00 00 	lea    0x55c2(%rip),%rcx        # a540c0 <_ctype>
  a4eafe:	48 89 f8             	mov    %rdi,%rax
  a4eb01:	f6 04 11 20          	testb  $0x20,(%rcx,%rdx,1)
  a4eb05:	74 17                	je     a4eb1e <skip_spaces+0x2e>
  a4eb07:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4eb0e:	00 00 
  a4eb10:	0f b6 50 01          	movzbl 0x1(%rax),%edx
  a4eb14:	48 83 c0 01          	add    $0x1,%rax
  a4eb18:	f6 04 11 20          	testb  $0x20,(%rcx,%rdx,1)
  a4eb1c:	75 f2                	jne    a4eb10 <skip_spaces+0x20>
  a4eb1e:	c3                   	retq   
  a4eb1f:	90                   	nop

0000000000a4eb20 <get_option>:
  a4eb20:	f3 0f 1e fa          	endbr64 
  a4eb24:	41 54                	push   %r12
  a4eb26:	55                   	push   %rbp
  a4eb27:	53                   	push   %rbx
  a4eb28:	48 8b 2f             	mov    (%rdi),%rbp
  a4eb2b:	48 85 ed             	test   %rbp,%rbp
  a4eb2e:	74 06                	je     a4eb36 <get_option+0x16>
  a4eb30:	80 7d 00 00          	cmpb   $0x0,0x0(%rbp)
  a4eb34:	75 0a                	jne    a4eb40 <get_option+0x20>
  a4eb36:	31 c0                	xor    %eax,%eax
  a4eb38:	5b                   	pop    %rbx
  a4eb39:	5d                   	pop    %rbp
  a4eb3a:	41 5c                	pop    %r12
  a4eb3c:	c3                   	retq   
  a4eb3d:	0f 1f 00             	nopl   (%rax)
  a4eb40:	48 89 fb             	mov    %rdi,%rbx
  a4eb43:	49 89 f4             	mov    %rsi,%r12
  a4eb46:	31 d2                	xor    %edx,%edx
  a4eb48:	48 89 fe             	mov    %rdi,%rsi
  a4eb4b:	48 89 ef             	mov    %rbp,%rdi
  a4eb4e:	e8 bd ef ff ff       	callq  a4db10 <simple_strtol>
  a4eb53:	41 89 04 24          	mov    %eax,(%r12)
  a4eb57:	48 8b 03             	mov    (%rbx),%rax
  a4eb5a:	48 39 e8             	cmp    %rbp,%rax
  a4eb5d:	74 d7                	je     a4eb36 <get_option+0x16>
  a4eb5f:	0f b6 10             	movzbl (%rax),%edx
  a4eb62:	80 fa 2c             	cmp    $0x2c,%dl
  a4eb65:	74 19                	je     a4eb80 <get_option+0x60>
  a4eb67:	31 c0                	xor    %eax,%eax
  a4eb69:	80 fa 2d             	cmp    $0x2d,%dl
  a4eb6c:	5b                   	pop    %rbx
  a4eb6d:	5d                   	pop    %rbp
  a4eb6e:	0f 94 c0             	sete   %al
  a4eb71:	41 5c                	pop    %r12
  a4eb73:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  a4eb77:	c3                   	retq   
  a4eb78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a4eb7f:	00 
  a4eb80:	48 83 c0 01          	add    $0x1,%rax
  a4eb84:	48 89 03             	mov    %rax,(%rbx)
  a4eb87:	b8 02 00 00 00       	mov    $0x2,%eax
  a4eb8c:	eb aa                	jmp    a4eb38 <get_option+0x18>
  a4eb8e:	66 90                	xchg   %ax,%ax

0000000000a4eb90 <get_options>:
  a4eb90:	f3 0f 1e fa          	endbr64 
  a4eb94:	41 57                	push   %r15
  a4eb96:	41 56                	push   %r14
  a4eb98:	41 55                	push   %r13
  a4eb9a:	49 89 fd             	mov    %rdi,%r13
  a4eb9d:	41 54                	push   %r12
  a4eb9f:	55                   	push   %rbp
  a4eba0:	48 89 d5             	mov    %rdx,%rbp
  a4eba3:	53                   	push   %rbx
  a4eba4:	48 83 ec 18          	sub    $0x18,%rsp
  a4eba8:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  a4ebad:	83 fe 01             	cmp    $0x1,%esi
  a4ebb0:	0f 8e f9 00 00 00    	jle    a4ecaf <get_options+0x11f>
  a4ebb6:	89 f3                	mov    %esi,%ebx
  a4ebb8:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  a4ebbe:	4c 8d 64 24 08       	lea    0x8(%rsp),%r12
  a4ebc3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4ebc8:	4d 85 ed             	test   %r13,%r13
  a4ebcb:	0f 84 bf 00 00 00    	je     a4ec90 <get_options+0x100>
  a4ebd1:	41 80 7d 00 00       	cmpb   $0x0,0x0(%r13)
  a4ebd6:	0f 84 b4 00 00 00    	je     a4ec90 <get_options+0x100>
  a4ebdc:	49 63 c7             	movslq %r15d,%rax
  a4ebdf:	4c 89 ef             	mov    %r13,%rdi
  a4ebe2:	31 d2                	xor    %edx,%edx
  a4ebe4:	4c 89 e6             	mov    %r12,%rsi
  a4ebe7:	4c 8d 74 85 00       	lea    0x0(%rbp,%rax,4),%r14
  a4ebec:	e8 1f ef ff ff       	callq  a4db10 <simple_strtol>
  a4ebf1:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  a4ebf6:	41 89 06             	mov    %eax,(%r14)
  a4ebf9:	4c 39 ef             	cmp    %r13,%rdi
  a4ebfc:	0f 84 8e 00 00 00    	je     a4ec90 <get_options+0x100>
  a4ec02:	0f b6 07             	movzbl (%rdi),%eax
  a4ec05:	3c 2c                	cmp    $0x2c,%al
  a4ec07:	0f 84 93 00 00 00    	je     a4eca0 <get_options+0x110>
  a4ec0d:	3c 2d                	cmp    $0x2d,%al
  a4ec0f:	74 1f                	je     a4ec30 <get_options+0xa0>
  a4ec11:	49 89 fd             	mov    %rdi,%r13
  a4ec14:	44 89 7d 00          	mov    %r15d,0x0(%rbp)
  a4ec18:	48 83 c4 18          	add    $0x18,%rsp
  a4ec1c:	4c 89 e8             	mov    %r13,%rax
  a4ec1f:	5b                   	pop    %rbx
  a4ec20:	5d                   	pop    %rbp
  a4ec21:	41 5c                	pop    %r12
  a4ec23:	41 5d                	pop    %r13
  a4ec25:	41 5e                	pop    %r14
  a4ec27:	41 5f                	pop    %r15
  a4ec29:	c3                   	retq   
  a4ec2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4ec30:	48 83 c7 01          	add    $0x1,%rdi
  a4ec34:	31 d2                	xor    %edx,%edx
  a4ec36:	31 f6                	xor    %esi,%esi
  a4ec38:	41 89 dd             	mov    %ebx,%r13d
  a4ec3b:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  a4ec40:	45 29 fd             	sub    %r15d,%r13d
  a4ec43:	e8 c8 ee ff ff       	callq  a4db10 <simple_strtol>
  a4ec48:	48 89 c6             	mov    %rax,%rsi
  a4ec4b:	89 c1                	mov    %eax,%ecx
  a4ec4d:	41 8b 06             	mov    (%r14),%eax
  a4ec50:	89 f7                	mov    %esi,%edi
  a4ec52:	29 c7                	sub    %eax,%edi
  a4ec54:	42 8d 14 28          	lea    (%rax,%r13,1),%edx
  a4ec58:	39 c6                	cmp    %eax,%esi
  a4ec5a:	7e 16                	jle    a4ec72 <get_options+0xe2>
  a4ec5c:	0f 1f 40 00          	nopl   0x0(%rax)
  a4ec60:	41 89 06             	mov    %eax,(%r14)
  a4ec63:	83 c0 01             	add    $0x1,%eax
  a4ec66:	49 83 c6 04          	add    $0x4,%r14
  a4ec6a:	39 c2                	cmp    %eax,%edx
  a4ec6c:	74 04                	je     a4ec72 <get_options+0xe2>
  a4ec6e:	39 c1                	cmp    %eax,%ecx
  a4ec70:	7f ee                	jg     a4ec60 <get_options+0xd0>
  a4ec72:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
  a4ec77:	85 ff                	test   %edi,%edi
  a4ec79:	78 15                	js     a4ec90 <get_options+0x100>
  a4ec7b:	41 01 ff             	add    %edi,%r15d
  a4ec7e:	44 39 fb             	cmp    %r15d,%ebx
  a4ec81:	0f 8f 41 ff ff ff    	jg     a4ebc8 <get_options+0x38>
  a4ec87:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4ec8e:	00 00 
  a4ec90:	41 83 ef 01          	sub    $0x1,%r15d
  a4ec94:	e9 7b ff ff ff       	jmpq   a4ec14 <get_options+0x84>
  a4ec99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4eca0:	4c 8d 6f 01          	lea    0x1(%rdi),%r13
  a4eca4:	41 83 c7 01          	add    $0x1,%r15d
  a4eca8:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
  a4ecad:	eb cf                	jmp    a4ec7e <get_options+0xee>
  a4ecaf:	45 31 ff             	xor    %r15d,%r15d
  a4ecb2:	e9 5d ff ff ff       	jmpq   a4ec14 <get_options+0x84>
  a4ecb7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4ecbe:	00 00 

0000000000a4ecc0 <memparse>:
  a4ecc0:	f3 0f 1e fa          	endbr64 
  a4ecc4:	53                   	push   %rbx
  a4ecc5:	31 d2                	xor    %edx,%edx
  a4ecc7:	48 89 f3             	mov    %rsi,%rbx
  a4ecca:	48 83 ec 10          	sub    $0x10,%rsp
  a4ecce:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
  a4ecd3:	e8 68 ed ff ff       	callq  a4da40 <simple_strtoull>
  a4ecd8:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  a4ecdd:	0f b6 39             	movzbl (%rcx),%edi
  a4ece0:	8d 57 bb             	lea    -0x45(%rdi),%edx
  a4ece3:	80 fa 2f             	cmp    $0x2f,%dl
  a4ece6:	77 39                	ja     a4ed21 <memparse+0x61>
  a4ece8:	48 8d 35 11 53 00 00 	lea    0x5311(%rip),%rsi        # a54000 <bases.0+0x20>
  a4ecef:	0f b6 d2             	movzbl %dl,%edx
  a4ecf2:	48 63 14 96          	movslq (%rsi,%rdx,4),%rdx
  a4ecf6:	48 01 f2             	add    %rsi,%rdx
  a4ecf9:	3e ff e2             	notrack jmpq *%rdx
  a4ecfc:	0f 1f 40 00          	nopl   0x0(%rax)
  a4ed00:	48 c1 e0 0a          	shl    $0xa,%rax
  a4ed04:	48 c1 e0 0a          	shl    $0xa,%rax
  a4ed08:	48 c1 e0 0a          	shl    $0xa,%rax
  a4ed0c:	48 c1 e0 0a          	shl    $0xa,%rax
  a4ed10:	48 c1 e0 0a          	shl    $0xa,%rax
  a4ed14:	48 83 c1 01          	add    $0x1,%rcx
  a4ed18:	48 c1 e0 0a          	shl    $0xa,%rax
  a4ed1c:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  a4ed21:	48 85 db             	test   %rbx,%rbx
  a4ed24:	74 08                	je     a4ed2e <memparse+0x6e>
  a4ed26:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  a4ed2b:	48 89 13             	mov    %rdx,(%rbx)
  a4ed2e:	48 83 c4 10          	add    $0x10,%rsp
  a4ed32:	5b                   	pop    %rbx
  a4ed33:	c3                   	retq   
  a4ed34:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4ed3b:	00 00 00 00 
  a4ed3f:	90                   	nop

0000000000a4ed40 <parse_option_str>:
  a4ed40:	f3 0f 1e fa          	endbr64 
  a4ed44:	80 3f 00             	cmpb   $0x0,(%rdi)
  a4ed47:	0f 84 8f 00 00 00    	je     a4eddc <parse_option_str+0x9c>
  a4ed4d:	55                   	push   %rbp
  a4ed4e:	48 89 f5             	mov    %rsi,%rbp
  a4ed51:	53                   	push   %rbx
  a4ed52:	48 89 fb             	mov    %rdi,%rbx
  a4ed55:	48 83 ec 08          	sub    $0x8,%rsp
  a4ed59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4ed60:	48 89 ef             	mov    %rbp,%rdi
  a4ed63:	e8 c8 ed ff ff       	callq  a4db30 <strlen>
  a4ed68:	48 89 ee             	mov    %rbp,%rsi
  a4ed6b:	48 89 df             	mov    %rbx,%rdi
  a4ed6e:	48 89 c2             	mov    %rax,%rdx
  a4ed71:	e8 0a ec ff ff       	callq  a4d980 <strncmp>
  a4ed76:	85 c0                	test   %eax,%eax
  a4ed78:	74 3e                	je     a4edb8 <parse_option_str+0x78>
  a4ed7a:	0f b6 03             	movzbl (%rbx),%eax
  a4ed7d:	3c 2c                	cmp    $0x2c,%al
  a4ed7f:	74 17                	je     a4ed98 <parse_option_str+0x58>
  a4ed81:	84 c0                	test   %al,%al
  a4ed83:	74 13                	je     a4ed98 <parse_option_str+0x58>
  a4ed85:	0f 1f 00             	nopl   (%rax)
  a4ed88:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  a4ed8c:	48 83 c3 01          	add    $0x1,%rbx
  a4ed90:	84 c0                	test   %al,%al
  a4ed92:	74 04                	je     a4ed98 <parse_option_str+0x58>
  a4ed94:	3c 2c                	cmp    $0x2c,%al
  a4ed96:	75 f0                	jne    a4ed88 <parse_option_str+0x48>
  a4ed98:	3c 2c                	cmp    $0x2c,%al
  a4ed9a:	0f 94 c0             	sete   %al
  a4ed9d:	0f b6 c0             	movzbl %al,%eax
  a4eda0:	48 01 c3             	add    %rax,%rbx
  a4eda3:	80 3b 00             	cmpb   $0x0,(%rbx)
  a4eda6:	75 b8                	jne    a4ed60 <parse_option_str+0x20>
  a4eda8:	48 83 c4 08          	add    $0x8,%rsp
  a4edac:	31 c0                	xor    %eax,%eax
  a4edae:	5b                   	pop    %rbx
  a4edaf:	5d                   	pop    %rbp
  a4edb0:	c3                   	retq   
  a4edb1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4edb8:	48 89 ef             	mov    %rbp,%rdi
  a4edbb:	e8 70 ed ff ff       	callq  a4db30 <strlen>
  a4edc0:	48 01 c3             	add    %rax,%rbx
  a4edc3:	0f b6 13             	movzbl (%rbx),%edx
  a4edc6:	84 d2                	test   %dl,%dl
  a4edc8:	0f 94 c0             	sete   %al
  a4edcb:	80 fa 2c             	cmp    $0x2c,%dl
  a4edce:	0f 94 c2             	sete   %dl
  a4edd1:	08 d0                	or     %dl,%al
  a4edd3:	74 b3                	je     a4ed88 <parse_option_str+0x48>
  a4edd5:	48 83 c4 08          	add    $0x8,%rsp
  a4edd9:	5b                   	pop    %rbx
  a4edda:	5d                   	pop    %rbp
  a4eddb:	c3                   	retq   
  a4eddc:	31 c0                	xor    %eax,%eax
  a4edde:	c3                   	retq   
  a4eddf:	90                   	nop

0000000000a4ede0 <next_arg>:
  a4ede0:	f3 0f 1e fa          	endbr64 
  a4ede4:	41 55                	push   %r13
  a4ede6:	49 89 fb             	mov    %rdi,%r11
  a4ede9:	45 31 ed             	xor    %r13d,%r13d
  a4edec:	41 54                	push   %r12
  a4edee:	49 89 f4             	mov    %rsi,%r12
  a4edf1:	55                   	push   %rbp
  a4edf2:	48 89 d5             	mov    %rdx,%rbp
  a4edf5:	53                   	push   %rbx
  a4edf6:	0f b6 07             	movzbl (%rdi),%eax
  a4edf9:	3c 22                	cmp    $0x22,%al
  a4edfb:	75 0e                	jne    a4ee0b <next_arg+0x2b>
  a4edfd:	0f b6 47 01          	movzbl 0x1(%rdi),%eax
  a4ee01:	49 83 c3 01          	add    $0x1,%r11
  a4ee05:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  a4ee0b:	84 c0                	test   %al,%al
  a4ee0d:	0f 84 e4 00 00 00    	je     a4eef7 <next_arg+0x117>
  a4ee13:	4c 8d 0d a6 52 00 00 	lea    0x52a6(%rip),%r9        # a540c0 <_ctype>
  a4ee1a:	0f b6 d0             	movzbl %al,%edx
  a4ee1d:	41 f6 04 11 20       	testb  $0x20,(%r9,%rdx,1)
  a4ee22:	74 09                	je     a4ee2d <next_arg+0x4d>
  a4ee24:	45 85 ed             	test   %r13d,%r13d
  a4ee27:	0f 84 ca 00 00 00    	je     a4eef7 <next_arg+0x117>
  a4ee2d:	44 89 ea             	mov    %r13d,%edx
  a4ee30:	31 db                	xor    %ebx,%ebx
  a4ee32:	31 f6                	xor    %esi,%esi
  a4ee34:	0f 1f 40 00          	nopl   0x0(%rax)
  a4ee38:	85 db                	test   %ebx,%ebx
  a4ee3a:	75 08                	jne    a4ee44 <next_arg+0x64>
  a4ee3c:	3c 3d                	cmp    $0x3d,%al
  a4ee3e:	0f 84 ac 00 00 00    	je     a4eef0 <next_arg+0x110>
  a4ee44:	89 d1                	mov    %edx,%ecx
  a4ee46:	83 f1 01             	xor    $0x1,%ecx
  a4ee49:	3c 22                	cmp    $0x22,%al
  a4ee4b:	0f 44 d1             	cmove  %ecx,%edx
  a4ee4e:	8d 7e 01             	lea    0x1(%rsi),%edi
  a4ee51:	4d 8d 04 3b          	lea    (%r11,%rdi,1),%r8
  a4ee55:	48 89 f9             	mov    %rdi,%rcx
  a4ee58:	41 0f b6 00          	movzbl (%r8),%eax
  a4ee5c:	84 c0                	test   %al,%al
  a4ee5e:	74 18                	je     a4ee78 <next_arg+0x98>
  a4ee60:	44 0f b6 d0          	movzbl %al,%r10d
  a4ee64:	43 f6 04 11 20       	testb  $0x20,(%r9,%r10,1)
  a4ee69:	74 05                	je     a4ee70 <next_arg+0x90>
  a4ee6b:	f6 c2 01             	test   $0x1,%dl
  a4ee6e:	74 08                	je     a4ee78 <next_arg+0x98>
  a4ee70:	89 ce                	mov    %ecx,%esi
  a4ee72:	eb c4                	jmp    a4ee38 <next_arg+0x58>
  a4ee74:	0f 1f 40 00          	nopl   0x0(%rax)
  a4ee78:	4d 89 1c 24          	mov    %r11,(%r12)
  a4ee7c:	85 db                	test   %ebx,%ebx
  a4ee7e:	0f 84 84 00 00 00    	je     a4ef08 <next_arg+0x128>
  a4ee84:	49 8d 44 1b 01       	lea    0x1(%r11,%rbx,1),%rax
  a4ee89:	41 c6 04 1b 00       	movb   $0x0,(%r11,%rbx,1)
  a4ee8e:	48 89 45 00          	mov    %rax,0x0(%rbp)
  a4ee92:	80 38 22             	cmpb   $0x22,(%rax)
  a4ee95:	0f 84 85 00 00 00    	je     a4ef20 <next_arg+0x140>
  a4ee9b:	45 85 ed             	test   %r13d,%r13d
  a4ee9e:	74 0f                	je     a4eeaf <next_arg+0xcf>
  a4eea0:	8d 41 ff             	lea    -0x1(%rcx),%eax
  a4eea3:	4c 01 d8             	add    %r11,%rax
  a4eea6:	80 38 22             	cmpb   $0x22,(%rax)
  a4eea9:	0f 84 87 00 00 00    	je     a4ef36 <next_arg+0x156>
  a4eeaf:	41 80 38 00          	cmpb   $0x0,(%r8)
  a4eeb3:	74 2b                	je     a4eee0 <next_arg+0x100>
  a4eeb5:	41 c6 00 00          	movb   $0x0,(%r8)
  a4eeb9:	4d 8d 44 3b 01       	lea    0x1(%r11,%rdi,1),%r8
  a4eebe:	4c 8d 0d fb 51 00 00 	lea    0x51fb(%rip),%r9        # a540c0 <_ctype>
  a4eec5:	41 0f b6 00          	movzbl (%r8),%eax
  a4eec9:	41 f6 04 01 20       	testb  $0x20,(%r9,%rax,1)
  a4eece:	74 10                	je     a4eee0 <next_arg+0x100>
  a4eed0:	41 0f b6 40 01       	movzbl 0x1(%r8),%eax
  a4eed5:	49 83 c0 01          	add    $0x1,%r8
  a4eed9:	41 f6 04 01 20       	testb  $0x20,(%r9,%rax,1)
  a4eede:	75 f0                	jne    a4eed0 <next_arg+0xf0>
  a4eee0:	5b                   	pop    %rbx
  a4eee1:	4c 89 c0             	mov    %r8,%rax
  a4eee4:	5d                   	pop    %rbp
  a4eee5:	41 5c                	pop    %r12
  a4eee7:	41 5d                	pop    %r13
  a4eee9:	c3                   	retq   
  a4eeea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4eef0:	89 f3                	mov    %esi,%ebx
  a4eef2:	e9 57 ff ff ff       	jmpq   a4ee4e <next_arg+0x6e>
  a4eef7:	4d 89 1c 24          	mov    %r11,(%r12)
  a4eefb:	4d 89 d8             	mov    %r11,%r8
  a4eefe:	31 c9                	xor    %ecx,%ecx
  a4ef00:	31 ff                	xor    %edi,%edi
  a4ef02:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4ef08:	48 c7 45 00 00 00 00 	movq   $0x0,0x0(%rbp)
  a4ef0f:	00 
  a4ef10:	45 85 ed             	test   %r13d,%r13d
  a4ef13:	75 8b                	jne    a4eea0 <next_arg+0xc0>
  a4ef15:	eb 98                	jmp    a4eeaf <next_arg+0xcf>
  a4ef17:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4ef1e:	00 00 
  a4ef20:	48 83 c0 01          	add    $0x1,%rax
  a4ef24:	48 89 45 00          	mov    %rax,0x0(%rbp)
  a4ef28:	89 f0                	mov    %esi,%eax
  a4ef2a:	4c 01 d8             	add    %r11,%rax
  a4ef2d:	80 38 22             	cmpb   $0x22,(%rax)
  a4ef30:	0f 85 79 ff ff ff    	jne    a4eeaf <next_arg+0xcf>
  a4ef36:	c6 00 00             	movb   $0x0,(%rax)
  a4ef39:	e9 71 ff ff ff       	jmpq   a4eeaf <next_arg+0xcf>
  a4ef3e:	66 90                	xchg   %ax,%ax

0000000000a4ef40 <choose_random_location>:
  a4ef40:	f3 0f 1e fa          	endbr64 
  a4ef44:	41 57                	push   %r15
  a4ef46:	41 56                	push   %r14
  a4ef48:	41 55                	push   %r13
  a4ef4a:	41 54                	push   %r12
  a4ef4c:	55                   	push   %rbp
  a4ef4d:	48 89 fd             	mov    %rdi,%rbp
  a4ef50:	48 8d 3d e2 56 00 00 	lea    0x56e2(%rip),%rdi        # a54639 <efi_MemoryOverWriteRequest_name+0x319>
  a4ef57:	53                   	push   %rbx
  a4ef58:	48 83 ec 68          	sub    $0x68,%rsp
  a4ef5c:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
  a4ef61:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
  a4ef66:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
  a4ef6b:	e8 80 f1 ff ff       	callq  a4e0f0 <cmdline_find_option_bool>
  a4ef70:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  a4ef74:	85 c0                	test   %eax,%eax
  a4ef76:	0f 85 44 07 00 00    	jne    a4f6c0 <choose_random_location+0x780>
  a4ef7c:	0f 20 e0             	mov    %cr4,%rax
  a4ef7f:	f6 c4 10             	test   $0x10,%ah
  a4ef82:	0f 85 80 05 00 00    	jne    a4f508 <choose_random_location+0x5c8>
  a4ef88:	48 8b 05 81 b1 01 00 	mov    0x1b181(%rip),%rax        # a6a110 <boot_params>
  a4ef8f:	80 88 11 02 00 00 02 	orb    $0x2,0x211(%rax)
  a4ef96:	e8 25 0c 00 00       	callq  a4fbc0 <initialize_identity_maps>
  a4ef9b:	48 8b 15 6e b1 01 00 	mov    0x1b16e(%rip),%rdx        # a6a110 <boot_params>
  a4efa2:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  a4efa7:	48 89 ef             	mov    %rbp,%rdi
  a4efaa:	8b b2 60 02 00 00    	mov    0x260(%rdx),%esi
  a4efb0:	48 8b 00             	mov    (%rax),%rax
  a4efb3:	48 89 2d a6 c8 01 00 	mov    %rbp,0x1c8a6(%rip)        # a6b860 <mem_avoid>
  a4efba:	48 29 ee             	sub    %rbp,%rsi
  a4efbd:	48 01 c6             	add    %rax,%rsi
  a4efc0:	48 89 35 a1 c8 01 00 	mov    %rsi,0x1c8a1(%rip)        # a6b868 <mem_avoid+0x8>
  a4efc7:	e8 34 0d 00 00       	callq  a4fd00 <add_identity_map>
  a4efcc:	48 8b 05 3d b1 01 00 	mov    0x1b13d(%rip),%rax        # a6a110 <boot_params>
  a4efd3:	8b 88 c0 00 00 00    	mov    0xc0(%rax),%ecx
  a4efd9:	8b 90 c4 00 00 00    	mov    0xc4(%rax),%edx
  a4efdf:	8b b8 c8 00 00 00    	mov    0xc8(%rax),%edi
  a4efe5:	48 c1 e1 20          	shl    $0x20,%rcx
  a4efe9:	48 c1 e2 20          	shl    $0x20,%rdx
  a4efed:	48 89 ce             	mov    %rcx,%rsi
  a4eff0:	48 89 d1             	mov    %rdx,%rcx
  a4eff3:	8b 90 1c 02 00 00    	mov    0x21c(%rax),%edx
  a4eff9:	48 09 ca             	or     %rcx,%rdx
  a4effc:	8b 88 18 02 00 00    	mov    0x218(%rax),%ecx
  a4f002:	48 89 15 6f c8 01 00 	mov    %rdx,0x1c86f(%rip)        # a6b878 <mem_avoid+0x18>
  a4f009:	48 89 fa             	mov    %rdi,%rdx
  a4f00c:	8b b8 28 02 00 00    	mov    0x228(%rax),%edi
  a4f012:	48 09 f1             	or     %rsi,%rcx
  a4f015:	48 c1 e2 20          	shl    $0x20,%rdx
  a4f019:	31 f6                	xor    %esi,%esi
  a4f01b:	48 89 0d 4e c8 01 00 	mov    %rcx,0x1c84e(%rip)        # a6b870 <mem_avoid+0x10>
  a4f022:	48 09 d7             	or     %rdx,%rdi
  a4f025:	0f 1f 00             	nopl   (%rax)
  a4f028:	48 89 f0             	mov    %rsi,%rax
  a4f02b:	48 83 c6 01          	add    $0x1,%rsi
  a4f02f:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  a4f033:	75 f3                	jne    a4f028 <choose_random_location+0xe8>
  a4f035:	48 89 3d 44 c8 01 00 	mov    %rdi,0x1c844(%rip)        # a6b880 <mem_avoid+0x20>
  a4f03c:	48 89 35 45 c8 01 00 	mov    %rsi,0x1c845(%rip)        # a6b888 <mem_avoid+0x28>
  a4f043:	e8 b8 0c 00 00       	callq  a4fd00 <add_identity_map>
  a4f048:	48 8b 3d c1 b0 01 00 	mov    0x1b0c1(%rip),%rdi        # a6a110 <boot_params>
  a4f04f:	be 00 10 00 00       	mov    $0x1000,%esi
  a4f054:	48 c7 05 39 c8 01 00 	movq   $0x1000,0x1c839(%rip)        # a6b898 <mem_avoid+0x38>
  a4f05b:	00 10 00 00 
  a4f05f:	48 89 3d 2a c8 01 00 	mov    %rdi,0x1c82a(%rip)        # a6b890 <mem_avoid+0x30>
  a4f066:	e8 95 0c 00 00       	callq  a4fd00 <add_identity_map>
  a4f06b:	e8 30 f0 ff ff       	callq  a4e0a0 <get_cmd_line_ptr>
  a4f070:	49 89 c6             	mov    %rax,%r14
  a4f073:	48 89 c7             	mov    %rax,%rdi
  a4f076:	e8 b5 ea ff ff       	callq  a4db30 <strlen>
  a4f07b:	48 8d 35 bf 55 00 00 	lea    0x55bf(%rip),%rsi        # a54641 <efi_MemoryOverWriteRequest_name+0x321>
  a4f082:	4c 89 f7             	mov    %r14,%rdi
  a4f085:	48 89 c3             	mov    %rax,%rbx
  a4f088:	e8 d3 ea ff ff       	callq  a4db60 <strstr>
  a4f08d:	48 85 c0             	test   %rax,%rax
  a4f090:	0f 84 f4 05 00 00    	je     a4f68a <choose_random_location+0x74a>
  a4f096:	89 da                	mov    %ebx,%edx
  a4f098:	83 c2 01             	add    $0x1,%edx
  a4f09b:	0f 88 cc 05 00 00    	js     a4f66d <choose_random_location+0x72d>
  a4f0a1:	48 8b 05 40 c8 01 00 	mov    0x1c840(%rip),%rax        # a6b8e8 <malloc_ptr>
  a4f0a8:	48 85 c0             	test   %rax,%rax
  a4f0ab:	48 0f 44 05 55 b0 01 	cmove  0x1b055(%rip),%rax        # a6a108 <free_mem_ptr>
  a4f0b2:	00 
  a4f0b3:	48 8d 48 03          	lea    0x3(%rax),%rcx
  a4f0b7:	48 63 c2             	movslq %edx,%rax
  a4f0ba:	48 8b 15 3f b0 01 00 	mov    0x1b03f(%rip),%rdx        # a6a100 <free_mem_end_ptr>
  a4f0c1:	48 83 e1 fc          	and    $0xfffffffffffffffc,%rcx
  a4f0c5:	48 01 c8             	add    %rcx,%rax
  a4f0c8:	48 89 cd             	mov    %rcx,%rbp
  a4f0cb:	48 89 05 16 c8 01 00 	mov    %rax,0x1c816(%rip)        # a6b8e8 <malloc_ptr>
  a4f0d2:	48 85 d2             	test   %rdx,%rdx
  a4f0d5:	0f 85 89 05 00 00    	jne    a4f664 <choose_random_location+0x724>
  a4f0db:	44 8b 2d 02 c8 01 00 	mov    0x1c802(%rip),%r13d        # a6b8e4 <malloc_count>
  a4f0e2:	41 8d 45 01          	lea    0x1(%r13),%eax
  a4f0e6:	89 05 f8 c7 01 00    	mov    %eax,0x1c7f8(%rip)        # a6b8e4 <malloc_count>
  a4f0ec:	48 85 c9             	test   %rcx,%rcx
  a4f0ef:	0f 84 78 05 00 00    	je     a4f66d <choose_random_location+0x72d>
  a4f0f5:	48 89 da             	mov    %rbx,%rdx
  a4f0f8:	48 89 cf             	mov    %rcx,%rdi
  a4f0fb:	4c 89 f6             	mov    %r14,%rsi
  a4f0fe:	e8 bd eb ff ff       	callq  a4dcc0 <memcpy>
  a4f103:	48 8d 0d b6 4f 00 00 	lea    0x4fb6(%rip),%rcx        # a540c0 <_ctype>
  a4f10a:	c6 04 18 00          	movb   $0x0,(%rax,%rbx,1)
  a4f10e:	0f b6 10             	movzbl (%rax),%edx
  a4f111:	48 89 d0             	mov    %rdx,%rax
  a4f114:	f6 04 11 20          	testb  $0x20,(%rcx,%rdx,1)
  a4f118:	74 17                	je     a4f131 <choose_random_location+0x1f1>
  a4f11a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4f120:	0f b6 55 01          	movzbl 0x1(%rbp),%edx
  a4f124:	48 83 c5 01          	add    $0x1,%rbp
  a4f128:	48 89 d0             	mov    %rdx,%rax
  a4f12b:	f6 04 11 20          	testb  $0x20,(%rcx,%rdx,1)
  a4f12f:	75 ef                	jne    a4f120 <choose_random_location+0x1e0>
  a4f131:	84 c0                	test   %al,%al
  a4f133:	0f 84 4b 01 00 00    	je     a4f284 <choose_random_location+0x344>
  a4f139:	48 8d 44 24 50       	lea    0x50(%rsp),%rax
  a4f13e:	4c 8d 2d 1b c7 01 00 	lea    0x1c71b(%rip),%r13        # a6b860 <mem_avoid>
  a4f145:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  a4f14a:	48 8d 44 24 48       	lea    0x48(%rsp),%rax
  a4f14f:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  a4f154:	0f 1f 40 00          	nopl   0x0(%rax)
  a4f158:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  a4f15d:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  a4f162:	48 89 ef             	mov    %rbp,%rdi
  a4f165:	e8 76 fc ff ff       	callq  a4ede0 <next_arg>
  a4f16a:	48 83 7c 24 50 00    	cmpq   $0x0,0x50(%rsp)
  a4f170:	48 89 c5             	mov    %rax,%rbp
  a4f173:	0f 84 4f 02 00 00    	je     a4f3c8 <choose_random_location+0x488>
  a4f179:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  a4f17e:	48 8d 35 d6 54 00 00 	lea    0x54d6(%rip),%rsi        # a5465b <efi_MemoryOverWriteRequest_name+0x33b>
  a4f185:	e8 c6 e7 ff ff       	callq  a4d950 <strcmp>
  a4f18a:	85 c0                	test   %eax,%eax
  a4f18c:	0f 85 be 01 00 00    	jne    a4f350 <choose_random_location+0x410>
  a4f192:	83 3d 4f c0 01 00 03 	cmpl   $0x3,0x1c04f(%rip)        # a6b1e8 <i.1>
  a4f199:	0f 8f d1 00 00 00    	jg     a4f270 <choose_random_location+0x330>
  a4f19f:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
  a4f1a4:	4d 85 e4             	test   %r12,%r12
  a4f1a7:	75 40                	jne    a4f1e9 <choose_random_location+0x2a9>
  a4f1a9:	e9 c2 00 00 00       	jmpq   a4f270 <choose_random_location+0x330>
  a4f1ae:	66 90                	xchg   %ax,%ax
  a4f1b0:	3c 22                	cmp    $0x22,%al
  a4f1b2:	0f 8f 58 01 00 00    	jg     a4f310 <choose_random_location+0x3d0>
  a4f1b8:	3c 21                	cmp    $0x21,%al
  a4f1ba:	0f 84 50 01 00 00    	je     a4f310 <choose_random_location+0x3d0>
  a4f1c0:	4d 85 e4             	test   %r12,%r12
  a4f1c3:	74 0b                	je     a4f1d0 <choose_random_location+0x290>
  a4f1c5:	4c 89 25 44 6d 00 00 	mov    %r12,0x6d44(%rip)        # a55f10 <mem_limit>
  a4f1cc:	0f 1f 40 00          	nopl   0x0(%rax)
  a4f1d0:	48 85 db             	test   %rbx,%rbx
  a4f1d3:	0f 84 97 00 00 00    	je     a4f270 <choose_random_location+0x330>
  a4f1d9:	83 3d 08 c0 01 00 03 	cmpl   $0x3,0x1c008(%rip)        # a6b1e8 <i.1>
  a4f1e0:	0f 8f e2 02 00 00    	jg     a4f4c8 <choose_random_location+0x588>
  a4f1e6:	49 89 dc             	mov    %rbx,%r12
  a4f1e9:	be 2c 00 00 00       	mov    $0x2c,%esi
  a4f1ee:	4c 89 e7             	mov    %r12,%rdi
  a4f1f1:	31 db                	xor    %ebx,%ebx
  a4f1f3:	e8 08 ea ff ff       	callq  a4dc00 <strchr>
  a4f1f8:	48 85 c0             	test   %rax,%rax
  a4f1fb:	74 07                	je     a4f204 <choose_random_location+0x2c4>
  a4f1fd:	c6 00 00             	movb   $0x0,(%rax)
  a4f200:	48 8d 58 01          	lea    0x1(%rax),%rbx
  a4f204:	ba 08 00 00 00       	mov    $0x8,%edx
  a4f209:	48 8d 35 52 54 00 00 	lea    0x5452(%rip),%rsi        # a54662 <efi_MemoryOverWriteRequest_name+0x342>
  a4f210:	4c 89 e7             	mov    %r12,%rdi
  a4f213:	4c 89 64 24 58       	mov    %r12,0x58(%rsp)
  a4f218:	e8 63 e7 ff ff       	callq  a4d980 <strncmp>
  a4f21d:	85 c0                	test   %eax,%eax
  a4f21f:	0f 84 93 02 00 00    	je     a4f4b8 <choose_random_location+0x578>
  a4f225:	4c 8b 7c 24 58       	mov    0x58(%rsp),%r15
  a4f22a:	4c 8d 74 24 58       	lea    0x58(%rsp),%r14
  a4f22f:	4c 89 f6             	mov    %r14,%rsi
  a4f232:	4c 89 ff             	mov    %r15,%rdi
  a4f235:	e8 86 fa ff ff       	callq  a4ecc0 <memparse>
  a4f23a:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
  a4f23f:	49 89 c4             	mov    %rax,%r12
  a4f242:	49 39 ff             	cmp    %rdi,%r15
  a4f245:	0f 84 6d 02 00 00    	je     a4f4b8 <choose_random_location+0x578>
  a4f24b:	0f b6 07             	movzbl (%rdi),%eax
  a4f24e:	3c 24                	cmp    $0x24,%al
  a4f250:	0f 8e 5a ff ff ff    	jle    a4f1b0 <choose_random_location+0x270>
  a4f256:	3c 40                	cmp    $0x40,%al
  a4f258:	0f 85 62 ff ff ff    	jne    a4f1c0 <choose_random_location+0x280>
  a4f25e:	48 85 db             	test   %rbx,%rbx
  a4f261:	0f 85 72 ff ff ff    	jne    a4f1d9 <choose_random_location+0x299>
  a4f267:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4f26e:	00 00 
  a4f270:	80 7d 00 00          	cmpb   $0x0,0x0(%rbp)
  a4f274:	0f 85 de fe ff ff    	jne    a4f158 <choose_random_location+0x218>
  a4f27a:	8b 05 64 c6 01 00    	mov    0x1c664(%rip),%eax        # a6b8e4 <malloc_count>
  a4f280:	44 8d 68 ff          	lea    -0x1(%rax),%r13d
  a4f284:	44 89 2d 59 c6 01 00 	mov    %r13d,0x1c659(%rip)        # a6b8e4 <malloc_count>
  a4f28b:	45 85 ed             	test   %r13d,%r13d
  a4f28e:	75 0e                	jne    a4f29e <choose_random_location+0x35e>
  a4f290:	48 8b 05 71 ae 01 00 	mov    0x1ae71(%rip),%rax        # a6a108 <free_mem_ptr>
  a4f297:	48 89 05 4a c6 01 00 	mov    %rax,0x1c64a(%rip)        # a6b8e8 <malloc_ptr>
  a4f29e:	0f b6 2d 3b c6 01 00 	movzbl 0x1c63b(%rip),%ebp        # a6b8e0 <memmap_too_large>
  a4f2a5:	40 84 ed             	test   %bpl,%bpl
  a4f2a8:	0f 84 7d 02 00 00    	je     a4f52b <choose_random_location+0x5eb>
  a4f2ae:	48 8d 3d 8b 54 00 00 	lea    0x548b(%rip),%rdi        # a54740 <efi_MemoryOverWriteRequest_name+0x420>
  a4f2b5:	e8 66 ee ff ff       	callq  a4e120 <warn>
  a4f2ba:	48 8d 3d cd 53 00 00 	lea    0x53cd(%rip),%rdi        # a5468e <efi_MemoryOverWriteRequest_name+0x36e>
  a4f2c1:	e8 ba f6 ff ff       	callq  a4e980 <kaslr_get_random_long>
  a4f2c6:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  a4f2cb:	b9 00 00 00 3f       	mov    $0x3f000000,%ecx
  a4f2d0:	48 81 c2 ff ff 1f 00 	add    $0x1fffff,%rdx
  a4f2d7:	48 81 e2 00 00 e0 ff 	and    $0xffffffffffe00000,%rdx
  a4f2de:	48 29 d1             	sub    %rdx,%rcx
  a4f2e1:	31 d2                	xor    %edx,%edx
  a4f2e3:	48 c1 e9 15          	shr    $0x15,%rcx
  a4f2e7:	48 83 c1 01          	add    $0x1,%rcx
  a4f2eb:	48 f7 f1             	div    %rcx
  a4f2ee:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  a4f2f3:	48 c1 e2 15          	shl    $0x15,%rdx
  a4f2f7:	48 81 c2 00 00 00 01 	add    $0x1000000,%rdx
  a4f2fe:	48 89 10             	mov    %rdx,(%rax)
  a4f301:	48 83 c4 68          	add    $0x68,%rsp
  a4f305:	5b                   	pop    %rbx
  a4f306:	5d                   	pop    %rbp
  a4f307:	41 5c                	pop    %r12
  a4f309:	41 5d                	pop    %r13
  a4f30b:	41 5e                	pop    %r14
  a4f30d:	41 5f                	pop    %r15
  a4f30f:	c3                   	retq   
  a4f310:	4c 89 f6             	mov    %r14,%rsi
  a4f313:	48 83 c7 01          	add    $0x1,%rdi
  a4f317:	e8 a4 f9 ff ff       	callq  a4ecc0 <memparse>
  a4f31c:	48 89 c6             	mov    %rax,%rsi
  a4f31f:	48 85 c0             	test   %rax,%rax
  a4f322:	0f 84 98 fe ff ff    	je     a4f1c0 <choose_random_location+0x280>
  a4f328:	8b 0d ba be 01 00    	mov    0x1beba(%rip),%ecx        # a6b1e8 <i.1>
  a4f32e:	8d 41 04             	lea    0x4(%rcx),%eax
  a4f331:	83 c1 01             	add    $0x1,%ecx
  a4f334:	48 98                	cltq   
  a4f336:	89 0d ac be 01 00    	mov    %ecx,0x1beac(%rip)        # a6b1e8 <i.1>
  a4f33c:	48 c1 e0 04          	shl    $0x4,%rax
  a4f340:	4c 01 e8             	add    %r13,%rax
  a4f343:	48 89 30             	mov    %rsi,(%rax)
  a4f346:	4c 89 60 08          	mov    %r12,0x8(%rax)
  a4f34a:	e9 81 fe ff ff       	jmpq   a4f1d0 <choose_random_location+0x290>
  a4f34f:	90                   	nop
  a4f350:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  a4f355:	48 8d 35 f2 52 00 00 	lea    0x52f2(%rip),%rsi        # a5464e <efi_MemoryOverWriteRequest_name+0x32e>
  a4f35c:	e8 ff e7 ff ff       	callq  a4db60 <strstr>
  a4f361:	48 85 c0             	test   %rax,%rax
  a4f364:	0f 84 e6 00 00 00    	je     a4f450 <choose_random_location+0x510>
  a4f36a:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  a4f36f:	48 8d 35 f5 52 00 00 	lea    0x52f5(%rip),%rsi        # a5466b <efi_MemoryOverWriteRequest_name+0x34b>
  a4f376:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
  a4f37b:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
  a4f380:	e8 cb e5 ff ff       	callq  a4d950 <strcmp>
  a4f385:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a4f38a:	85 c0                	test   %eax,%eax
  a4f38c:	75 72                	jne    a4f400 <choose_random_location+0x4c0>
  a4f38e:	48 8d 74 24 58       	lea    0x58(%rsp),%rsi
  a4f393:	48 89 df             	mov    %rbx,%rdi
  a4f396:	48 89 5c 24 58       	mov    %rbx,0x58(%rsp)
  a4f39b:	e8 20 f9 ff ff       	callq  a4ecc0 <memparse>
  a4f3a0:	48 3d 00 00 00 40    	cmp    $0x40000000,%rax
  a4f3a6:	0f 84 34 01 00 00    	je     a4f4e0 <choose_random_location+0x5a0>
  a4f3ac:	80 7d 00 00          	cmpb   $0x0,0x0(%rbp)
  a4f3b0:	c6 05 2d be 01 00 00 	movb   $0x0,0x1be2d(%rip)        # a6b1e4 <gbpage_sz.0>
  a4f3b7:	0f 85 9b fd ff ff    	jne    a4f158 <choose_random_location+0x218>
  a4f3bd:	e9 b8 fe ff ff       	jmpq   a4f27a <choose_random_location+0x33a>
  a4f3c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4f3c8:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  a4f3cd:	48 8d 35 84 52 00 00 	lea    0x5284(%rip),%rsi        # a54658 <efi_MemoryOverWriteRequest_name+0x338>
  a4f3d4:	e8 77 e5 ff ff       	callq  a4d950 <strcmp>
  a4f3d9:	85 c0                	test   %eax,%eax
  a4f3db:	0f 85 98 fd ff ff    	jne    a4f179 <choose_random_location+0x239>
  a4f3e1:	48 8d 3d 08 53 00 00 	lea    0x5308(%rip),%rdi        # a546f0 <efi_MemoryOverWriteRequest_name+0x3d0>
  a4f3e8:	e8 33 ed ff ff       	callq  a4e120 <warn>
  a4f3ed:	83 2d f0 c4 01 00 01 	subl   $0x1,0x1c4f0(%rip)        # a6b8e4 <malloc_count>
  a4f3f4:	0f 85 a4 fe ff ff    	jne    a4f29e <choose_random_location+0x35e>
  a4f3fa:	e9 91 fe ff ff       	jmpq   a4f290 <choose_random_location+0x350>
  a4f3ff:	90                   	nop
  a4f400:	48 8d 35 47 52 00 00 	lea    0x5247(%rip),%rsi        # a5464e <efi_MemoryOverWriteRequest_name+0x32e>
  a4f407:	e8 44 e5 ff ff       	callq  a4d950 <strcmp>
  a4f40c:	85 c0                	test   %eax,%eax
  a4f40e:	0f 85 5c fe ff ff    	jne    a4f270 <choose_random_location+0x330>
  a4f414:	80 3d c9 bd 01 00 00 	cmpb   $0x0,0x1bdc9(%rip)        # a6b1e4 <gbpage_sz.0>
  a4f41b:	0f 84 4f fe ff ff    	je     a4f270 <choose_random_location+0x330>
  a4f421:	31 d2                	xor    %edx,%edx
  a4f423:	48 8d 74 24 58       	lea    0x58(%rsp),%rsi
  a4f428:	48 89 df             	mov    %rbx,%rdi
  a4f42b:	48 89 5c 24 58       	mov    %rbx,0x58(%rsp)
  a4f430:	e8 0b e6 ff ff       	callq  a4da40 <simple_strtoull>
  a4f435:	80 7d 00 00          	cmpb   $0x0,0x0(%rbp)
  a4f439:	48 89 05 00 c4 01 00 	mov    %rax,0x1c400(%rip)        # a6b840 <max_gb_huge_pages>
  a4f440:	0f 85 12 fd ff ff    	jne    a4f158 <choose_random_location+0x218>
  a4f446:	e9 2f fe ff ff       	jmpq   a4f27a <choose_random_location+0x33a>
  a4f44b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4f450:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  a4f455:	48 8d 35 1a 52 00 00 	lea    0x521a(%rip),%rsi        # a54676 <efi_MemoryOverWriteRequest_name+0x356>
  a4f45c:	e8 ef e4 ff ff       	callq  a4d950 <strcmp>
  a4f461:	85 c0                	test   %eax,%eax
  a4f463:	0f 85 07 fe ff ff    	jne    a4f270 <choose_random_location+0x330>
  a4f469:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
  a4f46e:	48 8d 35 05 52 00 00 	lea    0x5205(%rip),%rsi        # a5467a <efi_MemoryOverWriteRequest_name+0x35a>
  a4f475:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
  a4f47a:	e8 d1 e4 ff ff       	callq  a4d950 <strcmp>
  a4f47f:	85 c0                	test   %eax,%eax
  a4f481:	0f 84 e9 fd ff ff    	je     a4f270 <choose_random_location+0x330>
  a4f487:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
  a4f48c:	48 8d 74 24 58       	lea    0x58(%rsp),%rsi
  a4f491:	e8 2a f8 ff ff       	callq  a4ecc0 <memparse>
  a4f496:	48 85 c0             	test   %rax,%rax
  a4f499:	0f 84 d1 02 00 00    	je     a4f770 <choose_random_location+0x830>
  a4f49f:	80 7d 00 00          	cmpb   $0x0,0x0(%rbp)
  a4f4a3:	48 89 05 66 6a 00 00 	mov    %rax,0x6a66(%rip)        # a55f10 <mem_limit>
  a4f4aa:	0f 85 a8 fc ff ff    	jne    a4f158 <choose_random_location+0x218>
  a4f4b0:	e9 c5 fd ff ff       	jmpq   a4f27a <choose_random_location+0x33a>
  a4f4b5:	0f 1f 00             	nopl   (%rax)
  a4f4b8:	83 3d 29 bd 01 00 03 	cmpl   $0x3,0x1bd29(%rip)        # a6b1e8 <i.1>
  a4f4bf:	0f 8e ab fd ff ff    	jle    a4f270 <choose_random_location+0x330>
  a4f4c5:	0f 1f 00             	nopl   (%rax)
  a4f4c8:	80 7d 00 00          	cmpb   $0x0,0x0(%rbp)
  a4f4cc:	c6 05 0d c4 01 00 01 	movb   $0x1,0x1c40d(%rip)        # a6b8e0 <memmap_too_large>
  a4f4d3:	0f 85 7f fc ff ff    	jne    a4f158 <choose_random_location+0x218>
  a4f4d9:	e9 9c fd ff ff       	jmpq   a4f27a <choose_random_location+0x33a>
  a4f4de:	66 90                	xchg   %ax,%ax
  a4f4e0:	80 3d fd bc 01 00 00 	cmpb   $0x0,0x1bcfd(%rip)        # a6b1e4 <gbpage_sz.0>
  a4f4e7:	0f 85 8c 01 00 00    	jne    a4f679 <choose_random_location+0x739>
  a4f4ed:	80 7d 00 00          	cmpb   $0x0,0x0(%rbp)
  a4f4f1:	c6 05 ec bc 01 00 01 	movb   $0x1,0x1bcec(%rip)        # a6b1e4 <gbpage_sz.0>
  a4f4f8:	0f 85 5a fc ff ff    	jne    a4f158 <choose_random_location+0x218>
  a4f4fe:	e9 77 fd ff ff       	jmpq   a4f27a <choose_random_location+0x33a>
  a4f503:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4f508:	c7 05 ce bc 01 00 01 	movl   $0x1,0x1bcce(%rip)        # a6b1e0 <__pgtable_l5_enabled>
  a4f50f:	00 00 00 
  a4f512:	c7 05 88 6a 00 00 30 	movl   $0x30,0x6a88(%rip)        # a55fa4 <pgdir_shift>
  a4f519:	00 00 00 
  a4f51c:	c7 05 7a 6a 00 00 00 	movl   $0x200,0x6a7a(%rip)        # a55fa0 <ptrs_per_p4d>
  a4f523:	02 00 00 
  a4f526:	e9 5d fa ff ff       	jmpq   a4ef88 <choose_random_location+0x48>
  a4f52b:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  a4f530:	bb 00 00 00 20       	mov    $0x20000000,%ebx
  a4f535:	4c 8b 35 d4 ab 01 00 	mov    0x1abd4(%rip),%r14        # a6a110 <boot_params>
  a4f53c:	ba 04 00 00 00       	mov    $0x4,%edx
  a4f541:	48 8d 35 3c 51 00 00 	lea    0x513c(%rip),%rsi        # a54684 <efi_MemoryOverWriteRequest_name+0x364>
  a4f548:	48 81 38 00 00 00 20 	cmpq   $0x20000000,(%rax)
  a4f54f:	48 0f 46 18          	cmovbe (%rax),%rbx
  a4f553:	4d 8d ae c0 01 00 00 	lea    0x1c0(%r14),%r13
  a4f55a:	4c 89 ef             	mov    %r13,%rdi
  a4f55d:	48 81 c3 ff ff 1f 00 	add    $0x1fffff,%rbx
  a4f564:	48 81 e3 00 00 e0 ff 	and    $0xffffffffffe00000,%rbx
  a4f56b:	e8 10 e4 ff ff       	callq  a4d980 <strncmp>
  a4f570:	85 c0                	test   %eax,%eax
  a4f572:	0f 85 62 01 00 00    	jne    a4f6da <choose_random_location+0x79a>
  a4f578:	45 8b ae dc 01 00 00 	mov    0x1dc(%r14),%r13d
  a4f57f:	41 8b 86 d0 01 00 00 	mov    0x1d0(%r14),%eax
  a4f586:	31 d2                	xor    %edx,%edx
  a4f588:	41 8b b6 d4 01 00 00 	mov    0x1d4(%r14),%esi
  a4f58f:	41 8b 8e c8 01 00 00 	mov    0x1c8(%r14),%ecx
  a4f596:	49 c1 e5 20          	shl    $0x20,%r13
  a4f59a:	49 09 c5             	or     %rax,%r13
  a4f59d:	89 f0                	mov    %esi,%eax
  a4f59f:	f7 f1                	div    %ecx
  a4f5a1:	41 89 c7             	mov    %eax,%r15d
  a4f5a4:	39 ce                	cmp    %ecx,%esi
  a4f5a6:	72 79                	jb     a4f621 <choose_random_location+0x6e1>
  a4f5a8:	31 d2                	xor    %edx,%edx
  a4f5aa:	31 c0                	xor    %eax,%eax
  a4f5ac:	eb 0c                	jmp    a4f5ba <choose_random_location+0x67a>
  a4f5ae:	66 90                	xchg   %ax,%ax
  a4f5b0:	83 c2 01             	add    $0x1,%edx
  a4f5b3:	01 c8                	add    %ecx,%eax
  a4f5b5:	44 39 fa             	cmp    %r15d,%edx
  a4f5b8:	73 1d                	jae    a4f5d7 <choose_random_location+0x697>
  a4f5ba:	89 c6                	mov    %eax,%esi
  a4f5bc:	41 f6 44 35 22 01    	testb  $0x1,0x22(%r13,%rsi,1)
  a4f5c2:	74 ec                	je     a4f5b0 <choose_random_location+0x670>
  a4f5c4:	bd 01 00 00 00       	mov    $0x1,%ebp
  a4f5c9:	eb 0c                	jmp    a4f5d7 <choose_random_location+0x697>
  a4f5cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4f5d0:	41 8b 8e c8 01 00 00 	mov    0x1c8(%r14),%ecx
  a4f5d7:	0f af 4c 24 0c       	imul   0xc(%rsp),%ecx
  a4f5dc:	4a 8d 14 29          	lea    (%rcx,%r13,1),%rdx
  a4f5e0:	83 3a 07             	cmpl   $0x7,(%rdx)
  a4f5e3:	75 2e                	jne    a4f613 <choose_random_location+0x6d3>
  a4f5e5:	40 84 ed             	test   %bpl,%bpl
  a4f5e8:	74 06                	je     a4f5f0 <choose_random_location+0x6b0>
  a4f5ea:	f6 42 22 01          	testb  $0x1,0x22(%rdx)
  a4f5ee:	74 23                	je     a4f613 <choose_random_location+0x6d3>
  a4f5f0:	48 8b 72 18          	mov    0x18(%rdx),%rsi
  a4f5f4:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
  a4f5f8:	48 89 da             	mov    %rbx,%rdx
  a4f5fb:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  a4f600:	48 c1 e6 0c          	shl    $0xc,%rsi
  a4f604:	e8 b7 f1 ff ff       	callq  a4e7c0 <process_mem_region.isra.0>
  a4f609:	48 83 3d df bb 01 00 	cmpq   $0x64,0x1bbdf(%rip)        # a6b1f0 <slot_area_index>
  a4f610:	64 
  a4f611:	74 0e                	je     a4f621 <choose_random_location+0x6e1>
  a4f613:	83 44 24 0c 01       	addl   $0x1,0xc(%rsp)
  a4f618:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  a4f61c:	41 39 c7             	cmp    %eax,%r15d
  a4f61f:	77 af                	ja     a4f5d0 <choose_random_location+0x690>
  a4f621:	48 83 3d cf bb 01 00 	cmpq   $0x0,0x1bbcf(%rip)        # a6b1f8 <slot_max>
  a4f628:	00 
  a4f629:	0f 84 7f fc ff ff    	je     a4f2ae <choose_random_location+0x36e>
  a4f62f:	e8 4c f4 ff ff       	callq  a4ea80 <slots_fetch_random.part.0>
  a4f634:	48 89 c3             	mov    %rax,%rbx
  a4f637:	48 85 c0             	test   %rax,%rax
  a4f63a:	0f 84 6e fc ff ff    	je     a4f2ae <choose_random_location+0x36e>
  a4f640:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
  a4f645:	49 39 06             	cmp    %rax,(%r14)
  a4f648:	74 10                	je     a4f65a <choose_random_location+0x71a>
  a4f64a:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  a4f64f:	48 89 c7             	mov    %rax,%rdi
  a4f652:	e8 a9 06 00 00       	callq  a4fd00 <add_identity_map>
  a4f657:	49 89 1e             	mov    %rbx,(%r14)
  a4f65a:	e8 e1 06 00 00       	callq  a4fd40 <finalize_identity_maps>
  a4f65f:	e9 56 fc ff ff       	jmpq   a4f2ba <choose_random_location+0x37a>
  a4f664:	48 39 d0             	cmp    %rdx,%rax
  a4f667:	0f 82 6e fa ff ff    	jb     a4f0db <choose_random_location+0x19b>
  a4f66d:	48 8d 3d 4c 50 00 00 	lea    0x504c(%rip),%rdi        # a546c0 <efi_MemoryOverWriteRequest_name+0x3a0>
  a4f674:	e8 d7 ea ff ff       	callq  a4e150 <error>
  a4f679:	48 8d 3d 90 50 00 00 	lea    0x5090(%rip),%rdi        # a54710 <efi_MemoryOverWriteRequest_name+0x3f0>
  a4f680:	e8 9b ea ff ff       	callq  a4e120 <warn>
  a4f685:	e9 63 fe ff ff       	jmpq   a4f4ed <choose_random_location+0x5ad>
  a4f68a:	48 8d 35 b8 4f 00 00 	lea    0x4fb8(%rip),%rsi        # a54649 <efi_MemoryOverWriteRequest_name+0x329>
  a4f691:	4c 89 f7             	mov    %r14,%rdi
  a4f694:	e8 c7 e4 ff ff       	callq  a4db60 <strstr>
  a4f699:	48 85 c0             	test   %rax,%rax
  a4f69c:	0f 85 f4 f9 ff ff    	jne    a4f096 <choose_random_location+0x156>
  a4f6a2:	48 8d 35 a5 4f 00 00 	lea    0x4fa5(%rip),%rsi        # a5464e <efi_MemoryOverWriteRequest_name+0x32e>
  a4f6a9:	4c 89 f7             	mov    %r14,%rdi
  a4f6ac:	e8 af e4 ff ff       	callq  a4db60 <strstr>
  a4f6b1:	48 85 c0             	test   %rax,%rax
  a4f6b4:	0f 85 dc f9 ff ff    	jne    a4f096 <choose_random_location+0x156>
  a4f6ba:	e9 df fb ff ff       	jmpq   a4f29e <choose_random_location+0x35e>
  a4f6bf:	90                   	nop
  a4f6c0:	48 83 c4 68          	add    $0x68,%rsp
  a4f6c4:	48 8d 3d cd 4f 00 00 	lea    0x4fcd(%rip),%rdi        # a54698 <efi_MemoryOverWriteRequest_name+0x378>
  a4f6cb:	5b                   	pop    %rbx
  a4f6cc:	5d                   	pop    %rbp
  a4f6cd:	41 5c                	pop    %r12
  a4f6cf:	41 5d                	pop    %r13
  a4f6d1:	41 5e                	pop    %r14
  a4f6d3:	41 5f                	pop    %r15
  a4f6d5:	e9 46 ea ff ff       	jmpq   a4e120 <warn>
  a4f6da:	ba 04 00 00 00       	mov    $0x4,%edx
  a4f6df:	48 8d 35 a3 4f 00 00 	lea    0x4fa3(%rip),%rsi        # a54689 <efi_MemoryOverWriteRequest_name+0x369>
  a4f6e6:	4c 89 ef             	mov    %r13,%rdi
  a4f6e9:	e8 92 e2 ff ff       	callq  a4d980 <strncmp>
  a4f6ee:	85 c0                	test   %eax,%eax
  a4f6f0:	0f 84 82 fe ff ff    	je     a4f578 <choose_random_location+0x638>
  a4f6f6:	48 8b 15 13 aa 01 00 	mov    0x1aa13(%rip),%rdx        # a6a110 <boot_params>
  a4f6fd:	80 ba e8 01 00 00 00 	cmpb   $0x0,0x1e8(%rdx)
  a4f704:	75 22                	jne    a4f728 <choose_random_location+0x7e8>
  a4f706:	e9 16 ff ff ff       	jmpq   a4f621 <choose_random_location+0x6e1>
  a4f70b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a4f710:	83 44 24 0c 01       	addl   $0x1,0xc(%rsp)
  a4f715:	0f b6 82 e8 01 00 00 	movzbl 0x1e8(%rdx),%eax
  a4f71c:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
  a4f720:	39 c1                	cmp    %eax,%ecx
  a4f722:	0f 8d f9 fe ff ff    	jge    a4f621 <choose_random_location+0x6e1>
  a4f728:	48 63 44 24 0c       	movslq 0xc(%rsp),%rax
  a4f72d:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  a4f731:	48 8d 04 82          	lea    (%rdx,%rax,4),%rax
  a4f735:	83 b8 e0 02 00 00 01 	cmpl   $0x1,0x2e0(%rax)
  a4f73c:	75 d2                	jne    a4f710 <choose_random_location+0x7d0>
  a4f73e:	48 8b b0 d8 02 00 00 	mov    0x2d8(%rax),%rsi
  a4f745:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  a4f74a:	48 89 da             	mov    %rbx,%rdx
  a4f74d:	48 8b b8 d0 02 00 00 	mov    0x2d0(%rax),%rdi
  a4f754:	e8 67 f0 ff ff       	callq  a4e7c0 <process_mem_region.isra.0>
  a4f759:	48 83 3d 8f ba 01 00 	cmpq   $0x64,0x1ba8f(%rip)        # a6b1f0 <slot_area_index>
  a4f760:	64 
  a4f761:	0f 84 ba fe ff ff    	je     a4f621 <choose_random_location+0x6e1>
  a4f767:	48 8b 15 a2 a9 01 00 	mov    0x1a9a2(%rip),%rdx        # a6a110 <boot_params>
  a4f76e:	eb a0                	jmp    a4f710 <choose_random_location+0x7d0>
  a4f770:	83 2d 6d c1 01 00 01 	subl   $0x1,0x1c16d(%rip)        # a6b8e4 <malloc_count>
  a4f777:	0f 85 21 fb ff ff    	jne    a4f29e <choose_random_location+0x35e>
  a4f77d:	e9 0e fb ff ff       	jmpq   a4f290 <choose_random_location+0x350>
  a4f782:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4f789:	00 00 00 
  a4f78c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000a4f790 <ident_pmd_init>:
  a4f790:	49 89 c9             	mov    %rcx,%r9
  a4f793:	48 89 d1             	mov    %rdx,%rcx
  a4f796:	49 89 f0             	mov    %rsi,%r8
  a4f799:	48 81 e1 00 00 e0 ff 	and    $0xffffffffffe00000,%rcx
  a4f7a0:	4c 39 c9             	cmp    %r9,%rcx
  a4f7a3:	73 5c                	jae    a4f801 <ident_pmd_init+0x71>
  a4f7a5:	0f 1f 00             	nopl   (%rax)
  a4f7a8:	48 89 ca             	mov    %rcx,%rdx
  a4f7ab:	48 8b 05 66 67 00 00 	mov    0x6766(%rip),%rax        # a55f18 <physical_mask>
  a4f7b2:	48 c1 ea 12          	shr    $0x12,%rdx
  a4f7b6:	81 e2 f8 0f 00 00    	and    $0xff8,%edx
  a4f7bc:	49 89 c2             	mov    %rax,%r10
  a4f7bf:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  a4f7c5:	4c 01 c2             	add    %r8,%rdx
  a4f7c8:	49 81 e2 00 00 e0 ff 	and    $0xffffffffffe00000,%r10
  a4f7cf:	48 8b 32             	mov    (%rdx),%rsi
  a4f7d2:	40 f6 c6 80          	test   $0x80,%sil
  a4f7d6:	49 0f 45 c2          	cmovne %r10,%rax
  a4f7da:	48 f7 d0             	not    %rax
  a4f7dd:	48 21 f0             	and    %rsi,%rax
  a4f7e0:	a9 81 01 00 00       	test   $0x181,%eax
  a4f7e5:	75 0e                	jne    a4f7f5 <ident_pmd_init+0x65>
  a4f7e7:	48 89 c8             	mov    %rcx,%rax
  a4f7ea:	48 2b 47 18          	sub    0x18(%rdi),%rax
  a4f7ee:	48 0b 47 10          	or     0x10(%rdi),%rax
  a4f7f2:	48 89 02             	mov    %rax,(%rdx)
  a4f7f5:	48 81 c1 00 00 20 00 	add    $0x200000,%rcx
  a4f7fc:	49 39 c9             	cmp    %rcx,%r9
  a4f7ff:	77 a7                	ja     a4f7a8 <ident_pmd_init+0x18>
  a4f801:	c3                   	retq   
  a4f802:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a4f809:	00 00 00 00 
  a4f80d:	0f 1f 00             	nopl   (%rax)

0000000000a4f810 <alloc_pgt_page>:
  a4f810:	f3 0f 1e fa          	endbr64 
  a4f814:	48 8b 47 10          	mov    0x10(%rdi),%rax
  a4f818:	48 3b 47 08          	cmp    0x8(%rdi),%rax
  a4f81c:	73 1a                	jae    a4f838 <alloc_pgt_page+0x28>
  a4f81e:	4c 8b 07             	mov    (%rdi),%r8
  a4f821:	49 01 c0             	add    %rax,%r8
  a4f824:	48 05 00 10 00 00    	add    $0x1000,%rax
  a4f82a:	48 89 47 10          	mov    %rax,0x10(%rdi)
  a4f82e:	4c 89 c0             	mov    %r8,%rax
  a4f831:	c3                   	retq   
  a4f832:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a4f838:	45 31 c0             	xor    %r8d,%r8d
  a4f83b:	4c 89 c0             	mov    %r8,%rax
  a4f83e:	c3                   	retq   
  a4f83f:	90                   	nop

0000000000a4f840 <ident_pud_init.isra.0>:
  a4f840:	48 39 d1             	cmp    %rdx,%rcx
  a4f843:	0f 86 1d 01 00 00    	jbe    a4f966 <ident_pud_init.isra.0+0x126>
  a4f849:	41 57                	push   %r15
  a4f84b:	41 56                	push   %r14
  a4f84d:	49 89 ce             	mov    %rcx,%r14
  a4f850:	41 55                	push   %r13
  a4f852:	49 89 fd             	mov    %rdi,%r13
  a4f855:	41 54                	push   %r12
  a4f857:	49 89 d4             	mov    %rdx,%r12
  a4f85a:	55                   	push   %rbp
  a4f85b:	53                   	push   %rbx
  a4f85c:	48 89 f3             	mov    %rsi,%rbx
  a4f85f:	48 83 ec 08          	sub    $0x8,%rsp
  a4f863:	eb 3b                	jmp    a4f8a0 <ident_pud_init.isra.0+0x60>
  a4f865:	0f 1f 00             	nopl   (%rax)
  a4f868:	48 89 f7             	mov    %rsi,%rdi
  a4f86b:	48 81 e6 00 f0 ff ff 	and    $0xfffffffffffff000,%rsi
  a4f872:	48 81 e7 00 00 00 c0 	and    $0xffffffffc0000000,%rdi
  a4f879:	48 85 c9             	test   %rcx,%rcx
  a4f87c:	48 0f 45 f7          	cmovne %rdi,%rsi
  a4f880:	48 f7 d6             	not    %rsi
  a4f883:	48 21 d6             	and    %rdx,%rsi
  a4f886:	83 e6 01             	and    $0x1,%esi
  a4f889:	75 0c                	jne    a4f897 <ident_pud_init.isra.0+0x57>
  a4f88b:	49 2b 45 18          	sub    0x18(%r13),%rax
  a4f88f:	49 0b 45 10          	or     0x10(%r13),%rax
  a4f893:	48 89 45 00          	mov    %rax,0x0(%rbp)
  a4f897:	4d 39 e6             	cmp    %r12,%r14
  a4f89a:	0f 86 9e 00 00 00    	jbe    a4f93e <ident_pud_init.isra.0+0xfe>
  a4f8a0:	4c 89 e5             	mov    %r12,%rbp
  a4f8a3:	4c 89 e0             	mov    %r12,%rax
  a4f8a6:	4d 89 e7             	mov    %r12,%r15
  a4f8a9:	48 8b 35 68 66 00 00 	mov    0x6668(%rip),%rsi        # a55f18 <physical_mask>
  a4f8b0:	48 c1 ed 1b          	shr    $0x1b,%rbp
  a4f8b4:	48 25 00 00 00 c0    	and    $0xffffffffc0000000,%rax
  a4f8ba:	81 e5 f8 0f 00 00    	and    $0xff8,%ebp
  a4f8c0:	48 8d 90 00 00 00 40 	lea    0x40000000(%rax),%rdx
  a4f8c7:	48 01 dd             	add    %rbx,%rbp
  a4f8ca:	4c 39 f2             	cmp    %r14,%rdx
  a4f8cd:	49 0f 47 d6          	cmova  %r14,%rdx
  a4f8d1:	49 89 d4             	mov    %rdx,%r12
  a4f8d4:	48 8b 55 00          	mov    0x0(%rbp),%rdx
  a4f8d8:	48 89 d1             	mov    %rdx,%rcx
  a4f8db:	81 e1 80 00 00 00    	and    $0x80,%ecx
  a4f8e1:	41 80 7d 20 00       	cmpb   $0x0,0x20(%r13)
  a4f8e6:	75 80                	jne    a4f868 <ident_pud_init.isra.0+0x28>
  a4f8e8:	48 89 f0             	mov    %rsi,%rax
  a4f8eb:	48 81 e6 00 f0 ff ff 	and    $0xfffffffffffff000,%rsi
  a4f8f2:	48 25 00 00 00 c0    	and    $0xffffffffc0000000,%rax
  a4f8f8:	48 85 c9             	test   %rcx,%rcx
  a4f8fb:	48 0f 45 f0          	cmovne %rax,%rsi
  a4f8ff:	48 89 f0             	mov    %rsi,%rax
  a4f902:	48 f7 d0             	not    %rax
  a4f905:	48 21 d0             	and    %rdx,%rax
  a4f908:	a8 01                	test   $0x1,%al
  a4f90a:	75 44                	jne    a4f950 <ident_pud_init.isra.0+0x110>
  a4f90c:	49 8b 7d 08          	mov    0x8(%r13),%rdi
  a4f910:	41 ff 55 00          	callq  *0x0(%r13)
  a4f914:	49 89 c3             	mov    %rax,%r11
  a4f917:	48 85 c0             	test   %rax,%rax
  a4f91a:	74 22                	je     a4f93e <ident_pud_init.isra.0+0xfe>
  a4f91c:	4c 89 e1             	mov    %r12,%rcx
  a4f91f:	4c 89 fa             	mov    %r15,%rdx
  a4f922:	48 89 c6             	mov    %rax,%rsi
  a4f925:	4c 89 ef             	mov    %r13,%rdi
  a4f928:	e8 63 fe ff ff       	callq  a4f790 <ident_pmd_init>
  a4f92d:	4d 0b 5d 28          	or     0x28(%r13),%r11
  a4f931:	4c 89 5d 00          	mov    %r11,0x0(%rbp)
  a4f935:	4d 39 e6             	cmp    %r12,%r14
  a4f938:	0f 87 62 ff ff ff    	ja     a4f8a0 <ident_pud_init.isra.0+0x60>
  a4f93e:	48 83 c4 08          	add    $0x8,%rsp
  a4f942:	5b                   	pop    %rbx
  a4f943:	5d                   	pop    %rbp
  a4f944:	41 5c                	pop    %r12
  a4f946:	41 5d                	pop    %r13
  a4f948:	41 5e                	pop    %r14
  a4f94a:	41 5f                	pop    %r15
  a4f94c:	c3                   	retq   
  a4f94d:	0f 1f 00             	nopl   (%rax)
  a4f950:	48 21 d6             	and    %rdx,%rsi
  a4f953:	4c 89 e1             	mov    %r12,%rcx
  a4f956:	4c 89 fa             	mov    %r15,%rdx
  a4f959:	4c 89 ef             	mov    %r13,%rdi
  a4f95c:	e8 2f fe ff ff       	callq  a4f790 <ident_pmd_init>
  a4f961:	e9 31 ff ff ff       	jmpq   a4f897 <ident_pud_init.isra.0+0x57>
  a4f966:	c3                   	retq   
  a4f967:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4f96e:	00 00 

0000000000a4f970 <ident_p4d_init>:
  a4f970:	48 39 ca             	cmp    %rcx,%rdx
  a4f973:	0f 83 eb 00 00 00    	jae    a4fa64 <ident_p4d_init+0xf4>
  a4f979:	41 57                	push   %r15
  a4f97b:	49 89 ff             	mov    %rdi,%r15
  a4f97e:	41 56                	push   %r14
  a4f980:	41 55                	push   %r13
  a4f982:	49 89 f5             	mov    %rsi,%r13
  a4f985:	41 54                	push   %r12
  a4f987:	55                   	push   %rbp
  a4f988:	48 89 cd             	mov    %rcx,%rbp
  a4f98b:	53                   	push   %rbx
  a4f98c:	48 89 d3             	mov    %rdx,%rbx
  a4f98f:	48 83 ec 18          	sub    $0x18,%rsp
  a4f993:	eb 3b                	jmp    a4f9d0 <ident_p4d_init+0x60>
  a4f995:	0f 1f 00             	nopl   (%rax)
  a4f998:	49 8b 7f 08          	mov    0x8(%r15),%rdi
  a4f99c:	41 ff 17             	callq  *(%r15)
  a4f99f:	48 85 c0             	test   %rax,%rax
  a4f9a2:	0f 84 a8 00 00 00    	je     a4fa50 <ident_p4d_init+0xe0>
  a4f9a8:	48 89 c6             	mov    %rax,%rsi
  a4f9ab:	48 89 d9             	mov    %rbx,%rcx
  a4f9ae:	4c 89 f2             	mov    %r14,%rdx
  a4f9b1:	4c 89 ff             	mov    %r15,%rdi
  a4f9b4:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a4f9b9:	e8 82 fe ff ff       	callq  a4f840 <ident_pud_init.isra.0>
  a4f9be:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  a4f9c3:	49 0b 47 28          	or     0x28(%r15),%rax
  a4f9c7:	49 89 04 24          	mov    %rax,(%r12)
  a4f9cb:	48 39 dd             	cmp    %rbx,%rbp
  a4f9ce:	76 6f                	jbe    a4fa3f <ident_p4d_init+0xcf>
  a4f9d0:	8b 05 ca 65 00 00    	mov    0x65ca(%rip),%eax        # a55fa0 <ptrs_per_p4d>
  a4f9d6:	48 89 da             	mov    %rbx,%rdx
  a4f9d9:	49 89 de             	mov    %rbx,%r14
  a4f9dc:	48 b9 00 00 00 00 80 	movabs $0x8000000000,%rcx
  a4f9e3:	00 00 00 
  a4f9e6:	48 c1 ea 27          	shr    $0x27,%rdx
  a4f9ea:	48 8b 35 27 65 00 00 	mov    0x6527(%rip),%rsi        # a55f18 <physical_mask>
  a4f9f1:	83 e8 01             	sub    $0x1,%eax
  a4f9f4:	48 21 d0             	and    %rdx,%rax
  a4f9f7:	4d 8d 64 c5 00       	lea    0x0(%r13,%rax,8),%r12
  a4f9fc:	48 b8 00 00 00 00 80 	movabs $0xffffff8000000000,%rax
  a4fa03:	ff ff ff 
  a4fa06:	48 21 d8             	and    %rbx,%rax
  a4fa09:	48 01 c8             	add    %rcx,%rax
  a4fa0c:	48 39 c5             	cmp    %rax,%rbp
  a4fa0f:	48 0f 46 c5          	cmovbe %rbp,%rax
  a4fa13:	48 81 e6 00 f0 ff ff 	and    $0xfffffffffffff000,%rsi
  a4fa1a:	48 89 c3             	mov    %rax,%rbx
  a4fa1d:	49 8b 04 24          	mov    (%r12),%rax
  a4fa21:	a8 01                	test   $0x1,%al
  a4fa23:	0f 84 6f ff ff ff    	je     a4f998 <ident_p4d_init+0x28>
  a4fa29:	48 21 c6             	and    %rax,%rsi
  a4fa2c:	48 89 d9             	mov    %rbx,%rcx
  a4fa2f:	4c 89 f2             	mov    %r14,%rdx
  a4fa32:	4c 89 ff             	mov    %r15,%rdi
  a4fa35:	e8 06 fe ff ff       	callq  a4f840 <ident_pud_init.isra.0>
  a4fa3a:	48 39 dd             	cmp    %rbx,%rbp
  a4fa3d:	77 91                	ja     a4f9d0 <ident_p4d_init+0x60>
  a4fa3f:	48 83 c4 18          	add    $0x18,%rsp
  a4fa43:	31 c0                	xor    %eax,%eax
  a4fa45:	5b                   	pop    %rbx
  a4fa46:	5d                   	pop    %rbp
  a4fa47:	41 5c                	pop    %r12
  a4fa49:	41 5d                	pop    %r13
  a4fa4b:	41 5e                	pop    %r14
  a4fa4d:	41 5f                	pop    %r15
  a4fa4f:	c3                   	retq   
  a4fa50:	48 83 c4 18          	add    $0x18,%rsp
  a4fa54:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  a4fa59:	5b                   	pop    %rbx
  a4fa5a:	5d                   	pop    %rbp
  a4fa5b:	41 5c                	pop    %r12
  a4fa5d:	41 5d                	pop    %r13
  a4fa5f:	41 5e                	pop    %r14
  a4fa61:	41 5f                	pop    %r15
  a4fa63:	c3                   	retq   
  a4fa64:	31 c0                	xor    %eax,%eax
  a4fa66:	c3                   	retq   
  a4fa67:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4fa6e:	00 00 

0000000000a4fa70 <kernel_ident_mapping_init>:
  a4fa70:	f3 0f 1e fa          	endbr64 
  a4fa74:	41 57                	push   %r15
  a4fa76:	41 56                	push   %r14
  a4fa78:	49 89 fe             	mov    %rdi,%r14
  a4fa7b:	41 55                	push   %r13
  a4fa7d:	41 54                	push   %r12
  a4fa7f:	55                   	push   %rbp
  a4fa80:	48 89 f5             	mov    %rsi,%rbp
  a4fa83:	53                   	push   %rbx
  a4fa84:	48 83 ec 18          	sub    $0x18,%rsp
  a4fa88:	48 8b 5f 18          	mov    0x18(%rdi),%rbx
  a4fa8c:	48 8b 47 28          	mov    0x28(%rdi),%rax
  a4fa90:	48 03 4f 18          	add    0x18(%rdi),%rcx
  a4fa94:	48 01 d3             	add    %rdx,%rbx
  a4fa97:	49 89 cd             	mov    %rcx,%r13
  a4fa9a:	48 85 c0             	test   %rax,%rax
  a4fa9d:	75 0b                	jne    a4faaa <kernel_ident_mapping_init+0x3a>
  a4fa9f:	48 8b 05 7a 64 00 00 	mov    0x647a(%rip),%rax        # a55f20 <sme_me_mask>
  a4faa6:	48 83 c8 63          	or     $0x63,%rax
  a4faaa:	48 23 05 e7 64 00 00 	and    0x64e7(%rip),%rax        # a55f98 <__default_kernel_pte_mask>
  a4fab1:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  a4fab7:	49 89 46 28          	mov    %rax,0x28(%r14)
  a4fabb:	4c 39 eb             	cmp    %r13,%rbx
  a4fabe:	0f 83 a1 00 00 00    	jae    a4fb65 <kernel_ident_mapping_init+0xf5>
  a4fac4:	8b 0d da 64 00 00    	mov    0x64da(%rip),%ecx        # a55fa4 <pgdir_shift>
  a4faca:	48 89 d8             	mov    %rbx,%rax
  a4facd:	4c 89 e2             	mov    %r12,%rdx
  a4fad0:	48 d3 e8             	shr    %cl,%rax
  a4fad3:	48 d3 e2             	shl    %cl,%rdx
  a4fad6:	8b 0d 04 b7 01 00    	mov    0x1b704(%rip),%ecx        # a6b1e0 <__pgtable_l5_enabled>
  a4fadc:	25 ff 01 00 00       	and    $0x1ff,%eax
  a4fae1:	4c 8d 7c c5 00       	lea    0x0(%rbp,%rax,8),%r15
  a4fae6:	48 89 d0             	mov    %rdx,%rax
  a4fae9:	48 f7 d8             	neg    %rax
  a4faec:	48 21 d8             	and    %rbx,%rax
  a4faef:	48 01 d0             	add    %rdx,%rax
  a4faf2:	48 89 da             	mov    %rbx,%rdx
  a4faf5:	49 39 c5             	cmp    %rax,%r13
  a4faf8:	49 0f 46 c5          	cmovbe %r13,%rax
  a4fafc:	48 89 c3             	mov    %rax,%rbx
  a4faff:	85 c9                	test   %ecx,%ecx
  a4fb01:	74 79                	je     a4fb7c <kernel_ident_mapping_init+0x10c>
  a4fb03:	49 8b 0f             	mov    (%r15),%rcx
  a4fb06:	48 8b 05 0b 64 00 00 	mov    0x640b(%rip),%rax        # a55f18 <physical_mask>
  a4fb0d:	f6 c1 01             	test   $0x1,%cl
  a4fb10:	75 5e                	jne    a4fb70 <kernel_ident_mapping_init+0x100>
  a4fb12:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
  a4fb17:	49 8b 7e 08          	mov    0x8(%r14),%rdi
  a4fb1b:	41 ff 16             	callq  *(%r14)
  a4fb1e:	48 89 c6             	mov    %rax,%rsi
  a4fb21:	48 85 c0             	test   %rax,%rax
  a4fb24:	0f 84 89 00 00 00    	je     a4fbb3 <kernel_ident_mapping_init+0x143>
  a4fb2a:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  a4fb2f:	48 89 d9             	mov    %rbx,%rcx
  a4fb32:	4c 89 f7             	mov    %r14,%rdi
  a4fb35:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a4fb3a:	e8 31 fe ff ff       	callq  a4f970 <ident_p4d_init>
  a4fb3f:	85 c0                	test   %eax,%eax
  a4fb41:	75 4b                	jne    a4fb8e <kernel_ident_mapping_init+0x11e>
  a4fb43:	8b 15 97 b6 01 00    	mov    0x1b697(%rip),%edx        # a6b1e0 <__pgtable_l5_enabled>
  a4fb49:	49 8b 46 28          	mov    0x28(%r14),%rax
  a4fb4d:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  a4fb52:	85 d2                	test   %edx,%edx
  a4fb54:	74 4a                	je     a4fba0 <kernel_ident_mapping_init+0x130>
  a4fb56:	48 09 c6             	or     %rax,%rsi
  a4fb59:	49 89 37             	mov    %rsi,(%r15)
  a4fb5c:	49 39 dd             	cmp    %rbx,%r13
  a4fb5f:	0f 87 5f ff ff ff    	ja     a4fac4 <kernel_ident_mapping_init+0x54>
  a4fb65:	31 c0                	xor    %eax,%eax
  a4fb67:	eb 25                	jmp    a4fb8e <kernel_ident_mapping_init+0x11e>
  a4fb69:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4fb70:	48 21 c8             	and    %rcx,%rax
  a4fb73:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  a4fb79:	49 89 c7             	mov    %rax,%r15
  a4fb7c:	48 89 d9             	mov    %rbx,%rcx
  a4fb7f:	4c 89 fe             	mov    %r15,%rsi
  a4fb82:	4c 89 f7             	mov    %r14,%rdi
  a4fb85:	e8 e6 fd ff ff       	callq  a4f970 <ident_p4d_init>
  a4fb8a:	85 c0                	test   %eax,%eax
  a4fb8c:	74 ce                	je     a4fb5c <kernel_ident_mapping_init+0xec>
  a4fb8e:	48 83 c4 18          	add    $0x18,%rsp
  a4fb92:	5b                   	pop    %rbx
  a4fb93:	5d                   	pop    %rbp
  a4fb94:	41 5c                	pop    %r12
  a4fb96:	41 5d                	pop    %r13
  a4fb98:	41 5e                	pop    %r14
  a4fb9a:	41 5f                	pop    %r15
  a4fb9c:	c3                   	retq   
  a4fb9d:	0f 1f 00             	nopl   (%rax)
  a4fba0:	48 8b 36             	mov    (%rsi),%rsi
  a4fba3:	48 23 35 6e 63 00 00 	and    0x636e(%rip),%rsi        # a55f18 <physical_mask>
  a4fbaa:	48 81 e6 00 f0 ff ff 	and    $0xfffffffffffff000,%rsi
  a4fbb1:	eb a3                	jmp    a4fb56 <kernel_ident_mapping_init+0xe6>
  a4fbb3:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  a4fbb8:	eb d4                	jmp    a4fb8e <kernel_ident_mapping_init+0x11e>
  a4fbba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000a4fbc0 <initialize_identity_maps>:
  a4fbc0:	f3 0f 1e fa          	endbr64 
  a4fbc4:	48 83 ec 08          	sub    $0x8,%rsp
  a4fbc8:	e8 d3 01 00 00       	callq  a4fda0 <set_sev_encryption_mask>
  a4fbcd:	48 8b 15 4c 63 00 00 	mov    0x634c(%rip),%rdx        # a55f20 <sme_me_mask>
  a4fbd4:	48 8d 35 35 fc ff ff 	lea    -0x3cb(%rip),%rsi        # a4f810 <alloc_pgt_page>
  a4fbdb:	48 8d 3d 5e bd 01 00 	lea    0x1bd5e(%rip),%rdi        # a6b940 <pgt_data>
  a4fbe2:	48 89 35 17 bd 01 00 	mov    %rsi,0x1bd17(%rip)        # a6b900 <mapping_info>
  a4fbe9:	48 89 d1             	mov    %rdx,%rcx
  a4fbec:	48 89 d0             	mov    %rdx,%rax
  a4fbef:	48 83 ca 63          	or     $0x63,%rdx
  a4fbf3:	48 89 3d 0e bd 01 00 	mov    %rdi,0x1bd0e(%rip)        # a6b908 <mapping_info+0x8>
  a4fbfa:	48 81 c9 e3 01 00 00 	or     $0x1e3,%rcx
  a4fc01:	48 f7 d0             	not    %rax
  a4fc04:	48 89 15 1d bd 01 00 	mov    %rdx,0x1bd1d(%rip)        # a6b928 <mapping_info+0x28>
  a4fc0b:	48 21 05 06 63 00 00 	and    %rax,0x6306(%rip)        # a55f18 <physical_mask>
  a4fc12:	48 89 0d f7 bc 01 00 	mov    %rcx,0x1bcf7(%rip)        # a6b910 <mapping_info+0x10>
  a4fc19:	48 c7 05 2c bd 01 00 	movq   $0x0,0x1bd2c(%rip)        # a6b950 <pgt_data+0x10>
  a4fc20:	00 00 00 00 
  a4fc24:	0f 20 da             	mov    %cr3,%rdx
  a4fc27:	48 21 d0             	and    %rdx,%rax
  a4fc2a:	48 ba 00 f0 ff ff ff 	movabs $0x7ffffffffffff000,%rdx
  a4fc31:	ff ff 7f 
  a4fc34:	48 21 d0             	and    %rdx,%rax
  a4fc37:	8b 15 a3 b5 01 00    	mov    0x1b5a3(%rip),%edx        # a6b1e0 <__pgtable_l5_enabled>
  a4fc3d:	48 89 05 ec bc 01 00 	mov    %rax,0x1bcec(%rip)        # a6b930 <top_level_pgt>
  a4fc44:	85 d2                	test   %edx,%edx
  a4fc46:	74 10                	je     a4fc58 <initialize_identity_maps+0x98>
  a4fc48:	48 8b 00             	mov    (%rax),%rax
  a4fc4b:	48 23 05 c6 62 00 00 	and    0x62c6(%rip),%rax        # a55f18 <physical_mask>
  a4fc52:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  a4fc58:	48 8d 0d a1 e3 01 00 	lea    0x1e3a1(%rip),%rcx        # a6e000 <_pgtable>
  a4fc5f:	48 39 c8             	cmp    %rcx,%rax
  a4fc62:	74 54                	je     a4fcb8 <initialize_identity_maps+0xf8>
  a4fc64:	48 89 cf             	mov    %rcx,%rdi
  a4fc67:	ba 00 10 01 00       	mov    $0x11000,%edx
  a4fc6c:	31 f6                	xor    %esi,%esi
  a4fc6e:	48 89 0d cb bc 01 00 	mov    %rcx,0x1bccb(%rip)        # a6b940 <pgt_data>
  a4fc75:	48 c7 05 c8 bc 01 00 	movq   $0x11000,0x1bcc8(%rip)        # a6b948 <pgt_data+0x8>
  a4fc7c:	00 10 01 00 
  a4fc80:	e8 ab df ff ff       	callq  a4dc30 <memset>
  a4fc85:	48 89 c1             	mov    %rax,%rcx
  a4fc88:	48 8b 05 c1 bc 01 00 	mov    0x1bcc1(%rip),%rax        # a6b950 <pgt_data+0x10>
  a4fc8f:	48 3d ff 0f 01 00    	cmp    $0x10fff,%rax
  a4fc95:	77 51                	ja     a4fce8 <initialize_identity_maps+0x128>
  a4fc97:	48 8d 90 00 10 00 00 	lea    0x1000(%rax),%rdx
  a4fc9e:	48 01 c8             	add    %rcx,%rax
  a4fca1:	48 89 15 a8 bc 01 00 	mov    %rdx,0x1bca8(%rip)        # a6b950 <pgt_data+0x10>
  a4fca8:	48 89 05 81 bc 01 00 	mov    %rax,0x1bc81(%rip)        # a6b930 <top_level_pgt>
  a4fcaf:	48 83 c4 08          	add    $0x8,%rsp
  a4fcb3:	c3                   	retq   
  a4fcb4:	0f 1f 40 00          	nopl   0x0(%rax)
  a4fcb8:	48 8d b9 00 60 00 00 	lea    0x6000(%rcx),%rdi
  a4fcbf:	ba 00 b0 00 00       	mov    $0xb000,%edx
  a4fcc4:	31 f6                	xor    %esi,%esi
  a4fcc6:	48 c7 05 77 bc 01 00 	movq   $0xb000,0x1bc77(%rip)        # a6b948 <pgt_data+0x8>
  a4fccd:	00 b0 00 00 
  a4fcd1:	48 89 3d 68 bc 01 00 	mov    %rdi,0x1bc68(%rip)        # a6b940 <pgt_data>
  a4fcd8:	48 83 c4 08          	add    $0x8,%rsp
  a4fcdc:	e9 4f df ff ff       	jmpq   a4dc30 <memset>
  a4fce1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4fce8:	31 c0                	xor    %eax,%eax
  a4fcea:	48 89 05 3f bc 01 00 	mov    %rax,0x1bc3f(%rip)        # a6b930 <top_level_pgt>
  a4fcf1:	48 83 c4 08          	add    $0x8,%rsp
  a4fcf5:	c3                   	retq   
  a4fcf6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a4fcfd:	00 00 00 

0000000000a4fd00 <add_identity_map>:
  a4fd00:	f3 0f 1e fa          	endbr64 
  a4fd04:	48 8d 4c 37 ff       	lea    -0x1(%rdi,%rsi,1),%rcx
  a4fd09:	48 89 fa             	mov    %rdi,%rdx
  a4fd0c:	48 81 c9 ff ff 1f 00 	or     $0x1fffff,%rcx
  a4fd13:	48 81 e2 00 00 e0 ff 	and    $0xffffffffffe00000,%rdx
  a4fd1a:	48 83 c1 01          	add    $0x1,%rcx
  a4fd1e:	48 39 ca             	cmp    %rcx,%rdx
  a4fd21:	72 05                	jb     a4fd28 <add_identity_map+0x28>
  a4fd23:	c3                   	retq   
  a4fd24:	0f 1f 40 00          	nopl   0x0(%rax)
  a4fd28:	48 8b 35 01 bc 01 00 	mov    0x1bc01(%rip),%rsi        # a6b930 <top_level_pgt>
  a4fd2f:	48 8d 3d ca bb 01 00 	lea    0x1bbca(%rip),%rdi        # a6b900 <mapping_info>
  a4fd36:	e9 35 fd ff ff       	jmpq   a4fa70 <kernel_ident_mapping_init>
  a4fd3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000a4fd40 <finalize_identity_maps>:
  a4fd40:	f3 0f 1e fa          	endbr64 
  a4fd44:	48 8b 05 e5 bb 01 00 	mov    0x1bbe5(%rip),%rax        # a6b930 <top_level_pgt>
  a4fd4b:	0f 22 d8             	mov    %rax,%cr3
  a4fd4e:	c3                   	retq   
  a4fd4f:	90                   	nop

0000000000a4fd50 <get_sev_encryption_bit>:
  a4fd50:	31 c0                	xor    %eax,%eax
  a4fd52:	53                   	push   %rbx
  a4fd53:	51                   	push   %rcx
  a4fd54:	52                   	push   %rdx
  a4fd55:	b8 01 00 00 00       	mov    $0x1,%eax
  a4fd5a:	0f a2                	cpuid  
  a4fd5c:	0f ba e1 1f          	bt     $0x1f,%ecx
  a4fd60:	73 2f                	jae    a4fd91 <get_sev_encryption_bit+0x41>
  a4fd62:	b8 00 00 00 80       	mov    $0x80000000,%eax
  a4fd67:	0f a2                	cpuid  
  a4fd69:	3d 1f 00 00 80       	cmp    $0x8000001f,%eax
  a4fd6e:	72 21                	jb     a4fd91 <get_sev_encryption_bit+0x41>
  a4fd70:	b8 1f 00 00 80       	mov    $0x8000001f,%eax
  a4fd75:	0f a2                	cpuid  
  a4fd77:	0f ba e0 01          	bt     $0x1,%eax
  a4fd7b:	73 14                	jae    a4fd91 <get_sev_encryption_bit+0x41>
  a4fd7d:	b9 31 01 01 c0       	mov    $0xc0010131,%ecx
  a4fd82:	0f 32                	rdmsr  
  a4fd84:	0f ba e0 00          	bt     $0x0,%eax
  a4fd88:	73 07                	jae    a4fd91 <get_sev_encryption_bit+0x41>
  a4fd8a:	89 d8                	mov    %ebx,%eax
  a4fd8c:	83 e0 3f             	and    $0x3f,%eax
  a4fd8f:	eb 02                	jmp    a4fd93 <get_sev_encryption_bit+0x43>
  a4fd91:	31 c0                	xor    %eax,%eax
  a4fd93:	5a                   	pop    %rdx
  a4fd94:	59                   	pop    %rcx
  a4fd95:	5b                   	pop    %rbx
  a4fd96:	c3                   	retq   
  a4fd97:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a4fd9e:	00 00 

0000000000a4fda0 <set_sev_encryption_mask>:
  a4fda0:	55                   	push   %rbp
  a4fda1:	52                   	push   %rdx
  a4fda2:	48 89 e5             	mov    %rsp,%rbp
  a4fda5:	e8 a6 ff ff ff       	callq  a4fd50 <get_sev_encryption_bit>
  a4fdaa:	85 c0                	test   %eax,%eax
  a4fdac:	74 08                	je     a4fdb6 <set_sev_encryption_mask+0x16>
  a4fdae:	48 0f ab 05 6a 61 00 	bts    %rax,0x616a(%rip)        # a55f20 <sme_me_mask>
  a4fdb5:	00 
  a4fdb6:	48 89 ec             	mov    %rbp,%rsp
  a4fdb9:	5a                   	pop    %rdx
  a4fdba:	5d                   	pop    %rbp
  a4fdbb:	48 31 c0             	xor    %rax,%rax
  a4fdbe:	c3                   	retq   
  a4fdbf:	90                   	nop

0000000000a4fdc0 <paging_prepare>:
  a4fdc0:	f3 0f 1e fa          	endbr64 
  a4fdc4:	41 54                	push   %r12
  a4fdc6:	55                   	push   %rbp
  a4fdc7:	53                   	push   %rbx
  a4fdc8:	48 89 3d 41 a3 01 00 	mov    %rdi,0x1a341(%rip)        # a6a110 <boot_params>
  a4fdcf:	48 8d 3d 9e 49 00 00 	lea    0x499e(%rip),%rdi        # a54774 <efi_MemoryOverWriteRequest_name+0x454>
  a4fdd6:	e8 15 e3 ff ff       	callq  a4e0f0 <cmdline_find_option_bool>
  a4fddb:	85 c0                	test   %eax,%eax
  a4fddd:	75 10                	jne    a4fdef <paging_prepare+0x2f>
  a4fddf:	41 89 c4             	mov    %eax,%r12d
  a4fde2:	89 c1                	mov    %eax,%ecx
  a4fde4:	0f a2                	cpuid  
  a4fde6:	83 f8 06             	cmp    $0x6,%eax
  a4fde9:	0f 87 c9 01 00 00    	ja     a4ffb8 <paging_prepare+0x1f8>
  a4fdef:	45 31 e4             	xor    %r12d,%r12d
  a4fdf2:	48 8b 05 17 a3 01 00 	mov    0x1a317(%rip),%rax        # a6a110 <boot_params>
  a4fdf9:	ba 04 00 00 00       	mov    $0x4,%edx
  a4fdfe:	48 8d 35 7f 48 00 00 	lea    0x487f(%rip),%rsi        # a54684 <efi_MemoryOverWriteRequest_name+0x364>
  a4fe05:	48 8d a8 c0 01 00 00 	lea    0x1c0(%rax),%rbp
  a4fe0c:	48 89 ef             	mov    %rbp,%rdi
  a4fe0f:	e8 6c db ff ff       	callq  a4d980 <strncmp>
  a4fe14:	85 c0                	test   %eax,%eax
  a4fe16:	0f 85 bc 01 00 00    	jne    a4ffd8 <paging_prepare+0x218>
  a4fe1c:	ba 00 f0 09 00       	mov    $0x9f000,%edx
  a4fe21:	48 8b 3d e8 a2 01 00 	mov    0x1a2e8(%rip),%rdi        # a6a110 <boot_params>
  a4fe28:	0f b6 8f e8 01 00 00 	movzbl 0x1e8(%rdi),%ecx
  a4fe2f:	84 c9                	test   %cl,%cl
  a4fe31:	0f 84 6e 01 00 00    	je     a4ffa5 <paging_prepare+0x1e5>
  a4fe37:	0f b6 c1             	movzbl %cl,%eax
  a4fe3a:	83 e9 01             	sub    $0x1,%ecx
  a4fe3d:	48 8d 34 80          	lea    (%rax,%rax,4),%rsi
  a4fe41:	48 8d 0c 89          	lea    (%rcx,%rcx,4),%rcx
  a4fe45:	48 c1 e6 02          	shl    $0x2,%rsi
  a4fe49:	48 c1 e1 02          	shl    $0x2,%rcx
  a4fe4d:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  a4fe51:	48 8d 74 37 ec       	lea    -0x14(%rdi,%rsi,1),%rsi
  a4fe56:	48 29 ce             	sub    %rcx,%rsi
  a4fe59:	48 8b 88 bc 02 00 00 	mov    0x2bc(%rax),%rcx
  a4fe60:	48 39 d1             	cmp    %rdx,%rcx
  a4fe63:	0f 83 2f 01 00 00    	jae    a4ff98 <paging_prepare+0x1d8>
  a4fe69:	83 b8 cc 02 00 00 01 	cmpl   $0x1,0x2cc(%rax)
  a4fe70:	0f 85 22 01 00 00    	jne    a4ff98 <paging_prepare+0x1d8>
  a4fe76:	4c 8b 80 c4 02 00 00 	mov    0x2c4(%rax),%r8
  a4fe7d:	49 01 c8             	add    %rcx,%r8
  a4fe80:	49 39 d0             	cmp    %rdx,%r8
  a4fe83:	4c 0f 47 c2          	cmova  %rdx,%r8
  a4fe87:	49 81 e0 00 f0 ff ff 	and    $0xfffffffffffff000,%r8
  a4fe8e:	49 81 e8 00 20 00 00 	sub    $0x2000,%r8
  a4fe95:	4c 39 c1             	cmp    %r8,%rcx
  a4fe98:	0f 87 fa 00 00 00    	ja     a4ff98 <paging_prepare+0x1d8>
  a4fe9e:	48 8d 82 00 e0 ff ff 	lea    -0x2000(%rdx),%rax
  a4fea5:	49 39 d0             	cmp    %rdx,%r8
  a4fea8:	4c 0f 47 c0          	cmova  %rax,%r8
  a4feac:	b8 00 04 00 00       	mov    $0x400,%eax
  a4feb1:	4c 89 05 70 60 00 00 	mov    %r8,0x6070(%rip)        # a55f28 <trampoline_32bit>
  a4feb8:	4c 89 c6             	mov    %r8,%rsi
  a4febb:	48 89 c1             	mov    %rax,%rcx
  a4febe:	48 8d 3d bb ba 01 00 	lea    0x1babb(%rip),%rdi        # a6b980 <trampoline_save>
  a4fec5:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  a4fec8:	4c 89 c7             	mov    %r8,%rdi
  a4fecb:	48 89 c8             	mov    %rcx,%rax
  a4fece:	b9 00 04 00 00       	mov    $0x400,%ecx
  a4fed3:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  a4fed6:	48 8d 05 c3 a5 ff ff 	lea    -0x5a3d(%rip),%rax        # a4a4a0 <trampoline_32bit_src>
  a4fedd:	48 8b 0d 44 60 00 00 	mov    0x6044(%rip),%rcx        # a55f28 <trampoline_32bit>
  a4fee4:	48 8b 30             	mov    (%rax),%rsi
  a4fee7:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
  a4feee:	48 89 b1 00 10 00 00 	mov    %rsi,0x1000(%rcx)
  a4fef5:	48 8b 48 08          	mov    0x8(%rax),%rcx
  a4fef9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  a4fefd:	48 8b 48 10          	mov    0x10(%rax),%rcx
  a4ff01:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
  a4ff05:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a4ff09:	48 89 4a 18          	mov    %rcx,0x18(%rdx)
  a4ff0d:	48 8b 48 20          	mov    0x20(%rax),%rcx
  a4ff11:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
  a4ff15:	48 8b 48 28          	mov    0x28(%rax),%rcx
  a4ff19:	48 89 4a 28          	mov    %rcx,0x28(%rdx)
  a4ff1d:	48 8b 48 30          	mov    0x30(%rax),%rcx
  a4ff21:	48 89 4a 30          	mov    %rcx,0x30(%rdx)
  a4ff25:	48 8b 48 38          	mov    0x38(%rax),%rcx
  a4ff29:	48 89 4a 38          	mov    %rcx,0x38(%rdx)
  a4ff2d:	48 8b 48 40          	mov    0x40(%rax),%rcx
  a4ff31:	48 89 4a 40          	mov    %rcx,0x40(%rdx)
  a4ff35:	48 8b 48 48          	mov    0x48(%rax),%rcx
  a4ff39:	48 89 4a 48          	mov    %rcx,0x48(%rdx)
  a4ff3d:	48 8b 48 50          	mov    0x50(%rax),%rcx
  a4ff41:	48 89 4a 50          	mov    %rcx,0x50(%rdx)
  a4ff45:	48 8b 48 58          	mov    0x58(%rax),%rcx
  a4ff49:	48 89 4a 58          	mov    %rcx,0x58(%rdx)
  a4ff4d:	48 8b 48 60          	mov    0x60(%rax),%rcx
  a4ff51:	48 89 4a 60          	mov    %rcx,0x60(%rdx)
  a4ff55:	48 8b 40 68          	mov    0x68(%rax),%rax
  a4ff59:	48 89 42 68          	mov    %rax,0x68(%rdx)
  a4ff5d:	0f 20 e0             	mov    %cr4,%rax
  a4ff60:	48 c1 e8 0c          	shr    $0xc,%rax
  a4ff64:	83 e0 01             	and    $0x1,%eax
  a4ff67:	4c 39 e0             	cmp    %r12,%rax
  a4ff6a:	74 1a                	je     a4ff86 <paging_prepare+0x1c6>
  a4ff6c:	4d 85 e4             	test   %r12,%r12
  a4ff6f:	0f 84 cb 00 00 00    	je     a50040 <paging_prepare+0x280>
  a4ff75:	0f 20 d8             	mov    %cr3,%rax
  a4ff78:	48 8b 15 a9 5f 00 00 	mov    0x5fa9(%rip),%rdx        # a55f28 <trampoline_32bit>
  a4ff7f:	48 83 c8 67          	or     $0x67,%rax
  a4ff83:	48 89 02             	mov    %rax,(%rdx)
  a4ff86:	4c 89 e2             	mov    %r12,%rdx
  a4ff89:	5b                   	pop    %rbx
  a4ff8a:	4c 89 c0             	mov    %r8,%rax
  a4ff8d:	5d                   	pop    %rbp
  a4ff8e:	41 5c                	pop    %r12
  a4ff90:	c3                   	retq   
  a4ff91:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4ff98:	48 83 e8 14          	sub    $0x14,%rax
  a4ff9c:	48 39 f0             	cmp    %rsi,%rax
  a4ff9f:	0f 85 b4 fe ff ff    	jne    a4fe59 <paging_prepare+0x99>
  a4ffa5:	4c 8d 82 00 e0 ff ff 	lea    -0x2000(%rdx),%r8
  a4ffac:	e9 fb fe ff ff       	jmpq   a4feac <paging_prepare+0xec>
  a4ffb1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4ffb8:	b8 07 00 00 00       	mov    $0x7,%eax
  a4ffbd:	44 89 e1             	mov    %r12d,%ecx
  a4ffc0:	0f a2                	cpuid  
  a4ffc2:	c1 e9 10             	shr    $0x10,%ecx
  a4ffc5:	41 89 cc             	mov    %ecx,%r12d
  a4ffc8:	41 83 e4 01          	and    $0x1,%r12d
  a4ffcc:	e9 21 fe ff ff       	jmpq   a4fdf2 <paging_prepare+0x32>
  a4ffd1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a4ffd8:	ba 04 00 00 00       	mov    $0x4,%edx
  a4ffdd:	48 8d 35 a5 46 00 00 	lea    0x46a5(%rip),%rsi        # a54689 <efi_MemoryOverWriteRequest_name+0x369>
  a4ffe4:	48 89 ef             	mov    %rbp,%rdi
  a4ffe7:	e8 94 d9 ff ff       	callq  a4d980 <strncmp>
  a4ffec:	85 c0                	test   %eax,%eax
  a4ffee:	0f 84 28 fe ff ff    	je     a4fe1c <paging_prepare+0x5c>
  a4fff4:	0f b7 04 25 13 04 00 	movzwl 0x413,%eax
  a4fffb:	00 
  a4fffc:	0f b7 14 25 0e 04 00 	movzwl 0x40e,%edx
  a50003:	00 
  a50004:	c1 e0 0a             	shl    $0xa,%eax
  a50007:	c1 e2 04             	shl    $0x4,%edx
  a5000a:	48 98                	cltq   
  a5000c:	48 63 d2             	movslq %edx,%rdx
  a5000f:	48 8d 88 00 00 fe ff 	lea    -0x20000(%rax),%rcx
  a50016:	48 81 f9 01 f0 07 00 	cmp    $0x7f001,%rcx
  a5001d:	b9 00 f0 09 00       	mov    $0x9f000,%ecx
  a50022:	48 0f 43 c1          	cmovae %rcx,%rax
  a50026:	48 81 fa 00 00 02 00 	cmp    $0x20000,%rdx
  a5002d:	76 5e                	jbe    a5008d <paging_prepare+0x2cd>
  a5002f:	48 39 c2             	cmp    %rax,%rdx
  a50032:	73 59                	jae    a5008d <paging_prepare+0x2cd>
  a50034:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  a5003b:	e9 e1 fd ff ff       	jmpq   a4fe21 <paging_prepare+0x61>
  a50040:	0f 20 d8             	mov    %cr3,%rax
  a50043:	48 8b 30             	mov    (%rax),%rsi
  a50046:	48 8b 0d db 5e 00 00 	mov    0x5edb(%rip),%rcx        # a55f28 <trampoline_32bit>
  a5004d:	4c 89 e2             	mov    %r12,%rdx
  a50050:	48 81 e6 00 f0 ff ff 	and    $0xfffffffffffff000,%rsi
  a50057:	48 8d 79 08          	lea    0x8(%rcx),%rdi
  a5005b:	48 8b 06             	mov    (%rsi),%rax
  a5005e:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  a50062:	48 89 01             	mov    %rax,(%rcx)
  a50065:	48 8b 86 f8 0f 00 00 	mov    0xff8(%rsi),%rax
  a5006c:	48 89 81 f8 0f 00 00 	mov    %rax,0xff8(%rcx)
  a50073:	48 29 f9             	sub    %rdi,%rcx
  a50076:	4c 89 c0             	mov    %r8,%rax
  a50079:	48 29 ce             	sub    %rcx,%rsi
  a5007c:	81 c1 00 10 00 00    	add    $0x1000,%ecx
  a50082:	c1 e9 03             	shr    $0x3,%ecx
  a50085:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  a50088:	5b                   	pop    %rbx
  a50089:	5d                   	pop    %rbp
  a5008a:	41 5c                	pop    %r12
  a5008c:	c3                   	retq   
  a5008d:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  a50093:	48 89 c2             	mov    %rax,%rdx
  a50096:	e9 86 fd ff ff       	jmpq   a4fe21 <paging_prepare+0x61>
  a5009b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000a500a0 <cleanup_trampoline>:
  a500a0:	f3 0f 1e fa          	endbr64 
  a500a4:	48 8b 35 7d 5e 00 00 	mov    0x5e7d(%rip),%rsi        # a55f28 <trampoline_32bit>
  a500ab:	48 89 f8             	mov    %rdi,%rax
  a500ae:	0f 20 da             	mov    %cr3,%rdx
  a500b1:	48 39 d6             	cmp    %rdx,%rsi
  a500b4:	74 42                	je     a500f8 <cleanup_trampoline+0x58>
  a500b6:	48 8b 05 c3 b8 01 00 	mov    0x1b8c3(%rip),%rax        # a6b980 <trampoline_save>
  a500bd:	48 8d 7e 08          	lea    0x8(%rsi),%rdi
  a500c1:	48 89 f1             	mov    %rsi,%rcx
  a500c4:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  a500c8:	48 89 06             	mov    %rax,(%rsi)
  a500cb:	48 8b 05 a6 d8 01 00 	mov    0x1d8a6(%rip),%rax        # a6d978 <trampoline_save+0x1ff8>
  a500d2:	48 29 f9             	sub    %rdi,%rcx
  a500d5:	48 89 86 f8 1f 00 00 	mov    %rax,0x1ff8(%rsi)
  a500dc:	48 8d 35 9d b8 01 00 	lea    0x1b89d(%rip),%rsi        # a6b980 <trampoline_save>
  a500e3:	48 29 ce             	sub    %rcx,%rsi
  a500e6:	81 c1 00 20 00 00    	add    $0x2000,%ecx
  a500ec:	c1 e9 03             	shr    $0x3,%ecx
  a500ef:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  a500f2:	c3                   	retq   
  a500f3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a500f8:	48 8b 16             	mov    (%rsi),%rdx
  a500fb:	48 8d 7f 08          	lea    0x8(%rdi),%rdi
  a500ff:	48 89 c1             	mov    %rax,%rcx
  a50102:	48 89 57 f8          	mov    %rdx,-0x8(%rdi)
  a50106:	48 8b 96 f8 0f 00 00 	mov    0xff8(%rsi),%rdx
  a5010d:	48 89 97 f0 0f 00 00 	mov    %rdx,0xff0(%rdi)
  a50114:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  a50118:	48 29 f9             	sub    %rdi,%rcx
  a5011b:	48 29 ce             	sub    %rcx,%rsi
  a5011e:	81 c1 00 10 00 00    	add    $0x1000,%ecx
  a50124:	c1 e9 03             	shr    $0x3,%ecx
  a50127:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  a5012a:	0f 22 d8             	mov    %rax,%cr3
  a5012d:	48 8b 35 f4 5d 00 00 	mov    0x5df4(%rip),%rsi        # a55f28 <trampoline_32bit>
  a50134:	eb 80                	jmp    a500b6 <cleanup_trampoline+0x16>
  a50136:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a5013d:	00 00 00 

0000000000a50140 <exit_boot_func>:
  a50140:	f3 0f 1e fa          	endbr64 
  a50144:	48 8b 05 35 d8 01 00 	mov    0x1d835(%rip),%rax        # a6d980 <efi_early>
  a5014b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  a5014f:	80 78 30 01          	cmpb   $0x1,0x30(%rax)
  a50153:	19 c0                	sbb    %eax,%eax
  a50155:	25 00 00 fd fd       	and    $0xfdfd0000,%eax
  a5015a:	05 45 4c 36 34       	add    $0x34364c45,%eax
  a5015f:	89 01                	mov    %eax,(%rcx)
  a50161:	48 8b 42 08          	mov    0x8(%rdx),%rax
  a50165:	89 78 04             	mov    %edi,0x4(%rax)
  a50168:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
  a5016c:	48 c1 ef 20          	shr    $0x20,%rdi
  a50170:	48 8b 42 08          	mov    0x8(%rdx),%rax
  a50174:	48 8b 09             	mov    (%rcx),%rcx
  a50177:	89 48 08             	mov    %ecx,0x8(%rax)
  a5017a:	48 8b 4e 18          	mov    0x18(%rsi),%rcx
  a5017e:	48 8b 42 08          	mov    0x8(%rdx),%rax
  a50182:	8b 09                	mov    (%rcx),%ecx
  a50184:	89 48 0c             	mov    %ecx,0xc(%rax)
  a50187:	48 8b 0e             	mov    (%rsi),%rcx
  a5018a:	48 8b 42 08          	mov    0x8(%rdx),%rax
  a5018e:	48 8b 09             	mov    (%rcx),%rcx
  a50191:	89 48 10             	mov    %ecx,0x10(%rax)
  a50194:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
  a50198:	48 8b 42 08          	mov    0x8(%rdx),%rax
  a5019c:	48 8b 09             	mov    (%rcx),%rcx
  a5019f:	89 48 14             	mov    %ecx,0x14(%rax)
  a501a2:	48 8b 42 08          	mov    0x8(%rdx),%rax
  a501a6:	89 78 18             	mov    %edi,0x18(%rax)
  a501a9:	48 8b 06             	mov    (%rsi),%rax
  a501ac:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  a501b0:	48 8b 00             	mov    (%rax),%rax
  a501b3:	48 c1 e8 20          	shr    $0x20,%rax
  a501b7:	89 42 1c             	mov    %eax,0x1c(%rdx)
  a501ba:	31 c0                	xor    %eax,%eax
  a501bc:	c3                   	retq   
  a501bd:	0f 1f 00             	nopl   (%rax)

0000000000a501c0 <__efi_early>:
  a501c0:	f3 0f 1e fa          	endbr64 
  a501c4:	48 8b 05 b5 d7 01 00 	mov    0x1d7b5(%rip),%rax        # a6d980 <efi_early>
  a501cb:	c3                   	retq   
  a501cc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000a501d0 <efi_char16_printk>:
  a501d0:	f3 0f 1e fa          	endbr64 
  a501d4:	48 8b 05 a5 d7 01 00 	mov    0x1d7a5(%rip),%rax        # a6d980 <efi_early>
  a501db:	48 89 f2             	mov    %rsi,%rdx
  a501de:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a501e2:	48 8b 48 28          	mov    0x28(%rax),%rcx
  a501e6:	48 8b 70 20          	mov    0x20(%rax),%rsi
  a501ea:	74 0c                	je     a501f8 <efi_char16_printk+0x28>
  a501ec:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  a501f0:	31 c0                	xor    %eax,%eax
  a501f2:	ff e1                	jmpq   *%rcx
  a501f4:	0f 1f 40 00          	nopl   0x0(%rax)
  a501f8:	8b 7e 04             	mov    0x4(%rsi),%edi
  a501fb:	31 c0                	xor    %eax,%eax
  a501fd:	ff e1                	jmpq   *%rcx
  a501ff:	90                   	nop

0000000000a50200 <setup_graphics>:
  a50200:	f3 0f 1e fa          	endbr64 
  a50204:	48 b8 de a9 42 90 dc 	movabs $0x4a3823dc9042a9de,%rax
  a5020b:	23 38 4a 
  a5020e:	41 57                	push   %r15
  a50210:	41 56                	push   %r14
  a50212:	41 55                	push   %r13
  a50214:	41 54                	push   %r12
  a50216:	55                   	push   %rbp
  a50217:	53                   	push   %rbx
  a50218:	48 89 fb             	mov    %rdi,%rbx
  a5021b:	48 83 c7 08          	add    $0x8,%rdi
  a5021f:	48 89 d9             	mov    %rbx,%rcx
  a50222:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
  a50229:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
  a5022e:	48 b8 96 fb 7a de d0 	movabs $0x6a5180d0de7afb96,%rax
  a50235:	80 51 6a 
  a50238:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  a5023d:	48 b8 8b 29 2c 98 fa 	movabs $0x41cbf4fa982c298b,%rax
  a50244:	f4 cb 41 
  a50247:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  a5024c:	48 b8 b8 38 77 aa 68 	movabs $0x39b88f68aa7738b8,%rax
  a50253:	8f b8 39 
  a50256:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  a5025b:	31 c0                	xor    %eax,%eax
  a5025d:	48 c7 47 f8 00 00 00 	movq   $0x0,-0x8(%rdi)
  a50264:	00 
  a50265:	48 c7 47 30 00 00 00 	movq   $0x0,0x30(%rdi)
  a5026c:	00 
  a5026d:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  a50271:	48 29 f9             	sub    %rdi,%rcx
  a50274:	83 c1 40             	add    $0x40,%ecx
  a50277:	c1 e9 03             	shr    $0x3,%ecx
  a5027a:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  a5027d:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  a50284:	00 00 
  a50286:	48 8b 05 f3 d6 01 00 	mov    0x1d6f3(%rip),%rax        # a6d980 <efi_early>
  a5028d:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a50291:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a50295:	48 8b 40 18          	mov    0x18(%rax),%rax
  a50299:	0f 84 a1 00 00 00    	je     a50340 <setup_graphics+0x140>
  a5029f:	48 8b b8 b0 00 00 00 	mov    0xb0(%rax),%rdi
  a502a6:	48 8d 6c 24 38       	lea    0x38(%rsp),%rbp
  a502ab:	4c 8d 64 24 60       	lea    0x60(%rsp),%r12
  a502b0:	45 31 c9             	xor    %r9d,%r9d
  a502b3:	31 c9                	xor    %ecx,%ecx
  a502b5:	4c 89 e2             	mov    %r12,%rdx
  a502b8:	49 89 e8             	mov    %rbp,%r8
  a502bb:	be 02 00 00 00       	mov    $0x2,%esi
  a502c0:	31 c0                	xor    %eax,%eax
  a502c2:	41 ff d2             	callq  *%r10
  a502c5:	48 ba 05 00 00 00 00 	movabs $0x8000000000000005,%rdx
  a502cc:	00 00 80 
  a502cf:	48 39 d0             	cmp    %rdx,%rax
  a502d2:	0f 84 88 00 00 00    	je     a50360 <setup_graphics+0x160>
  a502d8:	48 85 c0             	test   %rax,%rax
  a502db:	74 4d                	je     a5032a <setup_graphics+0x12a>
  a502dd:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  a502e4:	00 00 
  a502e6:	48 8b 05 93 d6 01 00 	mov    0x1d693(%rip),%rax        # a6d980 <efi_early>
  a502ed:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a502f1:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a502f5:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a502f9:	75 55                	jne    a50350 <setup_graphics+0x150>
  a502fb:	8b 7a 64             	mov    0x64(%rdx),%edi
  a502fe:	4c 8d 64 24 70       	lea    0x70(%rsp),%r12
  a50303:	49 89 e8             	mov    %rbp,%r8
  a50306:	45 31 c9             	xor    %r9d,%r9d
  a50309:	31 c9                	xor    %ecx,%ecx
  a5030b:	4c 89 e2             	mov    %r12,%rdx
  a5030e:	be 02 00 00 00       	mov    $0x2,%esi
  a50313:	31 c0                	xor    %eax,%eax
  a50315:	41 ff d2             	callq  *%r10
  a50318:	49 89 c0             	mov    %rax,%r8
  a5031b:	48 b8 05 00 00 00 00 	movabs $0x8000000000000005,%rax
  a50322:	00 00 80 
  a50325:	49 39 c0             	cmp    %rax,%r8
  a50328:	74 56                	je     a50380 <setup_graphics+0x180>
  a5032a:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
  a50331:	5b                   	pop    %rbx
  a50332:	5d                   	pop    %rbp
  a50333:	41 5c                	pop    %r12
  a50335:	41 5d                	pop    %r13
  a50337:	41 5e                	pop    %r14
  a50339:	41 5f                	pop    %r15
  a5033b:	c3                   	retq   
  a5033c:	0f 1f 40 00          	nopl   0x0(%rax)
  a50340:	8b 78 64             	mov    0x64(%rax),%edi
  a50343:	e9 5e ff ff ff       	jmpq   a502a6 <setup_graphics+0xa6>
  a50348:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5034f:	00 
  a50350:	48 8b ba b0 00 00 00 	mov    0xb0(%rdx),%rdi
  a50357:	eb a5                	jmp    a502fe <setup_graphics+0xfe>
  a50359:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a50360:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
  a50365:	4c 89 e2             	mov    %r12,%rdx
  a50368:	48 89 de             	mov    %rbx,%rsi
  a5036b:	31 ff                	xor    %edi,%edi
  a5036d:	e8 4e 2f 00 00       	callq  a532c0 <efi_setup_gop>
  a50372:	e9 61 ff ff ff       	jmpq   a502d8 <setup_graphics+0xd8>
  a50377:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a5037e:	00 00 
  a50380:	48 8b 05 f9 d5 01 00 	mov    0x1d5f9(%rip),%rax        # a6d980 <efi_early>
  a50387:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
  a5038c:	48 c7 44 24 48 00 00 	movq   $0x0,0x48(%rsp)
  a50393:	00 00 
  a50395:	48 c7 44 24 50 00 00 	movq   $0x0,0x50(%rsp)
  a5039c:	00 00 
  a5039e:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a503a2:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a503a6:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
  a503ab:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a503af:	0f 84 3b 02 00 00    	je     a505f0 <setup_graphics+0x3f0>
  a503b5:	48 8b 79 40          	mov    0x40(%rcx),%rdi
  a503b9:	31 c0                	xor    %eax,%eax
  a503bb:	48 8d 4c 24 48       	lea    0x48(%rsp),%rcx
  a503c0:	be 02 00 00 00       	mov    $0x2,%esi
  a503c5:	41 ff d0             	callq  *%r8
  a503c8:	48 85 c0             	test   %rax,%rax
  a503cb:	0f 85 59 ff ff ff    	jne    a5032a <setup_graphics+0x12a>
  a503d1:	48 8b 05 a8 d5 01 00 	mov    0x1d5a8(%rip),%rax        # a6d980 <efi_early>
  a503d8:	4c 8b 4c 24 48       	mov    0x48(%rsp),%r9
  a503dd:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a503e1:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a503e5:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a503e9:	0f 85 11 02 00 00    	jne    a50600 <setup_graphics+0x400>
  a503ef:	8b 7a 64             	mov    0x64(%rdx),%edi
  a503f2:	4c 8d 44 24 40       	lea    0x40(%rsp),%r8
  a503f7:	31 c9                	xor    %ecx,%ecx
  a503f9:	4c 89 e2             	mov    %r12,%rdx
  a503fc:	be 02 00 00 00       	mov    $0x2,%esi
  a50401:	31 c0                	xor    %eax,%eax
  a50403:	41 ff d2             	callq  *%r10
  a50406:	48 89 c5             	mov    %rax,%rbp
  a50409:	48 85 c0             	test   %rax,%rax
  a5040c:	0f 85 8e 02 00 00    	jne    a506a0 <setup_graphics+0x4a0>
  a50412:	48 8b 0d 67 d5 01 00 	mov    0x1d567(%rip),%rcx        # a6d980 <efi_early>
  a50419:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
  a5041e:	0f b6 71 30          	movzbl 0x30(%rcx),%esi
  a50422:	4c 89 c0             	mov    %r8,%rax
  a50425:	40 80 fe 01          	cmp    $0x1,%sil
  a50429:	48 19 ff             	sbb    %rdi,%rdi
  a5042c:	31 d2                	xor    %edx,%edx
  a5042e:	48 83 e7 fc          	and    $0xfffffffffffffffc,%rdi
  a50432:	48 83 c7 08          	add    $0x8,%rdi
  a50436:	48 f7 f7             	div    %rdi
  a50439:	49 39 f8             	cmp    %rdi,%r8
  a5043c:	0f 82 80 01 00 00    	jb     a505c2 <setup_graphics+0x3c2>
  a50442:	48 8d 94 24 80 00 00 	lea    0x80(%rsp),%rdx
  a50449:	00 
  a5044a:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
  a5044f:	4c 8d 6c 24 50       	lea    0x50(%rsp),%r13
  a50454:	48 89 c3             	mov    %rax,%rbx
  a50457:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%rsp)
  a5045e:	00 
  a5045f:	4c 8d 7c 24 58       	lea    0x58(%rsp),%r15
  a50464:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%rsp)
  a5046b:	00 
  a5046c:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  a50473:	00 00 
  a50475:	48 89 14 24          	mov    %rdx,(%rsp)
  a50479:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a50480:	48 b8 00 b2 f5 4c b8 	movabs $0x4ca568b84cf5b200,%rax
  a50487:	68 a5 4c 
  a5048a:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
  a5048f:	4c 8b 41 28          	mov    0x28(%rcx),%r8
  a50493:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  a5049a:	00 
  a5049b:	48 b8 9e ec b2 3e 3f 	movabs $0x9a02503f3eb2ec9e,%rax
  a504a2:	50 02 9a 
  a504a5:	48 89 84 24 88 00 00 	mov    %rax,0x88(%rsp)
  a504ac:	00 
  a504ad:	48 8b 41 18          	mov    0x18(%rcx),%rax
  a504b1:	40 84 f6             	test   %sil,%sil
  a504b4:	0f 84 96 01 00 00    	je     a50650 <setup_graphics+0x450>
  a504ba:	4c 8b 34 ea          	mov    (%rdx,%rbp,8),%r14
  a504be:	48 8b b8 98 00 00 00 	mov    0x98(%rax),%rdi
  a504c5:	31 c0                	xor    %eax,%eax
  a504c7:	4c 89 e9             	mov    %r13,%rcx
  a504ca:	4c 89 e2             	mov    %r12,%rdx
  a504cd:	4c 89 f6             	mov    %r14,%rsi
  a504d0:	41 ff d0             	callq  *%r8
  a504d3:	48 85 c0             	test   %rax,%rax
  a504d6:	0f 85 5a 01 00 00    	jne    a50636 <setup_graphics+0x436>
  a504dc:	48 c7 44 24 58 00 00 	movq   $0x0,0x58(%rsp)
  a504e3:	00 00 
  a504e5:	48 8b 05 94 d4 01 00 	mov    0x1d494(%rip),%rax        # a6d980 <efi_early>
  a504ec:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a504f0:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a504f4:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a504f8:	0f 84 72 01 00 00    	je     a50670 <setup_graphics+0x470>
  a504fe:	48 8b ba 98 00 00 00 	mov    0x98(%rdx),%rdi
  a50505:	4c 89 f6             	mov    %r14,%rsi
  a50508:	31 c0                	xor    %eax,%eax
  a5050a:	48 8b 14 24          	mov    (%rsp),%rdx
  a5050e:	4c 89 f9             	mov    %r15,%rcx
  a50511:	41 ff d0             	callq  *%r8
  a50514:	48 8b 05 65 d4 01 00 	mov    0x1d465(%rip),%rax        # a6d980 <efi_early>
  a5051b:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
  a50520:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a50524:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a50528:	0f 84 32 01 00 00    	je     a50660 <setup_graphics+0x460>
  a5052e:	48 8b 3e             	mov    (%rsi),%rdi
  a50531:	31 c0                	xor    %eax,%eax
  a50533:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
  a50538:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
  a5053d:	4c 8d 4c 24 34       	lea    0x34(%rsp),%r9
  a50542:	4c 8d 44 24 30       	lea    0x30(%rsp),%r8
  a50547:	41 ff d2             	callq  *%r10
  a5054a:	48 85 c0             	test   %rax,%rax
  a5054d:	0f 85 e3 00 00 00    	jne    a50636 <setup_graphics+0x436>
  a50553:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
  a50559:	0f 84 b1 00 00 00    	je     a50610 <setup_graphics+0x410>
  a5055f:	48 83 7c 24 58 00    	cmpq   $0x0,0x58(%rsp)
  a50565:	0f 84 cb 00 00 00    	je     a50636 <setup_graphics+0x436>
  a5056b:	8b 44 24 28          	mov    0x28(%rsp),%eax
  a5056f:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
  a50574:	89 44 24 14          	mov    %eax,0x14(%rsp)
  a50578:	8b 44 24 2c          	mov    0x2c(%rsp),%eax
  a5057c:	89 44 24 10          	mov    %eax,0x10(%rsp)
  a50580:	48 8b 0d f9 d3 01 00 	mov    0x1d3f9(%rip),%rcx        # a6d980 <efi_early>
  a50587:	8b 44 24 14          	mov    0x14(%rsp),%eax
  a5058b:	0b 44 24 10          	or     0x10(%rsp),%eax
  a5058f:	74 2d                	je     a505be <setup_graphics+0x3be>
  a50591:	b8 20 00 00 00       	mov    $0x20,%eax
  a50596:	c6 43 0f 70          	movb   $0x70,0xf(%rbx)
  a5059a:	66 89 43 16          	mov    %ax,0x16(%rbx)
  a5059e:	0f b7 44 24 14       	movzwl 0x14(%rsp),%eax
  a505a3:	66 89 43 12          	mov    %ax,0x12(%rbx)
  a505a7:	0f b7 44 24 10       	movzwl 0x10(%rsp),%eax
  a505ac:	66 89 43 14          	mov    %ax,0x14(%rbx)
  a505b0:	48 b8 08 10 08 08 08 	movabs $0x1808000808081008,%rax
  a505b7:	00 08 18 
  a505ba:	48 89 43 26          	mov    %rax,0x26(%rbx)
  a505be:	0f b6 71 30          	movzbl 0x30(%rcx),%esi
  a505c2:	48 8b 51 28          	mov    0x28(%rcx),%rdx
  a505c6:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
  a505cb:	48 8b 41 18          	mov    0x18(%rcx),%rax
  a505cf:	40 84 f6             	test   %sil,%sil
  a505d2:	0f 84 a8 00 00 00    	je     a50680 <setup_graphics+0x480>
  a505d8:	48 8b 78 48          	mov    0x48(%rax),%rdi
  a505dc:	4c 89 c6             	mov    %r8,%rsi
  a505df:	31 c0                	xor    %eax,%eax
  a505e1:	ff d2                	callq  *%rdx
  a505e3:	e9 42 fd ff ff       	jmpq   a5032a <setup_graphics+0x12a>
  a505e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a505ef:	00 
  a505f0:	8b 79 2c             	mov    0x2c(%rcx),%edi
  a505f3:	e9 c1 fd ff ff       	jmpq   a503b9 <setup_graphics+0x1b9>
  a505f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a505ff:	00 
  a50600:	48 8b ba b0 00 00 00 	mov    0xb0(%rdx),%rdi
  a50607:	e9 e6 fd ff ff       	jmpq   a503f2 <setup_graphics+0x1f2>
  a5060c:	0f 1f 40 00          	nopl   0x0(%rax)
  a50610:	8b 44 24 28          	mov    0x28(%rsp),%eax
  a50614:	48 83 7c 24 58 00    	cmpq   $0x0,0x58(%rsp)
  a5061a:	89 44 24 14          	mov    %eax,0x14(%rsp)
  a5061e:	8b 44 24 2c          	mov    0x2c(%rsp),%eax
  a50622:	89 44 24 10          	mov    %eax,0x10(%rsp)
  a50626:	0f 85 84 00 00 00    	jne    a506b0 <setup_graphics+0x4b0>
  a5062c:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
  a50631:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a50636:	48 83 c5 01          	add    $0x1,%rbp
  a5063a:	48 8b 0d 3f d3 01 00 	mov    0x1d33f(%rip),%rcx        # a6d980 <efi_early>
  a50641:	48 39 dd             	cmp    %rbx,%rbp
  a50644:	73 4a                	jae    a50690 <setup_graphics+0x490>
  a50646:	0f b6 71 30          	movzbl 0x30(%rcx),%esi
  a5064a:	e9 31 fe ff ff       	jmpq   a50480 <setup_graphics+0x280>
  a5064f:	90                   	nop
  a50650:	44 8b 34 aa          	mov    (%rdx,%rbp,4),%r14d
  a50654:	8b 78 58             	mov    0x58(%rax),%edi
  a50657:	e9 69 fe ff ff       	jmpq   a504c5 <setup_graphics+0x2c5>
  a5065c:	0f 1f 40 00          	nopl   0x0(%rax)
  a50660:	8b 3e                	mov    (%rsi),%edi
  a50662:	e9 ca fe ff ff       	jmpq   a50531 <setup_graphics+0x331>
  a50667:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a5066e:	00 00 
  a50670:	8b 7a 58             	mov    0x58(%rdx),%edi
  a50673:	e9 8d fe ff ff       	jmpq   a50505 <setup_graphics+0x305>
  a50678:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5067f:	00 
  a50680:	8b 78 30             	mov    0x30(%rax),%edi
  a50683:	e9 54 ff ff ff       	jmpq   a505dc <setup_graphics+0x3dc>
  a50688:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5068f:	00 
  a50690:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
  a50695:	e9 ed fe ff ff       	jmpq   a50587 <setup_graphics+0x387>
  a5069a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a506a0:	48 8b 0d d9 d2 01 00 	mov    0x1d2d9(%rip),%rcx        # a6d980 <efi_early>
  a506a7:	0f b6 71 30          	movzbl 0x30(%rcx),%esi
  a506ab:	e9 12 ff ff ff       	jmpq   a505c2 <setup_graphics+0x3c2>
  a506b0:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
  a506b5:	e9 c6 fe ff ff       	jmpq   a50580 <setup_graphics+0x380>
  a506ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000a506c0 <make_boot_params>:
  a506c0:	f3 0f 1e fa          	endbr64 
  a506c4:	48 b8 a1 31 1b 5b 62 	movabs $0x11d295625b1b31a1,%rax
  a506cb:	95 d2 11 
  a506ce:	41 54                	push   %r12
  a506d0:	45 31 c0             	xor    %r8d,%r8d
  a506d3:	48 ba 49 42 49 20 53 	movabs $0x5453595320494249,%rdx
  a506da:	59 53 54 
  a506dd:	55                   	push   %rbp
  a506de:	53                   	push   %rbx
  a506df:	48 83 ec 40          	sub    $0x40,%rsp
  a506e3:	48 89 3d 96 d2 01 00 	mov    %rdi,0x1d296(%rip)        # a6d980 <efi_early>
  a506ea:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  a506ef:	48 b8 8e 3f 00 a0 c9 	movabs $0x3b7269c9a0003f8e,%rax
  a506f6:	69 72 3b 
  a506f9:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  a506fe:	48 8b 47 08          	mov    0x8(%rdi),%rax
  a50702:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%rsp)
  a50709:	00 
  a5070a:	48 89 05 77 d2 01 00 	mov    %rax,0x1d277(%rip)        # a6d988 <sys_table>
  a50711:	48 39 10             	cmp    %rdx,(%rax)
  a50714:	0f 85 e0 01 00 00    	jne    a508fa <make_boot_params+0x23a>
  a5071a:	80 7f 30 00          	cmpb   $0x0,0x30(%rdi)
  a5071e:	48 8b 37             	mov    (%rdi),%rsi
  a50721:	4c 8b 47 28          	mov    0x28(%rdi),%r8
  a50725:	0f 85 e5 01 00 00    	jne    a50910 <make_boot_params+0x250>
  a5072b:	8b 58 38             	mov    0x38(%rax),%ebx
  a5072e:	48 89 5f 10          	mov    %rbx,0x10(%rdi)
  a50732:	8b 50 3c             	mov    0x3c(%rax),%edx
  a50735:	48 89 57 18          	mov    %rdx,0x18(%rdi)
  a50739:	8b 40 2c             	mov    0x2c(%rax),%eax
  a5073c:	48 89 47 20          	mov    %rax,0x20(%rdi)
  a50740:	8b 7a 58             	mov    0x58(%rdx),%edi
  a50743:	31 c0                	xor    %eax,%eax
  a50745:	48 8d 4c 24 18       	lea    0x18(%rsp),%rcx
  a5074a:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  a5074f:	41 ff d0             	callq  *%r8
  a50752:	48 85 c0             	test   %rax,%rax
  a50755:	0f 85 65 02 00 00    	jne    a509c0 <make_boot_params+0x300>
  a5075b:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  a50760:	ba 01 00 00 00       	mov    $0x1,%edx
  a50765:	be 00 40 00 00       	mov    $0x4000,%esi
  a5076a:	48 8b 3d 17 d2 01 00 	mov    0x1d217(%rip),%rdi        # a6d988 <sys_table>
  a50771:	e8 6a 17 00 00       	callq  a51ee0 <efi_low_alloc>
  a50776:	48 85 c0             	test   %rax,%rax
  a50779:	0f 85 79 02 00 00    	jne    a509f8 <make_boot_params+0x338>
  a5077f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  a50784:	ba 00 40 00 00       	mov    $0x4000,%edx
  a50789:	31 f6                	xor    %esi,%esi
  a5078b:	e8 a0 d4 ff ff       	callq  a4dc30 <memset>
  a50790:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
  a50795:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
  a5079a:	41 b9 01 00 00 00    	mov    $0x1,%r9d
  a507a0:	41 ba ff ff ff ff    	mov    $0xffffffff,%r10d
  a507a6:	41 bb 55 aa ff ff    	mov    $0xffffaa55,%r11d
  a507ac:	49 8b 40 40          	mov    0x40(%r8),%rax
  a507b0:	48 8d bb 08 02 00 00 	lea    0x208(%rbx),%rdi
  a507b7:	48 8d 8b 00 02 00 00 	lea    0x200(%rbx),%rcx
  a507be:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  a507c2:	48 8b 90 00 02 00 00 	mov    0x200(%rax),%rdx
  a507c9:	48 29 f9             	sub    %rdi,%rcx
  a507cc:	48 8d b0 00 02 00 00 	lea    0x200(%rax),%rsi
  a507d3:	48 29 ce             	sub    %rcx,%rsi
  a507d6:	81 c1 00 02 00 00    	add    $0x200,%ecx
  a507dc:	48 89 93 00 02 00 00 	mov    %rdx,0x200(%rbx)
  a507e3:	c1 e9 03             	shr    $0x3,%ecx
  a507e6:	48 8b 80 f8 03 00 00 	mov    0x3f8(%rax),%rax
  a507ed:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  a507f2:	48 89 83 f8 03 00 00 	mov    %rax,0x3f8(%rbx)
  a507f9:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  a507fc:	66 44 89 8b f2 01 00 	mov    %r9w,0x1f2(%rbx)
  a50803:	00 
  a50804:	4c 89 c6             	mov    %r8,%rsi
  a50807:	66 44 89 93 fa 01 00 	mov    %r10w,0x1fa(%rbx)
  a5080e:	00 
  a5080f:	66 44 89 9b fe 01 00 	mov    %r11w,0x1fe(%rbx)
  a50816:	00 
  a50817:	48 8b 3d 6a d1 01 00 	mov    0x1d16a(%rip),%rdi        # a6d988 <sys_table>
  a5081e:	c6 83 10 02 00 00 21 	movb   $0x21,0x210(%rbx)
  a50825:	e8 c6 24 00 00       	callq  a52cf0 <efi_convert_cmdline>
  a5082a:	48 89 c7             	mov    %rax,%rdi
  a5082d:	48 85 c0             	test   %rax,%rax
  a50830:	0f 84 ab 00 00 00    	je     a508e1 <make_boot_params+0x221>
  a50836:	89 83 28 02 00 00    	mov    %eax,0x228(%rbx)
  a5083c:	48 89 c2             	mov    %rax,%rdx
  a5083f:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  a50844:	48 c1 ea 20          	shr    $0x20,%rdx
  a50848:	89 90 c8 00 00 00    	mov    %edx,0xc8(%rax)
  a5084e:	48 c7 83 18 02 00 00 	movq   $0x0,0x218(%rbx)
  a50855:	00 00 00 00 
  a50859:	48 c7 43 40 00 00 00 	movq   $0x0,0x40(%rbx)
  a50860:	00 
  a50861:	48 c7 43 48 00 00 00 	movq   $0x0,0x48(%rbx)
  a50868:	00 
  a50869:	c7 43 50 00 00 00 00 	movl   $0x0,0x50(%rbx)
  a50870:	e8 db 18 00 00       	callq  a52150 <efi_parse_options>
  a50875:	48 85 c0             	test   %rax,%rax
  a50878:	0f 85 6a 01 00 00    	jne    a509e8 <make_boot_params+0x328>
  a5087e:	48 8d 6c 24 20       	lea    0x20(%rsp),%rbp
  a50883:	48 83 ec 08          	sub    $0x8,%rsp
  a50887:	44 8b 83 2c 02 00 00 	mov    0x22c(%rbx),%r8d
  a5088e:	8b 93 28 02 00 00    	mov    0x228(%rbx),%edx
  a50894:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
  a50899:	48 8b 3d e8 d0 01 00 	mov    0x1d0e8(%rip),%rdi        # a6d988 <sys_table>
  a508a0:	49 89 e9             	mov    %rbp,%r9
  a508a3:	48 8d 0d 85 40 00 00 	lea    0x4085(%rip),%rcx        # a5492f <efi_MemoryOverWriteRequest_name+0x60f>
  a508aa:	41 54                	push   %r12
  a508ac:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  a508b1:	e8 fa 19 00 00       	callq  a522b0 <handle_cmdline_files>
  a508b6:	5e                   	pop    %rsi
  a508b7:	5f                   	pop    %rdi
  a508b8:	48 85 c0             	test   %rax,%rax
  a508bb:	0f 84 b8 00 00 00    	je     a50979 <make_boot_params+0x2b9>
  a508c1:	48 8b 3d c0 d0 01 00 	mov    0x1d0c0(%rip),%rdi        # a6d988 <sys_table>
  a508c8:	f6 83 36 02 00 00 02 	testb  $0x2,0x236(%rbx)
  a508cf:	75 67                	jne    a50938 <make_boot_params+0x278>
  a508d1:	8b 93 28 02 00 00    	mov    0x228(%rbx),%edx
  a508d7:	48 63 74 24 0c       	movslq 0xc(%rsp),%rsi
  a508dc:	e8 ff 17 00 00       	callq  a520e0 <efi_free>
  a508e1:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  a508e6:	48 8b 3d 9b d0 01 00 	mov    0x1d09b(%rip),%rdi        # a6d988 <sys_table>
  a508ed:	be 00 40 00 00       	mov    $0x4000,%esi
  a508f2:	e8 e9 17 00 00       	callq  a520e0 <efi_free>
  a508f7:	45 31 c0             	xor    %r8d,%r8d
  a508fa:	48 83 c4 40          	add    $0x40,%rsp
  a508fe:	4c 89 c0             	mov    %r8,%rax
  a50901:	5b                   	pop    %rbx
  a50902:	5d                   	pop    %rbp
  a50903:	41 5c                	pop    %r12
  a50905:	c3                   	retq   
  a50906:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a5090d:	00 00 00 
  a50910:	48 8b 50 58          	mov    0x58(%rax),%rdx
  a50914:	48 89 57 10          	mov    %rdx,0x10(%rdi)
  a50918:	48 8b 50 60          	mov    0x60(%rax),%rdx
  a5091c:	48 89 57 18          	mov    %rdx,0x18(%rdi)
  a50920:	48 8b 40 40          	mov    0x40(%rax),%rax
  a50924:	48 89 47 20          	mov    %rax,0x20(%rdi)
  a50928:	48 8b ba 98 00 00 00 	mov    0x98(%rdx),%rdi
  a5092f:	e9 0f fe ff ff       	jmpq   a50743 <make_boot_params+0x83>
  a50934:	0f 1f 40 00          	nopl   0x0(%rax)
  a50938:	48 8d 35 a1 3e 00 00 	lea    0x3ea1(%rip),%rsi        # a547e0 <efi_MemoryOverWriteRequest_name+0x4c0>
  a5093f:	e8 5c 10 00 00       	callq  a519a0 <efi_printk>
  a50944:	8b 93 28 02 00 00    	mov    0x228(%rbx),%edx
  a5094a:	48 8b 3d 37 d0 01 00 	mov    0x1d037(%rip),%rdi        # a6d988 <sys_table>
  a50951:	48 8d 0d d7 3f 00 00 	lea    0x3fd7(%rip),%rcx        # a5492f <efi_MemoryOverWriteRequest_name+0x60f>
  a50958:	48 83 ec 08          	sub    $0x8,%rsp
  a5095c:	49 89 e9             	mov    %rbp,%r9
  a5095f:	49 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%r8
  a50966:	41 54                	push   %r12
  a50968:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  a5096d:	e8 3e 19 00 00       	callq  a522b0 <handle_cmdline_files>
  a50972:	5a                   	pop    %rdx
  a50973:	59                   	pop    %rcx
  a50974:	48 85 c0             	test   %rax,%rax
  a50977:	75 6f                	jne    a509e8 <make_boot_params+0x328>
  a50979:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  a5097e:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  a50983:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
  a50988:	89 93 18 02 00 00    	mov    %edx,0x218(%rbx)
  a5098e:	48 c1 ea 20          	shr    $0x20,%rdx
  a50992:	89 83 1c 02 00 00    	mov    %eax,0x21c(%rbx)
  a50998:	48 c1 e8 20          	shr    $0x20,%rax
  a5099c:	41 89 80 c4 00 00 00 	mov    %eax,0xc4(%r8)
  a509a3:	4c 89 c0             	mov    %r8,%rax
  a509a6:	41 89 90 c0 00 00 00 	mov    %edx,0xc0(%r8)
  a509ad:	48 83 c4 40          	add    $0x40,%rsp
  a509b1:	5b                   	pop    %rbx
  a509b2:	5d                   	pop    %rbp
  a509b3:	41 5c                	pop    %r12
  a509b5:	c3                   	retq   
  a509b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a509bd:	00 00 00 
  a509c0:	48 8b 3d c1 cf 01 00 	mov    0x1cfc1(%rip),%rdi        # a6d988 <sys_table>
  a509c7:	48 8d 35 b2 3d 00 00 	lea    0x3db2(%rip),%rsi        # a54780 <efi_MemoryOverWriteRequest_name+0x460>
  a509ce:	e8 cd 0f 00 00       	callq  a519a0 <efi_printk>
  a509d3:	45 31 c0             	xor    %r8d,%r8d
  a509d6:	48 83 c4 40          	add    $0x40,%rsp
  a509da:	4c 89 c0             	mov    %r8,%rax
  a509dd:	5b                   	pop    %rbx
  a509de:	5d                   	pop    %rbp
  a509df:	41 5c                	pop    %r12
  a509e1:	c3                   	retq   
  a509e2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a509e8:	48 8b 3d 99 cf 01 00 	mov    0x1cf99(%rip),%rdi        # a6d988 <sys_table>
  a509ef:	e9 dd fe ff ff       	jmpq   a508d1 <make_boot_params+0x211>
  a509f4:	0f 1f 40 00          	nopl   0x0(%rax)
  a509f8:	48 8b 3d 89 cf 01 00 	mov    0x1cf89(%rip),%rdi        # a6d988 <sys_table>
  a509ff:	48 8d 35 aa 3d 00 00 	lea    0x3daa(%rip),%rsi        # a547b0 <efi_MemoryOverWriteRequest_name+0x490>
  a50a06:	e8 95 0f 00 00       	callq  a519a0 <efi_printk>
  a50a0b:	45 31 c0             	xor    %r8d,%r8d
  a50a0e:	48 83 c4 40          	add    $0x40,%rsp
  a50a12:	4c 89 c0             	mov    %r8,%rax
  a50a15:	5b                   	pop    %rbx
  a50a16:	5d                   	pop    %rbp
  a50a17:	41 5c                	pop    %r12
  a50a19:	c3                   	retq   
  a50a1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000a50a20 <efi_main>:
  a50a20:	f3 0f 1e fa          	endbr64 
  a50a24:	41 57                	push   %r15
  a50a26:	41 56                	push   %r14
  a50a28:	41 55                	push   %r13
  a50a2a:	41 54                	push   %r12
  a50a2c:	55                   	push   %rbp
  a50a2d:	53                   	push   %rbx
  a50a2e:	48 81 ec 18 01 00 00 	sub    $0x118,%rsp
  a50a35:	48 8b 07             	mov    (%rdi),%rax
  a50a38:	4c 8b 47 08          	mov    0x8(%rdi),%r8
  a50a3c:	48 89 3d 3d cf 01 00 	mov    %rdi,0x1cf3d(%rip)        # a6d980 <efi_early>
  a50a43:	48 c7 44 24 48 00 00 	movq   $0x0,0x48(%rsp)
  a50a4a:	00 00 
  a50a4c:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  a50a51:	48 b8 49 42 49 20 53 	movabs $0x5453595320494249,%rax
  a50a58:	59 53 54 
  a50a5b:	4c 89 05 26 cf 01 00 	mov    %r8,0x1cf26(%rip)        # a6d988 <sys_table>
  a50a62:	49 39 00             	cmp    %rax,(%r8)
  a50a65:	0f 85 ff 03 00 00    	jne    a50e6a <efi_main+0x44a>
  a50a6b:	80 7f 30 00          	cmpb   $0x0,0x30(%rdi)
  a50a6f:	48 89 f3             	mov    %rsi,%rbx
  a50a72:	0f 85 18 04 00 00    	jne    a50e90 <efi_main+0x470>
  a50a78:	41 8b 40 38          	mov    0x38(%r8),%eax
  a50a7c:	48 89 47 10          	mov    %rax,0x10(%rdi)
  a50a80:	41 8b 40 3c          	mov    0x3c(%r8),%eax
  a50a84:	48 89 47 18          	mov    %rax,0x18(%rdi)
  a50a88:	41 8b 40 2c          	mov    0x2c(%r8),%eax
  a50a8c:	48 89 47 20          	mov    %rax,0x20(%rdi)
  a50a90:	8b bb c8 00 00 00    	mov    0xc8(%rbx),%edi
  a50a96:	8b 83 28 02 00 00    	mov    0x228(%rbx),%eax
  a50a9c:	48 c1 e7 20          	shl    $0x20,%rdi
  a50aa0:	48 09 c7             	or     %rax,%rdi
  a50aa3:	e8 a8 16 00 00       	callq  a52150 <efi_parse_options>
  a50aa8:	80 bb ec 01 00 00 00 	cmpb   $0x0,0x1ec(%rbx)
  a50aaf:	0f 84 ab 09 00 00    	je     a51460 <efi_main+0xa40>
  a50ab5:	48 8b 3d cc ce 01 00 	mov    0x1cecc(%rip),%rdi        # a6d988 <sys_table>
  a50abc:	e8 cf 2f 00 00       	callq  a53a90 <efi_enable_reset_attack_mitigation>
  a50ac1:	48 8b 3d c0 ce 01 00 	mov    0x1cec0(%rip),%rdi        # a6d988 <sys_table>
  a50ac8:	e8 93 30 00 00       	callq  a53b60 <efi_retrieve_tpm2_eventlog>
  a50acd:	48 89 df             	mov    %rbx,%rdi
  a50ad0:	e8 2b f7 ff ff       	callq  a50200 <setup_graphics>
  a50ad5:	48 b8 00 b2 f5 4c b8 	movabs $0x4ca568b84cf5b200,%rax
  a50adc:	68 a5 4c 
  a50adf:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  a50ae6:	00 
  a50ae7:	48 b8 9e ec b2 3e 3f 	movabs $0x9a02503f3eb2ec9e,%rax
  a50aee:	50 02 9a 
  a50af1:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
  a50af8:	00 
  a50af9:	48 8b 05 80 ce 01 00 	mov    0x1ce80(%rip),%rax        # a6d980 <efi_early>
  a50b00:	48 c7 84 24 90 00 00 	movq   $0x0,0x90(%rsp)
  a50b07:	00 00 00 00 00 
  a50b0c:	48 c7 84 24 98 00 00 	movq   $0x0,0x98(%rsp)
  a50b13:	00 00 00 00 00 
  a50b18:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a50b1c:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a50b20:	48 8b 40 18          	mov    0x18(%rax),%rax
  a50b24:	0f 84 a6 06 00 00    	je     a511d0 <efi_main+0x7b0>
  a50b2a:	48 8b b8 b0 00 00 00 	mov    0xb0(%rax),%rdi
  a50b31:	48 8d 84 24 98 00 00 	lea    0x98(%rsp),%rax
  a50b38:	00 
  a50b39:	4c 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%r14
  a50b40:	00 
  a50b41:	45 31 c9             	xor    %r9d,%r9d
  a50b44:	31 c9                	xor    %ecx,%ecx
  a50b46:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
  a50b4b:	49 89 c0             	mov    %rax,%r8
  a50b4e:	4c 89 f2             	mov    %r14,%rdx
  a50b51:	be 02 00 00 00       	mov    $0x2,%esi
  a50b56:	31 c0                	xor    %eax,%eax
  a50b58:	41 ff d2             	callq  *%r10
  a50b5b:	48 89 c5             	mov    %rax,%rbp
  a50b5e:	48 b8 05 00 00 00 00 	movabs $0x8000000000000005,%rax
  a50b65:	00 00 80 
  a50b68:	48 39 c5             	cmp    %rax,%rbp
  a50b6b:	0f 84 c7 06 00 00    	je     a51238 <efi_main+0x818>
  a50b71:	48 8b 05 08 ce 01 00 	mov    0x1ce08(%rip),%rax        # a6d980 <efi_early>
  a50b78:	48 8b b4 24 90 00 00 	mov    0x90(%rsp),%rsi
  a50b7f:	00 
  a50b80:	0f b6 48 30          	movzbl 0x30(%rax),%ecx
  a50b84:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a50b88:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a50b8c:	48 85 ed             	test   %rbp,%rbp
  a50b8f:	0f 85 d8 05 00 00    	jne    a5116d <efi_main+0x74d>
  a50b95:	4c 8b ab 50 02 00 00 	mov    0x250(%rbx),%r13
  a50b9c:	4d 85 ed             	test   %r13,%r13
  a50b9f:	75 0a                	jne    a50bab <efi_main+0x18b>
  a50ba1:	eb 11                	jmp    a50bb4 <efi_main+0x194>
  a50ba3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a50ba8:	49 89 c5             	mov    %rax,%r13
  a50bab:	49 8b 45 00          	mov    0x0(%r13),%rax
  a50baf:	48 85 c0             	test   %rax,%rax
  a50bb2:	75 f4                	jne    a50ba8 <efi_main+0x188>
  a50bb4:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  a50bbb:	00 
  a50bbc:	84 c9                	test   %cl,%cl
  a50bbe:	0f 84 cc 08 00 00    	je     a51490 <efi_main+0xa70>
  a50bc4:	48 89 c7             	mov    %rax,%rdi
  a50bc7:	48 c1 ef 03          	shr    $0x3,%rdi
  a50bcb:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
  a50bd0:	48 83 f8 07          	cmp    $0x7,%rax
  a50bd4:	0f 86 d6 02 00 00    	jbe    a50eb0 <efi_main+0x490>
  a50bda:	48 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%rax
  a50be1:	00 
  a50be2:	4c 89 6c 24 18       	mov    %r13,0x18(%rsp)
  a50be7:	4c 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%r15
  a50bee:	00 
  a50bef:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  a50bf4:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
  a50bf9:	e9 2f 02 00 00       	jmpq   a50e2d <efi_main+0x40d>
  a50bfe:	66 90                	xchg   %ax,%ax
  a50c00:	48 8b 34 ee          	mov    (%rsi,%rbp,8),%rsi
  a50c04:	48 8b ba 98 00 00 00 	mov    0x98(%rdx),%rdi
  a50c0b:	31 c0                	xor    %eax,%eax
  a50c0d:	4c 89 f9             	mov    %r15,%rcx
  a50c10:	4c 89 f2             	mov    %r14,%rdx
  a50c13:	41 ff d0             	callq  *%r8
  a50c16:	48 85 c0             	test   %rax,%rax
  a50c19:	0f 85 e4 01 00 00    	jne    a50e03 <efi_main+0x3e3>
  a50c1f:	48 8b 05 5a cd 01 00 	mov    0x1cd5a(%rip),%rax        # a6d980 <efi_early>
  a50c26:	4c 8b a4 24 a0 00 00 	mov    0xa0(%rsp),%r12
  a50c2d:	00 
  a50c2e:	0f b6 48 30          	movzbl 0x30(%rax),%ecx
  a50c32:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a50c36:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a50c3a:	4d 85 e4             	test   %r12,%r12
  a50c3d:	0f 84 d3 01 00 00    	je     a50e16 <efi_main+0x3f6>
  a50c43:	48 c7 84 24 b0 00 00 	movq   $0x0,0xb0(%rsp)
  a50c4a:	00 00 00 00 00 
  a50c4f:	84 c9                	test   %cl,%cl
  a50c51:	0f 84 f9 04 00 00    	je     a51150 <efi_main+0x730>
  a50c57:	49 8b 84 24 98 00 00 	mov    0x98(%r12),%rax
  a50c5e:	00 
  a50c5f:	4d 8b ac 24 90 00 00 	mov    0x90(%r12),%r13
  a50c66:	00 
  a50c67:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a50c6c:	48 83 7c 24 08 00    	cmpq   $0x0,0x8(%rsp)
  a50c72:	0f 84 9e 01 00 00    	je     a50e16 <efi_main+0x3f6>
  a50c78:	4d 85 ed             	test   %r13,%r13
  a50c7b:	0f 84 95 01 00 00    	je     a50e16 <efi_main+0x3f6>
  a50c81:	49 81 fd 00 00 00 01 	cmp    $0x1000000,%r13
  a50c88:	0f 87 88 01 00 00    	ja     a50e16 <efi_main+0x3f6>
  a50c8e:	49 8d 5d 40          	lea    0x40(%r13),%rbx
  a50c92:	84 c9                	test   %cl,%cl
  a50c94:	0f 84 e6 04 00 00    	je     a51180 <efi_main+0x760>
  a50c9a:	48 8b 7a 40          	mov    0x40(%rdx),%rdi
  a50c9e:	31 c0                	xor    %eax,%eax
  a50ca0:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  a50ca5:	48 89 da             	mov    %rbx,%rdx
  a50ca8:	be 02 00 00 00       	mov    $0x2,%esi
  a50cad:	41 ff d0             	callq  *%r8
  a50cb0:	48 85 c0             	test   %rax,%rax
  a50cb3:	0f 85 27 05 00 00    	jne    a511e0 <efi_main+0x7c0>
  a50cb9:	48 8b 94 24 b0 00 00 	mov    0xb0(%rsp),%rdx
  a50cc0:	00 
  a50cc1:	83 eb 10             	sub    $0x10,%ebx
  a50cc4:	48 8d 7a 08          	lea    0x8(%rdx),%rdi
  a50cc8:	48 c7 02 00 00 00 00 	movq   $0x0,(%rdx)
  a50ccf:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  a50cd3:	48 c7 42 38 00 00 00 	movq   $0x0,0x38(%rdx)
  a50cda:	00 
  a50cdb:	48 29 fa             	sub    %rdi,%rdx
  a50cde:	8d 4a 40             	lea    0x40(%rdx),%ecx
  a50ce1:	c1 e9 03             	shr    $0x3,%ecx
  a50ce4:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  a50ce7:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
  a50cee:	00 
  a50cef:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%rax)
  a50cf6:	89 58 0c             	mov    %ebx,0xc(%rax)
  a50cf9:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  a50d00:	48 8b 9c 24 b0 00 00 	mov    0xb0(%rsp),%rbx
  a50d07:	00 
  a50d08:	49 8b 84 24 90 00 00 	mov    0x90(%r12),%rax
  a50d0f:	00 
  a50d10:	4c 8d 4b 10          	lea    0x10(%rbx),%r9
  a50d14:	48 89 43 18          	mov    %rax,0x18(%rbx)
  a50d18:	48 8b 05 61 cc 01 00 	mov    0x1cc61(%rip),%rax        # a6d980 <efi_early>
  a50d1f:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a50d23:	4c 8b 58 28          	mov    0x28(%rax),%r11
  a50d27:	0f 84 d3 04 00 00    	je     a51200 <efi_main+0x7e0>
  a50d2d:	49 8b 7c 24 30       	mov    0x30(%r12),%rdi
  a50d32:	31 c9                	xor    %ecx,%ecx
  a50d34:	31 c0                	xor    %eax,%eax
  a50d36:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  a50d3c:	ba 01 00 00 00       	mov    $0x1,%edx
  a50d41:	4c 89 e6             	mov    %r12,%rsi
  a50d44:	41 ff d3             	callq  *%r11
  a50d47:	48 85 c0             	test   %rax,%rax
  a50d4a:	0f 85 f0 08 00 00    	jne    a51640 <efi_main+0xc20>
  a50d50:	48 8b 05 29 cc 01 00 	mov    0x1cc29(%rip),%rax        # a6d980 <efi_early>
  a50d57:	48 8b b4 24 b0 00 00 	mov    0xb0(%rsp),%rsi
  a50d5e:	00 
  a50d5f:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a50d63:	4c 8b 58 28          	mov    0x28(%rax),%r11
  a50d67:	4c 8d 4e 12          	lea    0x12(%rsi),%r9
  a50d6b:	0f 84 b7 04 00 00    	je     a51228 <efi_main+0x808>
  a50d71:	49 8b 7c 24 30       	mov    0x30(%r12),%rdi
  a50d76:	31 c0                	xor    %eax,%eax
  a50d78:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  a50d7e:	b9 02 00 00 00       	mov    $0x2,%ecx
  a50d83:	4c 89 e6             	mov    %r12,%rsi
  a50d86:	ba 01 00 00 00       	mov    $0x1,%edx
  a50d8b:	41 ff d3             	callq  *%r11
  a50d8e:	48 85 c0             	test   %rax,%rax
  a50d91:	0f 85 59 09 00 00    	jne    a516f0 <efi_main+0xcd0>
  a50d97:	48 8b 94 24 b0 00 00 	mov    0xb0(%rsp),%rdx
  a50d9e:	00 
  a50d9f:	48 8b 05 da cb 01 00 	mov    0x1cbda(%rip),%rax        # a6d980 <efi_early>
  a50da6:	4c 8d 4a 38          	lea    0x38(%rdx),%r9
  a50daa:	4c 8d 42 30          	lea    0x30(%rdx),%r8
  a50dae:	4c 8b 58 28          	mov    0x28(%rax),%r11
  a50db2:	48 8d 4a 28          	lea    0x28(%rdx),%rcx
  a50db6:	48 83 c2 20          	add    $0x20,%rdx
  a50dba:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a50dbe:	0f 84 ec 06 00 00    	je     a514b0 <efi_main+0xa90>
  a50dc4:	49 8b 7c 24 70       	mov    0x70(%r12),%rdi
  a50dc9:	31 c0                	xor    %eax,%eax
  a50dcb:	4c 89 e6             	mov    %r12,%rsi
  a50dce:	41 ff d3             	callq  *%r11
  a50dd1:	48 85 c0             	test   %rax,%rax
  a50dd4:	0f 84 26 03 00 00    	je     a51100 <efi_main+0x6e0>
  a50dda:	48 8b 05 9f cb 01 00 	mov    0x1cb9f(%rip),%rax        # a6d980 <efi_early>
  a50de1:	48 8b b4 24 b0 00 00 	mov    0xb0(%rsp),%rsi
  a50de8:	00 
  a50de9:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a50ded:	48 8b 50 28          	mov    0x28(%rax),%rdx
  a50df1:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a50df5:	0f 84 85 06 00 00    	je     a51480 <efi_main+0xa60>
  a50dfb:	48 8b 79 48          	mov    0x48(%rcx),%rdi
  a50dff:	31 c0                	xor    %eax,%eax
  a50e01:	ff d2                	callq  *%rdx
  a50e03:	48 8b 05 76 cb 01 00 	mov    0x1cb76(%rip),%rax        # a6d980 <efi_early>
  a50e0a:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a50e0e:	0f b6 48 30          	movzbl 0x30(%rax),%ecx
  a50e12:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a50e16:	48 8b b4 24 90 00 00 	mov    0x90(%rsp),%rsi
  a50e1d:	00 
  a50e1e:	48 83 c5 01          	add    $0x1,%rbp
  a50e22:	48 3b 6c 24 10       	cmp    0x10(%rsp),%rbp
  a50e27:	0f 83 3b 03 00 00    	jae    a51168 <efi_main+0x748>
  a50e2d:	48 c7 84 24 a0 00 00 	movq   $0x0,0xa0(%rsp)
  a50e34:	00 00 00 00 00 
  a50e39:	84 c9                	test   %cl,%cl
  a50e3b:	0f 85 bf fd ff ff    	jne    a50c00 <efi_main+0x1e0>
  a50e41:	8b 34 ae             	mov    (%rsi,%rbp,4),%esi
  a50e44:	8b 7a 58             	mov    0x58(%rdx),%edi
  a50e47:	e9 bf fd ff ff       	jmpq   a50c0b <efi_main+0x1eb>
  a50e4c:	0f 1f 40 00          	nopl   0x0(%rax)
  a50e50:	48 8b 3d 31 cb 01 00 	mov    0x1cb31(%rip),%rdi        # a6d988 <sys_table>
  a50e57:	48 8d 35 5a 3a 00 00 	lea    0x3a5a(%rip),%rsi        # a548b8 <efi_MemoryOverWriteRequest_name+0x598>
  a50e5e:	e8 3d 0b 00 00       	callq  a519a0 <efi_printk>
  a50e63:	4c 8b 05 1e cb 01 00 	mov    0x1cb1e(%rip),%r8        # a6d988 <sys_table>
  a50e6a:	48 8d 35 fd 3a 00 00 	lea    0x3afd(%rip),%rsi        # a5496e <efi_MemoryOverWriteRequest_name+0x64e>
  a50e71:	4c 89 c7             	mov    %r8,%rdi
  a50e74:	e8 27 0b 00 00       	callq  a519a0 <efi_printk>
  a50e79:	31 c0                	xor    %eax,%eax
  a50e7b:	48 81 c4 18 01 00 00 	add    $0x118,%rsp
  a50e82:	5b                   	pop    %rbx
  a50e83:	5d                   	pop    %rbp
  a50e84:	41 5c                	pop    %r12
  a50e86:	41 5d                	pop    %r13
  a50e88:	41 5e                	pop    %r14
  a50e8a:	41 5f                	pop    %r15
  a50e8c:	c3                   	retq   
  a50e8d:	0f 1f 00             	nopl   (%rax)
  a50e90:	49 8b 40 58          	mov    0x58(%r8),%rax
  a50e94:	48 89 47 10          	mov    %rax,0x10(%rdi)
  a50e98:	49 8b 40 60          	mov    0x60(%r8),%rax
  a50e9c:	48 89 47 18          	mov    %rax,0x18(%rdi)
  a50ea0:	49 8b 40 40          	mov    0x40(%r8),%rax
  a50ea4:	48 89 47 20          	mov    %rax,0x20(%rdi)
  a50ea8:	e9 e3 fb ff ff       	jmpq   a50a90 <efi_main+0x70>
  a50ead:	0f 1f 00             	nopl   (%rax)
  a50eb0:	48 8b 7a 48          	mov    0x48(%rdx),%rdi
  a50eb4:	31 c0                	xor    %eax,%eax
  a50eb6:	41 ff d0             	callq  *%r8
  a50eb9:	48 8b 05 c0 ca 01 00 	mov    0x1cac0(%rip),%rax        # a6d980 <efi_early>
  a50ec0:	48 8b 0d c1 ca 01 00 	mov    0x1cac1(%rip),%rcx        # a6d988 <sys_table>
  a50ec7:	0f b6 50 30          	movzbl 0x30(%rax),%edx
  a50ecb:	84 d2                	test   %dl,%dl
  a50ecd:	0f 84 cd 02 00 00    	je     a511a0 <efi_main+0x780>
  a50ed3:	48 8b 49 18          	mov    0x18(%rcx),%rcx
  a50ed7:	48 8b 35 a2 33 00 00 	mov    0x33a2(%rip),%rsi        # a54280 <apple>
  a50ede:	48 39 31             	cmp    %rsi,(%rcx)
  a50ee1:	0f 84 cc 02 00 00    	je     a511b3 <efi_main+0x793>
  a50ee7:	b9 01 00 00 00       	mov    $0x1,%ecx
  a50eec:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a50ef0:	48 8b 40 18          	mov    0x18(%rax),%rax
  a50ef4:	85 c9                	test   %ecx,%ecx
  a50ef6:	0f 84 c4 03 00 00    	je     a512c0 <efi_main+0x8a0>
  a50efc:	84 d2                	test   %dl,%dl
  a50efe:	0f 84 8c 02 00 00    	je     a51190 <efi_main+0x770>
  a50f04:	48 8b 78 40          	mov    0x40(%rax),%rdi
  a50f08:	31 c0                	xor    %eax,%eax
  a50f0a:	48 8d 4c 24 48       	lea    0x48(%rsp),%rcx
  a50f0f:	ba 0a 00 00 00       	mov    $0xa,%edx
  a50f14:	be 02 00 00 00       	mov    $0x2,%esi
  a50f19:	41 ff d0             	callq  *%r8
  a50f1c:	48 85 c0             	test   %rax,%rax
  a50f1f:	0f 85 2b ff ff ff    	jne    a50e50 <efi_main+0x430>
  a50f25:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
  a50f2a:	ba 00 08 00 00       	mov    $0x800,%edx
  a50f2f:	48 8b 3d 52 ca 01 00 	mov    0x1ca52(%rip),%rdi        # a6d988 <sys_table>
  a50f36:	66 89 10             	mov    %dx,(%rax)
  a50f39:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
  a50f3e:	ba 08 00 00 00       	mov    $0x8,%edx
  a50f43:	0f b7 30             	movzwl (%rax),%esi
  a50f46:	48 8d 48 02          	lea    0x2(%rax),%rcx
  a50f4a:	e8 91 0f 00 00       	callq  a51ee0 <efi_low_alloc>
  a50f4f:	48 85 c0             	test   %rax,%rax
  a50f52:	0f 85 68 08 00 00    	jne    a517c0 <efi_main+0xda0>
  a50f58:	4c 8b 83 58 02 00 00 	mov    0x258(%rbx),%r8
  a50f5f:	8b 83 14 02 00 00    	mov    0x214(%rbx),%eax
  a50f65:	48 8b 3d 1c ca 01 00 	mov    0x1ca1c(%rip),%rdi        # a6d988 <sys_table>
  a50f6c:	49 39 c0             	cmp    %rax,%r8
  a50f6f:	74 4b                	je     a50fbc <efi_main+0x59c>
  a50f71:	8b 93 60 02 00 00    	mov    0x260(%rbx),%edx
  a50f77:	44 8b 8b 30 02 00 00 	mov    0x230(%rbx),%r9d
  a50f7e:	4c 89 f6             	mov    %r14,%rsi
  a50f81:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  a50f88:	00 
  a50f89:	48 89 d1             	mov    %rdx,%rcx
  a50f8c:	e8 0f 1c 00 00       	callq  a52ba0 <efi_relocate_kernel>
  a50f91:	48 85 c0             	test   %rax,%rax
  a50f94:	0f 85 9e 08 00 00    	jne    a51838 <efi_main+0xe18>
  a50f9a:	8b 83 14 02 00 00    	mov    0x214(%rbx),%eax
  a50fa0:	48 8b 3d e1 c9 01 00 	mov    0x1c9e1(%rip),%rdi        # a6d988 <sys_table>
  a50fa7:	48 89 83 58 02 00 00 	mov    %rax,0x258(%rbx)
  a50fae:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  a50fb5:	00 
  a50fb6:	89 83 14 02 00 00    	mov    %eax,0x214(%rbx)
  a50fbc:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
  a50fc1:	4c 89 f6             	mov    %r14,%rsi
  a50fc4:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
  a50fcb:	00 00 
  a50fcd:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
  a50fd4:	00 
  a50fd5:	48 8d 44 24 50       	lea    0x50(%rsp),%rax
  a50fda:	48 89 84 24 b8 00 00 	mov    %rax,0xb8(%rsp)
  a50fe1:	00 
  a50fe2:	48 8d 44 24 60       	lea    0x60(%rsp),%rax
  a50fe7:	48 89 84 24 c0 00 00 	mov    %rax,0xc0(%rsp)
  a50fee:	00 
  a50fef:	48 8d 44 24 44       	lea    0x44(%rsp),%rax
  a50ff4:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
  a50ffb:	00 
  a50ffc:	48 8d 44 24 58       	lea    0x58(%rsp),%rax
  a51001:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
  a51008:	00 
  a51009:	48 8d 44 24 68       	lea    0x68(%rsp),%rax
  a5100e:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
  a51015:	00 
  a51016:	48 8d 83 c0 01 00 00 	lea    0x1c0(%rbx),%rax
  a5101d:	48 89 84 24 a8 00 00 	mov    %rax,0xa8(%rsp)
  a51024:	00 
  a51025:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  a5102a:	48 89 9c 24 a0 00 00 	mov    %rbx,0xa0(%rsp)
  a51031:	00 
  a51032:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  a51039:	00 
  a5103a:	48 8d 84 24 80 00 00 	lea    0x80(%rsp),%rax
  a51041:	00 
  a51042:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
  a51049:	00 
  a5104a:	48 8d 84 24 88 00 00 	lea    0x88(%rsp),%rax
  a51051:	00 
  a51052:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
  a51059:	00 
  a5105a:	48 8d 84 24 90 00 00 	lea    0x90(%rsp),%rax
  a51061:	00 
  a51062:	48 c7 84 24 f8 00 00 	movq   $0x0,0xf8(%rsp)
  a51069:	00 00 00 00 00 
  a5106e:	48 c7 84 24 00 01 00 	movq   $0x0,0x100(%rsp)
  a51075:	00 00 00 00 00 
  a5107a:	48 89 84 24 08 01 00 	mov    %rax,0x108(%rsp)
  a51081:	00 
  a51082:	e8 a9 09 00 00       	callq  a51a30 <efi_get_memory_map>
  a51087:	48 85 c0             	test   %rax,%rax
  a5108a:	75 50                	jne    a510dc <efi_main+0x6bc>
  a5108c:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
  a51093:	00 
  a51094:	31 d2                	xor    %edx,%edx
  a51096:	31 ed                	xor    %ebp,%ebp
  a51098:	48 f7 b4 24 88 00 00 	divq   0x88(%rsp)
  a5109f:	00 
  a510a0:	3d 80 00 00 00       	cmp    $0x80,%eax
  a510a5:	0f 87 bd 05 00 00    	ja     a51668 <efi_main+0xc48>
  a510ab:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
  a510b0:	48 8b 3d d1 c8 01 00 	mov    0x1c8d1(%rip),%rdi        # a6d988 <sys_table>
  a510b7:	48 8d 8c 24 a0 00 00 	lea    0xa0(%rsp),%rcx
  a510be:	00 
  a510bf:	48 8d 94 24 b0 00 00 	lea    0xb0(%rsp),%rdx
  a510c6:	00 
  a510c7:	4c 8d 05 72 f0 ff ff 	lea    -0xf8e(%rip),%r8        # a50140 <exit_boot_func>
  a510ce:	e8 7d 1e 00 00       	callq  a52f50 <efi_exit_boot_services>
  a510d3:	48 85 c0             	test   %rax,%rax
  a510d6:	0f 84 f4 03 00 00    	je     a514d0 <efi_main+0xab0>
  a510dc:	48 8b 3d a5 c8 01 00 	mov    0x1c8a5(%rip),%rdi        # a6d988 <sys_table>
  a510e3:	48 8d 35 98 38 00 00 	lea    0x3898(%rip),%rsi        # a54982 <efi_MemoryOverWriteRequest_name+0x662>
  a510ea:	e8 b1 08 00 00       	callq  a519a0 <efi_printk>
  a510ef:	4c 8b 05 92 c8 01 00 	mov    0x1c892(%rip),%r8        # a6d988 <sys_table>
  a510f6:	e9 6f fd ff ff       	jmpq   a50e6a <efi_main+0x44a>
  a510fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a51100:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
  a51107:	00 
  a51108:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  a5110d:	4c 89 ea             	mov    %r13,%rdx
  a51110:	48 8d 78 40          	lea    0x40(%rax),%rdi
  a51114:	e8 a7 cb ff ff       	callq  a4dcc0 <memcpy>
  a51119:	48 83 7c 24 18 00    	cmpq   $0x0,0x18(%rsp)
  a5111f:	0f 84 eb 00 00 00    	je     a51210 <efi_main+0x7f0>
  a51125:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  a5112a:	48 89 18             	mov    %rbx,(%rax)
  a5112d:	48 8b 05 4c c8 01 00 	mov    0x1c84c(%rip),%rax        # a6d980 <efi_early>
  a51134:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
  a51139:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a5113d:	0f b6 48 30          	movzbl 0x30(%rax),%ecx
  a51141:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a51145:	e9 cc fc ff ff       	jmpq   a50e16 <efi_main+0x3f6>
  a5114a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a51150:	41 8b 44 24 50       	mov    0x50(%r12),%eax
  a51155:	4d 8b 6c 24 48       	mov    0x48(%r12),%r13
  a5115a:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a5115f:	e9 08 fb ff ff       	jmpq   a50c6c <efi_main+0x24c>
  a51164:	0f 1f 40 00          	nopl   0x0(%rax)
  a51168:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
  a5116d:	84 c9                	test   %cl,%cl
  a5116f:	0f 85 3b fd ff ff    	jne    a50eb0 <efi_main+0x490>
  a51175:	8b 7a 30             	mov    0x30(%rdx),%edi
  a51178:	e9 37 fd ff ff       	jmpq   a50eb4 <efi_main+0x494>
  a5117d:	0f 1f 00             	nopl   (%rax)
  a51180:	8b 7a 2c             	mov    0x2c(%rdx),%edi
  a51183:	e9 16 fb ff ff       	jmpq   a50c9e <efi_main+0x27e>
  a51188:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5118f:	00 
  a51190:	8b 78 2c             	mov    0x2c(%rax),%edi
  a51193:	e9 70 fd ff ff       	jmpq   a50f08 <efi_main+0x4e8>
  a51198:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5119f:	00 
  a511a0:	8b 49 18             	mov    0x18(%rcx),%ecx
  a511a3:	48 8b 35 d6 30 00 00 	mov    0x30d6(%rip),%rsi        # a54280 <apple>
  a511aa:	48 39 31             	cmp    %rsi,(%rcx)
  a511ad:	0f 85 34 fd ff ff    	jne    a50ee7 <efi_main+0x4c7>
  a511b3:	8b 35 cf 30 00 00    	mov    0x30cf(%rip),%esi        # a54288 <apple+0x8>
  a511b9:	39 71 08             	cmp    %esi,0x8(%rcx)
  a511bc:	0f 85 25 fd ff ff    	jne    a50ee7 <efi_main+0x4c7>
  a511c2:	31 c9                	xor    %ecx,%ecx
  a511c4:	e9 23 fd ff ff       	jmpq   a50eec <efi_main+0x4cc>
  a511c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a511d0:	8b 78 64             	mov    0x64(%rax),%edi
  a511d3:	e9 59 f9 ff ff       	jmpq   a50b31 <efi_main+0x111>
  a511d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a511df:	00 
  a511e0:	48 8b 3d a1 c7 01 00 	mov    0x1c7a1(%rip),%rdi        # a6d988 <sys_table>
  a511e7:	48 8d 35 4a 36 00 00 	lea    0x364a(%rip),%rsi        # a54838 <efi_MemoryOverWriteRequest_name+0x518>
  a511ee:	e8 ad 07 00 00       	callq  a519a0 <efi_printk>
  a511f3:	e9 0b fc ff ff       	jmpq   a50e03 <efi_main+0x3e3>
  a511f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a511ff:	00 
  a51200:	41 8b 7c 24 18       	mov    0x18(%r12),%edi
  a51205:	e9 28 fb ff ff       	jmpq   a50d32 <efi_main+0x312>
  a5120a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a51210:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  a51215:	48 89 98 50 02 00 00 	mov    %rbx,0x250(%rax)
  a5121c:	e9 0c ff ff ff       	jmpq   a5112d <efi_main+0x70d>
  a51221:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a51228:	41 8b 7c 24 18       	mov    0x18(%r12),%edi
  a5122d:	e9 44 fb ff ff       	jmpq   a50d76 <efi_main+0x356>
  a51232:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a51238:	48 8b 05 41 c7 01 00 	mov    0x1c741(%rip),%rax        # a6d980 <efi_early>
  a5123f:	48 8b 94 24 98 00 00 	mov    0x98(%rsp),%rdx
  a51246:	00 
  a51247:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a5124b:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a5124f:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a51253:	0f 85 67 02 00 00    	jne    a514c0 <efi_main+0xaa0>
  a51259:	8b 79 2c             	mov    0x2c(%rcx),%edi
  a5125c:	31 c0                	xor    %eax,%eax
  a5125e:	48 8d 8c 24 90 00 00 	lea    0x90(%rsp),%rcx
  a51265:	00 
  a51266:	be 02 00 00 00       	mov    $0x2,%esi
  a5126b:	41 ff d0             	callq  *%r8
  a5126e:	48 85 c0             	test   %rax,%rax
  a51271:	0f 85 91 05 00 00    	jne    a51808 <efi_main+0xde8>
  a51277:	48 8b 05 02 c7 01 00 	mov    0x1c702(%rip),%rax        # a6d980 <efi_early>
  a5127e:	4c 8b 8c 24 90 00 00 	mov    0x90(%rsp),%r9
  a51285:	00 
  a51286:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a5128a:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a5128e:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a51292:	0f 84 78 04 00 00    	je     a51710 <efi_main+0xcf0>
  a51298:	48 8b ba b0 00 00 00 	mov    0xb0(%rdx),%rdi
  a5129f:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
  a512a4:	31 c9                	xor    %ecx,%ecx
  a512a6:	4c 89 f2             	mov    %r14,%rdx
  a512a9:	be 02 00 00 00       	mov    $0x2,%esi
  a512ae:	31 c0                	xor    %eax,%eax
  a512b0:	41 ff d2             	callq  *%r10
  a512b3:	48 89 c5             	mov    %rax,%rbp
  a512b6:	e9 b6 f8 ff ff       	jmpq   a50b71 <efi_main+0x151>
  a512bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a512c0:	48 be fe 12 bd 91 c3 	movabs $0x44fbf6c391bd12fe,%rsi
  a512c7:	f6 fb 44 
  a512ca:	48 b9 a5 b7 51 22 ab 	movabs $0xe03a30ab2251b7a5,%rcx
  a512d1:	30 3a e0 
  a512d4:	c7 84 24 98 00 00 00 	movl   $0x0,0x98(%rsp)
  a512db:	00 00 00 00 
  a512df:	48 89 b4 24 e0 00 00 	mov    %rsi,0xe0(%rsp)
  a512e6:	00 
  a512e7:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
  a512ee:	00 
  a512ef:	84 d2                	test   %dl,%dl
  a512f1:	0f 85 b9 02 00 00    	jne    a515b0 <efi_main+0xb90>
  a512f7:	8b b8 ac 00 00 00    	mov    0xac(%rax),%edi
  a512fd:	31 d2                	xor    %edx,%edx
  a512ff:	31 c0                	xor    %eax,%eax
  a51301:	48 8d 8c 24 b0 00 00 	lea    0xb0(%rsp),%rcx
  a51308:	00 
  a51309:	4c 89 f6             	mov    %r14,%rsi
  a5130c:	41 ff d0             	callq  *%r8
  a5130f:	48 85 c0             	test   %rax,%rax
  a51312:	0f 85 28 01 00 00    	jne    a51440 <efi_main+0xa20>
  a51318:	48 8b 05 61 c6 01 00 	mov    0x1c661(%rip),%rax        # a6d980 <efi_early>
  a5131f:	48 8b b4 24 b0 00 00 	mov    0xb0(%rsp),%rsi
  a51326:	00 
  a51327:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a5132b:	0f 84 6f 04 00 00    	je     a517a0 <efi_main+0xd80>
  a51331:	48 81 3e 00 00 01 00 	cmpq   $0x10000,(%rsi)
  a51338:	0f 85 63 05 00 00    	jne    a518a1 <efi_main+0xe81>
  a5133e:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a51342:	48 8b 7e 20          	mov    0x20(%rsi),%rdi
  a51346:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  a5134b:	31 d2                	xor    %edx,%edx
  a5134d:	31 c0                	xor    %eax,%eax
  a5134f:	4c 89 e9             	mov    %r13,%rcx
  a51352:	41 ff d0             	callq  *%r8
  a51355:	8b 94 24 98 00 00 00 	mov    0x98(%rsp),%edx
  a5135c:	85 d2                	test   %edx,%edx
  a5135e:	0f 84 dc 00 00 00    	je     a51440 <efi_main+0xa20>
  a51364:	4c 8d a4 24 a0 00 00 	lea    0xa0(%rsp),%r12
  a5136b:	00 
  a5136c:	48 bd 05 00 00 00 00 	movabs $0x8000000000000005,%rbp
  a51373:	00 00 80 
  a51376:	48 8b 05 03 c6 01 00 	mov    0x1c603(%rip),%rax        # a6d980 <efi_early>
  a5137d:	48 83 c2 10          	add    $0x10,%rdx
  a51381:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a51385:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a51389:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a5138d:	0f 84 2d 02 00 00    	je     a515c0 <efi_main+0xba0>
  a51393:	48 8b 79 40          	mov    0x40(%rcx),%rdi
  a51397:	31 c0                	xor    %eax,%eax
  a51399:	4c 89 e1             	mov    %r12,%rcx
  a5139c:	be 02 00 00 00       	mov    $0x2,%esi
  a513a1:	41 ff d0             	callq  *%r8
  a513a4:	48 85 c0             	test   %rax,%rax
  a513a7:	0f 85 73 04 00 00    	jne    a51820 <efi_main+0xe00>
  a513ad:	48 8b 05 cc c5 01 00 	mov    0x1c5cc(%rip),%rax        # a6d980 <efi_early>
  a513b4:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  a513bb:	00 
  a513bc:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a513c0:	48 8d 56 10          	lea    0x10(%rsi),%rdx
  a513c4:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a513c8:	48 8b b4 24 b0 00 00 	mov    0xb0(%rsp),%rsi
  a513cf:	00 
  a513d0:	0f 84 fa 01 00 00    	je     a515d0 <efi_main+0xbb0>
  a513d6:	31 c0                	xor    %eax,%eax
  a513d8:	48 8b 7e 20          	mov    0x20(%rsi),%rdi
  a513dc:	4c 89 e9             	mov    %r13,%rcx
  a513df:	41 ff d0             	callq  *%r8
  a513e2:	48 39 e8             	cmp    %rbp,%rax
  a513e5:	0f 84 f9 01 00 00    	je     a515e4 <efi_main+0xbc4>
  a513eb:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
  a513f2:	00 
  a513f3:	c7 40 08 05 00 00 00 	movl   $0x5,0x8(%rax)
  a513fa:	8b 94 24 98 00 00 00 	mov    0x98(%rsp),%edx
  a51401:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  a51408:	89 50 0c             	mov    %edx,0xc(%rax)
  a5140b:	48 8b 93 50 02 00 00 	mov    0x250(%rbx),%rdx
  a51412:	48 85 d2             	test   %rdx,%rdx
  a51415:	0f 84 d6 03 00 00    	je     a517f1 <efi_main+0xdd1>
  a5141b:	48 8b 02             	mov    (%rdx),%rax
  a5141e:	48 85 c0             	test   %rax,%rax
  a51421:	74 10                	je     a51433 <efi_main+0xa13>
  a51423:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a51428:	48 89 c2             	mov    %rax,%rdx
  a5142b:	48 8b 00             	mov    (%rax),%rax
  a5142e:	48 85 c0             	test   %rax,%rax
  a51431:	75 f5                	jne    a51428 <efi_main+0xa08>
  a51433:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
  a5143a:	00 
  a5143b:	48 89 02             	mov    %rax,(%rdx)
  a5143e:	66 90                	xchg   %ax,%ax
  a51440:	48 8b 15 39 c5 01 00 	mov    0x1c539(%rip),%rdx        # a6d980 <efi_early>
  a51447:	4c 8b 42 28          	mov    0x28(%rdx),%r8
  a5144b:	48 8b 42 18          	mov    0x18(%rdx),%rax
  a5144f:	0f b6 52 30          	movzbl 0x30(%rdx),%edx
  a51453:	e9 a4 fa ff ff       	jmpq   a50efc <efi_main+0x4dc>
  a51458:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5145f:	00 
  a51460:	48 8b 3d 21 c5 01 00 	mov    0x1c521(%rip),%rdi        # a6d988 <sys_table>
  a51467:	e8 74 24 00 00       	callq  a538e0 <efi_get_secureboot>
  a5146c:	88 83 ec 01 00 00    	mov    %al,0x1ec(%rbx)
  a51472:	e9 3e f6 ff ff       	jmpq   a50ab5 <efi_main+0x95>
  a51477:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a5147e:	00 00 
  a51480:	8b 79 30             	mov    0x30(%rcx),%edi
  a51483:	e9 77 f9 ff ff       	jmpq   a50dff <efi_main+0x3df>
  a51488:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5148f:	00 
  a51490:	48 89 c7             	mov    %rax,%rdi
  a51493:	48 c1 ef 02          	shr    $0x2,%rdi
  a51497:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
  a5149c:	48 83 f8 03          	cmp    $0x3,%rax
  a514a0:	0f 87 34 f7 ff ff    	ja     a50bda <efi_main+0x1ba>
  a514a6:	e9 ca fc ff ff       	jmpq   a51175 <efi_main+0x755>
  a514ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a514b0:	41 8b 7c 24 38       	mov    0x38(%r12),%edi
  a514b5:	e9 0f f9 ff ff       	jmpq   a50dc9 <efi_main+0x3a9>
  a514ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a514c0:	48 8b 79 40          	mov    0x40(%rcx),%rdi
  a514c4:	e9 93 fd ff ff       	jmpq   a5125c <efi_main+0x83c>
  a514c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a514d0:	8b b3 d4 01 00 00    	mov    0x1d4(%rbx),%esi
  a514d6:	8b 8b c8 01 00 00    	mov    0x1c8(%rbx),%ecx
  a514dc:	31 d2                	xor    %edx,%edx
  a514de:	c7 83 e0 01 00 00 00 	movl   $0x8000,0x1e0(%rbx)
  a514e5:	80 00 00 
  a514e8:	4c 8b 5c 24 78       	mov    0x78(%rsp),%r11
  a514ed:	48 8d bb d0 02 00 00 	lea    0x2d0(%rbx),%rdi
  a514f4:	89 f0                	mov    %esi,%eax
  a514f6:	f7 f1                	div    %ecx
  a514f8:	39 ce                	cmp    %ecx,%esi
  a514fa:	0f 82 cb 03 00 00    	jb     a518cb <efi_main+0xeab>
  a51500:	8d 14 80             	lea    (%rax,%rax,4),%edx
  a51503:	31 f6                	xor    %esi,%esi
  a51505:	45 31 c0             	xor    %r8d,%r8d
  a51508:	45 31 d2             	xor    %r10d,%r10d
  a5150b:	44 8d 0c 95 10 00 00 	lea    0x10(,%rdx,4),%r9d
  a51512:	00 
  a51513:	4c 8d 25 26 2d 00 00 	lea    0x2d26(%rip),%r12        # a54240 <CSWTCH.184>
  a5151a:	4d 8d 6b 10          	lea    0x10(%r11),%r13
  a5151e:	eb 38                	jmp    a51558 <efi_main+0xb38>
  a51520:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  a51524:	49 89 fa             	mov    %rdi,%r10
  a51527:	41 83 c0 01          	add    $0x1,%r8d
  a5152b:	48 83 c7 14          	add    $0x14,%rdi
  a5152f:	48 89 57 ec          	mov    %rdx,-0x14(%rdi)
  a51533:	48 8b 51 18          	mov    0x18(%rcx),%rdx
  a51537:	44 89 77 fc          	mov    %r14d,-0x4(%rdi)
  a5153b:	48 c1 e2 0c          	shl    $0xc,%rdx
  a5153f:	48 89 57 f4          	mov    %rdx,-0xc(%rdi)
  a51543:	83 c6 01             	add    $0x1,%esi
  a51546:	41 83 e9 14          	sub    $0x14,%r9d
  a5154a:	39 f0                	cmp    %esi,%eax
  a5154c:	0f 86 ce 01 00 00    	jbe    a51720 <efi_main+0xd00>
  a51552:	8b 8b c8 01 00 00    	mov    0x1c8(%rbx),%ecx
  a51558:	8b 93 dc 01 00 00    	mov    0x1dc(%rbx),%edx
  a5155e:	0f af ce             	imul   %esi,%ecx
  a51561:	44 8b b3 d0 01 00 00 	mov    0x1d0(%rbx),%r14d
  a51568:	48 c1 e2 20          	shl    $0x20,%rdx
  a5156c:	4c 09 f2             	or     %r14,%rdx
  a5156f:	48 01 d1             	add    %rdx,%rcx
  a51572:	8b 11                	mov    (%rcx),%edx
  a51574:	83 fa 0e             	cmp    $0xe,%edx
  a51577:	77 ca                	ja     a51543 <efi_main+0xb23>
  a51579:	45 8b 34 94          	mov    (%r12,%rdx,4),%r14d
  a5157d:	4d 85 d2             	test   %r10,%r10
  a51580:	74 0a                	je     a5158c <efi_main+0xb6c>
  a51582:	45 3b 72 10          	cmp    0x10(%r10),%r14d
  a51586:	0f 84 8c 00 00 00    	je     a51618 <efi_main+0xbf8>
  a5158c:	41 81 f8 80 00 00 00 	cmp    $0x80,%r8d
  a51593:	75 8b                	jne    a51520 <efi_main+0xb00>
  a51595:	4d 85 db             	test   %r11,%r11
  a51598:	0f 84 3e fb ff ff    	je     a510dc <efi_main+0x6bc>
  a5159e:	44 39 cd             	cmp    %r9d,%ebp
  a515a1:	0f 82 35 fb ff ff    	jb     a510dc <efi_main+0x6bc>
  a515a7:	4c 89 ef             	mov    %r13,%rdi
  a515aa:	e9 71 ff ff ff       	jmpq   a51520 <efi_main+0xb00>
  a515af:	90                   	nop
  a515b0:	48 8b b8 40 01 00 00 	mov    0x140(%rax),%rdi
  a515b7:	e9 41 fd ff ff       	jmpq   a512fd <efi_main+0x8dd>
  a515bc:	0f 1f 40 00          	nopl   0x0(%rax)
  a515c0:	8b 79 2c             	mov    0x2c(%rcx),%edi
  a515c3:	e9 cf fd ff ff       	jmpq   a51397 <efi_main+0x977>
  a515c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a515cf:	00 
  a515d0:	31 c0                	xor    %eax,%eax
  a515d2:	8b 7e 10             	mov    0x10(%rsi),%edi
  a515d5:	4c 89 e9             	mov    %r13,%rcx
  a515d8:	41 ff d0             	callq  *%r8
  a515db:	48 39 e8             	cmp    %rbp,%rax
  a515de:	0f 85 07 fe ff ff    	jne    a513eb <efi_main+0x9cb>
  a515e4:	48 8b 05 95 c3 01 00 	mov    0x1c395(%rip),%rax        # a6d980 <efi_early>
  a515eb:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  a515f2:	00 
  a515f3:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a515f7:	48 8b 48 28          	mov    0x28(%rax),%rcx
  a515fb:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a515ff:	74 5f                	je     a51660 <efi_main+0xc40>
  a51601:	48 8b 7a 48          	mov    0x48(%rdx),%rdi
  a51605:	31 c0                	xor    %eax,%eax
  a51607:	ff d1                	callq  *%rcx
  a51609:	8b 94 24 98 00 00 00 	mov    0x98(%rsp),%edx
  a51610:	e9 61 fd ff ff       	jmpq   a51376 <efi_main+0x956>
  a51615:	0f 1f 00             	nopl   (%rax)
  a51618:	49 8b 52 08          	mov    0x8(%r10),%rdx
  a5161c:	4d 8b 3a             	mov    (%r10),%r15
  a5161f:	49 01 d7             	add    %rdx,%r15
  a51622:	4c 3b 79 08          	cmp    0x8(%rcx),%r15
  a51626:	0f 85 60 ff ff ff    	jne    a5158c <efi_main+0xb6c>
  a5162c:	48 8b 49 18          	mov    0x18(%rcx),%rcx
  a51630:	48 c1 e1 0c          	shl    $0xc,%rcx
  a51634:	48 01 ca             	add    %rcx,%rdx
  a51637:	49 89 52 08          	mov    %rdx,0x8(%r10)
  a5163b:	e9 03 ff ff ff       	jmpq   a51543 <efi_main+0xb23>
  a51640:	48 8b 3d 41 c3 01 00 	mov    0x1c341(%rip),%rdi        # a6d988 <sys_table>
  a51647:	48 8d 35 e9 32 00 00 	lea    0x32e9(%rip),%rsi        # a54937 <efi_MemoryOverWriteRequest_name+0x617>
  a5164e:	e8 4d 03 00 00       	callq  a519a0 <efi_printk>
  a51653:	e9 82 f7 ff ff       	jmpq   a50dda <efi_main+0x3ba>
  a51658:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5165f:	00 
  a51660:	8b 7a 30             	mov    0x30(%rdx),%edi
  a51663:	eb a0                	jmp    a51605 <efi_main+0xbe5>
  a51665:	0f 1f 00             	nopl   (%rax)
  a51668:	83 c0 80             	add    $0xffffff80,%eax
  a5166b:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
  a51670:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  a51674:	48 8d 2c 85 10 00 00 	lea    0x10(,%rax,4),%rbp
  a5167b:	00 
  a5167c:	48 8b 05 fd c2 01 00 	mov    0x1c2fd(%rip),%rax        # a6d980 <efi_early>
  a51683:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a51687:	0f b6 50 30          	movzbl 0x30(%rax),%edx
  a5168b:	48 8b 40 18          	mov    0x18(%rax),%rax
  a5168f:	48 85 f6             	test   %rsi,%rsi
  a51692:	74 2c                	je     a516c0 <efi_main+0xca0>
  a51694:	84 d2                	test   %dl,%dl
  a51696:	0f 85 4c 01 00 00    	jne    a517e8 <efi_main+0xdc8>
  a5169c:	8b 78 30             	mov    0x30(%rax),%edi
  a5169f:	31 c0                	xor    %eax,%eax
  a516a1:	41 ff d0             	callq  *%r8
  a516a4:	48 8b 05 d5 c2 01 00 	mov    0x1c2d5(%rip),%rax        # a6d980 <efi_early>
  a516ab:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
  a516b2:	00 00 
  a516b4:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a516b8:	0f b6 50 30          	movzbl 0x30(%rax),%edx
  a516bc:	48 8b 40 18          	mov    0x18(%rax),%rax
  a516c0:	84 d2                	test   %dl,%dl
  a516c2:	0f 84 18 01 00 00    	je     a517e0 <efi_main+0xdc0>
  a516c8:	48 8b 78 40          	mov    0x40(%rax),%rdi
  a516cc:	31 c0                	xor    %eax,%eax
  a516ce:	48 8d 4c 24 78       	lea    0x78(%rsp),%rcx
  a516d3:	48 89 ea             	mov    %rbp,%rdx
  a516d6:	be 02 00 00 00       	mov    $0x2,%esi
  a516db:	41 ff d0             	callq  *%r8
  a516de:	48 85 c0             	test   %rax,%rax
  a516e1:	0f 85 f5 f9 ff ff    	jne    a510dc <efi_main+0x6bc>
  a516e7:	e9 bf f9 ff ff       	jmpq   a510ab <efi_main+0x68b>
  a516ec:	0f 1f 40 00          	nopl   0x0(%rax)
  a516f0:	48 8b 3d 91 c2 01 00 	mov    0x1c291(%rip),%rdi        # a6d988 <sys_table>
  a516f7:	48 8d 35 55 32 00 00 	lea    0x3255(%rip),%rsi        # a54953 <efi_MemoryOverWriteRequest_name+0x633>
  a516fe:	e8 9d 02 00 00       	callq  a519a0 <efi_printk>
  a51703:	e9 d2 f6 ff ff       	jmpq   a50dda <efi_main+0x3ba>
  a51708:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5170f:	00 
  a51710:	8b 7a 64             	mov    0x64(%rdx),%edi
  a51713:	e9 87 fb ff ff       	jmpq   a5129f <efi_main+0x87f>
  a51718:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5171f:	00 
  a51720:	41 81 f8 80 00 00 00 	cmp    $0x80,%r8d
  a51727:	0f 87 2a 01 00 00    	ja     a51857 <efi_main+0xe37>
  a5172d:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
  a51732:	44 88 83 e8 01 00 00 	mov    %r8b,0x1e8(%rbx)
  a51739:	31 f6                	xor    %esi,%esi
  a5173b:	0f b7 10             	movzwl (%rax),%edx
  a5173e:	48 8b 78 02          	mov    0x2(%rax),%rdi
  a51742:	e8 e9 c4 ff ff       	callq  a4dc30 <memset>
  a51747:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
  a5174c:	48 be ff ff 00 00 00 	movabs $0xcf9a000000ffff,%rsi
  a51753:	9a cf 00 
  a51756:	48 8b 40 02          	mov    0x2(%rax),%rax
  a5175a:	48 89 70 08          	mov    %rsi,0x8(%rax)
  a5175e:	48 be ff ff 00 00 00 	movabs $0xaf9a000000ffff,%rsi
  a51765:	9a af 00 
  a51768:	48 89 70 10          	mov    %rsi,0x10(%rax)
  a5176c:	48 be ff ff 00 00 00 	movabs $0xcf92000000ffff,%rsi
  a51773:	92 cf 00 
  a51776:	48 89 70 18          	mov    %rsi,0x18(%rax)
  a5177a:	48 be 00 00 00 00 00 	movabs $0x80890000000000,%rsi
  a51781:	89 80 00 
  a51784:	48 89 70 20          	mov    %rsi,0x20(%rax)
  a51788:	fa                   	cli    
  a51789:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
  a5178e:	0f 01 10             	lgdt   (%rax)
  a51791:	48 89 d8             	mov    %rbx,%rax
  a51794:	e9 e2 f6 ff ff       	jmpq   a50e7b <efi_main+0x45b>
  a51799:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a517a0:	81 3e 00 00 01 00    	cmpl   $0x10000,(%rsi)
  a517a6:	0f 85 f5 00 00 00    	jne    a518a1 <efi_main+0xe81>
  a517ac:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a517b0:	8b 7e 10             	mov    0x10(%rsi),%edi
  a517b3:	e9 8e fb ff ff       	jmpq   a51346 <efi_main+0x926>
  a517b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a517bf:	00 
  a517c0:	48 8b 3d c1 c1 01 00 	mov    0x1c1c1(%rip),%rdi        # a6d988 <sys_table>
  a517c7:	48 8d 35 1a 31 00 00 	lea    0x311a(%rip),%rsi        # a548e8 <efi_MemoryOverWriteRequest_name+0x5c8>
  a517ce:	e8 cd 01 00 00       	callq  a519a0 <efi_printk>
  a517d3:	4c 8b 05 ae c1 01 00 	mov    0x1c1ae(%rip),%r8        # a6d988 <sys_table>
  a517da:	e9 8b f6 ff ff       	jmpq   a50e6a <efi_main+0x44a>
  a517df:	90                   	nop
  a517e0:	8b 78 2c             	mov    0x2c(%rax),%edi
  a517e3:	e9 e4 fe ff ff       	jmpq   a516cc <efi_main+0xcac>
  a517e8:	48 8b 78 48          	mov    0x48(%rax),%rdi
  a517ec:	e9 ae fe ff ff       	jmpq   a5169f <efi_main+0xc7f>
  a517f1:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
  a517f8:	00 
  a517f9:	48 89 83 50 02 00 00 	mov    %rax,0x250(%rbx)
  a51800:	e9 3b fc ff ff       	jmpq   a51440 <efi_main+0xa20>
  a51805:	0f 1f 00             	nopl   (%rax)
  a51808:	48 8b 3d 79 c1 01 00 	mov    0x1c179(%rip),%rdi        # a6d988 <sys_table>
  a5180f:	48 8d 35 f2 2f 00 00 	lea    0x2ff2(%rip),%rsi        # a54808 <efi_MemoryOverWriteRequest_name+0x4e8>
  a51816:	e8 85 01 00 00       	callq  a519a0 <efi_printk>
  a5181b:	e9 99 f6 ff ff       	jmpq   a50eb9 <efi_main+0x499>
  a51820:	48 8b 3d 61 c1 01 00 	mov    0x1c161(%rip),%rdi        # a6d988 <sys_table>
  a51827:	48 8d 35 5a 30 00 00 	lea    0x305a(%rip),%rsi        # a54888 <efi_MemoryOverWriteRequest_name+0x568>
  a5182e:	e8 6d 01 00 00       	callq  a519a0 <efi_printk>
  a51833:	e9 08 fc ff ff       	jmpq   a51440 <efi_main+0xa20>
  a51838:	48 8b 3d 49 c1 01 00 	mov    0x1c149(%rip),%rdi        # a6d988 <sys_table>
  a5183f:	48 8d 35 ca 30 00 00 	lea    0x30ca(%rip),%rsi        # a54910 <efi_MemoryOverWriteRequest_name+0x5f0>
  a51846:	e8 55 01 00 00       	callq  a519a0 <efi_printk>
  a5184b:	4c 8b 05 36 c1 01 00 	mov    0x1c136(%rip),%r8        # a6d988 <sys_table>
  a51852:	e9 13 f6 ff ff       	jmpq   a50e6a <efi_main+0x44a>
  a51857:	43 8d 84 80 80 fd ff 	lea    -0x280(%r8,%r8,4),%eax
  a5185e:	ff 
  a5185f:	41 c7 43 08 01 00 00 	movl   $0x1,0x8(%r11)
  a51866:	00 
  a51867:	c1 e0 02             	shl    $0x2,%eax
  a5186a:	49 c7 03 00 00 00 00 	movq   $0x0,(%r11)
  a51871:	41 89 43 0c          	mov    %eax,0xc(%r11)
  a51875:	48 8b 93 50 02 00 00 	mov    0x250(%rbx),%rdx
  a5187c:	48 85 d2             	test   %rdx,%rdx
  a5187f:	75 0a                	jne    a5188b <efi_main+0xe6b>
  a51881:	eb 36                	jmp    a518b9 <efi_main+0xe99>
  a51883:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a51888:	48 89 c2             	mov    %rax,%rdx
  a5188b:	48 8b 02             	mov    (%rdx),%rax
  a5188e:	48 85 c0             	test   %rax,%rax
  a51891:	75 f5                	jne    a51888 <efi_main+0xe68>
  a51893:	4c 89 1a             	mov    %r11,(%rdx)
  a51896:	41 b8 80 ff ff ff    	mov    $0xffffff80,%r8d
  a5189c:	e9 8c fe ff ff       	jmpq   a5172d <efi_main+0xd0d>
  a518a1:	48 8b 3d e0 c0 01 00 	mov    0x1c0e0(%rip),%rdi        # a6d988 <sys_table>
  a518a8:	48 8d 35 b1 2f 00 00 	lea    0x2fb1(%rip),%rsi        # a54860 <efi_MemoryOverWriteRequest_name+0x540>
  a518af:	e8 ec 00 00 00       	callq  a519a0 <efi_printk>
  a518b4:	e9 87 fb ff ff       	jmpq   a51440 <efi_main+0xa20>
  a518b9:	4c 89 9b 50 02 00 00 	mov    %r11,0x250(%rbx)
  a518c0:	41 b8 80 ff ff ff    	mov    $0xffffff80,%r8d
  a518c6:	e9 62 fe ff ff       	jmpq   a5172d <efi_main+0xd0d>
  a518cb:	45 31 c0             	xor    %r8d,%r8d
  a518ce:	e9 5a fe ff ff       	jmpq   a5172d <efi_main+0xd0d>
  a518d3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a518da:	00 00 00 
  a518dd:	0f 1f 00             	nopl   (%rax)

0000000000a518e0 <efi_call>:
  a518e0:	55                   	push   %rbp
  a518e1:	48 89 e5             	mov    %rsp,%rbp
  a518e4:	48 89 e0             	mov    %rsp,%rax
  a518e7:	48 83 ec 70          	sub    $0x70,%rsp
  a518eb:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  a518ef:	48 89 04 24          	mov    %rax,(%rsp)
  a518f3:	0f 20 c0             	mov    %cr0,%rax
  a518f6:	0f 06                	clts   
  a518f8:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a518fd:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
  a51902:	0f 29 4c 24 50       	movaps %xmm1,0x50(%rsp)
  a51907:	0f 29 54 24 40       	movaps %xmm2,0x40(%rsp)
  a5190c:	0f 29 5c 24 30       	movaps %xmm3,0x30(%rsp)
  a51911:	0f 29 64 24 20       	movaps %xmm4,0x20(%rsp)
  a51916:	0f 29 6c 24 10       	movaps %xmm5,0x10(%rsp)
  a5191b:	48 8b 45 10          	mov    0x10(%rbp),%rax
  a5191f:	48 83 ec 30          	sub    $0x30,%rsp
  a51923:	4c 89 4c 24 20       	mov    %r9,0x20(%rsp)
  a51928:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  a5192d:	4d 89 c1             	mov    %r8,%r9
  a51930:	49 89 c8             	mov    %rcx,%r8
  a51933:	48 89 f1             	mov    %rsi,%rcx
  a51936:	ff d7                	callq  *%rdi
  a51938:	48 83 c4 30          	add    $0x30,%rsp
  a5193c:	0f 28 44 24 60       	movaps 0x60(%rsp),%xmm0
  a51941:	0f 28 4c 24 50       	movaps 0x50(%rsp),%xmm1
  a51946:	0f 28 54 24 40       	movaps 0x40(%rsp),%xmm2
  a5194b:	0f 28 5c 24 30       	movaps 0x30(%rsp),%xmm3
  a51950:	0f 28 64 24 20       	movaps 0x20(%rsp),%xmm4
  a51955:	0f 28 6c 24 10       	movaps 0x10(%rsp),%xmm5
  a5195a:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  a5195f:	0f 22 c6             	mov    %rsi,%cr0
  a51962:	48 8b 24 24          	mov    (%rsp),%rsp
  a51966:	5d                   	pop    %rbp
  a51967:	c3                   	retq   
  a51968:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5196f:	00 

0000000000a51970 <nokaslr>:
  a51970:	f3 0f 1e fa          	endbr64 
  a51974:	8b 05 be 45 00 00    	mov    0x45be(%rip),%eax        # a55f38 <__nokaslr>
  a5197a:	c3                   	retq   
  a5197b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000a51980 <is_quiet>:
  a51980:	f3 0f 1e fa          	endbr64 
  a51984:	8b 05 aa 45 00 00    	mov    0x45aa(%rip),%eax        # a55f34 <__quiet>
  a5198a:	c3                   	retq   
  a5198b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000a51990 <novamap>:
  a51990:	f3 0f 1e fa          	endbr64 
  a51994:	8b 05 96 45 00 00    	mov    0x4596(%rip),%eax        # a55f30 <__novamap>
  a5199a:	c3                   	retq   
  a5199b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000a519a0 <efi_printk>:
  a519a0:	f3 0f 1e fa          	endbr64 
  a519a4:	0f b6 06             	movzbl (%rsi),%eax
  a519a7:	84 c0                	test   %al,%al
  a519a9:	74 75                	je     a51a20 <efi_printk+0x80>
  a519ab:	41 55                	push   %r13
  a519ad:	41 54                	push   %r12
  a519af:	55                   	push   %rbp
  a519b0:	48 89 fd             	mov    %rdi,%rbp
  a519b3:	53                   	push   %rbx
  a519b4:	48 89 f3             	mov    %rsi,%rbx
  a519b7:	48 83 ec 18          	sub    $0x18,%rsp
  a519bb:	4c 8d 64 24 08       	lea    0x8(%rsp),%r12
  a519c0:	4c 8d 6c 24 0c       	lea    0xc(%rsp),%r13
  a519c5:	eb 1f                	jmp    a519e6 <efi_printk+0x46>
  a519c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a519ce:	00 00 
  a519d0:	4c 89 e6             	mov    %r12,%rsi
  a519d3:	48 89 ef             	mov    %rbp,%rdi
  a519d6:	48 83 c3 01          	add    $0x1,%rbx
  a519da:	e8 f1 e7 ff ff       	callq  a501d0 <efi_char16_printk>
  a519df:	0f b6 03             	movzbl (%rbx),%eax
  a519e2:	84 c0                	test   %al,%al
  a519e4:	74 2a                	je     a51a10 <efi_printk+0x70>
  a519e6:	31 d2                	xor    %edx,%edx
  a519e8:	66 89 54 24 0a       	mov    %dx,0xa(%rsp)
  a519ed:	66 0f be d0          	movsbw %al,%dx
  a519f1:	66 89 54 24 08       	mov    %dx,0x8(%rsp)
  a519f6:	3c 0a                	cmp    $0xa,%al
  a519f8:	75 d6                	jne    a519d0 <efi_printk+0x30>
  a519fa:	4c 89 ee             	mov    %r13,%rsi
  a519fd:	48 89 ef             	mov    %rbp,%rdi
  a51a00:	c7 44 24 0c 0d 00 00 	movl   $0xd,0xc(%rsp)
  a51a07:	00 
  a51a08:	e8 c3 e7 ff ff       	callq  a501d0 <efi_char16_printk>
  a51a0d:	eb c1                	jmp    a519d0 <efi_printk+0x30>
  a51a0f:	90                   	nop
  a51a10:	48 83 c4 18          	add    $0x18,%rsp
  a51a14:	5b                   	pop    %rbx
  a51a15:	5d                   	pop    %rbp
  a51a16:	41 5c                	pop    %r12
  a51a18:	41 5d                	pop    %r13
  a51a1a:	c3                   	retq   
  a51a1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a51a20:	c3                   	retq   
  a51a21:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a51a28:	00 00 00 00 
  a51a2c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000a51a30 <efi_get_memory_map>:
  a51a30:	f3 0f 1e fa          	endbr64 
  a51a34:	41 55                	push   %r13
  a51a36:	49 bd 05 00 00 00 00 	movabs $0x8000000000000005,%r13
  a51a3d:	00 00 80 
  a51a40:	41 54                	push   %r12
  a51a42:	55                   	push   %rbp
  a51a43:	53                   	push   %rbx
  a51a44:	48 89 f3             	mov    %rsi,%rbx
  a51a47:	48 83 ec 28          	sub    $0x28,%rsp
  a51a4b:	48 8b 46 10          	mov    0x10(%rsi),%rax
  a51a4f:	48 c7 44 24 10 00 00 	movq   $0x0,0x10(%rsp)
  a51a56:	00 00 
  a51a58:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
  a51a5d:	48 c7 00 28 00 00 00 	movq   $0x28,(%rax)
  a51a64:	48 8b 46 10          	mov    0x10(%rsi),%rax
  a51a68:	48 8b 56 08          	mov    0x8(%rsi),%rdx
  a51a6c:	48 8b 00             	mov    (%rax),%rax
  a51a6f:	48 c1 e0 05          	shl    $0x5,%rax
  a51a73:	48 89 02             	mov    %rax,(%rdx)
  a51a76:	48 8b 56 08          	mov    0x8(%rsi),%rdx
  a51a7a:	48 8b 46 28          	mov    0x28(%rsi),%rax
  a51a7e:	48 8b 12             	mov    (%rdx),%rdx
  a51a81:	48 89 10             	mov    %rdx,(%rax)
  a51a84:	e9 d4 00 00 00       	jmpq   a51b5d <efi_get_memory_map+0x12d>
  a51a89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a51a90:	48 8b 79 40          	mov    0x40(%rcx),%rdi
  a51a94:	48 89 e9             	mov    %rbp,%rcx
  a51a97:	be 02 00 00 00       	mov    $0x2,%esi
  a51a9c:	31 c0                	xor    %eax,%eax
  a51a9e:	41 ff d0             	callq  *%r8
  a51aa1:	49 89 c4             	mov    %rax,%r12
  a51aa4:	48 85 c0             	test   %rax,%rax
  a51aa7:	0f 85 0f 01 00 00    	jne    a51bbc <efi_get_memory_map+0x18c>
  a51aad:	48 8b 43 10          	mov    0x10(%rbx),%rax
  a51ab1:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  a51ab8:	48 c7 44 24 18 00 00 	movq   $0x0,0x18(%rsp)
  a51abf:	00 00 
  a51ac1:	e8 fa e6 ff ff       	callq  a501c0 <__efi_early>
  a51ac6:	4c 8b 43 10          	mov    0x10(%rbx),%r8
  a51aca:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  a51acf:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a51ad3:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a51ad7:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  a51adb:	48 8b 40 18          	mov    0x18(%rax),%rax
  a51adf:	0f 84 a3 00 00 00    	je     a51b88 <efi_get_memory_map+0x158>
  a51ae5:	48 8b 78 38          	mov    0x38(%rax),%rdi
  a51ae9:	48 8d 4c 24 18       	lea    0x18(%rsp),%rcx
  a51aee:	4c 8d 4c 24 0c       	lea    0xc(%rsp),%r9
  a51af3:	31 c0                	xor    %eax,%eax
  a51af5:	41 ff d2             	callq  *%r10
  a51af8:	49 89 c4             	mov    %rax,%r12
  a51afb:	4c 39 e8             	cmp    %r13,%rax
  a51afe:	74 1d                	je     a51b1d <efi_get_memory_map+0xed>
  a51b00:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  a51b04:	48 8b 43 28          	mov    0x28(%rbx),%rax
  a51b08:	48 8b 73 10          	mov    0x10(%rbx),%rsi
  a51b0c:	48 8b 00             	mov    (%rax),%rax
  a51b0f:	48 2b 02             	sub    (%rdx),%rax
  a51b12:	31 d2                	xor    %edx,%edx
  a51b14:	48 f7 36             	divq   (%rsi)
  a51b17:	48 83 f8 07          	cmp    $0x7,%rax
  a51b1b:	77 7b                	ja     a51b98 <efi_get_memory_map+0x168>
  a51b1d:	e8 9e e6 ff ff       	callq  a501c0 <__efi_early>
  a51b22:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  a51b27:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a51b2b:	48 8b 48 28          	mov    0x28(%rax),%rcx
  a51b2f:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a51b33:	74 5b                	je     a51b90 <efi_get_memory_map+0x160>
  a51b35:	48 8b 7a 48          	mov    0x48(%rdx),%rdi
  a51b39:	31 c0                	xor    %eax,%eax
  a51b3b:	ff d1                	callq  *%rcx
  a51b3d:	48 8b 43 10          	mov    0x10(%rbx),%rax
  a51b41:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  a51b45:	48 8b 00             	mov    (%rax),%rax
  a51b48:	48 c1 e0 03          	shl    $0x3,%rax
  a51b4c:	48 01 02             	add    %rax,(%rdx)
  a51b4f:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  a51b53:	48 8b 43 28          	mov    0x28(%rbx),%rax
  a51b57:	48 8b 12             	mov    (%rdx),%rdx
  a51b5a:	48 89 10             	mov    %rdx,(%rax)
  a51b5d:	e8 5e e6 ff ff       	callq  a501c0 <__efi_early>
  a51b62:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  a51b66:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a51b6a:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a51b6e:	48 8b 12             	mov    (%rdx),%rdx
  a51b71:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a51b75:	0f 85 15 ff ff ff    	jne    a51a90 <efi_get_memory_map+0x60>
  a51b7b:	8b 79 2c             	mov    0x2c(%rcx),%edi
  a51b7e:	e9 11 ff ff ff       	jmpq   a51a94 <efi_get_memory_map+0x64>
  a51b83:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a51b88:	8b 78 28             	mov    0x28(%rax),%edi
  a51b8b:	e9 59 ff ff ff       	jmpq   a51ae9 <efi_get_memory_map+0xb9>
  a51b90:	8b 7a 30             	mov    0x30(%rdx),%edi
  a51b93:	eb a4                	jmp    a51b39 <efi_get_memory_map+0x109>
  a51b95:	0f 1f 00             	nopl   (%rax)
  a51b98:	4d 85 e4             	test   %r12,%r12
  a51b9b:	74 3b                	je     a51bd8 <efi_get_memory_map+0x1a8>
  a51b9d:	e8 1e e6 ff ff       	callq  a501c0 <__efi_early>
  a51ba2:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  a51ba7:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a51bab:	48 8b 50 28          	mov    0x28(%rax),%rdx
  a51baf:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a51bb3:	75 4b                	jne    a51c00 <efi_get_memory_map+0x1d0>
  a51bb5:	8b 79 30             	mov    0x30(%rcx),%edi
  a51bb8:	31 c0                	xor    %eax,%eax
  a51bba:	ff d2                	callq  *%rdx
  a51bbc:	48 8b 03             	mov    (%rbx),%rax
  a51bbf:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  a51bc4:	48 89 10             	mov    %rdx,(%rax)
  a51bc7:	48 83 c4 28          	add    $0x28,%rsp
  a51bcb:	4c 89 e0             	mov    %r12,%rax
  a51bce:	5b                   	pop    %rbx
  a51bcf:	5d                   	pop    %rbp
  a51bd0:	41 5c                	pop    %r12
  a51bd2:	41 5d                	pop    %r13
  a51bd4:	c3                   	retq   
  a51bd5:	0f 1f 00             	nopl   (%rax)
  a51bd8:	48 8b 43 20          	mov    0x20(%rbx),%rax
  a51bdc:	48 85 c0             	test   %rax,%rax
  a51bdf:	74 08                	je     a51be9 <efi_get_memory_map+0x1b9>
  a51be1:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  a51be6:	48 89 10             	mov    %rdx,(%rax)
  a51be9:	48 8b 43 18          	mov    0x18(%rbx),%rax
  a51bed:	48 85 c0             	test   %rax,%rax
  a51bf0:	74 ca                	je     a51bbc <efi_get_memory_map+0x18c>
  a51bf2:	8b 54 24 0c          	mov    0xc(%rsp),%edx
  a51bf6:	89 10                	mov    %edx,(%rax)
  a51bf8:	eb c2                	jmp    a51bbc <efi_get_memory_map+0x18c>
  a51bfa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a51c00:	48 8b 79 48          	mov    0x48(%rcx),%rdi
  a51c04:	eb b2                	jmp    a51bb8 <efi_get_memory_map+0x188>
  a51c06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a51c0d:	00 00 00 

0000000000a51c10 <get_dram_base>:
  a51c10:	f3 0f 1e fa          	endbr64 
  a51c14:	41 54                	push   %r12
  a51c16:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
  a51c1d:	55                   	push   %rbp
  a51c1e:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
  a51c25:	48 8d 44 24 50       	lea    0x50(%rsp),%rax
  a51c2a:	48 8d 74 24 18       	lea    0x18(%rsp),%rsi
  a51c2f:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
  a51c36:	00 00 
  a51c38:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  a51c3d:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
  a51c42:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
  a51c47:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
  a51c4c:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  a51c51:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
  a51c56:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  a51c5d:	00 00 
  a51c5f:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
  a51c64:	e8 c7 fd ff ff       	callq  a51a30 <efi_get_memory_map>
  a51c69:	48 85 c0             	test   %rax,%rax
  a51c6c:	75 6f                	jne    a51cdd <get_dram_base+0xcd>
  a51c6e:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  a51c73:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  a51c78:	48 01 ef             	add    %rbp,%rdi
  a51c7b:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
  a51c80:	48 85 ed             	test   %rbp,%rbp
  a51c83:	74 3b                	je     a51cc0 <get_dram_base+0xb0>
  a51c85:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
  a51c8a:	48 8d 44 0d 00       	lea    0x0(%rbp,%rcx,1),%rax
  a51c8f:	48 39 c7             	cmp    %rax,%rdi
  a51c92:	72 2c                	jb     a51cc0 <get_dram_base+0xb0>
  a51c94:	48 8d 55 08          	lea    0x8(%rbp),%rdx
  a51c98:	eb 11                	jmp    a51cab <get_dram_base+0x9b>
  a51c9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a51ca0:	48 01 c8             	add    %rcx,%rax
  a51ca3:	48 01 ca             	add    %rcx,%rdx
  a51ca6:	48 39 c7             	cmp    %rax,%rdi
  a51ca9:	72 15                	jb     a51cc0 <get_dram_base+0xb0>
  a51cab:	f6 42 18 08          	testb  $0x8,0x18(%rdx)
  a51caf:	74 0a                	je     a51cbb <get_dram_base+0xab>
  a51cb1:	48 8b 32             	mov    (%rdx),%rsi
  a51cb4:	49 39 f4             	cmp    %rsi,%r12
  a51cb7:	4c 0f 47 e6          	cmova  %rsi,%r12
  a51cbb:	48 85 c0             	test   %rax,%rax
  a51cbe:	75 e0                	jne    a51ca0 <get_dram_base+0x90>
  a51cc0:	e8 fb e4 ff ff       	callq  a501c0 <__efi_early>
  a51cc5:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a51cc9:	48 8b 50 28          	mov    0x28(%rax),%rdx
  a51ccd:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a51cd1:	75 1d                	jne    a51cf0 <get_dram_base+0xe0>
  a51cd3:	8b 79 30             	mov    0x30(%rcx),%edi
  a51cd6:	48 89 ee             	mov    %rbp,%rsi
  a51cd9:	31 c0                	xor    %eax,%eax
  a51cdb:	ff d2                	callq  *%rdx
  a51cdd:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  a51ce4:	4c 89 e0             	mov    %r12,%rax
  a51ce7:	5d                   	pop    %rbp
  a51ce8:	41 5c                	pop    %r12
  a51cea:	c3                   	retq   
  a51ceb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a51cf0:	48 8b 79 48          	mov    0x48(%rcx),%rdi
  a51cf4:	eb e0                	jmp    a51cd6 <get_dram_base+0xc6>
  a51cf6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a51cfd:	00 00 00 

0000000000a51d00 <efi_high_alloc>:
  a51d00:	f3 0f 1e fa          	endbr64 
  a51d04:	41 57                	push   %r15
  a51d06:	41 56                	push   %r14
  a51d08:	4d 89 c6             	mov    %r8,%r14
  a51d0b:	41 55                	push   %r13
  a51d0d:	41 54                	push   %r12
  a51d0f:	49 89 f4             	mov    %rsi,%r12
  a51d12:	55                   	push   %rbp
  a51d13:	48 89 cd             	mov    %rcx,%rbp
  a51d16:	53                   	push   %rbx
  a51d17:	48 89 d3             	mov    %rdx,%rbx
  a51d1a:	48 83 ec 68          	sub    $0x68,%rsp
  a51d1e:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
  a51d23:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  a51d28:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  a51d2f:	00 00 
  a51d31:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  a51d36:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
  a51d3b:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  a51d40:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
  a51d45:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
  a51d4a:	48 8d 44 24 18       	lea    0x18(%rsp),%rax
  a51d4f:	48 c7 44 24 48 00 00 	movq   $0x0,0x48(%rsp)
  a51d56:	00 00 
  a51d58:	48 c7 44 24 50 00 00 	movq   $0x0,0x50(%rsp)
  a51d5f:	00 00 
  a51d61:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
  a51d66:	e8 c5 fc ff ff       	callq  a51a30 <efi_get_memory_map>
  a51d6b:	49 89 c5             	mov    %rax,%r13
  a51d6e:	48 85 c0             	test   %rax,%rax
  a51d71:	0f 85 2f 01 00 00    	jne    a51ea6 <efi_high_alloc+0x1a6>
  a51d77:	48 81 fb 00 10 00 00 	cmp    $0x1000,%rbx
  a51d7e:	b8 00 10 00 00       	mov    $0x1000,%eax
  a51d83:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
  a51d88:	48 0f 42 d8          	cmovb  %rax,%rbx
  a51d8c:	49 83 ec 01          	sub    $0x1,%r12
  a51d90:	49 81 cc ff 0f 00 00 	or     $0xfff,%r12
  a51d97:	49 83 c4 01          	add    $0x1,%r12
  a51d9b:	48 f7 db             	neg    %rbx
  a51d9e:	4d 89 e5             	mov    %r12,%r13
  a51da1:	49 c1 ed 0c          	shr    $0xc,%r13
  a51da5:	0f 1f 00             	nopl   (%rax)
  a51da8:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  a51dad:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  a51db2:	31 d2                	xor    %edx,%edx
  a51db4:	48 89 c8             	mov    %rcx,%rax
  a51db7:	48 f7 f7             	div    %rdi
  a51dba:	48 39 f9             	cmp    %rdi,%rcx
  a51dbd:	72 6d                	jb     a51e2c <efi_high_alloc+0x12c>
  a51dbf:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
  a51dc4:	31 f6                	xor    %esi,%esi
  a51dc6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a51dcd:	00 00 00 
  a51dd0:	83 39 07             	cmpl   $0x7,(%rcx)
  a51dd3:	75 4b                	jne    a51e20 <efi_high_alloc+0x120>
  a51dd5:	48 8b 51 18          	mov    0x18(%rcx),%rdx
  a51dd9:	4c 39 ea             	cmp    %r13,%rdx
  a51ddc:	72 42                	jb     a51e20 <efi_high_alloc+0x120>
  a51dde:	4c 8b 41 08          	mov    0x8(%rcx),%r8
  a51de2:	48 c1 e2 0c          	shl    $0xc,%rdx
  a51de6:	4c 01 c2             	add    %r8,%rdx
  a51de9:	4f 8d 0c 04          	lea    (%r12,%r8,1),%r9
  a51ded:	49 39 d6             	cmp    %rdx,%r14
  a51df0:	49 0f 46 d6          	cmovbe %r14,%rdx
  a51df4:	49 39 d1             	cmp    %rdx,%r9
  a51df7:	77 27                	ja     a51e20 <efi_high_alloc+0x120>
  a51df9:	4c 29 e2             	sub    %r12,%rdx
  a51dfc:	48 21 da             	and    %rbx,%rdx
  a51dff:	4c 39 c2             	cmp    %r8,%rdx
  a51e02:	72 1c                	jb     a51e20 <efi_high_alloc+0x120>
  a51e04:	48 85 d2             	test   %rdx,%rdx
  a51e07:	74 17                	je     a51e20 <efi_high_alloc+0x120>
  a51e09:	4c 39 fa             	cmp    %r15,%rdx
  a51e0c:	76 12                	jbe    a51e20 <efi_high_alloc+0x120>
  a51e0e:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
  a51e13:	49 89 d7             	mov    %rdx,%r15
  a51e16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a51e1d:	00 00 00 
  a51e20:	48 83 c6 01          	add    $0x1,%rsi
  a51e24:	48 01 f9             	add    %rdi,%rcx
  a51e27:	48 39 f0             	cmp    %rsi,%rax
  a51e2a:	77 a4                	ja     a51dd0 <efi_high_alloc+0xd0>
  a51e2c:	e8 8f e3 ff ff       	callq  a501c0 <__efi_early>
  a51e31:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a51e35:	4d 85 ff             	test   %r15,%r15
  a51e38:	74 4b                	je     a51e85 <efi_high_alloc+0x185>
  a51e3a:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a51e3e:	4c 8b 48 28          	mov    0x28(%rax),%r9
  a51e42:	74 3c                	je     a51e80 <efi_high_alloc+0x180>
  a51e44:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
  a51e48:	31 c0                	xor    %eax,%eax
  a51e4a:	4c 8d 44 24 28       	lea    0x28(%rsp),%r8
  a51e4f:	4c 89 e9             	mov    %r13,%rcx
  a51e52:	ba 02 00 00 00       	mov    $0x2,%edx
  a51e57:	be 02 00 00 00       	mov    $0x2,%esi
  a51e5c:	41 ff d1             	callq  *%r9
  a51e5f:	48 85 c0             	test   %rax,%rax
  a51e62:	74 59                	je     a51ebd <efi_high_alloc+0x1bd>
  a51e64:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  a51e69:	45 31 ff             	xor    %r15d,%r15d
  a51e6c:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  a51e73:	00 00 
  a51e75:	e9 2e ff ff ff       	jmpq   a51da8 <efi_high_alloc+0xa8>
  a51e7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a51e80:	8b 7a 20             	mov    0x20(%rdx),%edi
  a51e83:	eb c3                	jmp    a51e48 <efi_high_alloc+0x148>
  a51e85:	49 bd 0e 00 00 00 00 	movabs $0x800000000000000e,%r13
  a51e8c:	00 00 80 
  a51e8f:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a51e93:	48 8b 48 28          	mov    0x28(%rax),%rcx
  a51e97:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  a51e9c:	74 1a                	je     a51eb8 <efi_high_alloc+0x1b8>
  a51e9e:	48 8b 7a 48          	mov    0x48(%rdx),%rdi
  a51ea2:	31 c0                	xor    %eax,%eax
  a51ea4:	ff d1                	callq  *%rcx
  a51ea6:	48 83 c4 68          	add    $0x68,%rsp
  a51eaa:	4c 89 e8             	mov    %r13,%rax
  a51ead:	5b                   	pop    %rbx
  a51eae:	5d                   	pop    %rbp
  a51eaf:	41 5c                	pop    %r12
  a51eb1:	41 5d                	pop    %r13
  a51eb3:	41 5e                	pop    %r14
  a51eb5:	41 5f                	pop    %r15
  a51eb7:	c3                   	retq   
  a51eb8:	8b 7a 30             	mov    0x30(%rdx),%edi
  a51ebb:	eb e5                	jmp    a51ea2 <efi_high_alloc+0x1a2>
  a51ebd:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  a51ec2:	45 31 ed             	xor    %r13d,%r13d
  a51ec5:	48 89 45 00          	mov    %rax,0x0(%rbp)
  a51ec9:	e8 f2 e2 ff ff       	callq  a501c0 <__efi_early>
  a51ece:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a51ed2:	eb bb                	jmp    a51e8f <efi_high_alloc+0x18f>
  a51ed4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a51edb:	00 00 00 00 
  a51edf:	90                   	nop

0000000000a51ee0 <efi_low_alloc>:
  a51ee0:	f3 0f 1e fa          	endbr64 
  a51ee4:	41 57                	push   %r15
  a51ee6:	41 56                	push   %r14
  a51ee8:	41 55                	push   %r13
  a51eea:	41 54                	push   %r12
  a51eec:	55                   	push   %rbp
  a51eed:	48 89 d5             	mov    %rdx,%rbp
  a51ef0:	53                   	push   %rbx
  a51ef1:	48 89 f3             	mov    %rsi,%rbx
  a51ef4:	48 83 ec 78          	sub    $0x78,%rsp
  a51ef8:	48 8d 44 24 30       	lea    0x30(%rsp),%rax
  a51efd:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  a51f02:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  a51f07:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
  a51f0c:	48 8d 44 24 18       	lea    0x18(%rsp),%rax
  a51f11:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  a51f16:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
  a51f1b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
  a51f20:	48 8d 44 24 28       	lea    0x28(%rsp),%rax
  a51f25:	48 c7 44 24 58 00 00 	movq   $0x0,0x58(%rsp)
  a51f2c:	00 00 
  a51f2e:	48 c7 44 24 60 00 00 	movq   $0x0,0x60(%rsp)
  a51f35:	00 00 
  a51f37:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  a51f3c:	e8 ef fa ff ff       	callq  a51a30 <efi_get_memory_map>
  a51f41:	49 89 c6             	mov    %rax,%r14
  a51f44:	48 85 c0             	test   %rax,%rax
  a51f47:	0f 85 58 01 00 00    	jne    a520a5 <efi_low_alloc+0x1c5>
  a51f4d:	ba 00 10 00 00       	mov    $0x1000,%edx
  a51f52:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
  a51f57:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
  a51f5c:	48 81 fd 00 10 00 00 	cmp    $0x1000,%rbp
  a51f63:	48 0f 42 ea          	cmovb  %rdx,%rbp
  a51f67:	48 83 eb 01          	sub    $0x1,%rbx
  a51f6b:	48 81 cb ff 0f 00 00 	or     $0xfff,%rbx
  a51f72:	48 83 c3 01          	add    $0x1,%rbx
  a51f76:	49 89 dc             	mov    %rbx,%r12
  a51f79:	49 c1 ec 0c          	shr    $0xc,%r12
  a51f7d:	48 3b 4c 24 18       	cmp    0x18(%rsp),%rcx
  a51f82:	0f 87 3e 01 00 00    	ja     a520c6 <efi_low_alloc+0x1e6>
  a51f88:	45 31 ff             	xor    %r15d,%r15d
  a51f8b:	41 bd 07 00 00 00    	mov    $0x7,%r13d
  a51f91:	eb 4d                	jmp    a51fe0 <efi_low_alloc+0x100>
  a51f93:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a51f98:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
  a51f9c:	4c 8d 44 24 38       	lea    0x38(%rsp),%r8
  a51fa1:	4c 89 e1             	mov    %r12,%rcx
  a51fa4:	ba 02 00 00 00       	mov    $0x2,%edx
  a51fa9:	31 c0                	xor    %eax,%eax
  a51fab:	be 02 00 00 00       	mov    $0x2,%esi
  a51fb0:	41 ff d1             	callq  *%r9
  a51fb3:	49 89 c6             	mov    %rax,%r14
  a51fb6:	48 85 c0             	test   %rax,%rax
  a51fb9:	0f 84 91 00 00 00    	je     a52050 <efi_low_alloc+0x170>
  a51fbf:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
  a51fc4:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
  a51fc9:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  a51fce:	31 d2                	xor    %edx,%edx
  a51fd0:	49 83 c7 01          	add    $0x1,%r15
  a51fd4:	48 f7 f1             	div    %rcx
  a51fd7:	4c 39 f8             	cmp    %r15,%rax
  a51fda:	0f 86 90 00 00 00    	jbe    a52070 <efi_low_alloc+0x190>
  a51fe0:	4c 89 f8             	mov    %r15,%rax
  a51fe3:	48 0f af c1          	imul   %rcx,%rax
  a51fe7:	48 01 f0             	add    %rsi,%rax
  a51fea:	83 38 07             	cmpl   $0x7,(%rax)
  a51fed:	75 da                	jne    a51fc9 <efi_low_alloc+0xe9>
  a51fef:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a51ff3:	4c 39 e2             	cmp    %r12,%rdx
  a51ff6:	72 d1                	jb     a51fc9 <efi_low_alloc+0xe9>
  a51ff8:	48 8b 78 08          	mov    0x8(%rax),%rdi
  a51ffc:	48 c1 e2 0c          	shl    $0xc,%rdx
  a52000:	48 01 fa             	add    %rdi,%rdx
  a52003:	48 8d 47 ff          	lea    -0x1(%rdi),%rax
  a52007:	48 85 ff             	test   %rdi,%rdi
  a5200a:	49 0f 44 c5          	cmove  %r13,%rax
  a5200e:	48 89 c7             	mov    %rax,%rdi
  a52011:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  a52015:	48 09 f8             	or     %rdi,%rax
  a52018:	48 83 c0 01          	add    $0x1,%rax
  a5201c:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  a52021:	48 01 d8             	add    %rbx,%rax
  a52024:	48 39 d0             	cmp    %rdx,%rax
  a52027:	77 a0                	ja     a51fc9 <efi_low_alloc+0xe9>
  a52029:	e8 92 e1 ff ff       	callq  a501c0 <__efi_early>
  a5202e:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52032:	4c 8b 48 28          	mov    0x28(%rax),%r9
  a52036:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a5203a:	0f 85 58 ff ff ff    	jne    a51f98 <efi_low_alloc+0xb8>
  a52040:	8b 7a 20             	mov    0x20(%rdx),%edi
  a52043:	e9 54 ff ff ff       	jmpq   a51f9c <efi_low_alloc+0xbc>
  a52048:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5204f:	00 
  a52050:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  a52055:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  a5205a:	31 d2                	xor    %edx,%edx
  a5205c:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
  a52061:	48 89 03             	mov    %rax,(%rbx)
  a52064:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  a52069:	48 f7 74 24 20       	divq   0x20(%rsp)
  a5206e:	66 90                	xchg   %ax,%ax
  a52070:	49 39 c7             	cmp    %rax,%r15
  a52073:	48 b8 0e 00 00 00 00 	movabs $0x800000000000000e,%rax
  a5207a:	00 00 80 
  a5207d:	4c 0f 44 f0          	cmove  %rax,%r14
  a52081:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  a52086:	e8 35 e1 ff ff       	callq  a501c0 <__efi_early>
  a5208b:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  a52090:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52094:	48 8b 50 28          	mov    0x28(%rax),%rdx
  a52098:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a5209c:	75 22                	jne    a520c0 <efi_low_alloc+0x1e0>
  a5209e:	8b 79 30             	mov    0x30(%rcx),%edi
  a520a1:	31 c0                	xor    %eax,%eax
  a520a3:	ff d2                	callq  *%rdx
  a520a5:	48 83 c4 78          	add    $0x78,%rsp
  a520a9:	4c 89 f0             	mov    %r14,%rax
  a520ac:	5b                   	pop    %rbx
  a520ad:	5d                   	pop    %rbp
  a520ae:	41 5c                	pop    %r12
  a520b0:	41 5d                	pop    %r13
  a520b2:	41 5e                	pop    %r14
  a520b4:	41 5f                	pop    %r15
  a520b6:	c3                   	retq   
  a520b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a520be:	00 00 
  a520c0:	48 8b 79 48          	mov    0x48(%rcx),%rdi
  a520c4:	eb db                	jmp    a520a1 <efi_low_alloc+0x1c1>
  a520c6:	49 be 0e 00 00 00 00 	movabs $0x800000000000000e,%r14
  a520cd:	00 00 80 
  a520d0:	eb af                	jmp    a52081 <efi_low_alloc+0x1a1>
  a520d2:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a520d9:	00 00 00 00 
  a520dd:	0f 1f 00             	nopl   (%rax)

0000000000a520e0 <efi_free>:
  a520e0:	f3 0f 1e fa          	endbr64 
  a520e4:	48 85 f6             	test   %rsi,%rsi
  a520e7:	74 57                	je     a52140 <efi_free+0x60>
  a520e9:	41 54                	push   %r12
  a520eb:	4c 8d 66 ff          	lea    -0x1(%rsi),%r12
  a520ef:	55                   	push   %rbp
  a520f0:	4c 89 e6             	mov    %r12,%rsi
  a520f3:	48 89 d5             	mov    %rdx,%rbp
  a520f6:	48 81 ce ff 0f 00 00 	or     $0xfff,%rsi
  a520fd:	4c 8d 66 01          	lea    0x1(%rsi),%r12
  a52101:	48 83 ec 08          	sub    $0x8,%rsp
  a52105:	49 c1 ec 0c          	shr    $0xc,%r12
  a52109:	e8 b2 e0 ff ff       	callq  a501c0 <__efi_early>
  a5210e:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52112:	48 8b 48 28          	mov    0x28(%rax),%rcx
  a52116:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a5211a:	75 14                	jne    a52130 <efi_free+0x50>
  a5211c:	8b 7a 24             	mov    0x24(%rdx),%edi
  a5211f:	48 83 c4 08          	add    $0x8,%rsp
  a52123:	4c 89 e2             	mov    %r12,%rdx
  a52126:	48 89 ee             	mov    %rbp,%rsi
  a52129:	31 c0                	xor    %eax,%eax
  a5212b:	5d                   	pop    %rbp
  a5212c:	41 5c                	pop    %r12
  a5212e:	ff e1                	jmpq   *%rcx
  a52130:	48 8b 7a 30          	mov    0x30(%rdx),%rdi
  a52134:	eb e9                	jmp    a5211f <efi_free+0x3f>
  a52136:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a5213d:	00 00 00 
  a52140:	c3                   	retq   
  a52141:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a52148:	00 00 00 00 
  a5214c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000a52150 <efi_parse_options>:
  a52150:	f3 0f 1e fa          	endbr64 
  a52154:	55                   	push   %rbp
  a52155:	48 8d 35 dd 24 00 00 	lea    0x24dd(%rip),%rsi        # a54639 <efi_MemoryOverWriteRequest_name+0x319>
  a5215c:	48 89 fd             	mov    %rdi,%rbp
  a5215f:	53                   	push   %rbx
  a52160:	48 83 ec 08          	sub    $0x8,%rsp
  a52164:	e8 f7 b9 ff ff       	callq  a4db60 <strstr>
  a52169:	48 39 c5             	cmp    %rax,%rbp
  a5216c:	0f 84 11 01 00 00    	je     a52283 <efi_parse_options+0x133>
  a52172:	48 85 c0             	test   %rax,%rax
  a52175:	74 0f                	je     a52186 <efi_parse_options+0x36>
  a52177:	48 39 c5             	cmp    %rax,%rbp
  a5217a:	73 0a                	jae    a52186 <efi_parse_options+0x36>
  a5217c:	80 78 ff 20          	cmpb   $0x20,-0x1(%rax)
  a52180:	0f 84 fd 00 00 00    	je     a52283 <efi_parse_options+0x133>
  a52186:	48 8d 35 0a 28 00 00 	lea    0x280a(%rip),%rsi        # a54997 <efi_MemoryOverWriteRequest_name+0x677>
  a5218d:	48 89 ef             	mov    %rbp,%rdi
  a52190:	e8 cb b9 ff ff       	callq  a4db60 <strstr>
  a52195:	48 39 c5             	cmp    %rax,%rbp
  a52198:	0f 84 f4 00 00 00    	je     a52292 <efi_parse_options+0x142>
  a5219e:	48 85 c0             	test   %rax,%rax
  a521a1:	74 0f                	je     a521b2 <efi_parse_options+0x62>
  a521a3:	48 39 c5             	cmp    %rax,%rbp
  a521a6:	73 0a                	jae    a521b2 <efi_parse_options+0x62>
  a521a8:	80 78 ff 20          	cmpb   $0x20,-0x1(%rax)
  a521ac:	0f 84 e0 00 00 00    	je     a52292 <efi_parse_options+0x142>
  a521b2:	48 8d 35 e4 27 00 00 	lea    0x27e4(%rip),%rsi        # a5499d <efi_MemoryOverWriteRequest_name+0x67d>
  a521b9:	48 89 ef             	mov    %rbp,%rdi
  a521bc:	e8 9f b9 ff ff       	callq  a4db60 <strstr>
  a521c1:	48 89 c3             	mov    %rax,%rbx
  a521c4:	48 85 c0             	test   %rax,%rax
  a521c7:	74 73                	je     a5223c <efi_parse_options+0xec>
  a521c9:	48 8d 3d cd 27 00 00 	lea    0x27cd(%rip),%rdi        # a5499d <efi_MemoryOverWriteRequest_name+0x67d>
  a521d0:	e8 5b b9 ff ff       	callq  a4db30 <strlen>
  a521d5:	48 01 c3             	add    %rax,%rbx
  a521d8:	f6 03 df             	testb  $0xdf,(%rbx)
  a521db:	74 5f                	je     a5223c <efi_parse_options+0xec>
  a521dd:	48 8d 2d be 27 00 00 	lea    0x27be(%rip),%rbp        # a549a2 <efi_MemoryOverWriteRequest_name+0x682>
  a521e4:	0f 1f 40 00          	nopl   0x0(%rax)
  a521e8:	ba 07 00 00 00       	mov    $0x7,%edx
  a521ed:	48 89 ee             	mov    %rbp,%rsi
  a521f0:	48 89 df             	mov    %rbx,%rdi
  a521f3:	e8 88 b7 ff ff       	callq  a4d980 <strncmp>
  a521f8:	85 c0                	test   %eax,%eax
  a521fa:	74 6c                	je     a52268 <efi_parse_options+0x118>
  a521fc:	ba 07 00 00 00       	mov    $0x7,%edx
  a52201:	48 8d 35 a2 27 00 00 	lea    0x27a2(%rip),%rsi        # a549aa <efi_MemoryOverWriteRequest_name+0x68a>
  a52208:	48 89 df             	mov    %rbx,%rdi
  a5220b:	e8 70 b7 ff ff       	callq  a4d980 <strncmp>
  a52210:	85 c0                	test   %eax,%eax
  a52212:	74 34                	je     a52248 <efi_parse_options+0xf8>
  a52214:	0f b6 03             	movzbl (%rbx),%eax
  a52217:	a8 df                	test   $0xdf,%al
  a52219:	75 09                	jne    a52224 <efi_parse_options+0xd4>
  a5221b:	eb 1f                	jmp    a5223c <efi_parse_options+0xec>
  a5221d:	0f 1f 00             	nopl   (%rax)
  a52220:	84 d2                	test   %dl,%dl
  a52222:	74 18                	je     a5223c <efi_parse_options+0xec>
  a52224:	89 c1                	mov    %eax,%ecx
  a52226:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  a5222a:	48 83 c3 01          	add    $0x1,%rbx
  a5222e:	89 c2                	mov    %eax,%edx
  a52230:	83 e2 df             	and    $0xffffffdf,%edx
  a52233:	80 f9 2c             	cmp    $0x2c,%cl
  a52236:	75 e8                	jne    a52220 <efi_parse_options+0xd0>
  a52238:	84 d2                	test   %dl,%dl
  a5223a:	75 ac                	jne    a521e8 <efi_parse_options+0x98>
  a5223c:	48 83 c4 08          	add    $0x8,%rsp
  a52240:	31 c0                	xor    %eax,%eax
  a52242:	5b                   	pop    %rbx
  a52243:	5d                   	pop    %rbp
  a52244:	c3                   	retq   
  a52245:	0f 1f 00             	nopl   (%rax)
  a52248:	48 8d 3d 5b 27 00 00 	lea    0x275b(%rip),%rdi        # a549aa <efi_MemoryOverWriteRequest_name+0x68a>
  a5224f:	e8 dc b8 ff ff       	callq  a4db30 <strlen>
  a52254:	c7 05 d2 3c 00 00 01 	movl   $0x1,0x3cd2(%rip)        # a55f30 <__novamap>
  a5225b:	00 00 00 
  a5225e:	48 01 c3             	add    %rax,%rbx
  a52261:	eb b1                	jmp    a52214 <efi_parse_options+0xc4>
  a52263:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a52268:	48 89 ef             	mov    %rbp,%rdi
  a5226b:	e8 c0 b8 ff ff       	callq  a4db30 <strlen>
  a52270:	48 c7 05 c5 3c 00 00 	movq   $0xffffffffffffffff,0x3cc5(%rip)        # a55f40 <__chunk_size>
  a52277:	ff ff ff ff 
  a5227b:	48 01 c3             	add    %rax,%rbx
  a5227e:	e9 79 ff ff ff       	jmpq   a521fc <efi_parse_options+0xac>
  a52283:	c7 05 ab 3c 00 00 01 	movl   $0x1,0x3cab(%rip)        # a55f38 <__nokaslr>
  a5228a:	00 00 00 
  a5228d:	e9 f4 fe ff ff       	jmpq   a52186 <efi_parse_options+0x36>
  a52292:	c7 05 98 3c 00 00 01 	movl   $0x1,0x3c98(%rip)        # a55f34 <__quiet>
  a52299:	00 00 00 
  a5229c:	e9 11 ff ff ff       	jmpq   a521b2 <efi_parse_options+0x62>
  a522a1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a522a8:	00 00 00 00 
  a522ac:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000a522b0 <handle_cmdline_files>:
  a522b0:	f3 0f 1e fa          	endbr64 
  a522b4:	41 57                	push   %r15
  a522b6:	41 56                	push   %r14
  a522b8:	41 55                	push   %r13
  a522ba:	41 54                	push   %r12
  a522bc:	55                   	push   %rbp
  a522bd:	53                   	push   %rbx
  a522be:	48 81 ec a8 02 00 00 	sub    $0x2a8,%rsp
  a522c5:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
  a522ca:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
  a522cf:	4c 89 44 24 58       	mov    %r8,0x58(%rsp)
  a522d4:	4c 89 4c 24 50       	mov    %r9,0x50(%rsp)
  a522d9:	48 c7 44 24 70 00 00 	movq   $0x0,0x70(%rsp)
  a522e0:	00 00 
  a522e2:	4d 85 c9             	test   %r9,%r9
  a522e5:	0f 84 7d 03 00 00    	je     a52668 <handle_cmdline_files+0x3b8>
  a522eb:	48 83 bc 24 e0 02 00 	cmpq   $0x0,0x2e0(%rsp)
  a522f2:	00 00 
  a522f4:	0f 84 6e 03 00 00    	je     a52668 <handle_cmdline_files+0x3b8>
  a522fa:	48 8b 84 24 e0 02 00 	mov    0x2e0(%rsp),%rax
  a52301:	00 
  a52302:	49 c7 01 00 00 00 00 	movq   $0x0,(%r9)
  a52309:	48 89 d5             	mov    %rdx,%rbp
  a5230c:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  a52313:	48 85 d2             	test   %rdx,%rdx
  a52316:	0f 84 2c 03 00 00    	je     a52648 <handle_cmdline_files+0x398>
  a5231c:	80 3a 00             	cmpb   $0x0,(%rdx)
  a5231f:	0f 84 23 03 00 00    	je     a52648 <handle_cmdline_files+0x398>
  a52325:	49 89 cf             	mov    %rcx,%r15
  a52328:	48 89 d7             	mov    %rdx,%rdi
  a5232b:	45 31 e4             	xor    %r12d,%r12d
  a5232e:	66 90                	xchg   %ax,%ax
  a52330:	4c 89 fe             	mov    %r15,%rsi
  a52333:	e8 28 b8 ff ff       	callq  a4db60 <strstr>
  a52338:	48 89 c3             	mov    %rax,%rbx
  a5233b:	48 85 c0             	test   %rax,%rax
  a5233e:	0f 84 f6 02 00 00    	je     a5263a <handle_cmdline_files+0x38a>
  a52344:	4c 89 ff             	mov    %r15,%rdi
  a52347:	e8 e4 b7 ff ff       	callq  a4db30 <strlen>
  a5234c:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
  a52350:	0f b6 07             	movzbl (%rdi),%eax
  a52353:	3c 2f                	cmp    $0x2f,%al
  a52355:	75 15                	jne    a5236c <handle_cmdline_files+0xbc>
  a52357:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a5235e:	00 00 
  a52360:	0f b6 47 01          	movzbl 0x1(%rdi),%eax
  a52364:	48 83 c7 01          	add    $0x1,%rdi
  a52368:	3c 2f                	cmp    $0x2f,%al
  a5236a:	74 f4                	je     a52360 <handle_cmdline_files+0xb0>
  a5236c:	3c 5c                	cmp    $0x5c,%al
  a5236e:	74 f0                	je     a52360 <handle_cmdline_files+0xb0>
  a52370:	a8 df                	test   $0xdf,%al
  a52372:	74 14                	je     a52388 <handle_cmdline_files+0xd8>
  a52374:	0f 1f 40 00          	nopl   0x0(%rax)
  a52378:	3c 0a                	cmp    $0xa,%al
  a5237a:	74 0c                	je     a52388 <handle_cmdline_files+0xd8>
  a5237c:	0f b6 47 01          	movzbl 0x1(%rdi),%eax
  a52380:	48 83 c7 01          	add    $0x1,%rdi
  a52384:	a8 df                	test   $0xdf,%al
  a52386:	75 f0                	jne    a52378 <handle_cmdline_files+0xc8>
  a52388:	41 83 c4 01          	add    $0x1,%r12d
  a5238c:	84 c0                	test   %al,%al
  a5238e:	75 a0                	jne    a52330 <handle_cmdline_files+0x80>
  a52390:	44 89 64 24 34       	mov    %r12d,0x34(%rsp)
  a52395:	e8 26 de ff ff       	callq  a501c0 <__efi_early>
  a5239a:	48 63 54 24 34       	movslq 0x34(%rsp),%rdx
  a5239f:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a523a3:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a523a7:	48 c1 e2 04          	shl    $0x4,%rdx
  a523ab:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a523af:	0f 85 c4 02 00 00    	jne    a52679 <handle_cmdline_files+0x3c9>
  a523b5:	8b 79 2c             	mov    0x2c(%rcx),%edi
  a523b8:	48 8d 4c 24 68       	lea    0x68(%rsp),%rcx
  a523bd:	be 02 00 00 00       	mov    $0x2,%esi
  a523c2:	31 c0                	xor    %eax,%eax
  a523c4:	41 ff d0             	callq  *%r8
  a523c7:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
  a523cc:	48 85 c0             	test   %rax,%rax
  a523cf:	0f 85 11 06 00 00    	jne    a529e6 <handle_cmdline_files+0x736>
  a523d5:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  a523dc:	00 00 
  a523de:	45 31 e4             	xor    %r12d,%r12d
  a523e1:	4d 89 fe             	mov    %r15,%r14
  a523e4:	48 c7 44 24 10 00 00 	movq   $0x0,0x10(%rsp)
  a523eb:	00 00 
  a523ed:	0f 1f 00             	nopl   (%rax)
  a523f0:	48 89 ef             	mov    %rbp,%rdi
  a523f3:	4c 89 f6             	mov    %r14,%rsi
  a523f6:	44 89 64 24 30       	mov    %r12d,0x30(%rsp)
  a523fb:	44 89 64 24 1c       	mov    %r12d,0x1c(%rsp)
  a52400:	e8 5b b7 ff ff       	callq  a4db60 <strstr>
  a52405:	48 89 c5             	mov    %rax,%rbp
  a52408:	48 85 c0             	test   %rax,%rax
  a5240b:	0f 84 db 02 00 00    	je     a526ec <handle_cmdline_files+0x43c>
  a52411:	4c 89 f7             	mov    %r14,%rdi
  a52414:	e8 17 b7 ff ff       	callq  a4db30 <strlen>
  a52419:	48 01 c5             	add    %rax,%rbp
  a5241c:	4c 89 e0             	mov    %r12,%rax
  a5241f:	48 c1 e0 04          	shl    $0x4,%rax
  a52423:	48 03 44 24 68       	add    0x68(%rsp),%rax
  a52428:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a5242d:	66 0f be 45 00       	movsbw 0x0(%rbp),%ax
  a52432:	3c 5c                	cmp    $0x5c,%al
  a52434:	74 0a                	je     a52440 <handle_cmdline_files+0x190>
  a52436:	3c 2f                	cmp    $0x2f,%al
  a52438:	75 17                	jne    a52451 <handle_cmdline_files+0x1a1>
  a5243a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a52440:	66 0f be 45 01       	movsbw 0x1(%rbp),%ax
  a52445:	48 83 c5 01          	add    $0x1,%rbp
  a52449:	3c 2f                	cmp    $0x2f,%al
  a5244b:	74 f3                	je     a52440 <handle_cmdline_files+0x190>
  a5244d:	3c 5c                	cmp    $0x5c,%al
  a5244f:	74 ef                	je     a52440 <handle_cmdline_files+0x190>
  a52451:	4c 8d ac 24 a0 00 00 	lea    0xa0(%rsp),%r13
  a52458:	00 
  a52459:	4c 89 ea             	mov    %r13,%rdx
  a5245c:	a8 df                	test   $0xdf,%al
  a5245e:	74 43                	je     a524a3 <handle_cmdline_files+0x1f3>
  a52460:	3c 0a                	cmp    $0xa,%al
  a52462:	74 3f                	je     a524a3 <handle_cmdline_files+0x1f3>
  a52464:	bf 5c 00 00 00       	mov    $0x5c,%edi
  a52469:	eb 12                	jmp    a5247d <handle_cmdline_files+0x1cd>
  a5246b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a52470:	48 8d 9c 24 a0 02 00 	lea    0x2a0(%rsp),%rbx
  a52477:	00 
  a52478:	48 39 da             	cmp    %rbx,%rdx
  a5247b:	73 26                	jae    a524a3 <handle_cmdline_files+0x1f3>
  a5247d:	48 83 c5 01          	add    $0x1,%rbp
  a52481:	48 83 c2 02          	add    $0x2,%rdx
  a52485:	3c 2f                	cmp    $0x2f,%al
  a52487:	0f 44 c7             	cmove  %edi,%eax
  a5248a:	66 89 42 fe          	mov    %ax,-0x2(%rdx)
  a5248e:	66 0f be 45 00       	movsbw 0x0(%rbp),%ax
  a52493:	a8 df                	test   $0xdf,%al
  a52495:	40 0f 95 c6          	setne  %sil
  a52499:	3c 0a                	cmp    $0xa,%al
  a5249b:	0f 95 c1             	setne  %cl
  a5249e:	40 84 ce             	test   %cl,%sil
  a524a1:	75 cd                	jne    a52470 <handle_cmdline_files+0x1c0>
  a524a3:	31 c0                	xor    %eax,%eax
  a524a5:	66 89 02             	mov    %ax,(%rdx)
  a524a8:	4d 85 e4             	test   %r12,%r12
  a524ab:	0f 84 af 02 00 00    	je     a52760 <handle_cmdline_files+0x4b0>
  a524b1:	48 b8 92 6e 57 09 3f 	movabs $0x11d26d3f09576e92,%rax
  a524b8:	6d d2 11 
  a524bb:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
  a524c2:	00 
  a524c3:	48 b8 8e 39 00 a0 c9 	movabs $0x3b7269c9a000398e,%rax
  a524ca:	69 72 3b 
  a524cd:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
  a524d4:	00 
  a524d5:	e8 e6 dc ff ff       	callq  a501c0 <__efi_early>
  a524da:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a524de:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a524e2:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  a524e7:	0f 84 53 02 00 00    	je     a52740 <handle_cmdline_files+0x490>
  a524ed:	48 8b 78 08          	mov    0x8(%rax),%rdi
  a524f1:	45 31 c9             	xor    %r9d,%r9d
  a524f4:	31 c0                	xor    %eax,%eax
  a524f6:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  a524fb:	48 8d 54 24 78       	lea    0x78(%rsp),%rdx
  a52500:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  a52506:	4c 89 e9             	mov    %r13,%rcx
  a52509:	41 ff d2             	callq  *%r10
  a5250c:	48 85 c0             	test   %rax,%rax
  a5250f:	0f 85 fb 03 00 00    	jne    a52910 <handle_cmdline_files+0x660>
  a52515:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
  a5251a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  a5251f:	4c 89 38             	mov    %r15,(%rax)
  a52522:	48 c7 84 24 88 00 00 	movq   $0x0,0x88(%rsp)
  a52529:	00 00 00 00 00 
  a5252e:	e8 8d dc ff ff       	callq  a501c0 <__efi_early>
  a52533:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52537:	4c 8b 48 28          	mov    0x28(%rax),%r9
  a5253b:	0f 84 0f 02 00 00    	je     a52750 <handle_cmdline_files+0x4a0>
  a52541:	49 8b 7f 40          	mov    0x40(%r15),%rdi
  a52545:	4c 8d ac 24 88 00 00 	lea    0x88(%rsp),%r13
  a5254c:	00 
  a5254d:	4c 89 fe             	mov    %r15,%rsi
  a52550:	45 31 c0             	xor    %r8d,%r8d
  a52553:	31 c0                	xor    %eax,%eax
  a52555:	48 8d 9c 24 90 00 00 	lea    0x90(%rsp),%rbx
  a5255c:	00 
  a5255d:	4c 89 e9             	mov    %r13,%rcx
  a52560:	48 89 da             	mov    %rbx,%rdx
  a52563:	41 ff d1             	callq  *%r9
  a52566:	48 89 c2             	mov    %rax,%rdx
  a52569:	4c 8d bc 24 80 00 00 	lea    0x80(%rsp),%r15
  a52570:	00 
  a52571:	48 b8 05 00 00 00 00 	movabs $0x8000000000000005,%rax
  a52578:	00 00 80 
  a5257b:	48 39 c2             	cmp    %rax,%rdx
  a5257e:	0f 84 8f 00 00 00    	je     a52613 <handle_cmdline_files+0x363>
  a52584:	e9 17 01 00 00       	jmpq   a526a0 <handle_cmdline_files+0x3f0>
  a52589:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a52590:	48 8b 79 40          	mov    0x40(%rcx),%rdi
  a52594:	31 c0                	xor    %eax,%eax
  a52596:	4c 89 f9             	mov    %r15,%rcx
  a52599:	be 02 00 00 00       	mov    $0x2,%esi
  a5259e:	41 ff d0             	callq  *%r8
  a525a1:	48 85 c0             	test   %rax,%rax
  a525a4:	0f 85 76 02 00 00    	jne    a52820 <handle_cmdline_files+0x570>
  a525aa:	e8 11 dc ff ff       	callq  a501c0 <__efi_early>
  a525af:	4c 8b 84 24 80 00 00 	mov    0x80(%rsp),%r8
  a525b6:	00 
  a525b7:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
  a525bc:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a525c0:	4c 8b 48 28          	mov    0x28(%rax),%r9
  a525c4:	0f 84 be 00 00 00    	je     a52688 <handle_cmdline_files+0x3d8>
  a525ca:	48 8b 7e 40          	mov    0x40(%rsi),%rdi
  a525ce:	4c 89 e9             	mov    %r13,%rcx
  a525d1:	48 89 da             	mov    %rbx,%rdx
  a525d4:	31 c0                	xor    %eax,%eax
  a525d6:	41 ff d1             	callq  *%r9
  a525d9:	48 b9 05 00 00 00 00 	movabs $0x8000000000000005,%rcx
  a525e0:	00 00 80 
  a525e3:	48 39 c8             	cmp    %rcx,%rax
  a525e6:	0f 85 b4 02 00 00    	jne    a528a0 <handle_cmdline_files+0x5f0>
  a525ec:	e8 cf db ff ff       	callq  a501c0 <__efi_early>
  a525f1:	48 8b b4 24 80 00 00 	mov    0x80(%rsp),%rsi
  a525f8:	00 
  a525f9:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a525fd:	48 8b 50 28          	mov    0x28(%rax),%rdx
  a52601:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a52605:	0f 84 85 00 00 00    	je     a52690 <handle_cmdline_files+0x3e0>
  a5260b:	48 8b 79 48          	mov    0x48(%rcx),%rdi
  a5260f:	31 c0                	xor    %eax,%eax
  a52611:	ff d2                	callq  *%rdx
  a52613:	e8 a8 db ff ff       	callq  a501c0 <__efi_early>
  a52618:	48 8b 94 24 88 00 00 	mov    0x88(%rsp),%rdx
  a5261f:	00 
  a52620:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52624:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a52628:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a5262c:	0f 85 5e ff ff ff    	jne    a52590 <handle_cmdline_files+0x2e0>
  a52632:	8b 79 2c             	mov    0x2c(%rcx),%edi
  a52635:	e9 5a ff ff ff       	jmpq   a52594 <handle_cmdline_files+0x2e4>
  a5263a:	44 89 64 24 34       	mov    %r12d,0x34(%rsp)
  a5263f:	45 85 e4             	test   %r12d,%r12d
  a52642:	0f 85 4d fd ff ff    	jne    a52395 <handle_cmdline_files+0xe5>
  a52648:	48 c7 44 24 40 00 00 	movq   $0x0,0x40(%rsp)
  a5264f:	00 00 
  a52651:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
  a52656:	48 81 c4 a8 02 00 00 	add    $0x2a8,%rsp
  a5265d:	5b                   	pop    %rbx
  a5265e:	5d                   	pop    %rbp
  a5265f:	41 5c                	pop    %r12
  a52661:	41 5d                	pop    %r13
  a52663:	41 5e                	pop    %r14
  a52665:	41 5f                	pop    %r15
  a52667:	c3                   	retq   
  a52668:	48 b8 02 00 00 00 00 	movabs $0x8000000000000002,%rax
  a5266f:	00 00 80 
  a52672:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
  a52677:	eb d8                	jmp    a52651 <handle_cmdline_files+0x3a1>
  a52679:	48 8b 79 40          	mov    0x40(%rcx),%rdi
  a5267d:	e9 36 fd ff ff       	jmpq   a523b8 <handle_cmdline_files+0x108>
  a52682:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a52688:	8b 7e 24             	mov    0x24(%rsi),%edi
  a5268b:	e9 3e ff ff ff       	jmpq   a525ce <handle_cmdline_files+0x31e>
  a52690:	8b 79 30             	mov    0x30(%rcx),%edi
  a52693:	e9 77 ff ff ff       	jmpq   a5260f <handle_cmdline_files+0x35f>
  a52698:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5269f:	00 
  a526a0:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a526a5:	48 8d 35 4e 23 00 00 	lea    0x234e(%rip),%rsi        # a549fa <efi_MemoryOverWriteRequest_name+0x6da>
  a526ac:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
  a526b1:	e8 ea f2 ff ff       	callq  a519a0 <efi_printk>
  a526b6:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  a526bb:	48 85 d2             	test   %rdx,%rdx
  a526be:	0f 85 d0 04 00 00    	jne    a52b94 <handle_cmdline_files+0x8e4>
  a526c4:	8b 44 24 30          	mov    0x30(%rsp),%eax
  a526c8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  a526cd:	49 83 c4 01          	add    $0x1,%r12
  a526d1:	83 c0 01             	add    $0x1,%eax
  a526d4:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  a526d8:	48 01 5c 24 38       	add    %rbx,0x38(%rsp)
  a526dd:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  a526e1:	44 39 64 24 34       	cmp    %r12d,0x34(%rsp)
  a526e6:	0f 8f 04 fd ff ff    	jg     a523f0 <handle_cmdline_files+0x140>
  a526ec:	48 83 7c 24 38 00    	cmpq   $0x0,0x38(%rsp)
  a526f2:	0f 85 0a 03 00 00    	jne    a52a02 <handle_cmdline_files+0x752>
  a526f8:	e8 c3 da ff ff       	callq  a501c0 <__efi_early>
  a526fd:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
  a52702:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52706:	48 8b 50 28          	mov    0x28(%rax),%rdx
  a5270a:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a5270e:	0f 85 e5 02 00 00    	jne    a529f9 <handle_cmdline_files+0x749>
  a52714:	8b 79 30             	mov    0x30(%rcx),%edi
  a52717:	31 c0                	xor    %eax,%eax
  a52719:	ff d2                	callq  *%rdx
  a5271b:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  a52720:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
  a52725:	48 89 03             	mov    %rax,(%rbx)
  a52728:	48 8b 84 24 e0 02 00 	mov    0x2e0(%rsp),%rax
  a5272f:	00 
  a52730:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
  a52735:	48 89 18             	mov    %rbx,(%rax)
  a52738:	e9 14 ff ff ff       	jmpq   a52651 <handle_cmdline_files+0x3a1>
  a5273d:	0f 1f 00             	nopl   (%rax)
  a52740:	8b 78 08             	mov    0x8(%rax),%edi
  a52743:	e9 a9 fd ff ff       	jmpq   a524f1 <handle_cmdline_files+0x241>
  a52748:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5274f:	00 
  a52750:	41 8b 7f 24          	mov    0x24(%r15),%edi
  a52754:	e9 ec fd ff ff       	jmpq   a52545 <handle_cmdline_files+0x295>
  a52759:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a52760:	48 b8 22 5b 4e 96 59 	movabs $0x11d26459964e5b22,%rax
  a52767:	64 d2 11 
  a5276a:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
  a52771:	00 
  a52772:	48 b8 8e 39 00 a0 c9 	movabs $0x3b7269c9a000398e,%rax
  a52779:	69 72 3b 
  a5277c:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
  a52783:	00 
  a52784:	e8 37 da ff ff       	callq  a501c0 <__efi_early>
  a52789:	48 8b 5c 24 48       	mov    0x48(%rsp),%rbx
  a5278e:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52792:	0f 84 b8 01 00 00    	je     a52950 <handle_cmdline_files+0x6a0>
  a52798:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a5279c:	48 8b 40 18          	mov    0x18(%rax),%rax
  a527a0:	48 8b 73 18          	mov    0x18(%rbx),%rsi
  a527a4:	48 8b b8 98 00 00 00 	mov    0x98(%rax),%rdi
  a527ab:	4c 8d bc 24 80 00 00 	lea    0x80(%rsp),%r15
  a527b2:	00 
  a527b3:	48 8d 94 24 90 00 00 	lea    0x90(%rsp),%rdx
  a527ba:	00 
  a527bb:	31 c0                	xor    %eax,%eax
  a527bd:	4c 89 f9             	mov    %r15,%rcx
  a527c0:	41 ff d0             	callq  *%r8
  a527c3:	48 89 c3             	mov    %rax,%rbx
  a527c6:	48 85 c0             	test   %rax,%rax
  a527c9:	0f 85 ff 01 00 00    	jne    a529ce <handle_cmdline_files+0x71e>
  a527cf:	e8 ec d9 ff ff       	callq  a501c0 <__efi_early>
  a527d4:	48 8b b4 24 80 00 00 	mov    0x80(%rsp),%rsi
  a527db:	00 
  a527dc:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a527e0:	48 8b 48 28          	mov    0x28(%rax),%rcx
  a527e4:	0f 84 7e 01 00 00    	je     a52968 <handle_cmdline_files+0x6b8>
  a527ea:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  a527ee:	48 8d 94 24 88 00 00 	lea    0x88(%rsp),%rdx
  a527f5:	00 
  a527f6:	31 c0                	xor    %eax,%eax
  a527f8:	ff d1                	callq  *%rcx
  a527fa:	48 89 c3             	mov    %rax,%rbx
  a527fd:	48 85 c0             	test   %rax,%rax
  a52800:	0f 85 72 01 00 00    	jne    a52978 <handle_cmdline_files+0x6c8>
  a52806:	48 8b 84 24 88 00 00 	mov    0x88(%rsp),%rax
  a5280d:	00 
  a5280e:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  a52813:	e9 99 fc ff ff       	jmpq   a524b1 <handle_cmdline_files+0x201>
  a52818:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5281f:	00 
  a52820:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a52825:	48 8d 35 4c 22 00 00 	lea    0x224c(%rip),%rsi        # a54a78 <efi_MemoryOverWriteRequest_name+0x758>
  a5282c:	49 89 c6             	mov    %rax,%r14
  a5282f:	e8 6c f1 ff ff       	callq  a519a0 <efi_printk>
  a52834:	4c 89 74 24 40       	mov    %r14,0x40(%rsp)
  a52839:	31 ed                	xor    %ebp,%ebp
  a5283b:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  a5283f:	39 c5                	cmp    %eax,%ebp
  a52841:	0f 8d 47 01 00 00    	jge    a5298e <handle_cmdline_files+0x6de>
  a52847:	8d 55 01             	lea    0x1(%rbp),%edx
  a5284a:	83 e8 01             	sub    $0x1,%eax
  a5284d:	48 63 dd             	movslq %ebp,%rbx
  a52850:	29 e8                	sub    %ebp,%eax
  a52852:	48 63 d2             	movslq %edx,%rdx
  a52855:	48 c1 e3 04          	shl    $0x4,%rbx
  a52859:	48 01 d0             	add    %rdx,%rax
  a5285c:	48 c1 e0 04          	shl    $0x4,%rax
  a52860:	48 89 c5             	mov    %rax,%rbp
  a52863:	eb 1c                	jmp    a52881 <handle_cmdline_files+0x5d1>
  a52865:	0f 1f 00             	nopl   (%rax)
  a52868:	49 8b 7c 24 10       	mov    0x10(%r12),%rdi
  a5286d:	48 83 c3 10          	add    $0x10,%rbx
  a52871:	4c 89 e6             	mov    %r12,%rsi
  a52874:	31 c0                	xor    %eax,%eax
  a52876:	ff d2                	callq  *%rdx
  a52878:	48 39 dd             	cmp    %rbx,%rbp
  a5287b:	0f 84 0d 01 00 00    	je     a5298e <handle_cmdline_files+0x6de>
  a52881:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  a52886:	4c 8b 24 18          	mov    (%rax,%rbx,1),%r12
  a5288a:	e8 31 d9 ff ff       	callq  a501c0 <__efi_early>
  a5288f:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52893:	48 8b 50 28          	mov    0x28(%rax),%rdx
  a52897:	75 cf                	jne    a52868 <handle_cmdline_files+0x5b8>
  a52899:	41 8b 7c 24 0c       	mov    0xc(%r12),%edi
  a5289e:	eb cd                	jmp    a5286d <handle_cmdline_files+0x5bd>
  a528a0:	4c 8b ac 24 80 00 00 	mov    0x80(%rsp),%r13
  a528a7:	00 
  a528a8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  a528ad:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  a528b2:	49 8b 45 08          	mov    0x8(%r13),%rax
  a528b6:	48 89 43 08          	mov    %rax,0x8(%rbx)
  a528ba:	e8 01 d9 ff ff       	callq  a501c0 <__efi_early>
  a528bf:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  a528c4:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a528c8:	48 8b 48 28          	mov    0x28(%rax),%rcx
  a528cc:	48 8b 40 18          	mov    0x18(%rax),%rax
  a528d0:	0f 84 9a 00 00 00    	je     a52970 <handle_cmdline_files+0x6c0>
  a528d6:	48 8b 78 48          	mov    0x48(%rax),%rdi
  a528da:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
  a528df:	4c 89 ee             	mov    %r13,%rsi
  a528e2:	31 c0                	xor    %eax,%eax
  a528e4:	ff d1                	callq  *%rcx
  a528e6:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  a528eb:	48 85 d2             	test   %rdx,%rdx
  a528ee:	0f 84 d0 fd ff ff    	je     a526c4 <handle_cmdline_files+0x414>
  a528f4:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a528f9:	48 8d 35 18 21 00 00 	lea    0x2118(%rip),%rsi        # a54a18 <efi_MemoryOverWriteRequest_name+0x6f8>
  a52900:	49 89 d6             	mov    %rdx,%r14
  a52903:	e8 98 f0 ff ff       	callq  a519a0 <efi_printk>
  a52908:	e9 27 ff ff ff       	jmpq   a52834 <handle_cmdline_files+0x584>
  a5290d:	0f 1f 00             	nopl   (%rax)
  a52910:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  a52915:	48 8d 35 c8 20 00 00 	lea    0x20c8(%rip),%rsi        # a549e4 <efi_MemoryOverWriteRequest_name+0x6c4>
  a5291c:	49 89 c6             	mov    %rax,%r14
  a5291f:	48 89 df             	mov    %rbx,%rdi
  a52922:	e8 79 f0 ff ff       	callq  a519a0 <efi_printk>
  a52927:	4c 89 ee             	mov    %r13,%rsi
  a5292a:	48 89 df             	mov    %rbx,%rdi
  a5292d:	e8 9e d8 ff ff       	callq  a501d0 <efi_char16_printk>
  a52932:	48 8d 35 aa 1c 00 00 	lea    0x1caa(%rip),%rsi        # a545e3 <efi_MemoryOverWriteRequest_name+0x2c3>
  a52939:	48 89 df             	mov    %rbx,%rdi
  a5293c:	e8 5f f0 ff ff       	callq  a519a0 <efi_printk>
  a52941:	e9 ee fe ff ff       	jmpq   a52834 <handle_cmdline_files+0x584>
  a52946:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a5294d:	00 00 00 
  a52950:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a52954:	48 8b 40 18          	mov    0x18(%rax),%rax
  a52958:	8b 73 0c             	mov    0xc(%rbx),%esi
  a5295b:	8b 78 58             	mov    0x58(%rax),%edi
  a5295e:	e9 48 fe ff ff       	jmpq   a527ab <handle_cmdline_files+0x4fb>
  a52963:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a52968:	8b 7e 08             	mov    0x8(%rsi),%edi
  a5296b:	e9 7e fe ff ff       	jmpq   a527ee <handle_cmdline_files+0x53e>
  a52970:	8b 78 30             	mov    0x30(%rax),%edi
  a52973:	e9 62 ff ff ff       	jmpq   a528da <handle_cmdline_files+0x62a>
  a52978:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a5297d:	48 8d 35 49 20 00 00 	lea    0x2049(%rip),%rsi        # a549cd <efi_MemoryOverWriteRequest_name+0x6ad>
  a52984:	e8 17 f0 ff ff       	callq  a519a0 <efi_printk>
  a52989:	48 89 5c 24 40       	mov    %rbx,0x40(%rsp)
  a5298e:	e8 2d d8 ff ff       	callq  a501c0 <__efi_early>
  a52993:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
  a52998:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a5299c:	48 8b 48 28          	mov    0x28(%rax),%rcx
  a529a0:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a529a4:	74 3b                	je     a529e1 <handle_cmdline_files+0x731>
  a529a6:	48 8b 7a 48          	mov    0x48(%rdx),%rdi
  a529aa:	31 c0                	xor    %eax,%eax
  a529ac:	ff d1                	callq  *%rcx
  a529ae:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
  a529b3:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  a529ba:	48 8b 84 24 e0 02 00 	mov    0x2e0(%rsp),%rax
  a529c1:	00 
  a529c2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  a529c9:	e9 83 fc ff ff       	jmpq   a52651 <handle_cmdline_files+0x3a1>
  a529ce:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a529d3:	48 8d 35 d8 1f 00 00 	lea    0x1fd8(%rip),%rsi        # a549b2 <efi_MemoryOverWriteRequest_name+0x692>
  a529da:	e8 c1 ef ff ff       	callq  a519a0 <efi_printk>
  a529df:	eb a8                	jmp    a52989 <handle_cmdline_files+0x6d9>
  a529e1:	8b 7a 30             	mov    0x30(%rdx),%edi
  a529e4:	eb c4                	jmp    a529aa <handle_cmdline_files+0x6fa>
  a529e6:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a529eb:	48 8d 35 46 20 00 00 	lea    0x2046(%rip),%rsi        # a54a38 <efi_MemoryOverWriteRequest_name+0x718>
  a529f2:	e8 a9 ef ff ff       	callq  a519a0 <efi_printk>
  a529f7:	eb b5                	jmp    a529ae <handle_cmdline_files+0x6fe>
  a529f9:	48 8b 79 48          	mov    0x48(%rcx),%rdi
  a529fd:	e9 15 fd ff ff       	jmpq   a52717 <handle_cmdline_files+0x467>
  a52a02:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
  a52a07:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
  a52a0c:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
  a52a11:	ba 00 10 00 00       	mov    $0x1000,%edx
  a52a16:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a52a1b:	e8 e0 f2 ff ff       	callq  a51d00 <efi_high_alloc>
  a52a20:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a52a25:	48 85 c0             	test   %rax,%rax
  a52a28:	0f 85 20 01 00 00    	jne    a52b4e <handle_cmdline_files+0x89e>
  a52a2e:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
  a52a33:	4c 8d ac 24 a0 00 00 	lea    0xa0(%rsp),%r13
  a52a3a:	00 
  a52a3b:	48 3b 5c 24 58       	cmp    0x58(%rsp),%rbx
  a52a40:	0f 87 2a 01 00 00    	ja     a52b70 <handle_cmdline_files+0x8c0>
  a52a46:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
  a52a4b:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  a52a50:	44 89 e5             	mov    %r12d,%ebp
  a52a53:	49 c1 e4 04          	shl    $0x4,%r12
  a52a57:	4a 8d 14 20          	lea    (%rax,%r12,1),%rdx
  a52a5b:	4c 8b 7a 08          	mov    0x8(%rdx),%r15
  a52a5f:	4d 85 ff             	test   %r15,%r15
  a52a62:	75 3e                	jne    a52aa2 <handle_cmdline_files+0x7f2>
  a52a64:	eb 73                	jmp    a52ad9 <handle_cmdline_files+0x829>
  a52a66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a52a6d:	00 00 00 
  a52a70:	49 8b 7e 20          	mov    0x20(%r14),%rdi
  a52a74:	31 c0                	xor    %eax,%eax
  a52a76:	48 89 d9             	mov    %rbx,%rcx
  a52a79:	4c 89 ea             	mov    %r13,%rdx
  a52a7c:	4c 89 f6             	mov    %r14,%rsi
  a52a7f:	41 ff d0             	callq  *%r8
  a52a82:	48 85 c0             	test   %rax,%rax
  a52a85:	0f 85 85 00 00 00    	jne    a52b10 <handle_cmdline_files+0x860>
  a52a8b:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  a52a90:	48 03 9c 24 a0 00 00 	add    0xa0(%rsp),%rbx
  a52a97:	00 
  a52a98:	4c 2b bc 24 a0 00 00 	sub    0xa0(%rsp),%r15
  a52a9f:	00 
  a52aa0:	74 33                	je     a52ad5 <handle_cmdline_files+0x825>
  a52aa2:	4c 39 3d 97 34 00 00 	cmp    %r15,0x3497(%rip)        # a55f40 <__chunk_size>
  a52aa9:	4c 89 fa             	mov    %r15,%rdx
  a52aac:	48 0f 46 15 8c 34 00 	cmovbe 0x348c(%rip),%rdx        # a55f40 <__chunk_size>
  a52ab3:	00 
  a52ab4:	48 89 94 24 a0 00 00 	mov    %rdx,0xa0(%rsp)
  a52abb:	00 
  a52abc:	4e 8b 34 20          	mov    (%rax,%r12,1),%r14
  a52ac0:	e8 fb d6 ff ff       	callq  a501c0 <__efi_early>
  a52ac5:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52ac9:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a52acd:	75 a1                	jne    a52a70 <handle_cmdline_files+0x7c0>
  a52acf:	41 8b 7e 14          	mov    0x14(%r14),%edi
  a52ad3:	eb 9f                	jmp    a52a74 <handle_cmdline_files+0x7c4>
  a52ad5:	4a 8d 14 20          	lea    (%rax,%r12,1),%rdx
  a52ad9:	48 8b 2a             	mov    (%rdx),%rbp
  a52adc:	e8 df d6 ff ff       	callq  a501c0 <__efi_early>
  a52ae1:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52ae5:	48 8b 50 28          	mov    0x28(%rax),%rdx
  a52ae9:	74 5e                	je     a52b49 <handle_cmdline_files+0x899>
  a52aeb:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
  a52aef:	48 89 ee             	mov    %rbp,%rsi
  a52af2:	31 c0                	xor    %eax,%eax
  a52af4:	ff d2                	callq  *%rdx
  a52af6:	48 83 44 24 08 01    	addq   $0x1,0x8(%rsp)
  a52afc:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  a52b01:	39 44 24 34          	cmp    %eax,0x34(%rsp)
  a52b05:	0f 8f 3b ff ff ff    	jg     a52a46 <handle_cmdline_files+0x796>
  a52b0b:	e9 e8 fb ff ff       	jmpq   a526f8 <handle_cmdline_files+0x448>
  a52b10:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a52b15:	48 8d 35 f4 1f 00 00 	lea    0x1ff4(%rip),%rsi        # a54b10 <efi_MemoryOverWriteRequest_name+0x7f0>
  a52b1c:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a52b21:	e8 7a ee ff ff       	callq  a519a0 <efi_printk>
  a52b26:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  a52b2b:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
  a52b30:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
  a52b35:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
  a52b3a:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a52b3f:	e8 9c f5 ff ff       	callq  a520e0 <efi_free>
  a52b44:	e9 f2 fc ff ff       	jmpq   a5283b <handle_cmdline_files+0x58b>
  a52b49:	8b 7d 0c             	mov    0xc(%rbp),%edi
  a52b4c:	eb a1                	jmp    a52aef <handle_cmdline_files+0x83f>
  a52b4e:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a52b53:	48 8d 35 46 1f 00 00 	lea    0x1f46(%rip),%rsi        # a54aa0 <efi_MemoryOverWriteRequest_name+0x780>
  a52b5a:	31 ed                	xor    %ebp,%ebp
  a52b5c:	e8 3f ee ff ff       	callq  a519a0 <efi_printk>
  a52b61:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  a52b66:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
  a52b6b:	e9 cb fc ff ff       	jmpq   a5283b <handle_cmdline_files+0x58b>
  a52b70:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a52b75:	48 8d 35 5c 1f 00 00 	lea    0x1f5c(%rip),%rsi        # a54ad8 <efi_MemoryOverWriteRequest_name+0x7b8>
  a52b7c:	31 ed                	xor    %ebp,%ebp
  a52b7e:	e8 1d ee ff ff       	callq  a519a0 <efi_printk>
  a52b83:	48 b8 02 00 00 00 00 	movabs $0x8000000000000002,%rax
  a52b8a:	00 00 80 
  a52b8d:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
  a52b92:	eb 9c                	jmp    a52b30 <handle_cmdline_files+0x880>
  a52b94:	49 89 d6             	mov    %rdx,%r14
  a52b97:	e9 98 fc ff ff       	jmpq   a52834 <handle_cmdline_files+0x584>
  a52b9c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000a52ba0 <efi_relocate_kernel>:
  a52ba0:	f3 0f 1e fa          	endbr64 
  a52ba4:	41 57                	push   %r15
  a52ba6:	41 56                	push   %r14
  a52ba8:	41 55                	push   %r13
  a52baa:	41 54                	push   %r12
  a52bac:	49 89 d4             	mov    %rdx,%r12
  a52baf:	55                   	push   %rbp
  a52bb0:	53                   	push   %rbx
  a52bb1:	48 83 ec 28          	sub    $0x28,%rsp
  a52bb5:	48 85 d2             	test   %rdx,%rdx
  a52bb8:	0f 94 c0             	sete   %al
  a52bbb:	48 39 ca             	cmp    %rcx,%rdx
  a52bbe:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  a52bc3:	48 c7 44 24 10 00 00 	movq   $0x0,0x10(%rsp)
  a52bca:	00 00 
  a52bcc:	0f 97 c2             	seta   %dl
  a52bcf:	09 d0                	or     %edx,%eax
  a52bd1:	48 85 c9             	test   %rcx,%rcx
  a52bd4:	0f 94 c2             	sete   %dl
  a52bd7:	08 d0                	or     %dl,%al
  a52bd9:	0f 85 99 00 00 00    	jne    a52c78 <efi_relocate_kernel+0xd8>
  a52bdf:	48 89 f3             	mov    %rsi,%rbx
  a52be2:	48 85 f6             	test   %rsi,%rsi
  a52be5:	0f 84 8d 00 00 00    	je     a52c78 <efi_relocate_kernel+0xd8>
  a52beb:	48 89 cd             	mov    %rcx,%rbp
  a52bee:	48 8d 49 ff          	lea    -0x1(%rcx),%rcx
  a52bf2:	4d 89 ce             	mov    %r9,%r14
  a52bf5:	4c 8b 3e             	mov    (%rsi),%r15
  a52bf8:	48 81 c9 ff 0f 00 00 	or     $0xfff,%rcx
  a52bff:	49 89 fd             	mov    %rdi,%r13
  a52c02:	48 83 c1 01          	add    $0x1,%rcx
  a52c06:	48 c1 e9 0c          	shr    $0xc,%rcx
  a52c0a:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  a52c0f:	e8 ac d5 ff ff       	callq  a501c0 <__efi_early>
  a52c14:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  a52c19:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52c1d:	4c 8b 48 28          	mov    0x28(%rax),%r9
  a52c21:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a52c25:	74 71                	je     a52c98 <efi_relocate_kernel+0xf8>
  a52c27:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
  a52c2b:	4c 8d 44 24 18       	lea    0x18(%rsp),%r8
  a52c30:	ba 02 00 00 00       	mov    $0x2,%edx
  a52c35:	be 02 00 00 00       	mov    $0x2,%esi
  a52c3a:	31 c0                	xor    %eax,%eax
  a52c3c:	41 ff d1             	callq  *%r9
  a52c3f:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  a52c44:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
  a52c49:	48 85 c0             	test   %rax,%rax
  a52c4c:	75 52                	jne    a52ca0 <efi_relocate_kernel+0x100>
  a52c4e:	4c 89 e2             	mov    %r12,%rdx
  a52c51:	4c 89 fe             	mov    %r15,%rsi
  a52c54:	e8 67 b0 ff ff       	callq  a4dcc0 <memcpy>
  a52c59:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  a52c5e:	48 89 03             	mov    %rax,(%rbx)
  a52c61:	48 83 c4 28          	add    $0x28,%rsp
  a52c65:	31 c0                	xor    %eax,%eax
  a52c67:	5b                   	pop    %rbx
  a52c68:	5d                   	pop    %rbp
  a52c69:	41 5c                	pop    %r12
  a52c6b:	41 5d                	pop    %r13
  a52c6d:	41 5e                	pop    %r14
  a52c6f:	41 5f                	pop    %r15
  a52c71:	c3                   	retq   
  a52c72:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a52c78:	48 b8 02 00 00 00 00 	movabs $0x8000000000000002,%rax
  a52c7f:	00 00 80 
  a52c82:	48 83 c4 28          	add    $0x28,%rsp
  a52c86:	5b                   	pop    %rbx
  a52c87:	5d                   	pop    %rbp
  a52c88:	41 5c                	pop    %r12
  a52c8a:	41 5d                	pop    %r13
  a52c8c:	41 5e                	pop    %r14
  a52c8e:	41 5f                	pop    %r15
  a52c90:	c3                   	retq   
  a52c91:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a52c98:	8b 7a 20             	mov    0x20(%rdx),%edi
  a52c9b:	eb 8e                	jmp    a52c2b <efi_relocate_kernel+0x8b>
  a52c9d:	0f 1f 00             	nopl   (%rax)
  a52ca0:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  a52ca5:	4c 89 f2             	mov    %r14,%rdx
  a52ca8:	48 89 ee             	mov    %rbp,%rsi
  a52cab:	4c 89 ef             	mov    %r13,%rdi
  a52cae:	e8 2d f2 ff ff       	callq  a51ee0 <efi_low_alloc>
  a52cb3:	48 85 c0             	test   %rax,%rax
  a52cb6:	74 28                	je     a52ce0 <efi_relocate_kernel+0x140>
  a52cb8:	4c 89 ef             	mov    %r13,%rdi
  a52cbb:	48 8d 35 76 1e 00 00 	lea    0x1e76(%rip),%rsi        # a54b38 <efi_MemoryOverWriteRequest_name+0x818>
  a52cc2:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a52cc7:	e8 d4 ec ff ff       	callq  a519a0 <efi_printk>
  a52ccc:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  a52cd1:	48 83 c4 28          	add    $0x28,%rsp
  a52cd5:	5b                   	pop    %rbx
  a52cd6:	5d                   	pop    %rbp
  a52cd7:	41 5c                	pop    %r12
  a52cd9:	41 5d                	pop    %r13
  a52cdb:	41 5e                	pop    %r14
  a52cdd:	41 5f                	pop    %r15
  a52cdf:	c3                   	retq   
  a52ce0:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  a52ce5:	e9 64 ff ff ff       	jmpq   a52c4e <efi_relocate_kernel+0xae>
  a52cea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000a52cf0 <efi_convert_cmdline>:
  a52cf0:	f3 0f 1e fa          	endbr64 
  a52cf4:	41 56                	push   %r14
  a52cf6:	41 55                	push   %r13
  a52cf8:	41 54                	push   %r12
  a52cfa:	55                   	push   %rbp
  a52cfb:	53                   	push   %rbx
  a52cfc:	48 89 d3             	mov    %rdx,%rbx
  a52cff:	48 83 ec 10          	sub    $0x10,%rsp
  a52d03:	4c 8b 66 38          	mov    0x38(%rsi),%r12
  a52d07:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  a52d0e:	00 00 
  a52d10:	4d 85 e4             	test   %r12,%r12
  a52d13:	0f 84 d7 01 00 00    	je     a52ef0 <efi_convert_cmdline+0x200>
  a52d19:	41 0f b7 04 24       	movzwl (%r12),%eax
  a52d1e:	44 8b 46 30          	mov    0x30(%rsi),%r8d
  a52d22:	41 d1 e8             	shr    %r8d
  a52d25:	66 83 f8 0a          	cmp    $0xa,%ax
  a52d29:	0f 95 c1             	setne  %cl
  a52d2c:	66 85 c0             	test   %ax,%ax
  a52d2f:	0f 95 c2             	setne  %dl
  a52d32:	84 d1                	test   %dl,%cl
  a52d34:	0f 84 b6 01 00 00    	je     a52ef0 <efi_convert_cmdline+0x200>
  a52d3a:	45 85 c0             	test   %r8d,%r8d
  a52d3d:	0f 84 ad 01 00 00    	je     a52ef0 <efi_convert_cmdline+0x200>
  a52d43:	4c 89 e2             	mov    %r12,%rdx
  a52d46:	45 31 f6             	xor    %r14d,%r14d
  a52d49:	45 31 ed             	xor    %r13d,%r13d
  a52d4c:	eb 0a                	jmp    a52d58 <efi_convert_cmdline+0x68>
  a52d4e:	66 90                	xchg   %ax,%ax
  a52d50:	41 39 e8             	cmp    %ebp,%r8d
  a52d53:	7e 3b                	jle    a52d90 <efi_convert_cmdline+0xa0>
  a52d55:	41 89 ee             	mov    %ebp,%r14d
  a52d58:	48 83 c2 02          	add    $0x2,%rdx
  a52d5c:	31 c9                	xor    %ecx,%ecx
  a52d5e:	41 8d 6e 01          	lea    0x1(%r14),%ebp
  a52d62:	66 83 f8 7f          	cmp    $0x7f,%ax
  a52d66:	0f 97 c1             	seta   %cl
  a52d69:	66 3d ff 07          	cmp    $0x7ff,%ax
  a52d6d:	0f 97 c0             	seta   %al
  a52d70:	0f b6 c0             	movzbl %al,%eax
  a52d73:	8d 44 01 01          	lea    0x1(%rcx,%rax,1),%eax
  a52d77:	41 01 c5             	add    %eax,%r13d
  a52d7a:	0f b7 02             	movzwl (%rdx),%eax
  a52d7d:	66 85 c0             	test   %ax,%ax
  a52d80:	40 0f 95 c6          	setne  %sil
  a52d84:	66 83 f8 0a          	cmp    $0xa,%ax
  a52d88:	0f 95 c1             	setne  %cl
  a52d8b:	40 84 ce             	test   %cl,%sil
  a52d8e:	75 c0                	jne    a52d50 <efi_convert_cmdline+0x60>
  a52d90:	41 83 c5 01          	add    $0x1,%r13d
  a52d94:	31 d2                	xor    %edx,%edx
  a52d96:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  a52d9b:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  a52da1:	49 63 f5             	movslq %r13d,%rsi
  a52da4:	e8 57 ef ff ff       	callq  a51d00 <efi_high_alloc>
  a52da9:	48 85 c0             	test   %rax,%rax
  a52dac:	0f 85 5a 01 00 00    	jne    a52f0c <efi_convert_cmdline+0x21c>
  a52db2:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  a52db7:	eb 3b                	jmp    a52df4 <efi_convert_cmdline+0x104>
  a52db9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a52dc0:	bf bd ff ff ff       	mov    $0xffffffbd,%edi
  a52dc5:	ba bf ff ff ff       	mov    $0xffffffbf,%edx
  a52dca:	be ef ff ff ff       	mov    $0xffffffef,%esi
  a52dcf:	40 88 31             	mov    %sil,(%rcx)
  a52dd2:	44 89 f5             	mov    %r14d,%ebp
  a52dd5:	4d 89 cc             	mov    %r9,%r12
  a52dd8:	4c 89 c6             	mov    %r8,%rsi
  a52ddb:	88 16                	mov    %dl,(%rsi)
  a52ddd:	4c 8d 46 01          	lea    0x1(%rsi),%r8
  a52de1:	41 88 38             	mov    %dil,(%r8)
  a52de4:	49 8d 48 01          	lea    0x1(%r8),%rcx
  a52de8:	44 8d 75 ff          	lea    -0x1(%rbp),%r14d
  a52dec:	85 ed                	test   %ebp,%ebp
  a52dee:	0f 84 dc 00 00 00    	je     a52ed0 <efi_convert_cmdline+0x1e0>
  a52df4:	41 0f b7 04 24       	movzwl (%r12),%eax
  a52df9:	4d 8d 4c 24 02       	lea    0x2(%r12),%r9
  a52dfe:	8d 90 00 28 00 00    	lea    0x2800(%rax),%edx
  a52e04:	89 c7                	mov    %eax,%edi
  a52e06:	66 81 fa ff 03       	cmp    $0x3ff,%dx
  a52e0b:	77 05                	ja     a52e12 <efi_convert_cmdline+0x122>
  a52e0d:	45 85 f6             	test   %r14d,%r14d
  a52e10:	75 3e                	jne    a52e50 <efi_convert_cmdline+0x160>
  a52e12:	8d 90 00 28 ff ff    	lea    -0xd800(%rax),%edx
  a52e18:	4c 8d 41 01          	lea    0x1(%rcx),%r8
  a52e1c:	81 fa ff 07 00 00    	cmp    $0x7ff,%edx
  a52e22:	76 9c                	jbe    a52dc0 <efi_convert_cmdline+0xd0>
  a52e24:	83 f8 7f             	cmp    $0x7f,%eax
  a52e27:	0f 86 8b 00 00 00    	jbe    a52eb8 <efi_convert_cmdline+0x1c8>
  a52e2d:	89 c2                	mov    %eax,%edx
  a52e2f:	83 e7 3f             	and    $0x3f,%edi
  a52e32:	c1 ea 06             	shr    $0x6,%edx
  a52e35:	83 c7 80             	add    $0xffffff80,%edi
  a52e38:	3d ff 07 00 00       	cmp    $0x7ff,%eax
  a52e3d:	0f 87 dd 00 00 00    	ja     a52f20 <efi_convert_cmdline+0x230>
  a52e43:	83 ea 40             	sub    $0x40,%edx
  a52e46:	44 89 f5             	mov    %r14d,%ebp
  a52e49:	4d 89 cc             	mov    %r9,%r12
  a52e4c:	88 11                	mov    %dl,(%rcx)
  a52e4e:	eb 91                	jmp    a52de1 <efi_convert_cmdline+0xf1>
  a52e50:	41 0f b7 54 24 02    	movzwl 0x2(%r12),%edx
  a52e56:	8d b2 00 24 00 00    	lea    0x2400(%rdx),%esi
  a52e5c:	66 81 fe ff 03       	cmp    $0x3ff,%si
  a52e61:	77 af                	ja     a52e12 <efi_convert_cmdline+0x122>
  a52e63:	c1 e0 0a             	shl    $0xa,%eax
  a52e66:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  a52e6c:	49 83 c4 04          	add    $0x4,%r12
  a52e70:	83 ed 02             	sub    $0x2,%ebp
  a52e73:	25 00 fc 0f 00       	and    $0xffc00,%eax
  a52e78:	48 8d 71 02          	lea    0x2(%rcx),%rsi
  a52e7c:	09 d0                	or     %edx,%eax
  a52e7e:	05 00 00 01 00       	add    $0x10000,%eax
  a52e83:	89 c2                	mov    %eax,%edx
  a52e85:	c1 ea 12             	shr    $0x12,%edx
  a52e88:	83 ea 10             	sub    $0x10,%edx
  a52e8b:	88 11                	mov    %dl,(%rcx)
  a52e8d:	89 c2                	mov    %eax,%edx
  a52e8f:	c1 ea 0c             	shr    $0xc,%edx
  a52e92:	83 e2 3f             	and    $0x3f,%edx
  a52e95:	83 c2 80             	add    $0xffffff80,%edx
  a52e98:	88 51 01             	mov    %dl,0x1(%rcx)
  a52e9b:	89 c2                	mov    %eax,%edx
  a52e9d:	83 e0 3f             	and    $0x3f,%eax
  a52ea0:	c1 ea 06             	shr    $0x6,%edx
  a52ea3:	8d 78 80             	lea    -0x80(%rax),%edi
  a52ea6:	83 e2 3f             	and    $0x3f,%edx
  a52ea9:	83 c2 80             	add    $0xffffff80,%edx
  a52eac:	e9 2a ff ff ff       	jmpq   a52ddb <efi_convert_cmdline+0xeb>
  a52eb1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a52eb8:	44 89 f5             	mov    %r14d,%ebp
  a52ebb:	40 88 39             	mov    %dil,(%rcx)
  a52ebe:	4d 89 cc             	mov    %r9,%r12
  a52ec1:	4c 89 c1             	mov    %r8,%rcx
  a52ec4:	44 8d 75 ff          	lea    -0x1(%rbp),%r14d
  a52ec8:	85 ed                	test   %ebp,%ebp
  a52eca:	0f 85 24 ff ff ff    	jne    a52df4 <efi_convert_cmdline+0x104>
  a52ed0:	c6 01 00             	movb   $0x0,(%rcx)
  a52ed3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  a52ed8:	44 89 2b             	mov    %r13d,(%rbx)
  a52edb:	48 83 c4 10          	add    $0x10,%rsp
  a52edf:	5b                   	pop    %rbx
  a52ee0:	5d                   	pop    %rbp
  a52ee1:	41 5c                	pop    %r12
  a52ee3:	41 5d                	pop    %r13
  a52ee5:	41 5e                	pop    %r14
  a52ee7:	c3                   	retq   
  a52ee8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a52eef:	00 
  a52ef0:	31 d2                	xor    %edx,%edx
  a52ef2:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  a52ef7:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  a52efd:	be 01 00 00 00       	mov    $0x1,%esi
  a52f02:	e8 f9 ed ff ff       	callq  a51d00 <efi_high_alloc>
  a52f07:	48 85 c0             	test   %rax,%rax
  a52f0a:	74 2c                	je     a52f38 <efi_convert_cmdline+0x248>
  a52f0c:	48 83 c4 10          	add    $0x10,%rsp
  a52f10:	31 c0                	xor    %eax,%eax
  a52f12:	5b                   	pop    %rbx
  a52f13:	5d                   	pop    %rbp
  a52f14:	41 5c                	pop    %r12
  a52f16:	41 5d                	pop    %r13
  a52f18:	41 5e                	pop    %r14
  a52f1a:	c3                   	retq   
  a52f1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a52f20:	c1 e8 0c             	shr    $0xc,%eax
  a52f23:	83 e2 3f             	and    $0x3f,%edx
  a52f26:	8d 70 e0             	lea    -0x20(%rax),%esi
  a52f29:	83 c2 80             	add    $0xffffff80,%edx
  a52f2c:	e9 9e fe ff ff       	jmpq   a52dcf <efi_convert_cmdline+0xdf>
  a52f31:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a52f38:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  a52f3d:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  a52f43:	eb 8b                	jmp    a52ed0 <efi_convert_cmdline+0x1e0>
  a52f45:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a52f4c:	00 00 00 00 

0000000000a52f50 <efi_exit_boot_services>:
  a52f50:	f3 0f 1e fa          	endbr64 
  a52f54:	41 57                	push   %r15
  a52f56:	49 89 f7             	mov    %rsi,%r15
  a52f59:	48 89 d6             	mov    %rdx,%rsi
  a52f5c:	41 56                	push   %r14
  a52f5e:	49 89 ce             	mov    %rcx,%r14
  a52f61:	41 55                	push   %r13
  a52f63:	4d 89 c5             	mov    %r8,%r13
  a52f66:	41 54                	push   %r12
  a52f68:	55                   	push   %rbp
  a52f69:	48 89 fd             	mov    %rdi,%rbp
  a52f6c:	53                   	push   %rbx
  a52f6d:	48 89 d3             	mov    %rdx,%rbx
  a52f70:	48 83 ec 08          	sub    $0x8,%rsp
  a52f74:	e8 b7 ea ff ff       	callq  a51a30 <efi_get_memory_map>
  a52f79:	49 89 c4             	mov    %rax,%r12
  a52f7c:	48 85 c0             	test   %rax,%rax
  a52f7f:	75 4e                	jne    a52fcf <efi_exit_boot_services+0x7f>
  a52f81:	4c 89 f2             	mov    %r14,%rdx
  a52f84:	48 89 de             	mov    %rbx,%rsi
  a52f87:	48 89 ef             	mov    %rbp,%rdi
  a52f8a:	41 ff d5             	callq  *%r13
  a52f8d:	49 89 c4             	mov    %rax,%r12
  a52f90:	48 85 c0             	test   %rax,%rax
  a52f93:	75 53                	jne    a52fe8 <efi_exit_boot_services+0x98>
  a52f95:	e8 26 d2 ff ff       	callq  a501c0 <__efi_early>
  a52f9a:	48 8b 53 20          	mov    0x20(%rbx),%rdx
  a52f9e:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52fa2:	48 8b 48 28          	mov    0x28(%rax),%rcx
  a52fa6:	48 8b 12             	mov    (%rdx),%rdx
  a52fa9:	48 8b 70 18          	mov    0x18(%rax),%rsi
  a52fad:	74 61                	je     a53010 <efi_exit_boot_services+0xc0>
  a52faf:	48 8b be e8 00 00 00 	mov    0xe8(%rsi),%rdi
  a52fb6:	4c 89 fe             	mov    %r15,%rsi
  a52fb9:	31 c0                	xor    %eax,%eax
  a52fbb:	ff d1                	callq  *%rcx
  a52fbd:	49 89 c4             	mov    %rax,%r12
  a52fc0:	48 b8 02 00 00 00 00 	movabs $0x8000000000000002,%rax
  a52fc7:	00 00 80 
  a52fca:	49 39 c4             	cmp    %rax,%r12
  a52fcd:	74 51                	je     a53020 <efi_exit_boot_services+0xd0>
  a52fcf:	48 83 c4 08          	add    $0x8,%rsp
  a52fd3:	4c 89 e0             	mov    %r12,%rax
  a52fd6:	5b                   	pop    %rbx
  a52fd7:	5d                   	pop    %rbp
  a52fd8:	41 5c                	pop    %r12
  a52fda:	41 5d                	pop    %r13
  a52fdc:	41 5e                	pop    %r14
  a52fde:	41 5f                	pop    %r15
  a52fe0:	c3                   	retq   
  a52fe1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a52fe8:	e8 d3 d1 ff ff       	callq  a501c0 <__efi_early>
  a52fed:	48 8b 0b             	mov    (%rbx),%rcx
  a52ff0:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a52ff4:	48 8b 50 28          	mov    0x28(%rax),%rdx
  a52ff8:	48 8b 31             	mov    (%rcx),%rsi
  a52ffb:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a52fff:	0f 85 bb 00 00 00    	jne    a530c0 <efi_exit_boot_services+0x170>
  a53005:	8b 79 30             	mov    0x30(%rcx),%edi
  a53008:	31 c0                	xor    %eax,%eax
  a5300a:	ff d2                	callq  *%rdx
  a5300c:	eb c1                	jmp    a52fcf <efi_exit_boot_services+0x7f>
  a5300e:	66 90                	xchg   %ax,%ax
  a53010:	8b be 80 00 00 00    	mov    0x80(%rsi),%edi
  a53016:	eb 9e                	jmp    a52fb6 <efi_exit_boot_services+0x66>
  a53018:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5301f:	00 
  a53020:	48 8b 53 28          	mov    0x28(%rbx),%rdx
  a53024:	48 8b 43 08          	mov    0x8(%rbx),%rax
  a53028:	48 8b 12             	mov    (%rdx),%rdx
  a5302b:	48 89 10             	mov    %rdx,(%rax)
  a5302e:	e8 8d d1 ff ff       	callq  a501c0 <__efi_early>
  a53033:	48 8b 13             	mov    (%rbx),%rdx
  a53036:	4c 8b 4b 18          	mov    0x18(%rbx),%r9
  a5303a:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a5303e:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a53042:	4c 8b 43 10          	mov    0x10(%rbx),%r8
  a53046:	48 8b 4b 20          	mov    0x20(%rbx),%rcx
  a5304a:	48 8b 12             	mov    (%rdx),%rdx
  a5304d:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  a53051:	48 8b 40 18          	mov    0x18(%rax),%rax
  a53055:	74 79                	je     a530d0 <efi_exit_boot_services+0x180>
  a53057:	48 8b 78 38          	mov    0x38(%rax),%rdi
  a5305b:	31 c0                	xor    %eax,%eax
  a5305d:	41 ff d2             	callq  *%r10
  a53060:	49 89 c4             	mov    %rax,%r12
  a53063:	48 85 c0             	test   %rax,%rax
  a53066:	0f 85 63 ff ff ff    	jne    a52fcf <efi_exit_boot_services+0x7f>
  a5306c:	4c 89 f2             	mov    %r14,%rdx
  a5306f:	48 89 de             	mov    %rbx,%rsi
  a53072:	48 89 ef             	mov    %rbp,%rdi
  a53075:	41 ff d5             	callq  *%r13
  a53078:	49 89 c4             	mov    %rax,%r12
  a5307b:	48 85 c0             	test   %rax,%rax
  a5307e:	0f 85 4b ff ff ff    	jne    a52fcf <efi_exit_boot_services+0x7f>
  a53084:	e8 37 d1 ff ff       	callq  a501c0 <__efi_early>
  a53089:	48 8b 53 20          	mov    0x20(%rbx),%rdx
  a5308d:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53091:	48 8b 48 28          	mov    0x28(%rax),%rcx
  a53095:	48 8b 12             	mov    (%rdx),%rdx
  a53098:	48 8b 70 18          	mov    0x18(%rax),%rsi
  a5309c:	75 3a                	jne    a530d8 <efi_exit_boot_services+0x188>
  a5309e:	8b be 80 00 00 00    	mov    0x80(%rsi),%edi
  a530a4:	48 83 c4 08          	add    $0x8,%rsp
  a530a8:	4c 89 fe             	mov    %r15,%rsi
  a530ab:	31 c0                	xor    %eax,%eax
  a530ad:	5b                   	pop    %rbx
  a530ae:	5d                   	pop    %rbp
  a530af:	41 5c                	pop    %r12
  a530b1:	41 5d                	pop    %r13
  a530b3:	41 5e                	pop    %r14
  a530b5:	41 5f                	pop    %r15
  a530b7:	ff e1                	jmpq   *%rcx
  a530b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a530c0:	48 8b 79 48          	mov    0x48(%rcx),%rdi
  a530c4:	e9 3f ff ff ff       	jmpq   a53008 <efi_exit_boot_services+0xb8>
  a530c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a530d0:	8b 78 28             	mov    0x28(%rax),%edi
  a530d3:	eb 86                	jmp    a5305b <efi_exit_boot_services+0x10b>
  a530d5:	0f 1f 00             	nopl   (%rax)
  a530d8:	48 8b be e8 00 00 00 	mov    0xe8(%rsi),%rdi
  a530df:	eb c3                	jmp    a530a4 <efi_exit_boot_services+0x154>
  a530e1:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a530e8:	00 00 00 
  a530eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000a530f0 <setup_pixel_info>:
  a530f0:	45 85 c0             	test   %r8d,%r8d
  a530f3:	75 23                	jne    a53118 <setup_pixel_info+0x28>
  a530f5:	b9 20 00 00 00       	mov    $0x20,%ecx
  a530fa:	c1 e6 02             	shl    $0x2,%esi
  a530fd:	48 b8 08 00 08 08 08 	movabs $0x1808100808080008,%rax
  a53104:	10 08 18 
  a53107:	66 89 4f 16          	mov    %cx,0x16(%rdi)
  a5310b:	66 89 77 24          	mov    %si,0x24(%rdi)
  a5310f:	48 89 47 26          	mov    %rax,0x26(%rdi)
  a53113:	c3                   	retq   
  a53114:	0f 1f 40 00          	nopl   0x0(%rax)
  a53118:	41 83 f8 01          	cmp    $0x1,%r8d
  a5311c:	74 2a                	je     a53148 <setup_pixel_info+0x58>
  a5311e:	41 83 f8 02          	cmp    $0x2,%r8d
  a53122:	74 4c                	je     a53170 <setup_pixel_info+0x80>
  a53124:	b8 04 00 00 00       	mov    $0x4,%eax
  a53129:	48 c7 47 26 00 00 00 	movq   $0x0,0x26(%rdi)
  a53130:	00 
  a53131:	66 89 47 16          	mov    %ax,0x16(%rdi)
  a53135:	0f b7 47 12          	movzwl 0x12(%rdi),%eax
  a53139:	66 d1 e8             	shr    %ax
  a5313c:	66 89 47 24          	mov    %ax,0x24(%rdi)
  a53140:	c3                   	retq   
  a53141:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a53148:	ba 20 00 00 00       	mov    $0x20,%edx
  a5314d:	c1 e6 02             	shl    $0x2,%esi
  a53150:	48 b8 08 10 08 08 08 	movabs $0x1808000808081008,%rax
  a53157:	00 08 18 
  a5315a:	66 89 57 16          	mov    %dx,0x16(%rdi)
  a5315e:	66 89 77 24          	mov    %si,0x24(%rdi)
  a53162:	48 89 47 26          	mov    %rax,0x26(%rdi)
  a53166:	c3                   	retq   
  a53167:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a5316e:	00 00 
  a53170:	48 89 d0             	mov    %rdx,%rax
  a53173:	83 e0 ff             	and    $0xffffffff,%eax
  a53176:	0f 85 ec 00 00 00    	jne    a53268 <setup_pixel_info+0x178>
  a5317c:	45 31 c0             	xor    %r8d,%r8d
  a5317f:	45 31 c9             	xor    %r9d,%r9d
  a53182:	45 31 d2             	xor    %r10d,%r10d
  a53185:	48 c1 ea 20          	shr    $0x20,%rdx
  a53189:	44 88 57 27          	mov    %r10b,0x27(%rdi)
  a5318d:	48 89 d0             	mov    %rdx,%rax
  a53190:	44 88 4f 26          	mov    %r9b,0x26(%rdi)
  a53194:	83 e0 ff             	and    $0xffffffff,%eax
  a53197:	0f 84 13 01 00 00    	je     a532b0 <setup_pixel_info+0x1c0>
  a5319d:	45 31 c9             	xor    %r9d,%r9d
  a531a0:	83 e2 01             	and    $0x1,%edx
  a531a3:	75 0e                	jne    a531b3 <setup_pixel_info+0xc3>
  a531a5:	0f 1f 00             	nopl   (%rax)
  a531a8:	48 d1 e8             	shr    %rax
  a531ab:	41 83 c1 01          	add    $0x1,%r9d
  a531af:	a8 01                	test   $0x1,%al
  a531b1:	74 f5                	je     a531a8 <setup_pixel_info+0xb8>
  a531b3:	31 d2                	xor    %edx,%edx
  a531b5:	0f 1f 00             	nopl   (%rax)
  a531b8:	48 d1 e8             	shr    %rax
  a531bb:	83 c2 01             	add    $0x1,%edx
  a531be:	a8 01                	test   $0x1,%al
  a531c0:	75 f6                	jne    a531b8 <setup_pixel_info+0xc8>
  a531c2:	0f b6 c2             	movzbl %dl,%eax
  a531c5:	41 01 c0             	add    %eax,%r8d
  a531c8:	48 89 c8             	mov    %rcx,%rax
  a531cb:	44 88 4f 29          	mov    %r9b,0x29(%rdi)
  a531cf:	88 57 28             	mov    %dl,0x28(%rdi)
  a531d2:	83 e0 ff             	and    $0xffffffff,%eax
  a531d5:	0f 84 c5 00 00 00    	je     a532a0 <setup_pixel_info+0x1b0>
  a531db:	45 31 c9             	xor    %r9d,%r9d
  a531de:	f6 c1 01             	test   $0x1,%cl
  a531e1:	75 10                	jne    a531f3 <setup_pixel_info+0x103>
  a531e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a531e8:	48 d1 e8             	shr    %rax
  a531eb:	41 83 c1 01          	add    $0x1,%r9d
  a531ef:	a8 01                	test   $0x1,%al
  a531f1:	74 f5                	je     a531e8 <setup_pixel_info+0xf8>
  a531f3:	31 d2                	xor    %edx,%edx
  a531f5:	0f 1f 00             	nopl   (%rax)
  a531f8:	48 d1 e8             	shr    %rax
  a531fb:	83 c2 01             	add    $0x1,%edx
  a531fe:	a8 01                	test   $0x1,%al
  a53200:	75 f6                	jne    a531f8 <setup_pixel_info+0x108>
  a53202:	0f b6 c2             	movzbl %dl,%eax
  a53205:	41 01 c0             	add    %eax,%r8d
  a53208:	48 c1 e9 20          	shr    $0x20,%rcx
  a5320c:	44 88 4f 2b          	mov    %r9b,0x2b(%rdi)
  a53210:	48 89 c8             	mov    %rcx,%rax
  a53213:	88 57 2a             	mov    %dl,0x2a(%rdi)
  a53216:	83 e0 ff             	and    $0xffffffff,%eax
  a53219:	74 7d                	je     a53298 <setup_pixel_info+0x1a8>
  a5321b:	83 e1 01             	and    $0x1,%ecx
  a5321e:	b9 00 00 00 00       	mov    $0x0,%ecx
  a53223:	75 0d                	jne    a53232 <setup_pixel_info+0x142>
  a53225:	0f 1f 00             	nopl   (%rax)
  a53228:	48 d1 e8             	shr    %rax
  a5322b:	83 c1 01             	add    $0x1,%ecx
  a5322e:	a8 01                	test   $0x1,%al
  a53230:	74 f6                	je     a53228 <setup_pixel_info+0x138>
  a53232:	31 d2                	xor    %edx,%edx
  a53234:	0f 1f 40 00          	nopl   0x0(%rax)
  a53238:	48 d1 e8             	shr    %rax
  a5323b:	83 c2 01             	add    $0x1,%edx
  a5323e:	a8 01                	test   $0x1,%al
  a53240:	75 f6                	jne    a53238 <setup_pixel_info+0x148>
  a53242:	0f b6 c2             	movzbl %dl,%eax
  a53245:	41 01 c0             	add    %eax,%r8d
  a53248:	66 44 89 47 16       	mov    %r8w,0x16(%rdi)
  a5324d:	45 0f b7 c0          	movzwl %r8w,%r8d
  a53251:	41 0f af f0          	imul   %r8d,%esi
  a53255:	88 4f 2d             	mov    %cl,0x2d(%rdi)
  a53258:	88 57 2c             	mov    %dl,0x2c(%rdi)
  a5325b:	c1 ee 03             	shr    $0x3,%esi
  a5325e:	66 89 77 24          	mov    %si,0x24(%rdi)
  a53262:	c3                   	retq   
  a53263:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a53268:	45 31 d2             	xor    %r10d,%r10d
  a5326b:	f6 c2 01             	test   $0x1,%dl
  a5326e:	75 0b                	jne    a5327b <setup_pixel_info+0x18b>
  a53270:	48 d1 e8             	shr    %rax
  a53273:	41 83 c2 01          	add    $0x1,%r10d
  a53277:	a8 01                	test   $0x1,%al
  a53279:	74 f5                	je     a53270 <setup_pixel_info+0x180>
  a5327b:	45 31 c9             	xor    %r9d,%r9d
  a5327e:	66 90                	xchg   %ax,%ax
  a53280:	48 d1 e8             	shr    %rax
  a53283:	41 83 c1 01          	add    $0x1,%r9d
  a53287:	a8 01                	test   $0x1,%al
  a53289:	75 f5                	jne    a53280 <setup_pixel_info+0x190>
  a5328b:	45 0f b6 c1          	movzbl %r9b,%r8d
  a5328f:	e9 f1 fe ff ff       	jmpq   a53185 <setup_pixel_info+0x95>
  a53294:	0f 1f 40 00          	nopl   0x0(%rax)
  a53298:	31 d2                	xor    %edx,%edx
  a5329a:	31 c9                	xor    %ecx,%ecx
  a5329c:	eb aa                	jmp    a53248 <setup_pixel_info+0x158>
  a5329e:	66 90                	xchg   %ax,%ax
  a532a0:	31 d2                	xor    %edx,%edx
  a532a2:	45 31 c9             	xor    %r9d,%r9d
  a532a5:	e9 5e ff ff ff       	jmpq   a53208 <setup_pixel_info+0x118>
  a532aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a532b0:	31 d2                	xor    %edx,%edx
  a532b2:	45 31 c9             	xor    %r9d,%r9d
  a532b5:	e9 0e ff ff ff       	jmpq   a531c8 <setup_pixel_info+0xd8>
  a532ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000a532c0 <efi_setup_gop>:
  a532c0:	f3 0f 1e fa          	endbr64 
  a532c4:	41 57                	push   %r15
  a532c6:	41 56                	push   %r14
  a532c8:	41 55                	push   %r13
  a532ca:	41 54                	push   %r12
  a532cc:	55                   	push   %rbp
  a532cd:	48 89 d5             	mov    %rdx,%rbp
  a532d0:	53                   	push   %rbx
  a532d1:	48 81 ec b8 00 00 00 	sub    $0xb8,%rsp
  a532d8:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
  a532dd:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
  a532e2:	48 c7 84 24 88 00 00 	movq   $0x0,0x88(%rsp)
  a532e9:	00 00 00 00 00 
  a532ee:	e8 cd ce ff ff       	callq  a501c0 <__efi_early>
  a532f3:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
  a532f8:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a532fc:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a53300:	48 8b 40 18          	mov    0x18(%rax),%rax
  a53304:	0f 84 0e 02 00 00    	je     a53518 <efi_setup_gop+0x258>
  a5330a:	48 8b 78 40          	mov    0x40(%rax),%rdi
  a5330e:	48 8d 8c 24 88 00 00 	lea    0x88(%rsp),%rcx
  a53315:	00 
  a53316:	be 02 00 00 00       	mov    $0x2,%esi
  a5331b:	31 c0                	xor    %eax,%eax
  a5331d:	41 ff d0             	callq  *%r8
  a53320:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a53325:	48 85 c0             	test   %rax,%rax
  a53328:	0f 85 d0 01 00 00    	jne    a534fe <efi_setup_gop+0x23e>
  a5332e:	e8 8d ce ff ff       	callq  a501c0 <__efi_early>
  a53333:	4c 8b 8c 24 88 00 00 	mov    0x88(%rsp),%r9
  a5333a:	00 
  a5333b:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a5333f:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a53343:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a53347:	0f 85 d3 01 00 00    	jne    a53520 <efi_setup_gop+0x260>
  a5334d:	8b 7a 64             	mov    0x64(%rdx),%edi
  a53350:	4c 8d 44 24 78       	lea    0x78(%rsp),%r8
  a53355:	31 c9                	xor    %ecx,%ecx
  a53357:	48 89 ea             	mov    %rbp,%rdx
  a5335a:	be 02 00 00 00       	mov    $0x2,%esi
  a5335f:	31 c0                	xor    %eax,%eax
  a53361:	41 ff d2             	callq  *%r10
  a53364:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a53369:	48 85 c0             	test   %rax,%rax
  a5336c:	0f 85 62 01 00 00    	jne    a534d4 <efi_setup_gop+0x214>
  a53372:	e8 49 ce ff ff       	callq  a501c0 <__efi_early>
  a53377:	4c 8b a4 24 88 00 00 	mov    0x88(%rsp),%r12
  a5337e:	00 
  a5337f:	49 89 c0             	mov    %rax,%r8
  a53382:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
  a53387:	41 80 78 30 00       	cmpb   $0x0,0x30(%r8)
  a5338c:	48 c7 84 24 90 00 00 	movq   $0x0,0x90(%rsp)
  a53393:	00 00 00 00 00 
  a53398:	0f 84 b2 02 00 00    	je     a53650 <efi_setup_gop+0x390>
  a5339e:	48 c1 e8 03          	shr    $0x3,%rax
  a533a2:	0f 84 ff 04 00 00    	je     a538a7 <efi_setup_gop+0x5e7>
  a533a8:	49 8d 04 c4          	lea    (%r12,%rax,8),%rax
  a533ac:	4c 89 e3             	mov    %r12,%rbx
  a533af:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  a533b6:	00 00 
  a533b8:	4c 8d ac 24 90 00 00 	lea    0x90(%rsp),%r13
  a533bf:	00 
  a533c0:	49 bf 2c 6f b3 d3 51 	movabs $0x11d4d551d3b36f2c,%r15
  a533c7:	d5 d4 11 
  a533ca:	48 89 04 24          	mov    %rax,(%rsp)
  a533ce:	48 8d 84 24 98 00 00 	lea    0x98(%rsp),%rax
  a533d5:	00 
  a533d6:	49 be 9a 46 00 90 27 	movabs $0x4dc13f279000469a,%r14
  a533dd:	3f c1 4d 
  a533e0:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  a533e5:	48 8d 84 24 a0 00 00 	lea    0xa0(%rsp),%rax
  a533ec:	00 
  a533ed:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
  a533f2:	eb 2c                	jmp    a53420 <efi_setup_gop+0x160>
  a533f4:	0f 1f 40 00          	nopl   0x0(%rax)
  a533f8:	48 8b b8 98 00 00 00 	mov    0x98(%rax),%rdi
  a533ff:	31 c0                	xor    %eax,%eax
  a53401:	4c 89 e9             	mov    %r13,%rcx
  a53404:	48 89 ea             	mov    %rbp,%rdx
  a53407:	4c 89 e6             	mov    %r12,%rsi
  a5340a:	41 ff d0             	callq  *%r8
  a5340d:	48 85 c0             	test   %rax,%rax
  a53410:	0f 84 1a 01 00 00    	je     a53530 <efi_setup_gop+0x270>
  a53416:	48 83 c3 08          	add    $0x8,%rbx
  a5341a:	48 3b 1c 24          	cmp    (%rsp),%rbx
  a5341e:	74 40                	je     a53460 <efi_setup_gop+0x1a0>
  a53420:	4c 89 bc 24 a0 00 00 	mov    %r15,0xa0(%rsp)
  a53427:	00 
  a53428:	4c 89 b4 24 a8 00 00 	mov    %r14,0xa8(%rsp)
  a5342f:	00 
  a53430:	48 c7 84 24 98 00 00 	movq   $0x0,0x98(%rsp)
  a53437:	00 00 00 00 00 
  a5343c:	4c 8b 23             	mov    (%rbx),%r12
  a5343f:	e8 7c cd ff ff       	callq  a501c0 <__efi_early>
  a53444:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53448:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a5344c:	48 8b 40 18          	mov    0x18(%rax),%rax
  a53450:	75 a6                	jne    a533f8 <efi_setup_gop+0x138>
  a53452:	8b 78 58             	mov    0x58(%rax),%edi
  a53455:	eb a8                	jmp    a533ff <efi_setup_gop+0x13f>
  a53457:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a5345e:	00 00 
  a53460:	48 83 7c 24 28 00    	cmpq   $0x0,0x28(%rsp)
  a53466:	0f 84 4f 04 00 00    	je     a538bb <efi_setup_gop+0x5fb>
  a5346c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  a53471:	0f b7 44 24 30       	movzwl 0x30(%rsp),%eax
  a53476:	66 89 46 12          	mov    %ax,0x12(%rsi)
  a5347a:	0f b7 44 24 32       	movzwl 0x32(%rsp),%eax
  a5347f:	c6 46 0f 70          	movb   $0x70,0xf(%rsi)
  a53483:	66 89 46 14          	mov    %ax,0x14(%rsi)
  a53487:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  a5348c:	89 46 18             	mov    %eax,0x18(%rsi)
  a5348f:	48 c1 e8 20          	shr    $0x20,%rax
  a53493:	74 07                	je     a5349c <efi_setup_gop+0x1dc>
  a53495:	83 4e 36 02          	orl    $0x2,0x36(%rsi)
  a53499:	89 46 3a             	mov    %eax,0x3a(%rsi)
  a5349c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  a534a1:	ba 01 00 00 00       	mov    $0x1,%edx
  a534a6:	44 8b 44 24 40       	mov    0x40(%rsp),%r8d
  a534ab:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
  a534b0:	8b 74 24 34          	mov    0x34(%rsp),%esi
  a534b4:	66 89 57 32          	mov    %dx,0x32(%rdi)
  a534b8:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
  a534bd:	e8 2e fc ff ff       	callq  a530f0 <setup_pixel_info>
  a534c2:	0f b7 47 24          	movzwl 0x24(%rdi),%eax
  a534c6:	0f b7 57 14          	movzwl 0x14(%rdi),%edx
  a534ca:	83 4f 36 01          	orl    $0x1,0x36(%rdi)
  a534ce:	0f af c2             	imul   %edx,%eax
  a534d1:	89 47 1c             	mov    %eax,0x1c(%rdi)
  a534d4:	4c 8b a4 24 88 00 00 	mov    0x88(%rsp),%r12
  a534db:	00 
  a534dc:	e8 df cc ff ff       	callq  a501c0 <__efi_early>
  a534e1:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a534e5:	48 8b 50 28          	mov    0x28(%rax),%rdx
  a534e9:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a534ed:	0f 84 4d 01 00 00    	je     a53640 <efi_setup_gop+0x380>
  a534f3:	48 8b 79 48          	mov    0x48(%rcx),%rdi
  a534f7:	4c 89 e6             	mov    %r12,%rsi
  a534fa:	31 c0                	xor    %eax,%eax
  a534fc:	ff d2                	callq  *%rdx
  a534fe:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  a53503:	48 81 c4 b8 00 00 00 	add    $0xb8,%rsp
  a5350a:	5b                   	pop    %rbx
  a5350b:	5d                   	pop    %rbp
  a5350c:	41 5c                	pop    %r12
  a5350e:	41 5d                	pop    %r13
  a53510:	41 5e                	pop    %r14
  a53512:	41 5f                	pop    %r15
  a53514:	c3                   	retq   
  a53515:	0f 1f 00             	nopl   (%rax)
  a53518:	8b 78 2c             	mov    0x2c(%rax),%edi
  a5351b:	e9 ee fd ff ff       	jmpq   a5330e <efi_setup_gop+0x4e>
  a53520:	48 8b ba b0 00 00 00 	mov    0xb0(%rdx),%rdi
  a53527:	e9 24 fe ff ff       	jmpq   a53350 <efi_setup_gop+0x90>
  a5352c:	0f 1f 40 00          	nopl   0x0(%rax)
  a53530:	e8 8b cc ff ff       	callq  a501c0 <__efi_early>
  a53535:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53539:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a5353d:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a53541:	0f 84 89 00 00 00    	je     a535d0 <efi_setup_gop+0x310>
  a53547:	48 8b ba 98 00 00 00 	mov    0x98(%rdx),%rdi
  a5354e:	31 c0                	xor    %eax,%eax
  a53550:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  a53555:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  a5355a:	4c 89 e6             	mov    %r12,%rsi
  a5355d:	41 ff d0             	callq  *%r8
  a53560:	48 85 c0             	test   %rax,%rax
  a53563:	74 7b                	je     a535e0 <efi_setup_gop+0x320>
  a53565:	48 83 7c 24 28 00    	cmpq   $0x0,0x28(%rsp)
  a5356b:	0f 85 a5 fe ff ff    	jne    a53416 <efi_setup_gop+0x156>
  a53571:	48 8b 94 24 90 00 00 	mov    0x90(%rsp),%rdx
  a53578:	00 
  a53579:	48 8b 72 18          	mov    0x18(%rdx),%rsi
  a5357d:	48 8b 46 08          	mov    0x8(%rsi),%rax
  a53581:	8b 48 0c             	mov    0xc(%rax),%ecx
  a53584:	83 f9 03             	cmp    $0x3,%ecx
  a53587:	0f 84 89 fe ff ff    	je     a53416 <efi_setup_gop+0x156>
  a5358d:	48 8b 76 18          	mov    0x18(%rsi),%rsi
  a53591:	48 8b 78 18          	mov    0x18(%rax),%rdi
  a53595:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
  a53599:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
  a5359e:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
  a535a3:	0f b7 70 04          	movzwl 0x4(%rax),%esi
  a535a7:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
  a535ac:	66 89 74 24 30       	mov    %si,0x30(%rsp)
  a535b1:	0f b7 70 08          	movzwl 0x8(%rax),%esi
  a535b5:	66 89 74 24 32       	mov    %si,0x32(%rsp)
  a535ba:	48 8b 70 10          	mov    0x10(%rax),%rsi
  a535be:	8b 40 20             	mov    0x20(%rax),%eax
  a535c1:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
  a535c6:	89 44 24 34          	mov    %eax,0x34(%rsp)
  a535ca:	e9 47 fe ff ff       	jmpq   a53416 <efi_setup_gop+0x156>
  a535cf:	90                   	nop
  a535d0:	8b 7a 58             	mov    0x58(%rdx),%edi
  a535d3:	e9 76 ff ff ff       	jmpq   a5354e <efi_setup_gop+0x28e>
  a535d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a535df:	00 
  a535e0:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
  a535e7:	00 
  a535e8:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a535ec:	48 8b 41 08          	mov    0x8(%rcx),%rax
  a535f0:	8b 50 0c             	mov    0xc(%rax),%edx
  a535f3:	83 fa 03             	cmp    $0x3,%edx
  a535f6:	0f 84 1a fe ff ff    	je     a53416 <efi_setup_gop+0x156>
  a535fc:	48 8b 59 18          	mov    0x18(%rcx),%rbx
  a53600:	48 8b 70 10          	mov    0x10(%rax),%rsi
  a53604:	89 54 24 40          	mov    %edx,0x40(%rsp)
  a53608:	48 8b 78 18          	mov    0x18(%rax),%rdi
  a5360c:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
  a53611:	0f b7 58 04          	movzwl 0x4(%rax),%ebx
  a53615:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
  a5361a:	66 89 5c 24 30       	mov    %bx,0x30(%rsp)
  a5361f:	0f b7 58 08          	movzwl 0x8(%rax),%ebx
  a53623:	8b 40 20             	mov    0x20(%rax),%eax
  a53626:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
  a5362b:	66 89 5c 24 32       	mov    %bx,0x32(%rsp)
  a53630:	89 44 24 34          	mov    %eax,0x34(%rsp)
  a53634:	e9 33 fe ff ff       	jmpq   a5346c <efi_setup_gop+0x1ac>
  a53639:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a53640:	8b 79 30             	mov    0x30(%rcx),%edi
  a53643:	e9 af fe ff ff       	jmpq   a534f7 <efi_setup_gop+0x237>
  a53648:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a5364f:	00 
  a53650:	48 c1 e8 02          	shr    $0x2,%rax
  a53654:	0f 84 4d 02 00 00    	je     a538a7 <efi_setup_gop+0x5e7>
  a5365a:	49 8d 04 84          	lea    (%r12,%rax,4),%rax
  a5365e:	4c 89 e3             	mov    %r12,%rbx
  a53661:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  a53668:	00 00 
  a5366a:	4c 8d ac 24 90 00 00 	lea    0x90(%rsp),%r13
  a53671:	00 
  a53672:	49 bf 2c 6f b3 d3 51 	movabs $0x11d4d551d3b36f2c,%r15
  a53679:	d5 d4 11 
  a5367c:	48 89 04 24          	mov    %rax,(%rsp)
  a53680:	48 8d 84 24 98 00 00 	lea    0x98(%rsp),%rax
  a53687:	00 
  a53688:	49 be 9a 46 00 90 27 	movabs $0x4dc13f279000469a,%r14
  a5368f:	3f c1 4d 
  a53692:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  a53697:	48 8d 84 24 a0 00 00 	lea    0xa0(%rsp),%rax
  a5369e:	00 
  a5369f:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
  a536a4:	eb 32                	jmp    a536d8 <efi_setup_gop+0x418>
  a536a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  a536ad:	00 00 00 
  a536b0:	48 8b b8 98 00 00 00 	mov    0x98(%rax),%rdi
  a536b7:	31 c0                	xor    %eax,%eax
  a536b9:	4c 89 e9             	mov    %r13,%rcx
  a536bc:	48 89 ea             	mov    %rbp,%rdx
  a536bf:	4c 89 e6             	mov    %r12,%rsi
  a536c2:	41 ff d0             	callq  *%r8
  a536c5:	48 85 c0             	test   %rax,%rax
  a536c8:	74 46                	je     a53710 <efi_setup_gop+0x450>
  a536ca:	48 83 c3 04          	add    $0x4,%rbx
  a536ce:	48 3b 1c 24          	cmp    (%rsp),%rbx
  a536d2:	0f 84 e8 00 00 00    	je     a537c0 <efi_setup_gop+0x500>
  a536d8:	4c 89 bc 24 a0 00 00 	mov    %r15,0xa0(%rsp)
  a536df:	00 
  a536e0:	4c 89 b4 24 a8 00 00 	mov    %r14,0xa8(%rsp)
  a536e7:	00 
  a536e8:	48 c7 84 24 98 00 00 	movq   $0x0,0x98(%rsp)
  a536ef:	00 00 00 00 00 
  a536f4:	44 8b 23             	mov    (%rbx),%r12d
  a536f7:	e8 c4 ca ff ff       	callq  a501c0 <__efi_early>
  a536fc:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53700:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a53704:	48 8b 40 18          	mov    0x18(%rax),%rax
  a53708:	75 a6                	jne    a536b0 <efi_setup_gop+0x3f0>
  a5370a:	8b 78 58             	mov    0x58(%rax),%edi
  a5370d:	eb a8                	jmp    a536b7 <efi_setup_gop+0x3f7>
  a5370f:	90                   	nop
  a53710:	e8 ab ca ff ff       	callq  a501c0 <__efi_early>
  a53715:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53719:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a5371d:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a53721:	0f 84 21 01 00 00    	je     a53848 <efi_setup_gop+0x588>
  a53727:	48 8b ba 98 00 00 00 	mov    0x98(%rdx),%rdi
  a5372e:	31 c0                	xor    %eax,%eax
  a53730:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  a53735:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  a5373a:	4c 89 e6             	mov    %r12,%rsi
  a5373d:	41 ff d0             	callq  *%r8
  a53740:	48 85 c0             	test   %rax,%rax
  a53743:	0f 84 07 01 00 00    	je     a53850 <efi_setup_gop+0x590>
  a53749:	48 83 7c 24 28 00    	cmpq   $0x0,0x28(%rsp)
  a5374f:	0f 85 75 ff ff ff    	jne    a536ca <efi_setup_gop+0x40a>
  a53755:	48 8b 94 24 90 00 00 	mov    0x90(%rsp),%rdx
  a5375c:	00 
  a5375d:	8b 72 0c             	mov    0xc(%rdx),%esi
  a53760:	8b 46 08             	mov    0x8(%rsi),%eax
  a53763:	8b 48 0c             	mov    0xc(%rax),%ecx
  a53766:	83 f9 03             	cmp    $0x3,%ecx
  a53769:	0f 84 5b ff ff ff    	je     a536ca <efi_setup_gop+0x40a>
  a5376f:	48 8b 76 10          	mov    0x10(%rsi),%rsi
  a53773:	48 8b 78 18          	mov    0x18(%rax),%rdi
  a53777:	89 4c 24 74          	mov    %ecx,0x74(%rsp)
  a5377b:	48 83 c3 04          	add    $0x4,%rbx
  a5377f:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
  a53784:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
  a53789:	0f b7 70 04          	movzwl 0x4(%rax),%esi
  a5378d:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
  a53792:	66 89 74 24 44       	mov    %si,0x44(%rsp)
  a53797:	0f b7 70 08          	movzwl 0x8(%rax),%esi
  a5379b:	66 89 74 24 46       	mov    %si,0x46(%rsp)
  a537a0:	48 8b 70 10          	mov    0x10(%rax),%rsi
  a537a4:	8b 40 20             	mov    0x20(%rax),%eax
  a537a7:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
  a537ac:	89 44 24 70          	mov    %eax,0x70(%rsp)
  a537b0:	48 3b 1c 24          	cmp    (%rsp),%rbx
  a537b4:	0f 85 1e ff ff ff    	jne    a536d8 <efi_setup_gop+0x418>
  a537ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a537c0:	48 83 7c 24 28 00    	cmpq   $0x0,0x28(%rsp)
  a537c6:	0f 84 ef 00 00 00    	je     a538bb <efi_setup_gop+0x5fb>
  a537cc:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  a537d1:	0f b7 44 24 44       	movzwl 0x44(%rsp),%eax
  a537d6:	66 89 41 12          	mov    %ax,0x12(%rcx)
  a537da:	0f b7 44 24 46       	movzwl 0x46(%rsp),%eax
  a537df:	c6 41 0f 70          	movb   $0x70,0xf(%rcx)
  a537e3:	66 89 41 14          	mov    %ax,0x14(%rcx)
  a537e7:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
  a537ec:	89 41 18             	mov    %eax,0x18(%rcx)
  a537ef:	48 c1 e8 20          	shr    $0x20,%rax
  a537f3:	74 07                	je     a537fc <efi_setup_gop+0x53c>
  a537f5:	83 49 36 02          	orl    $0x2,0x36(%rcx)
  a537f9:	89 41 3a             	mov    %eax,0x3a(%rcx)
  a537fc:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  a53801:	b8 01 00 00 00       	mov    $0x1,%eax
  a53806:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
  a5380b:	44 8b 44 24 74       	mov    0x74(%rsp),%r8d
  a53810:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
  a53815:	66 89 47 32          	mov    %ax,0x32(%rdi)
  a53819:	8b 74 24 70          	mov    0x70(%rsp),%esi
  a5381d:	e8 ce f8 ff ff       	callq  a530f0 <setup_pixel_info>
  a53822:	0f b7 47 24          	movzwl 0x24(%rdi),%eax
  a53826:	0f b7 57 14          	movzwl 0x14(%rdi),%edx
  a5382a:	83 4f 36 01          	orl    $0x1,0x36(%rdi)
  a5382e:	4c 8b a4 24 88 00 00 	mov    0x88(%rsp),%r12
  a53835:	00 
  a53836:	0f af c2             	imul   %edx,%eax
  a53839:	89 47 1c             	mov    %eax,0x1c(%rdi)
  a5383c:	e9 9b fc ff ff       	jmpq   a534dc <efi_setup_gop+0x21c>
  a53841:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a53848:	8b 7a 58             	mov    0x58(%rdx),%edi
  a5384b:	e9 de fe ff ff       	jmpq   a5372e <efi_setup_gop+0x46e>
  a53850:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
  a53857:	00 
  a53858:	8b 48 0c             	mov    0xc(%rax),%ecx
  a5385b:	8b 41 08             	mov    0x8(%rcx),%eax
  a5385e:	8b 50 0c             	mov    0xc(%rax),%edx
  a53861:	83 fa 03             	cmp    $0x3,%edx
  a53864:	0f 84 60 fe ff ff    	je     a536ca <efi_setup_gop+0x40a>
  a5386a:	48 8b 59 10          	mov    0x10(%rcx),%rbx
  a5386e:	48 8b 70 10          	mov    0x10(%rax),%rsi
  a53872:	89 54 24 74          	mov    %edx,0x74(%rsp)
  a53876:	48 8b 78 18          	mov    0x18(%rax),%rdi
  a5387a:	48 89 5c 24 48       	mov    %rbx,0x48(%rsp)
  a5387f:	0f b7 58 04          	movzwl 0x4(%rax),%ebx
  a53883:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
  a53888:	66 89 5c 24 44       	mov    %bx,0x44(%rsp)
  a5388d:	0f b7 58 08          	movzwl 0x8(%rax),%ebx
  a53891:	8b 40 20             	mov    0x20(%rax),%eax
  a53894:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
  a53899:	66 89 5c 24 46       	mov    %bx,0x46(%rsp)
  a5389e:	89 44 24 70          	mov    %eax,0x70(%rsp)
  a538a2:	e9 25 ff ff ff       	jmpq   a537cc <efi_setup_gop+0x50c>
  a538a7:	48 b8 0e 00 00 00 00 	movabs $0x800000000000000e,%rax
  a538ae:	00 00 80 
  a538b1:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a538b6:	e9 21 fc ff ff       	jmpq   a534dc <efi_setup_gop+0x21c>
  a538bb:	48 b8 0e 00 00 00 00 	movabs $0x800000000000000e,%rax
  a538c2:	00 00 80 
  a538c5:	4c 8b a4 24 88 00 00 	mov    0x88(%rsp),%r12
  a538cc:	00 
  a538cd:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  a538d2:	e9 05 fc ff ff       	jmpq   a534dc <efi_setup_gop+0x21c>
  a538d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  a538de:	00 00 

0000000000a538e0 <efi_get_secureboot>:
  a538e0:	f3 0f 1e fa          	endbr64 
  a538e4:	55                   	push   %rbp
  a538e5:	48 89 fd             	mov    %rdi,%rbp
  a538e8:	53                   	push   %rbx
  a538e9:	48 83 ec 28          	sub    $0x28,%rsp
  a538ed:	48 c7 44 24 18 01 00 	movq   $0x1,0x18(%rsp)
  a538f4:	00 00 
  a538f6:	e8 c5 c8 ff ff       	callq  a501c0 <__efi_early>
  a538fb:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a538ff:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a53903:	48 8b 40 10          	mov    0x10(%rax),%rax
  a53907:	0f 84 33 01 00 00    	je     a53a40 <efi_get_secureboot+0x160>
  a5390d:	48 8b 78 48          	mov    0x48(%rax),%rdi
  a53911:	48 8d 5c 24 18       	lea    0x18(%rsp),%rbx
  a53916:	48 8d 15 e3 09 00 00 	lea    0x9e3(%rip),%rdx        # a54300 <efi_variable_guid>
  a5391d:	31 c9                	xor    %ecx,%ecx
  a5391f:	31 c0                	xor    %eax,%eax
  a53921:	4c 8d 4c 24 11       	lea    0x11(%rsp),%r9
  a53926:	49 89 d8             	mov    %rbx,%r8
  a53929:	48 8d 35 b0 09 00 00 	lea    0x9b0(%rip),%rsi        # a542e0 <efi_SecureBoot_name>
  a53930:	41 ff d2             	callq  *%r10
  a53933:	48 ba 0e 00 00 00 00 	movabs $0x800000000000000e,%rdx
  a5393a:	00 00 80 
  a5393d:	48 39 d0             	cmp    %rdx,%rax
  a53940:	0f 84 2a 01 00 00    	je     a53a70 <efi_get_secureboot+0x190>
  a53946:	48 85 c0             	test   %rax,%rax
  a53949:	0f 85 01 01 00 00    	jne    a53a50 <efi_get_secureboot+0x170>
  a5394f:	48 c7 44 24 18 01 00 	movq   $0x1,0x18(%rsp)
  a53956:	00 00 
  a53958:	e8 63 c8 ff ff       	callq  a501c0 <__efi_early>
  a5395d:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53961:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a53965:	48 8b 40 10          	mov    0x10(%rax),%rax
  a53969:	0f 85 c1 00 00 00    	jne    a53a30 <efi_get_secureboot+0x150>
  a5396f:	8b 78 30             	mov    0x30(%rax),%edi
  a53972:	31 c9                	xor    %ecx,%ecx
  a53974:	31 c0                	xor    %eax,%eax
  a53976:	4c 8d 4c 24 12       	lea    0x12(%rsp),%r9
  a5397b:	49 89 d8             	mov    %rbx,%r8
  a5397e:	48 8d 15 7b 09 00 00 	lea    0x97b(%rip),%rdx        # a54300 <efi_variable_guid>
  a53985:	48 8d 35 34 09 00 00 	lea    0x934(%rip),%rsi        # a542c0 <efi_SetupMode_name>
  a5398c:	41 ff d2             	callq  *%r10
  a5398f:	48 85 c0             	test   %rax,%rax
  a53992:	0f 85 b8 00 00 00    	jne    a53a50 <efi_get_secureboot+0x170>
  a53998:	80 7c 24 11 00       	cmpb   $0x0,0x11(%rsp)
  a5399d:	0f 84 cd 00 00 00    	je     a53a70 <efi_get_secureboot+0x190>
  a539a3:	80 7c 24 12 01       	cmpb   $0x1,0x12(%rsp)
  a539a8:	0f 84 c2 00 00 00    	je     a53a70 <efi_get_secureboot+0x190>
  a539ae:	48 c7 44 24 18 01 00 	movq   $0x1,0x18(%rsp)
  a539b5:	00 00 
  a539b7:	e8 04 c8 ff ff       	callq  a501c0 <__efi_early>
  a539bc:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a539c0:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a539c4:	48 8b 40 10          	mov    0x10(%rax),%rax
  a539c8:	0f 85 b2 00 00 00    	jne    a53a80 <efi_get_secureboot+0x1a0>
  a539ce:	8b 78 30             	mov    0x30(%rax),%edi
  a539d1:	31 c0                	xor    %eax,%eax
  a539d3:	48 8d 4c 24 14       	lea    0x14(%rsp),%rcx
  a539d8:	4c 8d 4c 24 13       	lea    0x13(%rsp),%r9
  a539dd:	49 89 d8             	mov    %rbx,%r8
  a539e0:	48 8d 15 c9 08 00 00 	lea    0x8c9(%rip),%rdx        # a542b0 <shim_guid>
  a539e7:	48 8d 35 a2 08 00 00 	lea    0x8a2(%rip),%rsi        # a54290 <shim_MokSBState_name>
  a539ee:	41 ff d2             	callq  *%r10
  a539f1:	48 85 c0             	test   %rax,%rax
  a539f4:	75 0e                	jne    a53a04 <efi_get_secureboot+0x124>
  a539f6:	f6 44 24 14 04       	testb  $0x4,0x14(%rsp)
  a539fb:	75 07                	jne    a53a04 <efi_get_secureboot+0x124>
  a539fd:	80 7c 24 13 01       	cmpb   $0x1,0x13(%rsp)
  a53a02:	74 6c                	je     a53a70 <efi_get_secureboot+0x190>
  a53a04:	e8 77 df ff ff       	callq  a51980 <is_quiet>
  a53a09:	41 89 c0             	mov    %eax,%r8d
  a53a0c:	b8 03 00 00 00       	mov    $0x3,%eax
  a53a11:	45 85 c0             	test   %r8d,%r8d
  a53a14:	75 4e                	jne    a53a64 <efi_get_secureboot+0x184>
  a53a16:	48 8d 35 5b 11 00 00 	lea    0x115b(%rip),%rsi        # a54b78 <efi_MemoryOverWriteRequest_name+0x858>
  a53a1d:	48 89 ef             	mov    %rbp,%rdi
  a53a20:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  a53a24:	e8 77 df ff ff       	callq  a519a0 <efi_printk>
  a53a29:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  a53a2d:	eb 35                	jmp    a53a64 <efi_get_secureboot+0x184>
  a53a2f:	90                   	nop
  a53a30:	48 8b 78 48          	mov    0x48(%rax),%rdi
  a53a34:	e9 39 ff ff ff       	jmpq   a53972 <efi_get_secureboot+0x92>
  a53a39:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a53a40:	8b 78 30             	mov    0x30(%rax),%edi
  a53a43:	e9 c9 fe ff ff       	jmpq   a53911 <efi_get_secureboot+0x31>
  a53a48:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a53a4f:	00 
  a53a50:	48 8d 35 49 11 00 00 	lea    0x1149(%rip),%rsi        # a54ba0 <efi_MemoryOverWriteRequest_name+0x880>
  a53a57:	48 89 ef             	mov    %rbp,%rdi
  a53a5a:	e8 41 df ff ff       	callq  a519a0 <efi_printk>
  a53a5f:	b8 01 00 00 00       	mov    $0x1,%eax
  a53a64:	48 83 c4 28          	add    $0x28,%rsp
  a53a68:	5b                   	pop    %rbx
  a53a69:	5d                   	pop    %rbp
  a53a6a:	c3                   	retq   
  a53a6b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a53a70:	48 83 c4 28          	add    $0x28,%rsp
  a53a74:	b8 02 00 00 00       	mov    $0x2,%eax
  a53a79:	5b                   	pop    %rbx
  a53a7a:	5d                   	pop    %rbp
  a53a7b:	c3                   	retq   
  a53a7c:	0f 1f 40 00          	nopl   0x0(%rax)
  a53a80:	48 8b 78 48          	mov    0x48(%rax),%rdi
  a53a84:	e9 48 ff ff ff       	jmpq   a539d1 <efi_get_secureboot+0xf1>
  a53a89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000a53a90 <efi_enable_reset_attack_mitigation>:
  a53a90:	f3 0f 1e fa          	endbr64 
  a53a94:	48 b8 be 39 09 e2 d4 	movabs $0x41be32d4e20939be,%rax
  a53a9b:	32 be 41 
  a53a9e:	41 54                	push   %r12
  a53aa0:	48 83 ec 20          	sub    $0x20,%rsp
  a53aa4:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  a53aa9:	48 b8 a1 50 89 7f 85 	movabs $0x2998d4857f8950a1,%rax
  a53ab0:	d4 98 29 
  a53ab3:	c6 44 24 07 01       	movb   $0x1,0x7(%rsp)
  a53ab8:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  a53abd:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  a53ac4:	00 00 
  a53ac6:	e8 f5 c6 ff ff       	callq  a501c0 <__efi_early>
  a53acb:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53acf:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a53ad3:	48 8b 40 10          	mov    0x10(%rax),%rax
  a53ad7:	74 77                	je     a53b50 <efi_enable_reset_attack_mitigation+0xc0>
  a53ad9:	48 8b 78 48          	mov    0x48(%rax),%rdi
  a53add:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
  a53ae2:	4c 8d 44 24 08       	lea    0x8(%rsp),%r8
  a53ae7:	45 31 c9             	xor    %r9d,%r9d
  a53aea:	31 c9                	xor    %ecx,%ecx
  a53aec:	4c 89 e2             	mov    %r12,%rdx
  a53aef:	48 8d 35 2a 08 00 00 	lea    0x82a(%rip),%rsi        # a54320 <efi_MemoryOverWriteRequest_name>
  a53af6:	31 c0                	xor    %eax,%eax
  a53af8:	41 ff d2             	callq  *%r10
  a53afb:	49 89 c0             	mov    %rax,%r8
  a53afe:	48 b8 0e 00 00 00 00 	movabs $0x800000000000000e,%rax
  a53b05:	00 00 80 
  a53b08:	49 39 c0             	cmp    %rax,%r8
  a53b0b:	74 35                	je     a53b42 <efi_enable_reset_attack_mitigation+0xb2>
  a53b0d:	e8 ae c6 ff ff       	callq  a501c0 <__efi_early>
  a53b12:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53b16:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a53b1a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  a53b1e:	75 38                	jne    a53b58 <efi_enable_reset_attack_mitigation+0xc8>
  a53b20:	8b 7a 38             	mov    0x38(%rdx),%edi
  a53b23:	4c 8d 4c 24 07       	lea    0x7(%rsp),%r9
  a53b28:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  a53b2e:	4c 89 e2             	mov    %r12,%rdx
  a53b31:	31 c0                	xor    %eax,%eax
  a53b33:	b9 07 00 00 00       	mov    $0x7,%ecx
  a53b38:	48 8d 35 e1 07 00 00 	lea    0x7e1(%rip),%rsi        # a54320 <efi_MemoryOverWriteRequest_name>
  a53b3f:	41 ff d2             	callq  *%r10
  a53b42:	48 83 c4 20          	add    $0x20,%rsp
  a53b46:	41 5c                	pop    %r12
  a53b48:	c3                   	retq   
  a53b49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a53b50:	8b 78 30             	mov    0x30(%rax),%edi
  a53b53:	eb 88                	jmp    a53add <efi_enable_reset_attack_mitigation+0x4d>
  a53b55:	0f 1f 00             	nopl   (%rax)
  a53b58:	48 8b 7a 58          	mov    0x58(%rdx),%rdi
  a53b5c:	eb c5                	jmp    a53b23 <efi_enable_reset_attack_mitigation+0x93>
  a53b5e:	66 90                	xchg   %ax,%ax

0000000000a53b60 <efi_retrieve_tpm2_eventlog>:
  a53b60:	f3 0f 1e fa          	endbr64 
  a53b64:	48 b8 6c 76 7f 60 55 	movabs $0x42be7455607f766c,%rax
  a53b6b:	74 be 42 
  a53b6e:	41 56                	push   %r14
  a53b70:	41 55                	push   %r13
  a53b72:	41 54                	push   %r12
  a53b74:	55                   	push   %rbp
  a53b75:	48 89 fd             	mov    %rdi,%rbp
  a53b78:	48 83 ec 58          	sub    $0x58,%rsp
  a53b7c:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  a53b81:	48 b8 93 0b e4 d7 6d 	movabs $0xf72b26dd7e40b93,%rax
  a53b88:	b2 72 0f 
  a53b8b:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  a53b90:	48 b8 b0 9c 79 b7 a2 	movabs $0x4943eca2b7799cb0,%rax
  a53b97:	ec 43 49 
  a53b9a:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
  a53b9f:	48 b8 96 67 1f ae 07 	movabs $0xfa47b707ae1f6796,%rax
  a53ba6:	b7 47 fa 
  a53ba9:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  a53bae:	48 c7 44 24 10 00 00 	movq   $0x0,0x10(%rsp)
  a53bb5:	00 00 
  a53bb7:	48 c7 44 24 18 00 00 	movq   $0x0,0x18(%rsp)
  a53bbe:	00 00 
  a53bc0:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  a53bc7:	00 00 
  a53bc9:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  a53bd0:	00 00 
  a53bd2:	e8 e9 c5 ff ff       	callq  a501c0 <__efi_early>
  a53bd7:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53bdb:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a53bdf:	48 8b 40 18          	mov    0x18(%rax),%rax
  a53be3:	0f 84 4f 01 00 00    	je     a53d38 <efi_retrieve_tpm2_eventlog+0x1d8>
  a53be9:	48 8b b8 40 01 00 00 	mov    0x140(%rax),%rdi
  a53bf0:	31 d2                	xor    %edx,%edx
  a53bf2:	48 8d 4c 24 28       	lea    0x28(%rsp),%rcx
  a53bf7:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  a53bfc:	31 c0                	xor    %eax,%eax
  a53bfe:	41 ff d0             	callq  *%r8
  a53c01:	48 85 c0             	test   %rax,%rax
  a53c04:	0f 85 1c 01 00 00    	jne    a53d26 <efi_retrieve_tpm2_eventlog+0x1c6>
  a53c0a:	e8 b1 c5 ff ff       	callq  a501c0 <__efi_early>
  a53c0f:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  a53c14:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53c18:	4c 8b 50 28          	mov    0x28(%rax),%r10
  a53c1c:	0f 85 26 01 00 00    	jne    a53d48 <efi_retrieve_tpm2_eventlog+0x1e8>
  a53c22:	8b 7e 04             	mov    0x4(%rsi),%edi
  a53c25:	31 c0                	xor    %eax,%eax
  a53c27:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  a53c2c:	4c 8d 4c 24 0f       	lea    0xf(%rsp),%r9
  a53c31:	ba 01 00 00 00       	mov    $0x1,%edx
  a53c36:	4c 8d 44 24 18       	lea    0x18(%rsp),%r8
  a53c3b:	41 ff d2             	callq  *%r10
  a53c3e:	48 85 c0             	test   %rax,%rax
  a53c41:	0f 85 df 00 00 00    	jne    a53d26 <efi_retrieve_tpm2_eventlog+0x1c6>
  a53c47:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  a53c4c:	4d 85 ed             	test   %r13,%r13
  a53c4f:	0f 84 d1 00 00 00    	je     a53d26 <efi_retrieve_tpm2_eventlog+0x1c6>
  a53c55:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  a53c5a:	41 be 08 00 00 00    	mov    $0x8,%r14d
  a53c60:	4d 85 e4             	test   %r12,%r12
  a53c63:	0f 85 ff 00 00 00    	jne    a53d68 <efi_retrieve_tpm2_eventlog+0x208>
  a53c69:	e8 52 c5 ff ff       	callq  a501c0 <__efi_early>
  a53c6e:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53c72:	4c 8b 40 28          	mov    0x28(%rax),%r8
  a53c76:	48 8b 50 18          	mov    0x18(%rax),%rdx
  a53c7a:	0f 85 d8 00 00 00    	jne    a53d58 <efi_retrieve_tpm2_eventlog+0x1f8>
  a53c80:	8b 7a 2c             	mov    0x2c(%rdx),%edi
  a53c83:	31 c0                	xor    %eax,%eax
  a53c85:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  a53c8a:	4c 89 f2             	mov    %r14,%rdx
  a53c8d:	be 02 00 00 00       	mov    $0x2,%esi
  a53c92:	41 ff d0             	callq  *%r8
  a53c95:	48 85 c0             	test   %rax,%rax
  a53c98:	0f 85 ea 00 00 00    	jne    a53d88 <efi_retrieve_tpm2_eventlog+0x228>
  a53c9e:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  a53ca3:	31 f6                	xor    %esi,%esi
  a53ca5:	4c 89 f2             	mov    %r14,%rdx
  a53ca8:	e8 83 9f ff ff       	callq  a4dc30 <memset>
  a53cad:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  a53cb2:	4c 89 e2             	mov    %r12,%rdx
  a53cb5:	4c 89 ee             	mov    %r13,%rsi
  a53cb8:	44 89 20             	mov    %r12d,(%rax)
  a53cbb:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  a53cc0:	c6 40 04 01          	movb   $0x1,0x4(%rax)
  a53cc4:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  a53cc9:	48 8d 78 05          	lea    0x5(%rax),%rdi
  a53ccd:	e8 ee 9f ff ff       	callq  a4dcc0 <memcpy>
  a53cd2:	e8 e9 c4 ff ff       	callq  a501c0 <__efi_early>
  a53cd7:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  a53cdc:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53ce0:	48 8b 48 28          	mov    0x28(%rax),%rcx
  a53ce4:	48 8b 40 18          	mov    0x18(%rax),%rax
  a53ce8:	0f 84 b2 00 00 00    	je     a53da0 <efi_retrieve_tpm2_eventlog+0x240>
  a53cee:	48 8b b8 c0 00 00 00 	mov    0xc0(%rax),%rdi
  a53cf5:	31 c0                	xor    %eax,%eax
  a53cf7:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  a53cfc:	ff d1                	callq  *%rcx
  a53cfe:	48 85 c0             	test   %rax,%rax
  a53d01:	74 23                	je     a53d26 <efi_retrieve_tpm2_eventlog+0x1c6>
  a53d03:	e8 b8 c4 ff ff       	callq  a501c0 <__efi_early>
  a53d08:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  a53d0d:	80 78 30 00          	cmpb   $0x0,0x30(%rax)
  a53d11:	48 8b 50 28          	mov    0x28(%rax),%rdx
  a53d15:	48 8b 48 18          	mov    0x18(%rax),%rcx
  a53d19:	0f 85 91 00 00 00    	jne    a53db0 <efi_retrieve_tpm2_eventlog+0x250>
  a53d1f:	8b 79 30             	mov    0x30(%rcx),%edi
  a53d22:	31 c0                	xor    %eax,%eax
  a53d24:	ff d2                	callq  *%rdx
  a53d26:	48 83 c4 58          	add    $0x58,%rsp
  a53d2a:	5d                   	pop    %rbp
  a53d2b:	41 5c                	pop    %r12
  a53d2d:	41 5d                	pop    %r13
  a53d2f:	41 5e                	pop    %r14
  a53d31:	c3                   	retq   
  a53d32:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a53d38:	8b b8 ac 00 00 00    	mov    0xac(%rax),%edi
  a53d3e:	e9 ad fe ff ff       	jmpq   a53bf0 <efi_retrieve_tpm2_eventlog+0x90>
  a53d43:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  a53d48:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  a53d4c:	e9 d4 fe ff ff       	jmpq   a53c25 <efi_retrieve_tpm2_eventlog+0xc5>
  a53d51:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a53d58:	48 8b 7a 40          	mov    0x40(%rdx),%rdi
  a53d5c:	e9 22 ff ff ff       	jmpq   a53c83 <efi_retrieve_tpm2_eventlog+0x123>
  a53d61:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a53d68:	4c 89 e2             	mov    %r12,%rdx
  a53d6b:	41 8b 44 24 1c       	mov    0x1c(%r12),%eax
  a53d70:	4c 29 ea             	sub    %r13,%rdx
  a53d73:	4c 8d 64 02 20       	lea    0x20(%rdx,%rax,1),%r12
  a53d78:	4d 8d 74 24 08       	lea    0x8(%r12),%r14
  a53d7d:	e9 e7 fe ff ff       	jmpq   a53c69 <efi_retrieve_tpm2_eventlog+0x109>
  a53d82:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  a53d88:	48 8d 35 51 0e 00 00 	lea    0xe51(%rip),%rsi        # a54be0 <efi_MemoryOverWriteRequest_name+0x8c0>
  a53d8f:	48 89 ef             	mov    %rbp,%rdi
  a53d92:	e8 09 dc ff ff       	callq  a519a0 <efi_printk>
  a53d97:	eb 8d                	jmp    a53d26 <efi_retrieve_tpm2_eventlog+0x1c6>
  a53d99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  a53da0:	8b 78 6c             	mov    0x6c(%rax),%edi
  a53da3:	e9 4d ff ff ff       	jmpq   a53cf5 <efi_retrieve_tpm2_eventlog+0x195>
  a53da8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  a53daf:	00 
  a53db0:	48 8b 79 48          	mov    0x48(%rcx),%rdi
  a53db4:	e9 69 ff ff ff       	jmpq   a53d22 <efi_retrieve_tpm2_eventlog+0x1c2>
  a53db9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000a53dc0 <efi64_thunk>:
  a53dc0:	55                   	push   %rbp
  a53dc1:	53                   	push   %rbx
  a53dc2:	48 83 ec 08          	sub    $0x8,%rsp
  a53dc6:	48 8d 05 a3 00 00 00 	lea    0xa3(%rip),%rax        # a53e70 <efi_exit32>
  a53dcd:	89 44 24 04          	mov    %eax,0x4(%rsp)
  a53dd1:	48 8d 05 8c 21 00 00 	lea    0x218c(%rip),%rax        # a55f64 <efi_gdt64>
  a53dd8:	89 04 24             	mov    %eax,(%rsp)
  a53ddb:	89 40 02             	mov    %eax,0x2(%rax)
  a53dde:	8c d8                	mov    %ds,%eax
  a53de0:	50                   	push   %rax
  a53de1:	8c c0                	mov    %es,%eax
  a53de3:	50                   	push   %rax
  a53de4:	8c d0                	mov    %ss,%eax
  a53de6:	50                   	push   %rax
  a53de7:	48 83 ec 20          	sub    $0x20,%rsp
  a53deb:	89 34 24             	mov    %esi,(%rsp)
  a53dee:	89 54 24 04          	mov    %edx,0x4(%rsp)
  a53df2:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
  a53df6:	4c 89 c6             	mov    %r8,%rsi
  a53df9:	89 74 24 0c          	mov    %esi,0xc(%rsp)
  a53dfd:	4c 89 ce             	mov    %r9,%rsi
  a53e00:	89 74 24 10          	mov    %esi,0x10(%rsp)
  a53e04:	0f 01 05 47 21 00 00 	sgdt   0x2147(%rip)        # a55f52 <save_gdt>
  a53e0b:	48 8d 1d 1d 00 00 00 	lea    0x1d(%rip),%rbx        # a53e2f <efi64_thunk+0x6f>
  a53e12:	48 89 1d 43 21 00 00 	mov    %rbx,0x2143(%rip)        # a55f5c <func_rt_ptr>
  a53e19:	48 8d 05 28 21 00 00 	lea    0x2128(%rip),%rax        # a55f48 <efi32_boot_gdt>
  a53e20:	0f 01 10             	lgdt   (%rax)
  a53e23:	6a 10                	pushq  $0x10
  a53e25:	48 8d 05 54 00 00 00 	lea    0x54(%rip),%rax        # a53e80 <efi_enter32>
  a53e2c:	50                   	push   %rax
  a53e2d:	48 cb                	lretq  
  a53e2f:	48 83 c4 20          	add    $0x20,%rsp
  a53e33:	0f 01 15 18 21 00 00 	lgdt   0x2118(%rip)        # a55f52 <save_gdt>
  a53e3a:	5b                   	pop    %rbx
  a53e3b:	8e d3                	mov    %ebx,%ss
  a53e3d:	5b                   	pop    %rbx
  a53e3e:	8e c3                	mov    %ebx,%es
  a53e40:	5b                   	pop    %rbx
  a53e41:	8e db                	mov    %ebx,%ds
  a53e43:	48 85 c0             	test   %rax,%rax
  a53e46:	74 14                	je     a53e5c <efi64_thunk+0x9c>
  a53e48:	89 c1                	mov    %eax,%ecx
  a53e4a:	81 e1 ff ff ff 0f    	and    $0xfffffff,%ecx
  a53e50:	25 00 00 00 f0       	and    $0xf0000000,%eax
  a53e55:	48 c1 e0 20          	shl    $0x20,%rax
  a53e59:	48 09 c8             	or     %rcx,%rax
  a53e5c:	48 83 c4 08          	add    $0x8,%rsp
  a53e60:	5b                   	pop    %rbx
  a53e61:	5d                   	pop    %rbp
  a53e62:	c3                   	retq   
  a53e63:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  a53e6a:	00 00 00 00 
  a53e6e:	66 90                	xchg   %ax,%ax

0000000000a53e70 <efi_exit32>:
  a53e70:	48 8b 05 e5 20 00 00 	mov    0x20e5(%rip),%rax        # a55f5c <func_rt_ptr>
  a53e77:	50                   	push   %rax
  a53e78:	48 89 f8             	mov    %rdi,%rax
  a53e7b:	c3                   	retq   
  a53e7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000a53e80 <efi_enter32>:
  a53e80:	b8 18 00 00 00       	mov    $0x18,%eax
  a53e85:	8e d8                	mov    %eax,%ds
  a53e87:	8e c0                	mov    %eax,%es
  a53e89:	8e d0                	mov    %eax,%ss
  a53e8b:	0f 20 d8             	mov    %cr3,%rax
  a53e8e:	0f 22 d8             	mov    %rax,%cr3
  a53e91:	0f 20 c0             	mov    %cr0,%rax
  a53e94:	0f ba f0 1f          	btr    $0x1f,%eax
  a53e98:	0f 22 c0             	mov    %rax,%cr0
  a53e9b:	b9 80 00 00 c0       	mov    $0xc0000080,%ecx
  a53ea0:	0f 32                	rdmsr  
  a53ea2:	0f ba f0 08          	btr    $0x8,%eax
  a53ea6:	0f 30                	wrmsr  
  a53ea8:	ff d7                	callq  *%rdi
  a53eaa:	89 c7                	mov    %eax,%edi
  a53eac:	fa                   	cli    
  a53ead:	8b 44 24 38          	mov    0x38(%rsp),%eax
  a53eb1:	89 40 02             	mov    %eax,0x2(%rax)
  a53eb4:	0f 01 10             	lgdt   (%rax)
  a53eb7:	0f 20 e0             	mov    %cr4,%rax
  a53eba:	0f ba e8 05          	bts    $0x5,%eax
  a53ebe:	0f 22 e0             	mov    %rax,%cr4
  a53ec1:	0f 20 d8             	mov    %cr3,%rax
  a53ec4:	0f 22 d8             	mov    %rax,%cr3
  a53ec7:	b9 80 00 00 c0       	mov    $0xc0000080,%ecx
  a53ecc:	0f 32                	rdmsr  
  a53ece:	0f ba e8 08          	bts    $0x8,%eax
  a53ed2:	0f 30                	wrmsr  
  a53ed4:	31 c0                	xor    %eax,%eax
  a53ed6:	0f 00 d0             	lldt   %ax
  a53ed9:	8b 44 24 3c          	mov    0x3c(%rsp),%eax
  a53edd:	6a 10                	pushq  $0x10
  a53edf:	50                   	push   %rax
  a53ee0:	0f 20 c0             	mov    %cr0,%rax
  a53ee3:	0f ba e8 1f          	bts    $0x1f,%eax
  a53ee7:	0f 22 c0             	mov    %rax,%cr0
  a53eea:	cb                   	lret   

0000000000a53eeb <fortify_panic>:
  a53eeb:	f3 0f 1e fa          	endbr64 
  a53eef:	50                   	push   %rax
  a53ef0:	58                   	pop    %rax
  a53ef1:	48 8d 3d 9a 06 00 00 	lea    0x69a(%rip),%rdi        # a54592 <efi_MemoryOverWriteRequest_name+0x272>
  a53ef8:	50                   	push   %rax
  a53ef9:	e8 52 a2 ff ff       	callq  a4e150 <error>
