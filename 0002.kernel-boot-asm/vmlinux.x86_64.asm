
vmlinux:     file format elf64-x86-64


Disassembly of section .head.text:

0000000000000000 <startup_32>:
   0:	fc                   	cld    
   1:	f6 86 11 02 00 00 40 	testb  $0x40,0x211(%esi)
   8:	75 0c                	jne    16 <startup_32+0x16>
   a:	fa                   	cli    
   b:	b8 18 00 00 00       	mov    $0x18,%eax
  10:	8e d8                	mov    %eax,%ds
  12:	8e c0                	mov    %eax,%es
  14:	8e d0                	mov    %eax,%ss
  16:	8d a6 e8 01 00 00    	lea    0x1e8(%esi),%esp
  1c:	e8 00 00 00 00       	call   21 <startup_32+0x21>
  21:	5d                   	pop    %ebp
  22:	81 ed 21 00 00 00    	sub    $0x21,%ebp
  28:	b8 00 a1 a6 00       	mov    $0xa6a100,%eax
  2d:	01 e8                	add    %ebp,%eax
  2f:	89 c4                	mov    %eax,%esp
  31:	e8 ea a4 a4 00       	call   a4a520 <verify_cpu>
  36:	85 c0                	test   %eax,%eax
  38:	0f 85 d2 a4 a4 00    	jne    a4a510 <no_longmode>
  3e:	89 eb                	mov    %ebp,%ebx
  40:	8b 86 30 02 00 00    	mov    0x230(%esi),%eax
  46:	48                   	dec    %eax
  47:	01 c3                	add    %eax,%ebx
  49:	f7 d0                	not    %eax
  4b:	21 c3                	and    %eax,%ebx
  4d:	81 fb 00 00 00 01    	cmp    $0x1000000,%ebx
  53:	73 05                	jae    5a <startup_32+0x5a>
  55:	bb 00 00 00 01       	mov    $0x1000000,%ebx
  5a:	8b 86 60 02 00 00    	mov    0x260(%esi),%eax
  60:	2d 00 00 a8 00       	sub    $0xa80000,%eax
  65:	01 c3                	add    %eax,%ebx
  67:	01 ad 72 5e a5 00    	add    %ebp,0xa55e72(%ebp)
  6d:	0f 01 95 70 5e a5 00 	lgdtl  0xa55e70(%ebp)
  74:	0f 20 e0             	mov    %cr4,%eax
  77:	83 c8 20             	or     $0x20,%eax
  7a:	0f 22 e0             	mov    %eax,%cr4
  7d:	e8 ce fc a4 00       	call   a4fd50 <get_sev_encryption_bit>
  82:	31 d2                	xor    %edx,%edx
  84:	85 c0                	test   %eax,%eax
  86:	74 06                	je     8e <startup_32+0x8e>
  88:	83 e8 20             	sub    $0x20,%eax
  8b:	0f ab c2             	bts    %eax,%edx
  8e:	8d bb 00 e0 a6 00    	lea    0xa6e000(%ebx),%edi
  94:	31 c0                	xor    %eax,%eax
  96:	b9 00 18 00 00       	mov    $0x1800,%ecx
  9b:	f3 ab                	rep stos %eax,%es:(%edi)
  9d:	8d bb 00 e0 a6 00    	lea    0xa6e000(%ebx),%edi
  a3:	8d 87 07 10 00 00    	lea    0x1007(%edi),%eax
  a9:	89 07                	mov    %eax,(%edi)
  ab:	01 57 04             	add    %edx,0x4(%edi)
  ae:	8d bb 00 f0 a6 00    	lea    0xa6f000(%ebx),%edi
  b4:	8d 87 07 10 00 00    	lea    0x1007(%edi),%eax
  ba:	b9 04 00 00 00       	mov    $0x4,%ecx
  bf:	89 07                	mov    %eax,(%edi)
  c1:	01 57 04             	add    %edx,0x4(%edi)
  c4:	05 00 10 00 00       	add    $0x1000,%eax
  c9:	83 c7 08             	add    $0x8,%edi
  cc:	49                   	dec    %ecx
  cd:	75 f0                	jne    bf <startup_32+0xbf>
  cf:	8d bb 00 00 a7 00    	lea    0xa70000(%ebx),%edi
  d5:	b8 83 01 00 00       	mov    $0x183,%eax
  da:	b9 00 08 00 00       	mov    $0x800,%ecx
  df:	89 07                	mov    %eax,(%edi)
  e1:	01 57 04             	add    %edx,0x4(%edi)
  e4:	05 00 00 20 00       	add    $0x200000,%eax
  e9:	83 c7 08             	add    $0x8,%edi
  ec:	49                   	dec    %ecx
  ed:	75 f0                	jne    df <startup_32+0xdf>
  ef:	8d 83 00 e0 a6 00    	lea    0xa6e000(%ebx),%eax
  f5:	0f 22 d8             	mov    %eax,%cr3
  f8:	b9 80 00 00 c0       	mov    $0xc0000080,%ecx
  fd:	0f 32                	rdmsr  
  ff:	0f ba e8 08          	bts    $0x8,%eax
 103:	0f 30                	wrmsr  
 105:	31 c0                	xor    %eax,%eax
 107:	0f 00 d0             	lldt   %ax
 10a:	b8 20 00 00 00       	mov    $0x20,%eax
 10f:	0f 00 d8             	ltr    %ax
 112:	6a 10                	push   $0x10
 114:	8d 85 00 02 00 00    	lea    0x200(%ebp),%eax
 11a:	8b 9d a8 5e a5 00    	mov    0xa55ea8(%ebp),%ebx
 120:	83 fb 00             	cmp    $0x0,%ebx
 123:	74 06                	je     12b <startup_32+0x12b>
 125:	8d 85 40 03 00 00    	lea    0x340(%ebp),%eax
 12b:	50                   	push   %eax
 12c:	b8 01 00 00 80       	mov    $0x80000001,%eax
 131:	0f 22 c0             	mov    %eax,%cr0
 134:	cb                   	lret   
	...

0000000000000190 <efi32_stub_entry>:
 190:	83 c4 04             	add    $0x4,%esp
 193:	59                   	pop    %ecx
 194:	5a                   	pop    %edx
 195:	5e                   	pop    %esi
 196:	8d a6 e8 01 00 00    	lea    0x1e8(%esi),%esp
 19c:	e8 00 00 00 00       	call   1a1 <efi32_stub_entry+0x11>
 1a1:	5d                   	pop    %ebp
 1a2:	81 ed a1 01 00 00    	sub    $0x1a1,%ebp
 1a8:	89 8d a8 5e a5 00    	mov    %ecx,0xa55ea8(%ebp)
 1ae:	89 95 b0 5e a5 00    	mov    %edx,0xa55eb0(%ebp)
 1b4:	0f 01 85 48 5f a5 00 	sgdtl  0xa55f48(%ebp)
 1bb:	8d 85 a8 5e a5 00    	lea    0xa55ea8(%ebp),%eax
 1c1:	89 85 a0 5e a5 00    	mov    %eax,0xa55ea0(%ebp)
 1c7:	0f 20 c0             	mov    %cr0,%eax
 1ca:	0f ba f0 1f          	btr    $0x1f,%eax
 1ce:	0f 22 c0             	mov    %eax,%cr0
 1d1:	e9 2a fe ff ff       	jmp    0 <startup_32>
	...

0000000000000200 <startup_64>:
 200:	31 c0                	xor    %eax,%eax
 202:	8e d8                	mov    %eax,%ds
 204:	8e c0                	mov    %eax,%es
 206:	8e d0                	mov    %eax,%ss
 208:	8e e0                	mov    %eax,%fs
 20a:	8e e8                	mov    %eax,%gs
 20c:	48                   	dec    %eax
 20d:	8d 2d ed fd ff ff    	lea    0xfffffded,%ebp
 213:	8b 86 30 02 00 00    	mov    0x230(%esi),%eax
 219:	ff c8                	dec    %eax
 21b:	48                   	dec    %eax
 21c:	01 c5                	add    %eax,%ebp
 21e:	48                   	dec    %eax
 21f:	f7 d0                	not    %eax
 221:	48                   	dec    %eax
 222:	21 c5                	and    %eax,%ebp
 224:	48                   	dec    %eax
 225:	81 fd 00 00 00 01    	cmp    $0x1000000,%ebp
 22b:	73 07                	jae    234 <startup_64+0x34>
 22d:	48                   	dec    %eax
 22e:	c7 c5 00 00 00 01    	mov    $0x1000000,%ebp
 234:	8b 9e 60 02 00 00    	mov    0x260(%esi),%ebx
 23a:	81 eb 00 00 a8 00    	sub    $0xa80000,%ebx
 240:	48                   	dec    %eax
 241:	01 eb                	add    %ebp,%ebx
 243:	48                   	dec    %eax
 244:	8d a3 00 a1 a6 00    	lea    0xa6a100(%ebx),%esp
 24a:	48                   	dec    %eax
 24b:	31 c0                	xor    %eax,%eax
 24d:	e8 00 00 00 00       	call   252 <startup_64+0x52>
 252:	5f                   	pop    %edi
 253:	48                   	dec    %eax
 254:	81 ef 52 02 00 00    	sub    $0x252,%edi
 25a:	e8 14 a2 a4 00       	call   a4a473 <adjust_got>
 25f:	48                   	dec    %eax
 260:	8d 05 0a 5c a5 00    	lea    0xa55c0a,%eax
 266:	48                   	dec    %eax
 267:	89 05 f5 5b a5 00    	mov    %eax,0xa55bf5
 26d:	0f 01 15 ec 5b a5 00 	lgdtl  0xa55bec
 274:	56                   	push   %esi
 275:	48                   	dec    %eax
 276:	89 f7                	mov    %esi,%edi
 278:	e8 43 fb a4 00       	call   a4fdc0 <paging_prepare>
 27d:	5e                   	pop    %esi
 27e:	48                   	dec    %eax
 27f:	89 c1                	mov    %eax,%ecx
 281:	48                   	dec    %eax
 282:	8d 3d 0c 00 00 00    	lea    0xc,%edi
 288:	6a 08                	push   $0x8
 28a:	48                   	dec    %eax
 28b:	8d 80 00 10 00 00    	lea    0x1000(%eax),%eax
 291:	50                   	push   %eax
 292:	48                   	dec    %eax
 293:	cb                   	lret   

0000000000000294 <trampoline_return>:
 294:	48                   	dec    %eax
 295:	8d a3 00 a1 a6 00    	lea    0xa6a100(%ebx),%esp
 29b:	56                   	push   %esi
 29c:	48                   	dec    %eax
 29d:	8d bb 00 f0 a7 00    	lea    0xa7f000(%ebx),%edi
 2a3:	e8 f8 fd a4 00       	call   a500a0 <cleanup_trampoline>
 2a8:	5e                   	pop    %esi
 2a9:	6a 00                	push   $0x0
 2ab:	9d                   	popf   
 2ac:	e8 00 00 00 00       	call   2b1 <trampoline_return+0x1d>
 2b1:	58                   	pop    %eax
 2b2:	48                   	dec    %eax
 2b3:	2d b1 02 00 00       	sub    $0x2b1,%eax
 2b8:	48                   	dec    %eax
 2b9:	89 df                	mov    %ebx,%edi
 2bb:	e8 b3 a1 a4 00       	call   a4a473 <adjust_got>
 2c0:	56                   	push   %esi
 2c1:	48                   	dec    %eax
 2c2:	8d 35 30 5e a5 00    	lea    0xa55e30,%esi
 2c8:	48                   	dec    %eax
 2c9:	8d bb f8 60 a5 00    	lea    0xa560f8(%ebx),%edi
 2cf:	48                   	dec    %eax
 2d0:	c7 c1 00 61 a5 00    	mov    $0xa56100,%ecx
 2d6:	48                   	dec    %eax
 2d7:	c1 e9 03             	shr    $0x3,%ecx
 2da:	fd                   	std    
 2db:	f3 48                	repz dec %eax
 2dd:	a5                   	movsl  %ds:(%esi),%es:(%edi)
 2de:	fc                   	cld    
 2df:	5e                   	pop    %esi
 2e0:	48                   	dec    %eax
 2e1:	8d 83 30 a4 a4 00    	lea    0xa4a430(%ebx),%eax
 2e7:	ff e0                	jmp    *%eax
 2e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)

00000000000002f0 <efi_pe_entry>:
 2f0:	48                   	dec    %eax
 2f1:	89 0d e2 5b a5 00    	mov    %ecx,0xa55be2
 2f7:	48                   	dec    %eax
 2f8:	89 15 e3 5b a5 00    	mov    %edx,0xa55be3
 2fe:	48                   	dec    %eax
 2ff:	8d 05 d4 5b a5 00    	lea    0xa55bd4,%eax
 305:	48                   	dec    %eax
 306:	89 05 94 5b a5 00    	mov    %eax,0xa55b94
 30c:	e8 00 00 00 00       	call   311 <efi_pe_entry+0x21>
 311:	5d                   	pop    %ebp
 312:	48                   	dec    %eax
 313:	81 ed 11 03 00 00    	sub    $0x311,%ebp
 319:	48                   	dec    %eax
 31a:	01 2d e1 5b a5 00    	add    %ebp,0xa55be1
 320:	48                   	dec    %eax
 321:	89 c7                	mov    %eax,%edi
 323:	e8 98 03 a5 00       	call   a506c0 <make_boot_params>
 328:	48                   	dec    %eax
 329:	83 f8 00             	cmp    $0x0,%eax
 32c:	74 3f                	je     36d <fail>
 32e:	48                   	dec    %eax
 32f:	89 c6                	mov    %eax,%esi
 331:	48                   	dec    %eax
 332:	8d 05 c8 fc ff ff    	lea    0xfffffcc8,%eax
 338:	89 86 14 02 00 00    	mov    %eax,0x214(%esi)
 33e:	eb 18                	jmp    358 <handover_entry+0x18>

0000000000000340 <handover_entry>:
 340:	e8 00 00 00 00       	call   345 <handover_entry+0x5>
 345:	5d                   	pop    %ebp
 346:	48                   	dec    %eax
 347:	81 ed 45 03 00 00    	sub    $0x345,%ebp
 34d:	48                   	dec    %eax
 34e:	8b 05 4c 5b a5 00    	mov    0xa55b4c,%eax
 354:	48                   	dec    %eax
 355:	01 68 28             	add    %ebp,0x28(%eax)
 358:	48                   	dec    %eax
 359:	8b 3d 41 5b a5 00    	mov    0xa55b41,%edi
 35f:	e8 bc 06 a5 00       	call   a50a20 <efi_main>
 364:	48                   	dec    %eax
 365:	89 c6                	mov    %eax,%esi
 367:	48                   	dec    %eax
 368:	83 f8 00             	cmp    $0x0,%eax
 36b:	75 03                	jne    370 <fail+0x3>

000000000000036d <fail>:
 36d:	f4                   	hlt    
 36e:	eb fd                	jmp    36d <fail>
 370:	67 8b 86 14 02       	mov    0x214(%bp),%eax
 375:	00 00                	add    %al,(%eax)
 377:	48                   	dec    %eax
 378:	8d 80 00 02 00 00    	lea    0x200(%eax),%eax
 37e:	ff e0                	jmp    *%eax
	...

0000000000000390 <efi64_stub_entry>:
 390:	48                   	dec    %eax
 391:	89 3d 42 5b a5 00    	mov    %edi,0xa55b42
 397:	48                   	dec    %eax
 398:	89 35 43 5b a5 00    	mov    %esi,0xa55b43
 39e:	48                   	dec    %eax
 39f:	8d 05 34 5b a5 00    	lea    0xa55b34,%eax
 3a5:	48                   	dec    %eax
 3a6:	89 05 f4 5a a5 00    	mov    %eax,0xa55af4
 3ac:	48                   	dec    %eax
 3ad:	89 d6                	mov    %edx,%esi
 3af:	eb 8f                	jmp    340 <handover_entry>

Disassembly of section .text:

0000000000a4a430 <_text>:
  a4a430:	31 c0                	xor    %eax,%eax
  a4a432:	48                   	dec    %eax
  a4a433:	8d 3d c7 bc 00 00    	lea    0xbcc7,%edi
  a4a439:	48                   	dec    %eax
  a4a43a:	8d 0d 50 35 02 00    	lea    0x23550,%ecx
  a4a440:	48                   	dec    %eax
  a4a441:	29 f9                	sub    %edi,%ecx
  a4a443:	48                   	dec    %eax
  a4a444:	c1 e9 03             	shr    $0x3,%ecx
  a4a447:	f3 48                	repz dec %eax
  a4a449:	ab                   	stos   %eax,%es:(%edi)
  a4a44a:	56                   	push   %esi
  a4a44b:	48                   	dec    %eax
  a4a44c:	89 f7                	mov    %esi,%edi
  a4a44e:	48                   	dec    %eax
  a4a44f:	8d 35 ab bc 00 00    	lea    0xbcab,%esi
  a4a455:	48                   	dec    %eax
  a4a456:	8d 15 55 5f 5b ff    	lea    0xff5b5f55,%edx
  a4a45c:	b9 77 a0 a4 00       	mov    $0xa4a077,%ecx
  a4a461:	49                   	dec    %ecx
  a4a462:	89 e8                	mov    %ebp,%eax
  a4a464:	49                   	dec    %ecx
  a4a465:	c7 c1 78 ba 02 02    	mov    $0x202ba78,%ecx
  a4a46b:	e8 40 2f 00 00       	call   a4d3b0 <extract_kernel>
  a4a470:	5e                   	pop    %esi
  a4a471:	ff e0                	jmp    *%eax

0000000000a4a473 <adjust_got>:
  a4a473:	48                   	dec    %eax
  a4a474:	8d 15 e6 b9 00 00    	lea    0xb9e6,%edx
  a4a47a:	48                   	dec    %eax
  a4a47b:	8d 0d df b9 00 00    	lea    0xb9df,%ecx
  a4a481:	48                   	dec    %eax
  a4a482:	39 ca                	cmp    %ecx,%edx
  a4a484:	73 0c                	jae    a4a492 <adjust_got+0x1f>
  a4a486:	48                   	dec    %eax
  a4a487:	29 02                	sub    %eax,(%edx)
  a4a489:	48                   	dec    %eax
  a4a48a:	01 3a                	add    %edi,(%edx)
  a4a48c:	48                   	dec    %eax
  a4a48d:	83 c2 08             	add    $0x8,%edx
  a4a490:	eb ef                	jmp    a4a481 <adjust_got+0xe>
  a4a492:	c3                   	ret    
  a4a493:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4a49a:	00 00 00 00 
  a4a49e:	66 90                	xchg   %ax,%ax

0000000000a4a4a0 <trampoline_32bit_src>:
  a4a4a0:	b8 18 00 00 00       	mov    $0x18,%eax
  a4a4a5:	8e d8                	mov    %eax,%ds
  a4a4a7:	8e d0                	mov    %eax,%ss
  a4a4a9:	8d a1 00 20 00 00    	lea    0x2000(%ecx),%esp
  a4a4af:	0f 20 c0             	mov    %cr0,%eax
  a4a4b2:	0f ba f0 1f          	btr    $0x1f,%eax
  a4a4b6:	0f 22 c0             	mov    %eax,%cr0
  a4a4b9:	83 fa 00             	cmp    $0x0,%edx
  a4a4bc:	74 0c                	je     a4a4ca <trampoline_32bit_src+0x2a>
  a4a4be:	0f 20 e0             	mov    %cr4,%eax
  a4a4c1:	a9 00 10 00 00       	test   $0x1000,%eax
  a4a4c6:	75 11                	jne    a4a4d9 <trampoline_32bit_src+0x39>
  a4a4c8:	eb 0a                	jmp    a4a4d4 <trampoline_32bit_src+0x34>
  a4a4ca:	0f 20 e0             	mov    %cr4,%eax
  a4a4cd:	a9 00 10 00 00       	test   $0x1000,%eax
  a4a4d2:	74 05                	je     a4a4d9 <trampoline_32bit_src+0x39>
  a4a4d4:	8d 01                	lea    (%ecx),%eax
  a4a4d6:	0f 22 d8             	mov    %eax,%cr3
  a4a4d9:	51                   	push   %ecx
  a4a4da:	52                   	push   %edx
  a4a4db:	b9 80 00 00 c0       	mov    $0xc0000080,%ecx
  a4a4e0:	0f 32                	rdmsr  
  a4a4e2:	0f ba e8 08          	bts    $0x8,%eax
  a4a4e6:	0f 30                	wrmsr  
  a4a4e8:	5a                   	pop    %edx
  a4a4e9:	59                   	pop    %ecx
  a4a4ea:	b8 20 00 00 00       	mov    $0x20,%eax
  a4a4ef:	83 fa 00             	cmp    $0x0,%edx
  a4a4f2:	74 05                	je     a4a4f9 <trampoline_32bit_src+0x59>
  a4a4f4:	0d 00 10 00 00       	or     $0x1000,%eax
  a4a4f9:	0f 22 e0             	mov    %eax,%cr4
  a4a4fc:	8d 81 6e 10 00 00    	lea    0x106e(%ecx),%eax
  a4a502:	6a 10                	push   $0x10
  a4a504:	50                   	push   %eax
  a4a505:	b8 01 00 00 80       	mov    $0x80000001,%eax
  a4a50a:	0f 22 c0             	mov    %eax,%cr0
  a4a50d:	cb                   	lret   

0000000000a4a50e <paging_enabled>:
  a4a50e:	ff e7                	jmp    *%edi

0000000000a4a510 <no_longmode>:
  a4a510:	f4                   	hlt    
  a4a511:	eb fd                	jmp    a4a510 <no_longmode>
  a4a513:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4a51a:	00 00 00 00 
  a4a51e:	66 90                	xchg   %ax,%ax

0000000000a4a520 <verify_cpu>:
  a4a520:	9c                   	pushf  
  a4a521:	6a 00                	push   $0x0
  a4a523:	9d                   	popf   
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
  a4a606:	9d                   	popf   
  a4a607:	b8 01 00 00 00       	mov    $0x1,%eax
  a4a60c:	c3                   	ret    
  a4a60d:	9d                   	popf   
  a4a60e:	31 c0                	xor    %eax,%eax
  a4a610:	c3                   	ret    
  a4a611:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4a618:	00 00 00 
  a4a61b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)

0000000000a4a620 <scroll>:
  a4a620:	8b 05 0e 0b 02 00    	mov    0x20b0e,%eax
  a4a626:	48                   	dec    %eax
  a4a627:	8b 0d 13 0b 02 00    	mov    0x20b13,%ecx
  a4a62d:	41                   	inc    %ecx
  a4a62e:	54                   	push   %esp
  a4a62f:	44                   	inc    %esp
  a4a630:	8b 25 fa 0a 02 00    	mov    0x20afa,%esp
  a4a636:	55                   	push   %ebp
  a4a637:	8d 68 ff             	lea    -0x1(%eax),%ebp
  a4a63a:	53                   	push   %ebx
  a4a63b:	48                   	dec    %eax
  a4a63c:	89 cf                	mov    %ecx,%edi
  a4a63e:	41                   	inc    %ecx
  a4a63f:	0f af ec             	imul   %esp,%ebp
  a4a642:	43                   	inc    %ebx
  a4a643:	8d 34 24             	lea    (%esp),%esi
  a4a646:	48                   	dec    %eax
  a4a647:	63 f6                	arpl   %si,%si
  a4a649:	48                   	dec    %eax
  a4a64a:	01 ce                	add    %ecx,%esi
  a4a64c:	8d 5c 2d 00          	lea    0x0(%ebp,%ebp,1),%ebx
  a4a650:	41                   	inc    %ecx
  a4a651:	01 ec                	add    %ebp,%esp
  a4a653:	48                   	dec    %eax
  a4a654:	63 db                	arpl   %bx,%bx
  a4a656:	48                   	dec    %eax
  a4a657:	89 da                	mov    %ebx,%edx
  a4a659:	e8 02 36 00 00       	call   a4dc60 <memmove>
  a4a65e:	44                   	inc    %esp
  a4a65f:	39 e5                	cmp    %esp,%ebp
  a4a661:	7d 19                	jge    a4a67c <scroll+0x5c>
  a4a663:	48                   	dec    %eax
  a4a664:	89 c1                	mov    %eax,%ecx
  a4a666:	43                   	inc    %ebx
  a4a667:	8d 04 24             	lea    (%esp),%eax
  a4a66a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4a670:	c6 04 19 20          	movb   $0x20,(%ecx,%ebx,1)
  a4a674:	48                   	dec    %eax
  a4a675:	83 c3 02             	add    $0x2,%ebx
  a4a678:	39 d8                	cmp    %ebx,%eax
  a4a67a:	7f f4                	jg     a4a670 <scroll+0x50>
  a4a67c:	5b                   	pop    %ebx
  a4a67d:	5d                   	pop    %ebp
  a4a67e:	41                   	inc    %ecx
  a4a67f:	5c                   	pop    %esp
  a4a680:	c3                   	ret    
  a4a681:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4a688:	00 00 00 00 
  a4a68c:	0f 1f 40 00          	nopl   0x0(%eax)

0000000000a4a690 <LZ4_decompress_safe>:
  a4a690:	f3 0f 1e fa          	endbr64 
  a4a694:	4c                   	dec    %esp
  a4a695:	63 d2                	arpl   %dx,%dx
  a4a697:	4c                   	dec    %esp
  a4a698:	63 d9                	arpl   %bx,%cx
  a4a69a:	49                   	dec    %ecx
  a4a69b:	89 f8                	mov    %edi,%eax
  a4a69d:	49                   	dec    %ecx
  a4a69e:	01 fa                	add    %edi,%edx
  a4a6a0:	49                   	dec    %ecx
  a4a6a1:	01 f3                	add    %esi,%ebx
  a4a6a3:	85 c9                	test   %ecx,%ecx
  a4a6a5:	0f 84 49 02 00 00    	je     a4a8f4 <LZ4_decompress_safe+0x264>
  a4a6ab:	41                   	inc    %ecx
  a4a6ac:	57                   	push   %edi
  a4a6ad:	49                   	dec    %ecx
  a4a6ae:	8d 43 fb             	lea    -0x5(%ebx),%eax
  a4a6b1:	48                   	dec    %eax
  a4a6b2:	89 f7                	mov    %esi,%edi
  a4a6b4:	4d                   	dec    %ebp
  a4a6b5:	8d 4a f1             	lea    -0xf(%edx),%ecx
  a4a6b8:	41                   	inc    %ecx
  a4a6b9:	56                   	push   %esi
  a4a6ba:	49                   	dec    %ecx
  a4a6bb:	8d 4b f4             	lea    -0xc(%ebx),%ecx
  a4a6be:	4d                   	dec    %ebp
  a4a6bf:	8d 73 f9             	lea    -0x7(%ebx),%esi
  a4a6c2:	41                   	inc    %ecx
  a4a6c3:	55                   	push   %ebp
  a4a6c4:	4d                   	dec    %ebp
  a4a6c5:	8d 6a f8             	lea    -0x8(%edx),%ebp
  a4a6c8:	41                   	inc    %ecx
  a4a6c9:	54                   	push   %esp
  a4a6ca:	4d                   	dec    %ebp
  a4a6cb:	8d 62 fc             	lea    -0x4(%edx),%esp
  a4a6ce:	55                   	push   %ebp
  a4a6cf:	48                   	dec    %eax
  a4a6d0:	89 f5                	mov    %esi,%ebp
  a4a6d2:	53                   	push   %ebx
  a4a6d3:	48                   	dec    %eax
  a4a6d4:	83 ec 18             	sub    $0x18,%esp
  a4a6d7:	48                   	dec    %eax
  a4a6d8:	89 44 24 08          	mov    %eax,0x8(%esp)
  a4a6dc:	49                   	dec    %ecx
  a4a6dd:	8d 70 01             	lea    0x1(%eax),%esi
  a4a6e0:	45                   	inc    %ebp
  a4a6e1:	0f b6 00             	movzbl (%eax),%eax
  a4a6e4:	44                   	inc    %esp
  a4a6e5:	89 c2                	mov    %eax,%edx
  a4a6e7:	41                   	inc    %ecx
  a4a6e8:	c1 e8 04             	shr    $0x4,%eax
  a4a6eb:	44                   	inc    %esp
  a4a6ec:	89 c0                	mov    %eax,%eax
  a4a6ee:	41                   	inc    %ecx
  a4a6ef:	83 f8 0f             	cmp    $0xf,%eax
  a4a6f2:	0f 84 00 01 00 00    	je     a4a7f8 <LZ4_decompress_safe+0x168>
  a4a6f8:	48                   	dec    %eax
  a4a6f9:	8d 1c 07             	lea    (%edi,%eax,1),%ebx
  a4a6fc:	4c                   	dec    %esp
  a4a6fd:	8d 04 06             	lea    (%esi,%eax,1),%eax
  a4a700:	48                   	dec    %eax
  a4a701:	39 d9                	cmp    %ebx,%ecx
  a4a703:	0f 82 be 01 00 00    	jb     a4a8c7 <LZ4_decompress_safe+0x237>
  a4a709:	4d                   	dec    %ebp
  a4a70a:	39 e8                	cmp    %ebp,%eax
  a4a70c:	0f 87 b5 01 00 00    	ja     a4a8c7 <LZ4_decompress_safe+0x237>
  a4a712:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4a718:	48                   	dec    %eax
  a4a719:	8b 06                	mov    (%esi),%eax
  a4a71b:	48                   	dec    %eax
  a4a71c:	83 c7 08             	add    $0x8,%edi
  a4a71f:	48                   	dec    %eax
  a4a720:	83 c6 08             	add    $0x8,%esi
  a4a723:	48                   	dec    %eax
  a4a724:	89 47 f8             	mov    %eax,-0x8(%edi)
  a4a727:	48                   	dec    %eax
  a4a728:	39 df                	cmp    %ebx,%edi
  a4a72a:	72 ec                	jb     a4a718 <LZ4_decompress_safe+0x88>
  a4a72c:	41                   	inc    %ecx
  a4a72d:	0f b7 30             	movzwl (%eax),%esi
  a4a730:	48                   	dec    %eax
  a4a731:	89 d8                	mov    %ebx,%eax
  a4a733:	49                   	dec    %ecx
  a4a734:	83 c0 02             	add    $0x2,%eax
  a4a737:	48                   	dec    %eax
  a4a738:	29 f0                	sub    %esi,%eax
  a4a73a:	48                   	dec    %eax
  a4a73b:	39 c5                	cmp    %eax,%ebp
  a4a73d:	0f 87 9c 00 00 00    	ja     a4a7df <LZ4_decompress_safe+0x14f>
  a4a743:	89 d7                	mov    %edx,%edi
  a4a745:	89 33                	mov    %esi,(%ebx)
  a4a747:	83 e2 0f             	and    $0xf,%edx
  a4a74a:	83 e7 0f             	and    $0xf,%edi
  a4a74d:	40                   	inc    %eax
  a4a74e:	80 ff 0f             	cmp    $0xf,%bh
  a4a751:	74 65                	je     a4a7b8 <LZ4_decompress_safe+0x128>
  a4a753:	48                   	dec    %eax
  a4a754:	83 c2 04             	add    $0x4,%edx
  a4a757:	48                   	dec    %eax
  a4a758:	8d 3c 13             	lea    (%ebx,%edx,1),%edi
  a4a75b:	48                   	dec    %eax
  a4a75c:	83 fe 07             	cmp    $0x7,%esi
  a4a75f:	0f 86 c5 00 00 00    	jbe    a4a82a <LZ4_decompress_safe+0x19a>
  a4a765:	48                   	dec    %eax
  a4a766:	8b 30                	mov    (%eax),%esi
  a4a768:	48                   	dec    %eax
  a4a769:	83 c0 08             	add    $0x8,%eax
  a4a76c:	48                   	dec    %eax
  a4a76d:	89 33                	mov    %esi,(%ebx)
  a4a76f:	48                   	dec    %eax
  a4a770:	39 f9                	cmp    %edi,%ecx
  a4a772:	0f 82 00 01 00 00    	jb     a4a878 <LZ4_decompress_safe+0x1e8>
  a4a778:	48                   	dec    %eax
  a4a779:	8b 30                	mov    (%eax),%esi
  a4a77b:	48                   	dec    %eax
  a4a77c:	89 73 08             	mov    %esi,0x8(%ebx)
  a4a77f:	48                   	dec    %eax
  a4a780:	83 fa 10             	cmp    $0x10,%edx
  a4a783:	0f 86 53 ff ff ff    	jbe    a4a6dc <LZ4_decompress_safe+0x4c>
  a4a789:	48                   	dec    %eax
  a4a78a:	83 c0 08             	add    $0x8,%eax
  a4a78d:	48                   	dec    %eax
  a4a78e:	83 c3 10             	add    $0x10,%ebx
  a4a791:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4a798:	48                   	dec    %eax
  a4a799:	8b 10                	mov    (%eax),%edx
  a4a79b:	48                   	dec    %eax
  a4a79c:	83 c3 08             	add    $0x8,%ebx
  a4a79f:	48                   	dec    %eax
  a4a7a0:	83 c0 08             	add    $0x8,%eax
  a4a7a3:	48                   	dec    %eax
  a4a7a4:	89 53 f8             	mov    %edx,-0x8(%ebx)
  a4a7a7:	48                   	dec    %eax
  a4a7a8:	39 df                	cmp    %ebx,%edi
  a4a7aa:	77 ec                	ja     a4a798 <LZ4_decompress_safe+0x108>
  a4a7ac:	e9 2b ff ff ff       	jmp    a4a6dc <LZ4_decompress_safe+0x4c>
  a4a7b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4a7b8:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4a7bd:	eb 12                	jmp    a4a7d1 <LZ4_decompress_safe+0x141>
  a4a7bf:	90                   	nop
  a4a7c0:	44                   	inc    %esp
  a4a7c1:	0f b6 ff             	movzbl %bh,%edi
  a4a7c4:	4c                   	dec    %esp
  a4a7c5:	01 fa                	add    %edi,%edx
  a4a7c7:	40                   	inc    %eax
  a4a7c8:	80 ff ff             	cmp    $0xff,%bh
  a4a7cb:	0f 85 e5 00 00 00    	jne    a4a8b6 <LZ4_decompress_safe+0x226>
  a4a7d1:	49                   	dec    %ecx
  a4a7d2:	83 c0 01             	add    $0x1,%eax
  a4a7d5:	41                   	inc    %ecx
  a4a7d6:	0f b6 78 ff          	movzbl -0x1(%eax),%edi
  a4a7da:	4d                   	dec    %ebp
  a4a7db:	39 c4                	cmp    %eax,%esp
  a4a7dd:	75 e1                	jne    a4a7c0 <LZ4_decompress_safe+0x130>
  a4a7df:	48                   	dec    %eax
  a4a7e0:	83 c4 18             	add    $0x18,%esp
  a4a7e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4a7e8:	5b                   	pop    %ebx
  a4a7e9:	5d                   	pop    %ebp
  a4a7ea:	41                   	inc    %ecx
  a4a7eb:	5c                   	pop    %esp
  a4a7ec:	41                   	inc    %ecx
  a4a7ed:	5d                   	pop    %ebp
  a4a7ee:	41                   	inc    %ecx
  a4a7ef:	5e                   	pop    %esi
  a4a7f0:	41                   	inc    %ecx
  a4a7f1:	5f                   	pop    %edi
  a4a7f2:	c3                   	ret    
  a4a7f3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4a7f8:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4a7fd:	eb 06                	jmp    a4a805 <LZ4_decompress_safe+0x175>
  a4a7ff:	90                   	nop
  a4a800:	80 fb ff             	cmp    $0xff,%bl
  a4a803:	75 0f                	jne    a4a814 <LZ4_decompress_safe+0x184>
  a4a805:	0f b6 1e             	movzbl (%esi),%ebx
  a4a808:	48                   	dec    %eax
  a4a809:	83 c6 01             	add    $0x1,%esi
  a4a80c:	48                   	dec    %eax
  a4a80d:	01 d8                	add    %ebx,%eax
  a4a80f:	4c                   	dec    %esp
  a4a810:	39 ce                	cmp    %ecx,%esi
  a4a812:	72 ec                	jb     a4a800 <LZ4_decompress_safe+0x170>
  a4a814:	48                   	dec    %eax
  a4a815:	89 fb                	mov    %edi,%ebx
  a4a817:	48                   	dec    %eax
  a4a818:	01 c3                	add    %eax,%ebx
  a4a81a:	72 c3                	jb     a4a7df <LZ4_decompress_safe+0x14f>
  a4a81c:	49                   	dec    %ecx
  a4a81d:	89 f0                	mov    %esi,%eax
  a4a81f:	49                   	dec    %ecx
  a4a820:	01 c0                	add    %eax,%eax
  a4a822:	0f 83 d8 fe ff ff    	jae    a4a700 <LZ4_decompress_safe+0x70>
  a4a828:	eb b5                	jmp    a4a7df <LZ4_decompress_safe+0x14f>
  a4a82a:	44                   	inc    %esp
  a4a82b:	0f b6 38             	movzbl (%eax),%edi
  a4a82e:	44                   	inc    %esp
  a4a82f:	88 3b                	mov    %bh,(%ebx)
  a4a831:	44                   	inc    %esp
  a4a832:	0f b6 78 01          	movzbl 0x1(%eax),%edi
  a4a836:	44                   	inc    %esp
  a4a837:	88 7b 01             	mov    %bh,0x1(%ebx)
  a4a83a:	44                   	inc    %esp
  a4a83b:	0f b6 78 02          	movzbl 0x2(%eax),%edi
  a4a83f:	44                   	inc    %esp
  a4a840:	88 7b 02             	mov    %bh,0x2(%ebx)
  a4a843:	44                   	inc    %esp
  a4a844:	0f b6 78 03          	movzbl 0x3(%eax),%edi
  a4a848:	44                   	inc    %esp
  a4a849:	88 7b 03             	mov    %bh,0x3(%ebx)
  a4a84c:	4c                   	dec    %esp
  a4a84d:	8d 3d 4d 97 00 00    	lea    0x974d,%edi
  a4a853:	45                   	inc    %ebp
  a4a854:	8b 3c b7             	mov    (%edi,%esi,4),%edi
  a4a857:	4c                   	dec    %esp
  a4a858:	01 f8                	add    %edi,%eax
  a4a85a:	44                   	inc    %esp
  a4a85b:	8b 38                	mov    (%eax),%edi
  a4a85d:	44                   	inc    %esp
  a4a85e:	89 7b 04             	mov    %edi,0x4(%ebx)
  a4a861:	4c                   	dec    %esp
  a4a862:	8d 3d 58 97 00 00    	lea    0x9758,%edi
  a4a868:	49                   	dec    %ecx
  a4a869:	63 34 b7             	arpl   %si,(%edi,%esi,4)
  a4a86c:	48                   	dec    %eax
  a4a86d:	29 f0                	sub    %esi,%eax
  a4a86f:	48                   	dec    %eax
  a4a870:	39 f9                	cmp    %edi,%ecx
  a4a872:	0f 83 00 ff ff ff    	jae    a4a778 <LZ4_decompress_safe+0xe8>
  a4a878:	48                   	dec    %eax
  a4a879:	3b 7c 24 08          	cmp    0x8(%esp),%edi
  a4a87d:	0f 87 5c ff ff ff    	ja     a4a7df <LZ4_decompress_safe+0x14f>
  a4a883:	48                   	dec    %eax
  a4a884:	83 c3 08             	add    $0x8,%ebx
  a4a887:	4c                   	dec    %esp
  a4a888:	39 f3                	cmp    %esi,%ebx
  a4a88a:	72 73                	jb     a4a8ff <LZ4_decompress_safe+0x26f>
  a4a88c:	48                   	dec    %eax
  a4a88d:	39 df                	cmp    %ebx,%edi
  a4a88f:	0f 86 47 fe ff ff    	jbe    a4a6dc <LZ4_decompress_safe+0x4c>
  a4a895:	49                   	dec    %ecx
  a4a896:	89 ff                	mov    %edi,%edi
  a4a898:	31 d2                	xor    %edx,%edx
  a4a89a:	49                   	dec    %ecx
  a4a89b:	29 df                	sub    %ebx,%edi
  a4a89d:	0f 1f 00             	nopl   (%eax)
  a4a8a0:	0f b6 34 10          	movzbl (%eax,%edx,1),%esi
  a4a8a4:	40                   	inc    %eax
  a4a8a5:	88 34 13             	mov    %dh,(%ebx,%edx,1)
  a4a8a8:	48                   	dec    %eax
  a4a8a9:	83 c2 01             	add    $0x1,%edx
  a4a8ac:	49                   	dec    %ecx
  a4a8ad:	39 d7                	cmp    %edx,%edi
  a4a8af:	75 ef                	jne    a4a8a0 <LZ4_decompress_safe+0x210>
  a4a8b1:	e9 26 fe ff ff       	jmp    a4a6dc <LZ4_decompress_safe+0x4c>
  a4a8b6:	48                   	dec    %eax
  a4a8b7:	89 df                	mov    %ebx,%edi
  a4a8b9:	48                   	dec    %eax
  a4a8ba:	01 d7                	add    %edx,%edi
  a4a8bc:	0f 83 91 fe ff ff    	jae    a4a753 <LZ4_decompress_safe+0xc3>
  a4a8c2:	e9 18 ff ff ff       	jmp    a4a7df <LZ4_decompress_safe+0x14f>
  a4a8c7:	48                   	dec    %eax
  a4a8c8:	89 c2                	mov    %eax,%edx
  a4a8ca:	49                   	dec    %ecx
  a4a8cb:	39 db                	cmp    %ebx,%ebx
  a4a8cd:	0f 82 0c ff ff ff    	jb     a4a7df <LZ4_decompress_safe+0x14f>
  a4a8d3:	4d                   	dec    %ebp
  a4a8d4:	39 c2                	cmp    %eax,%edx
  a4a8d6:	0f 85 03 ff ff ff    	jne    a4a7df <LZ4_decompress_safe+0x14f>
  a4a8dc:	e8 df 33 00 00       	call   a4dcc0 <memcpy>
  a4a8e1:	89 d8                	mov    %ebx,%eax
  a4a8e3:	48                   	dec    %eax
  a4a8e4:	83 c4 18             	add    $0x18,%esp
  a4a8e7:	29 e8                	sub    %ebp,%eax
  a4a8e9:	5b                   	pop    %ebx
  a4a8ea:	5d                   	pop    %ebp
  a4a8eb:	41                   	inc    %ecx
  a4a8ec:	5c                   	pop    %esp
  a4a8ed:	41                   	inc    %ecx
  a4a8ee:	5d                   	pop    %ebp
  a4a8ef:	41                   	inc    %ecx
  a4a8f0:	5e                   	pop    %esi
  a4a8f1:	41                   	inc    %ecx
  a4a8f2:	5f                   	pop    %edi
  a4a8f3:	c3                   	ret    
  a4a8f4:	83 fa 01             	cmp    $0x1,%edx
  a4a8f7:	74 34                	je     a4a92d <LZ4_decompress_safe+0x29d>
  a4a8f9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4a8fe:	c3                   	ret    
  a4a8ff:	48                   	dec    %eax
  a4a900:	89 c6                	mov    %eax,%esi
  a4a902:	48                   	dec    %eax
  a4a903:	89 da                	mov    %ebx,%edx
  a4a905:	0f 1f 00             	nopl   (%eax)
  a4a908:	4c                   	dec    %esp
  a4a909:	8b 3e                	mov    (%esi),%edi
  a4a90b:	48                   	dec    %eax
  a4a90c:	83 c2 08             	add    $0x8,%edx
  a4a90f:	48                   	dec    %eax
  a4a910:	83 c6 08             	add    $0x8,%esi
  a4a913:	4c                   	dec    %esp
  a4a914:	89 7a f8             	mov    %edi,-0x8(%edx)
  a4a917:	49                   	dec    %ecx
  a4a918:	39 d6                	cmp    %edx,%esi
  a4a91a:	77 ec                	ja     a4a908 <LZ4_decompress_safe+0x278>
  a4a91c:	4c                   	dec    %esp
  a4a91d:	89 f2                	mov    %esi,%edx
  a4a91f:	48                   	dec    %eax
  a4a920:	29 da                	sub    %ebx,%edx
  a4a922:	4c                   	dec    %esp
  a4a923:	89 f3                	mov    %esi,%ebx
  a4a925:	48                   	dec    %eax
  a4a926:	01 d0                	add    %edx,%eax
  a4a928:	e9 5f ff ff ff       	jmp    a4a88c <LZ4_decompress_safe+0x1fc>
  a4a92d:	31 c0                	xor    %eax,%eax
  a4a92f:	80 3f 00             	cmpb   $0x0,(%edi)
  a4a932:	75 c5                	jne    a4a8f9 <LZ4_decompress_safe+0x269>
  a4a934:	c3                   	ret    
  a4a935:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4a93c:	00 00 00 00 

0000000000a4a940 <LZ4_decompress_safe_partial>:
  a4a940:	f3 0f 1e fa          	endbr64 
  a4a944:	41                   	inc    %ecx
  a4a945:	57                   	push   %edi
  a4a946:	4d                   	dec    %ebp
  a4a947:	63 d0                	arpl   %dx,%ax
  a4a949:	48                   	dec    %eax
  a4a94a:	63 c9                	arpl   %cx,%cx
  a4a94c:	49                   	dec    %ecx
  a4a94d:	89 f9                	mov    %edi,%ecx
  a4a94f:	41                   	inc    %ecx
  a4a950:	56                   	push   %esi
  a4a951:	49                   	dec    %ecx
  a4a952:	01 f2                	add    %esi,%edx
  a4a954:	48                   	dec    %eax
  a4a955:	01 f1                	add    %esi,%ecx
  a4a957:	41                   	inc    %ecx
  a4a958:	55                   	push   %ebp
  a4a959:	4d                   	dec    %ebp
  a4a95a:	8d 5a f4             	lea    -0xc(%edx),%ebx
  a4a95d:	41                   	inc    %ecx
  a4a95e:	54                   	push   %esp
  a4a95f:	4c                   	dec    %esp
  a4a960:	63 e2                	arpl   %sp,%dx
  a4a962:	55                   	push   %ebp
  a4a963:	49                   	dec    %ecx
  a4a964:	01 fc                	add    %edi,%esp
  a4a966:	53                   	push   %ebx
  a4a967:	48                   	dec    %eax
  a4a968:	83 ec 28             	sub    $0x28,%esp
  a4a96b:	49                   	dec    %ecx
  a4a96c:	39 cb                	cmp    %ecx,%ebx
  a4a96e:	49                   	dec    %ecx
  a4a96f:	0f 42 cb             	cmovb  %ebx,%ecx
  a4a972:	45                   	inc    %ebp
  a4a973:	85 c0                	test   %eax,%eax
  a4a975:	0f 84 54 02 00 00    	je     a4abcf <LZ4_decompress_safe_partial+0x28f>
  a4a97b:	49                   	dec    %ecx
  a4a97c:	8d 42 f9             	lea    -0x7(%edx),%eax
  a4a97f:	48                   	dec    %eax
  a4a980:	89 f5                	mov    %esi,%ebp
  a4a982:	48                   	dec    %eax
  a4a983:	89 f7                	mov    %esi,%edi
  a4a985:	48                   	dec    %eax
  a4a986:	89 44 24 08          	mov    %eax,0x8(%esp)
  a4a98a:	49                   	dec    %ecx
  a4a98b:	8d 42 fb             	lea    -0x5(%edx),%eax
  a4a98e:	4d                   	dec    %ebp
  a4a98f:	8d 44 24 f1          	lea    -0xf(%esp),%eax
  a4a993:	48                   	dec    %eax
  a4a994:	89 44 24 10          	mov    %eax,0x10(%esp)
  a4a998:	4d                   	dec    %ebp
  a4a999:	8d 74 24 f8          	lea    -0x8(%esp),%esi
  a4a99d:	4d                   	dec    %ebp
  a4a99e:	8d 6c 24 fc          	lea    -0x4(%esp),%ebp
  a4a9a2:	49                   	dec    %ecx
  a4a9a3:	8d 71 01             	lea    0x1(%ecx),%esi
  a4a9a6:	45                   	inc    %ebp
  a4a9a7:	0f b6 09             	movzbl (%ecx),%ecx
  a4a9aa:	44                   	inc    %esp
  a4a9ab:	89 ca                	mov    %ecx,%edx
  a4a9ad:	41                   	inc    %ecx
  a4a9ae:	c1 e9 04             	shr    $0x4,%ecx
  a4a9b1:	44                   	inc    %esp
  a4a9b2:	89 c8                	mov    %ecx,%eax
  a4a9b4:	41                   	inc    %ecx
  a4a9b5:	83 f9 0f             	cmp    $0xf,%ecx
  a4a9b8:	0f 84 0a 01 00 00    	je     a4aac8 <LZ4_decompress_safe_partial+0x188>
  a4a9be:	48                   	dec    %eax
  a4a9bf:	8d 1c 07             	lea    (%edi,%eax,1),%ebx
  a4a9c2:	48                   	dec    %eax
  a4a9c3:	39 d9                	cmp    %ebx,%ecx
  a4a9c5:	0f 82 d4 01 00 00    	jb     a4ab9f <LZ4_decompress_safe_partial+0x25f>
  a4a9cb:	4c                   	dec    %esp
  a4a9cc:	8d 0c 06             	lea    (%esi,%eax,1),%ecx
  a4a9cf:	4d                   	dec    %ebp
  a4a9d0:	39 f1                	cmp    %esi,%ecx
  a4a9d2:	0f 87 c7 01 00 00    	ja     a4ab9f <LZ4_decompress_safe_partial+0x25f>
  a4a9d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4a9df:	00 
  a4a9e0:	48                   	dec    %eax
  a4a9e1:	8b 06                	mov    (%esi),%eax
  a4a9e3:	48                   	dec    %eax
  a4a9e4:	83 c7 08             	add    $0x8,%edi
  a4a9e7:	48                   	dec    %eax
  a4a9e8:	83 c6 08             	add    $0x8,%esi
  a4a9eb:	48                   	dec    %eax
  a4a9ec:	89 47 f8             	mov    %eax,-0x8(%edi)
  a4a9ef:	48                   	dec    %eax
  a4a9f0:	39 df                	cmp    %ebx,%edi
  a4a9f2:	72 ec                	jb     a4a9e0 <LZ4_decompress_safe_partial+0xa0>
  a4a9f4:	41                   	inc    %ecx
  a4a9f5:	0f b7 31             	movzwl (%ecx),%esi
  a4a9f8:	48                   	dec    %eax
  a4a9f9:	89 d8                	mov    %ebx,%eax
  a4a9fb:	49                   	dec    %ecx
  a4a9fc:	83 c1 02             	add    $0x2,%ecx
  a4a9ff:	48                   	dec    %eax
  a4aa00:	29 f0                	sub    %esi,%eax
  a4aa02:	48                   	dec    %eax
  a4aa03:	39 c5                	cmp    %eax,%ebp
  a4aa05:	0f 87 a4 00 00 00    	ja     a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4aa0b:	89 d7                	mov    %edx,%edi
  a4aa0d:	89 33                	mov    %esi,(%ebx)
  a4aa0f:	83 e2 0f             	and    $0xf,%edx
  a4aa12:	83 e7 0f             	and    $0xf,%edi
  a4aa15:	40                   	inc    %eax
  a4aa16:	80 ff 0f             	cmp    $0xf,%bh
  a4aa19:	74 65                	je     a4aa80 <LZ4_decompress_safe_partial+0x140>
  a4aa1b:	48                   	dec    %eax
  a4aa1c:	83 c2 04             	add    $0x4,%edx
  a4aa1f:	48                   	dec    %eax
  a4aa20:	8d 3c 13             	lea    (%ebx,%edx,1),%edi
  a4aa23:	48                   	dec    %eax
  a4aa24:	83 fe 07             	cmp    $0x7,%esi
  a4aa27:	0f 86 cd 00 00 00    	jbe    a4aafa <LZ4_decompress_safe_partial+0x1ba>
  a4aa2d:	48                   	dec    %eax
  a4aa2e:	8b 30                	mov    (%eax),%esi
  a4aa30:	48                   	dec    %eax
  a4aa31:	83 c0 08             	add    $0x8,%eax
  a4aa34:	48                   	dec    %eax
  a4aa35:	89 33                	mov    %esi,(%ebx)
  a4aa37:	49                   	dec    %ecx
  a4aa38:	39 fb                	cmp    %edi,%ebx
  a4aa3a:	0f 82 08 01 00 00    	jb     a4ab48 <LZ4_decompress_safe_partial+0x208>
  a4aa40:	48                   	dec    %eax
  a4aa41:	8b 30                	mov    (%eax),%esi
  a4aa43:	48                   	dec    %eax
  a4aa44:	89 73 08             	mov    %esi,0x8(%ebx)
  a4aa47:	48                   	dec    %eax
  a4aa48:	83 fa 10             	cmp    $0x10,%edx
  a4aa4b:	0f 86 51 ff ff ff    	jbe    a4a9a2 <LZ4_decompress_safe_partial+0x62>
  a4aa51:	48                   	dec    %eax
  a4aa52:	83 c0 08             	add    $0x8,%eax
  a4aa55:	48                   	dec    %eax
  a4aa56:	83 c3 10             	add    $0x10,%ebx
  a4aa59:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4aa60:	48                   	dec    %eax
  a4aa61:	8b 10                	mov    (%eax),%edx
  a4aa63:	48                   	dec    %eax
  a4aa64:	83 c3 08             	add    $0x8,%ebx
  a4aa67:	48                   	dec    %eax
  a4aa68:	83 c0 08             	add    $0x8,%eax
  a4aa6b:	48                   	dec    %eax
  a4aa6c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  a4aa6f:	48                   	dec    %eax
  a4aa70:	39 df                	cmp    %ebx,%edi
  a4aa72:	77 ec                	ja     a4aa60 <LZ4_decompress_safe_partial+0x120>
  a4aa74:	e9 29 ff ff ff       	jmp    a4a9a2 <LZ4_decompress_safe_partial+0x62>
  a4aa79:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4aa80:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4aa85:	eb 1a                	jmp    a4aaa1 <LZ4_decompress_safe_partial+0x161>
  a4aa87:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4aa8e:	00 00 
  a4aa90:	44                   	inc    %esp
  a4aa91:	0f b6 ff             	movzbl %bh,%edi
  a4aa94:	4c                   	dec    %esp
  a4aa95:	01 fa                	add    %edi,%edx
  a4aa97:	40                   	inc    %eax
  a4aa98:	80 ff ff             	cmp    $0xff,%bh
  a4aa9b:	0f 85 ed 00 00 00    	jne    a4ab8e <LZ4_decompress_safe_partial+0x24e>
  a4aaa1:	49                   	dec    %ecx
  a4aaa2:	83 c1 01             	add    $0x1,%ecx
  a4aaa5:	41                   	inc    %ecx
  a4aaa6:	0f b6 79 ff          	movzbl -0x1(%ecx),%edi
  a4aaaa:	4d                   	dec    %ebp
  a4aaab:	39 cd                	cmp    %ecx,%ebp
  a4aaad:	75 e1                	jne    a4aa90 <LZ4_decompress_safe_partial+0x150>
  a4aaaf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4aab4:	48                   	dec    %eax
  a4aab5:	83 c4 28             	add    $0x28,%esp
  a4aab8:	5b                   	pop    %ebx
  a4aab9:	5d                   	pop    %ebp
  a4aaba:	41                   	inc    %ecx
  a4aabb:	5c                   	pop    %esp
  a4aabc:	41                   	inc    %ecx
  a4aabd:	5d                   	pop    %ebp
  a4aabe:	41                   	inc    %ecx
  a4aabf:	5e                   	pop    %esi
  a4aac0:	41                   	inc    %ecx
  a4aac1:	5f                   	pop    %edi
  a4aac2:	c3                   	ret    
  a4aac3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4aac8:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4aacd:	eb 06                	jmp    a4aad5 <LZ4_decompress_safe_partial+0x195>
  a4aacf:	90                   	nop
  a4aad0:	80 fb ff             	cmp    $0xff,%bl
  a4aad3:	75 0f                	jne    a4aae4 <LZ4_decompress_safe_partial+0x1a4>
  a4aad5:	0f b6 1e             	movzbl (%esi),%ebx
  a4aad8:	48                   	dec    %eax
  a4aad9:	83 c6 01             	add    $0x1,%esi
  a4aadc:	48                   	dec    %eax
  a4aadd:	01 d8                	add    %ebx,%eax
  a4aadf:	4c                   	dec    %esp
  a4aae0:	39 c6                	cmp    %eax,%esi
  a4aae2:	72 ec                	jb     a4aad0 <LZ4_decompress_safe_partial+0x190>
  a4aae4:	48                   	dec    %eax
  a4aae5:	89 fb                	mov    %edi,%ebx
  a4aae7:	48                   	dec    %eax
  a4aae8:	01 c3                	add    %eax,%ebx
  a4aaea:	72 c3                	jb     a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4aaec:	49                   	dec    %ecx
  a4aaed:	89 f7                	mov    %esi,%edi
  a4aaef:	49                   	dec    %ecx
  a4aaf0:	01 c7                	add    %eax,%edi
  a4aaf2:	0f 83 ca fe ff ff    	jae    a4a9c2 <LZ4_decompress_safe_partial+0x82>
  a4aaf8:	eb b5                	jmp    a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4aafa:	44                   	inc    %esp
  a4aafb:	0f b6 38             	movzbl (%eax),%edi
  a4aafe:	44                   	inc    %esp
  a4aaff:	88 3b                	mov    %bh,(%ebx)
  a4ab01:	44                   	inc    %esp
  a4ab02:	0f b6 78 01          	movzbl 0x1(%eax),%edi
  a4ab06:	44                   	inc    %esp
  a4ab07:	88 7b 01             	mov    %bh,0x1(%ebx)
  a4ab0a:	44                   	inc    %esp
  a4ab0b:	0f b6 78 02          	movzbl 0x2(%eax),%edi
  a4ab0f:	44                   	inc    %esp
  a4ab10:	88 7b 02             	mov    %bh,0x2(%ebx)
  a4ab13:	44                   	inc    %esp
  a4ab14:	0f b6 78 03          	movzbl 0x3(%eax),%edi
  a4ab18:	44                   	inc    %esp
  a4ab19:	88 7b 03             	mov    %bh,0x3(%ebx)
  a4ab1c:	4c                   	dec    %esp
  a4ab1d:	8d 3d 7d 94 00 00    	lea    0x947d,%edi
  a4ab23:	45                   	inc    %ebp
  a4ab24:	8b 3c b7             	mov    (%edi,%esi,4),%edi
  a4ab27:	4c                   	dec    %esp
  a4ab28:	01 f8                	add    %edi,%eax
  a4ab2a:	44                   	inc    %esp
  a4ab2b:	8b 38                	mov    (%eax),%edi
  a4ab2d:	44                   	inc    %esp
  a4ab2e:	89 7b 04             	mov    %edi,0x4(%ebx)
  a4ab31:	4c                   	dec    %esp
  a4ab32:	8d 3d 88 94 00 00    	lea    0x9488,%edi
  a4ab38:	49                   	dec    %ecx
  a4ab39:	63 34 b7             	arpl   %si,(%edi,%esi,4)
  a4ab3c:	48                   	dec    %eax
  a4ab3d:	29 f0                	sub    %esi,%eax
  a4ab3f:	49                   	dec    %ecx
  a4ab40:	39 fb                	cmp    %edi,%ebx
  a4ab42:	0f 83 f8 fe ff ff    	jae    a4aa40 <LZ4_decompress_safe_partial+0x100>
  a4ab48:	48                   	dec    %eax
  a4ab49:	3b 7c 24 10          	cmp    0x10(%esp),%edi
  a4ab4d:	0f 87 5c ff ff ff    	ja     a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4ab53:	48                   	dec    %eax
  a4ab54:	83 c3 08             	add    $0x8,%ebx
  a4ab57:	48                   	dec    %eax
  a4ab58:	3b 5c 24 08          	cmp    0x8(%esp),%ebx
  a4ab5c:	0f 82 86 00 00 00    	jb     a4abe8 <LZ4_decompress_safe_partial+0x2a8>
  a4ab62:	48                   	dec    %eax
  a4ab63:	39 df                	cmp    %ebx,%edi
  a4ab65:	0f 86 37 fe ff ff    	jbe    a4a9a2 <LZ4_decompress_safe_partial+0x62>
  a4ab6b:	49                   	dec    %ecx
  a4ab6c:	89 ff                	mov    %edi,%edi
  a4ab6e:	31 d2                	xor    %edx,%edx
  a4ab70:	49                   	dec    %ecx
  a4ab71:	29 df                	sub    %ebx,%edi
  a4ab73:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4ab78:	0f b6 34 10          	movzbl (%eax,%edx,1),%esi
  a4ab7c:	40                   	inc    %eax
  a4ab7d:	88 34 13             	mov    %dh,(%ebx,%edx,1)
  a4ab80:	48                   	dec    %eax
  a4ab81:	83 c2 01             	add    $0x1,%edx
  a4ab84:	49                   	dec    %ecx
  a4ab85:	39 d7                	cmp    %edx,%edi
  a4ab87:	75 ef                	jne    a4ab78 <LZ4_decompress_safe_partial+0x238>
  a4ab89:	e9 14 fe ff ff       	jmp    a4a9a2 <LZ4_decompress_safe_partial+0x62>
  a4ab8e:	48                   	dec    %eax
  a4ab8f:	89 df                	mov    %ebx,%edi
  a4ab91:	48                   	dec    %eax
  a4ab92:	01 d7                	add    %edx,%edi
  a4ab94:	0f 83 81 fe ff ff    	jae    a4aa1b <LZ4_decompress_safe_partial+0xdb>
  a4ab9a:	e9 10 ff ff ff       	jmp    a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4ab9f:	48                   	dec    %eax
  a4aba0:	89 c2                	mov    %eax,%edx
  a4aba2:	49                   	dec    %ecx
  a4aba3:	39 da                	cmp    %ebx,%edx
  a4aba5:	0f 82 04 ff ff ff    	jb     a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4abab:	48                   	dec    %eax
  a4abac:	01 f0                	add    %esi,%eax
  a4abae:	49                   	dec    %ecx
  a4abaf:	39 c4                	cmp    %eax,%esp
  a4abb1:	0f 82 f8 fe ff ff    	jb     a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4abb7:	e8 04 31 00 00       	call   a4dcc0 <memcpy>
  a4abbc:	89 d8                	mov    %ebx,%eax
  a4abbe:	48                   	dec    %eax
  a4abbf:	83 c4 28             	add    $0x28,%esp
  a4abc2:	29 e8                	sub    %ebp,%eax
  a4abc4:	5b                   	pop    %ebx
  a4abc5:	5d                   	pop    %ebp
  a4abc6:	41                   	inc    %ecx
  a4abc7:	5c                   	pop    %esp
  a4abc8:	41                   	inc    %ecx
  a4abc9:	5d                   	pop    %ebp
  a4abca:	41                   	inc    %ecx
  a4abcb:	5e                   	pop    %esi
  a4abcc:	41                   	inc    %ecx
  a4abcd:	5f                   	pop    %edi
  a4abce:	c3                   	ret    
  a4abcf:	83 fa 01             	cmp    $0x1,%edx
  a4abd2:	0f 85 d7 fe ff ff    	jne    a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4abd8:	31 c0                	xor    %eax,%eax
  a4abda:	80 3f 00             	cmpb   $0x0,(%edi)
  a4abdd:	0f 84 d1 fe ff ff    	je     a4aab4 <LZ4_decompress_safe_partial+0x174>
  a4abe3:	e9 c7 fe ff ff       	jmp    a4aaaf <LZ4_decompress_safe_partial+0x16f>
  a4abe8:	48                   	dec    %eax
  a4abe9:	89 44 24 18          	mov    %eax,0x18(%esp)
  a4abed:	4c                   	dec    %esp
  a4abee:	8b 7c 24 08          	mov    0x8(%esp),%edi
  a4abf2:	48                   	dec    %eax
  a4abf3:	89 c6                	mov    %eax,%esi
  a4abf5:	48                   	dec    %eax
  a4abf6:	89 da                	mov    %ebx,%edx
  a4abf8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4abff:	00 
  a4ac00:	48                   	dec    %eax
  a4ac01:	8b 06                	mov    (%esi),%eax
  a4ac03:	48                   	dec    %eax
  a4ac04:	83 c2 08             	add    $0x8,%edx
  a4ac07:	48                   	dec    %eax
  a4ac08:	83 c6 08             	add    $0x8,%esi
  a4ac0b:	48                   	dec    %eax
  a4ac0c:	89 42 f8             	mov    %eax,-0x8(%edx)
  a4ac0f:	49                   	dec    %ecx
  a4ac10:	39 d7                	cmp    %edx,%edi
  a4ac12:	77 ec                	ja     a4ac00 <LZ4_decompress_safe_partial+0x2c0>
  a4ac14:	48                   	dec    %eax
  a4ac15:	8b 74 24 08          	mov    0x8(%esp),%esi
  a4ac19:	48                   	dec    %eax
  a4ac1a:	8b 44 24 18          	mov    0x18(%esp),%eax
  a4ac1e:	48                   	dec    %eax
  a4ac1f:	89 f2                	mov    %esi,%edx
  a4ac21:	48                   	dec    %eax
  a4ac22:	29 da                	sub    %ebx,%edx
  a4ac24:	48                   	dec    %eax
  a4ac25:	89 f3                	mov    %esi,%ebx
  a4ac27:	48                   	dec    %eax
  a4ac28:	01 d0                	add    %edx,%eax
  a4ac2a:	e9 33 ff ff ff       	jmp    a4ab62 <LZ4_decompress_safe_partial+0x222>
  a4ac2f:	90                   	nop

0000000000a4ac30 <LZ4_decompress_fast>:
  a4ac30:	f3 0f 1e fa          	endbr64 
  a4ac34:	41                   	inc    %ecx
  a4ac35:	57                   	push   %edi
  a4ac36:	4c                   	dec    %esp
  a4ac37:	63 da                	arpl   %bx,%dx
  a4ac39:	41                   	inc    %ecx
  a4ac3a:	56                   	push   %esi
  a4ac3b:	49                   	dec    %ecx
  a4ac3c:	01 f3                	add    %esi,%ebx
  a4ac3e:	41                   	inc    %ecx
  a4ac3f:	55                   	push   %ebp
  a4ac40:	41                   	inc    %ecx
  a4ac41:	54                   	push   %esp
  a4ac42:	49                   	dec    %ecx
  a4ac43:	89 fc                	mov    %edi,%esp
  a4ac45:	48                   	dec    %eax
  a4ac46:	89 f7                	mov    %esi,%edi
  a4ac48:	55                   	push   %ebp
  a4ac49:	53                   	push   %ebx
  a4ac4a:	48                   	dec    %eax
  a4ac4b:	83 ec 08             	sub    $0x8,%esp
  a4ac4e:	41                   	inc    %ecx
  a4ac4f:	0f b6 34 24          	movzbl (%esp),%esi
  a4ac53:	85 d2                	test   %edx,%edx
  a4ac55:	0f 84 17 02 00 00    	je     a4ae72 <LZ4_decompress_fast+0x242>
  a4ac5b:	4d                   	dec    %ebp
  a4ac5c:	8d 43 f8             	lea    -0x8(%ebx),%eax
  a4ac5f:	4c                   	dec    %esp
  a4ac60:	89 e5                	mov    %esp,%ebp
  a4ac62:	4d                   	dec    %ebp
  a4ac63:	8d 4b f4             	lea    -0xc(%ebx),%ecx
  a4ac66:	4c                   	dec    %esp
  a4ac67:	8d 3d 53 93 00 00    	lea    0x9353,%edi
  a4ac6d:	4c                   	dec    %esp
  a4ac6e:	8d 35 2c 93 00 00    	lea    0x932c,%esi
  a4ac74:	4d                   	dec    %ebp
  a4ac75:	8d 53 f9             	lea    -0x7(%ebx),%edx
  a4ac78:	4d                   	dec    %ebp
  a4ac79:	8d 6b fb             	lea    -0x5(%ebx),%ebp
  a4ac7c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4ac80:	40                   	inc    %eax
  a4ac81:	0f b6 c6             	movzbl %dh,%eax
  a4ac84:	48                   	dec    %eax
  a4ac85:	83 c5 01             	add    $0x1,%ebp
  a4ac88:	c1 e8 04             	shr    $0x4,%eax
  a4ac8b:	89 c3                	mov    %eax,%ebx
  a4ac8d:	83 f8 0f             	cmp    $0xf,%eax
  a4ac90:	0f 84 ba 00 00 00    	je     a4ad50 <LZ4_decompress_fast+0x120>
  a4ac96:	48                   	dec    %eax
  a4ac97:	8d 14 1f             	lea    (%edi,%ebx,1),%edx
  a4ac9a:	4c                   	dec    %esp
  a4ac9b:	39 c2                	cmp    %eax,%edx
  a4ac9d:	0f 87 d2 00 00 00    	ja     a4ad75 <LZ4_decompress_fast+0x145>
  a4aca3:	48                   	dec    %eax
  a4aca4:	89 e8                	mov    %ebp,%eax
  a4aca6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4acad:	00 00 00 
  a4acb0:	48                   	dec    %eax
  a4acb1:	8b 08                	mov    (%eax),%ecx
  a4acb3:	48                   	dec    %eax
  a4acb4:	83 c7 08             	add    $0x8,%edi
  a4acb7:	48                   	dec    %eax
  a4acb8:	83 c0 08             	add    $0x8,%eax
  a4acbb:	48                   	dec    %eax
  a4acbc:	89 4f f8             	mov    %ecx,-0x8(%edi)
  a4acbf:	48                   	dec    %eax
  a4acc0:	39 fa                	cmp    %edi,%edx
  a4acc2:	77 ec                	ja     a4acb0 <LZ4_decompress_fast+0x80>
  a4acc4:	48                   	dec    %eax
  a4acc5:	01 dd                	add    %ebx,%ebp
  a4acc7:	89 f7                	mov    %esi,%edi
  a4acc9:	48                   	dec    %eax
  a4acca:	89 d0                	mov    %edx,%eax
  a4accc:	83 e6 0f             	and    $0xf,%esi
  a4accf:	0f b7 4d 00          	movzwl 0x0(%ebp),%ecx
  a4acd3:	83 e7 0f             	and    $0xf,%edi
  a4acd6:	48                   	dec    %eax
  a4acd7:	83 c5 02             	add    $0x2,%ebp
  a4acda:	89 0a                	mov    %ecx,(%edx)
  a4acdc:	48                   	dec    %eax
  a4acdd:	29 c8                	sub    %ecx,%eax
  a4acdf:	40                   	inc    %eax
  a4ace0:	80 ff 0f             	cmp    $0xf,%bh
  a4ace3:	0f 84 b7 00 00 00    	je     a4ada0 <LZ4_decompress_fast+0x170>
  a4ace9:	48                   	dec    %eax
  a4acea:	83 c6 04             	add    $0x4,%esi
  a4aced:	48                   	dec    %eax
  a4acee:	8d 3c 32             	lea    (%edx,%esi,1),%edi
  a4acf1:	48                   	dec    %eax
  a4acf2:	83 f9 07             	cmp    $0x7,%ecx
  a4acf5:	0f 86 d5 00 00 00    	jbe    a4add0 <LZ4_decompress_fast+0x1a0>
  a4acfb:	48                   	dec    %eax
  a4acfc:	8b 08                	mov    (%eax),%ecx
  a4acfe:	48                   	dec    %eax
  a4acff:	83 c0 08             	add    $0x8,%eax
  a4ad02:	48                   	dec    %eax
  a4ad03:	89 0a                	mov    %ecx,(%edx)
  a4ad05:	4c                   	dec    %esp
  a4ad06:	39 cf                	cmp    %ecx,%edi
  a4ad08:	0f 87 02 01 00 00    	ja     a4ae10 <LZ4_decompress_fast+0x1e0>
  a4ad0e:	48                   	dec    %eax
  a4ad0f:	8b 08                	mov    (%eax),%ecx
  a4ad11:	48                   	dec    %eax
  a4ad12:	89 4a 08             	mov    %ecx,0x8(%edx)
  a4ad15:	48                   	dec    %eax
  a4ad16:	83 fe 10             	cmp    $0x10,%esi
  a4ad19:	77 0d                	ja     a4ad28 <LZ4_decompress_fast+0xf8>
  a4ad1b:	0f b6 75 00          	movzbl 0x0(%ebp),%esi
  a4ad1f:	e9 5c ff ff ff       	jmp    a4ac80 <LZ4_decompress_fast+0x50>
  a4ad24:	0f 1f 40 00          	nopl   0x0(%eax)
  a4ad28:	48                   	dec    %eax
  a4ad29:	83 c0 08             	add    $0x8,%eax
  a4ad2c:	48                   	dec    %eax
  a4ad2d:	83 c2 10             	add    $0x10,%edx
  a4ad30:	48                   	dec    %eax
  a4ad31:	8b 08                	mov    (%eax),%ecx
  a4ad33:	48                   	dec    %eax
  a4ad34:	83 c2 08             	add    $0x8,%edx
  a4ad37:	48                   	dec    %eax
  a4ad38:	83 c0 08             	add    $0x8,%eax
  a4ad3b:	48                   	dec    %eax
  a4ad3c:	89 4a f8             	mov    %ecx,-0x8(%edx)
  a4ad3f:	48                   	dec    %eax
  a4ad40:	39 d7                	cmp    %edx,%edi
  a4ad42:	77 ec                	ja     a4ad30 <LZ4_decompress_fast+0x100>
  a4ad44:	eb d5                	jmp    a4ad1b <LZ4_decompress_fast+0xeb>
  a4ad46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4ad4d:	00 00 00 
  a4ad50:	bb 0f 00 00 00       	mov    $0xf,%ebx
  a4ad55:	0f 1f 00             	nopl   (%eax)
  a4ad58:	0f b6 55 00          	movzbl 0x0(%ebp),%edx
  a4ad5c:	48                   	dec    %eax
  a4ad5d:	83 c5 01             	add    $0x1,%ebp
  a4ad60:	48                   	dec    %eax
  a4ad61:	01 d3                	add    %edx,%ebx
  a4ad63:	80 fa ff             	cmp    $0xff,%dl
  a4ad66:	74 f0                	je     a4ad58 <LZ4_decompress_fast+0x128>
  a4ad68:	48                   	dec    %eax
  a4ad69:	8d 14 1f             	lea    (%edi,%ebx,1),%edx
  a4ad6c:	4c                   	dec    %esp
  a4ad6d:	39 c2                	cmp    %eax,%edx
  a4ad6f:	0f 86 2e ff ff ff    	jbe    a4aca3 <LZ4_decompress_fast+0x73>
  a4ad75:	49                   	dec    %ecx
  a4ad76:	39 d3                	cmp    %edx,%ebx
  a4ad78:	0f 85 02 01 00 00    	jne    a4ae80 <LZ4_decompress_fast+0x250>
  a4ad7e:	48                   	dec    %eax
  a4ad7f:	89 da                	mov    %ebx,%edx
  a4ad81:	48                   	dec    %eax
  a4ad82:	89 ee                	mov    %ebp,%esi
  a4ad84:	e8 37 2f 00 00       	call   a4dcc0 <memcpy>
  a4ad89:	48                   	dec    %eax
  a4ad8a:	8d 44 1d 00          	lea    0x0(%ebp,%ebx,1),%eax
  a4ad8e:	44                   	inc    %esp
  a4ad8f:	29 e0                	sub    %esp,%eax
  a4ad91:	48                   	dec    %eax
  a4ad92:	83 c4 08             	add    $0x8,%esp
  a4ad95:	5b                   	pop    %ebx
  a4ad96:	5d                   	pop    %ebp
  a4ad97:	41                   	inc    %ecx
  a4ad98:	5c                   	pop    %esp
  a4ad99:	41                   	inc    %ecx
  a4ad9a:	5d                   	pop    %ebp
  a4ad9b:	41                   	inc    %ecx
  a4ad9c:	5e                   	pop    %esi
  a4ad9d:	41                   	inc    %ecx
  a4ad9e:	5f                   	pop    %edi
  a4ad9f:	c3                   	ret    
  a4ada0:	be 0f 00 00 00       	mov    $0xf,%esi
  a4ada5:	0f 1f 00             	nopl   (%eax)
  a4ada8:	0f b6 5d 00          	movzbl 0x0(%ebp),%ebx
  a4adac:	48                   	dec    %eax
  a4adad:	83 c5 01             	add    $0x1,%ebp
  a4adb0:	48                   	dec    %eax
  a4adb1:	01 de                	add    %ebx,%esi
  a4adb3:	80 fb ff             	cmp    $0xff,%bl
  a4adb6:	74 f0                	je     a4ada8 <LZ4_decompress_fast+0x178>
  a4adb8:	48                   	dec    %eax
  a4adb9:	83 c6 04             	add    $0x4,%esi
  a4adbc:	48                   	dec    %eax
  a4adbd:	8d 3c 32             	lea    (%edx,%esi,1),%edi
  a4adc0:	48                   	dec    %eax
  a4adc1:	83 f9 07             	cmp    $0x7,%ecx
  a4adc4:	0f 87 31 ff ff ff    	ja     a4acfb <LZ4_decompress_fast+0xcb>
  a4adca:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4add0:	0f b6 18             	movzbl (%eax),%ebx
  a4add3:	88 1a                	mov    %bl,(%edx)
  a4add5:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
  a4add9:	88 5a 01             	mov    %bl,0x1(%edx)
  a4addc:	0f b6 58 02          	movzbl 0x2(%eax),%ebx
  a4ade0:	88 5a 02             	mov    %bl,0x2(%edx)
  a4ade3:	0f b6 58 03          	movzbl 0x3(%eax),%ebx
  a4ade7:	88 5a 03             	mov    %bl,0x3(%edx)
  a4adea:	41                   	inc    %ecx
  a4adeb:	8b 1c 8e             	mov    (%esi,%ecx,4),%ebx
  a4adee:	49                   	dec    %ecx
  a4adef:	63 0c 8f             	arpl   %cx,(%edi,%ecx,4)
  a4adf2:	48                   	dec    %eax
  a4adf3:	01 d8                	add    %ebx,%eax
  a4adf5:	8b 18                	mov    (%eax),%ebx
  a4adf7:	48                   	dec    %eax
  a4adf8:	29 c8                	sub    %ecx,%eax
  a4adfa:	89 5a 04             	mov    %ebx,0x4(%edx)
  a4adfd:	4c                   	dec    %esp
  a4adfe:	39 cf                	cmp    %ecx,%edi
  a4ae00:	0f 86 08 ff ff ff    	jbe    a4ad0e <LZ4_decompress_fast+0xde>
  a4ae06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4ae0d:	00 00 00 
  a4ae10:	4c                   	dec    %esp
  a4ae11:	39 ef                	cmp    %ebp,%edi
  a4ae13:	77 6b                	ja     a4ae80 <LZ4_decompress_fast+0x250>
  a4ae15:	48                   	dec    %eax
  a4ae16:	83 c2 08             	add    $0x8,%edx
  a4ae19:	4c                   	dec    %esp
  a4ae1a:	39 d2                	cmp    %edx,%edx
  a4ae1c:	72 28                	jb     a4ae46 <LZ4_decompress_fast+0x216>
  a4ae1e:	48                   	dec    %eax
  a4ae1f:	39 d7                	cmp    %edx,%edi
  a4ae21:	0f 86 f4 fe ff ff    	jbe    a4ad1b <LZ4_decompress_fast+0xeb>
  a4ae27:	48                   	dec    %eax
  a4ae28:	89 fb                	mov    %edi,%ebx
  a4ae2a:	31 c9                	xor    %ecx,%ecx
  a4ae2c:	48                   	dec    %eax
  a4ae2d:	29 d3                	sub    %edx,%ebx
  a4ae2f:	90                   	nop
  a4ae30:	0f b6 34 08          	movzbl (%eax,%ecx,1),%esi
  a4ae34:	40                   	inc    %eax
  a4ae35:	88 34 0a             	mov    %dh,(%edx,%ecx,1)
  a4ae38:	48                   	dec    %eax
  a4ae39:	83 c1 01             	add    $0x1,%ecx
  a4ae3c:	48                   	dec    %eax
  a4ae3d:	39 cb                	cmp    %ecx,%ebx
  a4ae3f:	75 ef                	jne    a4ae30 <LZ4_decompress_fast+0x200>
  a4ae41:	e9 d5 fe ff ff       	jmp    a4ad1b <LZ4_decompress_fast+0xeb>
  a4ae46:	48                   	dec    %eax
  a4ae47:	89 c6                	mov    %eax,%esi
  a4ae49:	48                   	dec    %eax
  a4ae4a:	89 d1                	mov    %edx,%ecx
  a4ae4c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4ae50:	48                   	dec    %eax
  a4ae51:	8b 1e                	mov    (%esi),%ebx
  a4ae53:	48                   	dec    %eax
  a4ae54:	83 c1 08             	add    $0x8,%ecx
  a4ae57:	48                   	dec    %eax
  a4ae58:	83 c6 08             	add    $0x8,%esi
  a4ae5b:	48                   	dec    %eax
  a4ae5c:	89 59 f8             	mov    %ebx,-0x8(%ecx)
  a4ae5f:	49                   	dec    %ecx
  a4ae60:	39 ca                	cmp    %ecx,%edx
  a4ae62:	77 ec                	ja     a4ae50 <LZ4_decompress_fast+0x220>
  a4ae64:	4c                   	dec    %esp
  a4ae65:	89 d1                	mov    %edx,%ecx
  a4ae67:	48                   	dec    %eax
  a4ae68:	29 d1                	sub    %edx,%ecx
  a4ae6a:	4c                   	dec    %esp
  a4ae6b:	89 d2                	mov    %edx,%edx
  a4ae6d:	48                   	dec    %eax
  a4ae6e:	01 c8                	add    %ecx,%eax
  a4ae70:	eb ac                	jmp    a4ae1e <LZ4_decompress_fast+0x1ee>
  a4ae72:	b8 01 00 00 00       	mov    $0x1,%eax
  a4ae77:	40                   	inc    %eax
  a4ae78:	84 f6                	test   %dh,%dh
  a4ae7a:	0f 84 11 ff ff ff    	je     a4ad91 <LZ4_decompress_fast+0x161>
  a4ae80:	48                   	dec    %eax
  a4ae81:	83 c4 08             	add    $0x8,%esp
  a4ae84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4ae89:	5b                   	pop    %ebx
  a4ae8a:	5d                   	pop    %ebp
  a4ae8b:	41                   	inc    %ecx
  a4ae8c:	5c                   	pop    %esp
  a4ae8d:	41                   	inc    %ecx
  a4ae8e:	5d                   	pop    %ebp
  a4ae8f:	41                   	inc    %ecx
  a4ae90:	5e                   	pop    %esi
  a4ae91:	41                   	inc    %ecx
  a4ae92:	5f                   	pop    %edi
  a4ae93:	c3                   	ret    
  a4ae94:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4ae9b:	00 00 00 00 
  a4ae9f:	90                   	nop

0000000000a4aea0 <LZ4_setStreamDecode>:
  a4aea0:	f3 0f 1e fa          	endbr64 
  a4aea4:	48                   	dec    %eax
  a4aea5:	63 d2                	arpl   %dx,%dx
  a4aea7:	48                   	dec    %eax
  a4aea8:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
  a4aeae:	b8 01 00 00 00       	mov    $0x1,%eax
  a4aeb3:	48                   	dec    %eax
  a4aeb4:	89 57 18             	mov    %edx,0x18(%edi)
  a4aeb7:	48                   	dec    %eax
  a4aeb8:	01 f2                	add    %esi,%edx
  a4aeba:	48                   	dec    %eax
  a4aebb:	89 57 10             	mov    %edx,0x10(%edi)
  a4aebe:	48                   	dec    %eax
  a4aebf:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
  a4aec6:	c3                   	ret    
  a4aec7:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4aece:	00 00 

0000000000a4aed0 <LZ4_decompress_safe_continue>:
  a4aed0:	f3 0f 1e fa          	endbr64 
  a4aed4:	41                   	inc    %ecx
  a4aed5:	57                   	push   %edi
  a4aed6:	49                   	dec    %ecx
  a4aed7:	89 d7                	mov    %edx,%edi
  a4aed9:	4c                   	dec    %esp
  a4aeda:	63 d1                	arpl   %dx,%cx
  a4aedc:	49                   	dec    %ecx
  a4aedd:	63 c8                	arpl   %cx,%ax
  a4aedf:	41                   	inc    %ecx
  a4aee0:	56                   	push   %esi
  a4aee1:	4d                   	dec    %ebp
  a4aee2:	89 f9                	mov    %edi,%ecx
  a4aee4:	4c                   	dec    %esp
  a4aee5:	89 d0                	mov    %edx,%eax
  a4aee7:	4c                   	dec    %esp
  a4aee8:	01 f9                	add    %edi,%ecx
  a4aeea:	41                   	inc    %ecx
  a4aeeb:	55                   	push   %ebp
  a4aeec:	49                   	dec    %ecx
  a4aeed:	01 f2                	add    %esi,%edx
  a4aeef:	41                   	inc    %ecx
  a4aef0:	54                   	push   %esp
  a4aef1:	55                   	push   %ebp
  a4aef2:	53                   	push   %ebx
  a4aef3:	48                   	dec    %eax
  a4aef4:	89 f3                	mov    %esi,%ebx
  a4aef6:	48                   	dec    %eax
  a4aef7:	83 ec 48             	sub    $0x48,%esp
  a4aefa:	4c                   	dec    %esp
  a4aefb:	8b 5f 18             	mov    0x18(%edi),%ebx
  a4aefe:	4c                   	dec    %esp
  a4aeff:	8b 6f 10             	mov    0x10(%edi),%ebp
  a4af02:	48                   	dec    %eax
  a4af03:	89 7c 24 08          	mov    %edi,0x8(%esp)
  a4af07:	4c                   	dec    %esp
  a4af08:	89 da                	mov    %ebx,%edx
  a4af0a:	4d                   	dec    %ebp
  a4af0b:	29 d9                	sub    %ebx,%ecx
  a4af0d:	48                   	dec    %eax
  a4af0e:	f7 da                	neg    %edx
  a4af10:	4d                   	dec    %ebp
  a4af11:	39 fd                	cmp    %edi,%ebp
  a4af13:	0f 84 87 02 00 00    	je     a4b1a0 <LZ4_decompress_safe_continue+0x2d0>
  a4af19:	48                   	dec    %eax
  a4af1a:	8b 74 24 08          	mov    0x8(%esp),%esi
  a4af1e:	4c                   	dec    %esp
  a4af1f:	01 ea                	add    %ebp,%edx
  a4af21:	4c                   	dec    %esp
  a4af22:	89 fd                	mov    %edi,%ebp
  a4af24:	48                   	dec    %eax
  a4af25:	89 16                	mov    %edx,(%esi)
  a4af27:	48                   	dec    %eax
  a4af28:	8d 51 f9             	lea    -0x7(%ecx),%edx
  a4af2b:	4c                   	dec    %esp
  a4af2c:	89 5e 08             	mov    %ebx,0x8(%esi)
  a4af2f:	48                   	dec    %eax
  a4af30:	89 54 24 30          	mov    %edx,0x30(%esp)
  a4af34:	45                   	inc    %ebp
  a4af35:	85 c0                	test   %eax,%eax
  a4af37:	0f 84 98 05 00 00    	je     a4b4d5 <LZ4_decompress_safe_continue+0x605>
  a4af3d:	49                   	dec    %ecx
  a4af3e:	89 cc                	mov    %ecx,%esp
  a4af40:	4d                   	dec    %ebp
  a4af41:	89 d6                	mov    %edx,%esi
  a4af43:	4c                   	dec    %esp
  a4af44:	89 e9                	mov    %ebp,%ecx
  a4af46:	4d                   	dec    %ebp
  a4af47:	89 dd                	mov    %ebx,%ebp
  a4af49:	0f b6 3b             	movzbl (%ebx),%edi
  a4af4c:	48                   	dec    %eax
  a4af4d:	8d 73 01             	lea    0x1(%ebx),%esi
  a4af50:	89 fa                	mov    %edi,%edx
  a4af52:	c1 ef 04             	shr    $0x4,%edi
  a4af55:	89 f8                	mov    %edi,%eax
  a4af57:	83 ff 0f             	cmp    $0xf,%edi
  a4af5a:	0f 84 d8 01 00 00    	je     a4b138 <LZ4_decompress_safe_continue+0x268>
  a4af60:	48                   	dec    %eax
  a4af61:	8d 7c 05 00          	lea    0x0(%ebp,%eax,1),%edi
  a4af65:	48                   	dec    %eax
  a4af66:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
  a4af69:	4d                   	dec    %ebp
  a4af6a:	8d 54 24 f4          	lea    -0xc(%esp),%edx
  a4af6e:	49                   	dec    %ecx
  a4af6f:	39 fa                	cmp    %edi,%edx
  a4af71:	0f 82 03 05 00 00    	jb     a4b47a <LZ4_decompress_safe_continue+0x5aa>
  a4af77:	4d                   	dec    %ebp
  a4af78:	8d 46 f8             	lea    -0x8(%esi),%eax
  a4af7b:	4c                   	dec    %esp
  a4af7c:	39 c3                	cmp    %eax,%ebx
  a4af7e:	0f 87 f6 04 00 00    	ja     a4b47a <LZ4_decompress_safe_continue+0x5aa>
  a4af84:	0f 1f 40 00          	nopl   0x0(%eax)
  a4af88:	48                   	dec    %eax
  a4af89:	8b 06                	mov    (%esi),%eax
  a4af8b:	48                   	dec    %eax
  a4af8c:	83 c5 08             	add    $0x8,%ebp
  a4af8f:	48                   	dec    %eax
  a4af90:	83 c6 08             	add    $0x8,%esi
  a4af93:	48                   	dec    %eax
  a4af94:	89 45 f8             	mov    %eax,-0x8(%ebp)
  a4af97:	48                   	dec    %eax
  a4af98:	39 fd                	cmp    %edi,%ebp
  a4af9a:	72 ec                	jb     a4af88 <LZ4_decompress_safe_continue+0xb8>
  a4af9c:	0f b7 33             	movzwl (%ebx),%esi
  a4af9f:	49                   	dec    %ecx
  a4afa0:	89 fb                	mov    %edi,%ebx
  a4afa2:	48                   	dec    %eax
  a4afa3:	83 c3 02             	add    $0x2,%ebx
  a4afa6:	48                   	dec    %eax
  a4afa7:	89 f0                	mov    %esi,%eax
  a4afa9:	49                   	dec    %ecx
  a4afaa:	29 f3                	sub    %esi,%ebx
  a4afac:	49                   	dec    %ecx
  a4afad:	81 fd ff ff 00 00    	cmp    $0xffff,%ebp
  a4afb3:	77 09                	ja     a4afbe <LZ4_decompress_safe_continue+0xee>
  a4afb5:	4d                   	dec    %ebp
  a4afb6:	39 cb                	cmp    %ecx,%ebx
  a4afb8:	0f 82 3e 01 00 00    	jb     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4afbe:	89 07                	mov    %eax,(%edi)
  a4afc0:	89 d0                	mov    %edx,%eax
  a4afc2:	83 e2 0f             	and    $0xf,%edx
  a4afc5:	83 e0 0f             	and    $0xf,%eax
  a4afc8:	3c 0f                	cmp    $0xf,%al
  a4afca:	0f 84 00 01 00 00    	je     a4b0d0 <LZ4_decompress_safe_continue+0x200>
  a4afd0:	48                   	dec    %eax
  a4afd1:	83 c2 04             	add    $0x4,%edx
  a4afd4:	48                   	dec    %eax
  a4afd5:	8d 2c 17             	lea    (%edi,%edx,1),%ebp
  a4afd8:	4d                   	dec    %ebp
  a4afd9:	39 df                	cmp    %ebx,%edi
  a4afdb:	0f 86 8f 00 00 00    	jbe    a4b070 <LZ4_decompress_safe_continue+0x1a0>
  a4afe1:	49                   	dec    %ecx
  a4afe2:	8d 44 24 fb          	lea    -0x5(%esp),%eax
  a4afe6:	48                   	dec    %eax
  a4afe7:	39 c5                	cmp    %eax,%ebp
  a4afe9:	0f 87 0d 01 00 00    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4afef:	4d                   	dec    %ebp
  a4aff0:	89 fa                	mov    %edi,%edx
  a4aff2:	48                   	dec    %eax
  a4aff3:	89 ce                	mov    %ecx,%esi
  a4aff5:	4d                   	dec    %ebp
  a4aff6:	29 da                	sub    %ebx,%edx
  a4aff8:	4c                   	dec    %esp
  a4aff9:	29 d6                	sub    %edx,%esi
  a4affb:	4c                   	dec    %esp
  a4affc:	39 d2                	cmp    %edx,%edx
  a4affe:	0f 86 74 01 00 00    	jbe    a4b178 <LZ4_decompress_safe_continue+0x2a8>
  a4b004:	4c                   	dec    %esp
  a4b005:	29 d2                	sub    %edx,%edx
  a4b007:	4c                   	dec    %esp
  a4b008:	89 4c 24 28          	mov    %ecx,0x28(%esp)
  a4b00c:	48                   	dec    %eax
  a4b00d:	89 54 24 18          	mov    %edx,0x18(%esp)
  a4b011:	4c                   	dec    %esp
  a4b012:	89 d2                	mov    %edx,%edx
  a4b014:	48                   	dec    %eax
  a4b015:	89 4c 24 20          	mov    %ecx,0x20(%esp)
  a4b019:	4c                   	dec    %esp
  a4b01a:	89 54 24 10          	mov    %edx,0x10(%esp)
  a4b01e:	e8 9d 2c 00 00       	call   a4dcc0 <memcpy>
  a4b023:	4c                   	dec    %esp
  a4b024:	8b 54 24 10          	mov    0x10(%esp),%edx
  a4b028:	4c                   	dec    %esp
  a4b029:	8b 44 24 18          	mov    0x18(%esp),%eax
  a4b02d:	48                   	dec    %eax
  a4b02e:	89 c7                	mov    %eax,%edi
  a4b030:	48                   	dec    %eax
  a4b031:	8b 4c 24 20          	mov    0x20(%esp),%ecx
  a4b035:	4c                   	dec    %esp
  a4b036:	8b 4c 24 28          	mov    0x28(%esp),%ecx
  a4b03a:	4c                   	dec    %esp
  a4b03b:	01 d7                	add    %edx,%edi
  a4b03d:	48                   	dec    %eax
  a4b03e:	89 f8                	mov    %edi,%eax
  a4b040:	4c                   	dec    %esp
  a4b041:	29 f8                	sub    %edi,%eax
  a4b043:	49                   	dec    %ecx
  a4b044:	39 c0                	cmp    %eax,%eax
  a4b046:	0f 86 c4 00 00 00    	jbe    a4b110 <LZ4_decompress_safe_continue+0x240>
  a4b04c:	48                   	dec    %eax
  a4b04d:	39 fd                	cmp    %edi,%ebp
  a4b04f:	0f 86 20 05 00 00    	jbe    a4b575 <LZ4_decompress_safe_continue+0x6a5>
  a4b055:	31 c0                	xor    %eax,%eax
  a4b057:	41                   	inc    %ecx
  a4b058:	0f b6 14 07          	movzbl (%edi,%eax,1),%edx
  a4b05c:	88 14 07             	mov    %dl,(%edi,%eax,1)
  a4b05f:	48                   	dec    %eax
  a4b060:	83 c0 01             	add    $0x1,%eax
  a4b063:	4c                   	dec    %esp
  a4b064:	39 c0                	cmp    %eax,%eax
  a4b066:	75 ef                	jne    a4b057 <LZ4_decompress_safe_continue+0x187>
  a4b068:	e9 dc fe ff ff       	jmp    a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b06d:	0f 1f 00             	nopl   (%eax)
  a4b070:	48                   	dec    %eax
  a4b071:	83 fe 07             	cmp    $0x7,%esi
  a4b074:	0f 86 bc 03 00 00    	jbe    a4b436 <LZ4_decompress_safe_continue+0x566>
  a4b07a:	49                   	dec    %ecx
  a4b07b:	8b 03                	mov    (%ebx),%eax
  a4b07d:	49                   	dec    %ecx
  a4b07e:	83 c3 08             	add    $0x8,%ebx
  a4b081:	48                   	dec    %eax
  a4b082:	89 07                	mov    %eax,(%edi)
  a4b084:	49                   	dec    %ecx
  a4b085:	39 ea                	cmp    %ebp,%edx
  a4b087:	0f 82 5e 03 00 00    	jb     a4b3eb <LZ4_decompress_safe_continue+0x51b>
  a4b08d:	49                   	dec    %ecx
  a4b08e:	8b 03                	mov    (%ebx),%eax
  a4b090:	48                   	dec    %eax
  a4b091:	89 47 08             	mov    %eax,0x8(%edi)
  a4b094:	48                   	dec    %eax
  a4b095:	83 fa 10             	cmp    $0x10,%edx
  a4b098:	0f 86 ab fe ff ff    	jbe    a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b09e:	49                   	dec    %ecx
  a4b09f:	8d 43 08             	lea    0x8(%ebx),%eax
  a4b0a2:	48                   	dec    %eax
  a4b0a3:	83 c7 10             	add    $0x10,%edi
  a4b0a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4b0ad:	00 00 00 
  a4b0b0:	48                   	dec    %eax
  a4b0b1:	8b 10                	mov    (%eax),%edx
  a4b0b3:	48                   	dec    %eax
  a4b0b4:	83 c7 08             	add    $0x8,%edi
  a4b0b7:	48                   	dec    %eax
  a4b0b8:	83 c0 08             	add    $0x8,%eax
  a4b0bb:	48                   	dec    %eax
  a4b0bc:	89 57 f8             	mov    %edx,-0x8(%edi)
  a4b0bf:	48                   	dec    %eax
  a4b0c0:	39 fd                	cmp    %edi,%ebp
  a4b0c2:	77 ec                	ja     a4b0b0 <LZ4_decompress_safe_continue+0x1e0>
  a4b0c4:	e9 80 fe ff ff       	jmp    a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b0c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4b0d0:	49                   	dec    %ecx
  a4b0d1:	8d 6e fc             	lea    -0x4(%esi),%ebp
  a4b0d4:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4b0d9:	eb 14                	jmp    a4b0ef <LZ4_decompress_safe_continue+0x21f>
  a4b0db:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4b0e0:	44                   	inc    %esp
  a4b0e1:	0f b6 c0             	movzbl %al,%eax
  a4b0e4:	4c                   	dec    %esp
  a4b0e5:	01 c2                	add    %eax,%edx
  a4b0e7:	3c ff                	cmp    $0xff,%al
  a4b0e9:	0f 85 b1 02 00 00    	jne    a4b3a0 <LZ4_decompress_safe_continue+0x4d0>
  a4b0ef:	48                   	dec    %eax
  a4b0f0:	83 c3 01             	add    $0x1,%ebx
  a4b0f3:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  a4b0f7:	48                   	dec    %eax
  a4b0f8:	39 dd                	cmp    %ebx,%ebp
  a4b0fa:	75 e4                	jne    a4b0e0 <LZ4_decompress_safe_continue+0x210>
  a4b0fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4b101:	48                   	dec    %eax
  a4b102:	83 c4 48             	add    $0x48,%esp
  a4b105:	5b                   	pop    %ebx
  a4b106:	5d                   	pop    %ebp
  a4b107:	41                   	inc    %ecx
  a4b108:	5c                   	pop    %esp
  a4b109:	41                   	inc    %ecx
  a4b10a:	5d                   	pop    %ebp
  a4b10b:	41                   	inc    %ecx
  a4b10c:	5e                   	pop    %esi
  a4b10d:	41                   	inc    %ecx
  a4b10e:	5f                   	pop    %edi
  a4b10f:	c3                   	ret    
  a4b110:	4c                   	dec    %esp
  a4b111:	89 c2                	mov    %eax,%edx
  a4b113:	4c                   	dec    %esp
  a4b114:	89 fe                	mov    %edi,%esi
  a4b116:	4c                   	dec    %esp
  a4b117:	89 4c 24 18          	mov    %ecx,0x18(%esp)
  a4b11b:	48                   	dec    %eax
  a4b11c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  a4b120:	e8 9b 2b 00 00       	call   a4dcc0 <memcpy>
  a4b125:	48                   	dec    %eax
  a4b126:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  a4b12a:	4c                   	dec    %esp
  a4b12b:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  a4b12f:	e9 15 fe ff ff       	jmp    a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b134:	0f 1f 40 00          	nopl   0x0(%eax)
  a4b138:	4d                   	dec    %ebp
  a4b139:	8d 56 f1             	lea    -0xf(%esi),%edx
  a4b13c:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4b141:	eb 0b                	jmp    a4b14e <LZ4_decompress_safe_continue+0x27e>
  a4b143:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4b148:	41                   	inc    %ecx
  a4b149:	80 f8 ff             	cmp    $0xff,%al
  a4b14c:	75 10                	jne    a4b15e <LZ4_decompress_safe_continue+0x28e>
  a4b14e:	44                   	inc    %esp
  a4b14f:	0f b6 06             	movzbl (%esi),%eax
  a4b152:	48                   	dec    %eax
  a4b153:	83 c6 01             	add    $0x1,%esi
  a4b156:	4c                   	dec    %esp
  a4b157:	01 c0                	add    %eax,%eax
  a4b159:	4c                   	dec    %esp
  a4b15a:	39 d6                	cmp    %edx,%esi
  a4b15c:	72 ea                	jb     a4b148 <LZ4_decompress_safe_continue+0x278>
  a4b15e:	48                   	dec    %eax
  a4b15f:	89 ef                	mov    %ebp,%edi
  a4b161:	48                   	dec    %eax
  a4b162:	01 c7                	add    %eax,%edi
  a4b164:	72 96                	jb     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b166:	48                   	dec    %eax
  a4b167:	89 f3                	mov    %esi,%ebx
  a4b169:	48                   	dec    %eax
  a4b16a:	01 c3                	add    %eax,%ebx
  a4b16c:	0f 83 f7 fd ff ff    	jae    a4af69 <LZ4_decompress_safe_continue+0x99>
  a4b172:	eb 88                	jmp    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b174:	0f 1f 40 00          	nopl   0x0(%eax)
  a4b178:	4c                   	dec    %esp
  a4b179:	89 4c 24 18          	mov    %ecx,0x18(%esp)
  a4b17d:	48                   	dec    %eax
  a4b17e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  a4b182:	e8 d9 2a 00 00       	call   a4dc60 <memmove>
  a4b187:	48                   	dec    %eax
  a4b188:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  a4b18c:	4c                   	dec    %esp
  a4b18d:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  a4b191:	e9 b3 fd ff ff       	jmp    a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b196:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4b19d:	00 00 00 
  a4b1a0:	48                   	dec    %eax
  a4b1a1:	8b 17                	mov    (%edi),%edx
  a4b1a3:	4c                   	dec    %esp
  a4b1a4:	8b 67 08             	mov    0x8(%edi),%esp
  a4b1a7:	48                   	dec    %eax
  a4b1a8:	89 54 24 18          	mov    %edx,0x18(%esp)
  a4b1ac:	4c                   	dec    %esp
  a4b1ad:	89 ca                	mov    %ecx,%edx
  a4b1af:	4c                   	dec    %esp
  a4b1b0:	29 e2                	sub    %esp,%edx
  a4b1b2:	48                   	dec    %eax
  a4b1b3:	89 54 24 10          	mov    %edx,0x10(%esp)
  a4b1b7:	48                   	dec    %eax
  a4b1b8:	8d 51 f9             	lea    -0x7(%ecx),%edx
  a4b1bb:	48                   	dec    %eax
  a4b1bc:	89 54 24 30          	mov    %edx,0x30(%esp)
  a4b1c0:	45                   	inc    %ebp
  a4b1c1:	85 c0                	test   %eax,%eax
  a4b1c3:	0f 84 39 04 00 00    	je     a4b602 <LZ4_decompress_safe_continue+0x732>
  a4b1c9:	4c                   	dec    %esp
  a4b1ca:	89 7c 24 38          	mov    %edi,0x38(%esp)
  a4b1ce:	4c                   	dec    %esp
  a4b1cf:	89 cd                	mov    %ecx,%ebp
  a4b1d1:	49                   	dec    %ecx
  a4b1d2:	89 ce                	mov    %ecx,%esi
  a4b1d4:	4d                   	dec    %ebp
  a4b1d5:	89 d7                	mov    %edx,%edi
  a4b1d7:	0f b6 0b             	movzbl (%ebx),%ecx
  a4b1da:	48                   	dec    %eax
  a4b1db:	8d 73 01             	lea    0x1(%ebx),%esi
  a4b1de:	89 ca                	mov    %ecx,%edx
  a4b1e0:	c1 e9 04             	shr    $0x4,%ecx
  a4b1e3:	89 c8                	mov    %ecx,%eax
  a4b1e5:	83 f9 0f             	cmp    $0xf,%ecx
  a4b1e8:	0f 84 6b 01 00 00    	je     a4b359 <LZ4_decompress_safe_continue+0x489>
  a4b1ee:	49                   	dec    %ecx
  a4b1ef:	8d 7c 05 00          	lea    0x0(%ebp,%eax,1),%edi
  a4b1f3:	48                   	dec    %eax
  a4b1f4:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
  a4b1f7:	49                   	dec    %ecx
  a4b1f8:	8d 4e f4             	lea    -0xc(%esi),%ecx
  a4b1fb:	48                   	dec    %eax
  a4b1fc:	39 f9                	cmp    %edi,%ecx
  a4b1fe:	0f 82 79 03 00 00    	jb     a4b57d <LZ4_decompress_safe_continue+0x6ad>
  a4b204:	4d                   	dec    %ebp
  a4b205:	8d 47 f8             	lea    -0x8(%edi),%eax
  a4b208:	4c                   	dec    %esp
  a4b209:	39 c3                	cmp    %eax,%ebx
  a4b20b:	0f 87 6c 03 00 00    	ja     a4b57d <LZ4_decompress_safe_continue+0x6ad>
  a4b211:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4b218:	48                   	dec    %eax
  a4b219:	8b 06                	mov    (%esi),%eax
  a4b21b:	49                   	dec    %ecx
  a4b21c:	83 c5 08             	add    $0x8,%ebp
  a4b21f:	48                   	dec    %eax
  a4b220:	83 c6 08             	add    $0x8,%esi
  a4b223:	49                   	dec    %ecx
  a4b224:	89 45 f8             	mov    %eax,-0x8(%ebp)
  a4b227:	49                   	dec    %ecx
  a4b228:	39 fd                	cmp    %edi,%ebp
  a4b22a:	72 ec                	jb     a4b218 <LZ4_decompress_safe_continue+0x348>
  a4b22c:	44                   	inc    %esp
  a4b22d:	0f b7 03             	movzwl (%ebx),%eax
  a4b230:	48                   	dec    %eax
  a4b231:	89 fe                	mov    %edi,%esi
  a4b233:	48                   	dec    %eax
  a4b234:	83 c3 02             	add    $0x2,%ebx
  a4b237:	4c                   	dec    %esp
  a4b238:	89 c0                	mov    %eax,%eax
  a4b23a:	4c                   	dec    %esp
  a4b23b:	29 c6                	sub    %eax,%esi
  a4b23d:	49                   	dec    %ecx
  a4b23e:	81 fc ff ff 00 00    	cmp    $0xffff,%esp
  a4b244:	77 0b                	ja     a4b251 <LZ4_decompress_safe_continue+0x381>
  a4b246:	48                   	dec    %eax
  a4b247:	39 74 24 10          	cmp    %esi,0x10(%esp)
  a4b24b:	0f 87 ab fe ff ff    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b251:	89 07                	mov    %eax,(%edi)
  a4b253:	89 d0                	mov    %edx,%eax
  a4b255:	83 e2 0f             	and    $0xf,%edx
  a4b258:	83 e0 0f             	and    $0xf,%eax
  a4b25b:	3c 0f                	cmp    $0xf,%al
  a4b25d:	0f 84 4e 01 00 00    	je     a4b3b1 <LZ4_decompress_safe_continue+0x4e1>
  a4b263:	48                   	dec    %eax
  a4b264:	83 c2 04             	add    $0x4,%edx
  a4b267:	4c                   	dec    %esp
  a4b268:	8d 2c 17             	lea    (%edi,%edx,1),%ebp
  a4b26b:	48                   	dec    %eax
  a4b26c:	39 ee                	cmp    %ebp,%esi
  a4b26e:	0f 83 8c 00 00 00    	jae    a4b300 <LZ4_decompress_safe_continue+0x430>
  a4b274:	49                   	dec    %ecx
  a4b275:	8d 46 fb             	lea    -0x5(%esi),%eax
  a4b278:	49                   	dec    %ecx
  a4b279:	39 c5                	cmp    %eax,%ebp
  a4b27b:	0f 87 7b fe ff ff    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b281:	48                   	dec    %eax
  a4b282:	89 e9                	mov    %ebp,%ecx
  a4b284:	48                   	dec    %eax
  a4b285:	29 f1                	sub    %esi,%ecx
  a4b287:	4c                   	dec    %esp
  a4b288:	89 e6                	mov    %esp,%esi
  a4b28a:	48                   	dec    %eax
  a4b28b:	29 ce                	sub    %ecx,%esi
  a4b28d:	48                   	dec    %eax
  a4b28e:	03 74 24 18          	add    0x18(%esp),%esi
  a4b292:	48                   	dec    %eax
  a4b293:	39 ca                	cmp    %ecx,%edx
  a4b295:	0f 86 46 01 00 00    	jbe    a4b3e1 <LZ4_decompress_safe_continue+0x511>
  a4b29b:	48                   	dec    %eax
  a4b29c:	29 ca                	sub    %ecx,%edx
  a4b29e:	48                   	dec    %eax
  a4b29f:	89 4c 24 20          	mov    %ecx,0x20(%esp)
  a4b2a3:	48                   	dec    %eax
  a4b2a4:	89 54 24 28          	mov    %edx,0x28(%esp)
  a4b2a8:	48                   	dec    %eax
  a4b2a9:	89 ca                	mov    %ecx,%edx
  a4b2ab:	e8 10 2a 00 00       	call   a4dcc0 <memcpy>
  a4b2b0:	48                   	dec    %eax
  a4b2b1:	8b 4c 24 20          	mov    0x20(%esp),%ecx
  a4b2b5:	4c                   	dec    %esp
  a4b2b6:	8b 44 24 28          	mov    0x28(%esp),%eax
  a4b2ba:	48                   	dec    %eax
  a4b2bb:	89 c7                	mov    %eax,%edi
  a4b2bd:	48                   	dec    %eax
  a4b2be:	01 cf                	add    %ecx,%edi
  a4b2c0:	48                   	dec    %eax
  a4b2c1:	89 f8                	mov    %edi,%eax
  a4b2c3:	48                   	dec    %eax
  a4b2c4:	29 e8                	sub    %ebp,%eax
  a4b2c6:	49                   	dec    %ecx
  a4b2c7:	39 c0                	cmp    %eax,%eax
  a4b2c9:	76 21                	jbe    a4b2ec <LZ4_decompress_safe_continue+0x41c>
  a4b2cb:	49                   	dec    %ecx
  a4b2cc:	39 fd                	cmp    %edi,%ebp
  a4b2ce:	0f 86 47 03 00 00    	jbe    a4b61b <LZ4_decompress_safe_continue+0x74b>
  a4b2d4:	31 c0                	xor    %eax,%eax
  a4b2d6:	0f b6 54 05 00       	movzbl 0x0(%ebp,%eax,1),%edx
  a4b2db:	88 14 07             	mov    %dl,(%edi,%eax,1)
  a4b2de:	48                   	dec    %eax
  a4b2df:	83 c0 01             	add    $0x1,%eax
  a4b2e2:	49                   	dec    %ecx
  a4b2e3:	39 c0                	cmp    %eax,%eax
  a4b2e5:	75 ef                	jne    a4b2d6 <LZ4_decompress_safe_continue+0x406>
  a4b2e7:	e9 eb fe ff ff       	jmp    a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b2ec:	4c                   	dec    %esp
  a4b2ed:	89 c2                	mov    %eax,%edx
  a4b2ef:	48                   	dec    %eax
  a4b2f0:	89 ee                	mov    %ebp,%esi
  a4b2f2:	e8 c9 29 00 00       	call   a4dcc0 <memcpy>
  a4b2f7:	e9 db fe ff ff       	jmp    a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b2fc:	0f 1f 40 00          	nopl   0x0(%eax)
  a4b300:	49                   	dec    %ecx
  a4b301:	83 f8 07             	cmp    $0x7,%eax
  a4b304:	0f 86 e3 01 00 00    	jbe    a4b4ed <LZ4_decompress_safe_continue+0x61d>
  a4b30a:	48                   	dec    %eax
  a4b30b:	8b 06                	mov    (%esi),%eax
  a4b30d:	48                   	dec    %eax
  a4b30e:	83 c6 08             	add    $0x8,%esi
  a4b311:	48                   	dec    %eax
  a4b312:	89 07                	mov    %eax,(%edi)
  a4b314:	4c                   	dec    %esp
  a4b315:	39 e9                	cmp    %ebp,%ecx
  a4b317:	0f 82 10 02 00 00    	jb     a4b52d <LZ4_decompress_safe_continue+0x65d>
  a4b31d:	48                   	dec    %eax
  a4b31e:	8b 06                	mov    (%esi),%eax
  a4b320:	48                   	dec    %eax
  a4b321:	89 47 08             	mov    %eax,0x8(%edi)
  a4b324:	48                   	dec    %eax
  a4b325:	83 fa 10             	cmp    $0x10,%edx
  a4b328:	0f 86 a9 fe ff ff    	jbe    a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b32e:	48                   	dec    %eax
  a4b32f:	8d 46 08             	lea    0x8(%esi),%eax
  a4b332:	48                   	dec    %eax
  a4b333:	83 c7 10             	add    $0x10,%edi
  a4b336:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4b33d:	00 00 00 
  a4b340:	48                   	dec    %eax
  a4b341:	8b 10                	mov    (%eax),%edx
  a4b343:	48                   	dec    %eax
  a4b344:	83 c7 08             	add    $0x8,%edi
  a4b347:	48                   	dec    %eax
  a4b348:	83 c0 08             	add    $0x8,%eax
  a4b34b:	48                   	dec    %eax
  a4b34c:	89 57 f8             	mov    %edx,-0x8(%edi)
  a4b34f:	4c                   	dec    %esp
  a4b350:	39 ef                	cmp    %ebp,%edi
  a4b352:	72 ec                	jb     a4b340 <LZ4_decompress_safe_continue+0x470>
  a4b354:	e9 7e fe ff ff       	jmp    a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b359:	4d                   	dec    %ebp
  a4b35a:	8d 47 f1             	lea    -0xf(%edi),%eax
  a4b35d:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4b362:	eb 0a                	jmp    a4b36e <LZ4_decompress_safe_continue+0x49e>
  a4b364:	0f 1f 40 00          	nopl   0x0(%eax)
  a4b368:	40                   	inc    %eax
  a4b369:	80 ff ff             	cmp    $0xff,%bh
  a4b36c:	75 0f                	jne    a4b37d <LZ4_decompress_safe_continue+0x4ad>
  a4b36e:	0f b6 3e             	movzbl (%esi),%edi
  a4b371:	48                   	dec    %eax
  a4b372:	83 c6 01             	add    $0x1,%esi
  a4b375:	48                   	dec    %eax
  a4b376:	01 f8                	add    %edi,%eax
  a4b378:	4c                   	dec    %esp
  a4b379:	39 c6                	cmp    %eax,%esi
  a4b37b:	72 eb                	jb     a4b368 <LZ4_decompress_safe_continue+0x498>
  a4b37d:	4c                   	dec    %esp
  a4b37e:	89 ef                	mov    %ebp,%edi
  a4b380:	48                   	dec    %eax
  a4b381:	01 c7                	add    %eax,%edi
  a4b383:	0f 82 73 fd ff ff    	jb     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b389:	48                   	dec    %eax
  a4b38a:	89 f3                	mov    %esi,%ebx
  a4b38c:	48                   	dec    %eax
  a4b38d:	01 c3                	add    %eax,%ebx
  a4b38f:	0f 83 62 fe ff ff    	jae    a4b1f7 <LZ4_decompress_safe_continue+0x327>
  a4b395:	e9 62 fd ff ff       	jmp    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b39a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4b3a0:	48                   	dec    %eax
  a4b3a1:	89 f8                	mov    %edi,%eax
  a4b3a3:	48                   	dec    %eax
  a4b3a4:	01 d0                	add    %edx,%eax
  a4b3a6:	0f 83 24 fc ff ff    	jae    a4afd0 <LZ4_decompress_safe_continue+0x100>
  a4b3ac:	e9 4b fd ff ff       	jmp    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b3b1:	4d                   	dec    %ebp
  a4b3b2:	8d 5f fc             	lea    -0x4(%edi),%ebx
  a4b3b5:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4b3ba:	eb 13                	jmp    a4b3cf <LZ4_decompress_safe_continue+0x4ff>
  a4b3bc:	0f 1f 40 00          	nopl   0x0(%eax)
  a4b3c0:	44                   	inc    %esp
  a4b3c1:	0f b6 c8             	movzbl %al,%ecx
  a4b3c4:	4c                   	dec    %esp
  a4b3c5:	01 ca                	add    %ecx,%edx
  a4b3c7:	3c ff                	cmp    $0xff,%al
  a4b3c9:	0f 85 f5 00 00 00    	jne    a4b4c4 <LZ4_decompress_safe_continue+0x5f4>
  a4b3cf:	48                   	dec    %eax
  a4b3d0:	83 c3 01             	add    $0x1,%ebx
  a4b3d3:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  a4b3d7:	4c                   	dec    %esp
  a4b3d8:	39 db                	cmp    %ebx,%ebx
  a4b3da:	75 e4                	jne    a4b3c0 <LZ4_decompress_safe_continue+0x4f0>
  a4b3dc:	e9 1b fd ff ff       	jmp    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b3e1:	e8 7a 28 00 00       	call   a4dc60 <memmove>
  a4b3e6:	e9 ec fd ff ff       	jmp    a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b3eb:	49                   	dec    %ecx
  a4b3ec:	8d 44 24 fb          	lea    -0x5(%esp),%eax
  a4b3f0:	48                   	dec    %eax
  a4b3f1:	39 c5                	cmp    %eax,%ebp
  a4b3f3:	0f 87 03 fd ff ff    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b3f9:	48                   	dec    %eax
  a4b3fa:	83 c7 08             	add    $0x8,%edi
  a4b3fd:	48                   	dec    %eax
  a4b3fe:	3b 7c 24 30          	cmp    0x30(%esp),%edi
  a4b402:	0f 82 bf 01 00 00    	jb     a4b5c7 <LZ4_decompress_safe_continue+0x6f7>
  a4b408:	48                   	dec    %eax
  a4b409:	89 ee                	mov    %ebp,%esi
  a4b40b:	31 c0                	xor    %eax,%eax
  a4b40d:	48                   	dec    %eax
  a4b40e:	29 fe                	sub    %edi,%esi
  a4b410:	48                   	dec    %eax
  a4b411:	39 fd                	cmp    %edi,%ebp
  a4b413:	0f 86 30 fb ff ff    	jbe    a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b419:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4b420:	41                   	inc    %ecx
  a4b421:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  a4b425:	88 14 07             	mov    %dl,(%edi,%eax,1)
  a4b428:	48                   	dec    %eax
  a4b429:	83 c0 01             	add    $0x1,%eax
  a4b42c:	48                   	dec    %eax
  a4b42d:	39 c6                	cmp    %eax,%esi
  a4b42f:	75 ef                	jne    a4b420 <LZ4_decompress_safe_continue+0x550>
  a4b431:	e9 13 fb ff ff       	jmp    a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b436:	41                   	inc    %ecx
  a4b437:	0f b6 03             	movzbl (%ebx),%eax
  a4b43a:	88 07                	mov    %al,(%edi)
  a4b43c:	41                   	inc    %ecx
  a4b43d:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
  a4b441:	88 47 01             	mov    %al,0x1(%edi)
  a4b444:	41                   	inc    %ecx
  a4b445:	0f b6 43 02          	movzbl 0x2(%ebx),%eax
  a4b449:	88 47 02             	mov    %al,0x2(%edi)
  a4b44c:	41                   	inc    %ecx
  a4b44d:	0f b6 43 03          	movzbl 0x3(%ebx),%eax
  a4b451:	88 47 03             	mov    %al,0x3(%edi)
  a4b454:	48                   	dec    %eax
  a4b455:	8d 05 45 8b 00 00    	lea    0x8b45,%eax
  a4b45b:	8b 04 b0             	mov    (%eax,%esi,4),%eax
  a4b45e:	49                   	dec    %ecx
  a4b45f:	01 c3                	add    %eax,%ebx
  a4b461:	41                   	inc    %ecx
  a4b462:	8b 03                	mov    (%ebx),%eax
  a4b464:	89 47 04             	mov    %eax,0x4(%edi)
  a4b467:	48                   	dec    %eax
  a4b468:	8d 05 52 8b 00 00    	lea    0x8b52,%eax
  a4b46e:	48                   	dec    %eax
  a4b46f:	63 04 b0             	arpl   %ax,(%eax,%esi,4)
  a4b472:	49                   	dec    %ecx
  a4b473:	29 c3                	sub    %eax,%ebx
  a4b475:	e9 0a fc ff ff       	jmp    a4b084 <LZ4_decompress_safe_continue+0x1b4>
  a4b47a:	4c                   	dec    %esp
  a4b47b:	89 e1                	mov    %esp,%ecx
  a4b47d:	48                   	dec    %eax
  a4b47e:	89 c2                	mov    %eax,%edx
  a4b480:	49                   	dec    %ecx
  a4b481:	89 fc                	mov    %edi,%esp
  a4b483:	48                   	dec    %eax
  a4b484:	39 cf                	cmp    %ecx,%edi
  a4b486:	0f 87 70 fc ff ff    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b48c:	4c                   	dec    %esp
  a4b48d:	39 f3                	cmp    %esi,%ebx
  a4b48f:	0f 85 67 fc ff ff    	jne    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b495:	48                   	dec    %eax
  a4b496:	89 ef                	mov    %ebp,%edi
  a4b498:	4d                   	dec    %ebp
  a4b499:	29 fc                	sub    %edi,%esp
  a4b49b:	e8 20 28 00 00       	call   a4dcc0 <memcpy>
  a4b4a0:	44                   	inc    %esp
  a4b4a1:	89 e0                	mov    %esp,%eax
  a4b4a3:	45                   	inc    %ebp
  a4b4a4:	85 e4                	test   %esp,%esp
  a4b4a6:	0f 8e 55 fc ff ff    	jle    a4b101 <LZ4_decompress_safe_continue+0x231>
  a4b4ac:	48                   	dec    %eax
  a4b4ad:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  a4b4b1:	4d                   	dec    %ebp
  a4b4b2:	63 e4                	arpl   %sp,%sp
  a4b4b4:	4c                   	dec    %esp
  a4b4b5:	89 61 18             	mov    %esp,0x18(%ecx)
  a4b4b8:	4d                   	dec    %ebp
  a4b4b9:	01 fc                	add    %edi,%esp
  a4b4bb:	4c                   	dec    %esp
  a4b4bc:	89 61 10             	mov    %esp,0x10(%ecx)
  a4b4bf:	e9 3d fc ff ff       	jmp    a4b101 <LZ4_decompress_safe_continue+0x231>
  a4b4c4:	48                   	dec    %eax
  a4b4c5:	89 f8                	mov    %edi,%eax
  a4b4c7:	48                   	dec    %eax
  a4b4c8:	01 d0                	add    %edx,%eax
  a4b4ca:	0f 83 93 fd ff ff    	jae    a4b263 <LZ4_decompress_safe_continue+0x393>
  a4b4d0:	e9 27 fc ff ff       	jmp    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b4d5:	83 f8 01             	cmp    $0x1,%eax
  a4b4d8:	0f 85 1e fc ff ff    	jne    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b4de:	31 c0                	xor    %eax,%eax
  a4b4e0:	80 3b 00             	cmpb   $0x0,(%ebx)
  a4b4e3:	0f 95 c0             	setne  %al
  a4b4e6:	f7 d8                	neg    %eax
  a4b4e8:	e9 14 fc ff ff       	jmp    a4b101 <LZ4_decompress_safe_continue+0x231>
  a4b4ed:	0f b6 06             	movzbl (%esi),%eax
  a4b4f0:	88 07                	mov    %al,(%edi)
  a4b4f2:	0f b6 46 01          	movzbl 0x1(%esi),%eax
  a4b4f6:	88 47 01             	mov    %al,0x1(%edi)
  a4b4f9:	0f b6 46 02          	movzbl 0x2(%esi),%eax
  a4b4fd:	88 47 02             	mov    %al,0x2(%edi)
  a4b500:	0f b6 46 03          	movzbl 0x3(%esi),%eax
  a4b504:	88 47 03             	mov    %al,0x3(%edi)
  a4b507:	48                   	dec    %eax
  a4b508:	8d 05 92 8a 00 00    	lea    0x8a92,%eax
  a4b50e:	42                   	inc    %edx
  a4b50f:	8b 04 80             	mov    (%eax,%eax,4),%eax
  a4b512:	48                   	dec    %eax
  a4b513:	01 c6                	add    %eax,%esi
  a4b515:	8b 06                	mov    (%esi),%eax
  a4b517:	89 47 04             	mov    %eax,0x4(%edi)
  a4b51a:	48                   	dec    %eax
  a4b51b:	8d 05 9f 8a 00 00    	lea    0x8a9f,%eax
  a4b521:	4a                   	dec    %edx
  a4b522:	63 04 80             	arpl   %ax,(%eax,%eax,4)
  a4b525:	48                   	dec    %eax
  a4b526:	29 c6                	sub    %eax,%esi
  a4b528:	e9 e7 fd ff ff       	jmp    a4b314 <LZ4_decompress_safe_continue+0x444>
  a4b52d:	49                   	dec    %ecx
  a4b52e:	8d 46 fb             	lea    -0x5(%esi),%eax
  a4b531:	49                   	dec    %ecx
  a4b532:	39 c5                	cmp    %eax,%ebp
  a4b534:	0f 87 c2 fb ff ff    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b53a:	48                   	dec    %eax
  a4b53b:	83 c7 08             	add    $0x8,%edi
  a4b53e:	48                   	dec    %eax
  a4b53f:	3b 7c 24 30          	cmp    0x30(%esp),%edi
  a4b543:	0f 82 da 00 00 00    	jb     a4b623 <LZ4_decompress_safe_continue+0x753>
  a4b549:	4c                   	dec    %esp
  a4b54a:	89 e9                	mov    %ebp,%ecx
  a4b54c:	31 c0                	xor    %eax,%eax
  a4b54e:	48                   	dec    %eax
  a4b54f:	29 f9                	sub    %edi,%ecx
  a4b551:	4c                   	dec    %esp
  a4b552:	39 ef                	cmp    %ebp,%edi
  a4b554:	0f 83 7d fc ff ff    	jae    a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b55a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4b560:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
  a4b564:	88 14 07             	mov    %dl,(%edi,%eax,1)
  a4b567:	48                   	dec    %eax
  a4b568:	83 c0 01             	add    $0x1,%eax
  a4b56b:	48                   	dec    %eax
  a4b56c:	39 c1                	cmp    %eax,%ecx
  a4b56e:	75 f0                	jne    a4b560 <LZ4_decompress_safe_continue+0x690>
  a4b570:	e9 62 fc ff ff       	jmp    a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b575:	48                   	dec    %eax
  a4b576:	89 fd                	mov    %edi,%ebp
  a4b578:	e9 cc f9 ff ff       	jmp    a4af49 <LZ4_decompress_safe_continue+0x79>
  a4b57d:	4d                   	dec    %ebp
  a4b57e:	89 fa                	mov    %edi,%edx
  a4b580:	48                   	dec    %eax
  a4b581:	89 c2                	mov    %eax,%edx
  a4b583:	4c                   	dec    %esp
  a4b584:	8b 7c 24 38          	mov    0x38(%esp),%edi
  a4b588:	48                   	dec    %eax
  a4b589:	89 fd                	mov    %edi,%ebp
  a4b58b:	4c                   	dec    %esp
  a4b58c:	39 f7                	cmp    %esi,%edi
  a4b58e:	0f 87 68 fb ff ff    	ja     a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b594:	49                   	dec    %ecx
  a4b595:	39 da                	cmp    %ebx,%edx
  a4b597:	0f 85 5f fb ff ff    	jne    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b59d:	4c                   	dec    %esp
  a4b59e:	89 ef                	mov    %ebp,%edi
  a4b5a0:	4c                   	dec    %esp
  a4b5a1:	29 fd                	sub    %edi,%ebp
  a4b5a3:	e8 18 27 00 00       	call   a4dcc0 <memcpy>
  a4b5a8:	89 e8                	mov    %ebp,%eax
  a4b5aa:	85 ed                	test   %ebp,%ebp
  a4b5ac:	0f 8e 4f fb ff ff    	jle    a4b101 <LZ4_decompress_safe_continue+0x231>
  a4b5b2:	48                   	dec    %eax
  a4b5b3:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  a4b5b7:	48                   	dec    %eax
  a4b5b8:	63 ed                	arpl   %bp,%bp
  a4b5ba:	48                   	dec    %eax
  a4b5bb:	01 69 18             	add    %ebp,0x18(%ecx)
  a4b5be:	48                   	dec    %eax
  a4b5bf:	01 69 10             	add    %ebp,0x10(%ecx)
  a4b5c2:	e9 3a fb ff ff       	jmp    a4b101 <LZ4_decompress_safe_continue+0x231>
  a4b5c7:	4c                   	dec    %esp
  a4b5c8:	8b 44 24 30          	mov    0x30(%esp),%eax
  a4b5cc:	4c                   	dec    %esp
  a4b5cd:	89 da                	mov    %ebx,%edx
  a4b5cf:	48                   	dec    %eax
  a4b5d0:	89 f8                	mov    %edi,%eax
  a4b5d2:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4b5d8:	48                   	dec    %eax
  a4b5d9:	8b 32                	mov    (%edx),%esi
  a4b5db:	48                   	dec    %eax
  a4b5dc:	83 c0 08             	add    $0x8,%eax
  a4b5df:	48                   	dec    %eax
  a4b5e0:	83 c2 08             	add    $0x8,%edx
  a4b5e3:	48                   	dec    %eax
  a4b5e4:	89 70 f8             	mov    %esi,-0x8(%eax)
  a4b5e7:	49                   	dec    %ecx
  a4b5e8:	39 c0                	cmp    %eax,%eax
  a4b5ea:	77 ec                	ja     a4b5d8 <LZ4_decompress_safe_continue+0x708>
  a4b5ec:	48                   	dec    %eax
  a4b5ed:	8b 54 24 30          	mov    0x30(%esp),%edx
  a4b5f1:	48                   	dec    %eax
  a4b5f2:	89 d0                	mov    %edx,%eax
  a4b5f4:	48                   	dec    %eax
  a4b5f5:	29 f8                	sub    %edi,%eax
  a4b5f7:	48                   	dec    %eax
  a4b5f8:	89 d7                	mov    %edx,%edi
  a4b5fa:	49                   	dec    %ecx
  a4b5fb:	01 c3                	add    %eax,%ebx
  a4b5fd:	e9 06 fe ff ff       	jmp    a4b408 <LZ4_decompress_safe_continue+0x538>
  a4b602:	83 f8 01             	cmp    $0x1,%eax
  a4b605:	0f 85 f1 fa ff ff    	jne    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b60b:	31 c0                	xor    %eax,%eax
  a4b60d:	80 3e 00             	cmpb   $0x0,(%esi)
  a4b610:	0f 84 eb fa ff ff    	je     a4b101 <LZ4_decompress_safe_continue+0x231>
  a4b616:	e9 e1 fa ff ff       	jmp    a4b0fc <LZ4_decompress_safe_continue+0x22c>
  a4b61b:	49                   	dec    %ecx
  a4b61c:	89 fd                	mov    %edi,%ebp
  a4b61e:	e9 b4 fb ff ff       	jmp    a4b1d7 <LZ4_decompress_safe_continue+0x307>
  a4b623:	4c                   	dec    %esp
  a4b624:	8b 44 24 30          	mov    0x30(%esp),%eax
  a4b628:	48                   	dec    %eax
  a4b629:	89 f2                	mov    %esi,%edx
  a4b62b:	48                   	dec    %eax
  a4b62c:	89 f8                	mov    %edi,%eax
  a4b62e:	48                   	dec    %eax
  a4b62f:	8b 0a                	mov    (%edx),%ecx
  a4b631:	48                   	dec    %eax
  a4b632:	83 c0 08             	add    $0x8,%eax
  a4b635:	48                   	dec    %eax
  a4b636:	83 c2 08             	add    $0x8,%edx
  a4b639:	48                   	dec    %eax
  a4b63a:	89 48 f8             	mov    %ecx,-0x8(%eax)
  a4b63d:	49                   	dec    %ecx
  a4b63e:	39 c0                	cmp    %eax,%eax
  a4b640:	77 ec                	ja     a4b62e <LZ4_decompress_safe_continue+0x75e>
  a4b642:	48                   	dec    %eax
  a4b643:	8b 4c 24 30          	mov    0x30(%esp),%ecx
  a4b647:	48                   	dec    %eax
  a4b648:	89 c8                	mov    %ecx,%eax
  a4b64a:	48                   	dec    %eax
  a4b64b:	29 f8                	sub    %edi,%eax
  a4b64d:	48                   	dec    %eax
  a4b64e:	89 cf                	mov    %ecx,%edi
  a4b650:	48                   	dec    %eax
  a4b651:	01 c6                	add    %eax,%esi
  a4b653:	e9 f1 fe ff ff       	jmp    a4b549 <LZ4_decompress_safe_continue+0x679>
  a4b658:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4b65f:	00 

0000000000a4b660 <LZ4_decompress_fast_continue>:
  a4b660:	f3 0f 1e fa          	endbr64 
  a4b664:	41                   	inc    %ecx
  a4b665:	57                   	push   %edi
  a4b666:	41                   	inc    %ecx
  a4b667:	56                   	push   %esi
  a4b668:	41                   	inc    %ecx
  a4b669:	55                   	push   %ebp
  a4b66a:	41                   	inc    %ecx
  a4b66b:	54                   	push   %esp
  a4b66c:	49                   	dec    %ecx
  a4b66d:	89 d4                	mov    %edx,%esp
  a4b66f:	55                   	push   %ebp
  a4b670:	53                   	push   %ebx
  a4b671:	48                   	dec    %eax
  a4b672:	63 d9                	arpl   %bx,%cx
  a4b674:	48                   	dec    %eax
  a4b675:	89 d8                	mov    %ebx,%eax
  a4b677:	48                   	dec    %eax
  a4b678:	83 ec 48             	sub    $0x48,%esp
  a4b67b:	48                   	dec    %eax
  a4b67c:	8b 57 18             	mov    0x18(%edi),%edx
  a4b67f:	4c                   	dec    %esp
  a4b680:	8b 6f 10             	mov    0x10(%edi),%ebp
  a4b683:	48                   	dec    %eax
  a4b684:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  a4b688:	4c                   	dec    %esp
  a4b689:	01 e3                	add    %esp,%ebx
  a4b68b:	48                   	dec    %eax
  a4b68c:	89 d1                	mov    %edx,%ecx
  a4b68e:	48                   	dec    %eax
  a4b68f:	89 7c 24 18          	mov    %edi,0x18(%esp)
  a4b693:	48                   	dec    %eax
  a4b694:	89 74 24 20          	mov    %esi,0x20(%esp)
  a4b698:	48                   	dec    %eax
  a4b699:	f7 d9                	neg    %ecx
  a4b69b:	4d                   	dec    %ebp
  a4b69c:	39 e5                	cmp    %esp,%ebp
  a4b69e:	0f 84 fa 02 00 00    	je     a4b99e <LZ4_decompress_fast_continue+0x33e>
  a4b6a4:	48                   	dec    %eax
  a4b6a5:	8b 74 24 18          	mov    0x18(%esp),%esi
  a4b6a9:	4c                   	dec    %esp
  a4b6aa:	01 e9                	add    %ebp,%ecx
  a4b6ac:	48                   	dec    %eax
  a4b6ad:	89 56 08             	mov    %edx,0x8(%esi)
  a4b6b0:	48                   	dec    %eax
  a4b6b1:	89 0e                	mov    %ecx,(%esi)
  a4b6b3:	85 c0                	test   %eax,%eax
  a4b6b5:	0f 84 2f 02 00 00    	je     a4b8ea <LZ4_decompress_fast_continue+0x28a>
  a4b6bb:	48                   	dec    %eax
  a4b6bc:	8d 43 f9             	lea    -0x7(%ebx),%eax
  a4b6bf:	4c                   	dec    %esp
  a4b6c0:	8b 74 24 20          	mov    0x20(%esp),%esi
  a4b6c4:	48                   	dec    %eax
  a4b6c5:	8d 6b f8             	lea    -0x8(%ebx),%ebp
  a4b6c8:	4d                   	dec    %ebp
  a4b6c9:	89 e7                	mov    %esp,%edi
  a4b6cb:	48                   	dec    %eax
  a4b6cc:	89 44 24 28          	mov    %eax,0x28(%esp)
  a4b6d0:	41                   	inc    %ecx
  a4b6d1:	0f b6 06             	movzbl (%esi),%eax
  a4b6d4:	49                   	dec    %ecx
  a4b6d5:	8d 4e 01             	lea    0x1(%esi),%ecx
  a4b6d8:	89 c2                	mov    %eax,%edx
  a4b6da:	c1 e8 04             	shr    $0x4,%eax
  a4b6dd:	41                   	inc    %ecx
  a4b6de:	89 c6                	mov    %eax,%esi
  a4b6e0:	83 f8 0f             	cmp    $0xf,%eax
  a4b6e3:	0f 84 47 01 00 00    	je     a4b830 <LZ4_decompress_fast_continue+0x1d0>
  a4b6e9:	4b                   	dec    %ebx
  a4b6ea:	8d 3c 37             	lea    (%edi,%esi,1),%edi
  a4b6ed:	48                   	dec    %eax
  a4b6ee:	39 ef                	cmp    %ebp,%edi
  a4b6f0:	0f 87 67 01 00 00    	ja     a4b85d <LZ4_decompress_fast_continue+0x1fd>
  a4b6f6:	48                   	dec    %eax
  a4b6f7:	89 c8                	mov    %ecx,%eax
  a4b6f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4b700:	48                   	dec    %eax
  a4b701:	8b 30                	mov    (%eax),%esi
  a4b703:	49                   	dec    %ecx
  a4b704:	83 c7 08             	add    $0x8,%edi
  a4b707:	48                   	dec    %eax
  a4b708:	83 c0 08             	add    $0x8,%eax
  a4b70b:	49                   	dec    %ecx
  a4b70c:	89 77 f8             	mov    %esi,-0x8(%edi)
  a4b70f:	4c                   	dec    %esp
  a4b710:	39 ff                	cmp    %edi,%edi
  a4b712:	77 ec                	ja     a4b700 <LZ4_decompress_fast_continue+0xa0>
  a4b714:	49                   	dec    %ecx
  a4b715:	01 ce                	add    %ecx,%esi
  a4b717:	89 d0                	mov    %edx,%eax
  a4b719:	49                   	dec    %ecx
  a4b71a:	89 f8                	mov    %edi,%eax
  a4b71c:	83 e2 0f             	and    $0xf,%edx
  a4b71f:	41                   	inc    %ecx
  a4b720:	0f b7 36             	movzwl (%esi),%esi
  a4b723:	83 e0 0f             	and    $0xf,%eax
  a4b726:	49                   	dec    %ecx
  a4b727:	83 c6 02             	add    $0x2,%esi
  a4b72a:	89 37                	mov    %esi,(%edi)
  a4b72c:	49                   	dec    %ecx
  a4b72d:	29 f0                	sub    %esi,%eax
  a4b72f:	3c 0f                	cmp    $0xf,%al
  a4b731:	0f 84 89 01 00 00    	je     a4b8c0 <LZ4_decompress_fast_continue+0x260>
  a4b737:	48                   	dec    %eax
  a4b738:	83 c2 04             	add    $0x4,%edx
  a4b73b:	4c                   	dec    %esp
  a4b73c:	8d 3c 17             	lea    (%edi,%edx,1),%edi
  a4b73f:	4d                   	dec    %ebp
  a4b740:	39 c4                	cmp    %eax,%esp
  a4b742:	76 7c                	jbe    a4b7c0 <LZ4_decompress_fast_continue+0x160>
  a4b744:	48                   	dec    %eax
  a4b745:	8d 43 fb             	lea    -0x5(%ebx),%eax
  a4b748:	49                   	dec    %ecx
  a4b749:	39 c7                	cmp    %eax,%edi
  a4b74b:	0f 87 a7 01 00 00    	ja     a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4b751:	4c                   	dec    %esp
  a4b752:	89 e1                	mov    %esp,%ecx
  a4b754:	4c                   	dec    %esp
  a4b755:	89 ee                	mov    %ebp,%esi
  a4b757:	4c                   	dec    %esp
  a4b758:	29 c1                	sub    %eax,%ecx
  a4b75a:	48                   	dec    %eax
  a4b75b:	29 ce                	sub    %ecx,%esi
  a4b75d:	48                   	dec    %eax
  a4b75e:	39 ca                	cmp    %ecx,%edx
  a4b760:	0f 86 7a 01 00 00    	jbe    a4b8e0 <LZ4_decompress_fast_continue+0x280>
  a4b766:	48                   	dec    %eax
  a4b767:	29 ca                	sub    %ecx,%edx
  a4b769:	48                   	dec    %eax
  a4b76a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  a4b76e:	48                   	dec    %eax
  a4b76f:	89 54 24 10          	mov    %edx,0x10(%esp)
  a4b773:	48                   	dec    %eax
  a4b774:	89 ca                	mov    %ecx,%edx
  a4b776:	e8 45 25 00 00       	call   a4dcc0 <memcpy>
  a4b77b:	48                   	dec    %eax
  a4b77c:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  a4b780:	4c                   	dec    %esp
  a4b781:	8b 44 24 10          	mov    0x10(%esp),%eax
  a4b785:	48                   	dec    %eax
  a4b786:	89 c7                	mov    %eax,%edi
  a4b788:	48                   	dec    %eax
  a4b789:	01 cf                	add    %ecx,%edi
  a4b78b:	48                   	dec    %eax
  a4b78c:	89 f8                	mov    %edi,%eax
  a4b78e:	4c                   	dec    %esp
  a4b78f:	29 e0                	sub    %esp,%eax
  a4b791:	49                   	dec    %ecx
  a4b792:	39 c0                	cmp    %eax,%eax
  a4b794:	0f 86 86 00 00 00    	jbe    a4b820 <LZ4_decompress_fast_continue+0x1c0>
  a4b79a:	49                   	dec    %ecx
  a4b79b:	39 ff                	cmp    %edi,%edi
  a4b79d:	0f 86 97 04 00 00    	jbe    a4bc3a <LZ4_decompress_fast_continue+0x5da>
  a4b7a3:	31 c0                	xor    %eax,%eax
  a4b7a5:	41                   	inc    %ecx
  a4b7a6:	0f b6 14 04          	movzbl (%esp,%eax,1),%edx
  a4b7aa:	88 14 07             	mov    %dl,(%edi,%eax,1)
  a4b7ad:	48                   	dec    %eax
  a4b7ae:	83 c0 01             	add    $0x1,%eax
  a4b7b1:	49                   	dec    %ecx
  a4b7b2:	39 c0                	cmp    %eax,%eax
  a4b7b4:	75 ef                	jne    a4b7a5 <LZ4_decompress_fast_continue+0x145>
  a4b7b6:	e9 15 ff ff ff       	jmp    a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b7bb:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4b7c0:	48                   	dec    %eax
  a4b7c1:	83 fe 07             	cmp    $0x7,%esi
  a4b7c4:	0f 86 42 01 00 00    	jbe    a4b90c <LZ4_decompress_fast_continue+0x2ac>
  a4b7ca:	49                   	dec    %ecx
  a4b7cb:	8b 00                	mov    (%eax),%eax
  a4b7cd:	49                   	dec    %ecx
  a4b7ce:	83 c0 08             	add    $0x8,%eax
  a4b7d1:	48                   	dec    %eax
  a4b7d2:	89 07                	mov    %eax,(%edi)
  a4b7d4:	48                   	dec    %eax
  a4b7d5:	8d 43 f4             	lea    -0xc(%ebx),%eax
  a4b7d8:	49                   	dec    %ecx
  a4b7d9:	39 c7                	cmp    %eax,%edi
  a4b7db:	0f 87 77 01 00 00    	ja     a4b958 <LZ4_decompress_fast_continue+0x2f8>
  a4b7e1:	49                   	dec    %ecx
  a4b7e2:	8b 00                	mov    (%eax),%eax
  a4b7e4:	48                   	dec    %eax
  a4b7e5:	89 47 08             	mov    %eax,0x8(%edi)
  a4b7e8:	48                   	dec    %eax
  a4b7e9:	83 fa 10             	cmp    $0x10,%edx
  a4b7ec:	0f 86 de fe ff ff    	jbe    a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b7f2:	49                   	dec    %ecx
  a4b7f3:	8d 40 08             	lea    0x8(%eax),%eax
  a4b7f6:	48                   	dec    %eax
  a4b7f7:	83 c7 10             	add    $0x10,%edi
  a4b7fa:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4b800:	48                   	dec    %eax
  a4b801:	8b 10                	mov    (%eax),%edx
  a4b803:	48                   	dec    %eax
  a4b804:	83 c7 08             	add    $0x8,%edi
  a4b807:	48                   	dec    %eax
  a4b808:	83 c0 08             	add    $0x8,%eax
  a4b80b:	48                   	dec    %eax
  a4b80c:	89 57 f8             	mov    %edx,-0x8(%edi)
  a4b80f:	4c                   	dec    %esp
  a4b810:	39 ff                	cmp    %edi,%edi
  a4b812:	72 ec                	jb     a4b800 <LZ4_decompress_fast_continue+0x1a0>
  a4b814:	e9 b7 fe ff ff       	jmp    a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b819:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4b820:	4c                   	dec    %esp
  a4b821:	89 c2                	mov    %eax,%edx
  a4b823:	4c                   	dec    %esp
  a4b824:	89 e6                	mov    %esp,%esi
  a4b826:	e8 95 24 00 00       	call   a4dcc0 <memcpy>
  a4b82b:	e9 a0 fe ff ff       	jmp    a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b830:	41                   	inc    %ecx
  a4b831:	be 0f 00 00 00       	mov    $0xf,%esi
  a4b836:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4b83d:	00 00 00 
  a4b840:	0f b6 31             	movzbl (%ecx),%esi
  a4b843:	48                   	dec    %eax
  a4b844:	83 c1 01             	add    $0x1,%ecx
  a4b847:	49                   	dec    %ecx
  a4b848:	01 f6                	add    %esi,%esi
  a4b84a:	40                   	inc    %eax
  a4b84b:	80 fe ff             	cmp    $0xff,%dh
  a4b84e:	74 f0                	je     a4b840 <LZ4_decompress_fast_continue+0x1e0>
  a4b850:	4b                   	dec    %ebx
  a4b851:	8d 3c 37             	lea    (%edi,%esi,1),%edi
  a4b854:	48                   	dec    %eax
  a4b855:	39 ef                	cmp    %ebp,%edi
  a4b857:	0f 86 99 fe ff ff    	jbe    a4b6f6 <LZ4_decompress_fast_continue+0x96>
  a4b85d:	4c                   	dec    %esp
  a4b85e:	89 f2                	mov    %esi,%edx
  a4b860:	48                   	dec    %eax
  a4b861:	39 df                	cmp    %ebx,%edi
  a4b863:	0f 85 8f 00 00 00    	jne    a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4b869:	48                   	dec    %eax
  a4b86a:	89 ce                	mov    %ecx,%esi
  a4b86c:	4c                   	dec    %esp
  a4b86d:	89 ff                	mov    %edi,%edi
  a4b86f:	48                   	dec    %eax
  a4b870:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  a4b874:	4c                   	dec    %esp
  a4b875:	89 74 24 10          	mov    %esi,0x10(%esp)
  a4b879:	e8 42 24 00 00       	call   a4dcc0 <memcpy>
  a4b87e:	48                   	dec    %eax
  a4b87f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  a4b883:	48                   	dec    %eax
  a4b884:	8b 54 24 10          	mov    0x10(%esp),%edx
  a4b888:	48                   	dec    %eax
  a4b889:	01 ca                	add    %ecx,%edx
  a4b88b:	48                   	dec    %eax
  a4b88c:	2b 54 24 20          	sub    0x20(%esp),%edx
  a4b890:	89 d0                	mov    %edx,%eax
  a4b892:	85 d2                	test   %edx,%edx
  a4b894:	7e 67                	jle    a4b8fd <LZ4_decompress_fast_continue+0x29d>
  a4b896:	48                   	dec    %eax
  a4b897:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  a4b89b:	48                   	dec    %eax
  a4b89c:	8b 74 24 30          	mov    0x30(%esp),%esi
  a4b8a0:	48                   	dec    %eax
  a4b8a1:	89 71 18             	mov    %esi,0x18(%ecx)
  a4b8a4:	48                   	dec    %eax
  a4b8a5:	89 59 10             	mov    %ebx,0x10(%ecx)
  a4b8a8:	48                   	dec    %eax
  a4b8a9:	83 c4 48             	add    $0x48,%esp
  a4b8ac:	5b                   	pop    %ebx
  a4b8ad:	5d                   	pop    %ebp
  a4b8ae:	41                   	inc    %ecx
  a4b8af:	5c                   	pop    %esp
  a4b8b0:	41                   	inc    %ecx
  a4b8b1:	5d                   	pop    %ebp
  a4b8b2:	41                   	inc    %ecx
  a4b8b3:	5e                   	pop    %esi
  a4b8b4:	41                   	inc    %ecx
  a4b8b5:	5f                   	pop    %edi
  a4b8b6:	c3                   	ret    
  a4b8b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4b8be:	00 00 
  a4b8c0:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4b8c5:	0f 1f 00             	nopl   (%eax)
  a4b8c8:	41                   	inc    %ecx
  a4b8c9:	0f b6 0e             	movzbl (%esi),%ecx
  a4b8cc:	49                   	dec    %ecx
  a4b8cd:	83 c6 01             	add    $0x1,%esi
  a4b8d0:	48                   	dec    %eax
  a4b8d1:	01 ca                	add    %ecx,%edx
  a4b8d3:	80 f9 ff             	cmp    $0xff,%cl
  a4b8d6:	74 f0                	je     a4b8c8 <LZ4_decompress_fast_continue+0x268>
  a4b8d8:	e9 5a fe ff ff       	jmp    a4b737 <LZ4_decompress_fast_continue+0xd7>
  a4b8dd:	0f 1f 00             	nopl   (%eax)
  a4b8e0:	e8 7b 23 00 00       	call   a4dc60 <memmove>
  a4b8e5:	e9 e6 fd ff ff       	jmp    a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b8ea:	48                   	dec    %eax
  a4b8eb:	8b 44 24 20          	mov    0x20(%esp),%eax
  a4b8ef:	80 38 00             	cmpb   $0x0,(%eax)
  a4b8f2:	0f 84 20 04 00 00    	je     a4bd18 <LZ4_decompress_fast_continue+0x6b8>
  a4b8f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4b8fd:	48                   	dec    %eax
  a4b8fe:	83 c4 48             	add    $0x48,%esp
  a4b901:	5b                   	pop    %ebx
  a4b902:	5d                   	pop    %ebp
  a4b903:	41                   	inc    %ecx
  a4b904:	5c                   	pop    %esp
  a4b905:	41                   	inc    %ecx
  a4b906:	5d                   	pop    %ebp
  a4b907:	41                   	inc    %ecx
  a4b908:	5e                   	pop    %esi
  a4b909:	41                   	inc    %ecx
  a4b90a:	5f                   	pop    %edi
  a4b90b:	c3                   	ret    
  a4b90c:	41                   	inc    %ecx
  a4b90d:	0f b6 00             	movzbl (%eax),%eax
  a4b910:	88 07                	mov    %al,(%edi)
  a4b912:	41                   	inc    %ecx
  a4b913:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  a4b917:	88 47 01             	mov    %al,0x1(%edi)
  a4b91a:	41                   	inc    %ecx
  a4b91b:	0f b6 40 02          	movzbl 0x2(%eax),%eax
  a4b91f:	88 47 02             	mov    %al,0x2(%edi)
  a4b922:	41                   	inc    %ecx
  a4b923:	0f b6 40 03          	movzbl 0x3(%eax),%eax
  a4b927:	88 47 03             	mov    %al,0x3(%edi)
  a4b92a:	48                   	dec    %eax
  a4b92b:	8d 05 6f 86 00 00    	lea    0x866f,%eax
  a4b931:	8b 04 b0             	mov    (%eax,%esi,4),%eax
  a4b934:	49                   	dec    %ecx
  a4b935:	01 c0                	add    %eax,%eax
  a4b937:	41                   	inc    %ecx
  a4b938:	8b 00                	mov    (%eax),%eax
  a4b93a:	89 47 04             	mov    %eax,0x4(%edi)
  a4b93d:	48                   	dec    %eax
  a4b93e:	8d 05 7c 86 00 00    	lea    0x867c,%eax
  a4b944:	48                   	dec    %eax
  a4b945:	63 04 b0             	arpl   %ax,(%eax,%esi,4)
  a4b948:	49                   	dec    %ecx
  a4b949:	29 c0                	sub    %eax,%eax
  a4b94b:	48                   	dec    %eax
  a4b94c:	8d 43 f4             	lea    -0xc(%ebx),%eax
  a4b94f:	49                   	dec    %ecx
  a4b950:	39 c7                	cmp    %eax,%edi
  a4b952:	0f 86 89 fe ff ff    	jbe    a4b7e1 <LZ4_decompress_fast_continue+0x181>
  a4b958:	48                   	dec    %eax
  a4b959:	8d 43 fb             	lea    -0x5(%ebx),%eax
  a4b95c:	49                   	dec    %ecx
  a4b95d:	39 c7                	cmp    %eax,%edi
  a4b95f:	77 97                	ja     a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4b961:	48                   	dec    %eax
  a4b962:	83 c7 08             	add    $0x8,%edi
  a4b965:	48                   	dec    %eax
  a4b966:	3b 7c 24 28          	cmp    0x28(%esp),%edi
  a4b96a:	0f 82 d2 02 00 00    	jb     a4bc42 <LZ4_decompress_fast_continue+0x5e2>
  a4b970:	4c                   	dec    %esp
  a4b971:	39 ff                	cmp    %edi,%edi
  a4b973:	0f 83 57 fd ff ff    	jae    a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b979:	4c                   	dec    %esp
  a4b97a:	89 f9                	mov    %edi,%ecx
  a4b97c:	31 c0                	xor    %eax,%eax
  a4b97e:	48                   	dec    %eax
  a4b97f:	29 f9                	sub    %edi,%ecx
  a4b981:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4b988:	41                   	inc    %ecx
  a4b989:	0f b6 14 00          	movzbl (%eax,%eax,1),%edx
  a4b98d:	88 14 07             	mov    %dl,(%edi,%eax,1)
  a4b990:	48                   	dec    %eax
  a4b991:	83 c0 01             	add    $0x1,%eax
  a4b994:	48                   	dec    %eax
  a4b995:	39 c1                	cmp    %eax,%ecx
  a4b997:	75 ef                	jne    a4b988 <LZ4_decompress_fast_continue+0x328>
  a4b999:	e9 32 fd ff ff       	jmp    a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4b99e:	48                   	dec    %eax
  a4b99f:	89 fe                	mov    %edi,%esi
  a4b9a1:	4c                   	dec    %esp
  a4b9a2:	8b 74 24 20          	mov    0x20(%esp),%esi
  a4b9a6:	48                   	dec    %eax
  a4b9a7:	8b 7f 08             	mov    0x8(%edi),%edi
  a4b9aa:	4d                   	dec    %ebp
  a4b9ab:	8d 3c 0c             	lea    (%esp,%ecx,1),%edi
  a4b9ae:	48                   	dec    %eax
  a4b9af:	8b 36                	mov    (%esi),%esi
  a4b9b1:	48                   	dec    %eax
  a4b9b2:	89 7c 24 10          	mov    %edi,0x10(%esp)
  a4b9b6:	45                   	inc    %ebp
  a4b9b7:	0f b6 16             	movzbl (%esi),%edx
  a4b9ba:	48                   	dec    %eax
  a4b9bb:	89 74 24 28          	mov    %esi,0x28(%esp)
  a4b9bf:	85 c0                	test   %eax,%eax
  a4b9c1:	0f 84 5b 03 00 00    	je     a4bd22 <LZ4_decompress_fast_continue+0x6c2>
  a4b9c7:	48                   	dec    %eax
  a4b9c8:	8d 43 f9             	lea    -0x7(%ebx),%eax
  a4b9cb:	4d                   	dec    %ebp
  a4b9cc:	89 f5                	mov    %esi,%ebp
  a4b9ce:	48                   	dec    %eax
  a4b9cf:	8d 6b f8             	lea    -0x8(%ebx),%ebp
  a4b9d2:	4d                   	dec    %ebp
  a4b9d3:	89 fe                	mov    %edi,%esi
  a4b9d5:	48                   	dec    %eax
  a4b9d6:	89 44 24 38          	mov    %eax,0x38(%esp)
  a4b9da:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4b9e0:	41                   	inc    %ecx
  a4b9e1:	0f b6 c2             	movzbl %dl,%eax
  a4b9e4:	49                   	dec    %ecx
  a4b9e5:	8d 4d 01             	lea    0x1(%ebp),%ecx
  a4b9e8:	c1 e8 04             	shr    $0x4,%eax
  a4b9eb:	89 c6                	mov    %eax,%esi
  a4b9ed:	83 f8 0f             	cmp    $0xf,%eax
  a4b9f0:	0f 84 5d 01 00 00    	je     a4bb53 <LZ4_decompress_fast_continue+0x4f3>
  a4b9f6:	49                   	dec    %ecx
  a4b9f7:	8d 3c 34             	lea    (%esp,%esi,1),%edi
  a4b9fa:	48                   	dec    %eax
  a4b9fb:	39 ef                	cmp    %ebp,%edi
  a4b9fd:	0f 87 7f 02 00 00    	ja     a4bc82 <LZ4_decompress_fast_continue+0x622>
  a4ba03:	48                   	dec    %eax
  a4ba04:	89 c8                	mov    %ecx,%eax
  a4ba06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4ba0d:	00 00 00 
  a4ba10:	48                   	dec    %eax
  a4ba11:	8b 10                	mov    (%eax),%edx
  a4ba13:	49                   	dec    %ecx
  a4ba14:	83 c4 08             	add    $0x8,%esp
  a4ba17:	48                   	dec    %eax
  a4ba18:	83 c0 08             	add    $0x8,%eax
  a4ba1b:	49                   	dec    %ecx
  a4ba1c:	89 54 24 f8          	mov    %edx,-0x8(%esp)
  a4ba20:	4c                   	dec    %esp
  a4ba21:	39 e7                	cmp    %esp,%edi
  a4ba23:	77 eb                	ja     a4ba10 <LZ4_decompress_fast_continue+0x3b0>
  a4ba25:	48                   	dec    %eax
  a4ba26:	01 f1                	add    %esi,%ecx
  a4ba28:	44                   	inc    %esp
  a4ba29:	89 d0                	mov    %edx,%eax
  a4ba2b:	48                   	dec    %eax
  a4ba2c:	89 fe                	mov    %edi,%esi
  a4ba2e:	4c                   	dec    %esp
  a4ba2f:	89 d2                	mov    %edx,%edx
  a4ba31:	44                   	inc    %esp
  a4ba32:	0f b7 01             	movzwl (%ecx),%eax
  a4ba35:	83 e0 0f             	and    $0xf,%eax
  a4ba38:	4c                   	dec    %esp
  a4ba39:	8d 69 02             	lea    0x2(%ecx),%ebp
  a4ba3c:	83 e2 0f             	and    $0xf,%edx
  a4ba3f:	44                   	inc    %esp
  a4ba40:	89 07                	mov    %eax,(%edi)
  a4ba42:	4c                   	dec    %esp
  a4ba43:	29 c6                	sub    %eax,%esi
  a4ba45:	3c 0f                	cmp    $0xf,%al
  a4ba47:	0f 84 27 01 00 00    	je     a4bb74 <LZ4_decompress_fast_continue+0x514>
  a4ba4d:	48                   	dec    %eax
  a4ba4e:	83 c2 04             	add    $0x4,%edx
  a4ba51:	4c                   	dec    %esp
  a4ba52:	8d 24 17             	lea    (%edi,%edx,1),%esp
  a4ba55:	49                   	dec    %ecx
  a4ba56:	39 f6                	cmp    %esi,%esi
  a4ba58:	0f 86 82 00 00 00    	jbe    a4bae0 <LZ4_decompress_fast_continue+0x480>
  a4ba5e:	48                   	dec    %eax
  a4ba5f:	8d 43 fb             	lea    -0x5(%ebx),%eax
  a4ba62:	49                   	dec    %ecx
  a4ba63:	39 c4                	cmp    %eax,%esp
  a4ba65:	0f 87 8d fe ff ff    	ja     a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4ba6b:	4d                   	dec    %ebp
  a4ba6c:	89 f2                	mov    %esi,%edx
  a4ba6e:	49                   	dec    %ecx
  a4ba6f:	29 f2                	sub    %esi,%edx
  a4ba71:	48                   	dec    %eax
  a4ba72:	8b 74 24 10          	mov    0x10(%esp),%esi
  a4ba76:	4c                   	dec    %esp
  a4ba77:	29 d6                	sub    %edx,%esi
  a4ba79:	48                   	dec    %eax
  a4ba7a:	03 74 24 28          	add    0x28(%esp),%esi
  a4ba7e:	4c                   	dec    %esp
  a4ba7f:	39 d2                	cmp    %edx,%edx
  a4ba81:	0f 86 0f 01 00 00    	jbe    a4bb96 <LZ4_decompress_fast_continue+0x536>
  a4ba87:	4c                   	dec    %esp
  a4ba88:	29 d2                	sub    %edx,%edx
  a4ba8a:	4c                   	dec    %esp
  a4ba8b:	89 54 24 08          	mov    %edx,0x8(%esp)
  a4ba8f:	49                   	dec    %ecx
  a4ba90:	89 d7                	mov    %edx,%edi
  a4ba92:	4c                   	dec    %esp
  a4ba93:	89 d2                	mov    %edx,%edx
  a4ba95:	e8 26 22 00 00       	call   a4dcc0 <memcpy>
  a4ba9a:	4c                   	dec    %esp
  a4ba9b:	8b 54 24 08          	mov    0x8(%esp),%edx
  a4ba9f:	48                   	dec    %eax
  a4baa0:	89 c7                	mov    %eax,%edi
  a4baa2:	4c                   	dec    %esp
  a4baa3:	01 d7                	add    %edx,%edi
  a4baa5:	48                   	dec    %eax
  a4baa6:	89 f8                	mov    %edi,%eax
  a4baa8:	4c                   	dec    %esp
  a4baa9:	29 f0                	sub    %esi,%eax
  a4baab:	49                   	dec    %ecx
  a4baac:	39 c7                	cmp    %eax,%edi
  a4baae:	0f 86 8a 00 00 00    	jbe    a4bb3e <LZ4_decompress_fast_continue+0x4de>
  a4bab4:	49                   	dec    %ecx
  a4bab5:	39 fc                	cmp    %edi,%esp
  a4bab7:	0f 86 bd 01 00 00    	jbe    a4bc7a <LZ4_decompress_fast_continue+0x61a>
  a4babd:	31 c0                	xor    %eax,%eax
  a4babf:	41                   	inc    %ecx
  a4bac0:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
  a4bac4:	88 14 07             	mov    %dl,(%edi,%eax,1)
  a4bac7:	48                   	dec    %eax
  a4bac8:	83 c0 01             	add    $0x1,%eax
  a4bacb:	49                   	dec    %ecx
  a4bacc:	39 c7                	cmp    %eax,%edi
  a4bace:	75 ef                	jne    a4babf <LZ4_decompress_fast_continue+0x45f>
  a4bad0:	45                   	inc    %ebp
  a4bad1:	0f b6 55 00          	movzbl 0x0(%ebp),%edx
  a4bad5:	e9 06 ff ff ff       	jmp    a4b9e0 <LZ4_decompress_fast_continue+0x380>
  a4bada:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4bae0:	49                   	dec    %ecx
  a4bae1:	83 f8 07             	cmp    $0x7,%eax
  a4bae4:	0f 86 bb 00 00 00    	jbe    a4bba5 <LZ4_decompress_fast_continue+0x545>
  a4baea:	48                   	dec    %eax
  a4baeb:	8b 06                	mov    (%esi),%eax
  a4baed:	48                   	dec    %eax
  a4baee:	83 c6 08             	add    $0x8,%esi
  a4baf1:	48                   	dec    %eax
  a4baf2:	89 07                	mov    %eax,(%edi)
  a4baf4:	48                   	dec    %eax
  a4baf5:	8d 43 f4             	lea    -0xc(%ebx),%eax
  a4baf8:	49                   	dec    %ecx
  a4baf9:	39 c4                	cmp    %eax,%esp
  a4bafb:	0f 87 ec 00 00 00    	ja     a4bbed <LZ4_decompress_fast_continue+0x58d>
  a4bb01:	48                   	dec    %eax
  a4bb02:	8b 06                	mov    (%esi),%eax
  a4bb04:	48                   	dec    %eax
  a4bb05:	89 47 08             	mov    %eax,0x8(%edi)
  a4bb08:	48                   	dec    %eax
  a4bb09:	83 fa 10             	cmp    $0x10,%edx
  a4bb0c:	76 c2                	jbe    a4bad0 <LZ4_decompress_fast_continue+0x470>
  a4bb0e:	48                   	dec    %eax
  a4bb0f:	8d 46 08             	lea    0x8(%esi),%eax
  a4bb12:	48                   	dec    %eax
  a4bb13:	83 c7 10             	add    $0x10,%edi
  a4bb16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4bb1d:	00 00 00 
  a4bb20:	48                   	dec    %eax
  a4bb21:	8b 10                	mov    (%eax),%edx
  a4bb23:	48                   	dec    %eax
  a4bb24:	83 c7 08             	add    $0x8,%edi
  a4bb27:	48                   	dec    %eax
  a4bb28:	83 c0 08             	add    $0x8,%eax
  a4bb2b:	48                   	dec    %eax
  a4bb2c:	89 57 f8             	mov    %edx,-0x8(%edi)
  a4bb2f:	4c                   	dec    %esp
  a4bb30:	39 e7                	cmp    %esp,%edi
  a4bb32:	72 ec                	jb     a4bb20 <LZ4_decompress_fast_continue+0x4c0>
  a4bb34:	45                   	inc    %ebp
  a4bb35:	0f b6 55 00          	movzbl 0x0(%ebp),%edx
  a4bb39:	e9 a2 fe ff ff       	jmp    a4b9e0 <LZ4_decompress_fast_continue+0x380>
  a4bb3e:	4c                   	dec    %esp
  a4bb3f:	89 fa                	mov    %edi,%edx
  a4bb41:	4c                   	dec    %esp
  a4bb42:	89 f6                	mov    %esi,%esi
  a4bb44:	e8 77 21 00 00       	call   a4dcc0 <memcpy>
  a4bb49:	45                   	inc    %ebp
  a4bb4a:	0f b6 55 00          	movzbl 0x0(%ebp),%edx
  a4bb4e:	e9 8d fe ff ff       	jmp    a4b9e0 <LZ4_decompress_fast_continue+0x380>
  a4bb53:	be 0f 00 00 00       	mov    $0xf,%esi
  a4bb58:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4bb5f:	00 
  a4bb60:	0f b6 11             	movzbl (%ecx),%edx
  a4bb63:	48                   	dec    %eax
  a4bb64:	83 c1 01             	add    $0x1,%ecx
  a4bb67:	48                   	dec    %eax
  a4bb68:	01 d6                	add    %edx,%esi
  a4bb6a:	80 fa ff             	cmp    $0xff,%dl
  a4bb6d:	74 f1                	je     a4bb60 <LZ4_decompress_fast_continue+0x500>
  a4bb6f:	e9 82 fe ff ff       	jmp    a4b9f6 <LZ4_decompress_fast_continue+0x396>
  a4bb74:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4bb79:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4bb80:	41                   	inc    %ecx
  a4bb81:	0f b6 4d 00          	movzbl 0x0(%ebp),%ecx
  a4bb85:	49                   	dec    %ecx
  a4bb86:	83 c5 01             	add    $0x1,%ebp
  a4bb89:	48                   	dec    %eax
  a4bb8a:	01 ca                	add    %ecx,%edx
  a4bb8c:	80 f9 ff             	cmp    $0xff,%cl
  a4bb8f:	74 ef                	je     a4bb80 <LZ4_decompress_fast_continue+0x520>
  a4bb91:	e9 b7 fe ff ff       	jmp    a4ba4d <LZ4_decompress_fast_continue+0x3ed>
  a4bb96:	e8 c5 20 00 00       	call   a4dc60 <memmove>
  a4bb9b:	45                   	inc    %ebp
  a4bb9c:	0f b6 55 00          	movzbl 0x0(%ebp),%edx
  a4bba0:	e9 3b fe ff ff       	jmp    a4b9e0 <LZ4_decompress_fast_continue+0x380>
  a4bba5:	0f b6 06             	movzbl (%esi),%eax
  a4bba8:	88 07                	mov    %al,(%edi)
  a4bbaa:	0f b6 46 01          	movzbl 0x1(%esi),%eax
  a4bbae:	88 47 01             	mov    %al,0x1(%edi)
  a4bbb1:	0f b6 46 02          	movzbl 0x2(%esi),%eax
  a4bbb5:	88 47 02             	mov    %al,0x2(%edi)
  a4bbb8:	0f b6 46 03          	movzbl 0x3(%esi),%eax
  a4bbbc:	88 47 03             	mov    %al,0x3(%edi)
  a4bbbf:	48                   	dec    %eax
  a4bbc0:	8d 05 da 83 00 00    	lea    0x83da,%eax
  a4bbc6:	42                   	inc    %edx
  a4bbc7:	8b 04 80             	mov    (%eax,%eax,4),%eax
  a4bbca:	48                   	dec    %eax
  a4bbcb:	01 c6                	add    %eax,%esi
  a4bbcd:	8b 06                	mov    (%esi),%eax
  a4bbcf:	89 47 04             	mov    %eax,0x4(%edi)
  a4bbd2:	48                   	dec    %eax
  a4bbd3:	8d 05 e7 83 00 00    	lea    0x83e7,%eax
  a4bbd9:	4a                   	dec    %edx
  a4bbda:	63 04 80             	arpl   %ax,(%eax,%eax,4)
  a4bbdd:	48                   	dec    %eax
  a4bbde:	29 c6                	sub    %eax,%esi
  a4bbe0:	48                   	dec    %eax
  a4bbe1:	8d 43 f4             	lea    -0xc(%ebx),%eax
  a4bbe4:	49                   	dec    %ecx
  a4bbe5:	39 c4                	cmp    %eax,%esp
  a4bbe7:	0f 86 14 ff ff ff    	jbe    a4bb01 <LZ4_decompress_fast_continue+0x4a1>
  a4bbed:	48                   	dec    %eax
  a4bbee:	8d 43 fb             	lea    -0x5(%ebx),%eax
  a4bbf1:	49                   	dec    %ecx
  a4bbf2:	39 c4                	cmp    %eax,%esp
  a4bbf4:	0f 87 fe fc ff ff    	ja     a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4bbfa:	48                   	dec    %eax
  a4bbfb:	83 c7 08             	add    $0x8,%edi
  a4bbfe:	48                   	dec    %eax
  a4bbff:	3b 7c 24 38          	cmp    0x38(%esp),%edi
  a4bc03:	0f 82 da 00 00 00    	jb     a4bce3 <LZ4_decompress_fast_continue+0x683>
  a4bc09:	4c                   	dec    %esp
  a4bc0a:	39 e7                	cmp    %esp,%edi
  a4bc0c:	0f 83 be fe ff ff    	jae    a4bad0 <LZ4_decompress_fast_continue+0x470>
  a4bc12:	4d                   	dec    %ebp
  a4bc13:	89 e0                	mov    %esp,%eax
  a4bc15:	31 c0                	xor    %eax,%eax
  a4bc17:	49                   	dec    %ecx
  a4bc18:	29 f8                	sub    %edi,%eax
  a4bc1a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4bc20:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
  a4bc24:	88 14 07             	mov    %dl,(%edi,%eax,1)
  a4bc27:	48                   	dec    %eax
  a4bc28:	83 c0 01             	add    $0x1,%eax
  a4bc2b:	49                   	dec    %ecx
  a4bc2c:	39 c0                	cmp    %eax,%eax
  a4bc2e:	75 f0                	jne    a4bc20 <LZ4_decompress_fast_continue+0x5c0>
  a4bc30:	45                   	inc    %ebp
  a4bc31:	0f b6 55 00          	movzbl 0x0(%ebp),%edx
  a4bc35:	e9 a6 fd ff ff       	jmp    a4b9e0 <LZ4_decompress_fast_continue+0x380>
  a4bc3a:	49                   	dec    %ecx
  a4bc3b:	89 ff                	mov    %edi,%edi
  a4bc3d:	e9 8e fa ff ff       	jmp    a4b6d0 <LZ4_decompress_fast_continue+0x70>
  a4bc42:	48                   	dec    %eax
  a4bc43:	8b 74 24 28          	mov    0x28(%esp),%esi
  a4bc47:	4c                   	dec    %esp
  a4bc48:	89 c2                	mov    %eax,%edx
  a4bc4a:	48                   	dec    %eax
  a4bc4b:	89 f8                	mov    %edi,%eax
  a4bc4d:	0f 1f 00             	nopl   (%eax)
  a4bc50:	48                   	dec    %eax
  a4bc51:	8b 0a                	mov    (%edx),%ecx
  a4bc53:	48                   	dec    %eax
  a4bc54:	83 c0 08             	add    $0x8,%eax
  a4bc57:	48                   	dec    %eax
  a4bc58:	83 c2 08             	add    $0x8,%edx
  a4bc5b:	48                   	dec    %eax
  a4bc5c:	89 48 f8             	mov    %ecx,-0x8(%eax)
  a4bc5f:	48                   	dec    %eax
  a4bc60:	39 c6                	cmp    %eax,%esi
  a4bc62:	77 ec                	ja     a4bc50 <LZ4_decompress_fast_continue+0x5f0>
  a4bc64:	48                   	dec    %eax
  a4bc65:	8b 4c 24 28          	mov    0x28(%esp),%ecx
  a4bc69:	48                   	dec    %eax
  a4bc6a:	89 c8                	mov    %ecx,%eax
  a4bc6c:	48                   	dec    %eax
  a4bc6d:	29 f8                	sub    %edi,%eax
  a4bc6f:	48                   	dec    %eax
  a4bc70:	89 cf                	mov    %ecx,%edi
  a4bc72:	49                   	dec    %ecx
  a4bc73:	01 c0                	add    %eax,%eax
  a4bc75:	e9 f6 fc ff ff       	jmp    a4b970 <LZ4_decompress_fast_continue+0x310>
  a4bc7a:	49                   	dec    %ecx
  a4bc7b:	89 fc                	mov    %edi,%esp
  a4bc7d:	e9 4e fe ff ff       	jmp    a4bad0 <LZ4_decompress_fast_continue+0x470>
  a4bc82:	49                   	dec    %ecx
  a4bc83:	89 f6                	mov    %esi,%esi
  a4bc85:	48                   	dec    %eax
  a4bc86:	39 df                	cmp    %ebx,%edi
  a4bc88:	0f 85 6a fc ff ff    	jne    a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4bc8e:	48                   	dec    %eax
  a4bc8f:	89 f2                	mov    %esi,%edx
  a4bc91:	4c                   	dec    %esp
  a4bc92:	89 e7                	mov    %esp,%edi
  a4bc94:	48                   	dec    %eax
  a4bc95:	89 ce                	mov    %ecx,%esi
  a4bc97:	48                   	dec    %eax
  a4bc98:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  a4bc9c:	e8 1f 20 00 00       	call   a4dcc0 <memcpy>
  a4bca1:	4c                   	dec    %esp
  a4bca2:	8b 44 24 08          	mov    0x8(%esp),%eax
  a4bca6:	4b                   	dec    %ebx
  a4bca7:	8d 04 30             	lea    (%eax,%esi,1),%eax
  a4bcaa:	48                   	dec    %eax
  a4bcab:	2b 44 24 20          	sub    0x20(%esp),%eax
  a4bcaf:	85 c0                	test   %eax,%eax
  a4bcb1:	0f 8e 46 fc ff ff    	jle    a4b8fd <LZ4_decompress_fast_continue+0x29d>
  a4bcb7:	48                   	dec    %eax
  a4bcb8:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  a4bcbc:	48                   	dec    %eax
  a4bcbd:	8b 4c 24 30          	mov    0x30(%esp),%ecx
  a4bcc1:	48                   	dec    %eax
  a4bcc2:	03 4b 10             	add    0x10(%ebx),%ecx
  a4bcc5:	48                   	dec    %eax
  a4bcc6:	8b 53 18             	mov    0x18(%ebx),%edx
  a4bcc9:	48                   	dec    %eax
  a4bcca:	89 cb                	mov    %ecx,%ebx
  a4bccc:	48                   	dec    %eax
  a4bccd:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  a4bcd1:	48                   	dec    %eax
  a4bcd2:	03 54 24 30          	add    0x30(%esp),%edx
  a4bcd6:	48                   	dec    %eax
  a4bcd7:	89 51 18             	mov    %edx,0x18(%ecx)
  a4bcda:	48                   	dec    %eax
  a4bcdb:	89 59 10             	mov    %ebx,0x10(%ecx)
  a4bcde:	e9 1a fc ff ff       	jmp    a4b8fd <LZ4_decompress_fast_continue+0x29d>
  a4bce3:	4c                   	dec    %esp
  a4bce4:	8b 44 24 38          	mov    0x38(%esp),%eax
  a4bce8:	48                   	dec    %eax
  a4bce9:	89 f2                	mov    %esi,%edx
  a4bceb:	48                   	dec    %eax
  a4bcec:	89 f8                	mov    %edi,%eax
  a4bcee:	48                   	dec    %eax
  a4bcef:	8b 0a                	mov    (%edx),%ecx
  a4bcf1:	48                   	dec    %eax
  a4bcf2:	83 c0 08             	add    $0x8,%eax
  a4bcf5:	48                   	dec    %eax
  a4bcf6:	83 c2 08             	add    $0x8,%edx
  a4bcf9:	48                   	dec    %eax
  a4bcfa:	89 48 f8             	mov    %ecx,-0x8(%eax)
  a4bcfd:	49                   	dec    %ecx
  a4bcfe:	39 c0                	cmp    %eax,%eax
  a4bd00:	77 ec                	ja     a4bcee <LZ4_decompress_fast_continue+0x68e>
  a4bd02:	48                   	dec    %eax
  a4bd03:	8b 4c 24 38          	mov    0x38(%esp),%ecx
  a4bd07:	48                   	dec    %eax
  a4bd08:	89 c8                	mov    %ecx,%eax
  a4bd0a:	48                   	dec    %eax
  a4bd0b:	29 f8                	sub    %edi,%eax
  a4bd0d:	48                   	dec    %eax
  a4bd0e:	89 cf                	mov    %ecx,%edi
  a4bd10:	48                   	dec    %eax
  a4bd11:	01 c6                	add    %eax,%esi
  a4bd13:	e9 f1 fe ff ff       	jmp    a4bc09 <LZ4_decompress_fast_continue+0x5a9>
  a4bd18:	b8 01 00 00 00       	mov    $0x1,%eax
  a4bd1d:	e9 74 fb ff ff       	jmp    a4b896 <LZ4_decompress_fast_continue+0x236>
  a4bd22:	45                   	inc    %ebp
  a4bd23:	84 d2                	test   %dl,%dl
  a4bd25:	0f 85 cd fb ff ff    	jne    a4b8f8 <LZ4_decompress_fast_continue+0x298>
  a4bd2b:	b8 01 00 00 00       	mov    $0x1,%eax
  a4bd30:	eb 9a                	jmp    a4bccc <LZ4_decompress_fast_continue+0x66c>
  a4bd32:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4bd39:	00 00 00 00 
  a4bd3d:	0f 1f 00             	nopl   (%eax)

0000000000a4bd40 <LZ4_decompress_safe_usingDict>:
  a4bd40:	f3 0f 1e fa          	endbr64 
  a4bd44:	41                   	inc    %ecx
  a4bd45:	57                   	push   %edi
  a4bd46:	41                   	inc    %ecx
  a4bd47:	56                   	push   %esi
  a4bd48:	41                   	inc    %ecx
  a4bd49:	55                   	push   %ebp
  a4bd4a:	4c                   	dec    %esp
  a4bd4b:	63 ea                	arpl   %bp,%dx
  a4bd4d:	48                   	dec    %eax
  a4bd4e:	63 d1                	arpl   %dx,%cx
  a4bd50:	41                   	inc    %ecx
  a4bd51:	54                   	push   %esp
  a4bd52:	48                   	dec    %eax
  a4bd53:	89 d0                	mov    %edx,%eax
  a4bd55:	49                   	dec    %ecx
  a4bd56:	89 f4                	mov    %esi,%esp
  a4bd58:	4c                   	dec    %esp
  a4bd59:	89 ee                	mov    %ebp,%esi
  a4bd5b:	55                   	push   %ebp
  a4bd5c:	49                   	dec    %ecx
  a4bd5d:	01 fd                	add    %edi,%ebp
  a4bd5f:	48                   	dec    %eax
  a4bd60:	89 fd                	mov    %edi,%ebp
  a4bd62:	53                   	push   %ebx
  a4bd63:	48                   	dec    %eax
  a4bd64:	83 ec 38             	sub    $0x38,%esp
  a4bd67:	45                   	inc    %ebp
  a4bd68:	85 c9                	test   %ecx,%ecx
  a4bd6a:	0f 85 00 01 00 00    	jne    a4be70 <LZ4_decompress_safe_usingDict+0x130>
  a4bd70:	4c                   	dec    %esp
  a4bd71:	01 e2                	add    %esp,%edx
  a4bd73:	4c                   	dec    %esp
  a4bd74:	89 e7                	mov    %esp,%edi
  a4bd76:	85 c0                	test   %eax,%eax
  a4bd78:	0f 84 93 04 00 00    	je     a4c211 <LZ4_decompress_safe_usingDict+0x4d1>
  a4bd7e:	48                   	dec    %eax
  a4bd7f:	8d 42 fb             	lea    -0x5(%edx),%eax
  a4bd82:	4d                   	dec    %ebp
  a4bd83:	8d 4d f1             	lea    -0xf(%ebp),%ecx
  a4bd86:	48                   	dec    %eax
  a4bd87:	89 44 24 08          	mov    %eax,0x8(%esp)
  a4bd8b:	4c                   	dec    %esp
  a4bd8c:	8d 42 f4             	lea    -0xc(%edx),%eax
  a4bd8f:	4d                   	dec    %ebp
  a4bd90:	8d 5d f8             	lea    -0x8(%ebp),%ebx
  a4bd93:	4d                   	dec    %ebp
  a4bd94:	8d 55 fc             	lea    -0x4(%ebp),%edx
  a4bd97:	4c                   	dec    %esp
  a4bd98:	8d 72 f9             	lea    -0x7(%edx),%esi
  a4bd9b:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
  a4bd9f:	48                   	dec    %eax
  a4bda0:	8d 75 01             	lea    0x1(%ebp),%esi
  a4bda3:	89 c1                	mov    %eax,%ecx
  a4bda5:	c1 e8 04             	shr    $0x4,%eax
  a4bda8:	41                   	inc    %ecx
  a4bda9:	89 c7                	mov    %eax,%edi
  a4bdab:	83 f8 0f             	cmp    $0xf,%eax
  a4bdae:	0f 84 ac 02 00 00    	je     a4c060 <LZ4_decompress_safe_usingDict+0x320>
  a4bdb4:	4a                   	dec    %edx
  a4bdb5:	8d 1c 3f             	lea    (%edi,%edi,1),%ebx
  a4bdb8:	4a                   	dec    %edx
  a4bdb9:	8d 2c 3e             	lea    (%esi,%edi,1),%ebp
  a4bdbc:	49                   	dec    %ecx
  a4bdbd:	39 d8                	cmp    %ebx,%eax
  a4bdbf:	0f 82 5c 06 00 00    	jb     a4c421 <LZ4_decompress_safe_usingDict+0x6e1>
  a4bdc5:	4c                   	dec    %esp
  a4bdc6:	39 dd                	cmp    %ebx,%ebp
  a4bdc8:	0f 87 53 06 00 00    	ja     a4c421 <LZ4_decompress_safe_usingDict+0x6e1>
  a4bdce:	66 90                	xchg   %ax,%ax
  a4bdd0:	48                   	dec    %eax
  a4bdd1:	8b 06                	mov    (%esi),%eax
  a4bdd3:	48                   	dec    %eax
  a4bdd4:	83 c7 08             	add    $0x8,%edi
  a4bdd7:	48                   	dec    %eax
  a4bdd8:	83 c6 08             	add    $0x8,%esi
  a4bddb:	48                   	dec    %eax
  a4bddc:	89 47 f8             	mov    %eax,-0x8(%edi)
  a4bddf:	48                   	dec    %eax
  a4bde0:	39 df                	cmp    %ebx,%edi
  a4bde2:	72 ec                	jb     a4bdd0 <LZ4_decompress_safe_usingDict+0x90>
  a4bde4:	0f b7 75 00          	movzwl 0x0(%ebp),%esi
  a4bde8:	48                   	dec    %eax
  a4bde9:	89 d8                	mov    %ebx,%eax
  a4bdeb:	48                   	dec    %eax
  a4bdec:	83 c5 02             	add    $0x2,%ebp
  a4bdef:	48                   	dec    %eax
  a4bdf0:	29 f0                	sub    %esi,%eax
  a4bdf2:	49                   	dec    %ecx
  a4bdf3:	39 c4                	cmp    %eax,%esp
  a4bdf5:	0f 87 f5 01 00 00    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4bdfb:	89 cf                	mov    %ecx,%edi
  a4bdfd:	89 33                	mov    %esi,(%ebx)
  a4bdff:	83 e1 0f             	and    $0xf,%ecx
  a4be02:	83 e7 0f             	and    $0xf,%edi
  a4be05:	40                   	inc    %eax
  a4be06:	80 ff 0f             	cmp    $0xf,%bh
  a4be09:	0f 84 b1 01 00 00    	je     a4bfc0 <LZ4_decompress_safe_usingDict+0x280>
  a4be0f:	48                   	dec    %eax
  a4be10:	83 c1 04             	add    $0x4,%ecx
  a4be13:	48                   	dec    %eax
  a4be14:	8d 3c 0b             	lea    (%ebx,%ecx,1),%edi
  a4be17:	48                   	dec    %eax
  a4be18:	83 fe 07             	cmp    $0x7,%esi
  a4be1b:	0f 86 95 04 00 00    	jbe    a4c2b6 <LZ4_decompress_safe_usingDict+0x576>
  a4be21:	48                   	dec    %eax
  a4be22:	8b 30                	mov    (%eax),%esi
  a4be24:	48                   	dec    %eax
  a4be25:	83 c0 08             	add    $0x8,%eax
  a4be28:	48                   	dec    %eax
  a4be29:	89 33                	mov    %esi,(%ebx)
  a4be2b:	49                   	dec    %ecx
  a4be2c:	39 f8                	cmp    %edi,%eax
  a4be2e:	0f 82 3e 04 00 00    	jb     a4c272 <LZ4_decompress_safe_usingDict+0x532>
  a4be34:	48                   	dec    %eax
  a4be35:	8b 30                	mov    (%eax),%esi
  a4be37:	48                   	dec    %eax
  a4be38:	89 73 08             	mov    %esi,0x8(%ebx)
  a4be3b:	48                   	dec    %eax
  a4be3c:	83 f9 10             	cmp    $0x10,%ecx
  a4be3f:	0f 86 56 ff ff ff    	jbe    a4bd9b <LZ4_decompress_safe_usingDict+0x5b>
  a4be45:	48                   	dec    %eax
  a4be46:	83 c0 08             	add    $0x8,%eax
  a4be49:	48                   	dec    %eax
  a4be4a:	83 c3 10             	add    $0x10,%ebx
  a4be4d:	0f 1f 00             	nopl   (%eax)
  a4be50:	48                   	dec    %eax
  a4be51:	8b 08                	mov    (%eax),%ecx
  a4be53:	48                   	dec    %eax
  a4be54:	83 c3 08             	add    $0x8,%ebx
  a4be57:	48                   	dec    %eax
  a4be58:	83 c0 08             	add    $0x8,%eax
  a4be5b:	48                   	dec    %eax
  a4be5c:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  a4be5f:	48                   	dec    %eax
  a4be60:	39 df                	cmp    %ebx,%edi
  a4be62:	77 ec                	ja     a4be50 <LZ4_decompress_safe_usingDict+0x110>
  a4be64:	e9 32 ff ff ff       	jmp    a4bd9b <LZ4_decompress_safe_usingDict+0x5b>
  a4be69:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4be70:	4d                   	dec    %ebp
  a4be71:	63 d1                	arpl   %dx,%cx
  a4be73:	4b                   	dec    %ebx
  a4be74:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
  a4be77:	48                   	dec    %eax
  a4be78:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  a4be7c:	49                   	dec    %ecx
  a4be7d:	39 cc                	cmp    %ecx,%esp
  a4be7f:	0f 84 75 02 00 00    	je     a4c0fa <LZ4_decompress_safe_usingDict+0x3ba>
  a4be85:	4d                   	dec    %ebp
  a4be86:	8d 3c 14             	lea    (%esp,%edx,1),%edi
  a4be89:	4c                   	dec    %esp
  a4be8a:	89 e2                	mov    %esp,%edx
  a4be8c:	4c                   	dec    %esp
  a4be8d:	89 e3                	mov    %esp,%ebx
  a4be8f:	4d                   	dec    %ebp
  a4be90:	89 d6                	mov    %edx,%esi
  a4be92:	4c                   	dec    %esp
  a4be93:	29 d2                	sub    %edx,%edx
  a4be95:	48                   	dec    %eax
  a4be96:	89 54 24 08          	mov    %edx,0x8(%esp)
  a4be9a:	49                   	dec    %ecx
  a4be9b:	8d 57 f9             	lea    -0x7(%edi),%edx
  a4be9e:	48                   	dec    %eax
  a4be9f:	89 54 24 28          	mov    %edx,0x28(%esp)
  a4bea3:	85 c0                	test   %eax,%eax
  a4bea5:	0f 84 66 03 00 00    	je     a4c211 <LZ4_decompress_safe_usingDict+0x4d1>
  a4beab:	0f b6 4d 00          	movzbl 0x0(%ebp),%ecx
  a4beaf:	48                   	dec    %eax
  a4beb0:	8d 75 01             	lea    0x1(%ebp),%esi
  a4beb3:	89 ca                	mov    %ecx,%edx
  a4beb5:	c1 e9 04             	shr    $0x4,%ecx
  a4beb8:	89 c8                	mov    %ecx,%eax
  a4beba:	83 f9 0f             	cmp    $0xf,%ecx
  a4bebd:	0f 84 f5 01 00 00    	je     a4c0b8 <LZ4_decompress_safe_usingDict+0x378>
  a4bec3:	48                   	dec    %eax
  a4bec4:	8d 3c 03             	lea    (%ebx,%eax,1),%edi
  a4bec7:	48                   	dec    %eax
  a4bec8:	8d 2c 06             	lea    (%esi,%eax,1),%ebp
  a4becb:	49                   	dec    %ecx
  a4becc:	8d 4f f4             	lea    -0xc(%edi),%ecx
  a4becf:	48                   	dec    %eax
  a4bed0:	39 cf                	cmp    %ecx,%edi
  a4bed2:	0f 87 f5 05 00 00    	ja     a4c4cd <LZ4_decompress_safe_usingDict+0x78d>
  a4bed8:	4d                   	dec    %ebp
  a4bed9:	8d 45 f8             	lea    -0x8(%ebp),%eax
  a4bedc:	4c                   	dec    %esp
  a4bedd:	39 c5                	cmp    %eax,%ebp
  a4bedf:	0f 87 e8 05 00 00    	ja     a4c4cd <LZ4_decompress_safe_usingDict+0x78d>
  a4bee5:	0f 1f 00             	nopl   (%eax)
  a4bee8:	48                   	dec    %eax
  a4bee9:	8b 06                	mov    (%esi),%eax
  a4beeb:	48                   	dec    %eax
  a4beec:	83 c3 08             	add    $0x8,%ebx
  a4beef:	48                   	dec    %eax
  a4bef0:	83 c6 08             	add    $0x8,%esi
  a4bef3:	48                   	dec    %eax
  a4bef4:	89 43 f8             	mov    %eax,-0x8(%ebx)
  a4bef7:	48                   	dec    %eax
  a4bef8:	39 df                	cmp    %ebx,%edi
  a4befa:	77 ec                	ja     a4bee8 <LZ4_decompress_safe_usingDict+0x1a8>
  a4befc:	44                   	inc    %esp
  a4befd:	0f b7 45 00          	movzwl 0x0(%ebp),%eax
  a4bf01:	48                   	dec    %eax
  a4bf02:	89 fe                	mov    %edi,%esi
  a4bf04:	48                   	dec    %eax
  a4bf05:	83 c5 02             	add    $0x2,%ebp
  a4bf08:	4c                   	dec    %esp
  a4bf09:	89 c0                	mov    %eax,%eax
  a4bf0b:	4c                   	dec    %esp
  a4bf0c:	29 c6                	sub    %eax,%esi
  a4bf0e:	48                   	dec    %eax
  a4bf0f:	39 74 24 08          	cmp    %esi,0x8(%esp)
  a4bf13:	76 0d                	jbe    a4bf22 <LZ4_decompress_safe_usingDict+0x1e2>
  a4bf15:	49                   	dec    %ecx
  a4bf16:	81 fe ff ff 00 00    	cmp    $0xffff,%esi
  a4bf1c:	0f 86 ce 00 00 00    	jbe    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4bf22:	89 07                	mov    %eax,(%edi)
  a4bf24:	89 d0                	mov    %edx,%eax
  a4bf26:	83 e2 0f             	and    $0xf,%edx
  a4bf29:	83 e0 0f             	and    $0xf,%eax
  a4bf2c:	3c 0f                	cmp    $0xf,%al
  a4bf2e:	0f 84 fc 02 00 00    	je     a4c230 <LZ4_decompress_safe_usingDict+0x4f0>
  a4bf34:	48                   	dec    %eax
  a4bf35:	83 c2 04             	add    $0x4,%edx
  a4bf38:	48                   	dec    %eax
  a4bf39:	8d 1c 17             	lea    (%edi,%edx,1),%ebx
  a4bf3c:	49                   	dec    %ecx
  a4bf3d:	39 f4                	cmp    %esi,%esp
  a4bf3f:	0f 86 c3 00 00 00    	jbe    a4c008 <LZ4_decompress_safe_usingDict+0x2c8>
  a4bf45:	49                   	dec    %ecx
  a4bf46:	8d 47 fb             	lea    -0x5(%edi),%eax
  a4bf49:	48                   	dec    %eax
  a4bf4a:	39 c3                	cmp    %eax,%ebx
  a4bf4c:	0f 87 9e 00 00 00    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4bf52:	4c                   	dec    %esp
  a4bf53:	89 e1                	mov    %esp,%ecx
  a4bf55:	48                   	dec    %eax
  a4bf56:	29 f1                	sub    %esi,%ecx
  a4bf58:	48                   	dec    %eax
  a4bf59:	8b 74 24 10          	mov    0x10(%esp),%esi
  a4bf5d:	48                   	dec    %eax
  a4bf5e:	29 ce                	sub    %ecx,%esi
  a4bf60:	48                   	dec    %eax
  a4bf61:	39 ca                	cmp    %ecx,%edx
  a4bf63:	0f 86 ff 02 00 00    	jbe    a4c268 <LZ4_decompress_safe_usingDict+0x528>
  a4bf69:	48                   	dec    %eax
  a4bf6a:	29 ca                	sub    %ecx,%edx
  a4bf6c:	48                   	dec    %eax
  a4bf6d:	89 4c 24 18          	mov    %ecx,0x18(%esp)
  a4bf71:	48                   	dec    %eax
  a4bf72:	89 54 24 20          	mov    %edx,0x20(%esp)
  a4bf76:	48                   	dec    %eax
  a4bf77:	89 ca                	mov    %ecx,%edx
  a4bf79:	e8 42 1d 00 00       	call   a4dcc0 <memcpy>
  a4bf7e:	48                   	dec    %eax
  a4bf7f:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  a4bf83:	4c                   	dec    %esp
  a4bf84:	8b 44 24 20          	mov    0x20(%esp),%eax
  a4bf88:	48                   	dec    %eax
  a4bf89:	89 c7                	mov    %eax,%edi
  a4bf8b:	48                   	dec    %eax
  a4bf8c:	01 cf                	add    %ecx,%edi
  a4bf8e:	48                   	dec    %eax
  a4bf8f:	89 f8                	mov    %edi,%eax
  a4bf91:	4c                   	dec    %esp
  a4bf92:	29 e0                	sub    %esp,%eax
  a4bf94:	49                   	dec    %ecx
  a4bf95:	39 c0                	cmp    %eax,%eax
  a4bf97:	0f 86 04 01 00 00    	jbe    a4c0a1 <LZ4_decompress_safe_usingDict+0x361>
  a4bf9d:	48                   	dec    %eax
  a4bf9e:	39 fb                	cmp    %edi,%ebx
  a4bfa0:	0f 86 52 05 00 00    	jbe    a4c4f8 <LZ4_decompress_safe_usingDict+0x7b8>
  a4bfa6:	31 c0                	xor    %eax,%eax
  a4bfa8:	41                   	inc    %ecx
  a4bfa9:	0f b6 14 04          	movzbl (%esp,%eax,1),%edx
  a4bfad:	88 14 07             	mov    %dl,(%edi,%eax,1)
  a4bfb0:	48                   	dec    %eax
  a4bfb1:	83 c0 01             	add    $0x1,%eax
  a4bfb4:	4c                   	dec    %esp
  a4bfb5:	39 c0                	cmp    %eax,%eax
  a4bfb7:	75 ef                	jne    a4bfa8 <LZ4_decompress_safe_usingDict+0x268>
  a4bfb9:	e9 ed fe ff ff       	jmp    a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4bfbe:	66 90                	xchg   %ax,%ax
  a4bfc0:	b9 0f 00 00 00       	mov    $0xf,%ecx
  a4bfc5:	eb 1a                	jmp    a4bfe1 <LZ4_decompress_safe_usingDict+0x2a1>
  a4bfc7:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4bfce:	00 00 
  a4bfd0:	44                   	inc    %esp
  a4bfd1:	0f b6 ff             	movzbl %bh,%edi
  a4bfd4:	4c                   	dec    %esp
  a4bfd5:	01 f9                	add    %edi,%ecx
  a4bfd7:	40                   	inc    %eax
  a4bfd8:	80 ff ff             	cmp    $0xff,%bh
  a4bfdb:	0f 85 1f 03 00 00    	jne    a4c300 <LZ4_decompress_safe_usingDict+0x5c0>
  a4bfe1:	48                   	dec    %eax
  a4bfe2:	83 c5 01             	add    $0x1,%ebp
  a4bfe5:	0f b6 7d ff          	movzbl -0x1(%ebp),%edi
  a4bfe9:	4c                   	dec    %esp
  a4bfea:	39 d5                	cmp    %edx,%ebp
  a4bfec:	75 e2                	jne    a4bfd0 <LZ4_decompress_safe_usingDict+0x290>
  a4bfee:	66 90                	xchg   %ax,%ax
  a4bff0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4bff5:	48                   	dec    %eax
  a4bff6:	83 c4 38             	add    $0x38,%esp
  a4bff9:	5b                   	pop    %ebx
  a4bffa:	5d                   	pop    %ebp
  a4bffb:	41                   	inc    %ecx
  a4bffc:	5c                   	pop    %esp
  a4bffd:	41                   	inc    %ecx
  a4bffe:	5d                   	pop    %ebp
  a4bfff:	41                   	inc    %ecx
  a4c000:	5e                   	pop    %esi
  a4c001:	41                   	inc    %ecx
  a4c002:	5f                   	pop    %edi
  a4c003:	c3                   	ret    
  a4c004:	0f 1f 40 00          	nopl   0x0(%eax)
  a4c008:	49                   	dec    %ecx
  a4c009:	83 f8 07             	cmp    $0x7,%eax
  a4c00c:	0f 86 7b 04 00 00    	jbe    a4c48d <LZ4_decompress_safe_usingDict+0x74d>
  a4c012:	48                   	dec    %eax
  a4c013:	8b 06                	mov    (%esi),%eax
  a4c015:	48                   	dec    %eax
  a4c016:	89 07                	mov    %eax,(%edi)
  a4c018:	48                   	dec    %eax
  a4c019:	8d 46 08             	lea    0x8(%esi),%eax
  a4c01c:	48                   	dec    %eax
  a4c01d:	39 d9                	cmp    %ebx,%ecx
  a4c01f:	0f 82 20 04 00 00    	jb     a4c445 <LZ4_decompress_safe_usingDict+0x705>
  a4c025:	48                   	dec    %eax
  a4c026:	8b 08                	mov    (%eax),%ecx
  a4c028:	48                   	dec    %eax
  a4c029:	89 4f 08             	mov    %ecx,0x8(%edi)
  a4c02c:	48                   	dec    %eax
  a4c02d:	83 fa 10             	cmp    $0x10,%edx
  a4c030:	0f 86 75 fe ff ff    	jbe    a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c036:	48                   	dec    %eax
  a4c037:	83 c0 08             	add    $0x8,%eax
  a4c03a:	48                   	dec    %eax
  a4c03b:	83 c7 10             	add    $0x10,%edi
  a4c03e:	66 90                	xchg   %ax,%ax
  a4c040:	48                   	dec    %eax
  a4c041:	8b 10                	mov    (%eax),%edx
  a4c043:	48                   	dec    %eax
  a4c044:	83 c7 08             	add    $0x8,%edi
  a4c047:	48                   	dec    %eax
  a4c048:	83 c0 08             	add    $0x8,%eax
  a4c04b:	48                   	dec    %eax
  a4c04c:	89 57 f8             	mov    %edx,-0x8(%edi)
  a4c04f:	48                   	dec    %eax
  a4c050:	39 fb                	cmp    %edi,%ebx
  a4c052:	77 ec                	ja     a4c040 <LZ4_decompress_safe_usingDict+0x300>
  a4c054:	e9 52 fe ff ff       	jmp    a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c059:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4c060:	41                   	inc    %ecx
  a4c061:	bf 0f 00 00 00       	mov    $0xf,%edi
  a4c066:	eb 0d                	jmp    a4c075 <LZ4_decompress_safe_usingDict+0x335>
  a4c068:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4c06f:	00 
  a4c070:	80 fb ff             	cmp    $0xff,%bl
  a4c073:	75 0f                	jne    a4c084 <LZ4_decompress_safe_usingDict+0x344>
  a4c075:	0f b6 1e             	movzbl (%esi),%ebx
  a4c078:	48                   	dec    %eax
  a4c079:	83 c6 01             	add    $0x1,%esi
  a4c07c:	49                   	dec    %ecx
  a4c07d:	01 df                	add    %ebx,%edi
  a4c07f:	4c                   	dec    %esp
  a4c080:	39 ce                	cmp    %ecx,%esi
  a4c082:	72 ec                	jb     a4c070 <LZ4_decompress_safe_usingDict+0x330>
  a4c084:	48                   	dec    %eax
  a4c085:	89 fb                	mov    %edi,%ebx
  a4c087:	4c                   	dec    %esp
  a4c088:	01 fb                	add    %edi,%ebx
  a4c08a:	0f 82 60 ff ff ff    	jb     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c090:	48                   	dec    %eax
  a4c091:	89 f5                	mov    %esi,%ebp
  a4c093:	4c                   	dec    %esp
  a4c094:	01 fd                	add    %edi,%ebp
  a4c096:	0f 83 20 fd ff ff    	jae    a4bdbc <LZ4_decompress_safe_usingDict+0x7c>
  a4c09c:	e9 4f ff ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c0a1:	4c                   	dec    %esp
  a4c0a2:	89 c2                	mov    %eax,%edx
  a4c0a4:	4c                   	dec    %esp
  a4c0a5:	89 e6                	mov    %esp,%esi
  a4c0a7:	e8 14 1c 00 00       	call   a4dcc0 <memcpy>
  a4c0ac:	e9 fa fd ff ff       	jmp    a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c0b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4c0b8:	4d                   	dec    %ebp
  a4c0b9:	8d 45 f1             	lea    -0xf(%ebp),%eax
  a4c0bc:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4c0c1:	eb 0b                	jmp    a4c0ce <LZ4_decompress_safe_usingDict+0x38e>
  a4c0c3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4c0c8:	40                   	inc    %eax
  a4c0c9:	80 ff ff             	cmp    $0xff,%bh
  a4c0cc:	75 0f                	jne    a4c0dd <LZ4_decompress_safe_usingDict+0x39d>
  a4c0ce:	0f b6 3e             	movzbl (%esi),%edi
  a4c0d1:	48                   	dec    %eax
  a4c0d2:	83 c6 01             	add    $0x1,%esi
  a4c0d5:	48                   	dec    %eax
  a4c0d6:	01 f8                	add    %edi,%eax
  a4c0d8:	49                   	dec    %ecx
  a4c0d9:	39 f0                	cmp    %esi,%eax
  a4c0db:	77 eb                	ja     a4c0c8 <LZ4_decompress_safe_usingDict+0x388>
  a4c0dd:	48                   	dec    %eax
  a4c0de:	89 df                	mov    %ebx,%edi
  a4c0e0:	48                   	dec    %eax
  a4c0e1:	01 c7                	add    %eax,%edi
  a4c0e3:	0f 82 07 ff ff ff    	jb     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c0e9:	48                   	dec    %eax
  a4c0ea:	89 f5                	mov    %esi,%ebp
  a4c0ec:	48                   	dec    %eax
  a4c0ed:	01 c5                	add    %eax,%ebp
  a4c0ef:	0f 83 d6 fd ff ff    	jae    a4becb <LZ4_decompress_safe_usingDict+0x18b>
  a4c0f5:	e9 f6 fe ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c0fa:	4c                   	dec    %esp
  a4c0fb:	01 e2                	add    %esp,%edx
  a4c0fd:	41                   	inc    %ecx
  a4c0fe:	81 f9 fe ff 00 00    	cmp    $0xfffe,%ecx
  a4c104:	0f 8e 18 02 00 00    	jle    a4c322 <LZ4_decompress_safe_usingDict+0x5e2>
  a4c10a:	4d                   	dec    %ebp
  a4c10b:	8d 8c 24 00 00 ff ff 	lea    -0x10000(%esp),%ecx
  a4c112:	85 c0                	test   %eax,%eax
  a4c114:	0f 84 f7 00 00 00    	je     a4c211 <LZ4_decompress_safe_usingDict+0x4d1>
  a4c11a:	48                   	dec    %eax
  a4c11b:	8d 42 fb             	lea    -0x5(%edx),%eax
  a4c11e:	4d                   	dec    %ebp
  a4c11f:	8d 55 f1             	lea    -0xf(%ebp),%edx
  a4c122:	48                   	dec    %eax
  a4c123:	89 44 24 08          	mov    %eax,0x8(%esp)
  a4c127:	4c                   	dec    %esp
  a4c128:	8d 42 f4             	lea    -0xc(%edx),%eax
  a4c12b:	4d                   	dec    %ebp
  a4c12c:	8d 75 f8             	lea    -0x8(%ebp),%esi
  a4c12f:	4d                   	dec    %ebp
  a4c130:	8d 5d fc             	lea    -0x4(%ebp),%ebx
  a4c133:	4c                   	dec    %esp
  a4c134:	8d 7a f9             	lea    -0x7(%edx),%edi
  a4c137:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
  a4c13b:	48                   	dec    %eax
  a4c13c:	8d 75 01             	lea    0x1(%ebp),%esi
  a4c13f:	89 c7                	mov    %eax,%edi
  a4c141:	c1 e8 04             	shr    $0x4,%eax
  a4c144:	89 c1                	mov    %eax,%ecx
  a4c146:	83 f8 0f             	cmp    $0xf,%eax
  a4c149:	0f 84 29 04 00 00    	je     a4c578 <LZ4_decompress_safe_usingDict+0x838>
  a4c14f:	49                   	dec    %ecx
  a4c150:	8d 1c 0c             	lea    (%esp,%ecx,1),%ebx
  a4c153:	48                   	dec    %eax
  a4c154:	8d 2c 0e             	lea    (%esi,%ecx,1),%ebp
  a4c157:	49                   	dec    %ecx
  a4c158:	39 d8                	cmp    %ebx,%eax
  a4c15a:	0f 82 11 06 00 00    	jb     a4c771 <LZ4_decompress_safe_usingDict+0xa31>
  a4c160:	4c                   	dec    %esp
  a4c161:	39 f5                	cmp    %esi,%ebp
  a4c163:	0f 87 08 06 00 00    	ja     a4c771 <LZ4_decompress_safe_usingDict+0xa31>
  a4c169:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4c170:	48                   	dec    %eax
  a4c171:	8b 06                	mov    (%esi),%eax
  a4c173:	49                   	dec    %ecx
  a4c174:	83 c4 08             	add    $0x8,%esp
  a4c177:	48                   	dec    %eax
  a4c178:	83 c6 08             	add    $0x8,%esi
  a4c17b:	49                   	dec    %ecx
  a4c17c:	89 44 24 f8          	mov    %eax,-0x8(%esp)
  a4c180:	49                   	dec    %ecx
  a4c181:	39 dc                	cmp    %ebx,%esp
  a4c183:	72 eb                	jb     a4c170 <LZ4_decompress_safe_usingDict+0x430>
  a4c185:	0f b7 4d 00          	movzwl 0x0(%ebp),%ecx
  a4c189:	48                   	dec    %eax
  a4c18a:	89 de                	mov    %ebx,%esi
  a4c18c:	48                   	dec    %eax
  a4c18d:	83 c5 02             	add    $0x2,%ebp
  a4c190:	48                   	dec    %eax
  a4c191:	29 ce                	sub    %ecx,%esi
  a4c193:	49                   	dec    %ecx
  a4c194:	39 f1                	cmp    %esi,%ecx
  a4c196:	0f 87 54 fe ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c19c:	41                   	inc    %ecx
  a4c19d:	89 fc                	mov    %edi,%esp
  a4c19f:	48                   	dec    %eax
  a4c1a0:	89 f8                	mov    %edi,%eax
  a4c1a2:	89 0b                	mov    %ecx,(%ebx)
  a4c1a4:	41                   	inc    %ecx
  a4c1a5:	83 e4 0f             	and    $0xf,%esp
  a4c1a8:	83 e0 0f             	and    $0xf,%eax
  a4c1ab:	41                   	inc    %ecx
  a4c1ac:	80 fc 0f             	cmp    $0xf,%ah
  a4c1af:	0f 84 30 04 00 00    	je     a4c5e5 <LZ4_decompress_safe_usingDict+0x8a5>
  a4c1b5:	48                   	dec    %eax
  a4c1b6:	8d 78 04             	lea    0x4(%eax),%edi
  a4c1b9:	4c                   	dec    %esp
  a4c1ba:	8d 24 3b             	lea    (%ebx,%edi,1),%esp
  a4c1bd:	48                   	dec    %eax
  a4c1be:	83 f9 07             	cmp    $0x7,%ecx
  a4c1c1:	0f 86 7c 04 00 00    	jbe    a4c643 <LZ4_decompress_safe_usingDict+0x903>
  a4c1c7:	48                   	dec    %eax
  a4c1c8:	8b 06                	mov    (%esi),%eax
  a4c1ca:	48                   	dec    %eax
  a4c1cb:	89 03                	mov    %eax,(%ebx)
  a4c1cd:	48                   	dec    %eax
  a4c1ce:	8d 46 08             	lea    0x8(%esi),%eax
  a4c1d1:	4d                   	dec    %ebp
  a4c1d2:	39 e0                	cmp    %esp,%eax
  a4c1d4:	0f 82 a8 04 00 00    	jb     a4c682 <LZ4_decompress_safe_usingDict+0x942>
  a4c1da:	48                   	dec    %eax
  a4c1db:	8b 08                	mov    (%eax),%ecx
  a4c1dd:	48                   	dec    %eax
  a4c1de:	89 4b 08             	mov    %ecx,0x8(%ebx)
  a4c1e1:	48                   	dec    %eax
  a4c1e2:	83 ff 10             	cmp    $0x10,%edi
  a4c1e5:	0f 86 4c ff ff ff    	jbe    a4c137 <LZ4_decompress_safe_usingDict+0x3f7>
  a4c1eb:	48                   	dec    %eax
  a4c1ec:	83 c0 08             	add    $0x8,%eax
  a4c1ef:	48                   	dec    %eax
  a4c1f0:	83 c3 10             	add    $0x10,%ebx
  a4c1f3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4c1f8:	48                   	dec    %eax
  a4c1f9:	8b 08                	mov    (%eax),%ecx
  a4c1fb:	48                   	dec    %eax
  a4c1fc:	83 c3 08             	add    $0x8,%ebx
  a4c1ff:	48                   	dec    %eax
  a4c200:	83 c0 08             	add    $0x8,%eax
  a4c203:	48                   	dec    %eax
  a4c204:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  a4c207:	49                   	dec    %ecx
  a4c208:	39 dc                	cmp    %ebx,%esp
  a4c20a:	77 ec                	ja     a4c1f8 <LZ4_decompress_safe_usingDict+0x4b8>
  a4c20c:	e9 26 ff ff ff       	jmp    a4c137 <LZ4_decompress_safe_usingDict+0x3f7>
  a4c211:	83 fe 01             	cmp    $0x1,%esi
  a4c214:	0f 85 d6 fd ff ff    	jne    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c21a:	31 c0                	xor    %eax,%eax
  a4c21c:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
  a4c220:	0f 84 cf fd ff ff    	je     a4bff5 <LZ4_decompress_safe_usingDict+0x2b5>
  a4c226:	e9 c5 fd ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c22b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4c230:	4d                   	dec    %ebp
  a4c231:	8d 55 fc             	lea    -0x4(%ebp),%edx
  a4c234:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4c239:	eb 14                	jmp    a4c24f <LZ4_decompress_safe_usingDict+0x50f>
  a4c23b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4c240:	44                   	inc    %esp
  a4c241:	0f b6 c8             	movzbl %al,%ecx
  a4c244:	4c                   	dec    %esp
  a4c245:	01 ca                	add    %ecx,%edx
  a4c247:	3c ff                	cmp    $0xff,%al
  a4c249:	0f 85 c2 00 00 00    	jne    a4c311 <LZ4_decompress_safe_usingDict+0x5d1>
  a4c24f:	48                   	dec    %eax
  a4c250:	83 c5 01             	add    $0x1,%ebp
  a4c253:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  a4c257:	49                   	dec    %ecx
  a4c258:	39 ea                	cmp    %ebp,%edx
  a4c25a:	75 e4                	jne    a4c240 <LZ4_decompress_safe_usingDict+0x500>
  a4c25c:	e9 8f fd ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c261:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4c268:	e8 f3 19 00 00       	call   a4dc60 <memmove>
  a4c26d:	e9 39 fc ff ff       	jmp    a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c272:	48                   	dec    %eax
  a4c273:	3b 7c 24 08          	cmp    0x8(%esp),%edi
  a4c277:	0f 87 73 fd ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c27d:	48                   	dec    %eax
  a4c27e:	83 c3 08             	add    $0x8,%ebx
  a4c281:	4c                   	dec    %esp
  a4c282:	39 f3                	cmp    %esi,%ebx
  a4c284:	0f 82 27 03 00 00    	jb     a4c5b1 <LZ4_decompress_safe_usingDict+0x871>
  a4c28a:	48                   	dec    %eax
  a4c28b:	39 df                	cmp    %ebx,%edi
  a4c28d:	0f 86 08 fb ff ff    	jbe    a4bd9b <LZ4_decompress_safe_usingDict+0x5b>
  a4c293:	49                   	dec    %ecx
  a4c294:	89 ff                	mov    %edi,%edi
  a4c296:	31 c9                	xor    %ecx,%ecx
  a4c298:	49                   	dec    %ecx
  a4c299:	29 df                	sub    %ebx,%edi
  a4c29b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4c2a0:	0f b6 34 08          	movzbl (%eax,%ecx,1),%esi
  a4c2a4:	40                   	inc    %eax
  a4c2a5:	88 34 0b             	mov    %dh,(%ebx,%ecx,1)
  a4c2a8:	48                   	dec    %eax
  a4c2a9:	83 c1 01             	add    $0x1,%ecx
  a4c2ac:	49                   	dec    %ecx
  a4c2ad:	39 cf                	cmp    %ecx,%edi
  a4c2af:	75 ef                	jne    a4c2a0 <LZ4_decompress_safe_usingDict+0x560>
  a4c2b1:	e9 e5 fa ff ff       	jmp    a4bd9b <LZ4_decompress_safe_usingDict+0x5b>
  a4c2b6:	44                   	inc    %esp
  a4c2b7:	0f b6 38             	movzbl (%eax),%edi
  a4c2ba:	44                   	inc    %esp
  a4c2bb:	88 3b                	mov    %bh,(%ebx)
  a4c2bd:	44                   	inc    %esp
  a4c2be:	0f b6 78 01          	movzbl 0x1(%eax),%edi
  a4c2c2:	44                   	inc    %esp
  a4c2c3:	88 7b 01             	mov    %bh,0x1(%ebx)
  a4c2c6:	44                   	inc    %esp
  a4c2c7:	0f b6 78 02          	movzbl 0x2(%eax),%edi
  a4c2cb:	44                   	inc    %esp
  a4c2cc:	88 7b 02             	mov    %bh,0x2(%ebx)
  a4c2cf:	44                   	inc    %esp
  a4c2d0:	0f b6 78 03          	movzbl 0x3(%eax),%edi
  a4c2d4:	44                   	inc    %esp
  a4c2d5:	88 7b 03             	mov    %bh,0x3(%ebx)
  a4c2d8:	4c                   	dec    %esp
  a4c2d9:	8d 3d c1 7c 00 00    	lea    0x7cc1,%edi
  a4c2df:	45                   	inc    %ebp
  a4c2e0:	8b 3c b7             	mov    (%edi,%esi,4),%edi
  a4c2e3:	4c                   	dec    %esp
  a4c2e4:	01 f8                	add    %edi,%eax
  a4c2e6:	44                   	inc    %esp
  a4c2e7:	8b 38                	mov    (%eax),%edi
  a4c2e9:	44                   	inc    %esp
  a4c2ea:	89 7b 04             	mov    %edi,0x4(%ebx)
  a4c2ed:	4c                   	dec    %esp
  a4c2ee:	8d 3d cc 7c 00 00    	lea    0x7ccc,%edi
  a4c2f4:	49                   	dec    %ecx
  a4c2f5:	63 34 b7             	arpl   %si,(%edi,%esi,4)
  a4c2f8:	48                   	dec    %eax
  a4c2f9:	29 f0                	sub    %esi,%eax
  a4c2fb:	e9 2b fb ff ff       	jmp    a4be2b <LZ4_decompress_safe_usingDict+0xeb>
  a4c300:	48                   	dec    %eax
  a4c301:	89 df                	mov    %ebx,%edi
  a4c303:	48                   	dec    %eax
  a4c304:	01 cf                	add    %ecx,%edi
  a4c306:	0f 83 03 fb ff ff    	jae    a4be0f <LZ4_decompress_safe_usingDict+0xcf>
  a4c30c:	e9 df fc ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c311:	48                   	dec    %eax
  a4c312:	89 f8                	mov    %edi,%eax
  a4c314:	48                   	dec    %eax
  a4c315:	01 d0                	add    %edx,%eax
  a4c317:	0f 83 17 fc ff ff    	jae    a4bf34 <LZ4_decompress_safe_usingDict+0x1f4>
  a4c31d:	e9 ce fc ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c322:	85 c0                	test   %eax,%eax
  a4c324:	0f 84 e7 fe ff ff    	je     a4c211 <LZ4_decompress_safe_usingDict+0x4d1>
  a4c32a:	48                   	dec    %eax
  a4c32b:	8d 42 fb             	lea    -0x5(%edx),%eax
  a4c32e:	4d                   	dec    %ebp
  a4c32f:	8d 55 f1             	lea    -0xf(%ebp),%edx
  a4c332:	48                   	dec    %eax
  a4c333:	89 44 24 08          	mov    %eax,0x8(%esp)
  a4c337:	4c                   	dec    %esp
  a4c338:	8d 4a f4             	lea    -0xc(%edx),%ecx
  a4c33b:	4d                   	dec    %ebp
  a4c33c:	8d 75 f8             	lea    -0x8(%ebp),%esi
  a4c33f:	4d                   	dec    %ebp
  a4c340:	8d 5d fc             	lea    -0x4(%ebp),%ebx
  a4c343:	4c                   	dec    %esp
  a4c344:	8d 7a f9             	lea    -0x7(%edx),%edi
  a4c347:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
  a4c34b:	48                   	dec    %eax
  a4c34c:	8d 75 01             	lea    0x1(%ebp),%esi
  a4c34f:	89 c7                	mov    %eax,%edi
  a4c351:	c1 e8 04             	shr    $0x4,%eax
  a4c354:	89 c1                	mov    %eax,%ecx
  a4c356:	83 f8 0f             	cmp    $0xf,%eax
  a4c359:	0f 84 d6 01 00 00    	je     a4c535 <LZ4_decompress_safe_usingDict+0x7f5>
  a4c35f:	49                   	dec    %ecx
  a4c360:	8d 1c 0c             	lea    (%esp,%ecx,1),%ebx
  a4c363:	48                   	dec    %eax
  a4c364:	8d 2c 0e             	lea    (%esi,%ecx,1),%ebp
  a4c367:	49                   	dec    %ecx
  a4c368:	39 d9                	cmp    %ebx,%ecx
  a4c36a:	0f 82 29 04 00 00    	jb     a4c799 <LZ4_decompress_safe_usingDict+0xa59>
  a4c370:	4c                   	dec    %esp
  a4c371:	39 f5                	cmp    %esi,%ebp
  a4c373:	0f 87 20 04 00 00    	ja     a4c799 <LZ4_decompress_safe_usingDict+0xa59>
  a4c379:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4c380:	48                   	dec    %eax
  a4c381:	8b 06                	mov    (%esi),%eax
  a4c383:	49                   	dec    %ecx
  a4c384:	83 c4 08             	add    $0x8,%esp
  a4c387:	48                   	dec    %eax
  a4c388:	83 c6 08             	add    $0x8,%esi
  a4c38b:	49                   	dec    %ecx
  a4c38c:	89 44 24 f8          	mov    %eax,-0x8(%esp)
  a4c390:	49                   	dec    %ecx
  a4c391:	39 dc                	cmp    %ebx,%esp
  a4c393:	72 eb                	jb     a4c380 <LZ4_decompress_safe_usingDict+0x640>
  a4c395:	0f b7 4d 00          	movzwl 0x0(%ebp),%ecx
  a4c399:	48                   	dec    %eax
  a4c39a:	89 de                	mov    %ebx,%esi
  a4c39c:	48                   	dec    %eax
  a4c39d:	83 c5 02             	add    $0x2,%ebp
  a4c3a0:	48                   	dec    %eax
  a4c3a1:	29 ce                	sub    %ecx,%esi
  a4c3a3:	49                   	dec    %ecx
  a4c3a4:	39 f0                	cmp    %esi,%eax
  a4c3a6:	0f 87 44 fc ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c3ac:	41                   	inc    %ecx
  a4c3ad:	89 fc                	mov    %edi,%esp
  a4c3af:	48                   	dec    %eax
  a4c3b0:	89 f8                	mov    %edi,%eax
  a4c3b2:	89 0b                	mov    %ecx,(%ebx)
  a4c3b4:	41                   	inc    %ecx
  a4c3b5:	83 e4 0f             	and    $0xf,%esp
  a4c3b8:	83 e0 0f             	and    $0xf,%eax
  a4c3bb:	41                   	inc    %ecx
  a4c3bc:	80 fc 0f             	cmp    $0xf,%ah
  a4c3bf:	0f 84 4e 02 00 00    	je     a4c613 <LZ4_decompress_safe_usingDict+0x8d3>
  a4c3c5:	48                   	dec    %eax
  a4c3c6:	8d 78 04             	lea    0x4(%eax),%edi
  a4c3c9:	4c                   	dec    %esp
  a4c3ca:	8d 24 3b             	lea    (%ebx,%edi,1),%esp
  a4c3cd:	48                   	dec    %eax
  a4c3ce:	83 f9 07             	cmp    $0x7,%ecx
  a4c3d1:	0f 86 2f 03 00 00    	jbe    a4c706 <LZ4_decompress_safe_usingDict+0x9c6>
  a4c3d7:	48                   	dec    %eax
  a4c3d8:	8b 06                	mov    (%esi),%eax
  a4c3da:	48                   	dec    %eax
  a4c3db:	89 03                	mov    %eax,(%ebx)
  a4c3dd:	48                   	dec    %eax
  a4c3de:	8d 46 08             	lea    0x8(%esi),%eax
  a4c3e1:	4d                   	dec    %ebp
  a4c3e2:	39 e1                	cmp    %esp,%ecx
  a4c3e4:	0f 82 dc 02 00 00    	jb     a4c6c6 <LZ4_decompress_safe_usingDict+0x986>
  a4c3ea:	48                   	dec    %eax
  a4c3eb:	8b 08                	mov    (%eax),%ecx
  a4c3ed:	48                   	dec    %eax
  a4c3ee:	89 4b 08             	mov    %ecx,0x8(%ebx)
  a4c3f1:	48                   	dec    %eax
  a4c3f2:	83 ff 10             	cmp    $0x10,%edi
  a4c3f5:	0f 86 4c ff ff ff    	jbe    a4c347 <LZ4_decompress_safe_usingDict+0x607>
  a4c3fb:	48                   	dec    %eax
  a4c3fc:	83 c0 08             	add    $0x8,%eax
  a4c3ff:	48                   	dec    %eax
  a4c400:	83 c3 10             	add    $0x10,%ebx
  a4c403:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4c408:	48                   	dec    %eax
  a4c409:	8b 08                	mov    (%eax),%ecx
  a4c40b:	48                   	dec    %eax
  a4c40c:	83 c3 08             	add    $0x8,%ebx
  a4c40f:	48                   	dec    %eax
  a4c410:	83 c0 08             	add    $0x8,%eax
  a4c413:	48                   	dec    %eax
  a4c414:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  a4c417:	49                   	dec    %ecx
  a4c418:	39 dc                	cmp    %ebx,%esp
  a4c41a:	77 ec                	ja     a4c408 <LZ4_decompress_safe_usingDict+0x6c8>
  a4c41c:	e9 26 ff ff ff       	jmp    a4c347 <LZ4_decompress_safe_usingDict+0x607>
  a4c421:	48                   	dec    %eax
  a4c422:	39 da                	cmp    %ebx,%edx
  a4c424:	0f 82 c6 fb ff ff    	jb     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c42a:	4c                   	dec    %esp
  a4c42b:	39 ed                	cmp    %ebp,%ebp
  a4c42d:	0f 85 bd fb ff ff    	jne    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c433:	4c                   	dec    %esp
  a4c434:	89 fa                	mov    %edi,%edx
  a4c436:	e8 85 18 00 00       	call   a4dcc0 <memcpy>
  a4c43b:	89 d8                	mov    %ebx,%eax
  a4c43d:	44                   	inc    %esp
  a4c43e:	29 e0                	sub    %esp,%eax
  a4c440:	e9 b0 fb ff ff       	jmp    a4bff5 <LZ4_decompress_safe_usingDict+0x2b5>
  a4c445:	49                   	dec    %ecx
  a4c446:	8d 57 fb             	lea    -0x5(%edi),%edx
  a4c449:	48                   	dec    %eax
  a4c44a:	39 d3                	cmp    %edx,%ebx
  a4c44c:	0f 87 9e fb ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c452:	48                   	dec    %eax
  a4c453:	83 c7 08             	add    $0x8,%edi
  a4c456:	48                   	dec    %eax
  a4c457:	3b 7c 24 28          	cmp    0x28(%esp),%edi
  a4c45b:	0f 82 9f 00 00 00    	jb     a4c500 <LZ4_decompress_safe_usingDict+0x7c0>
  a4c461:	48                   	dec    %eax
  a4c462:	39 fb                	cmp    %edi,%ebx
  a4c464:	0f 86 41 fa ff ff    	jbe    a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c46a:	48                   	dec    %eax
  a4c46b:	89 de                	mov    %ebx,%esi
  a4c46d:	31 d2                	xor    %edx,%edx
  a4c46f:	48                   	dec    %eax
  a4c470:	29 fe                	sub    %edi,%esi
  a4c472:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4c478:	0f b6 0c 10          	movzbl (%eax,%edx,1),%ecx
  a4c47c:	88 0c 17             	mov    %cl,(%edi,%edx,1)
  a4c47f:	48                   	dec    %eax
  a4c480:	83 c2 01             	add    $0x1,%edx
  a4c483:	48                   	dec    %eax
  a4c484:	39 d6                	cmp    %edx,%esi
  a4c486:	75 f0                	jne    a4c478 <LZ4_decompress_safe_usingDict+0x738>
  a4c488:	e9 1e fa ff ff       	jmp    a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c48d:	0f b6 06             	movzbl (%esi),%eax
  a4c490:	88 07                	mov    %al,(%edi)
  a4c492:	0f b6 46 01          	movzbl 0x1(%esi),%eax
  a4c496:	88 47 01             	mov    %al,0x1(%edi)
  a4c499:	0f b6 46 02          	movzbl 0x2(%esi),%eax
  a4c49d:	88 47 02             	mov    %al,0x2(%edi)
  a4c4a0:	0f b6 46 03          	movzbl 0x3(%esi),%eax
  a4c4a4:	88 47 03             	mov    %al,0x3(%edi)
  a4c4a7:	48                   	dec    %eax
  a4c4a8:	8d 05 f2 7a 00 00    	lea    0x7af2,%eax
  a4c4ae:	42                   	inc    %edx
  a4c4af:	8b 04 80             	mov    (%eax,%eax,4),%eax
  a4c4b2:	48                   	dec    %eax
  a4c4b3:	01 f0                	add    %esi,%eax
  a4c4b5:	8b 30                	mov    (%eax),%esi
  a4c4b7:	89 77 04             	mov    %esi,0x4(%edi)
  a4c4ba:	48                   	dec    %eax
  a4c4bb:	8d 35 ff 7a 00 00    	lea    0x7aff,%esi
  a4c4c1:	4a                   	dec    %edx
  a4c4c2:	63 34 86             	arpl   %si,(%esi,%eax,4)
  a4c4c5:	48                   	dec    %eax
  a4c4c6:	29 f0                	sub    %esi,%eax
  a4c4c8:	e9 4f fb ff ff       	jmp    a4c01c <LZ4_decompress_safe_usingDict+0x2dc>
  a4c4cd:	49                   	dec    %ecx
  a4c4ce:	89 fe                	mov    %edi,%esi
  a4c4d0:	48                   	dec    %eax
  a4c4d1:	89 c2                	mov    %eax,%edx
  a4c4d3:	49                   	dec    %ecx
  a4c4d4:	39 ed                	cmp    %ebp,%ebp
  a4c4d6:	0f 85 14 fb ff ff    	jne    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c4dc:	4c                   	dec    %esp
  a4c4dd:	39 ff                	cmp    %edi,%edi
  a4c4df:	0f 87 0b fb ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c4e5:	48                   	dec    %eax
  a4c4e6:	89 df                	mov    %ebx,%edi
  a4c4e8:	e8 d3 17 00 00       	call   a4dcc0 <memcpy>
  a4c4ed:	44                   	inc    %esp
  a4c4ee:	89 f0                	mov    %esi,%eax
  a4c4f0:	44                   	inc    %esp
  a4c4f1:	29 e0                	sub    %esp,%eax
  a4c4f3:	e9 fd fa ff ff       	jmp    a4bff5 <LZ4_decompress_safe_usingDict+0x2b5>
  a4c4f8:	48                   	dec    %eax
  a4c4f9:	89 fb                	mov    %edi,%ebx
  a4c4fb:	e9 ab f9 ff ff       	jmp    a4beab <LZ4_decompress_safe_usingDict+0x16b>
  a4c500:	4c                   	dec    %esp
  a4c501:	8b 44 24 28          	mov    0x28(%esp),%eax
  a4c505:	48                   	dec    %eax
  a4c506:	89 c1                	mov    %eax,%ecx
  a4c508:	48                   	dec    %eax
  a4c509:	89 fa                	mov    %edi,%edx
  a4c50b:	48                   	dec    %eax
  a4c50c:	8b 31                	mov    (%ecx),%esi
  a4c50e:	48                   	dec    %eax
  a4c50f:	83 c2 08             	add    $0x8,%edx
  a4c512:	48                   	dec    %eax
  a4c513:	83 c1 08             	add    $0x8,%ecx
  a4c516:	48                   	dec    %eax
  a4c517:	89 72 f8             	mov    %esi,-0x8(%edx)
  a4c51a:	49                   	dec    %ecx
  a4c51b:	39 d0                	cmp    %edx,%eax
  a4c51d:	77 ec                	ja     a4c50b <LZ4_decompress_safe_usingDict+0x7cb>
  a4c51f:	48                   	dec    %eax
  a4c520:	8b 4c 24 28          	mov    0x28(%esp),%ecx
  a4c524:	48                   	dec    %eax
  a4c525:	89 ca                	mov    %ecx,%edx
  a4c527:	48                   	dec    %eax
  a4c528:	29 fa                	sub    %edi,%edx
  a4c52a:	48                   	dec    %eax
  a4c52b:	89 cf                	mov    %ecx,%edi
  a4c52d:	48                   	dec    %eax
  a4c52e:	01 d0                	add    %edx,%eax
  a4c530:	e9 2c ff ff ff       	jmp    a4c461 <LZ4_decompress_safe_usingDict+0x721>
  a4c535:	b9 0f 00 00 00       	mov    $0xf,%ecx
  a4c53a:	eb 09                	jmp    a4c545 <LZ4_decompress_safe_usingDict+0x805>
  a4c53c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4c540:	80 fb ff             	cmp    $0xff,%bl
  a4c543:	75 0f                	jne    a4c554 <LZ4_decompress_safe_usingDict+0x814>
  a4c545:	0f b6 1e             	movzbl (%esi),%ebx
  a4c548:	48                   	dec    %eax
  a4c549:	83 c6 01             	add    $0x1,%esi
  a4c54c:	48                   	dec    %eax
  a4c54d:	01 d9                	add    %ebx,%ecx
  a4c54f:	4c                   	dec    %esp
  a4c550:	39 d6                	cmp    %edx,%esi
  a4c552:	72 ec                	jb     a4c540 <LZ4_decompress_safe_usingDict+0x800>
  a4c554:	4c                   	dec    %esp
  a4c555:	89 e3                	mov    %esp,%ebx
  a4c557:	48                   	dec    %eax
  a4c558:	01 cb                	add    %ecx,%ebx
  a4c55a:	0f 82 90 fa ff ff    	jb     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c560:	48                   	dec    %eax
  a4c561:	89 f5                	mov    %esi,%ebp
  a4c563:	48                   	dec    %eax
  a4c564:	01 cd                	add    %ecx,%ebp
  a4c566:	0f 83 fb fd ff ff    	jae    a4c367 <LZ4_decompress_safe_usingDict+0x627>
  a4c56c:	e9 7f fa ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c571:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4c578:	b9 0f 00 00 00       	mov    $0xf,%ecx
  a4c57d:	eb 06                	jmp    a4c585 <LZ4_decompress_safe_usingDict+0x845>
  a4c57f:	90                   	nop
  a4c580:	80 fb ff             	cmp    $0xff,%bl
  a4c583:	75 0f                	jne    a4c594 <LZ4_decompress_safe_usingDict+0x854>
  a4c585:	0f b6 1e             	movzbl (%esi),%ebx
  a4c588:	48                   	dec    %eax
  a4c589:	83 c6 01             	add    $0x1,%esi
  a4c58c:	48                   	dec    %eax
  a4c58d:	01 d9                	add    %ebx,%ecx
  a4c58f:	4c                   	dec    %esp
  a4c590:	39 d6                	cmp    %edx,%esi
  a4c592:	72 ec                	jb     a4c580 <LZ4_decompress_safe_usingDict+0x840>
  a4c594:	4c                   	dec    %esp
  a4c595:	89 e3                	mov    %esp,%ebx
  a4c597:	48                   	dec    %eax
  a4c598:	01 cb                	add    %ecx,%ebx
  a4c59a:	0f 82 50 fa ff ff    	jb     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c5a0:	48                   	dec    %eax
  a4c5a1:	89 f5                	mov    %esi,%ebp
  a4c5a3:	48                   	dec    %eax
  a4c5a4:	01 cd                	add    %ecx,%ebp
  a4c5a6:	0f 83 ab fb ff ff    	jae    a4c157 <LZ4_decompress_safe_usingDict+0x417>
  a4c5ac:	e9 3f fa ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c5b1:	48                   	dec    %eax
  a4c5b2:	89 c6                	mov    %eax,%esi
  a4c5b4:	48                   	dec    %eax
  a4c5b5:	89 d9                	mov    %ebx,%ecx
  a4c5b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4c5be:	00 00 
  a4c5c0:	4c                   	dec    %esp
  a4c5c1:	8b 3e                	mov    (%esi),%edi
  a4c5c3:	48                   	dec    %eax
  a4c5c4:	83 c1 08             	add    $0x8,%ecx
  a4c5c7:	48                   	dec    %eax
  a4c5c8:	83 c6 08             	add    $0x8,%esi
  a4c5cb:	4c                   	dec    %esp
  a4c5cc:	89 79 f8             	mov    %edi,-0x8(%ecx)
  a4c5cf:	49                   	dec    %ecx
  a4c5d0:	39 ce                	cmp    %ecx,%esi
  a4c5d2:	77 ec                	ja     a4c5c0 <LZ4_decompress_safe_usingDict+0x880>
  a4c5d4:	4c                   	dec    %esp
  a4c5d5:	89 f1                	mov    %esi,%ecx
  a4c5d7:	48                   	dec    %eax
  a4c5d8:	29 d9                	sub    %ebx,%ecx
  a4c5da:	4c                   	dec    %esp
  a4c5db:	89 f3                	mov    %esi,%ebx
  a4c5dd:	48                   	dec    %eax
  a4c5de:	01 c8                	add    %ecx,%eax
  a4c5e0:	e9 a5 fc ff ff       	jmp    a4c28a <LZ4_decompress_safe_usingDict+0x54a>
  a4c5e5:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4c5ea:	eb 15                	jmp    a4c601 <LZ4_decompress_safe_usingDict+0x8c1>
  a4c5ec:	0f 1f 40 00          	nopl   0x0(%eax)
  a4c5f0:	44                   	inc    %esp
  a4c5f1:	0f b6 e7             	movzbl %bh,%esp
  a4c5f4:	4c                   	dec    %esp
  a4c5f5:	01 e0                	add    %esp,%eax
  a4c5f7:	40                   	inc    %eax
  a4c5f8:	80 ff ff             	cmp    $0xff,%bh
  a4c5fb:	0f 85 5f 01 00 00    	jne    a4c760 <LZ4_decompress_safe_usingDict+0xa20>
  a4c601:	48                   	dec    %eax
  a4c602:	83 c5 01             	add    $0x1,%ebp
  a4c605:	0f b6 7d ff          	movzbl -0x1(%ebp),%edi
  a4c609:	4c                   	dec    %esp
  a4c60a:	39 dd                	cmp    %ebx,%ebp
  a4c60c:	75 e2                	jne    a4c5f0 <LZ4_decompress_safe_usingDict+0x8b0>
  a4c60e:	e9 dd f9 ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c613:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4c618:	eb 17                	jmp    a4c631 <LZ4_decompress_safe_usingDict+0x8f1>
  a4c61a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4c620:	44                   	inc    %esp
  a4c621:	0f b6 e7             	movzbl %bh,%esp
  a4c624:	4c                   	dec    %esp
  a4c625:	01 e0                	add    %esp,%eax
  a4c627:	40                   	inc    %eax
  a4c628:	80 ff ff             	cmp    $0xff,%bh
  a4c62b:	0f 85 14 01 00 00    	jne    a4c745 <LZ4_decompress_safe_usingDict+0xa05>
  a4c631:	48                   	dec    %eax
  a4c632:	83 c5 01             	add    $0x1,%ebp
  a4c635:	0f b6 7d ff          	movzbl -0x1(%ebp),%edi
  a4c639:	49                   	dec    %ecx
  a4c63a:	39 eb                	cmp    %ebp,%ebx
  a4c63c:	75 e2                	jne    a4c620 <LZ4_decompress_safe_usingDict+0x8e0>
  a4c63e:	e9 ad f9 ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c643:	0f b6 06             	movzbl (%esi),%eax
  a4c646:	88 03                	mov    %al,(%ebx)
  a4c648:	0f b6 46 01          	movzbl 0x1(%esi),%eax
  a4c64c:	88 43 01             	mov    %al,0x1(%ebx)
  a4c64f:	0f b6 46 02          	movzbl 0x2(%esi),%eax
  a4c653:	88 43 02             	mov    %al,0x2(%ebx)
  a4c656:	0f b6 46 03          	movzbl 0x3(%esi),%eax
  a4c65a:	88 43 03             	mov    %al,0x3(%ebx)
  a4c65d:	48                   	dec    %eax
  a4c65e:	8d 05 3c 79 00 00    	lea    0x793c,%eax
  a4c664:	8b 04 88             	mov    (%eax,%ecx,4),%eax
  a4c667:	48                   	dec    %eax
  a4c668:	01 f0                	add    %esi,%eax
  a4c66a:	8b 30                	mov    (%eax),%esi
  a4c66c:	89 73 04             	mov    %esi,0x4(%ebx)
  a4c66f:	48                   	dec    %eax
  a4c670:	8d 35 4a 79 00 00    	lea    0x794a,%esi
  a4c676:	48                   	dec    %eax
  a4c677:	63 0c 8e             	arpl   %cx,(%esi,%ecx,4)
  a4c67a:	48                   	dec    %eax
  a4c67b:	29 c8                	sub    %ecx,%eax
  a4c67d:	e9 4f fb ff ff       	jmp    a4c1d1 <LZ4_decompress_safe_usingDict+0x491>
  a4c682:	4c                   	dec    %esp
  a4c683:	3b 64 24 08          	cmp    0x8(%esp),%esp
  a4c687:	0f 87 63 f9 ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c68d:	48                   	dec    %eax
  a4c68e:	83 c3 08             	add    $0x8,%ebx
  a4c691:	4c                   	dec    %esp
  a4c692:	39 fb                	cmp    %edi,%ebx
  a4c694:	0f 82 41 01 00 00    	jb     a4c7db <LZ4_decompress_safe_usingDict+0xa9b>
  a4c69a:	49                   	dec    %ecx
  a4c69b:	39 dc                	cmp    %ebx,%esp
  a4c69d:	0f 86 94 fa ff ff    	jbe    a4c137 <LZ4_decompress_safe_usingDict+0x3f7>
  a4c6a3:	4c                   	dec    %esp
  a4c6a4:	89 e7                	mov    %esp,%edi
  a4c6a6:	31 c9                	xor    %ecx,%ecx
  a4c6a8:	48                   	dec    %eax
  a4c6a9:	29 df                	sub    %ebx,%edi
  a4c6ab:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4c6b0:	0f b6 34 08          	movzbl (%eax,%ecx,1),%esi
  a4c6b4:	40                   	inc    %eax
  a4c6b5:	88 34 0b             	mov    %dh,(%ebx,%ecx,1)
  a4c6b8:	48                   	dec    %eax
  a4c6b9:	83 c1 01             	add    $0x1,%ecx
  a4c6bc:	48                   	dec    %eax
  a4c6bd:	39 cf                	cmp    %ecx,%edi
  a4c6bf:	75 ef                	jne    a4c6b0 <LZ4_decompress_safe_usingDict+0x970>
  a4c6c1:	e9 71 fa ff ff       	jmp    a4c137 <LZ4_decompress_safe_usingDict+0x3f7>
  a4c6c6:	4c                   	dec    %esp
  a4c6c7:	3b 64 24 08          	cmp    0x8(%esp),%esp
  a4c6cb:	0f 87 1f f9 ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c6d1:	48                   	dec    %eax
  a4c6d2:	83 c3 08             	add    $0x8,%ebx
  a4c6d5:	4c                   	dec    %esp
  a4c6d6:	39 fb                	cmp    %edi,%ebx
  a4c6d8:	0f 82 d2 00 00 00    	jb     a4c7b0 <LZ4_decompress_safe_usingDict+0xa70>
  a4c6de:	49                   	dec    %ecx
  a4c6df:	39 dc                	cmp    %ebx,%esp
  a4c6e1:	0f 86 60 fc ff ff    	jbe    a4c347 <LZ4_decompress_safe_usingDict+0x607>
  a4c6e7:	4c                   	dec    %esp
  a4c6e8:	89 e7                	mov    %esp,%edi
  a4c6ea:	31 c9                	xor    %ecx,%ecx
  a4c6ec:	48                   	dec    %eax
  a4c6ed:	29 df                	sub    %ebx,%edi
  a4c6ef:	90                   	nop
  a4c6f0:	0f b6 34 08          	movzbl (%eax,%ecx,1),%esi
  a4c6f4:	40                   	inc    %eax
  a4c6f5:	88 34 0b             	mov    %dh,(%ebx,%ecx,1)
  a4c6f8:	48                   	dec    %eax
  a4c6f9:	83 c1 01             	add    $0x1,%ecx
  a4c6fc:	48                   	dec    %eax
  a4c6fd:	39 cf                	cmp    %ecx,%edi
  a4c6ff:	75 ef                	jne    a4c6f0 <LZ4_decompress_safe_usingDict+0x9b0>
  a4c701:	e9 41 fc ff ff       	jmp    a4c347 <LZ4_decompress_safe_usingDict+0x607>
  a4c706:	0f b6 06             	movzbl (%esi),%eax
  a4c709:	88 03                	mov    %al,(%ebx)
  a4c70b:	0f b6 46 01          	movzbl 0x1(%esi),%eax
  a4c70f:	88 43 01             	mov    %al,0x1(%ebx)
  a4c712:	0f b6 46 02          	movzbl 0x2(%esi),%eax
  a4c716:	88 43 02             	mov    %al,0x2(%ebx)
  a4c719:	0f b6 46 03          	movzbl 0x3(%esi),%eax
  a4c71d:	88 43 03             	mov    %al,0x3(%ebx)
  a4c720:	48                   	dec    %eax
  a4c721:	8d 05 79 78 00 00    	lea    0x7879,%eax
  a4c727:	8b 04 88             	mov    (%eax,%ecx,4),%eax
  a4c72a:	48                   	dec    %eax
  a4c72b:	01 f0                	add    %esi,%eax
  a4c72d:	8b 30                	mov    (%eax),%esi
  a4c72f:	89 73 04             	mov    %esi,0x4(%ebx)
  a4c732:	48                   	dec    %eax
  a4c733:	8d 35 87 78 00 00    	lea    0x7887,%esi
  a4c739:	48                   	dec    %eax
  a4c73a:	63 0c 8e             	arpl   %cx,(%esi,%ecx,4)
  a4c73d:	48                   	dec    %eax
  a4c73e:	29 c8                	sub    %ecx,%eax
  a4c740:	e9 9c fc ff ff       	jmp    a4c3e1 <LZ4_decompress_safe_usingDict+0x6a1>
  a4c745:	48                   	dec    %eax
  a4c746:	89 df                	mov    %ebx,%edi
  a4c748:	48                   	dec    %eax
  a4c749:	01 c7                	add    %eax,%edi
  a4c74b:	0f 83 74 fc ff ff    	jae    a4c3c5 <LZ4_decompress_safe_usingDict+0x685>
  a4c751:	e9 9a f8 ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c756:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4c75d:	00 00 00 
  a4c760:	48                   	dec    %eax
  a4c761:	89 df                	mov    %ebx,%edi
  a4c763:	48                   	dec    %eax
  a4c764:	01 c7                	add    %eax,%edi
  a4c766:	0f 83 49 fa ff ff    	jae    a4c1b5 <LZ4_decompress_safe_usingDict+0x475>
  a4c76c:	e9 7f f8 ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c771:	48                   	dec    %eax
  a4c772:	39 d3                	cmp    %edx,%ebx
  a4c774:	0f 87 76 f8 ff ff    	ja     a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c77a:	4c                   	dec    %esp
  a4c77b:	39 ed                	cmp    %ebp,%ebp
  a4c77d:	0f 85 6d f8 ff ff    	jne    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c783:	48                   	dec    %eax
  a4c784:	89 ca                	mov    %ecx,%edx
  a4c786:	4c                   	dec    %esp
  a4c787:	89 e7                	mov    %esp,%edi
  a4c789:	e8 32 15 00 00       	call   a4dcc0 <memcpy>
  a4c78e:	89 d8                	mov    %ebx,%eax
  a4c790:	2b 44 24 10          	sub    0x10(%esp),%eax
  a4c794:	e9 5c f8 ff ff       	jmp    a4bff5 <LZ4_decompress_safe_usingDict+0x2b5>
  a4c799:	49                   	dec    %ecx
  a4c79a:	39 ed                	cmp    %ebp,%ebp
  a4c79c:	0f 85 4e f8 ff ff    	jne    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c7a2:	48                   	dec    %eax
  a4c7a3:	39 d3                	cmp    %edx,%ebx
  a4c7a5:	76 dc                	jbe    a4c783 <LZ4_decompress_safe_usingDict+0xa43>
  a4c7a7:	e9 44 f8 ff ff       	jmp    a4bff0 <LZ4_decompress_safe_usingDict+0x2b0>
  a4c7ac:	0f 1f 40 00          	nopl   0x0(%eax)
  a4c7b0:	48                   	dec    %eax
  a4c7b1:	89 c6                	mov    %eax,%esi
  a4c7b3:	48                   	dec    %eax
  a4c7b4:	89 d9                	mov    %ebx,%ecx
  a4c7b6:	48                   	dec    %eax
  a4c7b7:	8b 3e                	mov    (%esi),%edi
  a4c7b9:	48                   	dec    %eax
  a4c7ba:	83 c1 08             	add    $0x8,%ecx
  a4c7bd:	48                   	dec    %eax
  a4c7be:	83 c6 08             	add    $0x8,%esi
  a4c7c1:	48                   	dec    %eax
  a4c7c2:	89 79 f8             	mov    %edi,-0x8(%ecx)
  a4c7c5:	49                   	dec    %ecx
  a4c7c6:	39 cf                	cmp    %ecx,%edi
  a4c7c8:	77 ec                	ja     a4c7b6 <LZ4_decompress_safe_usingDict+0xa76>
  a4c7ca:	4c                   	dec    %esp
  a4c7cb:	89 f9                	mov    %edi,%ecx
  a4c7cd:	48                   	dec    %eax
  a4c7ce:	29 d9                	sub    %ebx,%ecx
  a4c7d0:	4c                   	dec    %esp
  a4c7d1:	89 fb                	mov    %edi,%ebx
  a4c7d3:	48                   	dec    %eax
  a4c7d4:	01 c8                	add    %ecx,%eax
  a4c7d6:	e9 03 ff ff ff       	jmp    a4c6de <LZ4_decompress_safe_usingDict+0x99e>
  a4c7db:	48                   	dec    %eax
  a4c7dc:	89 c6                	mov    %eax,%esi
  a4c7de:	48                   	dec    %eax
  a4c7df:	89 d9                	mov    %ebx,%ecx
  a4c7e1:	48                   	dec    %eax
  a4c7e2:	8b 3e                	mov    (%esi),%edi
  a4c7e4:	48                   	dec    %eax
  a4c7e5:	83 c1 08             	add    $0x8,%ecx
  a4c7e8:	48                   	dec    %eax
  a4c7e9:	83 c6 08             	add    $0x8,%esi
  a4c7ec:	48                   	dec    %eax
  a4c7ed:	89 79 f8             	mov    %edi,-0x8(%ecx)
  a4c7f0:	49                   	dec    %ecx
  a4c7f1:	39 cf                	cmp    %ecx,%edi
  a4c7f3:	77 ec                	ja     a4c7e1 <LZ4_decompress_safe_usingDict+0xaa1>
  a4c7f5:	4c                   	dec    %esp
  a4c7f6:	89 f9                	mov    %edi,%ecx
  a4c7f8:	48                   	dec    %eax
  a4c7f9:	29 d9                	sub    %ebx,%ecx
  a4c7fb:	4c                   	dec    %esp
  a4c7fc:	89 fb                	mov    %edi,%ebx
  a4c7fe:	48                   	dec    %eax
  a4c7ff:	01 c8                	add    %ecx,%eax
  a4c801:	e9 94 fe ff ff       	jmp    a4c69a <LZ4_decompress_safe_usingDict+0x95a>
  a4c806:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4c80d:	00 00 00 

0000000000a4c810 <LZ4_decompress_fast_usingDict>:
  a4c810:	f3 0f 1e fa          	endbr64 
  a4c814:	41                   	inc    %ecx
  a4c815:	57                   	push   %edi
  a4c816:	44                   	inc    %esp
  a4c817:	89 c0                	mov    %eax,%eax
  a4c819:	41                   	inc    %ecx
  a4c81a:	56                   	push   %esi
  a4c81b:	41                   	inc    %ecx
  a4c81c:	55                   	push   %ebp
  a4c81d:	49                   	dec    %ecx
  a4c81e:	89 f5                	mov    %esi,%ebp
  a4c820:	48                   	dec    %eax
  a4c821:	63 f2                	arpl   %si,%dx
  a4c823:	41                   	inc    %ecx
  a4c824:	54                   	push   %esp
  a4c825:	55                   	push   %ebp
  a4c826:	53                   	push   %ebx
  a4c827:	48                   	dec    %eax
  a4c828:	83 ec 28             	sub    $0x28,%esp
  a4c82b:	44                   	inc    %esp
  a4c82c:	0f b6 07             	movzbl (%edi),%eax
  a4c82f:	48                   	dec    %eax
  a4c830:	89 7c 24 08          	mov    %edi,0x8(%esp)
  a4c834:	85 c0                	test   %eax,%eax
  a4c836:	0f 85 3e 02 00 00    	jne    a4ca7a <LZ4_decompress_fast_usingDict+0x26a>
  a4c83c:	4d                   	dec    %ebp
  a4c83d:	8d 5c 35 00          	lea    0x0(%ebp,%esi,1),%ebx
  a4c841:	85 d2                	test   %edx,%edx
  a4c843:	0f 84 2a 04 00 00    	je     a4cc73 <LZ4_decompress_fast_usingDict+0x463>
  a4c849:	49                   	dec    %ecx
  a4c84a:	89 fc                	mov    %edi,%esp
  a4c84c:	49                   	dec    %ecx
  a4c84d:	8d 73 f8             	lea    -0x8(%ebx),%esi
  a4c850:	49                   	dec    %ecx
  a4c851:	8d 7b f4             	lea    -0xc(%ebx),%edi
  a4c854:	4c                   	dec    %esp
  a4c855:	8d 3d 65 77 00 00    	lea    0x7765,%edi
  a4c85b:	4c                   	dec    %esp
  a4c85c:	8d 35 3e 77 00 00    	lea    0x773e,%esi
  a4c862:	4d                   	dec    %ebp
  a4c863:	8d 53 f9             	lea    -0x7(%ebx),%edx
  a4c866:	49                   	dec    %ecx
  a4c867:	8d 6b fb             	lea    -0x5(%ebx),%ebp
  a4c86a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4c870:	41                   	inc    %ecx
  a4c871:	0f b6 c0             	movzbl %al,%eax
  a4c874:	49                   	dec    %ecx
  a4c875:	83 c4 01             	add    $0x1,%esp
  a4c878:	c1 e8 04             	shr    $0x4,%eax
  a4c87b:	89 c3                	mov    %eax,%ebx
  a4c87d:	83 f8 0f             	cmp    $0xf,%eax
  a4c880:	0f 84 ca 00 00 00    	je     a4c950 <LZ4_decompress_fast_usingDict+0x140>
  a4c886:	49                   	dec    %ecx
  a4c887:	8d 54 1d 00          	lea    0x0(%ebp,%ebx,1),%edx
  a4c88b:	48                   	dec    %eax
  a4c88c:	39 f2                	cmp    %esi,%edx
  a4c88e:	0f 87 e3 00 00 00    	ja     a4c977 <LZ4_decompress_fast_usingDict+0x167>
  a4c894:	4c                   	dec    %esp
  a4c895:	89 e0                	mov    %esp,%eax
  a4c897:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4c89e:	00 00 
  a4c8a0:	48                   	dec    %eax
  a4c8a1:	8b 08                	mov    (%eax),%ecx
  a4c8a3:	49                   	dec    %ecx
  a4c8a4:	83 c5 08             	add    $0x8,%ebp
  a4c8a7:	48                   	dec    %eax
  a4c8a8:	83 c0 08             	add    $0x8,%eax
  a4c8ab:	49                   	dec    %ecx
  a4c8ac:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  a4c8af:	4c                   	dec    %esp
  a4c8b0:	39 ea                	cmp    %ebp,%edx
  a4c8b2:	77 ec                	ja     a4c8a0 <LZ4_decompress_fast_usingDict+0x90>
  a4c8b4:	49                   	dec    %ecx
  a4c8b5:	01 dc                	add    %ebx,%esp
  a4c8b7:	44                   	inc    %esp
  a4c8b8:	89 c1                	mov    %eax,%ecx
  a4c8ba:	48                   	dec    %eax
  a4c8bb:	89 d0                	mov    %edx,%eax
  a4c8bd:	41                   	inc    %ecx
  a4c8be:	83 e0 0f             	and    $0xf,%eax
  a4c8c1:	45                   	inc    %ebp
  a4c8c2:	0f b7 0c 24          	movzwl (%esp),%ecx
  a4c8c6:	83 e1 0f             	and    $0xf,%ecx
  a4c8c9:	49                   	dec    %ecx
  a4c8ca:	83 c4 02             	add    $0x2,%esp
  a4c8cd:	44                   	inc    %esp
  a4c8ce:	89 0a                	mov    %ecx,(%edx)
  a4c8d0:	4c                   	dec    %esp
  a4c8d1:	29 c8                	sub    %ecx,%eax
  a4c8d3:	80 f9 0f             	cmp    $0xf,%cl
  a4c8d6:	0f 84 cc 00 00 00    	je     a4c9a8 <LZ4_decompress_fast_usingDict+0x198>
  a4c8dc:	49                   	dec    %ecx
  a4c8dd:	83 c0 04             	add    $0x4,%eax
  a4c8e0:	4e                   	dec    %esi
  a4c8e1:	8d 2c 02             	lea    (%edx,%eax,1),%ebp
  a4c8e4:	49                   	dec    %ecx
  a4c8e5:	83 f9 07             	cmp    $0x7,%ecx
  a4c8e8:	0f 86 ea 00 00 00    	jbe    a4c9d8 <LZ4_decompress_fast_usingDict+0x1c8>
  a4c8ee:	48                   	dec    %eax
  a4c8ef:	8b 08                	mov    (%eax),%ecx
  a4c8f1:	48                   	dec    %eax
  a4c8f2:	83 c0 08             	add    $0x8,%eax
  a4c8f5:	48                   	dec    %eax
  a4c8f6:	89 0a                	mov    %ecx,(%edx)
  a4c8f8:	49                   	dec    %ecx
  a4c8f9:	39 fd                	cmp    %edi,%ebp
  a4c8fb:	0f 87 0f 01 00 00    	ja     a4ca10 <LZ4_decompress_fast_usingDict+0x200>
  a4c901:	48                   	dec    %eax
  a4c902:	8b 08                	mov    (%eax),%ecx
  a4c904:	48                   	dec    %eax
  a4c905:	89 4a 08             	mov    %ecx,0x8(%edx)
  a4c908:	49                   	dec    %ecx
  a4c909:	83 f8 10             	cmp    $0x10,%eax
  a4c90c:	77 12                	ja     a4c920 <LZ4_decompress_fast_usingDict+0x110>
  a4c90e:	45                   	inc    %ebp
  a4c90f:	0f b6 04 24          	movzbl (%esp),%eax
  a4c913:	e9 58 ff ff ff       	jmp    a4c870 <LZ4_decompress_fast_usingDict+0x60>
  a4c918:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4c91f:	00 
  a4c920:	48                   	dec    %eax
  a4c921:	83 c0 08             	add    $0x8,%eax
  a4c924:	48                   	dec    %eax
  a4c925:	83 c2 10             	add    $0x10,%edx
  a4c928:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4c92f:	00 
  a4c930:	48                   	dec    %eax
  a4c931:	8b 08                	mov    (%eax),%ecx
  a4c933:	48                   	dec    %eax
  a4c934:	83 c2 08             	add    $0x8,%edx
  a4c937:	48                   	dec    %eax
  a4c938:	83 c0 08             	add    $0x8,%eax
  a4c93b:	48                   	dec    %eax
  a4c93c:	89 4a f8             	mov    %ecx,-0x8(%edx)
  a4c93f:	49                   	dec    %ecx
  a4c940:	39 d5                	cmp    %edx,%ebp
  a4c942:	77 ec                	ja     a4c930 <LZ4_decompress_fast_usingDict+0x120>
  a4c944:	eb c8                	jmp    a4c90e <LZ4_decompress_fast_usingDict+0xfe>
  a4c946:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4c94d:	00 00 00 
  a4c950:	bb 0f 00 00 00       	mov    $0xf,%ebx
  a4c955:	0f 1f 00             	nopl   (%eax)
  a4c958:	41                   	inc    %ecx
  a4c959:	0f b6 14 24          	movzbl (%esp),%edx
  a4c95d:	49                   	dec    %ecx
  a4c95e:	83 c4 01             	add    $0x1,%esp
  a4c961:	48                   	dec    %eax
  a4c962:	01 d3                	add    %edx,%ebx
  a4c964:	80 fa ff             	cmp    $0xff,%dl
  a4c967:	74 ef                	je     a4c958 <LZ4_decompress_fast_usingDict+0x148>
  a4c969:	49                   	dec    %ecx
  a4c96a:	8d 54 1d 00          	lea    0x0(%ebp,%ebx,1),%edx
  a4c96e:	48                   	dec    %eax
  a4c96f:	39 f2                	cmp    %esi,%edx
  a4c971:	0f 86 1d ff ff ff    	jbe    a4c894 <LZ4_decompress_fast_usingDict+0x84>
  a4c977:	49                   	dec    %ecx
  a4c978:	39 d3                	cmp    %edx,%ebx
  a4c97a:	0f 85 01 03 00 00    	jne    a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4c980:	48                   	dec    %eax
  a4c981:	89 da                	mov    %ebx,%edx
  a4c983:	4c                   	dec    %esp
  a4c984:	89 e6                	mov    %esp,%esi
  a4c986:	4c                   	dec    %esp
  a4c987:	89 ef                	mov    %ebp,%edi
  a4c989:	e8 32 13 00 00       	call   a4dcc0 <memcpy>
  a4c98e:	49                   	dec    %ecx
  a4c98f:	8d 04 1c             	lea    (%esp,%ebx,1),%eax
  a4c992:	2b 44 24 08          	sub    0x8(%esp),%eax
  a4c996:	48                   	dec    %eax
  a4c997:	83 c4 28             	add    $0x28,%esp
  a4c99a:	5b                   	pop    %ebx
  a4c99b:	5d                   	pop    %ebp
  a4c99c:	41                   	inc    %ecx
  a4c99d:	5c                   	pop    %esp
  a4c99e:	41                   	inc    %ecx
  a4c99f:	5d                   	pop    %ebp
  a4c9a0:	41                   	inc    %ecx
  a4c9a1:	5e                   	pop    %esi
  a4c9a2:	41                   	inc    %ecx
  a4c9a3:	5f                   	pop    %edi
  a4c9a4:	c3                   	ret    
  a4c9a5:	0f 1f 00             	nopl   (%eax)
  a4c9a8:	41                   	inc    %ecx
  a4c9a9:	b8 0f 00 00 00       	mov    $0xf,%eax
  a4c9ae:	66 90                	xchg   %ax,%ax
  a4c9b0:	41                   	inc    %ecx
  a4c9b1:	0f b6 1c 24          	movzbl (%esp),%ebx
  a4c9b5:	49                   	dec    %ecx
  a4c9b6:	83 c4 01             	add    $0x1,%esp
  a4c9b9:	49                   	dec    %ecx
  a4c9ba:	01 d8                	add    %ebx,%eax
  a4c9bc:	80 fb ff             	cmp    $0xff,%bl
  a4c9bf:	74 ef                	je     a4c9b0 <LZ4_decompress_fast_usingDict+0x1a0>
  a4c9c1:	49                   	dec    %ecx
  a4c9c2:	83 c0 04             	add    $0x4,%eax
  a4c9c5:	4e                   	dec    %esi
  a4c9c6:	8d 2c 02             	lea    (%edx,%eax,1),%ebp
  a4c9c9:	49                   	dec    %ecx
  a4c9ca:	83 f9 07             	cmp    $0x7,%ecx
  a4c9cd:	0f 87 1b ff ff ff    	ja     a4c8ee <LZ4_decompress_fast_usingDict+0xde>
  a4c9d3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4c9d8:	0f b6 08             	movzbl (%eax),%ecx
  a4c9db:	88 0a                	mov    %cl,(%edx)
  a4c9dd:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
  a4c9e1:	88 4a 01             	mov    %cl,0x1(%edx)
  a4c9e4:	0f b6 48 02          	movzbl 0x2(%eax),%ecx
  a4c9e8:	88 4a 02             	mov    %cl,0x2(%edx)
  a4c9eb:	0f b6 48 03          	movzbl 0x3(%eax),%ecx
  a4c9ef:	88 4a 03             	mov    %cl,0x3(%edx)
  a4c9f2:	43                   	inc    %ebx
  a4c9f3:	8b 0c 8e             	mov    (%esi,%ecx,4),%ecx
  a4c9f6:	48                   	dec    %eax
  a4c9f7:	01 c8                	add    %ecx,%eax
  a4c9f9:	8b 08                	mov    (%eax),%ecx
  a4c9fb:	89 4a 04             	mov    %ecx,0x4(%edx)
  a4c9fe:	4b                   	dec    %ebx
  a4c9ff:	63 0c 8f             	arpl   %cx,(%edi,%ecx,4)
  a4ca02:	48                   	dec    %eax
  a4ca03:	29 c8                	sub    %ecx,%eax
  a4ca05:	49                   	dec    %ecx
  a4ca06:	39 fd                	cmp    %edi,%ebp
  a4ca08:	0f 86 f3 fe ff ff    	jbe    a4c901 <LZ4_decompress_fast_usingDict+0xf1>
  a4ca0e:	66 90                	xchg   %ax,%ax
  a4ca10:	49                   	dec    %ecx
  a4ca11:	39 ed                	cmp    %ebp,%ebp
  a4ca13:	0f 87 68 02 00 00    	ja     a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4ca19:	48                   	dec    %eax
  a4ca1a:	83 c2 08             	add    $0x8,%edx
  a4ca1d:	4c                   	dec    %esp
  a4ca1e:	39 d2                	cmp    %edx,%edx
  a4ca20:	72 2d                	jb     a4ca4f <LZ4_decompress_fast_usingDict+0x23f>
  a4ca22:	49                   	dec    %ecx
  a4ca23:	39 d5                	cmp    %edx,%ebp
  a4ca25:	0f 86 e3 fe ff ff    	jbe    a4c90e <LZ4_decompress_fast_usingDict+0xfe>
  a4ca2b:	4d                   	dec    %ebp
  a4ca2c:	89 e9                	mov    %ebp,%ecx
  a4ca2e:	31 c9                	xor    %ecx,%ecx
  a4ca30:	49                   	dec    %ecx
  a4ca31:	29 d1                	sub    %edx,%ecx
  a4ca33:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4ca38:	44                   	inc    %esp
  a4ca39:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
  a4ca3d:	44                   	inc    %esp
  a4ca3e:	88 04 0a             	mov    %al,(%edx,%ecx,1)
  a4ca41:	48                   	dec    %eax
  a4ca42:	83 c1 01             	add    $0x1,%ecx
  a4ca45:	49                   	dec    %ecx
  a4ca46:	39 c9                	cmp    %ecx,%ecx
  a4ca48:	75 ee                	jne    a4ca38 <LZ4_decompress_fast_usingDict+0x228>
  a4ca4a:	e9 bf fe ff ff       	jmp    a4c90e <LZ4_decompress_fast_usingDict+0xfe>
  a4ca4f:	49                   	dec    %ecx
  a4ca50:	89 c0                	mov    %eax,%eax
  a4ca52:	48                   	dec    %eax
  a4ca53:	89 d1                	mov    %edx,%ecx
  a4ca55:	0f 1f 00             	nopl   (%eax)
  a4ca58:	4d                   	dec    %ebp
  a4ca59:	8b 08                	mov    (%eax),%ecx
  a4ca5b:	48                   	dec    %eax
  a4ca5c:	83 c1 08             	add    $0x8,%ecx
  a4ca5f:	49                   	dec    %ecx
  a4ca60:	83 c0 08             	add    $0x8,%eax
  a4ca63:	4c                   	dec    %esp
  a4ca64:	89 49 f8             	mov    %ecx,-0x8(%ecx)
  a4ca67:	49                   	dec    %ecx
  a4ca68:	39 ca                	cmp    %ecx,%edx
  a4ca6a:	77 ec                	ja     a4ca58 <LZ4_decompress_fast_usingDict+0x248>
  a4ca6c:	4c                   	dec    %esp
  a4ca6d:	89 d1                	mov    %edx,%ecx
  a4ca6f:	48                   	dec    %eax
  a4ca70:	29 d1                	sub    %edx,%ecx
  a4ca72:	4c                   	dec    %esp
  a4ca73:	89 d2                	mov    %edx,%edx
  a4ca75:	48                   	dec    %eax
  a4ca76:	01 c8                	add    %ecx,%eax
  a4ca78:	eb a8                	jmp    a4ca22 <LZ4_decompress_fast_usingDict+0x212>
  a4ca7a:	4c                   	dec    %esp
  a4ca7b:	63 d0                	arpl   %dx,%ax
  a4ca7d:	4a                   	dec    %edx
  a4ca7e:	8d 2c 11             	lea    (%ecx,%edx,1),%ebp
  a4ca81:	49                   	dec    %ecx
  a4ca82:	39 ed                	cmp    %ebp,%ebp
  a4ca84:	0f 84 be 02 00 00    	je     a4cd48 <LZ4_decompress_fast_usingDict+0x538>
  a4ca8a:	49                   	dec    %ecx
  a4ca8b:	8d 5c 35 00          	lea    0x0(%ebp,%esi,1),%ebx
  a4ca8f:	85 d2                	test   %edx,%edx
  a4ca91:	0f 84 dc 01 00 00    	je     a4cc73 <LZ4_decompress_fast_usingDict+0x463>
  a4ca97:	48                   	dec    %eax
  a4ca98:	8d 43 f9             	lea    -0x7(%ebx),%eax
  a4ca9b:	48                   	dec    %eax
  a4ca9c:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  a4caa0:	4c                   	dec    %esp
  a4caa1:	8d 63 f8             	lea    -0x8(%ebx),%esp
  a4caa4:	4d                   	dec    %ebp
  a4caa5:	89 ee                	mov    %ebp,%esi
  a4caa7:	48                   	dec    %eax
  a4caa8:	89 44 24 18          	mov    %eax,0x18(%esp)
  a4caac:	4c                   	dec    %esp
  a4caad:	8b 7c 24 08          	mov    0x8(%esp),%edi
  a4cab1:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4cab8:	41                   	inc    %ecx
  a4cab9:	0f b6 c0             	movzbl %al,%eax
  a4cabc:	49                   	dec    %ecx
  a4cabd:	83 c7 01             	add    $0x1,%edi
  a4cac0:	c1 e8 04             	shr    $0x4,%eax
  a4cac3:	89 c2                	mov    %eax,%edx
  a4cac5:	83 f8 0f             	cmp    $0xf,%eax
  a4cac8:	0f 84 77 01 00 00    	je     a4cc45 <LZ4_decompress_fast_usingDict+0x435>
  a4cace:	49                   	dec    %ecx
  a4cacf:	8d 3c 16             	lea    (%esi,%edx,1),%edi
  a4cad2:	4c                   	dec    %esp
  a4cad3:	39 e7                	cmp    %esp,%edi
  a4cad5:	0f 87 72 04 00 00    	ja     a4cf4d <LZ4_decompress_fast_usingDict+0x73d>
  a4cadb:	4c                   	dec    %esp
  a4cadc:	89 f8                	mov    %edi,%eax
  a4cade:	66 90                	xchg   %ax,%ax
  a4cae0:	48                   	dec    %eax
  a4cae1:	8b 08                	mov    (%eax),%ecx
  a4cae3:	49                   	dec    %ecx
  a4cae4:	83 c6 08             	add    $0x8,%esi
  a4cae7:	48                   	dec    %eax
  a4cae8:	83 c0 08             	add    $0x8,%eax
  a4caeb:	49                   	dec    %ecx
  a4caec:	89 4e f8             	mov    %ecx,-0x8(%esi)
  a4caef:	4c                   	dec    %esp
  a4caf0:	39 f7                	cmp    %esi,%edi
  a4caf2:	77 ec                	ja     a4cae0 <LZ4_decompress_fast_usingDict+0x2d0>
  a4caf4:	49                   	dec    %ecx
  a4caf5:	01 d7                	add    %edx,%edi
  a4caf7:	44                   	inc    %esp
  a4caf8:	89 c0                	mov    %eax,%eax
  a4cafa:	49                   	dec    %ecx
  a4cafb:	89 fa                	mov    %edi,%edx
  a4cafd:	4c                   	dec    %esp
  a4cafe:	89 c2                	mov    %eax,%edx
  a4cb00:	41                   	inc    %ecx
  a4cb01:	0f b7 37             	movzwl (%edi),%esi
  a4cb04:	83 e0 0f             	and    $0xf,%eax
  a4cb07:	49                   	dec    %ecx
  a4cb08:	83 c7 02             	add    $0x2,%edi
  a4cb0b:	83 e2 0f             	and    $0xf,%edx
  a4cb0e:	89 37                	mov    %esi,(%edi)
  a4cb10:	49                   	dec    %ecx
  a4cb11:	29 f2                	sub    %esi,%edx
  a4cb13:	3c 0f                	cmp    $0xf,%al
  a4cb15:	0f 84 06 01 00 00    	je     a4cc21 <LZ4_decompress_fast_usingDict+0x411>
  a4cb1b:	48                   	dec    %eax
  a4cb1c:	83 c2 04             	add    $0x4,%edx
  a4cb1f:	4c                   	dec    %esp
  a4cb20:	8d 34 17             	lea    (%edi,%edx,1),%esi
  a4cb23:	4d                   	dec    %ebp
  a4cb24:	39 d5                	cmp    %edx,%ebp
  a4cb26:	0f 86 84 00 00 00    	jbe    a4cbb0 <LZ4_decompress_fast_usingDict+0x3a0>
  a4cb2c:	48                   	dec    %eax
  a4cb2d:	8d 43 fb             	lea    -0x5(%ebx),%eax
  a4cb30:	49                   	dec    %ecx
  a4cb31:	39 c6                	cmp    %eax,%esi
  a4cb33:	0f 87 48 01 00 00    	ja     a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4cb39:	48                   	dec    %eax
  a4cb3a:	8b 74 24 10          	mov    0x10(%esp),%esi
  a4cb3e:	4c                   	dec    %esp
  a4cb3f:	89 e9                	mov    %ebp,%ecx
  a4cb41:	4c                   	dec    %esp
  a4cb42:	29 d1                	sub    %edx,%ecx
  a4cb44:	48                   	dec    %eax
  a4cb45:	29 ce                	sub    %ecx,%esi
  a4cb47:	48                   	dec    %eax
  a4cb48:	39 ca                	cmp    %ecx,%edx
  a4cb4a:	0f 86 15 01 00 00    	jbe    a4cc65 <LZ4_decompress_fast_usingDict+0x455>
  a4cb50:	48                   	dec    %eax
  a4cb51:	29 ca                	sub    %ecx,%edx
  a4cb53:	48                   	dec    %eax
  a4cb54:	89 0c 24             	mov    %ecx,(%esp)
  a4cb57:	48                   	dec    %eax
  a4cb58:	89 d5                	mov    %edx,%ebp
  a4cb5a:	48                   	dec    %eax
  a4cb5b:	89 ca                	mov    %ecx,%edx
  a4cb5d:	e8 5e 11 00 00       	call   a4dcc0 <memcpy>
  a4cb62:	48                   	dec    %eax
  a4cb63:	8b 0c 24             	mov    (%esp),%ecx
  a4cb66:	48                   	dec    %eax
  a4cb67:	89 c7                	mov    %eax,%edi
  a4cb69:	48                   	dec    %eax
  a4cb6a:	01 cf                	add    %ecx,%edi
  a4cb6c:	48                   	dec    %eax
  a4cb6d:	89 f8                	mov    %edi,%eax
  a4cb6f:	4c                   	dec    %esp
  a4cb70:	29 e8                	sub    %ebp,%eax
  a4cb72:	48                   	dec    %eax
  a4cb73:	39 c5                	cmp    %eax,%ebp
  a4cb75:	0f 86 92 00 00 00    	jbe    a4cc0d <LZ4_decompress_fast_usingDict+0x3fd>
  a4cb7b:	49                   	dec    %ecx
  a4cb7c:	39 fe                	cmp    %edi,%esi
  a4cb7e:	0f 86 c1 03 00 00    	jbe    a4cf45 <LZ4_decompress_fast_usingDict+0x735>
  a4cb84:	31 c0                	xor    %eax,%eax
  a4cb86:	41                   	inc    %ecx
  a4cb87:	0f b6 54 05 00       	movzbl 0x0(%ebp,%eax,1),%edx
  a4cb8c:	88 14 07             	mov    %dl,(%edi,%eax,1)
  a4cb8f:	48                   	dec    %eax
  a4cb90:	83 c0 01             	add    $0x1,%eax
  a4cb93:	48                   	dec    %eax
  a4cb94:	39 c5                	cmp    %eax,%ebp
  a4cb96:	75 ee                	jne    a4cb86 <LZ4_decompress_fast_usingDict+0x376>
  a4cb98:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4cb9f:	00 
  a4cba0:	45                   	inc    %ebp
  a4cba1:	0f b6 07             	movzbl (%edi),%eax
  a4cba4:	e9 0f ff ff ff       	jmp    a4cab8 <LZ4_decompress_fast_usingDict+0x2a8>
  a4cba9:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4cbb0:	48                   	dec    %eax
  a4cbb1:	83 fe 07             	cmp    $0x7,%esi
  a4cbb4:	0f 86 19 01 00 00    	jbe    a4ccd3 <LZ4_decompress_fast_usingDict+0x4c3>
  a4cbba:	49                   	dec    %ecx
  a4cbbb:	8b 02                	mov    (%edx),%eax
  a4cbbd:	48                   	dec    %eax
  a4cbbe:	89 07                	mov    %eax,(%edi)
  a4cbc0:	49                   	dec    %ecx
  a4cbc1:	8d 42 08             	lea    0x8(%edx),%eax
  a4cbc4:	48                   	dec    %eax
  a4cbc5:	8d 4b f4             	lea    -0xc(%ebx),%ecx
  a4cbc8:	49                   	dec    %ecx
  a4cbc9:	39 ce                	cmp    %ecx,%esi
  a4cbcb:	0f 87 c4 00 00 00    	ja     a4cc95 <LZ4_decompress_fast_usingDict+0x485>
  a4cbd1:	48                   	dec    %eax
  a4cbd2:	8b 08                	mov    (%eax),%ecx
  a4cbd4:	48                   	dec    %eax
  a4cbd5:	89 4f 08             	mov    %ecx,0x8(%edi)
  a4cbd8:	48                   	dec    %eax
  a4cbd9:	83 fa 10             	cmp    $0x10,%edx
  a4cbdc:	76 c2                	jbe    a4cba0 <LZ4_decompress_fast_usingDict+0x390>
  a4cbde:	48                   	dec    %eax
  a4cbdf:	83 c0 08             	add    $0x8,%eax
  a4cbe2:	48                   	dec    %eax
  a4cbe3:	83 c7 10             	add    $0x10,%edi
  a4cbe6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4cbed:	00 00 00 
  a4cbf0:	48                   	dec    %eax
  a4cbf1:	8b 10                	mov    (%eax),%edx
  a4cbf3:	48                   	dec    %eax
  a4cbf4:	83 c7 08             	add    $0x8,%edi
  a4cbf7:	48                   	dec    %eax
  a4cbf8:	83 c0 08             	add    $0x8,%eax
  a4cbfb:	48                   	dec    %eax
  a4cbfc:	89 57 f8             	mov    %edx,-0x8(%edi)
  a4cbff:	4c                   	dec    %esp
  a4cc00:	39 f7                	cmp    %esi,%edi
  a4cc02:	72 ec                	jb     a4cbf0 <LZ4_decompress_fast_usingDict+0x3e0>
  a4cc04:	45                   	inc    %ebp
  a4cc05:	0f b6 07             	movzbl (%edi),%eax
  a4cc08:	e9 ab fe ff ff       	jmp    a4cab8 <LZ4_decompress_fast_usingDict+0x2a8>
  a4cc0d:	48                   	dec    %eax
  a4cc0e:	89 ea                	mov    %ebp,%edx
  a4cc10:	4c                   	dec    %esp
  a4cc11:	89 ee                	mov    %ebp,%esi
  a4cc13:	e8 a8 10 00 00       	call   a4dcc0 <memcpy>
  a4cc18:	45                   	inc    %ebp
  a4cc19:	0f b6 07             	movzbl (%edi),%eax
  a4cc1c:	e9 97 fe ff ff       	jmp    a4cab8 <LZ4_decompress_fast_usingDict+0x2a8>
  a4cc21:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4cc26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4cc2d:	00 00 00 
  a4cc30:	41                   	inc    %ecx
  a4cc31:	0f b6 0f             	movzbl (%edi),%ecx
  a4cc34:	49                   	dec    %ecx
  a4cc35:	83 c7 01             	add    $0x1,%edi
  a4cc38:	48                   	dec    %eax
  a4cc39:	01 ca                	add    %ecx,%edx
  a4cc3b:	80 f9 ff             	cmp    $0xff,%cl
  a4cc3e:	74 f0                	je     a4cc30 <LZ4_decompress_fast_usingDict+0x420>
  a4cc40:	e9 d6 fe ff ff       	jmp    a4cb1b <LZ4_decompress_fast_usingDict+0x30b>
  a4cc45:	ba 0f 00 00 00       	mov    $0xf,%edx
  a4cc4a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4cc50:	41                   	inc    %ecx
  a4cc51:	0f b6 0f             	movzbl (%edi),%ecx
  a4cc54:	49                   	dec    %ecx
  a4cc55:	83 c7 01             	add    $0x1,%edi
  a4cc58:	48                   	dec    %eax
  a4cc59:	01 ca                	add    %ecx,%edx
  a4cc5b:	80 f9 ff             	cmp    $0xff,%cl
  a4cc5e:	74 f0                	je     a4cc50 <LZ4_decompress_fast_usingDict+0x440>
  a4cc60:	e9 69 fe ff ff       	jmp    a4cace <LZ4_decompress_fast_usingDict+0x2be>
  a4cc65:	e8 f6 0f 00 00       	call   a4dc60 <memmove>
  a4cc6a:	45                   	inc    %ebp
  a4cc6b:	0f b6 07             	movzbl (%edi),%eax
  a4cc6e:	e9 45 fe ff ff       	jmp    a4cab8 <LZ4_decompress_fast_usingDict+0x2a8>
  a4cc73:	b8 01 00 00 00       	mov    $0x1,%eax
  a4cc78:	45                   	inc    %ebp
  a4cc79:	84 c0                	test   %al,%al
  a4cc7b:	0f 84 15 fd ff ff    	je     a4c996 <LZ4_decompress_fast_usingDict+0x186>
  a4cc81:	48                   	dec    %eax
  a4cc82:	83 c4 28             	add    $0x28,%esp
  a4cc85:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4cc8a:	5b                   	pop    %ebx
  a4cc8b:	5d                   	pop    %ebp
  a4cc8c:	41                   	inc    %ecx
  a4cc8d:	5c                   	pop    %esp
  a4cc8e:	41                   	inc    %ecx
  a4cc8f:	5d                   	pop    %ebp
  a4cc90:	41                   	inc    %ecx
  a4cc91:	5e                   	pop    %esi
  a4cc92:	41                   	inc    %ecx
  a4cc93:	5f                   	pop    %edi
  a4cc94:	c3                   	ret    
  a4cc95:	48                   	dec    %eax
  a4cc96:	8d 53 fb             	lea    -0x5(%ebx),%edx
  a4cc99:	49                   	dec    %ecx
  a4cc9a:	39 d6                	cmp    %edx,%esi
  a4cc9c:	77 e3                	ja     a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4cc9e:	48                   	dec    %eax
  a4cc9f:	83 c7 08             	add    $0x8,%edi
  a4cca2:	48                   	dec    %eax
  a4cca3:	3b 7c 24 18          	cmp    0x18(%esp),%edi
  a4cca7:	72 6d                	jb     a4cd16 <LZ4_decompress_fast_usingDict+0x506>
  a4cca9:	4c                   	dec    %esp
  a4ccaa:	39 f7                	cmp    %esi,%edi
  a4ccac:	0f 83 ee fe ff ff    	jae    a4cba0 <LZ4_decompress_fast_usingDict+0x390>
  a4ccb2:	4c                   	dec    %esp
  a4ccb3:	89 f6                	mov    %esi,%esi
  a4ccb5:	31 d2                	xor    %edx,%edx
  a4ccb7:	48                   	dec    %eax
  a4ccb8:	29 fe                	sub    %edi,%esi
  a4ccba:	0f b6 0c 10          	movzbl (%eax,%edx,1),%ecx
  a4ccbe:	88 0c 17             	mov    %cl,(%edi,%edx,1)
  a4ccc1:	48                   	dec    %eax
  a4ccc2:	83 c2 01             	add    $0x1,%edx
  a4ccc5:	48                   	dec    %eax
  a4ccc6:	39 d6                	cmp    %edx,%esi
  a4ccc8:	75 f0                	jne    a4ccba <LZ4_decompress_fast_usingDict+0x4aa>
  a4ccca:	45                   	inc    %ebp
  a4cccb:	0f b6 07             	movzbl (%edi),%eax
  a4ccce:	e9 e5 fd ff ff       	jmp    a4cab8 <LZ4_decompress_fast_usingDict+0x2a8>
  a4ccd3:	41                   	inc    %ecx
  a4ccd4:	0f b6 02             	movzbl (%edx),%eax
  a4ccd7:	88 07                	mov    %al,(%edi)
  a4ccd9:	41                   	inc    %ecx
  a4ccda:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  a4ccde:	88 47 01             	mov    %al,0x1(%edi)
  a4cce1:	41                   	inc    %ecx
  a4cce2:	0f b6 42 02          	movzbl 0x2(%edx),%eax
  a4cce6:	88 47 02             	mov    %al,0x2(%edi)
  a4cce9:	41                   	inc    %ecx
  a4ccea:	0f b6 42 03          	movzbl 0x3(%edx),%eax
  a4ccee:	88 47 03             	mov    %al,0x3(%edi)
  a4ccf1:	48                   	dec    %eax
  a4ccf2:	8d 05 a8 72 00 00    	lea    0x72a8,%eax
  a4ccf8:	8b 04 b0             	mov    (%eax,%esi,4),%eax
  a4ccfb:	4c                   	dec    %esp
  a4ccfc:	01 d0                	add    %edx,%eax
  a4ccfe:	8b 08                	mov    (%eax),%ecx
  a4cd00:	89 4f 04             	mov    %ecx,0x4(%edi)
  a4cd03:	48                   	dec    %eax
  a4cd04:	8d 0d b6 72 00 00    	lea    0x72b6,%ecx
  a4cd0a:	48                   	dec    %eax
  a4cd0b:	63 0c b1             	arpl   %cx,(%ecx,%esi,4)
  a4cd0e:	48                   	dec    %eax
  a4cd0f:	29 c8                	sub    %ecx,%eax
  a4cd11:	e9 ae fe ff ff       	jmp    a4cbc4 <LZ4_decompress_fast_usingDict+0x3b4>
  a4cd16:	48                   	dec    %eax
  a4cd17:	89 c1                	mov    %eax,%ecx
  a4cd19:	48                   	dec    %eax
  a4cd1a:	89 fa                	mov    %edi,%edx
  a4cd1c:	48                   	dec    %eax
  a4cd1d:	8b 31                	mov    (%ecx),%esi
  a4cd1f:	48                   	dec    %eax
  a4cd20:	83 c2 08             	add    $0x8,%edx
  a4cd23:	48                   	dec    %eax
  a4cd24:	83 c1 08             	add    $0x8,%ecx
  a4cd27:	48                   	dec    %eax
  a4cd28:	89 72 f8             	mov    %esi,-0x8(%edx)
  a4cd2b:	48                   	dec    %eax
  a4cd2c:	39 54 24 18          	cmp    %edx,0x18(%esp)
  a4cd30:	77 ea                	ja     a4cd1c <LZ4_decompress_fast_usingDict+0x50c>
  a4cd32:	48                   	dec    %eax
  a4cd33:	8b 74 24 18          	mov    0x18(%esp),%esi
  a4cd37:	48                   	dec    %eax
  a4cd38:	89 f2                	mov    %esi,%edx
  a4cd3a:	48                   	dec    %eax
  a4cd3b:	29 fa                	sub    %edi,%edx
  a4cd3d:	48                   	dec    %eax
  a4cd3e:	89 f7                	mov    %esi,%edi
  a4cd40:	48                   	dec    %eax
  a4cd41:	01 d0                	add    %edx,%eax
  a4cd43:	e9 61 ff ff ff       	jmp    a4cca9 <LZ4_decompress_fast_usingDict+0x499>
  a4cd48:	48                   	dec    %eax
  a4cd49:	01 ee                	add    %ebp,%esi
  a4cd4b:	3d fe ff 00 00       	cmp    $0xfffe,%eax
  a4cd50:	0f 8e 55 02 00 00    	jle    a4cfab <LZ4_decompress_fast_usingDict+0x79b>
  a4cd56:	85 d2                	test   %edx,%edx
  a4cd58:	0f 84 15 ff ff ff    	je     a4cc73 <LZ4_decompress_fast_usingDict+0x463>
  a4cd5e:	48                   	dec    %eax
  a4cd5f:	8b 5c 24 08          	mov    0x8(%esp),%ebx
  a4cd63:	4c                   	dec    %esp
  a4cd64:	8d 4e f8             	lea    -0x8(%esi),%ecx
  a4cd67:	48                   	dec    %eax
  a4cd68:	8d 7e f4             	lea    -0xc(%esi),%edi
  a4cd6b:	4c                   	dec    %esp
  a4cd6c:	8d 3d 4e 72 00 00    	lea    0x724e,%edi
  a4cd72:	4c                   	dec    %esp
  a4cd73:	8d 35 27 72 00 00    	lea    0x7227,%esi
  a4cd79:	4c                   	dec    %esp
  a4cd7a:	8d 5e f9             	lea    -0x7(%esi),%ebx
  a4cd7d:	4c                   	dec    %esp
  a4cd7e:	8d 6e fb             	lea    -0x5(%esi),%ebp
  a4cd81:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4cd88:	41                   	inc    %ecx
  a4cd89:	0f b6 c0             	movzbl %al,%eax
  a4cd8c:	48                   	dec    %eax
  a4cd8d:	83 c3 01             	add    $0x1,%ebx
  a4cd90:	c1 e8 04             	shr    $0x4,%eax
  a4cd93:	41                   	inc    %ecx
  a4cd94:	89 c4                	mov    %eax,%esp
  a4cd96:	83 f8 0f             	cmp    $0xf,%eax
  a4cd99:	0f 84 a7 00 00 00    	je     a4ce46 <LZ4_decompress_fast_usingDict+0x636>
  a4cd9f:	4a                   	dec    %edx
  a4cda0:	8d 54 25 00          	lea    0x0(%ebp,%eiz,1),%edx
  a4cda4:	4c                   	dec    %esp
  a4cda5:	39 ca                	cmp    %ecx,%edx
  a4cda7:	0f 87 6a 01 00 00    	ja     a4cf17 <LZ4_decompress_fast_usingDict+0x707>
  a4cdad:	48                   	dec    %eax
  a4cdae:	89 d8                	mov    %ebx,%eax
  a4cdb0:	48                   	dec    %eax
  a4cdb1:	8b 08                	mov    (%eax),%ecx
  a4cdb3:	48                   	dec    %eax
  a4cdb4:	83 c5 08             	add    $0x8,%ebp
  a4cdb7:	48                   	dec    %eax
  a4cdb8:	83 c0 08             	add    $0x8,%eax
  a4cdbb:	48                   	dec    %eax
  a4cdbc:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  a4cdbf:	48                   	dec    %eax
  a4cdc0:	39 ea                	cmp    %ebp,%edx
  a4cdc2:	77 ec                	ja     a4cdb0 <LZ4_decompress_fast_usingDict+0x5a0>
  a4cdc4:	4c                   	dec    %esp
  a4cdc5:	01 e3                	add    %esp,%ebx
  a4cdc7:	44                   	inc    %esp
  a4cdc8:	89 c0                	mov    %eax,%eax
  a4cdca:	49                   	dec    %ecx
  a4cdcb:	89 d4                	mov    %edx,%esp
  a4cdcd:	4c                   	dec    %esp
  a4cdce:	89 c1                	mov    %eax,%ecx
  a4cdd0:	44                   	inc    %esp
  a4cdd1:	0f b7 13             	movzwl (%ebx),%edx
  a4cdd4:	83 e0 0f             	and    $0xf,%eax
  a4cdd7:	48                   	dec    %eax
  a4cdd8:	83 c3 02             	add    $0x2,%ebx
  a4cddb:	83 e1 0f             	and    $0xf,%ecx
  a4cdde:	44                   	inc    %esp
  a4cddf:	89 12                	mov    %edx,(%edx)
  a4cde1:	4d                   	dec    %ebp
  a4cde2:	29 d4                	sub    %edx,%esp
  a4cde4:	3c 0f                	cmp    $0xf,%al
  a4cde6:	74 7c                	je     a4ce64 <LZ4_decompress_fast_usingDict+0x654>
  a4cde8:	48                   	dec    %eax
  a4cde9:	83 c1 04             	add    $0x4,%ecx
  a4cdec:	48                   	dec    %eax
  a4cded:	8d 2c 0a             	lea    (%edx,%ecx,1),%ebp
  a4cdf0:	49                   	dec    %ecx
  a4cdf1:	83 fa 07             	cmp    $0x7,%edx
  a4cdf4:	0f 86 99 00 00 00    	jbe    a4ce93 <LZ4_decompress_fast_usingDict+0x683>
  a4cdfa:	49                   	dec    %ecx
  a4cdfb:	8b 04 24             	mov    (%esp),%eax
  a4cdfe:	48                   	dec    %eax
  a4cdff:	89 02                	mov    %eax,(%edx)
  a4ce01:	49                   	dec    %ecx
  a4ce02:	8d 44 24 08          	lea    0x8(%esp),%eax
  a4ce06:	48                   	dec    %eax
  a4ce07:	39 fd                	cmp    %edi,%ebp
  a4ce09:	0f 87 c4 00 00 00    	ja     a4ced3 <LZ4_decompress_fast_usingDict+0x6c3>
  a4ce0f:	4c                   	dec    %esp
  a4ce10:	8b 00                	mov    (%eax),%eax
  a4ce12:	4c                   	dec    %esp
  a4ce13:	89 42 08             	mov    %eax,0x8(%edx)
  a4ce16:	48                   	dec    %eax
  a4ce17:	83 f9 10             	cmp    $0x10,%ecx
  a4ce1a:	77 09                	ja     a4ce25 <LZ4_decompress_fast_usingDict+0x615>
  a4ce1c:	44                   	inc    %esp
  a4ce1d:	0f b6 03             	movzbl (%ebx),%eax
  a4ce20:	e9 63 ff ff ff       	jmp    a4cd88 <LZ4_decompress_fast_usingDict+0x578>
  a4ce25:	48                   	dec    %eax
  a4ce26:	83 c0 08             	add    $0x8,%eax
  a4ce29:	48                   	dec    %eax
  a4ce2a:	83 c2 10             	add    $0x10,%edx
  a4ce2d:	0f 1f 00             	nopl   (%eax)
  a4ce30:	48                   	dec    %eax
  a4ce31:	8b 08                	mov    (%eax),%ecx
  a4ce33:	48                   	dec    %eax
  a4ce34:	83 c2 08             	add    $0x8,%edx
  a4ce37:	48                   	dec    %eax
  a4ce38:	83 c0 08             	add    $0x8,%eax
  a4ce3b:	48                   	dec    %eax
  a4ce3c:	89 4a f8             	mov    %ecx,-0x8(%edx)
  a4ce3f:	48                   	dec    %eax
  a4ce40:	39 d5                	cmp    %edx,%ebp
  a4ce42:	77 ec                	ja     a4ce30 <LZ4_decompress_fast_usingDict+0x620>
  a4ce44:	eb d6                	jmp    a4ce1c <LZ4_decompress_fast_usingDict+0x60c>
  a4ce46:	41                   	inc    %ecx
  a4ce47:	bc 0f 00 00 00       	mov    $0xf,%esp
  a4ce4c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4ce50:	0f b6 13             	movzbl (%ebx),%edx
  a4ce53:	48                   	dec    %eax
  a4ce54:	83 c3 01             	add    $0x1,%ebx
  a4ce57:	49                   	dec    %ecx
  a4ce58:	01 d4                	add    %edx,%esp
  a4ce5a:	80 fa ff             	cmp    $0xff,%dl
  a4ce5d:	74 f1                	je     a4ce50 <LZ4_decompress_fast_usingDict+0x640>
  a4ce5f:	e9 3b ff ff ff       	jmp    a4cd9f <LZ4_decompress_fast_usingDict+0x58f>
  a4ce64:	b9 0f 00 00 00       	mov    $0xf,%ecx
  a4ce69:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4ce70:	44                   	inc    %esp
  a4ce71:	0f b6 03             	movzbl (%ebx),%eax
  a4ce74:	48                   	dec    %eax
  a4ce75:	83 c3 01             	add    $0x1,%ebx
  a4ce78:	4c                   	dec    %esp
  a4ce79:	01 c1                	add    %eax,%ecx
  a4ce7b:	41                   	inc    %ecx
  a4ce7c:	80 f8 ff             	cmp    $0xff,%al
  a4ce7f:	74 ef                	je     a4ce70 <LZ4_decompress_fast_usingDict+0x660>
  a4ce81:	48                   	dec    %eax
  a4ce82:	83 c1 04             	add    $0x4,%ecx
  a4ce85:	48                   	dec    %eax
  a4ce86:	8d 2c 0a             	lea    (%edx,%ecx,1),%ebp
  a4ce89:	49                   	dec    %ecx
  a4ce8a:	83 fa 07             	cmp    $0x7,%edx
  a4ce8d:	0f 87 67 ff ff ff    	ja     a4cdfa <LZ4_decompress_fast_usingDict+0x5ea>
  a4ce93:	41                   	inc    %ecx
  a4ce94:	0f b6 04 24          	movzbl (%esp),%eax
  a4ce98:	88 02                	mov    %al,(%edx)
  a4ce9a:	41                   	inc    %ecx
  a4ce9b:	0f b6 44 24 01       	movzbl 0x1(%esp),%eax
  a4cea0:	88 42 01             	mov    %al,0x1(%edx)
  a4cea3:	41                   	inc    %ecx
  a4cea4:	0f b6 44 24 02       	movzbl 0x2(%esp),%eax
  a4cea9:	88 42 02             	mov    %al,0x2(%edx)
  a4ceac:	41                   	inc    %ecx
  a4cead:	0f b6 44 24 03       	movzbl 0x3(%esp),%eax
  a4ceb2:	88 42 03             	mov    %al,0x3(%edx)
  a4ceb5:	43                   	inc    %ebx
  a4ceb6:	8b 04 96             	mov    (%esi,%edx,4),%eax
  a4ceb9:	4c                   	dec    %esp
  a4ceba:	01 e0                	add    %esp,%eax
  a4cebc:	44                   	inc    %esp
  a4cebd:	8b 00                	mov    (%eax),%eax
  a4cebf:	44                   	inc    %esp
  a4cec0:	89 42 04             	mov    %eax,0x4(%edx)
  a4cec3:	4f                   	dec    %edi
  a4cec4:	63 04 97             	arpl   %ax,(%edi,%edx,4)
  a4cec7:	4c                   	dec    %esp
  a4cec8:	29 c0                	sub    %eax,%eax
  a4ceca:	48                   	dec    %eax
  a4cecb:	39 fd                	cmp    %edi,%ebp
  a4cecd:	0f 86 3c ff ff ff    	jbe    a4ce0f <LZ4_decompress_fast_usingDict+0x5ff>
  a4ced3:	4c                   	dec    %esp
  a4ced4:	39 ed                	cmp    %ebp,%ebp
  a4ced6:	0f 87 a5 fd ff ff    	ja     a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4cedc:	48                   	dec    %eax
  a4cedd:	83 c2 08             	add    $0x8,%edx
  a4cee0:	4c                   	dec    %esp
  a4cee1:	39 da                	cmp    %ebx,%edx
  a4cee3:	0f 82 97 00 00 00    	jb     a4cf80 <LZ4_decompress_fast_usingDict+0x770>
  a4cee9:	48                   	dec    %eax
  a4ceea:	39 d5                	cmp    %edx,%ebp
  a4ceec:	0f 86 2a ff ff ff    	jbe    a4ce1c <LZ4_decompress_fast_usingDict+0x60c>
  a4cef2:	49                   	dec    %ecx
  a4cef3:	89 ea                	mov    %ebp,%edx
  a4cef5:	31 c9                	xor    %ecx,%ecx
  a4cef7:	49                   	dec    %ecx
  a4cef8:	29 d2                	sub    %edx,%edx
  a4cefa:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4cf00:	44                   	inc    %esp
  a4cf01:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
  a4cf05:	44                   	inc    %esp
  a4cf06:	88 04 0a             	mov    %al,(%edx,%ecx,1)
  a4cf09:	48                   	dec    %eax
  a4cf0a:	83 c1 01             	add    $0x1,%ecx
  a4cf0d:	49                   	dec    %ecx
  a4cf0e:	39 ca                	cmp    %ecx,%edx
  a4cf10:	75 ee                	jne    a4cf00 <LZ4_decompress_fast_usingDict+0x6f0>
  a4cf12:	e9 05 ff ff ff       	jmp    a4ce1c <LZ4_decompress_fast_usingDict+0x60c>
  a4cf17:	48                   	dec    %eax
  a4cf18:	39 f2                	cmp    %esi,%edx
  a4cf1a:	0f 85 61 fd ff ff    	jne    a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4cf20:	4c                   	dec    %esp
  a4cf21:	89 e2                	mov    %esp,%edx
  a4cf23:	48                   	dec    %eax
  a4cf24:	89 de                	mov    %ebx,%esi
  a4cf26:	48                   	dec    %eax
  a4cf27:	89 ef                	mov    %ebp,%edi
  a4cf29:	e8 92 0d 00 00       	call   a4dcc0 <memcpy>
  a4cf2e:	4a                   	dec    %edx
  a4cf2f:	8d 04 23             	lea    (%ebx,%eiz,1),%eax
  a4cf32:	2b 44 24 08          	sub    0x8(%esp),%eax
  a4cf36:	48                   	dec    %eax
  a4cf37:	83 c4 28             	add    $0x28,%esp
  a4cf3a:	5b                   	pop    %ebx
  a4cf3b:	5d                   	pop    %ebp
  a4cf3c:	41                   	inc    %ecx
  a4cf3d:	5c                   	pop    %esp
  a4cf3e:	41                   	inc    %ecx
  a4cf3f:	5d                   	pop    %ebp
  a4cf40:	41                   	inc    %ecx
  a4cf41:	5e                   	pop    %esi
  a4cf42:	41                   	inc    %ecx
  a4cf43:	5f                   	pop    %edi
  a4cf44:	c3                   	ret    
  a4cf45:	49                   	dec    %ecx
  a4cf46:	89 fe                	mov    %edi,%esi
  a4cf48:	e9 53 fc ff ff       	jmp    a4cba0 <LZ4_decompress_fast_usingDict+0x390>
  a4cf4d:	48                   	dec    %eax
  a4cf4e:	39 fb                	cmp    %edi,%ebx
  a4cf50:	0f 85 2b fd ff ff    	jne    a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4cf56:	4c                   	dec    %esp
  a4cf57:	89 fe                	mov    %edi,%esi
  a4cf59:	4c                   	dec    %esp
  a4cf5a:	89 f7                	mov    %esi,%edi
  a4cf5c:	48                   	dec    %eax
  a4cf5d:	89 54 24 10          	mov    %edx,0x10(%esp)
  a4cf61:	4c                   	dec    %esp
  a4cf62:	89 3c 24             	mov    %edi,(%esp)
  a4cf65:	e8 56 0d 00 00       	call   a4dcc0 <memcpy>
  a4cf6a:	48                   	dec    %eax
  a4cf6b:	8b 0c 24             	mov    (%esp),%ecx
  a4cf6e:	48                   	dec    %eax
  a4cf6f:	8b 54 24 10          	mov    0x10(%esp),%edx
  a4cf73:	48                   	dec    %eax
  a4cf74:	8d 04 11             	lea    (%ecx,%edx,1),%eax
  a4cf77:	2b 44 24 08          	sub    0x8(%esp),%eax
  a4cf7b:	e9 16 fa ff ff       	jmp    a4c996 <LZ4_decompress_fast_usingDict+0x186>
  a4cf80:	49                   	dec    %ecx
  a4cf81:	89 c0                	mov    %eax,%eax
  a4cf83:	48                   	dec    %eax
  a4cf84:	89 d1                	mov    %edx,%ecx
  a4cf86:	4d                   	dec    %ebp
  a4cf87:	8b 10                	mov    (%eax),%edx
  a4cf89:	48                   	dec    %eax
  a4cf8a:	83 c1 08             	add    $0x8,%ecx
  a4cf8d:	49                   	dec    %ecx
  a4cf8e:	83 c0 08             	add    $0x8,%eax
  a4cf91:	4c                   	dec    %esp
  a4cf92:	89 51 f8             	mov    %edx,-0x8(%ecx)
  a4cf95:	49                   	dec    %ecx
  a4cf96:	39 cb                	cmp    %ecx,%ebx
  a4cf98:	77 ec                	ja     a4cf86 <LZ4_decompress_fast_usingDict+0x776>
  a4cf9a:	4c                   	dec    %esp
  a4cf9b:	89 d9                	mov    %ebx,%ecx
  a4cf9d:	48                   	dec    %eax
  a4cf9e:	29 d1                	sub    %edx,%ecx
  a4cfa0:	4c                   	dec    %esp
  a4cfa1:	89 da                	mov    %ebx,%edx
  a4cfa3:	48                   	dec    %eax
  a4cfa4:	01 c8                	add    %ecx,%eax
  a4cfa6:	e9 3e ff ff ff       	jmp    a4cee9 <LZ4_decompress_fast_usingDict+0x6d9>
  a4cfab:	85 d2                	test   %edx,%edx
  a4cfad:	0f 84 c0 fc ff ff    	je     a4cc73 <LZ4_decompress_fast_usingDict+0x463>
  a4cfb3:	48                   	dec    %eax
  a4cfb4:	8b 5c 24 08          	mov    0x8(%esp),%ebx
  a4cfb8:	4c                   	dec    %esp
  a4cfb9:	8d 4e f8             	lea    -0x8(%esi),%ecx
  a4cfbc:	48                   	dec    %eax
  a4cfbd:	8d 7e f4             	lea    -0xc(%esi),%edi
  a4cfc0:	4c                   	dec    %esp
  a4cfc1:	8d 3d f9 6f 00 00    	lea    0x6ff9,%edi
  a4cfc7:	4c                   	dec    %esp
  a4cfc8:	8d 35 d2 6f 00 00    	lea    0x6fd2,%esi
  a4cfce:	4c                   	dec    %esp
  a4cfcf:	8d 5e f9             	lea    -0x7(%esi),%ebx
  a4cfd2:	4c                   	dec    %esp
  a4cfd3:	8d 6e fb             	lea    -0x5(%esi),%ebp
  a4cfd6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4cfdd:	00 00 00 
  a4cfe0:	41                   	inc    %ecx
  a4cfe1:	0f b6 c0             	movzbl %al,%eax
  a4cfe4:	48                   	dec    %eax
  a4cfe5:	83 c3 01             	add    $0x1,%ebx
  a4cfe8:	c1 e8 04             	shr    $0x4,%eax
  a4cfeb:	41                   	inc    %ecx
  a4cfec:	89 c4                	mov    %eax,%esp
  a4cfee:	83 f8 0f             	cmp    $0xf,%eax
  a4cff1:	0f 84 af 00 00 00    	je     a4d0a6 <LZ4_decompress_fast_usingDict+0x896>
  a4cff7:	4a                   	dec    %edx
  a4cff8:	8d 54 25 00          	lea    0x0(%ebp,%eiz,1),%edx
  a4cffc:	4c                   	dec    %esp
  a4cffd:	39 ca                	cmp    %ecx,%edx
  a4cfff:	0f 87 12 ff ff ff    	ja     a4cf17 <LZ4_decompress_fast_usingDict+0x707>
  a4d005:	48                   	dec    %eax
  a4d006:	89 d8                	mov    %ebx,%eax
  a4d008:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4d00f:	00 
  a4d010:	48                   	dec    %eax
  a4d011:	8b 08                	mov    (%eax),%ecx
  a4d013:	48                   	dec    %eax
  a4d014:	83 c5 08             	add    $0x8,%ebp
  a4d017:	48                   	dec    %eax
  a4d018:	83 c0 08             	add    $0x8,%eax
  a4d01b:	48                   	dec    %eax
  a4d01c:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  a4d01f:	48                   	dec    %eax
  a4d020:	39 ea                	cmp    %ebp,%edx
  a4d022:	77 ec                	ja     a4d010 <LZ4_decompress_fast_usingDict+0x800>
  a4d024:	4c                   	dec    %esp
  a4d025:	01 e3                	add    %esp,%ebx
  a4d027:	44                   	inc    %esp
  a4d028:	89 c0                	mov    %eax,%eax
  a4d02a:	49                   	dec    %ecx
  a4d02b:	89 d4                	mov    %edx,%esp
  a4d02d:	4c                   	dec    %esp
  a4d02e:	89 c1                	mov    %eax,%ecx
  a4d030:	44                   	inc    %esp
  a4d031:	0f b7 13             	movzwl (%ebx),%edx
  a4d034:	83 e0 0f             	and    $0xf,%eax
  a4d037:	48                   	dec    %eax
  a4d038:	83 c3 02             	add    $0x2,%ebx
  a4d03b:	83 e1 0f             	and    $0xf,%ecx
  a4d03e:	44                   	inc    %esp
  a4d03f:	89 12                	mov    %edx,(%edx)
  a4d041:	4d                   	dec    %ebp
  a4d042:	29 d4                	sub    %edx,%esp
  a4d044:	3c 0f                	cmp    $0xf,%al
  a4d046:	74 7c                	je     a4d0c4 <LZ4_decompress_fast_usingDict+0x8b4>
  a4d048:	48                   	dec    %eax
  a4d049:	83 c1 04             	add    $0x4,%ecx
  a4d04c:	48                   	dec    %eax
  a4d04d:	8d 2c 0a             	lea    (%edx,%ecx,1),%ebp
  a4d050:	49                   	dec    %ecx
  a4d051:	83 fa 07             	cmp    $0x7,%edx
  a4d054:	0f 86 99 00 00 00    	jbe    a4d0f3 <LZ4_decompress_fast_usingDict+0x8e3>
  a4d05a:	49                   	dec    %ecx
  a4d05b:	8b 04 24             	mov    (%esp),%eax
  a4d05e:	48                   	dec    %eax
  a4d05f:	89 02                	mov    %eax,(%edx)
  a4d061:	49                   	dec    %ecx
  a4d062:	8d 44 24 08          	lea    0x8(%esp),%eax
  a4d066:	48                   	dec    %eax
  a4d067:	39 fd                	cmp    %edi,%ebp
  a4d069:	0f 87 c4 00 00 00    	ja     a4d133 <LZ4_decompress_fast_usingDict+0x923>
  a4d06f:	4c                   	dec    %esp
  a4d070:	8b 00                	mov    (%eax),%eax
  a4d072:	4c                   	dec    %esp
  a4d073:	89 42 08             	mov    %eax,0x8(%edx)
  a4d076:	48                   	dec    %eax
  a4d077:	83 f9 10             	cmp    $0x10,%ecx
  a4d07a:	77 09                	ja     a4d085 <LZ4_decompress_fast_usingDict+0x875>
  a4d07c:	44                   	inc    %esp
  a4d07d:	0f b6 03             	movzbl (%ebx),%eax
  a4d080:	e9 5b ff ff ff       	jmp    a4cfe0 <LZ4_decompress_fast_usingDict+0x7d0>
  a4d085:	48                   	dec    %eax
  a4d086:	83 c0 08             	add    $0x8,%eax
  a4d089:	48                   	dec    %eax
  a4d08a:	83 c2 10             	add    $0x10,%edx
  a4d08d:	0f 1f 00             	nopl   (%eax)
  a4d090:	48                   	dec    %eax
  a4d091:	8b 08                	mov    (%eax),%ecx
  a4d093:	48                   	dec    %eax
  a4d094:	83 c2 08             	add    $0x8,%edx
  a4d097:	48                   	dec    %eax
  a4d098:	83 c0 08             	add    $0x8,%eax
  a4d09b:	48                   	dec    %eax
  a4d09c:	89 4a f8             	mov    %ecx,-0x8(%edx)
  a4d09f:	48                   	dec    %eax
  a4d0a0:	39 d5                	cmp    %edx,%ebp
  a4d0a2:	77 ec                	ja     a4d090 <LZ4_decompress_fast_usingDict+0x880>
  a4d0a4:	eb d6                	jmp    a4d07c <LZ4_decompress_fast_usingDict+0x86c>
  a4d0a6:	41                   	inc    %ecx
  a4d0a7:	bc 0f 00 00 00       	mov    $0xf,%esp
  a4d0ac:	0f 1f 40 00          	nopl   0x0(%eax)
  a4d0b0:	0f b6 13             	movzbl (%ebx),%edx
  a4d0b3:	48                   	dec    %eax
  a4d0b4:	83 c3 01             	add    $0x1,%ebx
  a4d0b7:	49                   	dec    %ecx
  a4d0b8:	01 d4                	add    %edx,%esp
  a4d0ba:	80 fa ff             	cmp    $0xff,%dl
  a4d0bd:	74 f1                	je     a4d0b0 <LZ4_decompress_fast_usingDict+0x8a0>
  a4d0bf:	e9 33 ff ff ff       	jmp    a4cff7 <LZ4_decompress_fast_usingDict+0x7e7>
  a4d0c4:	b9 0f 00 00 00       	mov    $0xf,%ecx
  a4d0c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4d0d0:	44                   	inc    %esp
  a4d0d1:	0f b6 03             	movzbl (%ebx),%eax
  a4d0d4:	48                   	dec    %eax
  a4d0d5:	83 c3 01             	add    $0x1,%ebx
  a4d0d8:	4c                   	dec    %esp
  a4d0d9:	01 c1                	add    %eax,%ecx
  a4d0db:	41                   	inc    %ecx
  a4d0dc:	80 f8 ff             	cmp    $0xff,%al
  a4d0df:	74 ef                	je     a4d0d0 <LZ4_decompress_fast_usingDict+0x8c0>
  a4d0e1:	48                   	dec    %eax
  a4d0e2:	83 c1 04             	add    $0x4,%ecx
  a4d0e5:	48                   	dec    %eax
  a4d0e6:	8d 2c 0a             	lea    (%edx,%ecx,1),%ebp
  a4d0e9:	49                   	dec    %ecx
  a4d0ea:	83 fa 07             	cmp    $0x7,%edx
  a4d0ed:	0f 87 67 ff ff ff    	ja     a4d05a <LZ4_decompress_fast_usingDict+0x84a>
  a4d0f3:	41                   	inc    %ecx
  a4d0f4:	0f b6 04 24          	movzbl (%esp),%eax
  a4d0f8:	88 02                	mov    %al,(%edx)
  a4d0fa:	41                   	inc    %ecx
  a4d0fb:	0f b6 44 24 01       	movzbl 0x1(%esp),%eax
  a4d100:	88 42 01             	mov    %al,0x1(%edx)
  a4d103:	41                   	inc    %ecx
  a4d104:	0f b6 44 24 02       	movzbl 0x2(%esp),%eax
  a4d109:	88 42 02             	mov    %al,0x2(%edx)
  a4d10c:	41                   	inc    %ecx
  a4d10d:	0f b6 44 24 03       	movzbl 0x3(%esp),%eax
  a4d112:	88 42 03             	mov    %al,0x3(%edx)
  a4d115:	43                   	inc    %ebx
  a4d116:	8b 04 96             	mov    (%esi,%edx,4),%eax
  a4d119:	4c                   	dec    %esp
  a4d11a:	01 e0                	add    %esp,%eax
  a4d11c:	44                   	inc    %esp
  a4d11d:	8b 00                	mov    (%eax),%eax
  a4d11f:	44                   	inc    %esp
  a4d120:	89 42 04             	mov    %eax,0x4(%edx)
  a4d123:	4f                   	dec    %edi
  a4d124:	63 04 97             	arpl   %ax,(%edi,%edx,4)
  a4d127:	4c                   	dec    %esp
  a4d128:	29 c0                	sub    %eax,%eax
  a4d12a:	48                   	dec    %eax
  a4d12b:	39 fd                	cmp    %edi,%ebp
  a4d12d:	0f 86 3c ff ff ff    	jbe    a4d06f <LZ4_decompress_fast_usingDict+0x85f>
  a4d133:	4c                   	dec    %esp
  a4d134:	39 ed                	cmp    %ebp,%ebp
  a4d136:	0f 87 45 fb ff ff    	ja     a4cc81 <LZ4_decompress_fast_usingDict+0x471>
  a4d13c:	48                   	dec    %eax
  a4d13d:	83 c2 08             	add    $0x8,%edx
  a4d140:	4c                   	dec    %esp
  a4d141:	39 da                	cmp    %ebx,%edx
  a4d143:	72 32                	jb     a4d177 <LZ4_decompress_fast_usingDict+0x967>
  a4d145:	48                   	dec    %eax
  a4d146:	39 d5                	cmp    %edx,%ebp
  a4d148:	0f 86 2e ff ff ff    	jbe    a4d07c <LZ4_decompress_fast_usingDict+0x86c>
  a4d14e:	49                   	dec    %ecx
  a4d14f:	89 ea                	mov    %ebp,%edx
  a4d151:	31 c9                	xor    %ecx,%ecx
  a4d153:	49                   	dec    %ecx
  a4d154:	29 d2                	sub    %edx,%edx
  a4d156:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4d15d:	00 00 00 
  a4d160:	44                   	inc    %esp
  a4d161:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
  a4d165:	44                   	inc    %esp
  a4d166:	88 04 0a             	mov    %al,(%edx,%ecx,1)
  a4d169:	48                   	dec    %eax
  a4d16a:	83 c1 01             	add    $0x1,%ecx
  a4d16d:	49                   	dec    %ecx
  a4d16e:	39 ca                	cmp    %ecx,%edx
  a4d170:	75 ee                	jne    a4d160 <LZ4_decompress_fast_usingDict+0x950>
  a4d172:	e9 05 ff ff ff       	jmp    a4d07c <LZ4_decompress_fast_usingDict+0x86c>
  a4d177:	49                   	dec    %ecx
  a4d178:	89 c0                	mov    %eax,%eax
  a4d17a:	48                   	dec    %eax
  a4d17b:	89 d1                	mov    %edx,%ecx
  a4d17d:	4d                   	dec    %ebp
  a4d17e:	8b 10                	mov    (%eax),%edx
  a4d180:	48                   	dec    %eax
  a4d181:	83 c1 08             	add    $0x8,%ecx
  a4d184:	49                   	dec    %ecx
  a4d185:	83 c0 08             	add    $0x8,%eax
  a4d188:	4c                   	dec    %esp
  a4d189:	89 51 f8             	mov    %edx,-0x8(%ecx)
  a4d18c:	49                   	dec    %ecx
  a4d18d:	39 cb                	cmp    %ecx,%ebx
  a4d18f:	77 ec                	ja     a4d17d <LZ4_decompress_fast_usingDict+0x96d>
  a4d191:	4c                   	dec    %esp
  a4d192:	89 d9                	mov    %ebx,%ecx
  a4d194:	48                   	dec    %eax
  a4d195:	29 d1                	sub    %edx,%ecx
  a4d197:	4c                   	dec    %esp
  a4d198:	89 da                	mov    %ebx,%edx
  a4d19a:	48                   	dec    %eax
  a4d19b:	01 c8                	add    %ecx,%eax
  a4d19d:	eb a6                	jmp    a4d145 <LZ4_decompress_fast_usingDict+0x935>
  a4d19f:	90                   	nop

0000000000a4d1a0 <__putstr>:
  a4d1a0:	f3 0f 1e fa          	endbr64 
  a4d1a4:	8b 35 32 e0 01 00    	mov    0x1e032,%esi
  a4d1aa:	49                   	dec    %ecx
  a4d1ab:	89 f9                	mov    %edi,%ecx
  a4d1ad:	85 f6                	test   %esi,%esi
  a4d1af:	74 62                	je     a4d213 <__putstr+0x73>
  a4d1b1:	0f b6 07             	movzbl (%edi),%eax
  a4d1b4:	84 c0                	test   %al,%al
  a4d1b6:	74 5b                	je     a4d213 <__putstr+0x73>
  a4d1b8:	49                   	dec    %ecx
  a4d1b9:	89 f8                	mov    %edi,%eax
  a4d1bb:	41                   	inc    %ecx
  a4d1bc:	bb 0d 00 00 00       	mov    $0xd,%ebx
  a4d1c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4d1c8:	8d 7e 05             	lea    0x5(%esi),%edi
  a4d1cb:	3c 0a                	cmp    $0xa,%al
  a4d1cd:	0f 84 3d 01 00 00    	je     a4d310 <__putstr+0x170>
  a4d1d3:	49                   	dec    %ecx
  a4d1d4:	83 c0 01             	add    $0x1,%eax
  a4d1d7:	89 fa                	mov    %edi,%edx
  a4d1d9:	45                   	inc    %ebp
  a4d1da:	0f b6 50 ff          	movzbl -0x1(%eax),%edx
  a4d1de:	ec                   	in     (%dx),%al
  a4d1df:	a8 20                	test   $0x20,%al
  a4d1e1:	75 22                	jne    a4d205 <__putstr+0x65>
  a4d1e3:	b9 fe ff 00 00       	mov    $0xfffe,%ecx
  a4d1e8:	eb 0b                	jmp    a4d1f5 <__putstr+0x55>
  a4d1ea:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4d1f0:	83 e9 01             	sub    $0x1,%ecx
  a4d1f3:	74 10                	je     a4d205 <__putstr+0x65>
  a4d1f5:	f3 90                	pause  
  a4d1f7:	8b 35 df df 01 00    	mov    0x1dfdf,%esi
  a4d1fd:	8d 56 05             	lea    0x5(%esi),%edx
  a4d200:	ec                   	in     (%dx),%al
  a4d201:	a8 20                	test   $0x20,%al
  a4d203:	74 eb                	je     a4d1f0 <__putstr+0x50>
  a4d205:	44                   	inc    %esp
  a4d206:	89 d0                	mov    %edx,%eax
  a4d208:	89 f2                	mov    %esi,%edx
  a4d20a:	ee                   	out    %al,(%dx)
  a4d20b:	41                   	inc    %ecx
  a4d20c:	0f b6 00             	movzbl (%eax),%eax
  a4d20f:	84 c0                	test   %al,%al
  a4d211:	75 b5                	jne    a4d1c8 <__putstr+0x28>
  a4d213:	8b 05 1b df 01 00    	mov    0x1df1b,%eax
  a4d219:	85 c0                	test   %eax,%eax
  a4d21b:	0f 84 e8 00 00 00    	je     a4d309 <__putstr+0x169>
  a4d221:	8b 05 09 df 01 00    	mov    0x1df09,%eax
  a4d227:	85 c0                	test   %eax,%eax
  a4d229:	0f 84 da 00 00 00    	je     a4d309 <__putstr+0x169>
  a4d22f:	55                   	push   %ebp
  a4d230:	53                   	push   %ebx
  a4d231:	49                   	dec    %ecx
  a4d232:	8d 59 01             	lea    0x1(%ecx),%ebx
  a4d235:	48                   	dec    %eax
  a4d236:	83 ec 08             	sub    $0x8,%esp
  a4d239:	48                   	dec    %eax
  a4d23a:	8b 35 d0 ce 01 00    	mov    0x1ced0,%esi
  a4d240:	41                   	inc    %ecx
  a4d241:	0f b6 11             	movzbl (%ecx),%edx
  a4d244:	0f b6 0e             	movzbl (%esi),%ecx
  a4d247:	0f b6 6e 01          	movzbl 0x1(%esi),%ebp
  a4d24b:	41                   	inc    %ecx
  a4d24c:	89 c8                	mov    %ecx,%eax
  a4d24e:	89 ef                	mov    %ebp,%edi
  a4d250:	84 d2                	test   %dl,%dl
  a4d252:	75 1b                	jne    a4d26f <__putstr+0xcf>
  a4d254:	eb 6f                	jmp    a4d2c5 <__putstr+0x125>
  a4d256:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4d25d:	00 00 00 
  a4d260:	89 c5                	mov    %eax,%ebp
  a4d262:	31 c9                	xor    %ecx,%ecx
  a4d264:	0f b6 13             	movzbl (%ebx),%edx
  a4d267:	48                   	dec    %eax
  a4d268:	83 c3 01             	add    $0x1,%ebx
  a4d26b:	84 d2                	test   %dl,%dl
  a4d26d:	74 44                	je     a4d2b3 <__putstr+0x113>
  a4d26f:	80 fa 0a             	cmp    $0xa,%dl
  a4d272:	74 22                	je     a4d296 <__putstr+0xf6>
  a4d274:	8b 35 b6 de 01 00    	mov    0x1deb6,%esi
  a4d27a:	48                   	dec    %eax
  a4d27b:	8b 3d bf de 01 00    	mov    0x1debf,%edi
  a4d281:	89 f0                	mov    %esi,%eax
  a4d283:	0f af c5             	imul   %ebp,%eax
  a4d286:	01 c8                	add    %ecx,%eax
  a4d288:	83 c1 01             	add    $0x1,%ecx
  a4d28b:	01 c0                	add    %eax,%eax
  a4d28d:	48                   	dec    %eax
  a4d28e:	98                   	cwtl   
  a4d28f:	88 14 07             	mov    %dl,(%edi,%eax,1)
  a4d292:	39 ce                	cmp    %ecx,%esi
  a4d294:	7f ce                	jg     a4d264 <__putstr+0xc4>
  a4d296:	8d 45 01             	lea    0x1(%ebp),%eax
  a4d299:	3b 05 95 de 01 00    	cmp    0x1de95,%eax
  a4d29f:	7c bf                	jl     a4d260 <__putstr+0xc0>
  a4d2a1:	e8 7a d3 ff ff       	call   a4a620 <scroll>
  a4d2a6:	0f b6 13             	movzbl (%ebx),%edx
  a4d2a9:	48                   	dec    %eax
  a4d2aa:	83 c3 01             	add    $0x1,%ebx
  a4d2ad:	31 c9                	xor    %ecx,%ecx
  a4d2af:	84 d2                	test   %dl,%dl
  a4d2b1:	75 bc                	jne    a4d26f <__putstr+0xcf>
  a4d2b3:	48                   	dec    %eax
  a4d2b4:	8b 35 56 ce 01 00    	mov    0x1ce56,%esi
  a4d2ba:	8b 05 70 de 01 00    	mov    0x1de70,%eax
  a4d2c0:	41                   	inc    %ecx
  a4d2c1:	89 c8                	mov    %ecx,%eax
  a4d2c3:	89 ef                	mov    %ebp,%edi
  a4d2c5:	0f af e8             	imul   %eax,%ebp
  a4d2c8:	44                   	inc    %esp
  a4d2c9:	88 06                	mov    %al,(%esi)
  a4d2cb:	8b 35 67 de 01 00    	mov    0x1de67,%esi
  a4d2d1:	b8 0e 00 00 00       	mov    $0xe,%eax
  a4d2d6:	48                   	dec    %eax
  a4d2d7:	8b 15 33 ce 01 00    	mov    0x1ce33,%edx
  a4d2dd:	01 e9                	add    %ebp,%ecx
  a4d2df:	40                   	inc    %eax
  a4d2e0:	88 7a 01             	mov    %bh,0x1(%edx)
  a4d2e3:	89 f2                	mov    %esi,%edx
  a4d2e5:	01 c9                	add    %ecx,%ecx
  a4d2e7:	ee                   	out    %al,(%dx)
  a4d2e8:	8d 7e 01             	lea    0x1(%esi),%edi
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
  a4d302:	48                   	dec    %eax
  a4d303:	83 c4 08             	add    $0x8,%esp
  a4d306:	5b                   	pop    %ebx
  a4d307:	5d                   	pop    %ebp
  a4d308:	c3                   	ret    
  a4d309:	c3                   	ret    
  a4d30a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
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
  a4d327:	8b 35 af de 01 00    	mov    0x1deaf,%esi
  a4d32d:	8d 7e 05             	lea    0x5(%esi),%edi
  a4d330:	89 fa                	mov    %edi,%edx
  a4d332:	ec                   	in     (%dx),%al
  a4d333:	a8 20                	test   $0x20,%al
  a4d335:	74 e9                	je     a4d320 <__putstr+0x180>
  a4d337:	44                   	inc    %esp
  a4d338:	89 d8                	mov    %ebx,%eax
  a4d33a:	89 f2                	mov    %esi,%edx
  a4d33c:	ee                   	out    %al,(%dx)
  a4d33d:	e9 91 fe ff ff       	jmp    a4d1d3 <__putstr+0x33>
  a4d342:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4d349:	00 00 00 00 
  a4d34d:	0f 1f 00             	nopl   (%eax)

0000000000a4d350 <__puthex>:
  a4d350:	f3 0f 1e fa          	endbr64 
  a4d354:	41                   	inc    %ecx
  a4d355:	54                   	push   %esp
  a4d356:	b8 30 00 00 00       	mov    $0x30,%eax
  a4d35b:	55                   	push   %ebp
  a4d35c:	48                   	dec    %eax
  a4d35d:	89 fd                	mov    %edi,%ebp
  a4d35f:	53                   	push   %ebx
  a4d360:	bb 3c 00 00 00       	mov    $0x3c,%ebx
  a4d365:	48                   	dec    %eax
  a4d366:	83 ec 10             	sub    $0x10,%esp
  a4d369:	66 89 44 24 0e       	mov    %ax,0xe(%esp)
  a4d36e:	4c                   	dec    %esp
  a4d36f:	8d 64 24 0e          	lea    0xe(%esp),%esp
  a4d373:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4d378:	89 d9                	mov    %ebx,%ecx
  a4d37a:	48                   	dec    %eax
  a4d37b:	89 e8                	mov    %ebp,%eax
  a4d37d:	4c                   	dec    %esp
  a4d37e:	89 e7                	mov    %esp,%edi
  a4d380:	48                   	dec    %eax
  a4d381:	d3 e8                	shr    %cl,%eax
  a4d383:	83 e0 0f             	and    $0xf,%eax
  a4d386:	8d 48 30             	lea    0x30(%eax),%ecx
  a4d389:	48                   	dec    %eax
  a4d38a:	83 f8 09             	cmp    $0x9,%eax
  a4d38d:	8d 50 57             	lea    0x57(%eax),%edx
  a4d390:	89 c8                	mov    %ecx,%eax
  a4d392:	0f 47 c2             	cmova  %edx,%eax
  a4d395:	83 eb 04             	sub    $0x4,%ebx
  a4d398:	88 44 24 0e          	mov    %al,0xe(%esp)
  a4d39c:	e8 ff fd ff ff       	call   a4d1a0 <__putstr>
  a4d3a1:	83 fb fc             	cmp    $0xfffffffc,%ebx
  a4d3a4:	75 d2                	jne    a4d378 <__puthex+0x28>
  a4d3a6:	48                   	dec    %eax
  a4d3a7:	83 c4 10             	add    $0x10,%esp
  a4d3aa:	5b                   	pop    %ebx
  a4d3ab:	5d                   	pop    %ebp
  a4d3ac:	41                   	inc    %ecx
  a4d3ad:	5c                   	pop    %esp
  a4d3ae:	c3                   	ret    
  a4d3af:	90                   	nop

0000000000a4d3b0 <extract_kernel>:
  a4d3b0:	f3 0f 1e fa          	endbr64 
  a4d3b4:	41                   	inc    %ecx
  a4d3b5:	57                   	push   %edi
  a4d3b6:	49                   	dec    %ecx
  a4d3b7:	89 ff                	mov    %edi,%edi
  a4d3b9:	41                   	inc    %ecx
  a4d3ba:	56                   	push   %esi
  a4d3bb:	49                   	dec    %ecx
  a4d3bc:	89 f6                	mov    %esi,%esi
  a4d3be:	41                   	inc    %ecx
  a4d3bf:	55                   	push   %ebp
  a4d3c0:	41                   	inc    %ecx
  a4d3c1:	54                   	push   %esp
  a4d3c2:	55                   	push   %ebp
  a4d3c3:	53                   	push   %ebx
  a4d3c4:	48                   	dec    %eax
  a4d3c5:	89 d3                	mov    %edx,%ebx
  a4d3c7:	48                   	dec    %eax
  a4d3c8:	81 ec d8 00 00 00    	sub    $0xd8,%esp
  a4d3ce:	80 a7 11 02 00 00 fd 	andb   $0xfd,0x211(%edi)
  a4d3d5:	80 bf ef 01 00 00 00 	cmpb   $0x0,0x1ef(%edi)
  a4d3dc:	48                   	dec    %eax
  a4d3dd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  a4d3e1:	4c                   	dec    %esp
  a4d3e2:	89 44 24 18          	mov    %eax,0x18(%esp)
  a4d3e6:	4c                   	dec    %esp
  a4d3e7:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  a4d3eb:	48                   	dec    %eax
  a4d3ec:	c7 44 24 28 00 00 00 	movl   $0x1000000,0x28(%esp)
  a4d3f3:	01 
  a4d3f4:	48                   	dec    %eax
  a4d3f5:	89 3d 15 cd 01 00    	mov    %edi,0x1cd15
  a4d3fb:	0f 85 77 01 00 00    	jne    a4d578 <extract_kernel+0x1c8>
  a4d401:	41                   	inc    %ecx
  a4d402:	80 7f 06 07          	cmpb   $0x7,0x6(%edi)
  a4d406:	0f 84 4c 01 00 00    	je     a4d558 <extract_kernel+0x1a8>
  a4d40c:	48                   	dec    %eax
  a4d40d:	c7 05 29 dd 01 00 00 	movl   $0xb8000,0x1dd29
  a4d414:	80 0b 00 
  a4d417:	c7 05 17 dd 01 00 d4 	movl   $0x3d4,0x1dd17
  a4d41e:	03 00 00 
  a4d421:	41                   	inc    %ecx
  a4d422:	0f b6 47 0e          	movzbl 0xe(%edi),%eax
  a4d426:	89 05 08 dd 01 00    	mov    %eax,0x1dd08
  a4d42c:	41                   	inc    %ecx
  a4d42d:	0f b6 47 07          	movzbl 0x7(%edi),%eax
  a4d431:	89 05 f9 dc 01 00    	mov    %eax,0x1dcf9
  a4d437:	e8 34 0f 00 00       	call   a4e370 <console_init>
  a4d43c:	48                   	dec    %eax
  a4d43d:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  a4d441:	48                   	dec    %eax
  a4d442:	8b 74 24 08          	mov    0x8(%esp),%esi
  a4d446:	48                   	dec    %eax
  a4d447:	89 df                	mov    %ebx,%edi
  a4d449:	49                   	dec    %ecx
  a4d44a:	8d 86 00 00 01 00    	lea    0x10000(%esi),%eax
  a4d450:	48                   	dec    %eax
  a4d451:	8d 54 24 18          	lea    0x18(%esp),%edx
  a4d455:	4c                   	dec    %esp
  a4d456:	89 35 ac cc 01 00    	mov    %esi,0x1ccac
  a4d45c:	48                   	dec    %eax
  a4d45d:	81 f9 00 c0 02 02    	cmp    $0x202c000,%ecx
  a4d463:	48                   	dec    %eax
  a4d464:	89 05 96 cc 01 00    	mov    %eax,0x1cc96
  a4d46a:	b8 00 c0 02 02       	mov    $0x202c000,%eax
  a4d46f:	4c                   	dec    %esp
  a4d470:	8d 44 24 28          	lea    0x28(%esp),%eax
  a4d474:	48                   	dec    %eax
  a4d475:	0f 43 c1             	cmovae %ecx,%eax
  a4d478:	48                   	dec    %eax
  a4d479:	89 c1                	mov    %eax,%ecx
  a4d47b:	49                   	dec    %ecx
  a4d47c:	89 c4                	mov    %eax,%esp
  a4d47e:	e8 bd 1a 00 00       	call   a4ef40 <choose_random_location>
  a4d483:	4c                   	dec    %esp
  a4d484:	8b 6c 24 18          	mov    0x18(%esp),%ebp
  a4d488:	41                   	inc    %ecx
  a4d489:	f7 c5 ff ff 1f 00    	test   $0x1fffff,%ebp
  a4d48f:	0f 85 2d 04 00 00    	jne    a4d8c2 <extract_kernel+0x512>
  a4d495:	48                   	dec    %eax
  a4d496:	8b 44 24 28          	mov    0x28(%esp),%eax
  a4d49a:	a9 ff ff 1f 00       	test   $0x1fffff,%eax
  a4d49f:	0f 85 41 04 00 00    	jne    a4d8e6 <extract_kernel+0x536>
  a4d4a5:	48                   	dec    %eax
  a4d4a6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  a4d4ab:	ff                   	(bad)  
  a4d4ac:	3f                   	aas    
  a4d4ad:	00 00                	add    %al,(%eax)
  a4d4af:	49                   	dec    %ecx
  a4d4b0:	39 d6                	cmp    %edx,%esi
  a4d4b2:	0f 87 22 04 00 00    	ja     a4d8da <extract_kernel+0x52a>
  a4d4b8:	4c                   	dec    %esp
  a4d4b9:	01 e0                	add    %esp,%eax
  a4d4bb:	48                   	dec    %eax
  a4d4bc:	3d 00 00 00 40       	cmp    $0x40000000,%eax
  a4d4c1:	0f 87 07 04 00 00    	ja     a4d8ce <extract_kernel+0x51e>
  a4d4c7:	4d                   	dec    %ebp
  a4d4c8:	85 ed                	test   %ebp,%ebp
  a4d4ca:	0f 84 50 01 00 00    	je     a4d620 <extract_kernel+0x270>
  a4d4d0:	48                   	dec    %eax
  a4d4d1:	85 db                	test   %ebx,%ebx
  a4d4d3:	0f 84 57 01 00 00    	je     a4d630 <extract_kernel+0x280>
  a4d4d9:	81 3b 02 21 4c 18    	cmpl   $0x184c2102,(%ebx)
  a4d4df:	0f 85 5b 01 00 00    	jne    a4d640 <extract_kernel+0x290>
  a4d4e5:	48                   	dec    %eax
  a4d4e6:	8b 44 24 08          	mov    0x8(%esp),%eax
  a4d4ea:	48                   	dec    %eax
  a4d4eb:	83 c3 04             	add    $0x4,%ebx
  a4d4ee:	44                   	inc    %esp
  a4d4ef:	8b 74 03 f8          	mov    -0x8(%ebx,%eax,1),%esi
  a4d4f3:	48                   	dec    %eax
  a4d4f4:	8d 68 f8             	lea    -0x8(%eax),%ebp
  a4d4f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4d4fe:	00 00 
  a4d500:	8b 03                	mov    (%ebx),%eax
  a4d502:	48                   	dec    %eax
  a4d503:	83 ed 04             	sub    $0x4,%ebp
  a4d506:	48                   	dec    %eax
  a4d507:	83 c3 04             	add    $0x4,%ebx
  a4d50a:	3d 02 21 4c 18       	cmp    $0x184c2102,%eax
  a4d50f:	74 ef                	je     a4d500 <extract_kernel+0x150>
  a4d511:	49                   	dec    %ecx
  a4d512:	81 fe ff ff 7f 00    	cmp    $0x7fffff,%esi
  a4d518:	0f 87 32 01 00 00    	ja     a4d650 <extract_kernel+0x2a0>
  a4d51e:	44                   	inc    %esp
  a4d51f:	89 f2                	mov    %esi,%edx
  a4d521:	4d                   	dec    %ebp
  a4d522:	89 f4                	mov    %esi,%esp
  a4d524:	4c                   	dec    %esp
  a4d525:	89 ee                	mov    %ebp,%esi
  a4d527:	48                   	dec    %eax
  a4d528:	89 df                	mov    %ebx,%edi
  a4d52a:	e8 01 d7 ff ff       	call   a4ac30 <LZ4_decompress_fast>
  a4d52f:	48                   	dec    %eax
  a4d530:	63 d0                	arpl   %dx,%ax
  a4d532:	85 c0                	test   %eax,%eax
  a4d534:	0f 88 2d 01 00 00    	js     a4d667 <extract_kernel+0x2b7>
  a4d53a:	4d                   	dec    %ebp
  a4d53b:	01 e5                	add    %esp,%ebp
  a4d53d:	48                   	dec    %eax
  a4d53e:	29 d5                	sub    %edx,%ebp
  a4d540:	0f 84 2d 01 00 00    	je     a4d673 <extract_kernel+0x2c3>
  a4d546:	0f 88 5d 02 00 00    	js     a4d7a9 <extract_kernel+0x3f9>
  a4d54c:	48                   	dec    %eax
  a4d54d:	01 d3                	add    %edx,%ebx
  a4d54f:	eb af                	jmp    a4d500 <extract_kernel+0x150>
  a4d551:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4d558:	48                   	dec    %eax
  a4d559:	c7 05 dd db 01 00 00 	movl   $0xb0000,0x1dbdd
  a4d560:	00 0b 00 
  a4d563:	c7 05 cb db 01 00 b4 	movl   $0x3b4,0x1dbcb
  a4d56a:	03 00 00 
  a4d56d:	e9 af fe ff ff       	jmp    a4d421 <extract_kernel+0x71>
  a4d572:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4d578:	b8 13 00 00 00       	mov    $0x13,%eax
  a4d57d:	48                   	dec    %eax
  a4d57e:	8d 7c 24 30          	lea    0x30(%esp),%edi
  a4d582:	48                   	dec    %eax
  a4d583:	8d 35 77 69 00 00    	lea    0x6977,%esi
  a4d589:	48                   	dec    %eax
  a4d58a:	89 c1                	mov    %eax,%ecx
  a4d58c:	4c                   	dec    %esp
  a4d58d:	8d 25 8d cb 01 00    	lea    0x1cb8d,%esp
  a4d593:	48                   	dec    %eax
  a4d594:	8d 6c 24 30          	lea    0x30(%esp),%ebp
  a4d598:	f3 48                	repz dec %eax
  a4d59a:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  a4d59b:	4c                   	dec    %esp
  a4d59c:	89 e7                	mov    %esp,%edi
  a4d59e:	4c                   	dec    %esp
  a4d59f:	8d ac 24 c8 00 00 00 	lea    0xc8(%esp),%ebp
  a4d5a6:	48                   	dec    %eax
  a4d5a7:	89 c8                	mov    %ecx,%eax
  a4d5a9:	b9 00 02 00 00       	mov    $0x200,%ecx
  a4d5ae:	f3 48                	repz dec %eax
  a4d5b0:	ab                   	stos   %eax,%es:(%edi)
  a4d5b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4d5b8:	8b 75 00             	mov    0x0(%ebp),%esi
  a4d5bb:	8b 55 04             	mov    0x4(%ebp),%edx
  a4d5be:	48                   	dec    %eax
  a4d5bf:	83 c5 08             	add    $0x8,%ebp
  a4d5c2:	49                   	dec    %ecx
  a4d5c3:	8d 3c 34             	lea    (%esp,%esi,1),%edi
  a4d5c6:	4c                   	dec    %esp
  a4d5c7:	01 fe                	add    %edi,%esi
  a4d5c9:	e8 f2 06 00 00       	call   a4dcc0 <memcpy>
  a4d5ce:	49                   	dec    %ecx
  a4d5cf:	39 ed                	cmp    %ebp,%ebp
  a4d5d1:	75 e5                	jne    a4d5b8 <extract_kernel+0x208>
  a4d5d3:	49                   	dec    %ecx
  a4d5d4:	8d 7f 08             	lea    0x8(%edi),%edi
  a4d5d7:	49                   	dec    %ecx
  a4d5d8:	8b 04 24             	mov    (%esp),%eax
  a4d5db:	4d                   	dec    %ebp
  a4d5dc:	89 fa                	mov    %edi,%edx
  a4d5de:	4c                   	dec    %esp
  a4d5df:	89 e6                	mov    %esp,%esi
  a4d5e1:	48                   	dec    %eax
  a4d5e2:	83 e7 f8             	and    $0xfffffff8,%edi
  a4d5e5:	49                   	dec    %ecx
  a4d5e6:	29 fa                	sub    %edi,%edx
  a4d5e8:	49                   	dec    %ecx
  a4d5e9:	89 07                	mov    %eax,(%edi)
  a4d5eb:	48                   	dec    %eax
  a4d5ec:	8b 05 26 db 01 00    	mov    0x1db26,%eax
  a4d5f2:	4c                   	dec    %esp
  a4d5f3:	29 d6                	sub    %edx,%esi
  a4d5f5:	41                   	inc    %ecx
  a4d5f6:	81 c2 00 10 00 00    	add    $0x1000,%edx
  a4d5fc:	41                   	inc    %ecx
  a4d5fd:	c1 ea 03             	shr    $0x3,%edx
  a4d600:	49                   	dec    %ecx
  a4d601:	89 87 f8 0f 00 00    	mov    %eax,0xff8(%edi)
  a4d607:	44                   	inc    %esp
  a4d608:	89 d1                	mov    %edx,%ecx
  a4d60a:	f3 48                	repz dec %eax
  a4d60c:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  a4d60d:	4c                   	dec    %esp
  a4d60e:	8b 3d fc ca 01 00    	mov    0x1cafc,%edi
  a4d614:	e9 e8 fd ff ff       	jmp    a4d401 <extract_kernel+0x51>
  a4d619:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4d620:	48                   	dec    %eax
  a4d621:	8d 3d e9 6d 00 00    	lea    0x6de9,%edi
  a4d627:	e8 24 0b 00 00       	call   a4e150 <error>
  a4d62c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4d630:	48                   	dec    %eax
  a4d631:	8d 3d 11 6e 00 00    	lea    0x6e11,%edi
  a4d637:	e8 14 0b 00 00       	call   a4e150 <error>
  a4d63c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4d640:	48                   	dec    %eax
  a4d641:	8d 3d 1d 6f 00 00    	lea    0x6f1d,%edi
  a4d647:	e8 04 0b 00 00       	call   a4e150 <error>
  a4d64c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4d650:	49                   	dec    %ecx
  a4d651:	81 ee 00 00 80 00    	sub    $0x800000,%esi
  a4d657:	ba 00 00 80 00       	mov    $0x800000,%edx
  a4d65c:	41                   	inc    %ecx
  a4d65d:	bc 00 00 80 00       	mov    $0x800000,%esp
  a4d662:	e9 bd fe ff ff       	jmp    a4d524 <extract_kernel+0x174>
  a4d667:	48                   	dec    %eax
  a4d668:	8d 3d 05 6f 00 00    	lea    0x6f05,%edi
  a4d66e:	e8 dd 0a 00 00       	call   a4e150 <error>
  a4d673:	4c                   	dec    %esp
  a4d674:	8b 6c 24 18          	mov    0x18(%esp),%ebp
  a4d678:	49                   	dec    %ecx
  a4d679:	8b 55 08             	mov    0x8(%ebp),%edx
  a4d67c:	49                   	dec    %ecx
  a4d67d:	8b 45 00             	mov    0x0(%ebp),%eax
  a4d680:	48                   	dec    %eax
  a4d681:	89 54 24 38          	mov    %edx,0x38(%esp)
  a4d685:	49                   	dec    %ecx
  a4d686:	8b 55 10             	mov    0x10(%ebp),%edx
  a4d689:	48                   	dec    %eax
  a4d68a:	89 44 24 30          	mov    %eax,0x30(%esp)
  a4d68e:	48                   	dec    %eax
  a4d68f:	89 54 24 40          	mov    %edx,0x40(%esp)
  a4d693:	49                   	dec    %ecx
  a4d694:	8b 55 18             	mov    0x18(%ebp),%edx
  a4d697:	48                   	dec    %eax
  a4d698:	89 54 24 48          	mov    %edx,0x48(%esp)
  a4d69c:	49                   	dec    %ecx
  a4d69d:	8b 55 20             	mov    0x20(%ebp),%edx
  a4d6a0:	48                   	dec    %eax
  a4d6a1:	89 54 24 50          	mov    %edx,0x50(%esp)
  a4d6a5:	49                   	dec    %ecx
  a4d6a6:	8b 55 28             	mov    0x28(%ebp),%edx
  a4d6a9:	48                   	dec    %eax
  a4d6aa:	89 54 24 58          	mov    %edx,0x58(%esp)
  a4d6ae:	49                   	dec    %ecx
  a4d6af:	8b 55 30             	mov    0x30(%ebp),%edx
  a4d6b2:	48                   	dec    %eax
  a4d6b3:	89 54 24 60          	mov    %edx,0x60(%esp)
  a4d6b7:	49                   	dec    %ecx
  a4d6b8:	8b 55 38             	mov    0x38(%ebp),%edx
  a4d6bb:	48                   	dec    %eax
  a4d6bc:	89 54 24 68          	mov    %edx,0x68(%esp)
  a4d6c0:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  a4d6c5:	0f 85 4b 02 00 00    	jne    a4d916 <extract_kernel+0x566>
  a4d6cb:	48                   	dec    %eax
  a4d6cc:	8b 05 56 da 01 00    	mov    0x1da56,%eax
  a4d6d2:	44                   	inc    %esp
  a4d6d3:	0f b7 74 24 68       	movzwl 0x68(%esp),%esi
  a4d6d8:	41                   	inc    %ecx
  a4d6d9:	6b d6 38             	imul   $0x38,%esi,%edx
  a4d6dc:	48                   	dec    %eax
  a4d6dd:	85 c0                	test   %eax,%eax
  a4d6df:	48                   	dec    %eax
  a4d6e0:	0f 44 05 21 ca 01 00 	cmove  0x1ca21,%eax
  a4d6e7:	44                   	inc    %esp
  a4d6e8:	89 f5                	mov    %esi,%ebp
  a4d6ea:	48                   	dec    %eax
  a4d6eb:	8d 58 03             	lea    0x3(%eax),%ebx
  a4d6ee:	48                   	dec    %eax
  a4d6ef:	83 e3 fc             	and    $0xfffffffc,%ebx
  a4d6f2:	89 d0                	mov    %edx,%eax
  a4d6f4:	48                   	dec    %eax
  a4d6f5:	8b 15 05 ca 01 00    	mov    0x1ca05,%edx
  a4d6fb:	48                   	dec    %eax
  a4d6fc:	01 d8                	add    %ebx,%eax
  a4d6fe:	48                   	dec    %eax
  a4d6ff:	89 05 23 da 01 00    	mov    %eax,0x1da23
  a4d705:	48                   	dec    %eax
  a4d706:	85 d2                	test   %edx,%edx
  a4d708:	0f 85 a7 00 00 00    	jne    a4d7b5 <extract_kernel+0x405>
  a4d70e:	44                   	inc    %esp
  a4d70f:	8b 25 0b da 01 00    	mov    0x1da0b,%esp
  a4d715:	41                   	inc    %ecx
  a4d716:	8d 44 24 01          	lea    0x1(%esp),%eax
  a4d71a:	89 05 00 da 01 00    	mov    %eax,0x1da00
  a4d720:	48                   	dec    %eax
  a4d721:	85 db                	test   %ebx,%ebx
  a4d723:	0f 84 95 00 00 00    	je     a4d7be <extract_kernel+0x40e>
  a4d729:	0f b7 c5             	movzwl %bp,%eax
  a4d72c:	48                   	dec    %eax
  a4d72d:	8b 74 24 50          	mov    0x50(%esp),%esi
  a4d731:	48                   	dec    %eax
  a4d732:	89 df                	mov    %ebx,%edi
  a4d734:	48                   	dec    %eax
  a4d735:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  a4d73c:	48                   	dec    %eax
  a4d73d:	29 c2                	sub    %eax,%edx
  a4d73f:	4c                   	dec    %esp
  a4d740:	01 ee                	add    %ebp,%esi
  a4d742:	48                   	dec    %eax
  a4d743:	c1 e2 03             	shl    $0x3,%edx
  a4d746:	e8 75 05 00 00       	call   a4dcc0 <memcpy>
  a4d74b:	66 85 ed             	test   %bp,%bp
  a4d74e:	0f 84 7c 00 00 00    	je     a4d7d0 <extract_kernel+0x420>
  a4d754:	41                   	inc    %ecx
  a4d755:	8d 46 ff             	lea    -0x1(%esi),%eax
  a4d758:	48                   	dec    %eax
  a4d759:	83 c0 01             	add    $0x1,%eax
  a4d75c:	48                   	dec    %eax
  a4d75d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  a4d764:	48                   	dec    %eax
  a4d765:	29 c2                	sub    %eax,%edx
  a4d767:	48                   	dec    %eax
  a4d768:	8d 2c d3             	lea    (%ebx,%edx,8),%ebp
  a4d76b:	eb 0c                	jmp    a4d779 <extract_kernel+0x3c9>
  a4d76d:	0f 1f 00             	nopl   (%eax)
  a4d770:	48                   	dec    %eax
  a4d771:	83 c3 38             	add    $0x38,%ebx
  a4d774:	48                   	dec    %eax
  a4d775:	39 dd                	cmp    %ebx,%ebp
  a4d777:	74 57                	je     a4d7d0 <extract_kernel+0x420>
  a4d779:	83 3b 01             	cmpl   $0x1,(%ebx)
  a4d77c:	75 f2                	jne    a4d770 <extract_kernel+0x3c0>
  a4d77e:	f7 43 30 ff ff 1f 00 	testl  $0x1fffff,0x30(%ebx)
  a4d785:	0f 85 97 01 00 00    	jne    a4d922 <extract_kernel+0x572>
  a4d78b:	48                   	dec    %eax
  a4d78c:	8b 73 08             	mov    0x8(%ebx),%esi
  a4d78f:	48                   	dec    %eax
  a4d790:	8b 43 18             	mov    0x18(%ebx),%eax
  a4d793:	48                   	dec    %eax
  a4d794:	8b 53 20             	mov    0x20(%ebx),%edx
  a4d797:	4c                   	dec    %esp
  a4d798:	01 ee                	add    %ebp,%esi
  a4d79a:	49                   	dec    %ecx
  a4d79b:	8d bc 05 00 00 00 ff 	lea    -0x1000000(%ebp,%eax,1),%edi
  a4d7a2:	e8 b9 04 00 00       	call   a4dc60 <memmove>
  a4d7a7:	eb c7                	jmp    a4d770 <extract_kernel+0x3c0>
  a4d7a9:	48                   	dec    %eax
  a4d7aa:	8d 3d d3 6d 00 00    	lea    0x6dd3,%edi
  a4d7b0:	e8 9b 09 00 00       	call   a4e150 <error>
  a4d7b5:	48                   	dec    %eax
  a4d7b6:	39 d0                	cmp    %edx,%eax
  a4d7b8:	0f 82 50 ff ff ff    	jb     a4d70e <extract_kernel+0x35e>
  a4d7be:	48                   	dec    %eax
  a4d7bf:	8d 3d d3 6c 00 00    	lea    0x6cd3,%edi
  a4d7c5:	e8 86 09 00 00       	call   a4e150 <error>
  a4d7ca:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4d7d0:	44                   	inc    %esp
  a4d7d1:	89 25 49 d9 01 00    	mov    %esp,0x1d949
  a4d7d7:	45                   	inc    %ebp
  a4d7d8:	85 e4                	test   %esp,%esp
  a4d7da:	75 0e                	jne    a4d7ea <extract_kernel+0x43a>
  a4d7dc:	48                   	dec    %eax
  a4d7dd:	8b 05 25 c9 01 00    	mov    0x1c925,%eax
  a4d7e3:	48                   	dec    %eax
  a4d7e4:	89 05 3e d9 01 00    	mov    %eax,0x1d93e
  a4d7ea:	48                   	dec    %eax
  a4d7eb:	8b 54 24 28          	mov    0x28(%esp),%edx
  a4d7ef:	4c                   	dec    %esp
  a4d7f0:	8b 44 24 18          	mov    0x18(%esp),%eax
  a4d7f4:	48                   	dec    %eax
  a4d7f5:	81 ea 00 00 00 01    	sub    $0x1000000,%edx
  a4d7fb:	0f 84 a7 00 00 00    	je     a4d8a8 <extract_kernel+0x4f8>
  a4d801:	48                   	dec    %eax
  a4d802:	8b 44 24 10          	mov    0x10(%esp),%eax
  a4d806:	49                   	dec    %ecx
  a4d807:	8d b0 00 30 b3 01    	lea    0x1b33000(%eax),%esi
  a4d80d:	49                   	dec    %ecx
  a4d80e:	8d b8 00 00 00 7f    	lea    0x7f000000(%eax),%edi
  a4d814:	49                   	dec    %ecx
  a4d815:	8d 4c 00 fc          	lea    -0x4(%eax,%eax,1),%ecx
  a4d819:	48                   	dec    %eax
  a4d81a:	63 01                	arpl   %ax,(%ecx)
  a4d81c:	85 c0                	test   %eax,%eax
  a4d81e:	74 22                	je     a4d842 <extract_kernel+0x492>
  a4d820:	48                   	dec    %eax
  a4d821:	01 f8                	add    %edi,%eax
  a4d823:	49                   	dec    %ecx
  a4d824:	39 c0                	cmp    %eax,%eax
  a4d826:	0f 87 de 00 00 00    	ja     a4d90a <extract_kernel+0x55a>
  a4d82c:	48                   	dec    %eax
  a4d82d:	39 c6                	cmp    %eax,%esi
  a4d82f:	0f 82 d5 00 00 00    	jb     a4d90a <extract_kernel+0x55a>
  a4d835:	48                   	dec    %eax
  a4d836:	83 e9 04             	sub    $0x4,%ecx
  a4d839:	01 10                	add    %edx,(%eax)
  a4d83b:	48                   	dec    %eax
  a4d83c:	63 01                	arpl   %ax,(%ecx)
  a4d83e:	85 c0                	test   %eax,%eax
  a4d840:	75 de                	jne    a4d820 <extract_kernel+0x470>
  a4d842:	48                   	dec    %eax
  a4d843:	63 41 fc             	arpl   %ax,-0x4(%ecx)
  a4d846:	4c                   	dec    %esp
  a4d847:	8d 49 fc             	lea    -0x4(%ecx),%ecx
  a4d84a:	85 c0                	test   %eax,%eax
  a4d84c:	75 05                	jne    a4d853 <extract_kernel+0x4a3>
  a4d84e:	eb 6d                	jmp    a4d8bd <extract_kernel+0x50d>
  a4d850:	49                   	dec    %ecx
  a4d851:	89 c9                	mov    %ecx,%ecx
  a4d853:	48                   	dec    %eax
  a4d854:	01 f8                	add    %edi,%eax
  a4d856:	49                   	dec    %ecx
  a4d857:	39 c0                	cmp    %eax,%eax
  a4d859:	0f 87 93 00 00 00    	ja     a4d8f2 <extract_kernel+0x542>
  a4d85f:	48                   	dec    %eax
  a4d860:	39 c6                	cmp    %eax,%esi
  a4d862:	0f 82 8a 00 00 00    	jb     a4d8f2 <extract_kernel+0x542>
  a4d868:	29 10                	sub    %edx,(%eax)
  a4d86a:	49                   	dec    %ecx
  a4d86b:	63 41 fc             	arpl   %ax,-0x4(%ecx)
  a4d86e:	49                   	dec    %ecx
  a4d86f:	8d 49 fc             	lea    -0x4(%ecx),%ecx
  a4d872:	85 c0                	test   %eax,%eax
  a4d874:	75 da                	jne    a4d850 <extract_kernel+0x4a0>
  a4d876:	49                   	dec    %ecx
  a4d877:	63 41 f8             	arpl   %ax,-0x8(%ecx)
  a4d87a:	49                   	dec    %ecx
  a4d87b:	8d 49 f8             	lea    -0x8(%ecx),%ecx
  a4d87e:	85 c0                	test   %eax,%eax
  a4d880:	74 21                	je     a4d8a3 <extract_kernel+0x4f3>
  a4d882:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4d888:	48                   	dec    %eax
  a4d889:	01 f8                	add    %edi,%eax
  a4d88b:	49                   	dec    %ecx
  a4d88c:	39 c0                	cmp    %eax,%eax
  a4d88e:	77 6e                	ja     a4d8fe <extract_kernel+0x54e>
  a4d890:	48                   	dec    %eax
  a4d891:	39 c6                	cmp    %eax,%esi
  a4d893:	72 69                	jb     a4d8fe <extract_kernel+0x54e>
  a4d895:	48                   	dec    %eax
  a4d896:	83 e9 04             	sub    $0x4,%ecx
  a4d899:	48                   	dec    %eax
  a4d89a:	01 10                	add    %edx,(%eax)
  a4d89c:	48                   	dec    %eax
  a4d89d:	63 01                	arpl   %ax,(%ecx)
  a4d89f:	85 c0                	test   %eax,%eax
  a4d8a1:	75 e5                	jne    a4d888 <extract_kernel+0x4d8>
  a4d8a3:	4c                   	dec    %esp
  a4d8a4:	8b 44 24 18          	mov    0x18(%esp),%eax
  a4d8a8:	48                   	dec    %eax
  a4d8a9:	81 c4 d8 00 00 00    	add    $0xd8,%esp
  a4d8af:	4c                   	dec    %esp
  a4d8b0:	89 c0                	mov    %eax,%eax
  a4d8b2:	5b                   	pop    %ebx
  a4d8b3:	5d                   	pop    %ebp
  a4d8b4:	41                   	inc    %ecx
  a4d8b5:	5c                   	pop    %esp
  a4d8b6:	41                   	inc    %ecx
  a4d8b7:	5d                   	pop    %ebp
  a4d8b8:	41                   	inc    %ecx
  a4d8b9:	5e                   	pop    %esi
  a4d8ba:	41                   	inc    %ecx
  a4d8bb:	5f                   	pop    %edi
  a4d8bc:	c3                   	ret    
  a4d8bd:	49                   	dec    %ecx
  a4d8be:	89 c9                	mov    %ecx,%ecx
  a4d8c0:	eb b4                	jmp    a4d876 <extract_kernel+0x4c6>
  a4d8c2:	48                   	dec    %eax
  a4d8c3:	8d 3d 97 6a 00 00    	lea    0x6a97,%edi
  a4d8c9:	e8 82 08 00 00       	call   a4e150 <error>
  a4d8ce:	48                   	dec    %eax
  a4d8cf:	8d 3d fb 6a 00 00    	lea    0x6afb,%edi
  a4d8d5:	e8 76 08 00 00       	call   a4e150 <error>
  a4d8da:	48                   	dec    %eax
  a4d8db:	8d 3d 65 6c 00 00    	lea    0x6c65,%edi
  a4d8e1:	e8 6a 08 00 00       	call   a4e150 <error>
  a4d8e6:	48                   	dec    %eax
  a4d8e7:	8d 3d ab 6a 00 00    	lea    0x6aab,%edi
  a4d8ed:	e8 5e 08 00 00       	call   a4e150 <error>
  a4d8f2:	48                   	dec    %eax
  a4d8f3:	8d 3d f7 6b 00 00    	lea    0x6bf7,%edi
  a4d8f9:	e8 52 08 00 00       	call   a4e150 <error>
  a4d8fe:	48                   	dec    %eax
  a4d8ff:	8d 3d 1b 6c 00 00    	lea    0x6c1b,%edi
  a4d905:	e8 46 08 00 00       	call   a4e150 <error>
  a4d90a:	48                   	dec    %eax
  a4d90b:	8d 3d e7 6b 00 00    	lea    0x6be7,%edi
  a4d911:	e8 3a 08 00 00       	call   a4e150 <error>
  a4d916:	48                   	dec    %eax
  a4d917:	8d 3d 5b 6b 00 00    	lea    0x6b5b,%edi
  a4d91d:	e8 2e 08 00 00       	call   a4e150 <error>
  a4d922:	48                   	dec    %eax
  a4d923:	8d 3d 97 6b 00 00    	lea    0x6b97,%edi
  a4d929:	e8 22 08 00 00       	call   a4e150 <error>
  a4d92e:	66 90                	xchg   %ax,%ax

0000000000a4d930 <memcmp>:
  a4d930:	f3 0f 1e fa          	endbr64 
  a4d934:	48                   	dec    %eax
  a4d935:	89 d1                	mov    %edx,%ecx
  a4d937:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
  a4d939:	0f 95 c0             	setne  %al
  a4d93c:	0f b6 c0             	movzbl %al,%eax
  a4d93f:	c3                   	ret    

0000000000a4d940 <bcmp>:
  a4d940:	f3 0f 1e fa          	endbr64 
  a4d944:	48                   	dec    %eax
  a4d945:	89 d1                	mov    %edx,%ecx
  a4d947:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
  a4d949:	0f 95 c0             	setne  %al
  a4d94c:	0f b6 c0             	movzbl %al,%eax
  a4d94f:	c3                   	ret    

0000000000a4d950 <strcmp>:
  a4d950:	f3 0f 1e fa          	endbr64 
  a4d954:	31 c9                	xor    %ecx,%ecx
  a4d956:	eb 10                	jmp    a4d968 <strcmp+0x18>
  a4d958:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4d95f:	00 
  a4d960:	48                   	dec    %eax
  a4d961:	83 c1 01             	add    $0x1,%ecx
  a4d964:	29 d0                	sub    %edx,%eax
  a4d966:	75 12                	jne    a4d97a <strcmp+0x2a>
  a4d968:	0f b6 04 0f          	movzbl (%edi,%ecx,1),%eax
  a4d96c:	0f b6 14 0e          	movzbl (%esi,%ecx,1),%edx
  a4d970:	41                   	inc    %ecx
  a4d971:	89 c0                	mov    %eax,%eax
  a4d973:	41                   	inc    %ecx
  a4d974:	08 d0                	or     %dl,%al
  a4d976:	75 e8                	jne    a4d960 <strcmp+0x10>
  a4d978:	31 c0                	xor    %eax,%eax
  a4d97a:	c3                   	ret    
  a4d97b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)

0000000000a4d980 <strncmp>:
  a4d980:	f3 0f 1e fa          	endbr64 
  a4d984:	48                   	dec    %eax
  a4d985:	89 d1                	mov    %edx,%ecx
  a4d987:	48                   	dec    %eax
  a4d988:	85 d2                	test   %edx,%edx
  a4d98a:	74 24                	je     a4d9b0 <strncmp+0x30>
  a4d98c:	31 c0                	xor    %eax,%eax
  a4d98e:	eb 0d                	jmp    a4d99d <strncmp+0x1d>
  a4d990:	84 d2                	test   %dl,%dl
  a4d992:	74 1c                	je     a4d9b0 <strncmp+0x30>
  a4d994:	48                   	dec    %eax
  a4d995:	83 c0 01             	add    $0x1,%eax
  a4d998:	48                   	dec    %eax
  a4d999:	39 c8                	cmp    %ecx,%eax
  a4d99b:	74 13                	je     a4d9b0 <strncmp+0x30>
  a4d99d:	0f b6 14 07          	movzbl (%edi,%eax,1),%edx
  a4d9a1:	3a 14 06             	cmp    (%esi,%eax,1),%dl
  a4d9a4:	74 ea                	je     a4d990 <strncmp+0x10>
  a4d9a6:	19 c0                	sbb    %eax,%eax
  a4d9a8:	83 c8 01             	or     $0x1,%eax
  a4d9ab:	c3                   	ret    
  a4d9ac:	0f 1f 40 00          	nopl   0x0(%eax)
  a4d9b0:	31 c0                	xor    %eax,%eax
  a4d9b2:	c3                   	ret    
  a4d9b3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4d9ba:	00 00 00 00 
  a4d9be:	66 90                	xchg   %ax,%ax

0000000000a4d9c0 <strnlen>:
  a4d9c0:	f3 0f 1e fa          	endbr64 
  a4d9c4:	80 3f 00             	cmpb   $0x0,(%edi)
  a4d9c7:	74 27                	je     a4d9f0 <strnlen+0x30>
  a4d9c9:	48                   	dec    %eax
  a4d9ca:	85 f6                	test   %esi,%esi
  a4d9cc:	74 22                	je     a4d9f0 <strnlen+0x30>
  a4d9ce:	48                   	dec    %eax
  a4d9cf:	89 f8                	mov    %edi,%eax
  a4d9d1:	eb 0a                	jmp    a4d9dd <strnlen+0x1d>
  a4d9d3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4d9d8:	80 38 00             	cmpb   $0x0,(%eax)
  a4d9db:	74 0f                	je     a4d9ec <strnlen+0x2c>
  a4d9dd:	48                   	dec    %eax
  a4d9de:	83 c0 01             	add    $0x1,%eax
  a4d9e1:	48                   	dec    %eax
  a4d9e2:	89 f2                	mov    %esi,%edx
  a4d9e4:	48                   	dec    %eax
  a4d9e5:	29 c2                	sub    %eax,%edx
  a4d9e7:	48                   	dec    %eax
  a4d9e8:	01 fa                	add    %edi,%edx
  a4d9ea:	75 ec                	jne    a4d9d8 <strnlen+0x18>
  a4d9ec:	48                   	dec    %eax
  a4d9ed:	29 f8                	sub    %edi,%eax
  a4d9ef:	c3                   	ret    
  a4d9f0:	31 c0                	xor    %eax,%eax
  a4d9f2:	c3                   	ret    
  a4d9f3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4d9fa:	00 00 00 00 
  a4d9fe:	66 90                	xchg   %ax,%ax

0000000000a4da00 <atou>:
  a4da00:	f3 0f 1e fa          	endbr64 
  a4da04:	0f be 07             	movsbl (%edi),%eax
  a4da07:	45                   	inc    %ebp
  a4da08:	31 c0                	xor    %eax,%eax
  a4da0a:	8d 50 d0             	lea    -0x30(%eax),%edx
  a4da0d:	83 fa 09             	cmp    $0x9,%edx
  a4da10:	77 1e                	ja     a4da30 <atou+0x30>
  a4da12:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4da18:	43                   	inc    %ebx
  a4da19:	8d 14 80             	lea    (%eax,%eax,4),%edx
  a4da1c:	48                   	dec    %eax
  a4da1d:	83 c7 01             	add    $0x1,%edi
  a4da20:	44                   	inc    %esp
  a4da21:	8d 44 50 d0          	lea    -0x30(%eax,%edx,2),%eax
  a4da25:	0f be 07             	movsbl (%edi),%eax
  a4da28:	8d 50 d0             	lea    -0x30(%eax),%edx
  a4da2b:	83 fa 09             	cmp    $0x9,%edx
  a4da2e:	76 e8                	jbe    a4da18 <atou+0x18>
  a4da30:	44                   	inc    %esp
  a4da31:	89 c0                	mov    %eax,%eax
  a4da33:	c3                   	ret    
  a4da34:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4da3b:	00 00 00 00 
  a4da3f:	90                   	nop

0000000000a4da40 <simple_strtoull>:
  a4da40:	f3 0f 1e fa          	endbr64 
  a4da44:	89 d1                	mov    %edx,%ecx
  a4da46:	0f b6 17             	movzbl (%edi),%edx
  a4da49:	85 c9                	test   %ecx,%ecx
  a4da4b:	75 53                	jne    a4daa0 <simple_strtoull+0x60>
  a4da4d:	b9 0a 00 00 00       	mov    $0xa,%ecx
  a4da52:	80 fa 30             	cmp    $0x30,%dl
  a4da55:	74 79                	je     a4dad0 <simple_strtoull+0x90>
  a4da57:	45                   	inc    %ebp
  a4da58:	31 c0                	xor    %eax,%eax
  a4da5a:	41                   	inc    %ecx
  a4da5b:	89 c9                	mov    %ecx,%ecx
  a4da5d:	eb 10                	jmp    a4da6f <simple_strtoull+0x2f>
  a4da5f:	90                   	nop
  a4da60:	4d                   	dec    %ebp
  a4da61:	0f af c1             	imul   %ecx,%eax
  a4da64:	0f b6 57 01          	movzbl 0x1(%edi),%edx
  a4da68:	48                   	dec    %eax
  a4da69:	83 c7 01             	add    $0x1,%edi
  a4da6c:	49                   	dec    %ecx
  a4da6d:	01 c0                	add    %eax,%eax
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
  a4da8c:	8d 42 a9             	lea    -0x57(%edx),%eax
  a4da8f:	39 c8                	cmp    %ecx,%eax
  a4da91:	72 cd                	jb     a4da60 <simple_strtoull+0x20>
  a4da93:	48                   	dec    %eax
  a4da94:	85 f6                	test   %esi,%esi
  a4da96:	74 03                	je     a4da9b <simple_strtoull+0x5b>
  a4da98:	48                   	dec    %eax
  a4da99:	89 3e                	mov    %edi,(%esi)
  a4da9b:	4c                   	dec    %esp
  a4da9c:	89 c0                	mov    %eax,%eax
  a4da9e:	c3                   	ret    
  a4da9f:	90                   	nop
  a4daa0:	83 f9 10             	cmp    $0x10,%ecx
  a4daa3:	75 b2                	jne    a4da57 <simple_strtoull+0x17>
  a4daa5:	80 fa 30             	cmp    $0x30,%dl
  a4daa8:	75 ad                	jne    a4da57 <simple_strtoull+0x17>
  a4daaa:	0f b6 47 01          	movzbl 0x1(%edi),%eax
  a4daae:	83 c8 20             	or     $0x20,%eax
  a4dab1:	3c 78                	cmp    $0x78,%al
  a4dab3:	75 a2                	jne    a4da57 <simple_strtoull+0x17>
  a4dab5:	44                   	inc    %esp
  a4dab6:	0f b6 47 02          	movzbl 0x2(%edi),%eax
  a4daba:	44                   	inc    %esp
  a4dabb:	89 c2                	mov    %eax,%edx
  a4dabd:	48                   	dec    %eax
  a4dabe:	83 c7 02             	add    $0x2,%edi
  a4dac1:	b9 10 00 00 00       	mov    $0x10,%ecx
  a4dac6:	eb 8f                	jmp    a4da57 <simple_strtoull+0x17>
  a4dac8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4dacf:	00 
  a4dad0:	0f b6 47 01          	movzbl 0x1(%edi),%eax
  a4dad4:	b9 08 00 00 00       	mov    $0x8,%ecx
  a4dad9:	83 c8 20             	or     $0x20,%eax
  a4dadc:	3c 78                	cmp    $0x78,%al
  a4dade:	0f 85 73 ff ff ff    	jne    a4da57 <simple_strtoull+0x17>
  a4dae4:	0f be 47 02          	movsbl 0x2(%edi),%eax
  a4dae8:	41                   	inc    %ecx
  a4dae9:	89 c0                	mov    %eax,%eax
  a4daeb:	83 e8 30             	sub    $0x30,%eax
  a4daee:	83 f8 09             	cmp    $0x9,%eax
  a4daf1:	76 c7                	jbe    a4daba <simple_strtoull+0x7a>
  a4daf3:	44                   	inc    %esp
  a4daf4:	89 c0                	mov    %eax,%eax
  a4daf6:	83 e0 df             	and    $0xffffffdf,%eax
  a4daf9:	83 e8 41             	sub    $0x41,%eax
  a4dafc:	3c 05                	cmp    $0x5,%al
  a4dafe:	76 ba                	jbe    a4daba <simple_strtoull+0x7a>
  a4db00:	e9 52 ff ff ff       	jmp    a4da57 <simple_strtoull+0x17>
  a4db05:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4db0c:	00 00 00 00 

0000000000a4db10 <simple_strtol>:
  a4db10:	f3 0f 1e fa          	endbr64 
  a4db14:	80 3f 2d             	cmpb   $0x2d,(%edi)
  a4db17:	74 07                	je     a4db20 <simple_strtol+0x10>
  a4db19:	e9 22 ff ff ff       	jmp    a4da40 <simple_strtoull>
  a4db1e:	66 90                	xchg   %ax,%ax
  a4db20:	48                   	dec    %eax
  a4db21:	83 c7 01             	add    $0x1,%edi
  a4db24:	e8 17 ff ff ff       	call   a4da40 <simple_strtoull>
  a4db29:	48                   	dec    %eax
  a4db2a:	f7 d8                	neg    %eax
  a4db2c:	c3                   	ret    
  a4db2d:	0f 1f 00             	nopl   (%eax)

0000000000a4db30 <strlen>:
  a4db30:	f3 0f 1e fa          	endbr64 
  a4db34:	80 3f 00             	cmpb   $0x0,(%edi)
  a4db37:	74 17                	je     a4db50 <strlen+0x20>
  a4db39:	48                   	dec    %eax
  a4db3a:	89 f8                	mov    %edi,%eax
  a4db3c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4db40:	48                   	dec    %eax
  a4db41:	83 c0 01             	add    $0x1,%eax
  a4db44:	80 38 00             	cmpb   $0x0,(%eax)
  a4db47:	75 f7                	jne    a4db40 <strlen+0x10>
  a4db49:	48                   	dec    %eax
  a4db4a:	29 f8                	sub    %edi,%eax
  a4db4c:	c3                   	ret    
  a4db4d:	0f 1f 00             	nopl   (%eax)
  a4db50:	31 c0                	xor    %eax,%eax
  a4db52:	c3                   	ret    
  a4db53:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4db5a:	00 00 00 00 
  a4db5e:	66 90                	xchg   %ax,%ax

0000000000a4db60 <strstr>:
  a4db60:	f3 0f 1e fa          	endbr64 
  a4db64:	80 3e 00             	cmpb   $0x0,(%esi)
  a4db67:	48                   	dec    %eax
  a4db68:	89 f8                	mov    %edi,%eax
  a4db6a:	49                   	dec    %ecx
  a4db6b:	89 f2                	mov    %esi,%edx
  a4db6d:	0f 84 85 00 00 00    	je     a4dbf8 <strstr+0x98>
  a4db73:	48                   	dec    %eax
  a4db74:	89 f2                	mov    %esi,%edx
  a4db76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4db7d:	00 00 00 
  a4db80:	48                   	dec    %eax
  a4db81:	83 c2 01             	add    $0x1,%edx
  a4db84:	80 3a 00             	cmpb   $0x0,(%edx)
  a4db87:	75 f7                	jne    a4db80 <strstr+0x20>
  a4db89:	49                   	dec    %ecx
  a4db8a:	89 c1                	mov    %eax,%ecx
  a4db8c:	4c                   	dec    %esp
  a4db8d:	29 d2                	sub    %edx,%edx
  a4db8f:	74 60                	je     a4dbf1 <strstr+0x91>
  a4db91:	80 38 00             	cmpb   $0x0,(%eax)
  a4db94:	74 58                	je     a4dbee <strstr+0x8e>
  a4db96:	48                   	dec    %eax
  a4db97:	89 c1                	mov    %eax,%ecx
  a4db99:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4dba0:	48                   	dec    %eax
  a4dba1:	83 c1 01             	add    $0x1,%ecx
  a4dba4:	80 39 00             	cmpb   $0x0,(%ecx)
  a4dba7:	75 f7                	jne    a4dba0 <strstr+0x40>
  a4dba9:	48                   	dec    %eax
  a4dbaa:	29 c1                	sub    %eax,%ecx
  a4dbac:	49                   	dec    %ecx
  a4dbad:	89 c8                	mov    %ecx,%eax
  a4dbaf:	48                   	dec    %eax
  a4dbb0:	39 ca                	cmp    %ecx,%edx
  a4dbb2:	77 3a                	ja     a4dbee <strstr+0x8e>
  a4dbb4:	48                   	dec    %eax
  a4dbb5:	89 c7                	mov    %eax,%edi
  a4dbb7:	4c                   	dec    %esp
  a4dbb8:	89 d6                	mov    %edx,%esi
  a4dbba:	48                   	dec    %eax
  a4dbbb:	89 d1                	mov    %edx,%ecx
  a4dbbd:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
  a4dbbf:	74 37                	je     a4dbf8 <strstr+0x98>
  a4dbc1:	48                   	dec    %eax
  a4dbc2:	83 c0 01             	add    $0x1,%eax
  a4dbc5:	48                   	dec    %eax
  a4dbc6:	89 c1                	mov    %eax,%ecx
  a4dbc8:	48                   	dec    %eax
  a4dbc9:	29 d1                	sub    %edx,%ecx
  a4dbcb:	49                   	dec    %ecx
  a4dbcc:	01 c8                	add    %ecx,%eax
  a4dbce:	eb 16                	jmp    a4dbe6 <strstr+0x86>
  a4dbd0:	48                   	dec    %eax
  a4dbd1:	89 c7                	mov    %eax,%edi
  a4dbd3:	4c                   	dec    %esp
  a4dbd4:	89 d6                	mov    %edx,%esi
  a4dbd6:	48                   	dec    %eax
  a4dbd7:	89 d1                	mov    %edx,%ecx
  a4dbd9:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
  a4dbdb:	0f 95 c1             	setne  %cl
  a4dbde:	48                   	dec    %eax
  a4dbdf:	83 c0 01             	add    $0x1,%eax
  a4dbe2:	84 c9                	test   %cl,%cl
  a4dbe4:	74 0b                	je     a4dbf1 <strstr+0x91>
  a4dbe6:	49                   	dec    %ecx
  a4dbe7:	89 c1                	mov    %eax,%ecx
  a4dbe9:	4c                   	dec    %esp
  a4dbea:	39 c0                	cmp    %eax,%eax
  a4dbec:	75 e2                	jne    a4dbd0 <strstr+0x70>
  a4dbee:	45                   	inc    %ebp
  a4dbef:	31 c9                	xor    %ecx,%ecx
  a4dbf1:	4c                   	dec    %esp
  a4dbf2:	89 c8                	mov    %ecx,%eax
  a4dbf4:	c3                   	ret    
  a4dbf5:	0f 1f 00             	nopl   (%eax)
  a4dbf8:	49                   	dec    %ecx
  a4dbf9:	89 c1                	mov    %eax,%ecx
  a4dbfb:	4c                   	dec    %esp
  a4dbfc:	89 c8                	mov    %ecx,%eax
  a4dbfe:	c3                   	ret    
  a4dbff:	90                   	nop

0000000000a4dc00 <strchr>:
  a4dc00:	f3 0f 1e fa          	endbr64 
  a4dc04:	48                   	dec    %eax
  a4dc05:	89 f8                	mov    %edi,%eax
  a4dc07:	eb 0f                	jmp    a4dc18 <strchr+0x18>
  a4dc09:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4dc10:	48                   	dec    %eax
  a4dc11:	83 c0 01             	add    $0x1,%eax
  a4dc14:	84 d2                	test   %dl,%dl
  a4dc16:	74 10                	je     a4dc28 <strchr+0x28>
  a4dc18:	0f b6 10             	movzbl (%eax),%edx
  a4dc1b:	40                   	inc    %eax
  a4dc1c:	38 f2                	cmp    %dh,%dl
  a4dc1e:	75 f0                	jne    a4dc10 <strchr+0x10>
  a4dc20:	c3                   	ret    
  a4dc21:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4dc28:	31 c0                	xor    %eax,%eax
  a4dc2a:	c3                   	ret    
  a4dc2b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)

0000000000a4dc30 <memset>:
  a4dc30:	f3 0f 1e fa          	endbr64 
  a4dc34:	48                   	dec    %eax
  a4dc35:	89 d1                	mov    %edx,%ecx
  a4dc37:	49                   	dec    %ecx
  a4dc38:	89 f8                	mov    %edi,%eax
  a4dc3a:	48                   	dec    %eax
  a4dc3b:	89 f8                	mov    %edi,%eax
  a4dc3d:	48                   	dec    %eax
  a4dc3e:	01 fa                	add    %edi,%edx
  a4dc40:	48                   	dec    %eax
  a4dc41:	85 c9                	test   %ecx,%ecx
  a4dc43:	74 0f                	je     a4dc54 <memset+0x24>
  a4dc45:	0f 1f 00             	nopl   (%eax)
  a4dc48:	40                   	inc    %eax
  a4dc49:	88 30                	mov    %dh,(%eax)
  a4dc4b:	48                   	dec    %eax
  a4dc4c:	83 c0 01             	add    $0x1,%eax
  a4dc4f:	48                   	dec    %eax
  a4dc50:	39 c2                	cmp    %eax,%edx
  a4dc52:	75 f4                	jne    a4dc48 <memset+0x18>
  a4dc54:	4c                   	dec    %esp
  a4dc55:	89 c0                	mov    %eax,%eax
  a4dc57:	c3                   	ret    
  a4dc58:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4dc5f:	00 

0000000000a4dc60 <memmove>:
  a4dc60:	f3 0f 1e fa          	endbr64 
  a4dc64:	49                   	dec    %ecx
  a4dc65:	89 f8                	mov    %edi,%eax
  a4dc67:	48                   	dec    %eax
  a4dc68:	39 f7                	cmp    %esi,%edi
  a4dc6a:	76 2c                	jbe    a4dc98 <memmove+0x38>
  a4dc6c:	48                   	dec    %eax
  a4dc6d:	89 f8                	mov    %edi,%eax
  a4dc6f:	48                   	dec    %eax
  a4dc70:	29 f0                	sub    %esi,%eax
  a4dc72:	48                   	dec    %eax
  a4dc73:	39 d0                	cmp    %edx,%eax
  a4dc75:	73 21                	jae    a4dc98 <memmove+0x38>
  a4dc77:	48                   	dec    %eax
  a4dc78:	8d 42 ff             	lea    -0x1(%edx),%eax
  a4dc7b:	48                   	dec    %eax
  a4dc7c:	85 d2                	test   %edx,%edx
  a4dc7e:	74 2d                	je     a4dcad <memmove+0x4d>
  a4dc80:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
  a4dc84:	41                   	inc    %ecx
  a4dc85:	88 14 00             	mov    %dl,(%eax,%eax,1)
  a4dc88:	48                   	dec    %eax
  a4dc89:	83 e8 01             	sub    $0x1,%eax
  a4dc8c:	73 f2                	jae    a4dc80 <memmove+0x20>
  a4dc8e:	4c                   	dec    %esp
  a4dc8f:	89 c0                	mov    %eax,%eax
  a4dc91:	c3                   	ret    
  a4dc92:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4dc98:	48                   	dec    %eax
  a4dc99:	89 d1                	mov    %edx,%ecx
  a4dc9b:	4c                   	dec    %esp
  a4dc9c:	89 c7                	mov    %eax,%edi
  a4dc9e:	83 e2 07             	and    $0x7,%edx
  a4dca1:	48                   	dec    %eax
  a4dca2:	c1 e9 03             	shr    $0x3,%ecx
  a4dca5:	f3 48                	repz dec %eax
  a4dca7:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  a4dca8:	48                   	dec    %eax
  a4dca9:	89 d1                	mov    %edx,%ecx
  a4dcab:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  a4dcad:	4c                   	dec    %esp
  a4dcae:	89 c0                	mov    %eax,%eax
  a4dcb0:	c3                   	ret    
  a4dcb1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4dcb8:	00 00 00 00 
  a4dcbc:	0f 1f 40 00          	nopl   0x0(%eax)

0000000000a4dcc0 <memcpy>:
  a4dcc0:	f3 0f 1e fa          	endbr64 
  a4dcc4:	48                   	dec    %eax
  a4dcc5:	89 f8                	mov    %edi,%eax
  a4dcc7:	48                   	dec    %eax
  a4dcc8:	39 f7                	cmp    %esi,%edi
  a4dcca:	76 0b                	jbe    a4dcd7 <memcpy+0x17>
  a4dccc:	48                   	dec    %eax
  a4dccd:	89 f9                	mov    %edi,%ecx
  a4dccf:	48                   	dec    %eax
  a4dcd0:	29 f1                	sub    %esi,%ecx
  a4dcd2:	48                   	dec    %eax
  a4dcd3:	39 d1                	cmp    %edx,%ecx
  a4dcd5:	72 19                	jb     a4dcf0 <memcpy+0x30>
  a4dcd7:	48                   	dec    %eax
  a4dcd8:	89 d1                	mov    %edx,%ecx
  a4dcda:	48                   	dec    %eax
  a4dcdb:	89 c7                	mov    %eax,%edi
  a4dcdd:	83 e2 07             	and    $0x7,%edx
  a4dce0:	48                   	dec    %eax
  a4dce1:	c1 e9 03             	shr    $0x3,%ecx
  a4dce4:	f3 48                	repz dec %eax
  a4dce6:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  a4dce7:	48                   	dec    %eax
  a4dce8:	89 d1                	mov    %edx,%ecx
  a4dcea:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  a4dcec:	c3                   	ret    
  a4dced:	0f 1f 00             	nopl   (%eax)
  a4dcf0:	48                   	dec    %eax
  a4dcf1:	83 ec 28             	sub    $0x28,%esp
  a4dcf4:	48                   	dec    %eax
  a4dcf5:	89 7c 24 08          	mov    %edi,0x8(%esp)
  a4dcf9:	48                   	dec    %eax
  a4dcfa:	8d 3d b0 68 00 00    	lea    0x68b0,%edi
  a4dd00:	48                   	dec    %eax
  a4dd01:	89 54 24 18          	mov    %edx,0x18(%esp)
  a4dd05:	48                   	dec    %eax
  a4dd06:	89 74 24 10          	mov    %esi,0x10(%esp)
  a4dd0a:	e8 11 04 00 00       	call   a4e120 <warn>
  a4dd0f:	48                   	dec    %eax
  a4dd10:	8b 44 24 08          	mov    0x8(%esp),%eax
  a4dd14:	48                   	dec    %eax
  a4dd15:	8b 54 24 18          	mov    0x18(%esp),%edx
  a4dd19:	48                   	dec    %eax
  a4dd1a:	8b 74 24 10          	mov    0x10(%esp),%esi
  a4dd1e:	48                   	dec    %eax
  a4dd1f:	83 c4 28             	add    $0x28,%esp
  a4dd22:	48                   	dec    %eax
  a4dd23:	89 c7                	mov    %eax,%edi
  a4dd25:	e9 36 ff ff ff       	jmp    a4dc60 <memmove>
  a4dd2a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

0000000000a4dd30 <__cmdline_find_option>:
  a4dd30:	f3 0f 1e fa          	endbr64 
  a4dd34:	48                   	dec    %eax
  a4dd35:	85 ff                	test   %edi,%edi
  a4dd37:	0f 84 00 02 00 00    	je     a4df3d <__cmdline_find_option+0x20d>
  a4dd3d:	41                   	inc    %ecx
  a4dd3e:	55                   	push   %ebp
  a4dd3f:	49                   	dec    %ecx
  a4dd40:	89 d2                	mov    %edx,%edx
  a4dd42:	48                   	dec    %eax
  a4dd43:	89 fa                	mov    %edi,%edx
  a4dd45:	49                   	dec    %ecx
  a4dd46:	89 f1                	mov    %esi,%ecx
  a4dd48:	41                   	inc    %ecx
  a4dd49:	54                   	push   %esp
  a4dd4a:	89 ce                	mov    %ecx,%esi
  a4dd4c:	83 e2 0f             	and    $0xf,%edx
  a4dd4f:	48                   	dec    %eax
  a4dd50:	89 f9                	mov    %edi,%ecx
  a4dd52:	55                   	push   %ebp
  a4dd53:	48                   	dec    %eax
  a4dd54:	83 e1 f0             	and    $0xfffffff0,%ecx
  a4dd57:	48                   	dec    %eax
  a4dd58:	83 c2 01             	add    $0x1,%edx
  a4dd5b:	4d                   	dec    %ebp
  a4dd5c:	89 d3                	mov    %edx,%ebx
  a4dd5e:	53                   	push   %ebx
  a4dd5f:	0f b6 07             	movzbl (%edi),%eax
  a4dd62:	41                   	inc    %ecx
  a4dd63:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4dd68:	bd 01 00 01 00       	mov    $0x10001,%ebp
  a4dd6d:	8d 5e ff             	lea    -0x1(%esi),%ebx
  a4dd70:	84 c0                	test   %al,%al
  a4dd72:	74 6c                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4dd74:	3c 20                	cmp    $0x20,%al
  a4dd76:	77 1c                	ja     a4dd94 <__cmdline_find_option+0x64>
  a4dd78:	48                   	dec    %eax
  a4dd79:	81 fa ff ff 00 00    	cmp    $0xffff,%edx
  a4dd7f:	77 5f                	ja     a4dde0 <__cmdline_find_option+0xb0>
  a4dd81:	0f b6 04 11          	movzbl (%ecx,%edx,1),%eax
  a4dd85:	48                   	dec    %eax
  a4dd86:	8d 7a 01             	lea    0x1(%edx),%edi
  a4dd89:	84 c0                	test   %al,%al
  a4dd8b:	74 53                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4dd8d:	48                   	dec    %eax
  a4dd8e:	89 fa                	mov    %edi,%edx
  a4dd90:	3c 20                	cmp    $0x20,%al
  a4dd92:	76 e4                	jbe    a4dd78 <__cmdline_find_option+0x48>
  a4dd94:	45                   	inc    %ebp
  a4dd95:	0f b6 21             	movzbl (%ecx),%esp
  a4dd98:	4d                   	dec    %ebp
  a4dd99:	89 cd                	mov    %ecx,%ebp
  a4dd9b:	3c 3d                	cmp    $0x3d,%al
  a4dd9d:	0f 84 2d 01 00 00    	je     a4ded0 <__cmdline_find_option+0x1a0>
  a4dda3:	41                   	inc    %ecx
  a4dda4:	38 c4                	cmp    %al,%ah
  a4dda6:	74 70                	je     a4de18 <__cmdline_find_option+0xe8>
  a4dda8:	48                   	dec    %eax
  a4dda9:	81 fa ff ff 00 00    	cmp    $0xffff,%edx
  a4ddaf:	77 2f                	ja     a4dde0 <__cmdline_find_option+0xb0>
  a4ddb1:	48                   	dec    %eax
  a4ddb2:	8d 42 01             	lea    0x1(%edx),%eax
  a4ddb5:	0f b6 14 11          	movzbl (%ecx,%edx,1),%edx
  a4ddb9:	84 d2                	test   %dl,%dl
  a4ddbb:	74 23                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4ddbd:	80 fa 20             	cmp    $0x20,%dl
  a4ddc0:	76 36                	jbe    a4ddf8 <__cmdline_find_option+0xc8>
  a4ddc2:	48                   	dec    %eax
  a4ddc3:	3d 00 00 01 00       	cmp    $0x10000,%eax
  a4ddc8:	74 16                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4ddca:	48                   	dec    %eax
  a4ddcb:	83 c0 01             	add    $0x1,%eax
  a4ddce:	0f b6 54 01 ff       	movzbl -0x1(%ecx,%eax,1),%edx
  a4ddd3:	84 d2                	test   %dl,%dl
  a4ddd5:	75 e6                	jne    a4ddbd <__cmdline_find_option+0x8d>
  a4ddd7:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4ddde:	00 00 
  a4dde0:	85 f6                	test   %esi,%esi
  a4dde2:	74 04                	je     a4dde8 <__cmdline_find_option+0xb8>
  a4dde4:	41                   	inc    %ecx
  a4dde5:	c6 03 00             	movb   $0x0,(%ebx)
  a4dde8:	5b                   	pop    %ebx
  a4dde9:	44                   	inc    %esp
  a4ddea:	89 c0                	mov    %eax,%eax
  a4ddec:	5d                   	pop    %ebp
  a4dded:	41                   	inc    %ecx
  a4ddee:	5c                   	pop    %esp
  a4ddef:	41                   	inc    %ecx
  a4ddf0:	5d                   	pop    %ebp
  a4ddf1:	c3                   	ret    
  a4ddf2:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4ddf8:	48                   	dec    %eax
  a4ddf9:	3d 00 00 01 00       	cmp    $0x10000,%eax
  a4ddfe:	74 e0                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4de00:	48                   	dec    %eax
  a4de01:	8d 50 01             	lea    0x1(%eax),%edx
  a4de04:	0f b6 04 01          	movzbl (%ecx,%eax,1),%eax
  a4de08:	84 c0                	test   %al,%al
  a4de0a:	0f 85 64 ff ff ff    	jne    a4dd74 <__cmdline_find_option+0x44>
  a4de10:	eb ce                	jmp    a4dde0 <__cmdline_find_option+0xb0>
  a4de12:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4de18:	48                   	dec    %eax
  a4de19:	81 fa ff ff 00 00    	cmp    $0xffff,%edx
  a4de1f:	77 bf                	ja     a4dde0 <__cmdline_find_option+0xb0>
  a4de21:	0f b6 04 11          	movzbl (%ecx,%edx,1),%eax
  a4de25:	48                   	dec    %eax
  a4de26:	8d 7a 01             	lea    0x1(%edx),%edi
  a4de29:	84 c0                	test   %al,%al
  a4de2b:	74 b3                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4de2d:	49                   	dec    %ecx
  a4de2e:	83 c5 01             	add    $0x1,%ebp
  a4de31:	3c 3d                	cmp    $0x3d,%al
  a4de33:	74 2b                	je     a4de60 <__cmdline_find_option+0x130>
  a4de35:	3c 20                	cmp    $0x20,%al
  a4de37:	0f 87 f3 00 00 00    	ja     a4df30 <__cmdline_find_option+0x200>
  a4de3d:	48                   	dec    %eax
  a4de3e:	81 ff 00 00 01 00    	cmp    $0x10000,%edi
  a4de44:	74 9a                	je     a4dde0 <__cmdline_find_option+0xb0>
  a4de46:	0f b6 04 39          	movzbl (%ecx,%edi,1),%eax
  a4de4a:	48                   	dec    %eax
  a4de4b:	8d 57 01             	lea    0x1(%edi),%edx
  a4de4e:	84 c0                	test   %al,%al
  a4de50:	0f 85 1e ff ff ff    	jne    a4dd74 <__cmdline_find_option+0x44>
  a4de56:	eb 88                	jmp    a4dde0 <__cmdline_find_option+0xb0>
  a4de58:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4de5f:	00 
  a4de60:	45                   	inc    %ebp
  a4de61:	0f b6 65 00          	movzbl 0x0(%ebp),%esp
  a4de65:	45                   	inc    %ebp
  a4de66:	84 e4                	test   %ah,%ah
  a4de68:	75 56                	jne    a4dec0 <__cmdline_find_option+0x190>
  a4de6a:	48                   	dec    %eax
  a4de6b:	81 ff 00 00 01 00    	cmp    $0x10000,%edi
  a4de71:	74 77                	je     a4deea <__cmdline_find_option+0x1ba>
  a4de73:	0f b6 14 39          	movzbl (%ecx,%edi,1),%edx
  a4de77:	48                   	dec    %eax
  a4de78:	8d 47 01             	lea    0x1(%edi),%eax
  a4de7b:	84 d2                	test   %dl,%dl
  a4de7d:	74 6b                	je     a4deea <__cmdline_find_option+0x1ba>
  a4de7f:	89 ef                	mov    %ebp,%edi
  a4de81:	4d                   	dec    %ebp
  a4de82:	89 d3                	mov    %edx,%ebx
  a4de84:	45                   	inc    %ebp
  a4de85:	31 c0                	xor    %eax,%eax
  a4de87:	29 c7                	sub    %eax,%edi
  a4de89:	80 fa 20             	cmp    $0x20,%dl
  a4de8c:	0f 86 66 ff ff ff    	jbe    a4ddf8 <__cmdline_find_option+0xc8>
  a4de92:	44                   	inc    %esp
  a4de93:	39 c3                	cmp    %eax,%ebx
  a4de95:	7e 07                	jle    a4de9e <__cmdline_find_option+0x16e>
  a4de97:	41                   	inc    %ecx
  a4de98:	88 13                	mov    %dl,(%ebx)
  a4de9a:	49                   	dec    %ecx
  a4de9b:	83 c3 01             	add    $0x1,%ebx
  a4de9e:	41                   	inc    %ecx
  a4de9f:	83 c0 01             	add    $0x1,%eax
  a4dea2:	41                   	inc    %ecx
  a4dea3:	39 f8                	cmp    %edi,%eax
  a4dea5:	0f 84 35 ff ff ff    	je     a4dde0 <__cmdline_find_option+0xb0>
  a4deab:	48                   	dec    %eax
  a4deac:	83 c0 01             	add    $0x1,%eax
  a4deaf:	0f b6 54 01 ff       	movzbl -0x1(%ecx,%eax,1),%edx
  a4deb4:	84 d2                	test   %dl,%dl
  a4deb6:	75 d1                	jne    a4de89 <__cmdline_find_option+0x159>
  a4deb8:	e9 23 ff ff ff       	jmp    a4dde0 <__cmdline_find_option+0xb0>
  a4debd:	0f 1f 00             	nopl   (%eax)
  a4dec0:	48                   	dec    %eax
  a4dec1:	89 fa                	mov    %edi,%edx
  a4dec3:	e9 db fe ff ff       	jmp    a4dda3 <__cmdline_find_option+0x73>
  a4dec8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4decf:	00 
  a4ded0:	45                   	inc    %ebp
  a4ded1:	84 e4                	test   %ah,%ah
  a4ded3:	75 23                	jne    a4def8 <__cmdline_find_option+0x1c8>
  a4ded5:	48                   	dec    %eax
  a4ded6:	81 fa ff ff 00 00    	cmp    $0xffff,%edx
  a4dedc:	77 0c                	ja     a4deea <__cmdline_find_option+0x1ba>
  a4dede:	48                   	dec    %eax
  a4dedf:	8d 42 01             	lea    0x1(%edx),%eax
  a4dee2:	0f b6 14 11          	movzbl (%ecx,%edx,1),%edx
  a4dee6:	84 d2                	test   %dl,%dl
  a4dee8:	75 95                	jne    a4de7f <__cmdline_find_option+0x14f>
  a4deea:	4d                   	dec    %ebp
  a4deeb:	89 d3                	mov    %edx,%ebx
  a4deed:	45                   	inc    %ebp
  a4deee:	31 c0                	xor    %eax,%eax
  a4def0:	e9 eb fe ff ff       	jmp    a4dde0 <__cmdline_find_option+0xb0>
  a4def5:	0f 1f 00             	nopl   (%eax)
  a4def8:	41                   	inc    %ecx
  a4def9:	80 fc 3d             	cmp    $0x3d,%ah
  a4defc:	0f 85 a6 fe ff ff    	jne    a4dda8 <__cmdline_find_option+0x78>
  a4df02:	48                   	dec    %eax
  a4df03:	81 fa ff ff 00 00    	cmp    $0xffff,%edx
  a4df09:	0f 87 d1 fe ff ff    	ja     a4dde0 <__cmdline_find_option+0xb0>
  a4df0f:	0f b6 04 11          	movzbl (%ecx,%edx,1),%eax
  a4df13:	48                   	dec    %eax
  a4df14:	8d 7a 01             	lea    0x1(%edx),%edi
  a4df17:	84 c0                	test   %al,%al
  a4df19:	0f 84 c1 fe ff ff    	je     a4dde0 <__cmdline_find_option+0xb0>
  a4df1f:	4d                   	dec    %ebp
  a4df20:	8d 69 01             	lea    0x1(%ecx),%ebp
  a4df23:	e9 09 ff ff ff       	jmp    a4de31 <__cmdline_find_option+0x101>
  a4df28:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4df2f:	00 
  a4df30:	45                   	inc    %ebp
  a4df31:	0f b6 65 00          	movzbl 0x0(%ebp),%esp
  a4df35:	48                   	dec    %eax
  a4df36:	89 fa                	mov    %edi,%edx
  a4df38:	e9 66 fe ff ff       	jmp    a4dda3 <__cmdline_find_option+0x73>
  a4df3d:	41                   	inc    %ecx
  a4df3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4df43:	44                   	inc    %esp
  a4df44:	89 c0                	mov    %eax,%eax
  a4df46:	c3                   	ret    
  a4df47:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4df4e:	00 00 

0000000000a4df50 <__cmdline_find_option_bool>:
  a4df50:	f3 0f 1e fa          	endbr64 
  a4df54:	49                   	dec    %ecx
  a4df55:	89 f1                	mov    %esi,%ecx
  a4df57:	48                   	dec    %eax
  a4df58:	85 ff                	test   %edi,%edi
  a4df5a:	0f 84 2b 01 00 00    	je     a4e08b <__cmdline_find_option_bool+0x13b>
  a4df60:	48                   	dec    %eax
  a4df61:	89 fe                	mov    %edi,%esi
  a4df63:	49                   	dec    %ecx
  a4df64:	89 f8                	mov    %edi,%eax
  a4df66:	0f b6 3f             	movzbl (%edi),%edi
  a4df69:	b8 01 00 00 00       	mov    $0x1,%eax
  a4df6e:	83 e6 0f             	and    $0xf,%esi
  a4df71:	49                   	dec    %ecx
  a4df72:	83 e0 f0             	and    $0xfffffff0,%eax
  a4df75:	48                   	dec    %eax
  a4df76:	83 c6 01             	add    $0x1,%esi
  a4df79:	40                   	inc    %eax
  a4df7a:	84 ff                	test   %bh,%bh
  a4df7c:	74 62                	je     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4df7e:	40                   	inc    %eax
  a4df7f:	80 ff 20             	cmp    $0x20,%bh
  a4df82:	76 7c                	jbe    a4e000 <__cmdline_find_option_bool+0xb0>
  a4df84:	45                   	inc    %ebp
  a4df85:	0f b6 11             	movzbl (%ecx),%edx
  a4df88:	89 c2                	mov    %eax,%edx
  a4df8a:	48                   	dec    %eax
  a4df8b:	89 f1                	mov    %esi,%ecx
  a4df8d:	45                   	inc    %ebp
  a4df8e:	84 d2                	test   %dl,%dl
  a4df90:	74 0e                	je     a4dfa0 <__cmdline_find_option_bool+0x50>
  a4df92:	41                   	inc    %ecx
  a4df93:	38 fa                	cmp    %bh,%dl
  a4df95:	0f 84 85 00 00 00    	je     a4e020 <__cmdline_find_option_bool+0xd0>
  a4df9b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4dfa0:	48                   	dec    %eax
  a4dfa1:	81 f9 ff ff 00 00    	cmp    $0xffff,%ecx
  a4dfa7:	77 37                	ja     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4dfa9:	48                   	dec    %eax
  a4dfaa:	8d 41 01             	lea    0x1(%ecx),%eax
  a4dfad:	83 c2 01             	add    $0x1,%edx
  a4dfb0:	41                   	inc    %ecx
  a4dfb1:	0f b6 34 08          	movzbl (%eax,%ecx,1),%esi
  a4dfb5:	29 c2                	sub    %eax,%edx
  a4dfb7:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  a4dfba:	40                   	inc    %eax
  a4dfbb:	84 f6                	test   %dh,%dh
  a4dfbd:	74 21                	je     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4dfbf:	40                   	inc    %eax
  a4dfc0:	80 fe 20             	cmp    $0x20,%dh
  a4dfc3:	77 23                	ja     a4dfe8 <__cmdline_find_option_bool+0x98>
  a4dfc5:	48                   	dec    %eax
  a4dfc6:	3d 00 00 01 00       	cmp    $0x10000,%eax
  a4dfcb:	74 13                	je     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4dfcd:	41                   	inc    %ecx
  a4dfce:	0f b6 3c 00          	movzbl (%eax,%eax,1),%edi
  a4dfd2:	48                   	dec    %eax
  a4dfd3:	8d 70 01             	lea    0x1(%eax),%esi
  a4dfd6:	8d 41 01             	lea    0x1(%ecx),%eax
  a4dfd9:	40                   	inc    %eax
  a4dfda:	84 ff                	test   %bh,%bh
  a4dfdc:	75 a0                	jne    a4df7e <__cmdline_find_option_bool+0x2e>
  a4dfde:	66 90                	xchg   %ax,%ax
  a4dfe0:	31 c0                	xor    %eax,%eax
  a4dfe2:	c3                   	ret    
  a4dfe3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4dfe8:	48                   	dec    %eax
  a4dfe9:	3d 00 00 01 00       	cmp    $0x10000,%eax
  a4dfee:	74 f0                	je     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4dff0:	48                   	dec    %eax
  a4dff1:	83 c0 01             	add    $0x1,%eax
  a4dff4:	41                   	inc    %ecx
  a4dff5:	0f b6 74 00 ff       	movzbl -0x1(%eax,%eax,1),%esi
  a4dffa:	eb bb                	jmp    a4dfb7 <__cmdline_find_option_bool+0x67>
  a4dffc:	0f 1f 40 00          	nopl   0x0(%eax)
  a4e000:	48                   	dec    %eax
  a4e001:	81 fe ff ff 00 00    	cmp    $0xffff,%esi
  a4e007:	77 d7                	ja     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4e009:	41                   	inc    %ecx
  a4e00a:	0f b6 3c 30          	movzbl (%eax,%esi,1),%edi
  a4e00e:	83 c0 01             	add    $0x1,%eax
  a4e011:	48                   	dec    %eax
  a4e012:	83 c6 01             	add    $0x1,%esi
  a4e015:	e9 5f ff ff ff       	jmp    a4df79 <__cmdline_find_option_bool+0x29>
  a4e01a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4e020:	48                   	dec    %eax
  a4e021:	81 fe ff ff 00 00    	cmp    $0xffff,%esi
  a4e027:	77 b7                	ja     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4e029:	48                   	dec    %eax
  a4e02a:	83 c1 01             	add    $0x1,%ecx
  a4e02d:	44                   	inc    %esp
  a4e02e:	8d 50 01             	lea    0x1(%eax),%edx
  a4e031:	4d                   	dec    %ebp
  a4e032:	89 cb                	mov    %ecx,%ebx
  a4e034:	41                   	inc    %ecx
  a4e035:	0f b6 3c 30          	movzbl (%eax,%esi,1),%edi
  a4e039:	41                   	inc    %ecx
  a4e03a:	29 ca                	sub    %ecx,%edx
  a4e03c:	49                   	dec    %ecx
  a4e03d:	29 f3                	sub    %esi,%ebx
  a4e03f:	41                   	inc    %ecx
  a4e040:	0f b6 34 0b          	movzbl (%ebx,%ecx,1),%esi
  a4e044:	41                   	inc    %ecx
  a4e045:	8d 14 0a             	lea    (%edx,%ecx,1),%edx
  a4e048:	40                   	inc    %eax
  a4e049:	84 f6                	test   %dh,%dh
  a4e04b:	75 13                	jne    a4e060 <__cmdline_find_option_bool+0x110>
  a4e04d:	40                   	inc    %eax
  a4e04e:	84 ff                	test   %bh,%bh
  a4e050:	74 90                	je     a4dfe2 <__cmdline_find_option_bool+0x92>
  a4e052:	40                   	inc    %eax
  a4e053:	80 ff 20             	cmp    $0x20,%bh
  a4e056:	0f 87 44 ff ff ff    	ja     a4dfa0 <__cmdline_find_option_bool+0x50>
  a4e05c:	c3                   	ret    
  a4e05d:	0f 1f 00             	nopl   (%eax)
  a4e060:	40                   	inc    %eax
  a4e061:	84 ff                	test   %bh,%bh
  a4e063:	0f 84 77 ff ff ff    	je     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4e069:	40                   	inc    %eax
  a4e06a:	38 fe                	cmp    %bh,%dh
  a4e06c:	0f 85 2e ff ff ff    	jne    a4dfa0 <__cmdline_find_option_bool+0x50>
  a4e072:	48                   	dec    %eax
  a4e073:	81 f9 00 00 01 00    	cmp    $0x10000,%ecx
  a4e079:	0f 84 61 ff ff ff    	je     a4dfe0 <__cmdline_find_option_bool+0x90>
  a4e07f:	48                   	dec    %eax
  a4e080:	83 c1 01             	add    $0x1,%ecx
  a4e083:	41                   	inc    %ecx
  a4e084:	0f b6 7c 08 ff       	movzbl -0x1(%eax,%ecx,1),%edi
  a4e089:	eb b4                	jmp    a4e03f <__cmdline_find_option_bool+0xef>
  a4e08b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4e090:	c3                   	ret    
  a4e091:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4e098:	00 00 00 00 
  a4e09c:	0f 1f 40 00          	nopl   0x0(%eax)

0000000000a4e0a0 <get_cmd_line_ptr>:
  a4e0a0:	f3 0f 1e fa          	endbr64 
  a4e0a4:	48                   	dec    %eax
  a4e0a5:	8b 15 65 c0 01 00    	mov    0x1c065,%edx
  a4e0ab:	8b 82 c8 00 00 00    	mov    0xc8(%edx),%eax
  a4e0b1:	8b 8a 28 02 00 00    	mov    0x228(%edx),%ecx
  a4e0b7:	48                   	dec    %eax
  a4e0b8:	c1 e0 20             	shl    $0x20,%eax
  a4e0bb:	48                   	dec    %eax
  a4e0bc:	09 c8                	or     %ecx,%eax
  a4e0be:	c3                   	ret    
  a4e0bf:	90                   	nop

0000000000a4e0c0 <cmdline_find_option>:
  a4e0c0:	f3 0f 1e fa          	endbr64 
  a4e0c4:	48                   	dec    %eax
  a4e0c5:	8b 05 45 c0 01 00    	mov    0x1c045,%eax
  a4e0cb:	49                   	dec    %ecx
  a4e0cc:	89 f8                	mov    %edi,%eax
  a4e0ce:	89 d1                	mov    %edx,%ecx
  a4e0d0:	8b b8 c8 00 00 00    	mov    0xc8(%eax),%edi
  a4e0d6:	8b 90 28 02 00 00    	mov    0x228(%eax),%edx
  a4e0dc:	48                   	dec    %eax
  a4e0dd:	c1 e7 20             	shl    $0x20,%edi
  a4e0e0:	48                   	dec    %eax
  a4e0e1:	09 d7                	or     %edx,%edi
  a4e0e3:	48                   	dec    %eax
  a4e0e4:	89 f2                	mov    %esi,%edx
  a4e0e6:	4c                   	dec    %esp
  a4e0e7:	89 c6                	mov    %eax,%esi
  a4e0e9:	e9 42 fc ff ff       	jmp    a4dd30 <__cmdline_find_option>
  a4e0ee:	66 90                	xchg   %ax,%ax

0000000000a4e0f0 <cmdline_find_option_bool>:
  a4e0f0:	f3 0f 1e fa          	endbr64 
  a4e0f4:	48                   	dec    %eax
  a4e0f5:	8b 05 15 c0 01 00    	mov    0x1c015,%eax
  a4e0fb:	48                   	dec    %eax
  a4e0fc:	89 fe                	mov    %edi,%esi
  a4e0fe:	8b b8 c8 00 00 00    	mov    0xc8(%eax),%edi
  a4e104:	8b 90 28 02 00 00    	mov    0x228(%eax),%edx
  a4e10a:	48                   	dec    %eax
  a4e10b:	c1 e7 20             	shl    $0x20,%edi
  a4e10e:	48                   	dec    %eax
  a4e10f:	09 d7                	or     %edx,%edi
  a4e111:	e9 3a fe ff ff       	jmp    a4df50 <__cmdline_find_option_bool>
  a4e116:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4e11d:	00 00 00 

0000000000a4e120 <warn>:
  a4e120:	f3 0f 1e fa          	endbr64 
  a4e124:	55                   	push   %ebp
  a4e125:	48                   	dec    %eax
  a4e126:	89 fd                	mov    %edi,%ebp
  a4e128:	48                   	dec    %eax
  a4e129:	8d 3d b3 64 00 00    	lea    0x64b3,%edi
  a4e12f:	e8 6c f0 ff ff       	call   a4d1a0 <__putstr>
  a4e134:	48                   	dec    %eax
  a4e135:	89 ef                	mov    %ebp,%edi
  a4e137:	e8 64 f0 ff ff       	call   a4d1a0 <__putstr>
  a4e13c:	48                   	dec    %eax
  a4e13d:	8d 3d 9f 64 00 00    	lea    0x649f,%edi
  a4e143:	5d                   	pop    %ebp
  a4e144:	e9 57 f0 ff ff       	jmp    a4d1a0 <__putstr>
  a4e149:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)

0000000000a4e150 <error>:
  a4e150:	f3 0f 1e fa          	endbr64 
  a4e154:	50                   	push   %eax
  a4e155:	58                   	pop    %eax
  a4e156:	48                   	dec    %eax
  a4e157:	83 ec 08             	sub    $0x8,%esp
  a4e15a:	e8 c1 ff ff ff       	call   a4e120 <warn>
  a4e15f:	48                   	dec    %eax
  a4e160:	8d 3d 7f 64 00 00    	lea    0x647f,%edi
  a4e166:	e8 35 f0 ff ff       	call   a4d1a0 <__putstr>
  a4e16b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4e170:	f4                   	hlt    
  a4e171:	eb fd                	jmp    a4e170 <error+0x20>
  a4e173:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4e17a:	00 00 00 
  a4e17d:	0f 1f 00             	nopl   (%eax)

0000000000a4e180 <has_eflag>:
  a4e180:	f3 0f 1e fa          	endbr64 
  a4e184:	9c                   	pushf  
  a4e185:	9c                   	pushf  
  a4e186:	58                   	pop    %eax
  a4e187:	48                   	dec    %eax
  a4e188:	89 c2                	mov    %eax,%edx
  a4e18a:	48                   	dec    %eax
  a4e18b:	31 fa                	xor    %edi,%edx
  a4e18d:	52                   	push   %edx
  a4e18e:	9d                   	popf   
  a4e18f:	9c                   	pushf  
  a4e190:	5a                   	pop    %edx
  a4e191:	9d                   	popf   
  a4e192:	48                   	dec    %eax
  a4e193:	31 d0                	xor    %edx,%eax
  a4e195:	48                   	dec    %eax
  a4e196:	85 f8                	test   %edi,%eax
  a4e198:	0f 95 c0             	setne  %al
  a4e19b:	0f b6 c0             	movzbl %al,%eax
  a4e19e:	c3                   	ret    
  a4e19f:	90                   	nop

0000000000a4e1a0 <get_cpuflags>:
  a4e1a0:	f3 0f 1e fa          	endbr64 
  a4e1a4:	80 3d 2d d0 01 00 00 	cmpb   $0x0,0x1d02d
  a4e1ab:	74 03                	je     a4e1b0 <get_cpuflags+0x10>
  a4e1ad:	c3                   	ret    
  a4e1ae:	66 90                	xchg   %ax,%ax
  a4e1b0:	53                   	push   %ebx
  a4e1b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a4e1b6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  a4e1bb:	c6 05 16 d0 01 00 01 	movb   $0x1,0x1d016
  a4e1c2:	66 89 44 24 fc       	mov    %ax,-0x4(%esp)
  a4e1c7:	66 89 54 24 fe       	mov    %dx,-0x2(%esp)
  a4e1cc:	0f 20 c0             	mov    %cr0,%eax
  a4e1cf:	a8 0c                	test   $0xc,%al
  a4e1d1:	74 07                	je     a4e1da <get_cpuflags+0x3a>
  a4e1d3:	48                   	dec    %eax
  a4e1d4:	83 e0 f3             	and    $0xfffffff3,%eax
  a4e1d7:	0f 22 c0             	mov    %eax,%cr0
  a4e1da:	db e3                	fninit 
  a4e1dc:	dd 7c 24 fe          	fnstsw -0x2(%esp)
  a4e1e0:	d9 7c 24 fc          	fnstcw -0x4(%esp)
  a4e1e4:	66 83 7c 24 fe 00    	cmpw   $0x0,-0x2(%esp)
  a4e1ea:	75 13                	jne    a4e1ff <get_cpuflags+0x5f>
  a4e1ec:	0f b7 44 24 fc       	movzwl -0x4(%esp),%eax
  a4e1f1:	66 25 3f 10          	and    $0x103f,%ax
  a4e1f5:	66 83 f8 3f          	cmp    $0x3f,%ax
  a4e1f9:	0f 84 c9 00 00 00    	je     a4e2c8 <get_cpuflags+0x128>
  a4e1ff:	9c                   	pushf  
  a4e200:	9c                   	pushf  
  a4e201:	58                   	pop    %eax
  a4e202:	48                   	dec    %eax
  a4e203:	89 c2                	mov    %eax,%edx
  a4e205:	48                   	dec    %eax
  a4e206:	81 f2 00 00 20 00    	xor    $0x200000,%edx
  a4e20c:	52                   	push   %edx
  a4e20d:	9d                   	popf   
  a4e20e:	9c                   	pushf  
  a4e20f:	5a                   	pop    %edx
  a4e210:	9d                   	popf   
  a4e211:	48                   	dec    %eax
  a4e212:	31 d0                	xor    %edx,%eax
  a4e214:	a9 00 00 20 00       	test   $0x200000,%eax
  a4e219:	0f 84 a2 00 00 00    	je     a4e2c1 <get_cpuflags+0x121>
  a4e21f:	31 f6                	xor    %esi,%esi
  a4e221:	89 f0                	mov    %esi,%eax
  a4e223:	89 f1                	mov    %esi,%ecx
  a4e225:	0f a2                	cpuid  
  a4e227:	89 c7                	mov    %eax,%edi
  a4e229:	8d 40 ff             	lea    -0x1(%eax),%eax
  a4e22c:	89 0d 36 cf 01 00    	mov    %ecx,0x1cf36
  a4e232:	89 15 2c cf 01 00    	mov    %edx,0x1cf2c
  a4e238:	89 1d 22 cf 01 00    	mov    %ebx,0x1cf22
  a4e23e:	3d fe ff 00 00       	cmp    $0xfffe,%eax
  a4e243:	77 3c                	ja     a4e281 <get_cpuflags+0xe1>
  a4e245:	b8 01 00 00 00       	mov    $0x1,%eax
  a4e24a:	89 f1                	mov    %esi,%ecx
  a4e24c:	0f a2                	cpuid  
  a4e24e:	89 15 38 cf 01 00    	mov    %edx,0x1cf38
  a4e254:	89 c2                	mov    %eax,%edx
  a4e256:	89 0d 40 cf 01 00    	mov    %ecx,0x1cf40
  a4e25c:	c1 ea 08             	shr    $0x8,%edx
  a4e25f:	89 c1                	mov    %eax,%ecx
  a4e261:	83 e2 0f             	and    $0xf,%edx
  a4e264:	c1 e9 04             	shr    $0x4,%ecx
  a4e267:	89 15 13 cf 01 00    	mov    %edx,0x1cf13
  a4e26d:	83 e1 0f             	and    $0xf,%ecx
  a4e270:	89 15 0e cf 01 00    	mov    %edx,0x1cf0e
  a4e276:	83 fa 05             	cmp    $0x5,%edx
  a4e279:	7f 5d                	jg     a4e2d8 <get_cpuflags+0x138>
  a4e27b:	89 0d 07 cf 01 00    	mov    %ecx,0x1cf07
  a4e281:	83 ff 06             	cmp    $0x6,%edi
  a4e284:	76 0f                	jbe    a4e295 <get_cpuflags+0xf5>
  a4e286:	b8 07 00 00 00       	mov    $0x7,%eax
  a4e28b:	31 c9                	xor    %ecx,%ecx
  a4e28d:	0f a2                	cpuid  
  a4e28f:	89 0d 37 cf 01 00    	mov    %ecx,0x1cf37
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
  a4e2b5:	89 0d e9 ce 01 00    	mov    %ecx,0x1cee9
  a4e2bb:	89 15 cf ce 01 00    	mov    %edx,0x1cecf
  a4e2c1:	5b                   	pop    %ebx
  a4e2c2:	c3                   	ret    
  a4e2c3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4e2c8:	0f ba 2d bc ce 01 00 	btsl   $0x0,0x1cebc
  a4e2cf:	00 
  a4e2d0:	e9 2a ff ff ff       	jmp    a4e1ff <get_cpuflags+0x5f>
  a4e2d5:	0f 1f 00             	nopl   (%eax)
  a4e2d8:	c1 e8 0c             	shr    $0xc,%eax
  a4e2db:	25 f0 00 00 00       	and    $0xf0,%eax
  a4e2e0:	01 c8                	add    %ecx,%eax
  a4e2e2:	89 05 a0 ce 01 00    	mov    %eax,0x1cea0
  a4e2e8:	eb 97                	jmp    a4e281 <get_cpuflags+0xe1>
  a4e2ea:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

0000000000a4e2f0 <has_cpuflag>:
  a4e2f0:	f3 0f 1e fa          	endbr64 
  a4e2f4:	41                   	inc    %ecx
  a4e2f5:	89 f8                	mov    %edi,%eax
  a4e2f7:	e8 a4 fe ff ff       	call   a4e1a0 <get_cpuflags>
  a4e2fc:	44                   	inc    %esp
  a4e2fd:	0f a3 05 88 ce 01 00 	bt     %eax,0x1ce88
  a4e304:	0f 92 c0             	setb   %al
  a4e307:	c3                   	ret    
  a4e308:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4e30f:	00 

0000000000a4e310 <early_serial_init>:
  a4e310:	44                   	inc    %esp
  a4e311:	8d 47 03             	lea    0x3(%edi),%eax
  a4e314:	b9 03 00 00 00       	mov    $0x3,%ecx
  a4e319:	89 c8                	mov    %ecx,%eax
  a4e31b:	44                   	inc    %esp
  a4e31c:	89 c2                	mov    %eax,%edx
  a4e31e:	ee                   	out    %al,(%dx)
  a4e31f:	44                   	inc    %esp
  a4e320:	8d 4f 01             	lea    0x1(%edi),%ecx
  a4e323:	31 c0                	xor    %eax,%eax
  a4e325:	44                   	inc    %esp
  a4e326:	89 ca                	mov    %ecx,%edx
  a4e328:	ee                   	out    %al,(%dx)
  a4e329:	8d 57 02             	lea    0x2(%edi),%edx
  a4e32c:	ee                   	out    %al,(%dx)
  a4e32d:	8d 57 04             	lea    0x4(%edi),%edx
  a4e330:	89 c8                	mov    %ecx,%eax
  a4e332:	ee                   	out    %al,(%dx)
  a4e333:	b8 00 c2 01 00       	mov    $0x1c200,%eax
  a4e338:	99                   	cltd   
  a4e339:	f7 fe                	idiv   %esi
  a4e33b:	44                   	inc    %esp
  a4e33c:	89 c2                	mov    %eax,%edx
  a4e33e:	89 c1                	mov    %eax,%ecx
  a4e340:	ec                   	in     (%dx),%al
  a4e341:	89 c6                	mov    %eax,%esi
  a4e343:	83 c8 80             	or     $0xffffff80,%eax
  a4e346:	ee                   	out    %al,(%dx)
  a4e347:	89 c8                	mov    %ecx,%eax
  a4e349:	89 fa                	mov    %edi,%edx
  a4e34b:	ee                   	out    %al,(%dx)
  a4e34c:	89 c8                	mov    %ecx,%eax
  a4e34e:	44                   	inc    %esp
  a4e34f:	89 ca                	mov    %ecx,%edx
  a4e351:	c1 e8 08             	shr    $0x8,%eax
  a4e354:	ee                   	out    %al,(%dx)
  a4e355:	89 f0                	mov    %esi,%eax
  a4e357:	44                   	inc    %esp
  a4e358:	89 c2                	mov    %eax,%edx
  a4e35a:	83 e0 7f             	and    $0x7f,%eax
  a4e35d:	ee                   	out    %al,(%dx)
  a4e35e:	89 3d 78 ce 01 00    	mov    %edi,0x1ce78
  a4e364:	c3                   	ret    
  a4e365:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4e36c:	00 00 00 00 

0000000000a4e370 <console_init>:
  a4e370:	f3 0f 1e fa          	endbr64 
  a4e374:	41                   	inc    %ecx
  a4e375:	56                   	push   %esi
  a4e376:	ba 20 00 00 00       	mov    $0x20,%edx
  a4e37b:	48                   	dec    %eax
  a4e37c:	8d 3d 75 62 00 00    	lea    0x6275,%edi
  a4e382:	41                   	inc    %ecx
  a4e383:	55                   	push   %ebp
  a4e384:	41                   	inc    %ecx
  a4e385:	54                   	push   %esp
  a4e386:	55                   	push   %ebp
  a4e387:	53                   	push   %ebx
  a4e388:	48                   	dec    %eax
  a4e389:	83 ec 50             	sub    $0x50,%esp
  a4e38c:	48                   	dec    %eax
  a4e38d:	8d 6c 24 10          	lea    0x10(%esp),%ebp
  a4e391:	48                   	dec    %eax
  a4e392:	89 ee                	mov    %ebp,%esi
  a4e394:	e8 27 fd ff ff       	call   a4e0c0 <cmdline_find_option>
  a4e399:	85 c0                	test   %eax,%eax
  a4e39b:	7f 23                	jg     a4e3c0 <console_init+0x50>
  a4e39d:	8b 05 39 ce 01 00    	mov    0x1ce39,%eax
  a4e3a3:	85 c0                	test   %eax,%eax
  a4e3a5:	0f 84 c5 00 00 00    	je     a4e470 <console_init+0x100>
  a4e3ab:	48                   	dec    %eax
  a4e3ac:	83 c4 50             	add    $0x50,%esp
  a4e3af:	5b                   	pop    %ebx
  a4e3b0:	5d                   	pop    %ebp
  a4e3b1:	41                   	inc    %ecx
  a4e3b2:	5c                   	pop    %esp
  a4e3b3:	41                   	inc    %ecx
  a4e3b4:	5d                   	pop    %ebp
  a4e3b5:	41                   	inc    %ecx
  a4e3b6:	5e                   	pop    %esi
  a4e3b7:	c3                   	ret    
  a4e3b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4e3bf:	00 
  a4e3c0:	ba 06 00 00 00       	mov    $0x6,%edx
  a4e3c5:	48                   	dec    %eax
  a4e3c6:	8d 35 37 62 00 00    	lea    0x6237,%esi
  a4e3cc:	48                   	dec    %eax
  a4e3cd:	89 ef                	mov    %ebp,%edi
  a4e3cf:	e8 ac f5 ff ff       	call   a4d980 <strncmp>
  a4e3d4:	85 c0                	test   %eax,%eax
  a4e3d6:	0f 84 54 01 00 00    	je     a4e530 <console_init+0x1c0>
  a4e3dc:	31 db                	xor    %ebx,%ebx
  a4e3de:	80 7c 24 10 2c       	cmpb   $0x2c,0x10(%esp)
  a4e3e3:	40                   	inc    %eax
  a4e3e4:	0f 94 c7             	sete   %bh
  a4e3e7:	0f 94 c3             	sete   %bl
  a4e3ea:	45                   	inc    %ebp
  a4e3eb:	31 e4                	xor    %esp,%esp
  a4e3ed:	40                   	inc    %eax
  a4e3ee:	0f b6 ff             	movzbl %bh,%edi
  a4e3f1:	48                   	dec    %eax
  a4e3f2:	01 ef                	add    %ebp,%edi
  a4e3f4:	ba 04 00 00 00       	mov    $0x4,%edx
  a4e3f9:	48                   	dec    %eax
  a4e3fa:	8d 35 0a 62 00 00    	lea    0x620a,%esi
  a4e400:	e8 7b f5 ff ff       	call   a4d980 <strncmp>
  a4e405:	4c                   	dec    %esp
  a4e406:	8d 6c 24 08          	lea    0x8(%esp),%ebp
  a4e40a:	85 c0                	test   %eax,%eax
  a4e40c:	0f 84 4e 01 00 00    	je     a4e560 <console_init+0x1f0>
  a4e412:	48                   	dec    %eax
  a4e413:	63 c3                	arpl   %ax,%bx
  a4e415:	80 7c 04 10 2c       	cmpb   $0x2c,0x10(%esp,%eax,1)
  a4e41a:	75 06                	jne    a4e422 <console_init+0xb2>
  a4e41c:	83 c3 01             	add    $0x1,%ebx
  a4e41f:	48                   	dec    %eax
  a4e420:	63 c3                	arpl   %ax,%bx
  a4e422:	48                   	dec    %eax
  a4e423:	8d 5c 05 00          	lea    0x0(%ebp,%eax,1),%ebx
  a4e427:	4c                   	dec    %esp
  a4e428:	89 ee                	mov    %ebp,%esi
  a4e42a:	31 d2                	xor    %edx,%edx
  a4e42c:	48                   	dec    %eax
  a4e42d:	89 df                	mov    %ebx,%edi
  a4e42f:	e8 0c f6 ff ff       	call   a4da40 <simple_strtoull>
  a4e434:	89 c6                	mov    %eax,%esi
  a4e436:	85 c0                	test   %eax,%eax
  a4e438:	0f 84 12 01 00 00    	je     a4e550 <console_init+0x1e0>
  a4e43e:	48                   	dec    %eax
  a4e43f:	3b 5c 24 08          	cmp    0x8(%esp),%ebx
  a4e443:	b8 80 25 00 00       	mov    $0x2580,%eax
  a4e448:	0f 44 f0             	cmove  %eax,%esi
  a4e44b:	45                   	inc    %ebp
  a4e44c:	85 e4                	test   %esp,%esp
  a4e44e:	0f 84 49 ff ff ff    	je     a4e39d <console_init+0x2d>
  a4e454:	44                   	inc    %esp
  a4e455:	89 e7                	mov    %esp,%edi
  a4e457:	e8 b4 fe ff ff       	call   a4e310 <early_serial_init>
  a4e45c:	8b 05 7a cd 01 00    	mov    0x1cd7a,%eax
  a4e462:	85 c0                	test   %eax,%eax
  a4e464:	0f 85 41 ff ff ff    	jne    a4e3ab <console_init+0x3b>
  a4e46a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4e470:	ba 40 00 00 00       	mov    $0x40,%edx
  a4e475:	48                   	dec    %eax
  a4e476:	89 ee                	mov    %ebp,%esi
  a4e478:	48                   	dec    %eax
  a4e479:	8d 3d 90 61 00 00    	lea    0x6190,%edi
  a4e47f:	e8 3c fc ff ff       	call   a4e0c0 <cmdline_find_option>
  a4e484:	85 c0                	test   %eax,%eax
  a4e486:	0f 8e 1f ff ff ff    	jle    a4e3ab <console_init+0x3b>
  a4e48c:	ba 0c 00 00 00       	mov    $0xc,%edx
  a4e491:	48                   	dec    %eax
  a4e492:	8d 35 7f 61 00 00    	lea    0x617f,%esi
  a4e498:	48                   	dec    %eax
  a4e499:	89 ef                	mov    %ebp,%edi
  a4e49b:	48                   	dec    %eax
  a4e49c:	89 6c 24 08          	mov    %ebp,0x8(%esp)
  a4e4a0:	e8 db f4 ff ff       	call   a4d980 <strncmp>
  a4e4a5:	85 c0                	test   %eax,%eax
  a4e4a7:	0f 85 13 01 00 00    	jne    a4e5c0 <console_init+0x250>
  a4e4ad:	48                   	dec    %eax
  a4e4ae:	8b 44 24 08          	mov    0x8(%esp),%eax
  a4e4b2:	4c                   	dec    %esp
  a4e4b3:	8d 6c 24 08          	lea    0x8(%esp),%ebp
  a4e4b7:	31 d2                	xor    %edx,%edx
  a4e4b9:	4c                   	dec    %esp
  a4e4ba:	89 ee                	mov    %ebp,%esi
  a4e4bc:	48                   	dec    %eax
  a4e4bd:	8d 78 0c             	lea    0xc(%eax),%edi
  a4e4c0:	e8 7b f5 ff ff       	call   a4da40 <simple_strtoull>
  a4e4c5:	41                   	inc    %ecx
  a4e4c6:	89 c4                	mov    %eax,%esp
  a4e4c8:	48                   	dec    %eax
  a4e4c9:	8b 7c 24 08          	mov    0x8(%esp),%edi
  a4e4cd:	48                   	dec    %eax
  a4e4ce:	85 ff                	test   %edi,%edi
  a4e4d0:	74 09                	je     a4e4db <console_init+0x16b>
  a4e4d2:	80 3f 2c             	cmpb   $0x2c,(%edi)
  a4e4d5:	0f 84 65 01 00 00    	je     a4e640 <console_init+0x2d0>
  a4e4db:	41                   	inc    %ecx
  a4e4dc:	8d 4c 24 03          	lea    0x3(%esp),%ecx
  a4e4e0:	89 ca                	mov    %ecx,%edx
  a4e4e2:	ec                   	in     (%dx),%al
  a4e4e3:	41                   	inc    %ecx
  a4e4e4:	89 c0                	mov    %eax,%eax
  a4e4e6:	83 c8 80             	or     $0xffffff80,%eax
  a4e4e9:	ee                   	out    %al,(%dx)
  a4e4ea:	44                   	inc    %esp
  a4e4eb:	89 e2                	mov    %esp,%edx
  a4e4ed:	ec                   	in     (%dx),%al
  a4e4ee:	0f b6 f8             	movzbl %al,%edi
  a4e4f1:	41                   	inc    %ecx
  a4e4f2:	8d 54 24 01          	lea    0x1(%esp),%edx
  a4e4f6:	ec                   	in     (%dx),%al
  a4e4f7:	89 c6                	mov    %eax,%esi
  a4e4f9:	89 ca                	mov    %ecx,%edx
  a4e4fb:	44                   	inc    %esp
  a4e4fc:	89 c0                	mov    %eax,%eax
  a4e4fe:	ee                   	out    %al,(%dx)
  a4e4ff:	40                   	inc    %eax
  a4e500:	0f b6 ce             	movzbl %dh,%ecx
  a4e503:	b8 00 c2 01 00       	mov    $0x1c200,%eax
  a4e508:	31 d2                	xor    %edx,%edx
  a4e50a:	c1 e1 08             	shl    $0x8,%ecx
  a4e50d:	09 f9                	or     %edi,%ecx
  a4e50f:	f7 f1                	div    %ecx
  a4e511:	45                   	inc    %ebp
  a4e512:	85 e4                	test   %esp,%esp
  a4e514:	0f 84 91 fe ff ff    	je     a4e3ab <console_init+0x3b>
  a4e51a:	89 c6                	mov    %eax,%esi
  a4e51c:	44                   	inc    %esp
  a4e51d:	89 e7                	mov    %esp,%edi
  a4e51f:	e8 ec fd ff ff       	call   a4e310 <early_serial_init>
  a4e524:	e9 82 fe ff ff       	jmp    a4e3ab <console_init+0x3b>
  a4e529:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4e530:	80 7c 24 16 2c       	cmpb   $0x2c,0x16(%esp)
  a4e535:	74 51                	je     a4e588 <console_init+0x218>
  a4e537:	bf 06 00 00 00       	mov    $0x6,%edi
  a4e53c:	41                   	inc    %ecx
  a4e53d:	bc f8 03 00 00       	mov    $0x3f8,%esp
  a4e542:	bb 06 00 00 00       	mov    $0x6,%ebx
  a4e547:	e9 a5 fe ff ff       	jmp    a4e3f1 <console_init+0x81>
  a4e54c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4e550:	be 80 25 00 00       	mov    $0x2580,%esi
  a4e555:	e9 f1 fe ff ff       	jmp    a4e44b <console_init+0xdb>
  a4e55a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4e560:	8d 43 04             	lea    0x4(%ebx),%eax
  a4e563:	31 d2                	xor    %edx,%edx
  a4e565:	83 c3 05             	add    $0x5,%ebx
  a4e568:	48                   	dec    %eax
  a4e569:	98                   	cwtl   
  a4e56a:	80 7c 04 10 31       	cmpb   $0x31,0x10(%esp,%eax,1)
  a4e56f:	48                   	dec    %eax
  a4e570:	8d 05 6a 5a 00 00    	lea    0x5a6a,%eax
  a4e576:	0f 94 c2             	sete   %dl
  a4e579:	44                   	inc    %esp
  a4e57a:	8b 24 90             	mov    (%eax,%edx,4),%esp
  a4e57d:	e9 90 fe ff ff       	jmp    a4e412 <console_init+0xa2>
  a4e582:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4e588:	4c                   	dec    %esp
  a4e589:	8d 74 24 17          	lea    0x17(%esp),%esi
  a4e58d:	ba 02 00 00 00       	mov    $0x2,%edx
  a4e592:	48                   	dec    %eax
  a4e593:	8d 35 94 60 00 00    	lea    0x6094,%esi
  a4e599:	4c                   	dec    %esp
  a4e59a:	89 f7                	mov    %esi,%edi
  a4e59c:	e8 df f3 ff ff       	call   a4d980 <strncmp>
  a4e5a1:	85 c0                	test   %eax,%eax
  a4e5a3:	74 5b                	je     a4e600 <console_init+0x290>
  a4e5a5:	bf 07 00 00 00       	mov    $0x7,%edi
  a4e5aa:	41                   	inc    %ecx
  a4e5ab:	bc f8 03 00 00       	mov    $0x3f8,%esp
  a4e5b0:	bb 07 00 00 00       	mov    $0x7,%ebx
  a4e5b5:	e9 37 fe ff ff       	jmp    a4e3f1 <console_init+0x81>
  a4e5ba:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4e5c0:	48                   	dec    %eax
  a4e5c1:	8b 7c 24 08          	mov    0x8(%esp),%edi
  a4e5c5:	ba 08 00 00 00       	mov    $0x8,%edx
  a4e5ca:	48                   	dec    %eax
  a4e5cb:	8d 35 53 60 00 00    	lea    0x6053,%esi
  a4e5d1:	e8 aa f3 ff ff       	call   a4d980 <strncmp>
  a4e5d6:	85 c0                	test   %eax,%eax
  a4e5d8:	0f 85 cd fd ff ff    	jne    a4e3ab <console_init+0x3b>
  a4e5de:	48                   	dec    %eax
  a4e5df:	8b 44 24 08          	mov    0x8(%esp),%eax
  a4e5e3:	4c                   	dec    %esp
  a4e5e4:	8d 6c 24 08          	lea    0x8(%esp),%ebp
  a4e5e8:	31 d2                	xor    %edx,%edx
  a4e5ea:	4c                   	dec    %esp
  a4e5eb:	89 ee                	mov    %ebp,%esi
  a4e5ed:	48                   	dec    %eax
  a4e5ee:	8d 78 08             	lea    0x8(%eax),%edi
  a4e5f1:	e8 4a f4 ff ff       	call   a4da40 <simple_strtoull>
  a4e5f6:	41                   	inc    %ecx
  a4e5f7:	89 c4                	mov    %eax,%esp
  a4e5f9:	e9 ca fe ff ff       	jmp    a4e4c8 <console_init+0x158>
  a4e5fe:	66 90                	xchg   %ax,%ax
  a4e600:	4c                   	dec    %esp
  a4e601:	8d 6c 24 08          	lea    0x8(%esp),%ebp
  a4e605:	ba 10 00 00 00       	mov    $0x10,%edx
  a4e60a:	4c                   	dec    %esp
  a4e60b:	89 f7                	mov    %esi,%edi
  a4e60d:	4c                   	dec    %esp
  a4e60e:	89 ee                	mov    %ebp,%esi
  a4e610:	e8 2b f4 ff ff       	call   a4da40 <simple_strtoull>
  a4e615:	41                   	inc    %ecx
  a4e616:	89 c4                	mov    %eax,%esp
  a4e618:	85 c0                	test   %eax,%eax
  a4e61a:	74 14                	je     a4e630 <console_init+0x2c0>
  a4e61c:	48                   	dec    %eax
  a4e61d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
  a4e621:	4c                   	dec    %esp
  a4e622:	39 f3                	cmp    %esi,%ebx
  a4e624:	74 0a                	je     a4e630 <console_init+0x2c0>
  a4e626:	29 eb                	sub    %ebp,%ebx
  a4e628:	e9 e5 fd ff ff       	jmp    a4e412 <console_init+0xa2>
  a4e62d:	0f 1f 00             	nopl   (%eax)
  a4e630:	41                   	inc    %ecx
  a4e631:	bc f8 03 00 00       	mov    $0x3f8,%esp
  a4e636:	bb 07 00 00 00       	mov    $0x7,%ebx
  a4e63b:	e9 d2 fd ff ff       	jmp    a4e412 <console_init+0xa2>
  a4e640:	48                   	dec    %eax
  a4e641:	83 c7 01             	add    $0x1,%edi
  a4e644:	31 d2                	xor    %edx,%edx
  a4e646:	4c                   	dec    %esp
  a4e647:	89 ee                	mov    %ebp,%esi
  a4e649:	e8 f2 f3 ff ff       	call   a4da40 <simple_strtoull>
  a4e64e:	e9 be fe ff ff       	jmp    a4e511 <console_init+0x1a1>
  a4e653:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4e65a:	00 00 00 
  a4e65d:	0f 1f 00             	nopl   (%eax)

0000000000a4e660 <store_slot_info>:
  a4e660:	48                   	dec    %eax
  a4e661:	8b 15 89 cb 01 00    	mov    0x1cb89,%edx
  a4e667:	48                   	dec    %eax
  a4e668:	83 fa 64             	cmp    $0x64,%edx
  a4e66b:	74 3d                	je     a4e6aa <store_slot_info+0x4a>
  a4e66d:	48                   	dec    %eax
  a4e66e:	8b 47 08             	mov    0x8(%edi),%eax
  a4e671:	48                   	dec    %eax
  a4e672:	29 f0                	sub    %esi,%eax
  a4e674:	48                   	dec    %eax
  a4e675:	c1 e8 15             	shr    $0x15,%eax
  a4e678:	83 c0 01             	add    $0x1,%eax
  a4e67b:	85 c0                	test   %eax,%eax
  a4e67d:	7e 2b                	jle    a4e6aa <store_slot_info+0x4a>
  a4e67f:	48                   	dec    %eax
  a4e680:	8d 4a 01             	lea    0x1(%edx),%ecx
  a4e683:	48                   	dec    %eax
  a4e684:	c1 e2 04             	shl    $0x4,%edx
  a4e687:	48                   	dec    %eax
  a4e688:	8b 37                	mov    (%edi),%esi
  a4e68a:	48                   	dec    %eax
  a4e68b:	89 0d 5f cb 01 00    	mov    %ecx,0x1cb5f
  a4e691:	48                   	dec    %eax
  a4e692:	8d 0d 68 cb 01 00    	lea    0x1cb68,%ecx
  a4e698:	48                   	dec    %eax
  a4e699:	01 ca                	add    %ecx,%edx
  a4e69b:	89 42 08             	mov    %eax,0x8(%edx)
  a4e69e:	48                   	dec    %eax
  a4e69f:	98                   	cwtl   
  a4e6a0:	48                   	dec    %eax
  a4e6a1:	01 05 51 cb 01 00    	add    %eax,0x1cb51
  a4e6a7:	48                   	dec    %eax
  a4e6a8:	89 32                	mov    %esi,(%edx)
  a4e6aa:	c3                   	ret    
  a4e6ab:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)

0000000000a4e6b0 <process_gb_huge_pages>:
  a4e6b0:	48                   	dec    %eax
  a4e6b1:	8b 15 89 d1 01 00    	mov    0x1d189,%edx
  a4e6b7:	49                   	dec    %ecx
  a4e6b8:	89 f9                	mov    %edi,%ecx
  a4e6ba:	49                   	dec    %ecx
  a4e6bb:	89 f3                	mov    %esi,%ebx
  a4e6bd:	48                   	dec    %eax
  a4e6be:	85 d2                	test   %edx,%edx
  a4e6c0:	0f 84 8a 00 00 00    	je     a4e750 <process_gb_huge_pages+0xa0>
  a4e6c6:	48                   	dec    %eax
  a4e6c7:	8b 3f                	mov    (%edi),%edi
  a4e6c9:	49                   	dec    %ecx
  a4e6ca:	8b 71 08             	mov    0x8(%ecx),%esi
  a4e6cd:	4c                   	dec    %esp
  a4e6ce:	8d 87 ff ff ff 3f    	lea    0x3fffffff(%edi),%eax
  a4e6d4:	48                   	dec    %eax
  a4e6d5:	01 fe                	add    %edi,%esi
  a4e6d7:	4d                   	dec    %ebp
  a4e6d8:	89 c2                	mov    %eax,%edx
  a4e6da:	49                   	dec    %ecx
  a4e6db:	81 e2 00 00 00 c0    	and    $0xc0000000,%edx
  a4e6e1:	4c                   	dec    %esp
  a4e6e2:	39 d6                	cmp    %edx,%esi
  a4e6e4:	76 6a                	jbe    a4e750 <process_gb_huge_pages+0xa0>
  a4e6e6:	48                   	dec    %eax
  a4e6e7:	89 f0                	mov    %esi,%eax
  a4e6e9:	4c                   	dec    %esp
  a4e6ea:	29 d0                	sub    %edx,%eax
  a4e6ec:	48                   	dec    %eax
  a4e6ed:	3d 00 00 00 40       	cmp    $0x40000000,%eax
  a4e6f2:	76 5c                	jbe    a4e750 <process_gb_huge_pages+0xa0>
  a4e6f4:	48                   	dec    %eax
  a4e6f5:	2d 01 00 00 40       	sub    $0x40000001,%eax
  a4e6fa:	48                   	dec    %eax
  a4e6fb:	8d 4a ff             	lea    -0x1(%edx),%ecx
  a4e6fe:	48                   	dec    %eax
  a4e6ff:	83 ec 10             	sub    $0x10,%esp
  a4e702:	48                   	dec    %eax
  a4e703:	c1 e8 1e             	shr    $0x1e,%eax
  a4e706:	48                   	dec    %eax
  a4e707:	29 c1                	sub    %eax,%ecx
  a4e709:	48                   	dec    %eax
  a4e70a:	89 d0                	mov    %edx,%eax
  a4e70c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4e710:	48                   	dec    %eax
  a4e711:	83 e8 01             	sub    $0x1,%eax
  a4e714:	41                   	inc    %ecx
  a4e715:	89 d0                	mov    %edx,%eax
  a4e717:	41                   	inc    %ecx
  a4e718:	29 c0                	sub    %eax,%eax
  a4e71a:	48                   	dec    %eax
  a4e71b:	39 c8                	cmp    %ecx,%eax
  a4e71d:	74 41                	je     a4e760 <process_gb_huge_pages+0xb0>
  a4e71f:	48                   	dec    %eax
  a4e720:	85 c0                	test   %eax,%eax
  a4e722:	75 ec                	jne    a4e710 <process_gb_huge_pages+0x60>
  a4e724:	48                   	dec    %eax
  a4e725:	c7 05 11 d1 01 00 00 	movl   $0x0,0x1d111
  a4e72c:	00 00 00 
  a4e72f:	4a                   	dec    %edx
  a4e730:	8d 04 1f             	lea    (%edi,%ebx,1),%eax
  a4e733:	4c                   	dec    %esp
  a4e734:	39 d0                	cmp    %edx,%eax
  a4e736:	76 38                	jbe    a4e770 <process_gb_huge_pages+0xc0>
  a4e738:	4d                   	dec    %ebp
  a4e739:	63 c0                	arpl   %ax,%ax
  a4e73b:	49                   	dec    %ecx
  a4e73c:	c1 e0 1e             	shl    $0x1e,%eax
  a4e73f:	4d                   	dec    %ebp
  a4e740:	01 d0                	add    %edx,%eax
  a4e742:	4c                   	dec    %esp
  a4e743:	29 c6                	sub    %eax,%esi
  a4e745:	49                   	dec    %ecx
  a4e746:	39 f3                	cmp    %esi,%ebx
  a4e748:	76 4e                	jbe    a4e798 <process_gb_huge_pages+0xe8>
  a4e74a:	48                   	dec    %eax
  a4e74b:	83 c4 10             	add    $0x10,%esp
  a4e74e:	c3                   	ret    
  a4e74f:	90                   	nop
  a4e750:	4c                   	dec    %esp
  a4e751:	89 de                	mov    %ebx,%esi
  a4e753:	4c                   	dec    %esp
  a4e754:	89 cf                	mov    %ecx,%edi
  a4e756:	e9 05 ff ff ff       	jmp    a4e660 <store_slot_info>
  a4e75b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4e760:	48                   	dec    %eax
  a4e761:	89 05 d9 d0 01 00    	mov    %eax,0x1d0d9
  a4e767:	4a                   	dec    %edx
  a4e768:	8d 04 1f             	lea    (%edi,%ebx,1),%eax
  a4e76b:	4c                   	dec    %esp
  a4e76c:	39 d0                	cmp    %edx,%eax
  a4e76e:	77 c8                	ja     a4e738 <process_gb_huge_pages+0x88>
  a4e770:	4c                   	dec    %esp
  a4e771:	89 d0                	mov    %edx,%eax
  a4e773:	48                   	dec    %eax
  a4e774:	89 3c 24             	mov    %edi,(%esp)
  a4e777:	4c                   	dec    %esp
  a4e778:	89 de                	mov    %ebx,%esi
  a4e77a:	48                   	dec    %eax
  a4e77b:	29 f8                	sub    %edi,%eax
  a4e77d:	48                   	dec    %eax
  a4e77e:	89 e7                	mov    %esp,%edi
  a4e780:	48                   	dec    %eax
  a4e781:	89 44 24 08          	mov    %eax,0x8(%esp)
  a4e785:	e8 d6 fe ff ff       	call   a4e660 <store_slot_info>
  a4e78a:	49                   	dec    %ecx
  a4e78b:	8b 31                	mov    (%ecx),%esi
  a4e78d:	49                   	dec    %ecx
  a4e78e:	03 71 08             	add    0x8(%ecx),%esi
  a4e791:	eb a5                	jmp    a4e738 <process_gb_huge_pages+0x88>
  a4e793:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4e798:	48                   	dec    %eax
  a4e799:	89 74 24 08          	mov    %esi,0x8(%esp)
  a4e79d:	48                   	dec    %eax
  a4e79e:	89 e7                	mov    %esp,%edi
  a4e7a0:	4c                   	dec    %esp
  a4e7a1:	89 de                	mov    %ebx,%esi
  a4e7a3:	4c                   	dec    %esp
  a4e7a4:	89 04 24             	mov    %eax,(%esp)
  a4e7a7:	e8 b4 fe ff ff       	call   a4e660 <store_slot_info>
  a4e7ac:	48                   	dec    %eax
  a4e7ad:	83 c4 10             	add    $0x10,%esp
  a4e7b0:	c3                   	ret    
  a4e7b1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4e7b8:	00 00 00 00 
  a4e7bc:	0f 1f 40 00          	nopl   0x0(%eax)

0000000000a4e7c0 <process_mem_region.isra.0>:
  a4e7c0:	41                   	inc    %ecx
  a4e7c1:	57                   	push   %edi
  a4e7c2:	41                   	inc    %ecx
  a4e7c3:	56                   	push   %esi
  a4e7c4:	4c                   	dec    %esp
  a4e7c5:	8d 34 37             	lea    (%edi,%esi,1),%esi
  a4e7c8:	41                   	inc    %ecx
  a4e7c9:	55                   	push   %ebp
  a4e7ca:	41                   	inc    %ecx
  a4e7cb:	54                   	push   %esp
  a4e7cc:	55                   	push   %ebp
  a4e7cd:	53                   	push   %ebx
  a4e7ce:	48                   	dec    %eax
  a4e7cf:	83 ec 20             	sub    $0x20,%esp
  a4e7d2:	49                   	dec    %ecx
  a4e7d3:	39 d6                	cmp    %edx,%esi
  a4e7d5:	0f 82 52 01 00 00    	jb     a4e92d <process_mem_region.isra.0+0x16d>
  a4e7db:	4c                   	dec    %esp
  a4e7dc:	39 35 2e 77 00 00    	cmp    %esi,0x772e
  a4e7e2:	4c                   	dec    %esp
  a4e7e3:	0f 46 35 26 77 00 00 	cmovbe 0x7726,%esi
  a4e7ea:	48                   	dec    %eax
  a4e7eb:	89 f8                	mov    %edi,%eax
  a4e7ed:	49                   	dec    %ecx
  a4e7ee:	39 fe                	cmp    %edi,%esi
  a4e7f0:	0f 86 37 01 00 00    	jbe    a4e92d <process_mem_region.isra.0+0x16d>
  a4e7f6:	49                   	dec    %ecx
  a4e7f7:	89 d5                	mov    %edx,%ebp
  a4e7f9:	4c                   	dec    %esp
  a4e7fa:	89 f2                	mov    %esi,%edx
  a4e7fc:	48                   	dec    %eax
  a4e7fd:	29 fa                	sub    %edi,%edx
  a4e7ff:	48                   	dec    %eax
  a4e800:	83 3d e9 c9 01 00 63 	cmpl   $0x63,0x1c9e9
  a4e807:	48                   	dec    %eax
  a4e808:	89 54 24 08          	mov    %edx,0x8(%esp)
  a4e80c:	0f 87 1b 01 00 00    	ja     a4e92d <process_mem_region.isra.0+0x16d>
  a4e812:	49                   	dec    %ecx
  a4e813:	89 cf                	mov    %ecx,%edi
  a4e815:	4c                   	dec    %esp
  a4e816:	8d 25 c4 d0 01 00    	lea    0x1d0c4,%esp
  a4e81c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4e820:	49                   	dec    %ecx
  a4e821:	39 c5                	cmp    %eax,%ebp
  a4e823:	49                   	dec    %ecx
  a4e824:	89 c0                	mov    %eax,%eax
  a4e826:	4d                   	dec    %ebp
  a4e827:	0f 43 c5             	cmovae %ebp,%eax
  a4e82a:	49                   	dec    %ecx
  a4e82b:	81 c0 ff ff 1f 00    	add    $0x1fffff,%eax
  a4e831:	49                   	dec    %ecx
  a4e832:	81 e0 00 00 e0 ff    	and    $0xffe00000,%eax
  a4e838:	4c                   	dec    %esp
  a4e839:	89 04 24             	mov    %eax,(%esp)
  a4e83c:	4d                   	dec    %ebp
  a4e83d:	39 c6                	cmp    %eax,%esi
  a4e83f:	0f 82 e8 00 00 00    	jb     a4e92d <process_mem_region.isra.0+0x16d>
  a4e845:	48                   	dec    %eax
  a4e846:	03 44 24 08          	add    0x8(%esp),%eax
  a4e84a:	48                   	dec    %eax
  a4e84b:	89 c7                	mov    %eax,%edi
  a4e84d:	4c                   	dec    %esp
  a4e84e:	29 c0                	sub    %eax,%eax
  a4e850:	48                   	dec    %eax
  a4e851:	89 44 24 08          	mov    %eax,0x8(%esp)
  a4e855:	4c                   	dec    %esp
  a4e856:	39 f8                	cmp    %edi,%eax
  a4e858:	0f 82 cf 00 00 00    	jb     a4e92d <process_mem_region.isra.0+0x16d>
  a4e85e:	48                   	dec    %eax
  a4e85f:	8d 05 fb cf 01 00    	lea    0x1cffb,%eax
  a4e865:	48                   	dec    %eax
  a4e866:	89 fe                	mov    %edi,%esi
  a4e868:	45                   	inc    %ebp
  a4e869:	31 c9                	xor    %ecx,%ecx
  a4e86b:	eb 0c                	jmp    a4e879 <process_mem_region.isra.0+0xb9>
  a4e86d:	0f 1f 00             	nopl   (%eax)
  a4e870:	48                   	dec    %eax
  a4e871:	83 c0 10             	add    $0x10,%eax
  a4e874:	4c                   	dec    %esp
  a4e875:	39 e0                	cmp    %esp,%eax
  a4e877:	74 37                	je     a4e8b0 <process_mem_region.isra.0+0xf0>
  a4e879:	48                   	dec    %eax
  a4e87a:	8b 10                	mov    (%eax),%edx
  a4e87c:	48                   	dec    %eax
  a4e87d:	39 d7                	cmp    %edx,%edi
  a4e87f:	76 ef                	jbe    a4e870 <process_mem_region.isra.0+0xb0>
  a4e881:	4c                   	dec    %esp
  a4e882:	8b 50 08             	mov    0x8(%eax),%edx
  a4e885:	4a                   	dec    %edx
  a4e886:	8d 0c 12             	lea    (%edx,%edx,1),%ecx
  a4e889:	49                   	dec    %ecx
  a4e88a:	39 c8                	cmp    %ecx,%eax
  a4e88c:	0f 92 c1             	setb   %cl
  a4e88f:	48                   	dec    %eax
  a4e890:	39 f2                	cmp    %esi,%edx
  a4e892:	41                   	inc    %ecx
  a4e893:	0f 92 c3             	setb   %bl
  a4e896:	44                   	inc    %esp
  a4e897:	20 d9                	and    %bl,%cl
  a4e899:	74 d5                	je     a4e870 <process_mem_region.isra.0+0xb0>
  a4e89b:	48                   	dec    %eax
  a4e89c:	83 c0 10             	add    $0x10,%eax
  a4e89f:	4c                   	dec    %esp
  a4e8a0:	89 d5                	mov    %edx,%ebp
  a4e8a2:	48                   	dec    %eax
  a4e8a3:	89 d3                	mov    %edx,%ebx
  a4e8a5:	41                   	inc    %ecx
  a4e8a6:	89 c9                	mov    %ecx,%ecx
  a4e8a8:	48                   	dec    %eax
  a4e8a9:	89 d6                	mov    %edx,%esi
  a4e8ab:	4c                   	dec    %esp
  a4e8ac:	39 e0                	cmp    %esp,%eax
  a4e8ae:	75 c9                	jne    a4e879 <process_mem_region.isra.0+0xb9>
  a4e8b0:	48                   	dec    %eax
  a4e8b1:	8b 05 59 b8 01 00    	mov    0x1b859,%eax
  a4e8b7:	48                   	dec    %eax
  a4e8b8:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
  a4e8be:	48                   	dec    %eax
  a4e8bf:	85 c0                	test   %eax,%eax
  a4e8c1:	74 3d                	je     a4e900 <process_mem_region.isra.0+0x140>
  a4e8c3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4e8c8:	8b 50 0c             	mov    0xc(%eax),%edx
  a4e8cb:	48                   	dec    %eax
  a4e8cc:	39 c7                	cmp    %eax,%edi
  a4e8ce:	76 28                	jbe    a4e8f8 <process_mem_region.isra.0+0x138>
  a4e8d0:	48                   	dec    %eax
  a4e8d1:	83 c2 10             	add    $0x10,%edx
  a4e8d4:	48                   	dec    %eax
  a4e8d5:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
  a4e8d8:	49                   	dec    %ecx
  a4e8d9:	39 c8                	cmp    %ecx,%eax
  a4e8db:	0f 92 c1             	setb   %cl
  a4e8de:	48                   	dec    %eax
  a4e8df:	39 f0                	cmp    %esi,%eax
  a4e8e1:	41                   	inc    %ecx
  a4e8e2:	0f 92 c2             	setb   %dl
  a4e8e5:	44                   	inc    %esp
  a4e8e6:	20 d1                	and    %dl,%cl
  a4e8e8:	48                   	dec    %eax
  a4e8e9:	0f 45 ea             	cmovne %edx,%ebp
  a4e8ec:	48                   	dec    %eax
  a4e8ed:	0f 45 d8             	cmovne %eax,%ebx
  a4e8f0:	44                   	inc    %esp
  a4e8f1:	0f 45 c9             	cmovne %ecx,%ecx
  a4e8f4:	48                   	dec    %eax
  a4e8f5:	0f 45 f0             	cmovne %eax,%esi
  a4e8f8:	48                   	dec    %eax
  a4e8f9:	8b 00                	mov    (%eax),%eax
  a4e8fb:	48                   	dec    %eax
  a4e8fc:	85 c0                	test   %eax,%eax
  a4e8fe:	75 c8                	jne    a4e8c8 <process_mem_region.isra.0+0x108>
  a4e900:	45                   	inc    %ebp
  a4e901:	84 c9                	test   %cl,%cl
  a4e903:	74 63                	je     a4e968 <process_mem_region.isra.0+0x1a8>
  a4e905:	4b                   	dec    %ebx
  a4e906:	8d 04 38             	lea    (%eax,%edi,1),%eax
  a4e909:	48                   	dec    %eax
  a4e90a:	39 c3                	cmp    %eax,%ebx
  a4e90c:	77 32                	ja     a4e940 <process_mem_region.isra.0+0x180>
  a4e90e:	48                   	dec    %eax
  a4e90f:	8d 04 2b             	lea    (%ebx,%ebp,1),%eax
  a4e912:	48                   	dec    %eax
  a4e913:	39 f8                	cmp    %edi,%eax
  a4e915:	73 16                	jae    a4e92d <process_mem_region.isra.0+0x16d>
  a4e917:	48                   	dec    %eax
  a4e918:	29 c7                	sub    %eax,%edi
  a4e91a:	48                   	dec    %eax
  a4e91b:	83 3d ce c8 01 00 63 	cmpl   $0x63,0x1c8ce
  a4e922:	48                   	dec    %eax
  a4e923:	89 7c 24 08          	mov    %edi,0x8(%esp)
  a4e927:	0f 86 f3 fe ff ff    	jbe    a4e820 <process_mem_region.isra.0+0x60>
  a4e92d:	48                   	dec    %eax
  a4e92e:	83 c4 20             	add    $0x20,%esp
  a4e931:	5b                   	pop    %ebx
  a4e932:	5d                   	pop    %ebp
  a4e933:	41                   	inc    %ecx
  a4e934:	5c                   	pop    %esp
  a4e935:	41                   	inc    %ecx
  a4e936:	5d                   	pop    %ebp
  a4e937:	41                   	inc    %ecx
  a4e938:	5e                   	pop    %esi
  a4e939:	41                   	inc    %ecx
  a4e93a:	5f                   	pop    %edi
  a4e93b:	c3                   	ret    
  a4e93c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4e940:	48                   	dec    %eax
  a4e941:	89 d8                	mov    %ebx,%eax
  a4e943:	48                   	dec    %eax
  a4e944:	8d 7c 24 10          	lea    0x10(%esp),%edi
  a4e948:	4c                   	dec    %esp
  a4e949:	89 fe                	mov    %edi,%esi
  a4e94b:	4c                   	dec    %esp
  a4e94c:	89 44 24 10          	mov    %eax,0x10(%esp)
  a4e950:	4c                   	dec    %esp
  a4e951:	29 c0                	sub    %eax,%eax
  a4e953:	48                   	dec    %eax
  a4e954:	89 44 24 18          	mov    %eax,0x18(%esp)
  a4e958:	e8 53 fd ff ff       	call   a4e6b0 <process_gb_huge_pages>
  a4e95d:	48                   	dec    %eax
  a4e95e:	8b 7c 24 08          	mov    0x8(%esp),%edi
  a4e962:	48                   	dec    %eax
  a4e963:	03 3c 24             	add    (%esp),%edi
  a4e966:	eb a6                	jmp    a4e90e <process_mem_region.isra.0+0x14e>
  a4e968:	48                   	dec    %eax
  a4e969:	89 e7                	mov    %esp,%edi
  a4e96b:	4c                   	dec    %esp
  a4e96c:	89 fe                	mov    %edi,%esi
  a4e96e:	e8 3d fd ff ff       	call   a4e6b0 <process_gb_huge_pages>
  a4e973:	eb b8                	jmp    a4e92d <process_mem_region.isra.0+0x16d>
  a4e975:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4e97c:	00 00 00 00 

0000000000a4e980 <kaslr_get_random_long>:
  a4e980:	f3 0f 1e fa          	endbr64 
  a4e984:	48                   	dec    %eax
  a4e985:	8d 15 3d 58 00 00    	lea    0x583d,%edx
  a4e98b:	53                   	push   %ebx
  a4e98c:	31 db                	xor    %ebx,%ebx
  a4e98e:	48                   	dec    %eax
  a4e98f:	b9 34 2e 31 39       	mov    $0x39312e34,%ecx
  a4e994:	2e 31 35 37 48 8d 42 	xor    %esi,%cs:0x428d4837
  a4e99b:	60                   	pusha  
  a4e99c:	eb 09                	jmp    a4e9a7 <kaslr_get_random_long+0x27>
  a4e99e:	66 90                	xchg   %ax,%ax
  a4e9a0:	48                   	dec    %eax
  a4e9a1:	8b 0a                	mov    (%edx),%ecx
  a4e9a3:	48                   	dec    %eax
  a4e9a4:	83 c2 08             	add    $0x8,%edx
  a4e9a7:	48                   	dec    %eax
  a4e9a8:	c1 cb 07             	ror    $0x7,%ebx
  a4e9ab:	48                   	dec    %eax
  a4e9ac:	31 cb                	xor    %ecx,%ebx
  a4e9ae:	48                   	dec    %eax
  a4e9af:	39 d0                	cmp    %edx,%eax
  a4e9b1:	75 ed                	jne    a4e9a0 <kaslr_get_random_long+0x20>
  a4e9b3:	48                   	dec    %eax
  a4e9b4:	8b 15 56 b7 01 00    	mov    0x1b756,%edx
  a4e9ba:	48                   	dec    %eax
  a4e9bb:	8d 82 00 10 00 00    	lea    0x1000(%edx),%eax
  a4e9c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4e9c8:	48                   	dec    %eax
  a4e9c9:	c1 cb 07             	ror    $0x7,%ebx
  a4e9cc:	48                   	dec    %eax
  a4e9cd:	83 c2 08             	add    $0x8,%edx
  a4e9d0:	48                   	dec    %eax
  a4e9d1:	33 5a f8             	xor    -0x8(%edx),%ebx
  a4e9d4:	48                   	dec    %eax
  a4e9d5:	39 c2                	cmp    %eax,%edx
  a4e9d7:	75 ef                	jne    a4e9c8 <kaslr_get_random_long+0x48>
  a4e9d9:	bf 9e 00 00 00       	mov    $0x9e,%edi
  a4e9de:	e8 0d f9 ff ff       	call   a4e2f0 <has_cpuflag>
  a4e9e3:	84 c0                	test   %al,%al
  a4e9e5:	74 14                	je     a4e9fb <kaslr_get_random_long+0x7b>
  a4e9e7:	ba 0a 00 00 00       	mov    $0xa,%edx
  a4e9ec:	0f 1f 40 00          	nopl   0x0(%eax)
  a4e9f0:	48                   	dec    %eax
  a4e9f1:	0f c7 f0             	rdrand %eax
  a4e9f4:	72 6a                	jb     a4ea60 <kaslr_get_random_long+0xe0>
  a4e9f6:	83 ea 01             	sub    $0x1,%edx
  a4e9f9:	75 f5                	jne    a4e9f0 <kaslr_get_random_long+0x70>
  a4e9fb:	bf 04 00 00 00       	mov    $0x4,%edi
  a4ea00:	e8 eb f8 ff ff       	call   a4e2f0 <has_cpuflag>
  a4ea05:	84 c0                	test   %al,%al
  a4ea07:	74 27                	je     a4ea30 <kaslr_get_random_long+0xb0>
  a4ea09:	0f 31                	rdtsc  
  a4ea0b:	48                   	dec    %eax
  a4ea0c:	c1 e2 20             	shl    $0x20,%edx
  a4ea0f:	48                   	dec    %eax
  a4ea10:	09 c2                	or     %eax,%edx
  a4ea12:	48                   	dec    %eax
  a4ea13:	31 d3                	xor    %edx,%ebx
  a4ea15:	48                   	dec    %eax
  a4ea16:	ba d3 8d 84 f3       	mov    $0xf3848dd3,%edx
  a4ea1b:	cb                   	lret   
  a4ea1c:	08 60 5d             	or     %ah,0x5d(%eax)
  a4ea1f:	48                   	dec    %eax
  a4ea20:	89 d8                	mov    %ebx,%eax
  a4ea22:	5b                   	pop    %ebx
  a4ea23:	48                   	dec    %eax
  a4ea24:	f7 e2                	mul    %edx
  a4ea26:	48                   	dec    %eax
  a4ea27:	01 d0                	add    %edx,%eax
  a4ea29:	c3                   	ret    
  a4ea2a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4ea30:	be c2 ff ff ff       	mov    $0xffffffc2,%esi
  a4ea35:	0f 1f 00             	nopl   (%eax)
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
  a4ea54:	48                   	dec    %eax
  a4ea55:	31 c3                	xor    %eax,%ebx
  a4ea57:	eb bc                	jmp    a4ea15 <kaslr_get_random_long+0x95>
  a4ea59:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4ea60:	bf 04 00 00 00       	mov    $0x4,%edi
  a4ea65:	48                   	dec    %eax
  a4ea66:	31 c3                	xor    %eax,%ebx
  a4ea68:	e8 83 f8 ff ff       	call   a4e2f0 <has_cpuflag>
  a4ea6d:	84 c0                	test   %al,%al
  a4ea6f:	75 98                	jne    a4ea09 <kaslr_get_random_long+0x89>
  a4ea71:	eb a2                	jmp    a4ea15 <kaslr_get_random_long+0x95>
  a4ea73:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4ea7a:	00 00 00 00 
  a4ea7e:	66 90                	xchg   %ax,%ax

0000000000a4ea80 <slots_fetch_random.part.0>:
  a4ea80:	48                   	dec    %eax
  a4ea81:	83 ec 08             	sub    $0x8,%esp
  a4ea84:	48                   	dec    %eax
  a4ea85:	8d 3d a5 5b 00 00    	lea    0x5ba5,%edi
  a4ea8b:	e8 f0 fe ff ff       	call   a4e980 <kaslr_get_random_long>
  a4ea90:	31 d2                	xor    %edx,%edx
  a4ea92:	48                   	dec    %eax
  a4ea93:	f7 35 5f c7 01 00    	divl   0x1c75f
  a4ea99:	48                   	dec    %eax
  a4ea9a:	8b 05 50 c7 01 00    	mov    0x1c750,%eax
  a4eaa0:	48                   	dec    %eax
  a4eaa1:	85 c0                	test   %eax,%eax
  a4eaa3:	74 2a                	je     a4eacf <slots_fetch_random.part.0+0x4f>
  a4eaa5:	48                   	dec    %eax
  a4eaa6:	8d 3d 5c c7 01 00    	lea    0x1c75c,%edi
  a4eaac:	31 f6                	xor    %esi,%esi
  a4eaae:	4c                   	dec    %esp
  a4eaaf:	63 07                	arpl   %ax,(%edi)
  a4eab1:	48                   	dec    %eax
  a4eab2:	63 ce                	arpl   %cx,%si
  a4eab4:	49                   	dec    %ecx
  a4eab5:	39 d0                	cmp    %edx,%eax
  a4eab7:	76 1f                	jbe    a4ead8 <slots_fetch_random.part.0+0x58>
  a4eab9:	48                   	dec    %eax
  a4eaba:	8d 05 40 c7 01 00    	lea    0x1c740,%eax
  a4eac0:	48                   	dec    %eax
  a4eac1:	c1 e1 04             	shl    $0x4,%ecx
  a4eac4:	48                   	dec    %eax
  a4eac5:	c1 e2 15             	shl    $0x15,%edx
  a4eac8:	48                   	dec    %eax
  a4eac9:	03 14 08             	add    (%eax,%ecx,1),%edx
  a4eacc:	48                   	dec    %eax
  a4eacd:	89 d0                	mov    %edx,%eax
  a4eacf:	48                   	dec    %eax
  a4ead0:	83 c4 08             	add    $0x8,%esp
  a4ead3:	c3                   	ret    
  a4ead4:	0f 1f 40 00          	nopl   0x0(%eax)
  a4ead8:	48                   	dec    %eax
  a4ead9:	83 c6 01             	add    $0x1,%esi
  a4eadc:	4c                   	dec    %esp
  a4eadd:	29 c2                	sub    %eax,%edx
  a4eadf:	48                   	dec    %eax
  a4eae0:	83 c7 10             	add    $0x10,%edi
  a4eae3:	48                   	dec    %eax
  a4eae4:	39 c6                	cmp    %eax,%esi
  a4eae6:	75 c6                	jne    a4eaae <slots_fetch_random.part.0+0x2e>
  a4eae8:	31 c0                	xor    %eax,%eax
  a4eaea:	eb e3                	jmp    a4eacf <slots_fetch_random.part.0+0x4f>
  a4eaec:	0f 1f 40 00          	nopl   0x0(%eax)

0000000000a4eaf0 <skip_spaces>:
  a4eaf0:	f3 0f 1e fa          	endbr64 
  a4eaf4:	0f b6 17             	movzbl (%edi),%edx
  a4eaf7:	48                   	dec    %eax
  a4eaf8:	8d 0d c2 55 00 00    	lea    0x55c2,%ecx
  a4eafe:	48                   	dec    %eax
  a4eaff:	89 f8                	mov    %edi,%eax
  a4eb01:	f6 04 11 20          	testb  $0x20,(%ecx,%edx,1)
  a4eb05:	74 17                	je     a4eb1e <skip_spaces+0x2e>
  a4eb07:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4eb0e:	00 00 
  a4eb10:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  a4eb14:	48                   	dec    %eax
  a4eb15:	83 c0 01             	add    $0x1,%eax
  a4eb18:	f6 04 11 20          	testb  $0x20,(%ecx,%edx,1)
  a4eb1c:	75 f2                	jne    a4eb10 <skip_spaces+0x20>
  a4eb1e:	c3                   	ret    
  a4eb1f:	90                   	nop

0000000000a4eb20 <get_option>:
  a4eb20:	f3 0f 1e fa          	endbr64 
  a4eb24:	41                   	inc    %ecx
  a4eb25:	54                   	push   %esp
  a4eb26:	55                   	push   %ebp
  a4eb27:	53                   	push   %ebx
  a4eb28:	48                   	dec    %eax
  a4eb29:	8b 2f                	mov    (%edi),%ebp
  a4eb2b:	48                   	dec    %eax
  a4eb2c:	85 ed                	test   %ebp,%ebp
  a4eb2e:	74 06                	je     a4eb36 <get_option+0x16>
  a4eb30:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
  a4eb34:	75 0a                	jne    a4eb40 <get_option+0x20>
  a4eb36:	31 c0                	xor    %eax,%eax
  a4eb38:	5b                   	pop    %ebx
  a4eb39:	5d                   	pop    %ebp
  a4eb3a:	41                   	inc    %ecx
  a4eb3b:	5c                   	pop    %esp
  a4eb3c:	c3                   	ret    
  a4eb3d:	0f 1f 00             	nopl   (%eax)
  a4eb40:	48                   	dec    %eax
  a4eb41:	89 fb                	mov    %edi,%ebx
  a4eb43:	49                   	dec    %ecx
  a4eb44:	89 f4                	mov    %esi,%esp
  a4eb46:	31 d2                	xor    %edx,%edx
  a4eb48:	48                   	dec    %eax
  a4eb49:	89 fe                	mov    %edi,%esi
  a4eb4b:	48                   	dec    %eax
  a4eb4c:	89 ef                	mov    %ebp,%edi
  a4eb4e:	e8 bd ef ff ff       	call   a4db10 <simple_strtol>
  a4eb53:	41                   	inc    %ecx
  a4eb54:	89 04 24             	mov    %eax,(%esp)
  a4eb57:	48                   	dec    %eax
  a4eb58:	8b 03                	mov    (%ebx),%eax
  a4eb5a:	48                   	dec    %eax
  a4eb5b:	39 e8                	cmp    %ebp,%eax
  a4eb5d:	74 d7                	je     a4eb36 <get_option+0x16>
  a4eb5f:	0f b6 10             	movzbl (%eax),%edx
  a4eb62:	80 fa 2c             	cmp    $0x2c,%dl
  a4eb65:	74 19                	je     a4eb80 <get_option+0x60>
  a4eb67:	31 c0                	xor    %eax,%eax
  a4eb69:	80 fa 2d             	cmp    $0x2d,%dl
  a4eb6c:	5b                   	pop    %ebx
  a4eb6d:	5d                   	pop    %ebp
  a4eb6e:	0f 94 c0             	sete   %al
  a4eb71:	41                   	inc    %ecx
  a4eb72:	5c                   	pop    %esp
  a4eb73:	8d 44 00 01          	lea    0x1(%eax,%eax,1),%eax
  a4eb77:	c3                   	ret    
  a4eb78:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a4eb7f:	00 
  a4eb80:	48                   	dec    %eax
  a4eb81:	83 c0 01             	add    $0x1,%eax
  a4eb84:	48                   	dec    %eax
  a4eb85:	89 03                	mov    %eax,(%ebx)
  a4eb87:	b8 02 00 00 00       	mov    $0x2,%eax
  a4eb8c:	eb aa                	jmp    a4eb38 <get_option+0x18>
  a4eb8e:	66 90                	xchg   %ax,%ax

0000000000a4eb90 <get_options>:
  a4eb90:	f3 0f 1e fa          	endbr64 
  a4eb94:	41                   	inc    %ecx
  a4eb95:	57                   	push   %edi
  a4eb96:	41                   	inc    %ecx
  a4eb97:	56                   	push   %esi
  a4eb98:	41                   	inc    %ecx
  a4eb99:	55                   	push   %ebp
  a4eb9a:	49                   	dec    %ecx
  a4eb9b:	89 fd                	mov    %edi,%ebp
  a4eb9d:	41                   	inc    %ecx
  a4eb9e:	54                   	push   %esp
  a4eb9f:	55                   	push   %ebp
  a4eba0:	48                   	dec    %eax
  a4eba1:	89 d5                	mov    %edx,%ebp
  a4eba3:	53                   	push   %ebx
  a4eba4:	48                   	dec    %eax
  a4eba5:	83 ec 18             	sub    $0x18,%esp
  a4eba8:	48                   	dec    %eax
  a4eba9:	89 7c 24 08          	mov    %edi,0x8(%esp)
  a4ebad:	83 fe 01             	cmp    $0x1,%esi
  a4ebb0:	0f 8e f9 00 00 00    	jle    a4ecaf <get_options+0x11f>
  a4ebb6:	89 f3                	mov    %esi,%ebx
  a4ebb8:	41                   	inc    %ecx
  a4ebb9:	bf 01 00 00 00       	mov    $0x1,%edi
  a4ebbe:	4c                   	dec    %esp
  a4ebbf:	8d 64 24 08          	lea    0x8(%esp),%esp
  a4ebc3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4ebc8:	4d                   	dec    %ebp
  a4ebc9:	85 ed                	test   %ebp,%ebp
  a4ebcb:	0f 84 bf 00 00 00    	je     a4ec90 <get_options+0x100>
  a4ebd1:	41                   	inc    %ecx
  a4ebd2:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
  a4ebd6:	0f 84 b4 00 00 00    	je     a4ec90 <get_options+0x100>
  a4ebdc:	49                   	dec    %ecx
  a4ebdd:	63 c7                	arpl   %ax,%di
  a4ebdf:	4c                   	dec    %esp
  a4ebe0:	89 ef                	mov    %ebp,%edi
  a4ebe2:	31 d2                	xor    %edx,%edx
  a4ebe4:	4c                   	dec    %esp
  a4ebe5:	89 e6                	mov    %esp,%esi
  a4ebe7:	4c                   	dec    %esp
  a4ebe8:	8d 74 85 00          	lea    0x0(%ebp,%eax,4),%esi
  a4ebec:	e8 1f ef ff ff       	call   a4db10 <simple_strtol>
  a4ebf1:	48                   	dec    %eax
  a4ebf2:	8b 7c 24 08          	mov    0x8(%esp),%edi
  a4ebf6:	41                   	inc    %ecx
  a4ebf7:	89 06                	mov    %eax,(%esi)
  a4ebf9:	4c                   	dec    %esp
  a4ebfa:	39 ef                	cmp    %ebp,%edi
  a4ebfc:	0f 84 8e 00 00 00    	je     a4ec90 <get_options+0x100>
  a4ec02:	0f b6 07             	movzbl (%edi),%eax
  a4ec05:	3c 2c                	cmp    $0x2c,%al
  a4ec07:	0f 84 93 00 00 00    	je     a4eca0 <get_options+0x110>
  a4ec0d:	3c 2d                	cmp    $0x2d,%al
  a4ec0f:	74 1f                	je     a4ec30 <get_options+0xa0>
  a4ec11:	49                   	dec    %ecx
  a4ec12:	89 fd                	mov    %edi,%ebp
  a4ec14:	44                   	inc    %esp
  a4ec15:	89 7d 00             	mov    %edi,0x0(%ebp)
  a4ec18:	48                   	dec    %eax
  a4ec19:	83 c4 18             	add    $0x18,%esp
  a4ec1c:	4c                   	dec    %esp
  a4ec1d:	89 e8                	mov    %ebp,%eax
  a4ec1f:	5b                   	pop    %ebx
  a4ec20:	5d                   	pop    %ebp
  a4ec21:	41                   	inc    %ecx
  a4ec22:	5c                   	pop    %esp
  a4ec23:	41                   	inc    %ecx
  a4ec24:	5d                   	pop    %ebp
  a4ec25:	41                   	inc    %ecx
  a4ec26:	5e                   	pop    %esi
  a4ec27:	41                   	inc    %ecx
  a4ec28:	5f                   	pop    %edi
  a4ec29:	c3                   	ret    
  a4ec2a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4ec30:	48                   	dec    %eax
  a4ec31:	83 c7 01             	add    $0x1,%edi
  a4ec34:	31 d2                	xor    %edx,%edx
  a4ec36:	31 f6                	xor    %esi,%esi
  a4ec38:	41                   	inc    %ecx
  a4ec39:	89 dd                	mov    %ebx,%ebp
  a4ec3b:	48                   	dec    %eax
  a4ec3c:	89 7c 24 08          	mov    %edi,0x8(%esp)
  a4ec40:	45                   	inc    %ebp
  a4ec41:	29 fd                	sub    %edi,%ebp
  a4ec43:	e8 c8 ee ff ff       	call   a4db10 <simple_strtol>
  a4ec48:	48                   	dec    %eax
  a4ec49:	89 c6                	mov    %eax,%esi
  a4ec4b:	89 c1                	mov    %eax,%ecx
  a4ec4d:	41                   	inc    %ecx
  a4ec4e:	8b 06                	mov    (%esi),%eax
  a4ec50:	89 f7                	mov    %esi,%edi
  a4ec52:	29 c7                	sub    %eax,%edi
  a4ec54:	42                   	inc    %edx
  a4ec55:	8d 14 28             	lea    (%eax,%ebp,1),%edx
  a4ec58:	39 c6                	cmp    %eax,%esi
  a4ec5a:	7e 16                	jle    a4ec72 <get_options+0xe2>
  a4ec5c:	0f 1f 40 00          	nopl   0x0(%eax)
  a4ec60:	41                   	inc    %ecx
  a4ec61:	89 06                	mov    %eax,(%esi)
  a4ec63:	83 c0 01             	add    $0x1,%eax
  a4ec66:	49                   	dec    %ecx
  a4ec67:	83 c6 04             	add    $0x4,%esi
  a4ec6a:	39 c2                	cmp    %eax,%edx
  a4ec6c:	74 04                	je     a4ec72 <get_options+0xe2>
  a4ec6e:	39 c1                	cmp    %eax,%ecx
  a4ec70:	7f ee                	jg     a4ec60 <get_options+0xd0>
  a4ec72:	4c                   	dec    %esp
  a4ec73:	8b 6c 24 08          	mov    0x8(%esp),%ebp
  a4ec77:	85 ff                	test   %edi,%edi
  a4ec79:	78 15                	js     a4ec90 <get_options+0x100>
  a4ec7b:	41                   	inc    %ecx
  a4ec7c:	01 ff                	add    %edi,%edi
  a4ec7e:	44                   	inc    %esp
  a4ec7f:	39 fb                	cmp    %edi,%ebx
  a4ec81:	0f 8f 41 ff ff ff    	jg     a4ebc8 <get_options+0x38>
  a4ec87:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4ec8e:	00 00 
  a4ec90:	41                   	inc    %ecx
  a4ec91:	83 ef 01             	sub    $0x1,%edi
  a4ec94:	e9 7b ff ff ff       	jmp    a4ec14 <get_options+0x84>
  a4ec99:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4eca0:	4c                   	dec    %esp
  a4eca1:	8d 6f 01             	lea    0x1(%edi),%ebp
  a4eca4:	41                   	inc    %ecx
  a4eca5:	83 c7 01             	add    $0x1,%edi
  a4eca8:	4c                   	dec    %esp
  a4eca9:	89 6c 24 08          	mov    %ebp,0x8(%esp)
  a4ecad:	eb cf                	jmp    a4ec7e <get_options+0xee>
  a4ecaf:	45                   	inc    %ebp
  a4ecb0:	31 ff                	xor    %edi,%edi
  a4ecb2:	e9 5d ff ff ff       	jmp    a4ec14 <get_options+0x84>
  a4ecb7:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4ecbe:	00 00 

0000000000a4ecc0 <memparse>:
  a4ecc0:	f3 0f 1e fa          	endbr64 
  a4ecc4:	53                   	push   %ebx
  a4ecc5:	31 d2                	xor    %edx,%edx
  a4ecc7:	48                   	dec    %eax
  a4ecc8:	89 f3                	mov    %esi,%ebx
  a4ecca:	48                   	dec    %eax
  a4eccb:	83 ec 10             	sub    $0x10,%esp
  a4ecce:	48                   	dec    %eax
  a4eccf:	8d 74 24 08          	lea    0x8(%esp),%esi
  a4ecd3:	e8 68 ed ff ff       	call   a4da40 <simple_strtoull>
  a4ecd8:	48                   	dec    %eax
  a4ecd9:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  a4ecdd:	0f b6 39             	movzbl (%ecx),%edi
  a4ece0:	8d 57 bb             	lea    -0x45(%edi),%edx
  a4ece3:	80 fa 2f             	cmp    $0x2f,%dl
  a4ece6:	77 39                	ja     a4ed21 <memparse+0x61>
  a4ece8:	48                   	dec    %eax
  a4ece9:	8d 35 11 53 00 00    	lea    0x5311,%esi
  a4ecef:	0f b6 d2             	movzbl %dl,%edx
  a4ecf2:	48                   	dec    %eax
  a4ecf3:	63 14 96             	arpl   %dx,(%esi,%edx,4)
  a4ecf6:	48                   	dec    %eax
  a4ecf7:	01 f2                	add    %esi,%edx
  a4ecf9:	3e ff e2             	notrack jmp *%edx
  a4ecfc:	0f 1f 40 00          	nopl   0x0(%eax)
  a4ed00:	48                   	dec    %eax
  a4ed01:	c1 e0 0a             	shl    $0xa,%eax
  a4ed04:	48                   	dec    %eax
  a4ed05:	c1 e0 0a             	shl    $0xa,%eax
  a4ed08:	48                   	dec    %eax
  a4ed09:	c1 e0 0a             	shl    $0xa,%eax
  a4ed0c:	48                   	dec    %eax
  a4ed0d:	c1 e0 0a             	shl    $0xa,%eax
  a4ed10:	48                   	dec    %eax
  a4ed11:	c1 e0 0a             	shl    $0xa,%eax
  a4ed14:	48                   	dec    %eax
  a4ed15:	83 c1 01             	add    $0x1,%ecx
  a4ed18:	48                   	dec    %eax
  a4ed19:	c1 e0 0a             	shl    $0xa,%eax
  a4ed1c:	48                   	dec    %eax
  a4ed1d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  a4ed21:	48                   	dec    %eax
  a4ed22:	85 db                	test   %ebx,%ebx
  a4ed24:	74 08                	je     a4ed2e <memparse+0x6e>
  a4ed26:	48                   	dec    %eax
  a4ed27:	8b 54 24 08          	mov    0x8(%esp),%edx
  a4ed2b:	48                   	dec    %eax
  a4ed2c:	89 13                	mov    %edx,(%ebx)
  a4ed2e:	48                   	dec    %eax
  a4ed2f:	83 c4 10             	add    $0x10,%esp
  a4ed32:	5b                   	pop    %ebx
  a4ed33:	c3                   	ret    
  a4ed34:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4ed3b:	00 00 00 00 
  a4ed3f:	90                   	nop

0000000000a4ed40 <parse_option_str>:
  a4ed40:	f3 0f 1e fa          	endbr64 
  a4ed44:	80 3f 00             	cmpb   $0x0,(%edi)
  a4ed47:	0f 84 8f 00 00 00    	je     a4eddc <parse_option_str+0x9c>
  a4ed4d:	55                   	push   %ebp
  a4ed4e:	48                   	dec    %eax
  a4ed4f:	89 f5                	mov    %esi,%ebp
  a4ed51:	53                   	push   %ebx
  a4ed52:	48                   	dec    %eax
  a4ed53:	89 fb                	mov    %edi,%ebx
  a4ed55:	48                   	dec    %eax
  a4ed56:	83 ec 08             	sub    $0x8,%esp
  a4ed59:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4ed60:	48                   	dec    %eax
  a4ed61:	89 ef                	mov    %ebp,%edi
  a4ed63:	e8 c8 ed ff ff       	call   a4db30 <strlen>
  a4ed68:	48                   	dec    %eax
  a4ed69:	89 ee                	mov    %ebp,%esi
  a4ed6b:	48                   	dec    %eax
  a4ed6c:	89 df                	mov    %ebx,%edi
  a4ed6e:	48                   	dec    %eax
  a4ed6f:	89 c2                	mov    %eax,%edx
  a4ed71:	e8 0a ec ff ff       	call   a4d980 <strncmp>
  a4ed76:	85 c0                	test   %eax,%eax
  a4ed78:	74 3e                	je     a4edb8 <parse_option_str+0x78>
  a4ed7a:	0f b6 03             	movzbl (%ebx),%eax
  a4ed7d:	3c 2c                	cmp    $0x2c,%al
  a4ed7f:	74 17                	je     a4ed98 <parse_option_str+0x58>
  a4ed81:	84 c0                	test   %al,%al
  a4ed83:	74 13                	je     a4ed98 <parse_option_str+0x58>
  a4ed85:	0f 1f 00             	nopl   (%eax)
  a4ed88:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
  a4ed8c:	48                   	dec    %eax
  a4ed8d:	83 c3 01             	add    $0x1,%ebx
  a4ed90:	84 c0                	test   %al,%al
  a4ed92:	74 04                	je     a4ed98 <parse_option_str+0x58>
  a4ed94:	3c 2c                	cmp    $0x2c,%al
  a4ed96:	75 f0                	jne    a4ed88 <parse_option_str+0x48>
  a4ed98:	3c 2c                	cmp    $0x2c,%al
  a4ed9a:	0f 94 c0             	sete   %al
  a4ed9d:	0f b6 c0             	movzbl %al,%eax
  a4eda0:	48                   	dec    %eax
  a4eda1:	01 c3                	add    %eax,%ebx
  a4eda3:	80 3b 00             	cmpb   $0x0,(%ebx)
  a4eda6:	75 b8                	jne    a4ed60 <parse_option_str+0x20>
  a4eda8:	48                   	dec    %eax
  a4eda9:	83 c4 08             	add    $0x8,%esp
  a4edac:	31 c0                	xor    %eax,%eax
  a4edae:	5b                   	pop    %ebx
  a4edaf:	5d                   	pop    %ebp
  a4edb0:	c3                   	ret    
  a4edb1:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4edb8:	48                   	dec    %eax
  a4edb9:	89 ef                	mov    %ebp,%edi
  a4edbb:	e8 70 ed ff ff       	call   a4db30 <strlen>
  a4edc0:	48                   	dec    %eax
  a4edc1:	01 c3                	add    %eax,%ebx
  a4edc3:	0f b6 13             	movzbl (%ebx),%edx
  a4edc6:	84 d2                	test   %dl,%dl
  a4edc8:	0f 94 c0             	sete   %al
  a4edcb:	80 fa 2c             	cmp    $0x2c,%dl
  a4edce:	0f 94 c2             	sete   %dl
  a4edd1:	08 d0                	or     %dl,%al
  a4edd3:	74 b3                	je     a4ed88 <parse_option_str+0x48>
  a4edd5:	48                   	dec    %eax
  a4edd6:	83 c4 08             	add    $0x8,%esp
  a4edd9:	5b                   	pop    %ebx
  a4edda:	5d                   	pop    %ebp
  a4eddb:	c3                   	ret    
  a4eddc:	31 c0                	xor    %eax,%eax
  a4edde:	c3                   	ret    
  a4eddf:	90                   	nop

0000000000a4ede0 <next_arg>:
  a4ede0:	f3 0f 1e fa          	endbr64 
  a4ede4:	41                   	inc    %ecx
  a4ede5:	55                   	push   %ebp
  a4ede6:	49                   	dec    %ecx
  a4ede7:	89 fb                	mov    %edi,%ebx
  a4ede9:	45                   	inc    %ebp
  a4edea:	31 ed                	xor    %ebp,%ebp
  a4edec:	41                   	inc    %ecx
  a4eded:	54                   	push   %esp
  a4edee:	49                   	dec    %ecx
  a4edef:	89 f4                	mov    %esi,%esp
  a4edf1:	55                   	push   %ebp
  a4edf2:	48                   	dec    %eax
  a4edf3:	89 d5                	mov    %edx,%ebp
  a4edf5:	53                   	push   %ebx
  a4edf6:	0f b6 07             	movzbl (%edi),%eax
  a4edf9:	3c 22                	cmp    $0x22,%al
  a4edfb:	75 0e                	jne    a4ee0b <next_arg+0x2b>
  a4edfd:	0f b6 47 01          	movzbl 0x1(%edi),%eax
  a4ee01:	49                   	dec    %ecx
  a4ee02:	83 c3 01             	add    $0x1,%ebx
  a4ee05:	41                   	inc    %ecx
  a4ee06:	bd 01 00 00 00       	mov    $0x1,%ebp
  a4ee0b:	84 c0                	test   %al,%al
  a4ee0d:	0f 84 e4 00 00 00    	je     a4eef7 <next_arg+0x117>
  a4ee13:	4c                   	dec    %esp
  a4ee14:	8d 0d a6 52 00 00    	lea    0x52a6,%ecx
  a4ee1a:	0f b6 d0             	movzbl %al,%edx
  a4ee1d:	41                   	inc    %ecx
  a4ee1e:	f6 04 11 20          	testb  $0x20,(%ecx,%edx,1)
  a4ee22:	74 09                	je     a4ee2d <next_arg+0x4d>
  a4ee24:	45                   	inc    %ebp
  a4ee25:	85 ed                	test   %ebp,%ebp
  a4ee27:	0f 84 ca 00 00 00    	je     a4eef7 <next_arg+0x117>
  a4ee2d:	44                   	inc    %esp
  a4ee2e:	89 ea                	mov    %ebp,%edx
  a4ee30:	31 db                	xor    %ebx,%ebx
  a4ee32:	31 f6                	xor    %esi,%esi
  a4ee34:	0f 1f 40 00          	nopl   0x0(%eax)
  a4ee38:	85 db                	test   %ebx,%ebx
  a4ee3a:	75 08                	jne    a4ee44 <next_arg+0x64>
  a4ee3c:	3c 3d                	cmp    $0x3d,%al
  a4ee3e:	0f 84 ac 00 00 00    	je     a4eef0 <next_arg+0x110>
  a4ee44:	89 d1                	mov    %edx,%ecx
  a4ee46:	83 f1 01             	xor    $0x1,%ecx
  a4ee49:	3c 22                	cmp    $0x22,%al
  a4ee4b:	0f 44 d1             	cmove  %ecx,%edx
  a4ee4e:	8d 7e 01             	lea    0x1(%esi),%edi
  a4ee51:	4d                   	dec    %ebp
  a4ee52:	8d 04 3b             	lea    (%ebx,%edi,1),%eax
  a4ee55:	48                   	dec    %eax
  a4ee56:	89 f9                	mov    %edi,%ecx
  a4ee58:	41                   	inc    %ecx
  a4ee59:	0f b6 00             	movzbl (%eax),%eax
  a4ee5c:	84 c0                	test   %al,%al
  a4ee5e:	74 18                	je     a4ee78 <next_arg+0x98>
  a4ee60:	44                   	inc    %esp
  a4ee61:	0f b6 d0             	movzbl %al,%edx
  a4ee64:	43                   	inc    %ebx
  a4ee65:	f6 04 11 20          	testb  $0x20,(%ecx,%edx,1)
  a4ee69:	74 05                	je     a4ee70 <next_arg+0x90>
  a4ee6b:	f6 c2 01             	test   $0x1,%dl
  a4ee6e:	74 08                	je     a4ee78 <next_arg+0x98>
  a4ee70:	89 ce                	mov    %ecx,%esi
  a4ee72:	eb c4                	jmp    a4ee38 <next_arg+0x58>
  a4ee74:	0f 1f 40 00          	nopl   0x0(%eax)
  a4ee78:	4d                   	dec    %ebp
  a4ee79:	89 1c 24             	mov    %ebx,(%esp)
  a4ee7c:	85 db                	test   %ebx,%ebx
  a4ee7e:	0f 84 84 00 00 00    	je     a4ef08 <next_arg+0x128>
  a4ee84:	49                   	dec    %ecx
  a4ee85:	8d 44 1b 01          	lea    0x1(%ebx,%ebx,1),%eax
  a4ee89:	41                   	inc    %ecx
  a4ee8a:	c6 04 1b 00          	movb   $0x0,(%ebx,%ebx,1)
  a4ee8e:	48                   	dec    %eax
  a4ee8f:	89 45 00             	mov    %eax,0x0(%ebp)
  a4ee92:	80 38 22             	cmpb   $0x22,(%eax)
  a4ee95:	0f 84 85 00 00 00    	je     a4ef20 <next_arg+0x140>
  a4ee9b:	45                   	inc    %ebp
  a4ee9c:	85 ed                	test   %ebp,%ebp
  a4ee9e:	74 0f                	je     a4eeaf <next_arg+0xcf>
  a4eea0:	8d 41 ff             	lea    -0x1(%ecx),%eax
  a4eea3:	4c                   	dec    %esp
  a4eea4:	01 d8                	add    %ebx,%eax
  a4eea6:	80 38 22             	cmpb   $0x22,(%eax)
  a4eea9:	0f 84 87 00 00 00    	je     a4ef36 <next_arg+0x156>
  a4eeaf:	41                   	inc    %ecx
  a4eeb0:	80 38 00             	cmpb   $0x0,(%eax)
  a4eeb3:	74 2b                	je     a4eee0 <next_arg+0x100>
  a4eeb5:	41                   	inc    %ecx
  a4eeb6:	c6 00 00             	movb   $0x0,(%eax)
  a4eeb9:	4d                   	dec    %ebp
  a4eeba:	8d 44 3b 01          	lea    0x1(%ebx,%edi,1),%eax
  a4eebe:	4c                   	dec    %esp
  a4eebf:	8d 0d fb 51 00 00    	lea    0x51fb,%ecx
  a4eec5:	41                   	inc    %ecx
  a4eec6:	0f b6 00             	movzbl (%eax),%eax
  a4eec9:	41                   	inc    %ecx
  a4eeca:	f6 04 01 20          	testb  $0x20,(%ecx,%eax,1)
  a4eece:	74 10                	je     a4eee0 <next_arg+0x100>
  a4eed0:	41                   	inc    %ecx
  a4eed1:	0f b6 40 01          	movzbl 0x1(%eax),%eax
  a4eed5:	49                   	dec    %ecx
  a4eed6:	83 c0 01             	add    $0x1,%eax
  a4eed9:	41                   	inc    %ecx
  a4eeda:	f6 04 01 20          	testb  $0x20,(%ecx,%eax,1)
  a4eede:	75 f0                	jne    a4eed0 <next_arg+0xf0>
  a4eee0:	5b                   	pop    %ebx
  a4eee1:	4c                   	dec    %esp
  a4eee2:	89 c0                	mov    %eax,%eax
  a4eee4:	5d                   	pop    %ebp
  a4eee5:	41                   	inc    %ecx
  a4eee6:	5c                   	pop    %esp
  a4eee7:	41                   	inc    %ecx
  a4eee8:	5d                   	pop    %ebp
  a4eee9:	c3                   	ret    
  a4eeea:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4eef0:	89 f3                	mov    %esi,%ebx
  a4eef2:	e9 57 ff ff ff       	jmp    a4ee4e <next_arg+0x6e>
  a4eef7:	4d                   	dec    %ebp
  a4eef8:	89 1c 24             	mov    %ebx,(%esp)
  a4eefb:	4d                   	dec    %ebp
  a4eefc:	89 d8                	mov    %ebx,%eax
  a4eefe:	31 c9                	xor    %ecx,%ecx
  a4ef00:	31 ff                	xor    %edi,%edi
  a4ef02:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4ef08:	48                   	dec    %eax
  a4ef09:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%ebp)
  a4ef10:	45                   	inc    %ebp
  a4ef11:	85 ed                	test   %ebp,%ebp
  a4ef13:	75 8b                	jne    a4eea0 <next_arg+0xc0>
  a4ef15:	eb 98                	jmp    a4eeaf <next_arg+0xcf>
  a4ef17:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4ef1e:	00 00 
  a4ef20:	48                   	dec    %eax
  a4ef21:	83 c0 01             	add    $0x1,%eax
  a4ef24:	48                   	dec    %eax
  a4ef25:	89 45 00             	mov    %eax,0x0(%ebp)
  a4ef28:	89 f0                	mov    %esi,%eax
  a4ef2a:	4c                   	dec    %esp
  a4ef2b:	01 d8                	add    %ebx,%eax
  a4ef2d:	80 38 22             	cmpb   $0x22,(%eax)
  a4ef30:	0f 85 79 ff ff ff    	jne    a4eeaf <next_arg+0xcf>
  a4ef36:	c6 00 00             	movb   $0x0,(%eax)
  a4ef39:	e9 71 ff ff ff       	jmp    a4eeaf <next_arg+0xcf>
  a4ef3e:	66 90                	xchg   %ax,%ax

0000000000a4ef40 <choose_random_location>:
  a4ef40:	f3 0f 1e fa          	endbr64 
  a4ef44:	41                   	inc    %ecx
  a4ef45:	57                   	push   %edi
  a4ef46:	41                   	inc    %ecx
  a4ef47:	56                   	push   %esi
  a4ef48:	41                   	inc    %ecx
  a4ef49:	55                   	push   %ebp
  a4ef4a:	41                   	inc    %ecx
  a4ef4b:	54                   	push   %esp
  a4ef4c:	55                   	push   %ebp
  a4ef4d:	48                   	dec    %eax
  a4ef4e:	89 fd                	mov    %edi,%ebp
  a4ef50:	48                   	dec    %eax
  a4ef51:	8d 3d e2 56 00 00    	lea    0x56e2,%edi
  a4ef57:	53                   	push   %ebx
  a4ef58:	48                   	dec    %eax
  a4ef59:	83 ec 68             	sub    $0x68,%esp
  a4ef5c:	48                   	dec    %eax
  a4ef5d:	89 54 24 30          	mov    %edx,0x30(%esp)
  a4ef61:	48                   	dec    %eax
  a4ef62:	89 4c 24 28          	mov    %ecx,0x28(%esp)
  a4ef66:	4c                   	dec    %esp
  a4ef67:	89 44 24 38          	mov    %eax,0x38(%esp)
  a4ef6b:	e8 80 f1 ff ff       	call   a4e0f0 <cmdline_find_option_bool>
  a4ef70:	89 44 24 0c          	mov    %eax,0xc(%esp)
  a4ef74:	85 c0                	test   %eax,%eax
  a4ef76:	0f 85 44 07 00 00    	jne    a4f6c0 <choose_random_location+0x780>
  a4ef7c:	0f 20 e0             	mov    %cr4,%eax
  a4ef7f:	f6 c4 10             	test   $0x10,%ah
  a4ef82:	0f 85 80 05 00 00    	jne    a4f508 <choose_random_location+0x5c8>
  a4ef88:	48                   	dec    %eax
  a4ef89:	8b 05 81 b1 01 00    	mov    0x1b181,%eax
  a4ef8f:	80 88 11 02 00 00 02 	orb    $0x2,0x211(%eax)
  a4ef96:	e8 25 0c 00 00       	call   a4fbc0 <initialize_identity_maps>
  a4ef9b:	48                   	dec    %eax
  a4ef9c:	8b 15 6e b1 01 00    	mov    0x1b16e,%edx
  a4efa2:	48                   	dec    %eax
  a4efa3:	8b 44 24 30          	mov    0x30(%esp),%eax
  a4efa7:	48                   	dec    %eax
  a4efa8:	89 ef                	mov    %ebp,%edi
  a4efaa:	8b b2 60 02 00 00    	mov    0x260(%edx),%esi
  a4efb0:	48                   	dec    %eax
  a4efb1:	8b 00                	mov    (%eax),%eax
  a4efb3:	48                   	dec    %eax
  a4efb4:	89 2d a6 c8 01 00    	mov    %ebp,0x1c8a6
  a4efba:	48                   	dec    %eax
  a4efbb:	29 ee                	sub    %ebp,%esi
  a4efbd:	48                   	dec    %eax
  a4efbe:	01 c6                	add    %eax,%esi
  a4efc0:	48                   	dec    %eax
  a4efc1:	89 35 a1 c8 01 00    	mov    %esi,0x1c8a1
  a4efc7:	e8 34 0d 00 00       	call   a4fd00 <add_identity_map>
  a4efcc:	48                   	dec    %eax
  a4efcd:	8b 05 3d b1 01 00    	mov    0x1b13d,%eax
  a4efd3:	8b 88 c0 00 00 00    	mov    0xc0(%eax),%ecx
  a4efd9:	8b 90 c4 00 00 00    	mov    0xc4(%eax),%edx
  a4efdf:	8b b8 c8 00 00 00    	mov    0xc8(%eax),%edi
  a4efe5:	48                   	dec    %eax
  a4efe6:	c1 e1 20             	shl    $0x20,%ecx
  a4efe9:	48                   	dec    %eax
  a4efea:	c1 e2 20             	shl    $0x20,%edx
  a4efed:	48                   	dec    %eax
  a4efee:	89 ce                	mov    %ecx,%esi
  a4eff0:	48                   	dec    %eax
  a4eff1:	89 d1                	mov    %edx,%ecx
  a4eff3:	8b 90 1c 02 00 00    	mov    0x21c(%eax),%edx
  a4eff9:	48                   	dec    %eax
  a4effa:	09 ca                	or     %ecx,%edx
  a4effc:	8b 88 18 02 00 00    	mov    0x218(%eax),%ecx
  a4f002:	48                   	dec    %eax
  a4f003:	89 15 6f c8 01 00    	mov    %edx,0x1c86f
  a4f009:	48                   	dec    %eax
  a4f00a:	89 fa                	mov    %edi,%edx
  a4f00c:	8b b8 28 02 00 00    	mov    0x228(%eax),%edi
  a4f012:	48                   	dec    %eax
  a4f013:	09 f1                	or     %esi,%ecx
  a4f015:	48                   	dec    %eax
  a4f016:	c1 e2 20             	shl    $0x20,%edx
  a4f019:	31 f6                	xor    %esi,%esi
  a4f01b:	48                   	dec    %eax
  a4f01c:	89 0d 4e c8 01 00    	mov    %ecx,0x1c84e
  a4f022:	48                   	dec    %eax
  a4f023:	09 d7                	or     %edx,%edi
  a4f025:	0f 1f 00             	nopl   (%eax)
  a4f028:	48                   	dec    %eax
  a4f029:	89 f0                	mov    %esi,%eax
  a4f02b:	48                   	dec    %eax
  a4f02c:	83 c6 01             	add    $0x1,%esi
  a4f02f:	80 3c 07 00          	cmpb   $0x0,(%edi,%eax,1)
  a4f033:	75 f3                	jne    a4f028 <choose_random_location+0xe8>
  a4f035:	48                   	dec    %eax
  a4f036:	89 3d 44 c8 01 00    	mov    %edi,0x1c844
  a4f03c:	48                   	dec    %eax
  a4f03d:	89 35 45 c8 01 00    	mov    %esi,0x1c845
  a4f043:	e8 b8 0c 00 00       	call   a4fd00 <add_identity_map>
  a4f048:	48                   	dec    %eax
  a4f049:	8b 3d c1 b0 01 00    	mov    0x1b0c1,%edi
  a4f04f:	be 00 10 00 00       	mov    $0x1000,%esi
  a4f054:	48                   	dec    %eax
  a4f055:	c7 05 39 c8 01 00 00 	movl   $0x1000,0x1c839
  a4f05c:	10 00 00 
  a4f05f:	48                   	dec    %eax
  a4f060:	89 3d 2a c8 01 00    	mov    %edi,0x1c82a
  a4f066:	e8 95 0c 00 00       	call   a4fd00 <add_identity_map>
  a4f06b:	e8 30 f0 ff ff       	call   a4e0a0 <get_cmd_line_ptr>
  a4f070:	49                   	dec    %ecx
  a4f071:	89 c6                	mov    %eax,%esi
  a4f073:	48                   	dec    %eax
  a4f074:	89 c7                	mov    %eax,%edi
  a4f076:	e8 b5 ea ff ff       	call   a4db30 <strlen>
  a4f07b:	48                   	dec    %eax
  a4f07c:	8d 35 bf 55 00 00    	lea    0x55bf,%esi
  a4f082:	4c                   	dec    %esp
  a4f083:	89 f7                	mov    %esi,%edi
  a4f085:	48                   	dec    %eax
  a4f086:	89 c3                	mov    %eax,%ebx
  a4f088:	e8 d3 ea ff ff       	call   a4db60 <strstr>
  a4f08d:	48                   	dec    %eax
  a4f08e:	85 c0                	test   %eax,%eax
  a4f090:	0f 84 f4 05 00 00    	je     a4f68a <choose_random_location+0x74a>
  a4f096:	89 da                	mov    %ebx,%edx
  a4f098:	83 c2 01             	add    $0x1,%edx
  a4f09b:	0f 88 cc 05 00 00    	js     a4f66d <choose_random_location+0x72d>
  a4f0a1:	48                   	dec    %eax
  a4f0a2:	8b 05 40 c8 01 00    	mov    0x1c840,%eax
  a4f0a8:	48                   	dec    %eax
  a4f0a9:	85 c0                	test   %eax,%eax
  a4f0ab:	48                   	dec    %eax
  a4f0ac:	0f 44 05 55 b0 01 00 	cmove  0x1b055,%eax
  a4f0b3:	48                   	dec    %eax
  a4f0b4:	8d 48 03             	lea    0x3(%eax),%ecx
  a4f0b7:	48                   	dec    %eax
  a4f0b8:	63 c2                	arpl   %ax,%dx
  a4f0ba:	48                   	dec    %eax
  a4f0bb:	8b 15 3f b0 01 00    	mov    0x1b03f,%edx
  a4f0c1:	48                   	dec    %eax
  a4f0c2:	83 e1 fc             	and    $0xfffffffc,%ecx
  a4f0c5:	48                   	dec    %eax
  a4f0c6:	01 c8                	add    %ecx,%eax
  a4f0c8:	48                   	dec    %eax
  a4f0c9:	89 cd                	mov    %ecx,%ebp
  a4f0cb:	48                   	dec    %eax
  a4f0cc:	89 05 16 c8 01 00    	mov    %eax,0x1c816
  a4f0d2:	48                   	dec    %eax
  a4f0d3:	85 d2                	test   %edx,%edx
  a4f0d5:	0f 85 89 05 00 00    	jne    a4f664 <choose_random_location+0x724>
  a4f0db:	44                   	inc    %esp
  a4f0dc:	8b 2d 02 c8 01 00    	mov    0x1c802,%ebp
  a4f0e2:	41                   	inc    %ecx
  a4f0e3:	8d 45 01             	lea    0x1(%ebp),%eax
  a4f0e6:	89 05 f8 c7 01 00    	mov    %eax,0x1c7f8
  a4f0ec:	48                   	dec    %eax
  a4f0ed:	85 c9                	test   %ecx,%ecx
  a4f0ef:	0f 84 78 05 00 00    	je     a4f66d <choose_random_location+0x72d>
  a4f0f5:	48                   	dec    %eax
  a4f0f6:	89 da                	mov    %ebx,%edx
  a4f0f8:	48                   	dec    %eax
  a4f0f9:	89 cf                	mov    %ecx,%edi
  a4f0fb:	4c                   	dec    %esp
  a4f0fc:	89 f6                	mov    %esi,%esi
  a4f0fe:	e8 bd eb ff ff       	call   a4dcc0 <memcpy>
  a4f103:	48                   	dec    %eax
  a4f104:	8d 0d b6 4f 00 00    	lea    0x4fb6,%ecx
  a4f10a:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  a4f10e:	0f b6 10             	movzbl (%eax),%edx
  a4f111:	48                   	dec    %eax
  a4f112:	89 d0                	mov    %edx,%eax
  a4f114:	f6 04 11 20          	testb  $0x20,(%ecx,%edx,1)
  a4f118:	74 17                	je     a4f131 <choose_random_location+0x1f1>
  a4f11a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4f120:	0f b6 55 01          	movzbl 0x1(%ebp),%edx
  a4f124:	48                   	dec    %eax
  a4f125:	83 c5 01             	add    $0x1,%ebp
  a4f128:	48                   	dec    %eax
  a4f129:	89 d0                	mov    %edx,%eax
  a4f12b:	f6 04 11 20          	testb  $0x20,(%ecx,%edx,1)
  a4f12f:	75 ef                	jne    a4f120 <choose_random_location+0x1e0>
  a4f131:	84 c0                	test   %al,%al
  a4f133:	0f 84 4b 01 00 00    	je     a4f284 <choose_random_location+0x344>
  a4f139:	48                   	dec    %eax
  a4f13a:	8d 44 24 50          	lea    0x50(%esp),%eax
  a4f13e:	4c                   	dec    %esp
  a4f13f:	8d 2d 1b c7 01 00    	lea    0x1c71b,%ebp
  a4f145:	48                   	dec    %eax
  a4f146:	89 44 24 18          	mov    %eax,0x18(%esp)
  a4f14a:	48                   	dec    %eax
  a4f14b:	8d 44 24 48          	lea    0x48(%esp),%eax
  a4f14f:	48                   	dec    %eax
  a4f150:	89 44 24 10          	mov    %eax,0x10(%esp)
  a4f154:	0f 1f 40 00          	nopl   0x0(%eax)
  a4f158:	48                   	dec    %eax
  a4f159:	8b 54 24 18          	mov    0x18(%esp),%edx
  a4f15d:	48                   	dec    %eax
  a4f15e:	8b 74 24 10          	mov    0x10(%esp),%esi
  a4f162:	48                   	dec    %eax
  a4f163:	89 ef                	mov    %ebp,%edi
  a4f165:	e8 76 fc ff ff       	call   a4ede0 <next_arg>
  a4f16a:	48                   	dec    %eax
  a4f16b:	83 7c 24 50 00       	cmpl   $0x0,0x50(%esp)
  a4f170:	48                   	dec    %eax
  a4f171:	89 c5                	mov    %eax,%ebp
  a4f173:	0f 84 4f 02 00 00    	je     a4f3c8 <choose_random_location+0x488>
  a4f179:	48                   	dec    %eax
  a4f17a:	8b 7c 24 48          	mov    0x48(%esp),%edi
  a4f17e:	48                   	dec    %eax
  a4f17f:	8d 35 d6 54 00 00    	lea    0x54d6,%esi
  a4f185:	e8 c6 e7 ff ff       	call   a4d950 <strcmp>
  a4f18a:	85 c0                	test   %eax,%eax
  a4f18c:	0f 85 be 01 00 00    	jne    a4f350 <choose_random_location+0x410>
  a4f192:	83 3d 4f c0 01 00 03 	cmpl   $0x3,0x1c04f
  a4f199:	0f 8f d1 00 00 00    	jg     a4f270 <choose_random_location+0x330>
  a4f19f:	4c                   	dec    %esp
  a4f1a0:	8b 64 24 50          	mov    0x50(%esp),%esp
  a4f1a4:	4d                   	dec    %ebp
  a4f1a5:	85 e4                	test   %esp,%esp
  a4f1a7:	75 40                	jne    a4f1e9 <choose_random_location+0x2a9>
  a4f1a9:	e9 c2 00 00 00       	jmp    a4f270 <choose_random_location+0x330>
  a4f1ae:	66 90                	xchg   %ax,%ax
  a4f1b0:	3c 22                	cmp    $0x22,%al
  a4f1b2:	0f 8f 58 01 00 00    	jg     a4f310 <choose_random_location+0x3d0>
  a4f1b8:	3c 21                	cmp    $0x21,%al
  a4f1ba:	0f 84 50 01 00 00    	je     a4f310 <choose_random_location+0x3d0>
  a4f1c0:	4d                   	dec    %ebp
  a4f1c1:	85 e4                	test   %esp,%esp
  a4f1c3:	74 0b                	je     a4f1d0 <choose_random_location+0x290>
  a4f1c5:	4c                   	dec    %esp
  a4f1c6:	89 25 44 6d 00 00    	mov    %esp,0x6d44
  a4f1cc:	0f 1f 40 00          	nopl   0x0(%eax)
  a4f1d0:	48                   	dec    %eax
  a4f1d1:	85 db                	test   %ebx,%ebx
  a4f1d3:	0f 84 97 00 00 00    	je     a4f270 <choose_random_location+0x330>
  a4f1d9:	83 3d 08 c0 01 00 03 	cmpl   $0x3,0x1c008
  a4f1e0:	0f 8f e2 02 00 00    	jg     a4f4c8 <choose_random_location+0x588>
  a4f1e6:	49                   	dec    %ecx
  a4f1e7:	89 dc                	mov    %ebx,%esp
  a4f1e9:	be 2c 00 00 00       	mov    $0x2c,%esi
  a4f1ee:	4c                   	dec    %esp
  a4f1ef:	89 e7                	mov    %esp,%edi
  a4f1f1:	31 db                	xor    %ebx,%ebx
  a4f1f3:	e8 08 ea ff ff       	call   a4dc00 <strchr>
  a4f1f8:	48                   	dec    %eax
  a4f1f9:	85 c0                	test   %eax,%eax
  a4f1fb:	74 07                	je     a4f204 <choose_random_location+0x2c4>
  a4f1fd:	c6 00 00             	movb   $0x0,(%eax)
  a4f200:	48                   	dec    %eax
  a4f201:	8d 58 01             	lea    0x1(%eax),%ebx
  a4f204:	ba 08 00 00 00       	mov    $0x8,%edx
  a4f209:	48                   	dec    %eax
  a4f20a:	8d 35 52 54 00 00    	lea    0x5452,%esi
  a4f210:	4c                   	dec    %esp
  a4f211:	89 e7                	mov    %esp,%edi
  a4f213:	4c                   	dec    %esp
  a4f214:	89 64 24 58          	mov    %esp,0x58(%esp)
  a4f218:	e8 63 e7 ff ff       	call   a4d980 <strncmp>
  a4f21d:	85 c0                	test   %eax,%eax
  a4f21f:	0f 84 93 02 00 00    	je     a4f4b8 <choose_random_location+0x578>
  a4f225:	4c                   	dec    %esp
  a4f226:	8b 7c 24 58          	mov    0x58(%esp),%edi
  a4f22a:	4c                   	dec    %esp
  a4f22b:	8d 74 24 58          	lea    0x58(%esp),%esi
  a4f22f:	4c                   	dec    %esp
  a4f230:	89 f6                	mov    %esi,%esi
  a4f232:	4c                   	dec    %esp
  a4f233:	89 ff                	mov    %edi,%edi
  a4f235:	e8 86 fa ff ff       	call   a4ecc0 <memparse>
  a4f23a:	48                   	dec    %eax
  a4f23b:	8b 7c 24 58          	mov    0x58(%esp),%edi
  a4f23f:	49                   	dec    %ecx
  a4f240:	89 c4                	mov    %eax,%esp
  a4f242:	49                   	dec    %ecx
  a4f243:	39 ff                	cmp    %edi,%edi
  a4f245:	0f 84 6d 02 00 00    	je     a4f4b8 <choose_random_location+0x578>
  a4f24b:	0f b6 07             	movzbl (%edi),%eax
  a4f24e:	3c 24                	cmp    $0x24,%al
  a4f250:	0f 8e 5a ff ff ff    	jle    a4f1b0 <choose_random_location+0x270>
  a4f256:	3c 40                	cmp    $0x40,%al
  a4f258:	0f 85 62 ff ff ff    	jne    a4f1c0 <choose_random_location+0x280>
  a4f25e:	48                   	dec    %eax
  a4f25f:	85 db                	test   %ebx,%ebx
  a4f261:	0f 85 72 ff ff ff    	jne    a4f1d9 <choose_random_location+0x299>
  a4f267:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4f26e:	00 00 
  a4f270:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
  a4f274:	0f 85 de fe ff ff    	jne    a4f158 <choose_random_location+0x218>
  a4f27a:	8b 05 64 c6 01 00    	mov    0x1c664,%eax
  a4f280:	44                   	inc    %esp
  a4f281:	8d 68 ff             	lea    -0x1(%eax),%ebp
  a4f284:	44                   	inc    %esp
  a4f285:	89 2d 59 c6 01 00    	mov    %ebp,0x1c659
  a4f28b:	45                   	inc    %ebp
  a4f28c:	85 ed                	test   %ebp,%ebp
  a4f28e:	75 0e                	jne    a4f29e <choose_random_location+0x35e>
  a4f290:	48                   	dec    %eax
  a4f291:	8b 05 71 ae 01 00    	mov    0x1ae71,%eax
  a4f297:	48                   	dec    %eax
  a4f298:	89 05 4a c6 01 00    	mov    %eax,0x1c64a
  a4f29e:	0f b6 2d 3b c6 01 00 	movzbl 0x1c63b,%ebp
  a4f2a5:	40                   	inc    %eax
  a4f2a6:	84 ed                	test   %ch,%ch
  a4f2a8:	0f 84 7d 02 00 00    	je     a4f52b <choose_random_location+0x5eb>
  a4f2ae:	48                   	dec    %eax
  a4f2af:	8d 3d 8b 54 00 00    	lea    0x548b,%edi
  a4f2b5:	e8 66 ee ff ff       	call   a4e120 <warn>
  a4f2ba:	48                   	dec    %eax
  a4f2bb:	8d 3d cd 53 00 00    	lea    0x53cd,%edi
  a4f2c1:	e8 ba f6 ff ff       	call   a4e980 <kaslr_get_random_long>
  a4f2c6:	48                   	dec    %eax
  a4f2c7:	8b 54 24 28          	mov    0x28(%esp),%edx
  a4f2cb:	b9 00 00 00 3f       	mov    $0x3f000000,%ecx
  a4f2d0:	48                   	dec    %eax
  a4f2d1:	81 c2 ff ff 1f 00    	add    $0x1fffff,%edx
  a4f2d7:	48                   	dec    %eax
  a4f2d8:	81 e2 00 00 e0 ff    	and    $0xffe00000,%edx
  a4f2de:	48                   	dec    %eax
  a4f2df:	29 d1                	sub    %edx,%ecx
  a4f2e1:	31 d2                	xor    %edx,%edx
  a4f2e3:	48                   	dec    %eax
  a4f2e4:	c1 e9 15             	shr    $0x15,%ecx
  a4f2e7:	48                   	dec    %eax
  a4f2e8:	83 c1 01             	add    $0x1,%ecx
  a4f2eb:	48                   	dec    %eax
  a4f2ec:	f7 f1                	div    %ecx
  a4f2ee:	48                   	dec    %eax
  a4f2ef:	8b 44 24 38          	mov    0x38(%esp),%eax
  a4f2f3:	48                   	dec    %eax
  a4f2f4:	c1 e2 15             	shl    $0x15,%edx
  a4f2f7:	48                   	dec    %eax
  a4f2f8:	81 c2 00 00 00 01    	add    $0x1000000,%edx
  a4f2fe:	48                   	dec    %eax
  a4f2ff:	89 10                	mov    %edx,(%eax)
  a4f301:	48                   	dec    %eax
  a4f302:	83 c4 68             	add    $0x68,%esp
  a4f305:	5b                   	pop    %ebx
  a4f306:	5d                   	pop    %ebp
  a4f307:	41                   	inc    %ecx
  a4f308:	5c                   	pop    %esp
  a4f309:	41                   	inc    %ecx
  a4f30a:	5d                   	pop    %ebp
  a4f30b:	41                   	inc    %ecx
  a4f30c:	5e                   	pop    %esi
  a4f30d:	41                   	inc    %ecx
  a4f30e:	5f                   	pop    %edi
  a4f30f:	c3                   	ret    
  a4f310:	4c                   	dec    %esp
  a4f311:	89 f6                	mov    %esi,%esi
  a4f313:	48                   	dec    %eax
  a4f314:	83 c7 01             	add    $0x1,%edi
  a4f317:	e8 a4 f9 ff ff       	call   a4ecc0 <memparse>
  a4f31c:	48                   	dec    %eax
  a4f31d:	89 c6                	mov    %eax,%esi
  a4f31f:	48                   	dec    %eax
  a4f320:	85 c0                	test   %eax,%eax
  a4f322:	0f 84 98 fe ff ff    	je     a4f1c0 <choose_random_location+0x280>
  a4f328:	8b 0d ba be 01 00    	mov    0x1beba,%ecx
  a4f32e:	8d 41 04             	lea    0x4(%ecx),%eax
  a4f331:	83 c1 01             	add    $0x1,%ecx
  a4f334:	48                   	dec    %eax
  a4f335:	98                   	cwtl   
  a4f336:	89 0d ac be 01 00    	mov    %ecx,0x1beac
  a4f33c:	48                   	dec    %eax
  a4f33d:	c1 e0 04             	shl    $0x4,%eax
  a4f340:	4c                   	dec    %esp
  a4f341:	01 e8                	add    %ebp,%eax
  a4f343:	48                   	dec    %eax
  a4f344:	89 30                	mov    %esi,(%eax)
  a4f346:	4c                   	dec    %esp
  a4f347:	89 60 08             	mov    %esp,0x8(%eax)
  a4f34a:	e9 81 fe ff ff       	jmp    a4f1d0 <choose_random_location+0x290>
  a4f34f:	90                   	nop
  a4f350:	48                   	dec    %eax
  a4f351:	8b 7c 24 48          	mov    0x48(%esp),%edi
  a4f355:	48                   	dec    %eax
  a4f356:	8d 35 f2 52 00 00    	lea    0x52f2,%esi
  a4f35c:	e8 ff e7 ff ff       	call   a4db60 <strstr>
  a4f361:	48                   	dec    %eax
  a4f362:	85 c0                	test   %eax,%eax
  a4f364:	0f 84 e6 00 00 00    	je     a4f450 <choose_random_location+0x510>
  a4f36a:	48                   	dec    %eax
  a4f36b:	8b 7c 24 48          	mov    0x48(%esp),%edi
  a4f36f:	48                   	dec    %eax
  a4f370:	8d 35 f5 52 00 00    	lea    0x52f5,%esi
  a4f376:	48                   	dec    %eax
  a4f377:	8b 5c 24 50          	mov    0x50(%esp),%ebx
  a4f37b:	48                   	dec    %eax
  a4f37c:	89 7c 24 20          	mov    %edi,0x20(%esp)
  a4f380:	e8 cb e5 ff ff       	call   a4d950 <strcmp>
  a4f385:	48                   	dec    %eax
  a4f386:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a4f38a:	85 c0                	test   %eax,%eax
  a4f38c:	75 72                	jne    a4f400 <choose_random_location+0x4c0>
  a4f38e:	48                   	dec    %eax
  a4f38f:	8d 74 24 58          	lea    0x58(%esp),%esi
  a4f393:	48                   	dec    %eax
  a4f394:	89 df                	mov    %ebx,%edi
  a4f396:	48                   	dec    %eax
  a4f397:	89 5c 24 58          	mov    %ebx,0x58(%esp)
  a4f39b:	e8 20 f9 ff ff       	call   a4ecc0 <memparse>
  a4f3a0:	48                   	dec    %eax
  a4f3a1:	3d 00 00 00 40       	cmp    $0x40000000,%eax
  a4f3a6:	0f 84 34 01 00 00    	je     a4f4e0 <choose_random_location+0x5a0>
  a4f3ac:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
  a4f3b0:	c6 05 2d be 01 00 00 	movb   $0x0,0x1be2d
  a4f3b7:	0f 85 9b fd ff ff    	jne    a4f158 <choose_random_location+0x218>
  a4f3bd:	e9 b8 fe ff ff       	jmp    a4f27a <choose_random_location+0x33a>
  a4f3c2:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4f3c8:	48                   	dec    %eax
  a4f3c9:	8b 7c 24 48          	mov    0x48(%esp),%edi
  a4f3cd:	48                   	dec    %eax
  a4f3ce:	8d 35 84 52 00 00    	lea    0x5284,%esi
  a4f3d4:	e8 77 e5 ff ff       	call   a4d950 <strcmp>
  a4f3d9:	85 c0                	test   %eax,%eax
  a4f3db:	0f 85 98 fd ff ff    	jne    a4f179 <choose_random_location+0x239>
  a4f3e1:	48                   	dec    %eax
  a4f3e2:	8d 3d 08 53 00 00    	lea    0x5308,%edi
  a4f3e8:	e8 33 ed ff ff       	call   a4e120 <warn>
  a4f3ed:	83 2d f0 c4 01 00 01 	subl   $0x1,0x1c4f0
  a4f3f4:	0f 85 a4 fe ff ff    	jne    a4f29e <choose_random_location+0x35e>
  a4f3fa:	e9 91 fe ff ff       	jmp    a4f290 <choose_random_location+0x350>
  a4f3ff:	90                   	nop
  a4f400:	48                   	dec    %eax
  a4f401:	8d 35 47 52 00 00    	lea    0x5247,%esi
  a4f407:	e8 44 e5 ff ff       	call   a4d950 <strcmp>
  a4f40c:	85 c0                	test   %eax,%eax
  a4f40e:	0f 85 5c fe ff ff    	jne    a4f270 <choose_random_location+0x330>
  a4f414:	80 3d c9 bd 01 00 00 	cmpb   $0x0,0x1bdc9
  a4f41b:	0f 84 4f fe ff ff    	je     a4f270 <choose_random_location+0x330>
  a4f421:	31 d2                	xor    %edx,%edx
  a4f423:	48                   	dec    %eax
  a4f424:	8d 74 24 58          	lea    0x58(%esp),%esi
  a4f428:	48                   	dec    %eax
  a4f429:	89 df                	mov    %ebx,%edi
  a4f42b:	48                   	dec    %eax
  a4f42c:	89 5c 24 58          	mov    %ebx,0x58(%esp)
  a4f430:	e8 0b e6 ff ff       	call   a4da40 <simple_strtoull>
  a4f435:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
  a4f439:	48                   	dec    %eax
  a4f43a:	89 05 00 c4 01 00    	mov    %eax,0x1c400
  a4f440:	0f 85 12 fd ff ff    	jne    a4f158 <choose_random_location+0x218>
  a4f446:	e9 2f fe ff ff       	jmp    a4f27a <choose_random_location+0x33a>
  a4f44b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4f450:	48                   	dec    %eax
  a4f451:	8b 7c 24 48          	mov    0x48(%esp),%edi
  a4f455:	48                   	dec    %eax
  a4f456:	8d 35 1a 52 00 00    	lea    0x521a,%esi
  a4f45c:	e8 ef e4 ff ff       	call   a4d950 <strcmp>
  a4f461:	85 c0                	test   %eax,%eax
  a4f463:	0f 85 07 fe ff ff    	jne    a4f270 <choose_random_location+0x330>
  a4f469:	48                   	dec    %eax
  a4f46a:	8b 7c 24 50          	mov    0x50(%esp),%edi
  a4f46e:	48                   	dec    %eax
  a4f46f:	8d 35 05 52 00 00    	lea    0x5205,%esi
  a4f475:	48                   	dec    %eax
  a4f476:	89 7c 24 58          	mov    %edi,0x58(%esp)
  a4f47a:	e8 d1 e4 ff ff       	call   a4d950 <strcmp>
  a4f47f:	85 c0                	test   %eax,%eax
  a4f481:	0f 84 e9 fd ff ff    	je     a4f270 <choose_random_location+0x330>
  a4f487:	48                   	dec    %eax
  a4f488:	8b 7c 24 58          	mov    0x58(%esp),%edi
  a4f48c:	48                   	dec    %eax
  a4f48d:	8d 74 24 58          	lea    0x58(%esp),%esi
  a4f491:	e8 2a f8 ff ff       	call   a4ecc0 <memparse>
  a4f496:	48                   	dec    %eax
  a4f497:	85 c0                	test   %eax,%eax
  a4f499:	0f 84 d1 02 00 00    	je     a4f770 <choose_random_location+0x830>
  a4f49f:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
  a4f4a3:	48                   	dec    %eax
  a4f4a4:	89 05 66 6a 00 00    	mov    %eax,0x6a66
  a4f4aa:	0f 85 a8 fc ff ff    	jne    a4f158 <choose_random_location+0x218>
  a4f4b0:	e9 c5 fd ff ff       	jmp    a4f27a <choose_random_location+0x33a>
  a4f4b5:	0f 1f 00             	nopl   (%eax)
  a4f4b8:	83 3d 29 bd 01 00 03 	cmpl   $0x3,0x1bd29
  a4f4bf:	0f 8e ab fd ff ff    	jle    a4f270 <choose_random_location+0x330>
  a4f4c5:	0f 1f 00             	nopl   (%eax)
  a4f4c8:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
  a4f4cc:	c6 05 0d c4 01 00 01 	movb   $0x1,0x1c40d
  a4f4d3:	0f 85 7f fc ff ff    	jne    a4f158 <choose_random_location+0x218>
  a4f4d9:	e9 9c fd ff ff       	jmp    a4f27a <choose_random_location+0x33a>
  a4f4de:	66 90                	xchg   %ax,%ax
  a4f4e0:	80 3d fd bc 01 00 00 	cmpb   $0x0,0x1bcfd
  a4f4e7:	0f 85 8c 01 00 00    	jne    a4f679 <choose_random_location+0x739>
  a4f4ed:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
  a4f4f1:	c6 05 ec bc 01 00 01 	movb   $0x1,0x1bcec
  a4f4f8:	0f 85 5a fc ff ff    	jne    a4f158 <choose_random_location+0x218>
  a4f4fe:	e9 77 fd ff ff       	jmp    a4f27a <choose_random_location+0x33a>
  a4f503:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4f508:	c7 05 ce bc 01 00 01 	movl   $0x1,0x1bcce
  a4f50f:	00 00 00 
  a4f512:	c7 05 88 6a 00 00 30 	movl   $0x30,0x6a88
  a4f519:	00 00 00 
  a4f51c:	c7 05 7a 6a 00 00 00 	movl   $0x200,0x6a7a
  a4f523:	02 00 00 
  a4f526:	e9 5d fa ff ff       	jmp    a4ef88 <choose_random_location+0x48>
  a4f52b:	48                   	dec    %eax
  a4f52c:	8b 44 24 30          	mov    0x30(%esp),%eax
  a4f530:	bb 00 00 00 20       	mov    $0x20000000,%ebx
  a4f535:	4c                   	dec    %esp
  a4f536:	8b 35 d4 ab 01 00    	mov    0x1abd4,%esi
  a4f53c:	ba 04 00 00 00       	mov    $0x4,%edx
  a4f541:	48                   	dec    %eax
  a4f542:	8d 35 3c 51 00 00    	lea    0x513c,%esi
  a4f548:	48                   	dec    %eax
  a4f549:	81 38 00 00 00 20    	cmpl   $0x20000000,(%eax)
  a4f54f:	48                   	dec    %eax
  a4f550:	0f 46 18             	cmovbe (%eax),%ebx
  a4f553:	4d                   	dec    %ebp
  a4f554:	8d ae c0 01 00 00    	lea    0x1c0(%esi),%ebp
  a4f55a:	4c                   	dec    %esp
  a4f55b:	89 ef                	mov    %ebp,%edi
  a4f55d:	48                   	dec    %eax
  a4f55e:	81 c3 ff ff 1f 00    	add    $0x1fffff,%ebx
  a4f564:	48                   	dec    %eax
  a4f565:	81 e3 00 00 e0 ff    	and    $0xffe00000,%ebx
  a4f56b:	e8 10 e4 ff ff       	call   a4d980 <strncmp>
  a4f570:	85 c0                	test   %eax,%eax
  a4f572:	0f 85 62 01 00 00    	jne    a4f6da <choose_random_location+0x79a>
  a4f578:	45                   	inc    %ebp
  a4f579:	8b ae dc 01 00 00    	mov    0x1dc(%esi),%ebp
  a4f57f:	41                   	inc    %ecx
  a4f580:	8b 86 d0 01 00 00    	mov    0x1d0(%esi),%eax
  a4f586:	31 d2                	xor    %edx,%edx
  a4f588:	41                   	inc    %ecx
  a4f589:	8b b6 d4 01 00 00    	mov    0x1d4(%esi),%esi
  a4f58f:	41                   	inc    %ecx
  a4f590:	8b 8e c8 01 00 00    	mov    0x1c8(%esi),%ecx
  a4f596:	49                   	dec    %ecx
  a4f597:	c1 e5 20             	shl    $0x20,%ebp
  a4f59a:	49                   	dec    %ecx
  a4f59b:	09 c5                	or     %eax,%ebp
  a4f59d:	89 f0                	mov    %esi,%eax
  a4f59f:	f7 f1                	div    %ecx
  a4f5a1:	41                   	inc    %ecx
  a4f5a2:	89 c7                	mov    %eax,%edi
  a4f5a4:	39 ce                	cmp    %ecx,%esi
  a4f5a6:	72 79                	jb     a4f621 <choose_random_location+0x6e1>
  a4f5a8:	31 d2                	xor    %edx,%edx
  a4f5aa:	31 c0                	xor    %eax,%eax
  a4f5ac:	eb 0c                	jmp    a4f5ba <choose_random_location+0x67a>
  a4f5ae:	66 90                	xchg   %ax,%ax
  a4f5b0:	83 c2 01             	add    $0x1,%edx
  a4f5b3:	01 c8                	add    %ecx,%eax
  a4f5b5:	44                   	inc    %esp
  a4f5b6:	39 fa                	cmp    %edi,%edx
  a4f5b8:	73 1d                	jae    a4f5d7 <choose_random_location+0x697>
  a4f5ba:	89 c6                	mov    %eax,%esi
  a4f5bc:	41                   	inc    %ecx
  a4f5bd:	f6 44 35 22 01       	testb  $0x1,0x22(%ebp,%esi,1)
  a4f5c2:	74 ec                	je     a4f5b0 <choose_random_location+0x670>
  a4f5c4:	bd 01 00 00 00       	mov    $0x1,%ebp
  a4f5c9:	eb 0c                	jmp    a4f5d7 <choose_random_location+0x697>
  a4f5cb:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4f5d0:	41                   	inc    %ecx
  a4f5d1:	8b 8e c8 01 00 00    	mov    0x1c8(%esi),%ecx
  a4f5d7:	0f af 4c 24 0c       	imul   0xc(%esp),%ecx
  a4f5dc:	4a                   	dec    %edx
  a4f5dd:	8d 14 29             	lea    (%ecx,%ebp,1),%edx
  a4f5e0:	83 3a 07             	cmpl   $0x7,(%edx)
  a4f5e3:	75 2e                	jne    a4f613 <choose_random_location+0x6d3>
  a4f5e5:	40                   	inc    %eax
  a4f5e6:	84 ed                	test   %ch,%ch
  a4f5e8:	74 06                	je     a4f5f0 <choose_random_location+0x6b0>
  a4f5ea:	f6 42 22 01          	testb  $0x1,0x22(%edx)
  a4f5ee:	74 23                	je     a4f613 <choose_random_location+0x6d3>
  a4f5f0:	48                   	dec    %eax
  a4f5f1:	8b 72 18             	mov    0x18(%edx),%esi
  a4f5f4:	48                   	dec    %eax
  a4f5f5:	8b 7a 08             	mov    0x8(%edx),%edi
  a4f5f8:	48                   	dec    %eax
  a4f5f9:	89 da                	mov    %ebx,%edx
  a4f5fb:	48                   	dec    %eax
  a4f5fc:	8b 4c 24 28          	mov    0x28(%esp),%ecx
  a4f600:	48                   	dec    %eax
  a4f601:	c1 e6 0c             	shl    $0xc,%esi
  a4f604:	e8 b7 f1 ff ff       	call   a4e7c0 <process_mem_region.isra.0>
  a4f609:	48                   	dec    %eax
  a4f60a:	83 3d df bb 01 00 64 	cmpl   $0x64,0x1bbdf
  a4f611:	74 0e                	je     a4f621 <choose_random_location+0x6e1>
  a4f613:	83 44 24 0c 01       	addl   $0x1,0xc(%esp)
  a4f618:	8b 44 24 0c          	mov    0xc(%esp),%eax
  a4f61c:	41                   	inc    %ecx
  a4f61d:	39 c7                	cmp    %eax,%edi
  a4f61f:	77 af                	ja     a4f5d0 <choose_random_location+0x690>
  a4f621:	48                   	dec    %eax
  a4f622:	83 3d cf bb 01 00 00 	cmpl   $0x0,0x1bbcf
  a4f629:	0f 84 7f fc ff ff    	je     a4f2ae <choose_random_location+0x36e>
  a4f62f:	e8 4c f4 ff ff       	call   a4ea80 <slots_fetch_random.part.0>
  a4f634:	48                   	dec    %eax
  a4f635:	89 c3                	mov    %eax,%ebx
  a4f637:	48                   	dec    %eax
  a4f638:	85 c0                	test   %eax,%eax
  a4f63a:	0f 84 6e fc ff ff    	je     a4f2ae <choose_random_location+0x36e>
  a4f640:	4c                   	dec    %esp
  a4f641:	8b 74 24 30          	mov    0x30(%esp),%esi
  a4f645:	49                   	dec    %ecx
  a4f646:	39 06                	cmp    %eax,(%esi)
  a4f648:	74 10                	je     a4f65a <choose_random_location+0x71a>
  a4f64a:	48                   	dec    %eax
  a4f64b:	8b 74 24 28          	mov    0x28(%esp),%esi
  a4f64f:	48                   	dec    %eax
  a4f650:	89 c7                	mov    %eax,%edi
  a4f652:	e8 a9 06 00 00       	call   a4fd00 <add_identity_map>
  a4f657:	49                   	dec    %ecx
  a4f658:	89 1e                	mov    %ebx,(%esi)
  a4f65a:	e8 e1 06 00 00       	call   a4fd40 <finalize_identity_maps>
  a4f65f:	e9 56 fc ff ff       	jmp    a4f2ba <choose_random_location+0x37a>
  a4f664:	48                   	dec    %eax
  a4f665:	39 d0                	cmp    %edx,%eax
  a4f667:	0f 82 6e fa ff ff    	jb     a4f0db <choose_random_location+0x19b>
  a4f66d:	48                   	dec    %eax
  a4f66e:	8d 3d 4c 50 00 00    	lea    0x504c,%edi
  a4f674:	e8 d7 ea ff ff       	call   a4e150 <error>
  a4f679:	48                   	dec    %eax
  a4f67a:	8d 3d 90 50 00 00    	lea    0x5090,%edi
  a4f680:	e8 9b ea ff ff       	call   a4e120 <warn>
  a4f685:	e9 63 fe ff ff       	jmp    a4f4ed <choose_random_location+0x5ad>
  a4f68a:	48                   	dec    %eax
  a4f68b:	8d 35 b8 4f 00 00    	lea    0x4fb8,%esi
  a4f691:	4c                   	dec    %esp
  a4f692:	89 f7                	mov    %esi,%edi
  a4f694:	e8 c7 e4 ff ff       	call   a4db60 <strstr>
  a4f699:	48                   	dec    %eax
  a4f69a:	85 c0                	test   %eax,%eax
  a4f69c:	0f 85 f4 f9 ff ff    	jne    a4f096 <choose_random_location+0x156>
  a4f6a2:	48                   	dec    %eax
  a4f6a3:	8d 35 a5 4f 00 00    	lea    0x4fa5,%esi
  a4f6a9:	4c                   	dec    %esp
  a4f6aa:	89 f7                	mov    %esi,%edi
  a4f6ac:	e8 af e4 ff ff       	call   a4db60 <strstr>
  a4f6b1:	48                   	dec    %eax
  a4f6b2:	85 c0                	test   %eax,%eax
  a4f6b4:	0f 85 dc f9 ff ff    	jne    a4f096 <choose_random_location+0x156>
  a4f6ba:	e9 df fb ff ff       	jmp    a4f29e <choose_random_location+0x35e>
  a4f6bf:	90                   	nop
  a4f6c0:	48                   	dec    %eax
  a4f6c1:	83 c4 68             	add    $0x68,%esp
  a4f6c4:	48                   	dec    %eax
  a4f6c5:	8d 3d cd 4f 00 00    	lea    0x4fcd,%edi
  a4f6cb:	5b                   	pop    %ebx
  a4f6cc:	5d                   	pop    %ebp
  a4f6cd:	41                   	inc    %ecx
  a4f6ce:	5c                   	pop    %esp
  a4f6cf:	41                   	inc    %ecx
  a4f6d0:	5d                   	pop    %ebp
  a4f6d1:	41                   	inc    %ecx
  a4f6d2:	5e                   	pop    %esi
  a4f6d3:	41                   	inc    %ecx
  a4f6d4:	5f                   	pop    %edi
  a4f6d5:	e9 46 ea ff ff       	jmp    a4e120 <warn>
  a4f6da:	ba 04 00 00 00       	mov    $0x4,%edx
  a4f6df:	48                   	dec    %eax
  a4f6e0:	8d 35 a3 4f 00 00    	lea    0x4fa3,%esi
  a4f6e6:	4c                   	dec    %esp
  a4f6e7:	89 ef                	mov    %ebp,%edi
  a4f6e9:	e8 92 e2 ff ff       	call   a4d980 <strncmp>
  a4f6ee:	85 c0                	test   %eax,%eax
  a4f6f0:	0f 84 82 fe ff ff    	je     a4f578 <choose_random_location+0x638>
  a4f6f6:	48                   	dec    %eax
  a4f6f7:	8b 15 13 aa 01 00    	mov    0x1aa13,%edx
  a4f6fd:	80 ba e8 01 00 00 00 	cmpb   $0x0,0x1e8(%edx)
  a4f704:	75 22                	jne    a4f728 <choose_random_location+0x7e8>
  a4f706:	e9 16 ff ff ff       	jmp    a4f621 <choose_random_location+0x6e1>
  a4f70b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a4f710:	83 44 24 0c 01       	addl   $0x1,0xc(%esp)
  a4f715:	0f b6 82 e8 01 00 00 	movzbl 0x1e8(%edx),%eax
  a4f71c:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  a4f720:	39 c1                	cmp    %eax,%ecx
  a4f722:	0f 8d f9 fe ff ff    	jge    a4f621 <choose_random_location+0x6e1>
  a4f728:	48                   	dec    %eax
  a4f729:	63 44 24 0c          	arpl   %ax,0xc(%esp)
  a4f72d:	48                   	dec    %eax
  a4f72e:	8d 04 80             	lea    (%eax,%eax,4),%eax
  a4f731:	48                   	dec    %eax
  a4f732:	8d 04 82             	lea    (%edx,%eax,4),%eax
  a4f735:	83 b8 e0 02 00 00 01 	cmpl   $0x1,0x2e0(%eax)
  a4f73c:	75 d2                	jne    a4f710 <choose_random_location+0x7d0>
  a4f73e:	48                   	dec    %eax
  a4f73f:	8b b0 d8 02 00 00    	mov    0x2d8(%eax),%esi
  a4f745:	48                   	dec    %eax
  a4f746:	8b 4c 24 28          	mov    0x28(%esp),%ecx
  a4f74a:	48                   	dec    %eax
  a4f74b:	89 da                	mov    %ebx,%edx
  a4f74d:	48                   	dec    %eax
  a4f74e:	8b b8 d0 02 00 00    	mov    0x2d0(%eax),%edi
  a4f754:	e8 67 f0 ff ff       	call   a4e7c0 <process_mem_region.isra.0>
  a4f759:	48                   	dec    %eax
  a4f75a:	83 3d 8f ba 01 00 64 	cmpl   $0x64,0x1ba8f
  a4f761:	0f 84 ba fe ff ff    	je     a4f621 <choose_random_location+0x6e1>
  a4f767:	48                   	dec    %eax
  a4f768:	8b 15 a2 a9 01 00    	mov    0x1a9a2,%edx
  a4f76e:	eb a0                	jmp    a4f710 <choose_random_location+0x7d0>
  a4f770:	83 2d 6d c1 01 00 01 	subl   $0x1,0x1c16d
  a4f777:	0f 85 21 fb ff ff    	jne    a4f29e <choose_random_location+0x35e>
  a4f77d:	e9 0e fb ff ff       	jmp    a4f290 <choose_random_location+0x350>
  a4f782:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4f789:	00 00 00 
  a4f78c:	0f 1f 40 00          	nopl   0x0(%eax)

0000000000a4f790 <ident_pmd_init>:
  a4f790:	49                   	dec    %ecx
  a4f791:	89 c9                	mov    %ecx,%ecx
  a4f793:	48                   	dec    %eax
  a4f794:	89 d1                	mov    %edx,%ecx
  a4f796:	49                   	dec    %ecx
  a4f797:	89 f0                	mov    %esi,%eax
  a4f799:	48                   	dec    %eax
  a4f79a:	81 e1 00 00 e0 ff    	and    $0xffe00000,%ecx
  a4f7a0:	4c                   	dec    %esp
  a4f7a1:	39 c9                	cmp    %ecx,%ecx
  a4f7a3:	73 5c                	jae    a4f801 <ident_pmd_init+0x71>
  a4f7a5:	0f 1f 00             	nopl   (%eax)
  a4f7a8:	48                   	dec    %eax
  a4f7a9:	89 ca                	mov    %ecx,%edx
  a4f7ab:	48                   	dec    %eax
  a4f7ac:	8b 05 66 67 00 00    	mov    0x6766,%eax
  a4f7b2:	48                   	dec    %eax
  a4f7b3:	c1 ea 12             	shr    $0x12,%edx
  a4f7b6:	81 e2 f8 0f 00 00    	and    $0xff8,%edx
  a4f7bc:	49                   	dec    %ecx
  a4f7bd:	89 c2                	mov    %eax,%edx
  a4f7bf:	48                   	dec    %eax
  a4f7c0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  a4f7c5:	4c                   	dec    %esp
  a4f7c6:	01 c2                	add    %eax,%edx
  a4f7c8:	49                   	dec    %ecx
  a4f7c9:	81 e2 00 00 e0 ff    	and    $0xffe00000,%edx
  a4f7cf:	48                   	dec    %eax
  a4f7d0:	8b 32                	mov    (%edx),%esi
  a4f7d2:	40                   	inc    %eax
  a4f7d3:	f6 c6 80             	test   $0x80,%dh
  a4f7d6:	49                   	dec    %ecx
  a4f7d7:	0f 45 c2             	cmovne %edx,%eax
  a4f7da:	48                   	dec    %eax
  a4f7db:	f7 d0                	not    %eax
  a4f7dd:	48                   	dec    %eax
  a4f7de:	21 f0                	and    %esi,%eax
  a4f7e0:	a9 81 01 00 00       	test   $0x181,%eax
  a4f7e5:	75 0e                	jne    a4f7f5 <ident_pmd_init+0x65>
  a4f7e7:	48                   	dec    %eax
  a4f7e8:	89 c8                	mov    %ecx,%eax
  a4f7ea:	48                   	dec    %eax
  a4f7eb:	2b 47 18             	sub    0x18(%edi),%eax
  a4f7ee:	48                   	dec    %eax
  a4f7ef:	0b 47 10             	or     0x10(%edi),%eax
  a4f7f2:	48                   	dec    %eax
  a4f7f3:	89 02                	mov    %eax,(%edx)
  a4f7f5:	48                   	dec    %eax
  a4f7f6:	81 c1 00 00 20 00    	add    $0x200000,%ecx
  a4f7fc:	49                   	dec    %ecx
  a4f7fd:	39 c9                	cmp    %ecx,%ecx
  a4f7ff:	77 a7                	ja     a4f7a8 <ident_pmd_init+0x18>
  a4f801:	c3                   	ret    
  a4f802:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a4f809:	00 00 00 00 
  a4f80d:	0f 1f 00             	nopl   (%eax)

0000000000a4f810 <alloc_pgt_page>:
  a4f810:	f3 0f 1e fa          	endbr64 
  a4f814:	48                   	dec    %eax
  a4f815:	8b 47 10             	mov    0x10(%edi),%eax
  a4f818:	48                   	dec    %eax
  a4f819:	3b 47 08             	cmp    0x8(%edi),%eax
  a4f81c:	73 1a                	jae    a4f838 <alloc_pgt_page+0x28>
  a4f81e:	4c                   	dec    %esp
  a4f81f:	8b 07                	mov    (%edi),%eax
  a4f821:	49                   	dec    %ecx
  a4f822:	01 c0                	add    %eax,%eax
  a4f824:	48                   	dec    %eax
  a4f825:	05 00 10 00 00       	add    $0x1000,%eax
  a4f82a:	48                   	dec    %eax
  a4f82b:	89 47 10             	mov    %eax,0x10(%edi)
  a4f82e:	4c                   	dec    %esp
  a4f82f:	89 c0                	mov    %eax,%eax
  a4f831:	c3                   	ret    
  a4f832:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a4f838:	45                   	inc    %ebp
  a4f839:	31 c0                	xor    %eax,%eax
  a4f83b:	4c                   	dec    %esp
  a4f83c:	89 c0                	mov    %eax,%eax
  a4f83e:	c3                   	ret    
  a4f83f:	90                   	nop

0000000000a4f840 <ident_pud_init.isra.0>:
  a4f840:	48                   	dec    %eax
  a4f841:	39 d1                	cmp    %edx,%ecx
  a4f843:	0f 86 1d 01 00 00    	jbe    a4f966 <ident_pud_init.isra.0+0x126>
  a4f849:	41                   	inc    %ecx
  a4f84a:	57                   	push   %edi
  a4f84b:	41                   	inc    %ecx
  a4f84c:	56                   	push   %esi
  a4f84d:	49                   	dec    %ecx
  a4f84e:	89 ce                	mov    %ecx,%esi
  a4f850:	41                   	inc    %ecx
  a4f851:	55                   	push   %ebp
  a4f852:	49                   	dec    %ecx
  a4f853:	89 fd                	mov    %edi,%ebp
  a4f855:	41                   	inc    %ecx
  a4f856:	54                   	push   %esp
  a4f857:	49                   	dec    %ecx
  a4f858:	89 d4                	mov    %edx,%esp
  a4f85a:	55                   	push   %ebp
  a4f85b:	53                   	push   %ebx
  a4f85c:	48                   	dec    %eax
  a4f85d:	89 f3                	mov    %esi,%ebx
  a4f85f:	48                   	dec    %eax
  a4f860:	83 ec 08             	sub    $0x8,%esp
  a4f863:	eb 3b                	jmp    a4f8a0 <ident_pud_init.isra.0+0x60>
  a4f865:	0f 1f 00             	nopl   (%eax)
  a4f868:	48                   	dec    %eax
  a4f869:	89 f7                	mov    %esi,%edi
  a4f86b:	48                   	dec    %eax
  a4f86c:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  a4f872:	48                   	dec    %eax
  a4f873:	81 e7 00 00 00 c0    	and    $0xc0000000,%edi
  a4f879:	48                   	dec    %eax
  a4f87a:	85 c9                	test   %ecx,%ecx
  a4f87c:	48                   	dec    %eax
  a4f87d:	0f 45 f7             	cmovne %edi,%esi
  a4f880:	48                   	dec    %eax
  a4f881:	f7 d6                	not    %esi
  a4f883:	48                   	dec    %eax
  a4f884:	21 d6                	and    %edx,%esi
  a4f886:	83 e6 01             	and    $0x1,%esi
  a4f889:	75 0c                	jne    a4f897 <ident_pud_init.isra.0+0x57>
  a4f88b:	49                   	dec    %ecx
  a4f88c:	2b 45 18             	sub    0x18(%ebp),%eax
  a4f88f:	49                   	dec    %ecx
  a4f890:	0b 45 10             	or     0x10(%ebp),%eax
  a4f893:	48                   	dec    %eax
  a4f894:	89 45 00             	mov    %eax,0x0(%ebp)
  a4f897:	4d                   	dec    %ebp
  a4f898:	39 e6                	cmp    %esp,%esi
  a4f89a:	0f 86 9e 00 00 00    	jbe    a4f93e <ident_pud_init.isra.0+0xfe>
  a4f8a0:	4c                   	dec    %esp
  a4f8a1:	89 e5                	mov    %esp,%ebp
  a4f8a3:	4c                   	dec    %esp
  a4f8a4:	89 e0                	mov    %esp,%eax
  a4f8a6:	4d                   	dec    %ebp
  a4f8a7:	89 e7                	mov    %esp,%edi
  a4f8a9:	48                   	dec    %eax
  a4f8aa:	8b 35 68 66 00 00    	mov    0x6668,%esi
  a4f8b0:	48                   	dec    %eax
  a4f8b1:	c1 ed 1b             	shr    $0x1b,%ebp
  a4f8b4:	48                   	dec    %eax
  a4f8b5:	25 00 00 00 c0       	and    $0xc0000000,%eax
  a4f8ba:	81 e5 f8 0f 00 00    	and    $0xff8,%ebp
  a4f8c0:	48                   	dec    %eax
  a4f8c1:	8d 90 00 00 00 40    	lea    0x40000000(%eax),%edx
  a4f8c7:	48                   	dec    %eax
  a4f8c8:	01 dd                	add    %ebx,%ebp
  a4f8ca:	4c                   	dec    %esp
  a4f8cb:	39 f2                	cmp    %esi,%edx
  a4f8cd:	49                   	dec    %ecx
  a4f8ce:	0f 47 d6             	cmova  %esi,%edx
  a4f8d1:	49                   	dec    %ecx
  a4f8d2:	89 d4                	mov    %edx,%esp
  a4f8d4:	48                   	dec    %eax
  a4f8d5:	8b 55 00             	mov    0x0(%ebp),%edx
  a4f8d8:	48                   	dec    %eax
  a4f8d9:	89 d1                	mov    %edx,%ecx
  a4f8db:	81 e1 80 00 00 00    	and    $0x80,%ecx
  a4f8e1:	41                   	inc    %ecx
  a4f8e2:	80 7d 20 00          	cmpb   $0x0,0x20(%ebp)
  a4f8e6:	75 80                	jne    a4f868 <ident_pud_init.isra.0+0x28>
  a4f8e8:	48                   	dec    %eax
  a4f8e9:	89 f0                	mov    %esi,%eax
  a4f8eb:	48                   	dec    %eax
  a4f8ec:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  a4f8f2:	48                   	dec    %eax
  a4f8f3:	25 00 00 00 c0       	and    $0xc0000000,%eax
  a4f8f8:	48                   	dec    %eax
  a4f8f9:	85 c9                	test   %ecx,%ecx
  a4f8fb:	48                   	dec    %eax
  a4f8fc:	0f 45 f0             	cmovne %eax,%esi
  a4f8ff:	48                   	dec    %eax
  a4f900:	89 f0                	mov    %esi,%eax
  a4f902:	48                   	dec    %eax
  a4f903:	f7 d0                	not    %eax
  a4f905:	48                   	dec    %eax
  a4f906:	21 d0                	and    %edx,%eax
  a4f908:	a8 01                	test   $0x1,%al
  a4f90a:	75 44                	jne    a4f950 <ident_pud_init.isra.0+0x110>
  a4f90c:	49                   	dec    %ecx
  a4f90d:	8b 7d 08             	mov    0x8(%ebp),%edi
  a4f910:	41                   	inc    %ecx
  a4f911:	ff 55 00             	call   *0x0(%ebp)
  a4f914:	49                   	dec    %ecx
  a4f915:	89 c3                	mov    %eax,%ebx
  a4f917:	48                   	dec    %eax
  a4f918:	85 c0                	test   %eax,%eax
  a4f91a:	74 22                	je     a4f93e <ident_pud_init.isra.0+0xfe>
  a4f91c:	4c                   	dec    %esp
  a4f91d:	89 e1                	mov    %esp,%ecx
  a4f91f:	4c                   	dec    %esp
  a4f920:	89 fa                	mov    %edi,%edx
  a4f922:	48                   	dec    %eax
  a4f923:	89 c6                	mov    %eax,%esi
  a4f925:	4c                   	dec    %esp
  a4f926:	89 ef                	mov    %ebp,%edi
  a4f928:	e8 63 fe ff ff       	call   a4f790 <ident_pmd_init>
  a4f92d:	4d                   	dec    %ebp
  a4f92e:	0b 5d 28             	or     0x28(%ebp),%ebx
  a4f931:	4c                   	dec    %esp
  a4f932:	89 5d 00             	mov    %ebx,0x0(%ebp)
  a4f935:	4d                   	dec    %ebp
  a4f936:	39 e6                	cmp    %esp,%esi
  a4f938:	0f 87 62 ff ff ff    	ja     a4f8a0 <ident_pud_init.isra.0+0x60>
  a4f93e:	48                   	dec    %eax
  a4f93f:	83 c4 08             	add    $0x8,%esp
  a4f942:	5b                   	pop    %ebx
  a4f943:	5d                   	pop    %ebp
  a4f944:	41                   	inc    %ecx
  a4f945:	5c                   	pop    %esp
  a4f946:	41                   	inc    %ecx
  a4f947:	5d                   	pop    %ebp
  a4f948:	41                   	inc    %ecx
  a4f949:	5e                   	pop    %esi
  a4f94a:	41                   	inc    %ecx
  a4f94b:	5f                   	pop    %edi
  a4f94c:	c3                   	ret    
  a4f94d:	0f 1f 00             	nopl   (%eax)
  a4f950:	48                   	dec    %eax
  a4f951:	21 d6                	and    %edx,%esi
  a4f953:	4c                   	dec    %esp
  a4f954:	89 e1                	mov    %esp,%ecx
  a4f956:	4c                   	dec    %esp
  a4f957:	89 fa                	mov    %edi,%edx
  a4f959:	4c                   	dec    %esp
  a4f95a:	89 ef                	mov    %ebp,%edi
  a4f95c:	e8 2f fe ff ff       	call   a4f790 <ident_pmd_init>
  a4f961:	e9 31 ff ff ff       	jmp    a4f897 <ident_pud_init.isra.0+0x57>
  a4f966:	c3                   	ret    
  a4f967:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4f96e:	00 00 

0000000000a4f970 <ident_p4d_init>:
  a4f970:	48                   	dec    %eax
  a4f971:	39 ca                	cmp    %ecx,%edx
  a4f973:	0f 83 eb 00 00 00    	jae    a4fa64 <ident_p4d_init+0xf4>
  a4f979:	41                   	inc    %ecx
  a4f97a:	57                   	push   %edi
  a4f97b:	49                   	dec    %ecx
  a4f97c:	89 ff                	mov    %edi,%edi
  a4f97e:	41                   	inc    %ecx
  a4f97f:	56                   	push   %esi
  a4f980:	41                   	inc    %ecx
  a4f981:	55                   	push   %ebp
  a4f982:	49                   	dec    %ecx
  a4f983:	89 f5                	mov    %esi,%ebp
  a4f985:	41                   	inc    %ecx
  a4f986:	54                   	push   %esp
  a4f987:	55                   	push   %ebp
  a4f988:	48                   	dec    %eax
  a4f989:	89 cd                	mov    %ecx,%ebp
  a4f98b:	53                   	push   %ebx
  a4f98c:	48                   	dec    %eax
  a4f98d:	89 d3                	mov    %edx,%ebx
  a4f98f:	48                   	dec    %eax
  a4f990:	83 ec 18             	sub    $0x18,%esp
  a4f993:	eb 3b                	jmp    a4f9d0 <ident_p4d_init+0x60>
  a4f995:	0f 1f 00             	nopl   (%eax)
  a4f998:	49                   	dec    %ecx
  a4f999:	8b 7f 08             	mov    0x8(%edi),%edi
  a4f99c:	41                   	inc    %ecx
  a4f99d:	ff 17                	call   *(%edi)
  a4f99f:	48                   	dec    %eax
  a4f9a0:	85 c0                	test   %eax,%eax
  a4f9a2:	0f 84 a8 00 00 00    	je     a4fa50 <ident_p4d_init+0xe0>
  a4f9a8:	48                   	dec    %eax
  a4f9a9:	89 c6                	mov    %eax,%esi
  a4f9ab:	48                   	dec    %eax
  a4f9ac:	89 d9                	mov    %ebx,%ecx
  a4f9ae:	4c                   	dec    %esp
  a4f9af:	89 f2                	mov    %esi,%edx
  a4f9b1:	4c                   	dec    %esp
  a4f9b2:	89 ff                	mov    %edi,%edi
  a4f9b4:	48                   	dec    %eax
  a4f9b5:	89 44 24 08          	mov    %eax,0x8(%esp)
  a4f9b9:	e8 82 fe ff ff       	call   a4f840 <ident_pud_init.isra.0>
  a4f9be:	48                   	dec    %eax
  a4f9bf:	8b 44 24 08          	mov    0x8(%esp),%eax
  a4f9c3:	49                   	dec    %ecx
  a4f9c4:	0b 47 28             	or     0x28(%edi),%eax
  a4f9c7:	49                   	dec    %ecx
  a4f9c8:	89 04 24             	mov    %eax,(%esp)
  a4f9cb:	48                   	dec    %eax
  a4f9cc:	39 dd                	cmp    %ebx,%ebp
  a4f9ce:	76 6f                	jbe    a4fa3f <ident_p4d_init+0xcf>
  a4f9d0:	8b 05 ca 65 00 00    	mov    0x65ca,%eax
  a4f9d6:	48                   	dec    %eax
  a4f9d7:	89 da                	mov    %ebx,%edx
  a4f9d9:	49                   	dec    %ecx
  a4f9da:	89 de                	mov    %ebx,%esi
  a4f9dc:	48                   	dec    %eax
  a4f9dd:	b9 00 00 00 00       	mov    $0x0,%ecx
  a4f9e2:	80 00 00             	addb   $0x0,(%eax)
  a4f9e5:	00 48 c1             	add    %cl,-0x3f(%eax)
  a4f9e8:	ea 27 48 8b 35 27 65 	ljmp   $0x6527,$0x358b4827
  a4f9ef:	00 00                	add    %al,(%eax)
  a4f9f1:	83 e8 01             	sub    $0x1,%eax
  a4f9f4:	48                   	dec    %eax
  a4f9f5:	21 d0                	and    %edx,%eax
  a4f9f7:	4d                   	dec    %ebp
  a4f9f8:	8d 64 c5 00          	lea    0x0(%ebp,%eax,8),%esp
  a4f9fc:	48                   	dec    %eax
  a4f9fd:	b8 00 00 00 00       	mov    $0x0,%eax
  a4fa02:	80 ff ff             	cmp    $0xff,%bh
  a4fa05:	ff 48 21             	decl   0x21(%eax)
  a4fa08:	d8 48 01             	fmuls  0x1(%eax)
  a4fa0b:	c8 48 39 c5          	enter  $0x3948,$0xc5
  a4fa0f:	48                   	dec    %eax
  a4fa10:	0f 46 c5             	cmovbe %ebp,%eax
  a4fa13:	48                   	dec    %eax
  a4fa14:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  a4fa1a:	48                   	dec    %eax
  a4fa1b:	89 c3                	mov    %eax,%ebx
  a4fa1d:	49                   	dec    %ecx
  a4fa1e:	8b 04 24             	mov    (%esp),%eax
  a4fa21:	a8 01                	test   $0x1,%al
  a4fa23:	0f 84 6f ff ff ff    	je     a4f998 <ident_p4d_init+0x28>
  a4fa29:	48                   	dec    %eax
  a4fa2a:	21 c6                	and    %eax,%esi
  a4fa2c:	48                   	dec    %eax
  a4fa2d:	89 d9                	mov    %ebx,%ecx
  a4fa2f:	4c                   	dec    %esp
  a4fa30:	89 f2                	mov    %esi,%edx
  a4fa32:	4c                   	dec    %esp
  a4fa33:	89 ff                	mov    %edi,%edi
  a4fa35:	e8 06 fe ff ff       	call   a4f840 <ident_pud_init.isra.0>
  a4fa3a:	48                   	dec    %eax
  a4fa3b:	39 dd                	cmp    %ebx,%ebp
  a4fa3d:	77 91                	ja     a4f9d0 <ident_p4d_init+0x60>
  a4fa3f:	48                   	dec    %eax
  a4fa40:	83 c4 18             	add    $0x18,%esp
  a4fa43:	31 c0                	xor    %eax,%eax
  a4fa45:	5b                   	pop    %ebx
  a4fa46:	5d                   	pop    %ebp
  a4fa47:	41                   	inc    %ecx
  a4fa48:	5c                   	pop    %esp
  a4fa49:	41                   	inc    %ecx
  a4fa4a:	5d                   	pop    %ebp
  a4fa4b:	41                   	inc    %ecx
  a4fa4c:	5e                   	pop    %esi
  a4fa4d:	41                   	inc    %ecx
  a4fa4e:	5f                   	pop    %edi
  a4fa4f:	c3                   	ret    
  a4fa50:	48                   	dec    %eax
  a4fa51:	83 c4 18             	add    $0x18,%esp
  a4fa54:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  a4fa59:	5b                   	pop    %ebx
  a4fa5a:	5d                   	pop    %ebp
  a4fa5b:	41                   	inc    %ecx
  a4fa5c:	5c                   	pop    %esp
  a4fa5d:	41                   	inc    %ecx
  a4fa5e:	5d                   	pop    %ebp
  a4fa5f:	41                   	inc    %ecx
  a4fa60:	5e                   	pop    %esi
  a4fa61:	41                   	inc    %ecx
  a4fa62:	5f                   	pop    %edi
  a4fa63:	c3                   	ret    
  a4fa64:	31 c0                	xor    %eax,%eax
  a4fa66:	c3                   	ret    
  a4fa67:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4fa6e:	00 00 

0000000000a4fa70 <kernel_ident_mapping_init>:
  a4fa70:	f3 0f 1e fa          	endbr64 
  a4fa74:	41                   	inc    %ecx
  a4fa75:	57                   	push   %edi
  a4fa76:	41                   	inc    %ecx
  a4fa77:	56                   	push   %esi
  a4fa78:	49                   	dec    %ecx
  a4fa79:	89 fe                	mov    %edi,%esi
  a4fa7b:	41                   	inc    %ecx
  a4fa7c:	55                   	push   %ebp
  a4fa7d:	41                   	inc    %ecx
  a4fa7e:	54                   	push   %esp
  a4fa7f:	55                   	push   %ebp
  a4fa80:	48                   	dec    %eax
  a4fa81:	89 f5                	mov    %esi,%ebp
  a4fa83:	53                   	push   %ebx
  a4fa84:	48                   	dec    %eax
  a4fa85:	83 ec 18             	sub    $0x18,%esp
  a4fa88:	48                   	dec    %eax
  a4fa89:	8b 5f 18             	mov    0x18(%edi),%ebx
  a4fa8c:	48                   	dec    %eax
  a4fa8d:	8b 47 28             	mov    0x28(%edi),%eax
  a4fa90:	48                   	dec    %eax
  a4fa91:	03 4f 18             	add    0x18(%edi),%ecx
  a4fa94:	48                   	dec    %eax
  a4fa95:	01 d3                	add    %edx,%ebx
  a4fa97:	49                   	dec    %ecx
  a4fa98:	89 cd                	mov    %ecx,%ebp
  a4fa9a:	48                   	dec    %eax
  a4fa9b:	85 c0                	test   %eax,%eax
  a4fa9d:	75 0b                	jne    a4faaa <kernel_ident_mapping_init+0x3a>
  a4fa9f:	48                   	dec    %eax
  a4faa0:	8b 05 7a 64 00 00    	mov    0x647a,%eax
  a4faa6:	48                   	dec    %eax
  a4faa7:	83 c8 63             	or     $0x63,%eax
  a4faaa:	48                   	dec    %eax
  a4faab:	23 05 e7 64 00 00    	and    0x64e7,%eax
  a4fab1:	41                   	inc    %ecx
  a4fab2:	bc 01 00 00 00       	mov    $0x1,%esp
  a4fab7:	49                   	dec    %ecx
  a4fab8:	89 46 28             	mov    %eax,0x28(%esi)
  a4fabb:	4c                   	dec    %esp
  a4fabc:	39 eb                	cmp    %ebp,%ebx
  a4fabe:	0f 83 a1 00 00 00    	jae    a4fb65 <kernel_ident_mapping_init+0xf5>
  a4fac4:	8b 0d da 64 00 00    	mov    0x64da,%ecx
  a4faca:	48                   	dec    %eax
  a4facb:	89 d8                	mov    %ebx,%eax
  a4facd:	4c                   	dec    %esp
  a4face:	89 e2                	mov    %esp,%edx
  a4fad0:	48                   	dec    %eax
  a4fad1:	d3 e8                	shr    %cl,%eax
  a4fad3:	48                   	dec    %eax
  a4fad4:	d3 e2                	shl    %cl,%edx
  a4fad6:	8b 0d 04 b7 01 00    	mov    0x1b704,%ecx
  a4fadc:	25 ff 01 00 00       	and    $0x1ff,%eax
  a4fae1:	4c                   	dec    %esp
  a4fae2:	8d 7c c5 00          	lea    0x0(%ebp,%eax,8),%edi
  a4fae6:	48                   	dec    %eax
  a4fae7:	89 d0                	mov    %edx,%eax
  a4fae9:	48                   	dec    %eax
  a4faea:	f7 d8                	neg    %eax
  a4faec:	48                   	dec    %eax
  a4faed:	21 d8                	and    %ebx,%eax
  a4faef:	48                   	dec    %eax
  a4faf0:	01 d0                	add    %edx,%eax
  a4faf2:	48                   	dec    %eax
  a4faf3:	89 da                	mov    %ebx,%edx
  a4faf5:	49                   	dec    %ecx
  a4faf6:	39 c5                	cmp    %eax,%ebp
  a4faf8:	49                   	dec    %ecx
  a4faf9:	0f 46 c5             	cmovbe %ebp,%eax
  a4fafc:	48                   	dec    %eax
  a4fafd:	89 c3                	mov    %eax,%ebx
  a4faff:	85 c9                	test   %ecx,%ecx
  a4fb01:	74 79                	je     a4fb7c <kernel_ident_mapping_init+0x10c>
  a4fb03:	49                   	dec    %ecx
  a4fb04:	8b 0f                	mov    (%edi),%ecx
  a4fb06:	48                   	dec    %eax
  a4fb07:	8b 05 0b 64 00 00    	mov    0x640b,%eax
  a4fb0d:	f6 c1 01             	test   $0x1,%cl
  a4fb10:	75 5e                	jne    a4fb70 <kernel_ident_mapping_init+0x100>
  a4fb12:	48                   	dec    %eax
  a4fb13:	89 54 24 08          	mov    %edx,0x8(%esp)
  a4fb17:	49                   	dec    %ecx
  a4fb18:	8b 7e 08             	mov    0x8(%esi),%edi
  a4fb1b:	41                   	inc    %ecx
  a4fb1c:	ff 16                	call   *(%esi)
  a4fb1e:	48                   	dec    %eax
  a4fb1f:	89 c6                	mov    %eax,%esi
  a4fb21:	48                   	dec    %eax
  a4fb22:	85 c0                	test   %eax,%eax
  a4fb24:	0f 84 89 00 00 00    	je     a4fbb3 <kernel_ident_mapping_init+0x143>
  a4fb2a:	48                   	dec    %eax
  a4fb2b:	8b 54 24 08          	mov    0x8(%esp),%edx
  a4fb2f:	48                   	dec    %eax
  a4fb30:	89 d9                	mov    %ebx,%ecx
  a4fb32:	4c                   	dec    %esp
  a4fb33:	89 f7                	mov    %esi,%edi
  a4fb35:	48                   	dec    %eax
  a4fb36:	89 44 24 08          	mov    %eax,0x8(%esp)
  a4fb3a:	e8 31 fe ff ff       	call   a4f970 <ident_p4d_init>
  a4fb3f:	85 c0                	test   %eax,%eax
  a4fb41:	75 4b                	jne    a4fb8e <kernel_ident_mapping_init+0x11e>
  a4fb43:	8b 15 97 b6 01 00    	mov    0x1b697,%edx
  a4fb49:	49                   	dec    %ecx
  a4fb4a:	8b 46 28             	mov    0x28(%esi),%eax
  a4fb4d:	48                   	dec    %eax
  a4fb4e:	8b 74 24 08          	mov    0x8(%esp),%esi
  a4fb52:	85 d2                	test   %edx,%edx
  a4fb54:	74 4a                	je     a4fba0 <kernel_ident_mapping_init+0x130>
  a4fb56:	48                   	dec    %eax
  a4fb57:	09 c6                	or     %eax,%esi
  a4fb59:	49                   	dec    %ecx
  a4fb5a:	89 37                	mov    %esi,(%edi)
  a4fb5c:	49                   	dec    %ecx
  a4fb5d:	39 dd                	cmp    %ebx,%ebp
  a4fb5f:	0f 87 5f ff ff ff    	ja     a4fac4 <kernel_ident_mapping_init+0x54>
  a4fb65:	31 c0                	xor    %eax,%eax
  a4fb67:	eb 25                	jmp    a4fb8e <kernel_ident_mapping_init+0x11e>
  a4fb69:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4fb70:	48                   	dec    %eax
  a4fb71:	21 c8                	and    %ecx,%eax
  a4fb73:	48                   	dec    %eax
  a4fb74:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  a4fb79:	49                   	dec    %ecx
  a4fb7a:	89 c7                	mov    %eax,%edi
  a4fb7c:	48                   	dec    %eax
  a4fb7d:	89 d9                	mov    %ebx,%ecx
  a4fb7f:	4c                   	dec    %esp
  a4fb80:	89 fe                	mov    %edi,%esi
  a4fb82:	4c                   	dec    %esp
  a4fb83:	89 f7                	mov    %esi,%edi
  a4fb85:	e8 e6 fd ff ff       	call   a4f970 <ident_p4d_init>
  a4fb8a:	85 c0                	test   %eax,%eax
  a4fb8c:	74 ce                	je     a4fb5c <kernel_ident_mapping_init+0xec>
  a4fb8e:	48                   	dec    %eax
  a4fb8f:	83 c4 18             	add    $0x18,%esp
  a4fb92:	5b                   	pop    %ebx
  a4fb93:	5d                   	pop    %ebp
  a4fb94:	41                   	inc    %ecx
  a4fb95:	5c                   	pop    %esp
  a4fb96:	41                   	inc    %ecx
  a4fb97:	5d                   	pop    %ebp
  a4fb98:	41                   	inc    %ecx
  a4fb99:	5e                   	pop    %esi
  a4fb9a:	41                   	inc    %ecx
  a4fb9b:	5f                   	pop    %edi
  a4fb9c:	c3                   	ret    
  a4fb9d:	0f 1f 00             	nopl   (%eax)
  a4fba0:	48                   	dec    %eax
  a4fba1:	8b 36                	mov    (%esi),%esi
  a4fba3:	48                   	dec    %eax
  a4fba4:	23 35 6e 63 00 00    	and    0x636e,%esi
  a4fbaa:	48                   	dec    %eax
  a4fbab:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  a4fbb1:	eb a3                	jmp    a4fb56 <kernel_ident_mapping_init+0xe6>
  a4fbb3:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  a4fbb8:	eb d4                	jmp    a4fb8e <kernel_ident_mapping_init+0x11e>
  a4fbba:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

0000000000a4fbc0 <initialize_identity_maps>:
  a4fbc0:	f3 0f 1e fa          	endbr64 
  a4fbc4:	48                   	dec    %eax
  a4fbc5:	83 ec 08             	sub    $0x8,%esp
  a4fbc8:	e8 d3 01 00 00       	call   a4fda0 <set_sev_encryption_mask>
  a4fbcd:	48                   	dec    %eax
  a4fbce:	8b 15 4c 63 00 00    	mov    0x634c,%edx
  a4fbd4:	48                   	dec    %eax
  a4fbd5:	8d 35 35 fc ff ff    	lea    0xfffffc35,%esi
  a4fbdb:	48                   	dec    %eax
  a4fbdc:	8d 3d 5e bd 01 00    	lea    0x1bd5e,%edi
  a4fbe2:	48                   	dec    %eax
  a4fbe3:	89 35 17 bd 01 00    	mov    %esi,0x1bd17
  a4fbe9:	48                   	dec    %eax
  a4fbea:	89 d1                	mov    %edx,%ecx
  a4fbec:	48                   	dec    %eax
  a4fbed:	89 d0                	mov    %edx,%eax
  a4fbef:	48                   	dec    %eax
  a4fbf0:	83 ca 63             	or     $0x63,%edx
  a4fbf3:	48                   	dec    %eax
  a4fbf4:	89 3d 0e bd 01 00    	mov    %edi,0x1bd0e
  a4fbfa:	48                   	dec    %eax
  a4fbfb:	81 c9 e3 01 00 00    	or     $0x1e3,%ecx
  a4fc01:	48                   	dec    %eax
  a4fc02:	f7 d0                	not    %eax
  a4fc04:	48                   	dec    %eax
  a4fc05:	89 15 1d bd 01 00    	mov    %edx,0x1bd1d
  a4fc0b:	48                   	dec    %eax
  a4fc0c:	21 05 06 63 00 00    	and    %eax,0x6306
  a4fc12:	48                   	dec    %eax
  a4fc13:	89 0d f7 bc 01 00    	mov    %ecx,0x1bcf7
  a4fc19:	48                   	dec    %eax
  a4fc1a:	c7 05 2c bd 01 00 00 	movl   $0x0,0x1bd2c
  a4fc21:	00 00 00 
  a4fc24:	0f 20 da             	mov    %cr3,%edx
  a4fc27:	48                   	dec    %eax
  a4fc28:	21 d0                	and    %edx,%eax
  a4fc2a:	48                   	dec    %eax
  a4fc2b:	ba 00 f0 ff ff       	mov    $0xfffff000,%edx
  a4fc30:	ff                   	(bad)  
  a4fc31:	ff                   	(bad)  
  a4fc32:	ff                   	(bad)  
  a4fc33:	7f 48                	jg     a4fc7d <initialize_identity_maps+0xbd>
  a4fc35:	21 d0                	and    %edx,%eax
  a4fc37:	8b 15 a3 b5 01 00    	mov    0x1b5a3,%edx
  a4fc3d:	48                   	dec    %eax
  a4fc3e:	89 05 ec bc 01 00    	mov    %eax,0x1bcec
  a4fc44:	85 d2                	test   %edx,%edx
  a4fc46:	74 10                	je     a4fc58 <initialize_identity_maps+0x98>
  a4fc48:	48                   	dec    %eax
  a4fc49:	8b 00                	mov    (%eax),%eax
  a4fc4b:	48                   	dec    %eax
  a4fc4c:	23 05 c6 62 00 00    	and    0x62c6,%eax
  a4fc52:	48                   	dec    %eax
  a4fc53:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  a4fc58:	48                   	dec    %eax
  a4fc59:	8d 0d a1 e3 01 00    	lea    0x1e3a1,%ecx
  a4fc5f:	48                   	dec    %eax
  a4fc60:	39 c8                	cmp    %ecx,%eax
  a4fc62:	74 54                	je     a4fcb8 <initialize_identity_maps+0xf8>
  a4fc64:	48                   	dec    %eax
  a4fc65:	89 cf                	mov    %ecx,%edi
  a4fc67:	ba 00 10 01 00       	mov    $0x11000,%edx
  a4fc6c:	31 f6                	xor    %esi,%esi
  a4fc6e:	48                   	dec    %eax
  a4fc6f:	89 0d cb bc 01 00    	mov    %ecx,0x1bccb
  a4fc75:	48                   	dec    %eax
  a4fc76:	c7 05 c8 bc 01 00 00 	movl   $0x11000,0x1bcc8
  a4fc7d:	10 01 00 
  a4fc80:	e8 ab df ff ff       	call   a4dc30 <memset>
  a4fc85:	48                   	dec    %eax
  a4fc86:	89 c1                	mov    %eax,%ecx
  a4fc88:	48                   	dec    %eax
  a4fc89:	8b 05 c1 bc 01 00    	mov    0x1bcc1,%eax
  a4fc8f:	48                   	dec    %eax
  a4fc90:	3d ff 0f 01 00       	cmp    $0x10fff,%eax
  a4fc95:	77 51                	ja     a4fce8 <initialize_identity_maps+0x128>
  a4fc97:	48                   	dec    %eax
  a4fc98:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  a4fc9e:	48                   	dec    %eax
  a4fc9f:	01 c8                	add    %ecx,%eax
  a4fca1:	48                   	dec    %eax
  a4fca2:	89 15 a8 bc 01 00    	mov    %edx,0x1bca8
  a4fca8:	48                   	dec    %eax
  a4fca9:	89 05 81 bc 01 00    	mov    %eax,0x1bc81
  a4fcaf:	48                   	dec    %eax
  a4fcb0:	83 c4 08             	add    $0x8,%esp
  a4fcb3:	c3                   	ret    
  a4fcb4:	0f 1f 40 00          	nopl   0x0(%eax)
  a4fcb8:	48                   	dec    %eax
  a4fcb9:	8d b9 00 60 00 00    	lea    0x6000(%ecx),%edi
  a4fcbf:	ba 00 b0 00 00       	mov    $0xb000,%edx
  a4fcc4:	31 f6                	xor    %esi,%esi
  a4fcc6:	48                   	dec    %eax
  a4fcc7:	c7 05 77 bc 01 00 00 	movl   $0xb000,0x1bc77
  a4fcce:	b0 00 00 
  a4fcd1:	48                   	dec    %eax
  a4fcd2:	89 3d 68 bc 01 00    	mov    %edi,0x1bc68
  a4fcd8:	48                   	dec    %eax
  a4fcd9:	83 c4 08             	add    $0x8,%esp
  a4fcdc:	e9 4f df ff ff       	jmp    a4dc30 <memset>
  a4fce1:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4fce8:	31 c0                	xor    %eax,%eax
  a4fcea:	48                   	dec    %eax
  a4fceb:	89 05 3f bc 01 00    	mov    %eax,0x1bc3f
  a4fcf1:	48                   	dec    %eax
  a4fcf2:	83 c4 08             	add    $0x8,%esp
  a4fcf5:	c3                   	ret    
  a4fcf6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a4fcfd:	00 00 00 

0000000000a4fd00 <add_identity_map>:
  a4fd00:	f3 0f 1e fa          	endbr64 
  a4fd04:	48                   	dec    %eax
  a4fd05:	8d 4c 37 ff          	lea    -0x1(%edi,%esi,1),%ecx
  a4fd09:	48                   	dec    %eax
  a4fd0a:	89 fa                	mov    %edi,%edx
  a4fd0c:	48                   	dec    %eax
  a4fd0d:	81 c9 ff ff 1f 00    	or     $0x1fffff,%ecx
  a4fd13:	48                   	dec    %eax
  a4fd14:	81 e2 00 00 e0 ff    	and    $0xffe00000,%edx
  a4fd1a:	48                   	dec    %eax
  a4fd1b:	83 c1 01             	add    $0x1,%ecx
  a4fd1e:	48                   	dec    %eax
  a4fd1f:	39 ca                	cmp    %ecx,%edx
  a4fd21:	72 05                	jb     a4fd28 <add_identity_map+0x28>
  a4fd23:	c3                   	ret    
  a4fd24:	0f 1f 40 00          	nopl   0x0(%eax)
  a4fd28:	48                   	dec    %eax
  a4fd29:	8b 35 01 bc 01 00    	mov    0x1bc01,%esi
  a4fd2f:	48                   	dec    %eax
  a4fd30:	8d 3d ca bb 01 00    	lea    0x1bbca,%edi
  a4fd36:	e9 35 fd ff ff       	jmp    a4fa70 <kernel_ident_mapping_init>
  a4fd3b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)

0000000000a4fd40 <finalize_identity_maps>:
  a4fd40:	f3 0f 1e fa          	endbr64 
  a4fd44:	48                   	dec    %eax
  a4fd45:	8b 05 e5 bb 01 00    	mov    0x1bbe5,%eax
  a4fd4b:	0f 22 d8             	mov    %eax,%cr3
  a4fd4e:	c3                   	ret    
  a4fd4f:	90                   	nop

0000000000a4fd50 <get_sev_encryption_bit>:
  a4fd50:	31 c0                	xor    %eax,%eax
  a4fd52:	53                   	push   %ebx
  a4fd53:	51                   	push   %ecx
  a4fd54:	52                   	push   %edx
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
  a4fd93:	5a                   	pop    %edx
  a4fd94:	59                   	pop    %ecx
  a4fd95:	5b                   	pop    %ebx
  a4fd96:	c3                   	ret    
  a4fd97:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a4fd9e:	00 00 

0000000000a4fda0 <set_sev_encryption_mask>:
  a4fda0:	55                   	push   %ebp
  a4fda1:	52                   	push   %edx
  a4fda2:	48                   	dec    %eax
  a4fda3:	89 e5                	mov    %esp,%ebp
  a4fda5:	e8 a6 ff ff ff       	call   a4fd50 <get_sev_encryption_bit>
  a4fdaa:	85 c0                	test   %eax,%eax
  a4fdac:	74 08                	je     a4fdb6 <set_sev_encryption_mask+0x16>
  a4fdae:	48                   	dec    %eax
  a4fdaf:	0f ab 05 6a 61 00 00 	bts    %eax,0x616a
  a4fdb6:	48                   	dec    %eax
  a4fdb7:	89 ec                	mov    %ebp,%esp
  a4fdb9:	5a                   	pop    %edx
  a4fdba:	5d                   	pop    %ebp
  a4fdbb:	48                   	dec    %eax
  a4fdbc:	31 c0                	xor    %eax,%eax
  a4fdbe:	c3                   	ret    
  a4fdbf:	90                   	nop

0000000000a4fdc0 <paging_prepare>:
  a4fdc0:	f3 0f 1e fa          	endbr64 
  a4fdc4:	41                   	inc    %ecx
  a4fdc5:	54                   	push   %esp
  a4fdc6:	55                   	push   %ebp
  a4fdc7:	53                   	push   %ebx
  a4fdc8:	48                   	dec    %eax
  a4fdc9:	89 3d 41 a3 01 00    	mov    %edi,0x1a341
  a4fdcf:	48                   	dec    %eax
  a4fdd0:	8d 3d 9e 49 00 00    	lea    0x499e,%edi
  a4fdd6:	e8 15 e3 ff ff       	call   a4e0f0 <cmdline_find_option_bool>
  a4fddb:	85 c0                	test   %eax,%eax
  a4fddd:	75 10                	jne    a4fdef <paging_prepare+0x2f>
  a4fddf:	41                   	inc    %ecx
  a4fde0:	89 c4                	mov    %eax,%esp
  a4fde2:	89 c1                	mov    %eax,%ecx
  a4fde4:	0f a2                	cpuid  
  a4fde6:	83 f8 06             	cmp    $0x6,%eax
  a4fde9:	0f 87 c9 01 00 00    	ja     a4ffb8 <paging_prepare+0x1f8>
  a4fdef:	45                   	inc    %ebp
  a4fdf0:	31 e4                	xor    %esp,%esp
  a4fdf2:	48                   	dec    %eax
  a4fdf3:	8b 05 17 a3 01 00    	mov    0x1a317,%eax
  a4fdf9:	ba 04 00 00 00       	mov    $0x4,%edx
  a4fdfe:	48                   	dec    %eax
  a4fdff:	8d 35 7f 48 00 00    	lea    0x487f,%esi
  a4fe05:	48                   	dec    %eax
  a4fe06:	8d a8 c0 01 00 00    	lea    0x1c0(%eax),%ebp
  a4fe0c:	48                   	dec    %eax
  a4fe0d:	89 ef                	mov    %ebp,%edi
  a4fe0f:	e8 6c db ff ff       	call   a4d980 <strncmp>
  a4fe14:	85 c0                	test   %eax,%eax
  a4fe16:	0f 85 bc 01 00 00    	jne    a4ffd8 <paging_prepare+0x218>
  a4fe1c:	ba 00 f0 09 00       	mov    $0x9f000,%edx
  a4fe21:	48                   	dec    %eax
  a4fe22:	8b 3d e8 a2 01 00    	mov    0x1a2e8,%edi
  a4fe28:	0f b6 8f e8 01 00 00 	movzbl 0x1e8(%edi),%ecx
  a4fe2f:	84 c9                	test   %cl,%cl
  a4fe31:	0f 84 6e 01 00 00    	je     a4ffa5 <paging_prepare+0x1e5>
  a4fe37:	0f b6 c1             	movzbl %cl,%eax
  a4fe3a:	83 e9 01             	sub    $0x1,%ecx
  a4fe3d:	48                   	dec    %eax
  a4fe3e:	8d 34 80             	lea    (%eax,%eax,4),%esi
  a4fe41:	48                   	dec    %eax
  a4fe42:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  a4fe45:	48                   	dec    %eax
  a4fe46:	c1 e6 02             	shl    $0x2,%esi
  a4fe49:	48                   	dec    %eax
  a4fe4a:	c1 e1 02             	shl    $0x2,%ecx
  a4fe4d:	48                   	dec    %eax
  a4fe4e:	8d 04 37             	lea    (%edi,%esi,1),%eax
  a4fe51:	48                   	dec    %eax
  a4fe52:	8d 74 37 ec          	lea    -0x14(%edi,%esi,1),%esi
  a4fe56:	48                   	dec    %eax
  a4fe57:	29 ce                	sub    %ecx,%esi
  a4fe59:	48                   	dec    %eax
  a4fe5a:	8b 88 bc 02 00 00    	mov    0x2bc(%eax),%ecx
  a4fe60:	48                   	dec    %eax
  a4fe61:	39 d1                	cmp    %edx,%ecx
  a4fe63:	0f 83 2f 01 00 00    	jae    a4ff98 <paging_prepare+0x1d8>
  a4fe69:	83 b8 cc 02 00 00 01 	cmpl   $0x1,0x2cc(%eax)
  a4fe70:	0f 85 22 01 00 00    	jne    a4ff98 <paging_prepare+0x1d8>
  a4fe76:	4c                   	dec    %esp
  a4fe77:	8b 80 c4 02 00 00    	mov    0x2c4(%eax),%eax
  a4fe7d:	49                   	dec    %ecx
  a4fe7e:	01 c8                	add    %ecx,%eax
  a4fe80:	49                   	dec    %ecx
  a4fe81:	39 d0                	cmp    %edx,%eax
  a4fe83:	4c                   	dec    %esp
  a4fe84:	0f 47 c2             	cmova  %edx,%eax
  a4fe87:	49                   	dec    %ecx
  a4fe88:	81 e0 00 f0 ff ff    	and    $0xfffff000,%eax
  a4fe8e:	49                   	dec    %ecx
  a4fe8f:	81 e8 00 20 00 00    	sub    $0x2000,%eax
  a4fe95:	4c                   	dec    %esp
  a4fe96:	39 c1                	cmp    %eax,%ecx
  a4fe98:	0f 87 fa 00 00 00    	ja     a4ff98 <paging_prepare+0x1d8>
  a4fe9e:	48                   	dec    %eax
  a4fe9f:	8d 82 00 e0 ff ff    	lea    -0x2000(%edx),%eax
  a4fea5:	49                   	dec    %ecx
  a4fea6:	39 d0                	cmp    %edx,%eax
  a4fea8:	4c                   	dec    %esp
  a4fea9:	0f 47 c0             	cmova  %eax,%eax
  a4feac:	b8 00 04 00 00       	mov    $0x400,%eax
  a4feb1:	4c                   	dec    %esp
  a4feb2:	89 05 70 60 00 00    	mov    %eax,0x6070
  a4feb8:	4c                   	dec    %esp
  a4feb9:	89 c6                	mov    %eax,%esi
  a4febb:	48                   	dec    %eax
  a4febc:	89 c1                	mov    %eax,%ecx
  a4febe:	48                   	dec    %eax
  a4febf:	8d 3d bb ba 01 00    	lea    0x1babb,%edi
  a4fec5:	f3 48                	repz dec %eax
  a4fec7:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  a4fec8:	4c                   	dec    %esp
  a4fec9:	89 c7                	mov    %eax,%edi
  a4fecb:	48                   	dec    %eax
  a4fecc:	89 c8                	mov    %ecx,%eax
  a4fece:	b9 00 04 00 00       	mov    $0x400,%ecx
  a4fed3:	f3 48                	repz dec %eax
  a4fed5:	ab                   	stos   %eax,%es:(%edi)
  a4fed6:	48                   	dec    %eax
  a4fed7:	8d 05 c3 a5 ff ff    	lea    0xffffa5c3,%eax
  a4fedd:	48                   	dec    %eax
  a4fede:	8b 0d 44 60 00 00    	mov    0x6044,%ecx
  a4fee4:	48                   	dec    %eax
  a4fee5:	8b 30                	mov    (%eax),%esi
  a4fee7:	48                   	dec    %eax
  a4fee8:	8d 91 00 10 00 00    	lea    0x1000(%ecx),%edx
  a4feee:	48                   	dec    %eax
  a4feef:	89 b1 00 10 00 00    	mov    %esi,0x1000(%ecx)
  a4fef5:	48                   	dec    %eax
  a4fef6:	8b 48 08             	mov    0x8(%eax),%ecx
  a4fef9:	48                   	dec    %eax
  a4fefa:	89 4a 08             	mov    %ecx,0x8(%edx)
  a4fefd:	48                   	dec    %eax
  a4fefe:	8b 48 10             	mov    0x10(%eax),%ecx
  a4ff01:	48                   	dec    %eax
  a4ff02:	89 4a 10             	mov    %ecx,0x10(%edx)
  a4ff05:	48                   	dec    %eax
  a4ff06:	8b 48 18             	mov    0x18(%eax),%ecx
  a4ff09:	48                   	dec    %eax
  a4ff0a:	89 4a 18             	mov    %ecx,0x18(%edx)
  a4ff0d:	48                   	dec    %eax
  a4ff0e:	8b 48 20             	mov    0x20(%eax),%ecx
  a4ff11:	48                   	dec    %eax
  a4ff12:	89 4a 20             	mov    %ecx,0x20(%edx)
  a4ff15:	48                   	dec    %eax
  a4ff16:	8b 48 28             	mov    0x28(%eax),%ecx
  a4ff19:	48                   	dec    %eax
  a4ff1a:	89 4a 28             	mov    %ecx,0x28(%edx)
  a4ff1d:	48                   	dec    %eax
  a4ff1e:	8b 48 30             	mov    0x30(%eax),%ecx
  a4ff21:	48                   	dec    %eax
  a4ff22:	89 4a 30             	mov    %ecx,0x30(%edx)
  a4ff25:	48                   	dec    %eax
  a4ff26:	8b 48 38             	mov    0x38(%eax),%ecx
  a4ff29:	48                   	dec    %eax
  a4ff2a:	89 4a 38             	mov    %ecx,0x38(%edx)
  a4ff2d:	48                   	dec    %eax
  a4ff2e:	8b 48 40             	mov    0x40(%eax),%ecx
  a4ff31:	48                   	dec    %eax
  a4ff32:	89 4a 40             	mov    %ecx,0x40(%edx)
  a4ff35:	48                   	dec    %eax
  a4ff36:	8b 48 48             	mov    0x48(%eax),%ecx
  a4ff39:	48                   	dec    %eax
  a4ff3a:	89 4a 48             	mov    %ecx,0x48(%edx)
  a4ff3d:	48                   	dec    %eax
  a4ff3e:	8b 48 50             	mov    0x50(%eax),%ecx
  a4ff41:	48                   	dec    %eax
  a4ff42:	89 4a 50             	mov    %ecx,0x50(%edx)
  a4ff45:	48                   	dec    %eax
  a4ff46:	8b 48 58             	mov    0x58(%eax),%ecx
  a4ff49:	48                   	dec    %eax
  a4ff4a:	89 4a 58             	mov    %ecx,0x58(%edx)
  a4ff4d:	48                   	dec    %eax
  a4ff4e:	8b 48 60             	mov    0x60(%eax),%ecx
  a4ff51:	48                   	dec    %eax
  a4ff52:	89 4a 60             	mov    %ecx,0x60(%edx)
  a4ff55:	48                   	dec    %eax
  a4ff56:	8b 40 68             	mov    0x68(%eax),%eax
  a4ff59:	48                   	dec    %eax
  a4ff5a:	89 42 68             	mov    %eax,0x68(%edx)
  a4ff5d:	0f 20 e0             	mov    %cr4,%eax
  a4ff60:	48                   	dec    %eax
  a4ff61:	c1 e8 0c             	shr    $0xc,%eax
  a4ff64:	83 e0 01             	and    $0x1,%eax
  a4ff67:	4c                   	dec    %esp
  a4ff68:	39 e0                	cmp    %esp,%eax
  a4ff6a:	74 1a                	je     a4ff86 <paging_prepare+0x1c6>
  a4ff6c:	4d                   	dec    %ebp
  a4ff6d:	85 e4                	test   %esp,%esp
  a4ff6f:	0f 84 cb 00 00 00    	je     a50040 <paging_prepare+0x280>
  a4ff75:	0f 20 d8             	mov    %cr3,%eax
  a4ff78:	48                   	dec    %eax
  a4ff79:	8b 15 a9 5f 00 00    	mov    0x5fa9,%edx
  a4ff7f:	48                   	dec    %eax
  a4ff80:	83 c8 67             	or     $0x67,%eax
  a4ff83:	48                   	dec    %eax
  a4ff84:	89 02                	mov    %eax,(%edx)
  a4ff86:	4c                   	dec    %esp
  a4ff87:	89 e2                	mov    %esp,%edx
  a4ff89:	5b                   	pop    %ebx
  a4ff8a:	4c                   	dec    %esp
  a4ff8b:	89 c0                	mov    %eax,%eax
  a4ff8d:	5d                   	pop    %ebp
  a4ff8e:	41                   	inc    %ecx
  a4ff8f:	5c                   	pop    %esp
  a4ff90:	c3                   	ret    
  a4ff91:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4ff98:	48                   	dec    %eax
  a4ff99:	83 e8 14             	sub    $0x14,%eax
  a4ff9c:	48                   	dec    %eax
  a4ff9d:	39 f0                	cmp    %esi,%eax
  a4ff9f:	0f 85 b4 fe ff ff    	jne    a4fe59 <paging_prepare+0x99>
  a4ffa5:	4c                   	dec    %esp
  a4ffa6:	8d 82 00 e0 ff ff    	lea    -0x2000(%edx),%eax
  a4ffac:	e9 fb fe ff ff       	jmp    a4feac <paging_prepare+0xec>
  a4ffb1:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4ffb8:	b8 07 00 00 00       	mov    $0x7,%eax
  a4ffbd:	44                   	inc    %esp
  a4ffbe:	89 e1                	mov    %esp,%ecx
  a4ffc0:	0f a2                	cpuid  
  a4ffc2:	c1 e9 10             	shr    $0x10,%ecx
  a4ffc5:	41                   	inc    %ecx
  a4ffc6:	89 cc                	mov    %ecx,%esp
  a4ffc8:	41                   	inc    %ecx
  a4ffc9:	83 e4 01             	and    $0x1,%esp
  a4ffcc:	e9 21 fe ff ff       	jmp    a4fdf2 <paging_prepare+0x32>
  a4ffd1:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a4ffd8:	ba 04 00 00 00       	mov    $0x4,%edx
  a4ffdd:	48                   	dec    %eax
  a4ffde:	8d 35 a5 46 00 00    	lea    0x46a5,%esi
  a4ffe4:	48                   	dec    %eax
  a4ffe5:	89 ef                	mov    %ebp,%edi
  a4ffe7:	e8 94 d9 ff ff       	call   a4d980 <strncmp>
  a4ffec:	85 c0                	test   %eax,%eax
  a4ffee:	0f 84 28 fe ff ff    	je     a4fe1c <paging_prepare+0x5c>
  a4fff4:	0f b7 04 25 13 04 00 	movzwl 0x413(,%eiz,1),%eax
  a4fffb:	00 
  a4fffc:	0f b7 14 25 0e 04 00 	movzwl 0x40e(,%eiz,1),%edx
  a50003:	00 
  a50004:	c1 e0 0a             	shl    $0xa,%eax
  a50007:	c1 e2 04             	shl    $0x4,%edx
  a5000a:	48                   	dec    %eax
  a5000b:	98                   	cwtl   
  a5000c:	48                   	dec    %eax
  a5000d:	63 d2                	arpl   %dx,%dx
  a5000f:	48                   	dec    %eax
  a50010:	8d 88 00 00 fe ff    	lea    -0x20000(%eax),%ecx
  a50016:	48                   	dec    %eax
  a50017:	81 f9 01 f0 07 00    	cmp    $0x7f001,%ecx
  a5001d:	b9 00 f0 09 00       	mov    $0x9f000,%ecx
  a50022:	48                   	dec    %eax
  a50023:	0f 43 c1             	cmovae %ecx,%eax
  a50026:	48                   	dec    %eax
  a50027:	81 fa 00 00 02 00    	cmp    $0x20000,%edx
  a5002d:	76 5e                	jbe    a5008d <paging_prepare+0x2cd>
  a5002f:	48                   	dec    %eax
  a50030:	39 c2                	cmp    %eax,%edx
  a50032:	73 59                	jae    a5008d <paging_prepare+0x2cd>
  a50034:	48                   	dec    %eax
  a50035:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  a5003b:	e9 e1 fd ff ff       	jmp    a4fe21 <paging_prepare+0x61>
  a50040:	0f 20 d8             	mov    %cr3,%eax
  a50043:	48                   	dec    %eax
  a50044:	8b 30                	mov    (%eax),%esi
  a50046:	48                   	dec    %eax
  a50047:	8b 0d db 5e 00 00    	mov    0x5edb,%ecx
  a5004d:	4c                   	dec    %esp
  a5004e:	89 e2                	mov    %esp,%edx
  a50050:	48                   	dec    %eax
  a50051:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  a50057:	48                   	dec    %eax
  a50058:	8d 79 08             	lea    0x8(%ecx),%edi
  a5005b:	48                   	dec    %eax
  a5005c:	8b 06                	mov    (%esi),%eax
  a5005e:	48                   	dec    %eax
  a5005f:	83 e7 f8             	and    $0xfffffff8,%edi
  a50062:	48                   	dec    %eax
  a50063:	89 01                	mov    %eax,(%ecx)
  a50065:	48                   	dec    %eax
  a50066:	8b 86 f8 0f 00 00    	mov    0xff8(%esi),%eax
  a5006c:	48                   	dec    %eax
  a5006d:	89 81 f8 0f 00 00    	mov    %eax,0xff8(%ecx)
  a50073:	48                   	dec    %eax
  a50074:	29 f9                	sub    %edi,%ecx
  a50076:	4c                   	dec    %esp
  a50077:	89 c0                	mov    %eax,%eax
  a50079:	48                   	dec    %eax
  a5007a:	29 ce                	sub    %ecx,%esi
  a5007c:	81 c1 00 10 00 00    	add    $0x1000,%ecx
  a50082:	c1 e9 03             	shr    $0x3,%ecx
  a50085:	f3 48                	repz dec %eax
  a50087:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  a50088:	5b                   	pop    %ebx
  a50089:	5d                   	pop    %ebp
  a5008a:	41                   	inc    %ecx
  a5008b:	5c                   	pop    %esp
  a5008c:	c3                   	ret    
  a5008d:	48                   	dec    %eax
  a5008e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  a50093:	48                   	dec    %eax
  a50094:	89 c2                	mov    %eax,%edx
  a50096:	e9 86 fd ff ff       	jmp    a4fe21 <paging_prepare+0x61>
  a5009b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)

0000000000a500a0 <cleanup_trampoline>:
  a500a0:	f3 0f 1e fa          	endbr64 
  a500a4:	48                   	dec    %eax
  a500a5:	8b 35 7d 5e 00 00    	mov    0x5e7d,%esi
  a500ab:	48                   	dec    %eax
  a500ac:	89 f8                	mov    %edi,%eax
  a500ae:	0f 20 da             	mov    %cr3,%edx
  a500b1:	48                   	dec    %eax
  a500b2:	39 d6                	cmp    %edx,%esi
  a500b4:	74 42                	je     a500f8 <cleanup_trampoline+0x58>
  a500b6:	48                   	dec    %eax
  a500b7:	8b 05 c3 b8 01 00    	mov    0x1b8c3,%eax
  a500bd:	48                   	dec    %eax
  a500be:	8d 7e 08             	lea    0x8(%esi),%edi
  a500c1:	48                   	dec    %eax
  a500c2:	89 f1                	mov    %esi,%ecx
  a500c4:	48                   	dec    %eax
  a500c5:	83 e7 f8             	and    $0xfffffff8,%edi
  a500c8:	48                   	dec    %eax
  a500c9:	89 06                	mov    %eax,(%esi)
  a500cb:	48                   	dec    %eax
  a500cc:	8b 05 a6 d8 01 00    	mov    0x1d8a6,%eax
  a500d2:	48                   	dec    %eax
  a500d3:	29 f9                	sub    %edi,%ecx
  a500d5:	48                   	dec    %eax
  a500d6:	89 86 f8 1f 00 00    	mov    %eax,0x1ff8(%esi)
  a500dc:	48                   	dec    %eax
  a500dd:	8d 35 9d b8 01 00    	lea    0x1b89d,%esi
  a500e3:	48                   	dec    %eax
  a500e4:	29 ce                	sub    %ecx,%esi
  a500e6:	81 c1 00 20 00 00    	add    $0x2000,%ecx
  a500ec:	c1 e9 03             	shr    $0x3,%ecx
  a500ef:	f3 48                	repz dec %eax
  a500f1:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  a500f2:	c3                   	ret    
  a500f3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a500f8:	48                   	dec    %eax
  a500f9:	8b 16                	mov    (%esi),%edx
  a500fb:	48                   	dec    %eax
  a500fc:	8d 7f 08             	lea    0x8(%edi),%edi
  a500ff:	48                   	dec    %eax
  a50100:	89 c1                	mov    %eax,%ecx
  a50102:	48                   	dec    %eax
  a50103:	89 57 f8             	mov    %edx,-0x8(%edi)
  a50106:	48                   	dec    %eax
  a50107:	8b 96 f8 0f 00 00    	mov    0xff8(%esi),%edx
  a5010d:	48                   	dec    %eax
  a5010e:	89 97 f0 0f 00 00    	mov    %edx,0xff0(%edi)
  a50114:	48                   	dec    %eax
  a50115:	83 e7 f8             	and    $0xfffffff8,%edi
  a50118:	48                   	dec    %eax
  a50119:	29 f9                	sub    %edi,%ecx
  a5011b:	48                   	dec    %eax
  a5011c:	29 ce                	sub    %ecx,%esi
  a5011e:	81 c1 00 10 00 00    	add    $0x1000,%ecx
  a50124:	c1 e9 03             	shr    $0x3,%ecx
  a50127:	f3 48                	repz dec %eax
  a50129:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  a5012a:	0f 22 d8             	mov    %eax,%cr3
  a5012d:	48                   	dec    %eax
  a5012e:	8b 35 f4 5d 00 00    	mov    0x5df4,%esi
  a50134:	eb 80                	jmp    a500b6 <cleanup_trampoline+0x16>
  a50136:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a5013d:	00 00 00 

0000000000a50140 <exit_boot_func>:
  a50140:	f3 0f 1e fa          	endbr64 
  a50144:	48                   	dec    %eax
  a50145:	8b 05 35 d8 01 00    	mov    0x1d835,%eax
  a5014b:	48                   	dec    %eax
  a5014c:	8b 4a 08             	mov    0x8(%edx),%ecx
  a5014f:	80 78 30 01          	cmpb   $0x1,0x30(%eax)
  a50153:	19 c0                	sbb    %eax,%eax
  a50155:	25 00 00 fd fd       	and    $0xfdfd0000,%eax
  a5015a:	05 45 4c 36 34       	add    $0x34364c45,%eax
  a5015f:	89 01                	mov    %eax,(%ecx)
  a50161:	48                   	dec    %eax
  a50162:	8b 42 08             	mov    0x8(%edx),%eax
  a50165:	89 78 04             	mov    %edi,0x4(%eax)
  a50168:	48                   	dec    %eax
  a50169:	8b 4e 10             	mov    0x10(%esi),%ecx
  a5016c:	48                   	dec    %eax
  a5016d:	c1 ef 20             	shr    $0x20,%edi
  a50170:	48                   	dec    %eax
  a50171:	8b 42 08             	mov    0x8(%edx),%eax
  a50174:	48                   	dec    %eax
  a50175:	8b 09                	mov    (%ecx),%ecx
  a50177:	89 48 08             	mov    %ecx,0x8(%eax)
  a5017a:	48                   	dec    %eax
  a5017b:	8b 4e 18             	mov    0x18(%esi),%ecx
  a5017e:	48                   	dec    %eax
  a5017f:	8b 42 08             	mov    0x8(%edx),%eax
  a50182:	8b 09                	mov    (%ecx),%ecx
  a50184:	89 48 0c             	mov    %ecx,0xc(%eax)
  a50187:	48                   	dec    %eax
  a50188:	8b 0e                	mov    (%esi),%ecx
  a5018a:	48                   	dec    %eax
  a5018b:	8b 42 08             	mov    0x8(%edx),%eax
  a5018e:	48                   	dec    %eax
  a5018f:	8b 09                	mov    (%ecx),%ecx
  a50191:	89 48 10             	mov    %ecx,0x10(%eax)
  a50194:	48                   	dec    %eax
  a50195:	8b 4e 08             	mov    0x8(%esi),%ecx
  a50198:	48                   	dec    %eax
  a50199:	8b 42 08             	mov    0x8(%edx),%eax
  a5019c:	48                   	dec    %eax
  a5019d:	8b 09                	mov    (%ecx),%ecx
  a5019f:	89 48 14             	mov    %ecx,0x14(%eax)
  a501a2:	48                   	dec    %eax
  a501a3:	8b 42 08             	mov    0x8(%edx),%eax
  a501a6:	89 78 18             	mov    %edi,0x18(%eax)
  a501a9:	48                   	dec    %eax
  a501aa:	8b 06                	mov    (%esi),%eax
  a501ac:	48                   	dec    %eax
  a501ad:	8b 52 08             	mov    0x8(%edx),%edx
  a501b0:	48                   	dec    %eax
  a501b1:	8b 00                	mov    (%eax),%eax
  a501b3:	48                   	dec    %eax
  a501b4:	c1 e8 20             	shr    $0x20,%eax
  a501b7:	89 42 1c             	mov    %eax,0x1c(%edx)
  a501ba:	31 c0                	xor    %eax,%eax
  a501bc:	c3                   	ret    
  a501bd:	0f 1f 00             	nopl   (%eax)

0000000000a501c0 <__efi_early>:
  a501c0:	f3 0f 1e fa          	endbr64 
  a501c4:	48                   	dec    %eax
  a501c5:	8b 05 b5 d7 01 00    	mov    0x1d7b5,%eax
  a501cb:	c3                   	ret    
  a501cc:	0f 1f 40 00          	nopl   0x0(%eax)

0000000000a501d0 <efi_char16_printk>:
  a501d0:	f3 0f 1e fa          	endbr64 
  a501d4:	48                   	dec    %eax
  a501d5:	8b 05 a5 d7 01 00    	mov    0x1d7a5,%eax
  a501db:	48                   	dec    %eax
  a501dc:	89 f2                	mov    %esi,%edx
  a501de:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a501e2:	48                   	dec    %eax
  a501e3:	8b 48 28             	mov    0x28(%eax),%ecx
  a501e6:	48                   	dec    %eax
  a501e7:	8b 70 20             	mov    0x20(%eax),%esi
  a501ea:	74 0c                	je     a501f8 <efi_char16_printk+0x28>
  a501ec:	48                   	dec    %eax
  a501ed:	8b 7e 08             	mov    0x8(%esi),%edi
  a501f0:	31 c0                	xor    %eax,%eax
  a501f2:	ff e1                	jmp    *%ecx
  a501f4:	0f 1f 40 00          	nopl   0x0(%eax)
  a501f8:	8b 7e 04             	mov    0x4(%esi),%edi
  a501fb:	31 c0                	xor    %eax,%eax
  a501fd:	ff e1                	jmp    *%ecx
  a501ff:	90                   	nop

0000000000a50200 <setup_graphics>:
  a50200:	f3 0f 1e fa          	endbr64 
  a50204:	48                   	dec    %eax
  a50205:	b8 de a9 42 90       	mov    $0x9042a9de,%eax
  a5020a:	dc 23                	fsubl  (%ebx)
  a5020c:	38 4a 41             	cmp    %cl,0x41(%edx)
  a5020f:	57                   	push   %edi
  a50210:	41                   	inc    %ecx
  a50211:	56                   	push   %esi
  a50212:	41                   	inc    %ecx
  a50213:	55                   	push   %ebp
  a50214:	41                   	inc    %ecx
  a50215:	54                   	push   %esp
  a50216:	55                   	push   %ebp
  a50217:	53                   	push   %ebx
  a50218:	48                   	dec    %eax
  a50219:	89 fb                	mov    %edi,%ebx
  a5021b:	48                   	dec    %eax
  a5021c:	83 c7 08             	add    $0x8,%edi
  a5021f:	48                   	dec    %eax
  a50220:	89 d9                	mov    %ebx,%ecx
  a50222:	48                   	dec    %eax
  a50223:	81 ec 98 00 00 00    	sub    $0x98,%esp
  a50229:	48                   	dec    %eax
  a5022a:	89 44 24 60          	mov    %eax,0x60(%esp)
  a5022e:	48                   	dec    %eax
  a5022f:	b8 96 fb 7a de       	mov    $0xde7afb96,%eax
  a50234:	d0 80 51 6a 48 89    	rolb   -0x76b795af(%eax)
  a5023a:	44                   	inc    %esp
  a5023b:	24 68                	and    $0x68,%al
  a5023d:	48                   	dec    %eax
  a5023e:	b8 8b 29 2c 98       	mov    $0x982c298b,%eax
  a50243:	fa                   	cli    
  a50244:	f4                   	hlt    
  a50245:	cb                   	lret   
  a50246:	41                   	inc    %ecx
  a50247:	48                   	dec    %eax
  a50248:	89 44 24 70          	mov    %eax,0x70(%esp)
  a5024c:	48                   	dec    %eax
  a5024d:	b8 b8 38 77 aa       	mov    $0xaa7738b8,%eax
  a50252:	68 8f b8 39 48       	push   $0x4839b88f
  a50257:	89 44 24 78          	mov    %eax,0x78(%esp)
  a5025b:	31 c0                	xor    %eax,%eax
  a5025d:	48                   	dec    %eax
  a5025e:	c7 47 f8 00 00 00 00 	movl   $0x0,-0x8(%edi)
  a50265:	48                   	dec    %eax
  a50266:	c7 47 30 00 00 00 00 	movl   $0x0,0x30(%edi)
  a5026d:	48                   	dec    %eax
  a5026e:	83 e7 f8             	and    $0xfffffff8,%edi
  a50271:	48                   	dec    %eax
  a50272:	29 f9                	sub    %edi,%ecx
  a50274:	83 c1 40             	add    $0x40,%ecx
  a50277:	c1 e9 03             	shr    $0x3,%ecx
  a5027a:	f3 48                	repz dec %eax
  a5027c:	ab                   	stos   %eax,%es:(%edi)
  a5027d:	48                   	dec    %eax
  a5027e:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  a50285:	00 
  a50286:	48                   	dec    %eax
  a50287:	8b 05 f3 d6 01 00    	mov    0x1d6f3,%eax
  a5028d:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a50291:	4c                   	dec    %esp
  a50292:	8b 50 28             	mov    0x28(%eax),%edx
  a50295:	48                   	dec    %eax
  a50296:	8b 40 18             	mov    0x18(%eax),%eax
  a50299:	0f 84 a1 00 00 00    	je     a50340 <setup_graphics+0x140>
  a5029f:	48                   	dec    %eax
  a502a0:	8b b8 b0 00 00 00    	mov    0xb0(%eax),%edi
  a502a6:	48                   	dec    %eax
  a502a7:	8d 6c 24 38          	lea    0x38(%esp),%ebp
  a502ab:	4c                   	dec    %esp
  a502ac:	8d 64 24 60          	lea    0x60(%esp),%esp
  a502b0:	45                   	inc    %ebp
  a502b1:	31 c9                	xor    %ecx,%ecx
  a502b3:	31 c9                	xor    %ecx,%ecx
  a502b5:	4c                   	dec    %esp
  a502b6:	89 e2                	mov    %esp,%edx
  a502b8:	49                   	dec    %ecx
  a502b9:	89 e8                	mov    %ebp,%eax
  a502bb:	be 02 00 00 00       	mov    $0x2,%esi
  a502c0:	31 c0                	xor    %eax,%eax
  a502c2:	41                   	inc    %ecx
  a502c3:	ff d2                	call   *%edx
  a502c5:	48                   	dec    %eax
  a502c6:	ba 05 00 00 00       	mov    $0x5,%edx
  a502cb:	00 00                	add    %al,(%eax)
  a502cd:	00 80 48 39 d0 0f    	add    %al,0xfd03948(%eax)
  a502d3:	84 88 00 00 00 48    	test   %cl,0x48000000(%eax)
  a502d9:	85 c0                	test   %eax,%eax
  a502db:	74 4d                	je     a5032a <setup_graphics+0x12a>
  a502dd:	48                   	dec    %eax
  a502de:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  a502e5:	00 
  a502e6:	48                   	dec    %eax
  a502e7:	8b 05 93 d6 01 00    	mov    0x1d693,%eax
  a502ed:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a502f1:	4c                   	dec    %esp
  a502f2:	8b 50 28             	mov    0x28(%eax),%edx
  a502f5:	48                   	dec    %eax
  a502f6:	8b 50 18             	mov    0x18(%eax),%edx
  a502f9:	75 55                	jne    a50350 <setup_graphics+0x150>
  a502fb:	8b 7a 64             	mov    0x64(%edx),%edi
  a502fe:	4c                   	dec    %esp
  a502ff:	8d 64 24 70          	lea    0x70(%esp),%esp
  a50303:	49                   	dec    %ecx
  a50304:	89 e8                	mov    %ebp,%eax
  a50306:	45                   	inc    %ebp
  a50307:	31 c9                	xor    %ecx,%ecx
  a50309:	31 c9                	xor    %ecx,%ecx
  a5030b:	4c                   	dec    %esp
  a5030c:	89 e2                	mov    %esp,%edx
  a5030e:	be 02 00 00 00       	mov    $0x2,%esi
  a50313:	31 c0                	xor    %eax,%eax
  a50315:	41                   	inc    %ecx
  a50316:	ff d2                	call   *%edx
  a50318:	49                   	dec    %ecx
  a50319:	89 c0                	mov    %eax,%eax
  a5031b:	48                   	dec    %eax
  a5031c:	b8 05 00 00 00       	mov    $0x5,%eax
  a50321:	00 00                	add    %al,(%eax)
  a50323:	00 80 49 39 c0 74    	add    %al,0x74c03949(%eax)
  a50329:	56                   	push   %esi
  a5032a:	48                   	dec    %eax
  a5032b:	81 c4 98 00 00 00    	add    $0x98,%esp
  a50331:	5b                   	pop    %ebx
  a50332:	5d                   	pop    %ebp
  a50333:	41                   	inc    %ecx
  a50334:	5c                   	pop    %esp
  a50335:	41                   	inc    %ecx
  a50336:	5d                   	pop    %ebp
  a50337:	41                   	inc    %ecx
  a50338:	5e                   	pop    %esi
  a50339:	41                   	inc    %ecx
  a5033a:	5f                   	pop    %edi
  a5033b:	c3                   	ret    
  a5033c:	0f 1f 40 00          	nopl   0x0(%eax)
  a50340:	8b 78 64             	mov    0x64(%eax),%edi
  a50343:	e9 5e ff ff ff       	jmp    a502a6 <setup_graphics+0xa6>
  a50348:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5034f:	00 
  a50350:	48                   	dec    %eax
  a50351:	8b ba b0 00 00 00    	mov    0xb0(%edx),%edi
  a50357:	eb a5                	jmp    a502fe <setup_graphics+0xfe>
  a50359:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a50360:	48                   	dec    %eax
  a50361:	8b 4c 24 38          	mov    0x38(%esp),%ecx
  a50365:	4c                   	dec    %esp
  a50366:	89 e2                	mov    %esp,%edx
  a50368:	48                   	dec    %eax
  a50369:	89 de                	mov    %ebx,%esi
  a5036b:	31 ff                	xor    %edi,%edi
  a5036d:	e8 4e 2f 00 00       	call   a532c0 <efi_setup_gop>
  a50372:	e9 61 ff ff ff       	jmp    a502d8 <setup_graphics+0xd8>
  a50377:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a5037e:	00 00 
  a50380:	48                   	dec    %eax
  a50381:	8b 05 f9 d5 01 00    	mov    0x1d5f9,%eax
  a50387:	48                   	dec    %eax
  a50388:	8b 54 24 38          	mov    0x38(%esp),%edx
  a5038c:	48                   	dec    %eax
  a5038d:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
  a50394:	00 
  a50395:	48                   	dec    %eax
  a50396:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
  a5039d:	00 
  a5039e:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a503a2:	4c                   	dec    %esp
  a503a3:	8b 40 28             	mov    0x28(%eax),%eax
  a503a6:	48                   	dec    %eax
  a503a7:	89 54 24 40          	mov    %edx,0x40(%esp)
  a503ab:	48                   	dec    %eax
  a503ac:	8b 48 18             	mov    0x18(%eax),%ecx
  a503af:	0f 84 3b 02 00 00    	je     a505f0 <setup_graphics+0x3f0>
  a503b5:	48                   	dec    %eax
  a503b6:	8b 79 40             	mov    0x40(%ecx),%edi
  a503b9:	31 c0                	xor    %eax,%eax
  a503bb:	48                   	dec    %eax
  a503bc:	8d 4c 24 48          	lea    0x48(%esp),%ecx
  a503c0:	be 02 00 00 00       	mov    $0x2,%esi
  a503c5:	41                   	inc    %ecx
  a503c6:	ff d0                	call   *%eax
  a503c8:	48                   	dec    %eax
  a503c9:	85 c0                	test   %eax,%eax
  a503cb:	0f 85 59 ff ff ff    	jne    a5032a <setup_graphics+0x12a>
  a503d1:	48                   	dec    %eax
  a503d2:	8b 05 a8 d5 01 00    	mov    0x1d5a8,%eax
  a503d8:	4c                   	dec    %esp
  a503d9:	8b 4c 24 48          	mov    0x48(%esp),%ecx
  a503dd:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a503e1:	4c                   	dec    %esp
  a503e2:	8b 50 28             	mov    0x28(%eax),%edx
  a503e5:	48                   	dec    %eax
  a503e6:	8b 50 18             	mov    0x18(%eax),%edx
  a503e9:	0f 85 11 02 00 00    	jne    a50600 <setup_graphics+0x400>
  a503ef:	8b 7a 64             	mov    0x64(%edx),%edi
  a503f2:	4c                   	dec    %esp
  a503f3:	8d 44 24 40          	lea    0x40(%esp),%eax
  a503f7:	31 c9                	xor    %ecx,%ecx
  a503f9:	4c                   	dec    %esp
  a503fa:	89 e2                	mov    %esp,%edx
  a503fc:	be 02 00 00 00       	mov    $0x2,%esi
  a50401:	31 c0                	xor    %eax,%eax
  a50403:	41                   	inc    %ecx
  a50404:	ff d2                	call   *%edx
  a50406:	48                   	dec    %eax
  a50407:	89 c5                	mov    %eax,%ebp
  a50409:	48                   	dec    %eax
  a5040a:	85 c0                	test   %eax,%eax
  a5040c:	0f 85 8e 02 00 00    	jne    a506a0 <setup_graphics+0x4a0>
  a50412:	48                   	dec    %eax
  a50413:	8b 0d 67 d5 01 00    	mov    0x1d567,%ecx
  a50419:	4c                   	dec    %esp
  a5041a:	8b 44 24 40          	mov    0x40(%esp),%eax
  a5041e:	0f b6 71 30          	movzbl 0x30(%ecx),%esi
  a50422:	4c                   	dec    %esp
  a50423:	89 c0                	mov    %eax,%eax
  a50425:	40                   	inc    %eax
  a50426:	80 fe 01             	cmp    $0x1,%dh
  a50429:	48                   	dec    %eax
  a5042a:	19 ff                	sbb    %edi,%edi
  a5042c:	31 d2                	xor    %edx,%edx
  a5042e:	48                   	dec    %eax
  a5042f:	83 e7 fc             	and    $0xfffffffc,%edi
  a50432:	48                   	dec    %eax
  a50433:	83 c7 08             	add    $0x8,%edi
  a50436:	48                   	dec    %eax
  a50437:	f7 f7                	div    %edi
  a50439:	49                   	dec    %ecx
  a5043a:	39 f8                	cmp    %edi,%eax
  a5043c:	0f 82 80 01 00 00    	jb     a505c2 <setup_graphics+0x3c2>
  a50442:	48                   	dec    %eax
  a50443:	8d 94 24 80 00 00 00 	lea    0x80(%esp),%edx
  a5044a:	48                   	dec    %eax
  a5044b:	89 5c 24 18          	mov    %ebx,0x18(%esp)
  a5044f:	4c                   	dec    %esp
  a50450:	8d 6c 24 50          	lea    0x50(%esp),%ebp
  a50454:	48                   	dec    %eax
  a50455:	89 c3                	mov    %eax,%ebx
  a50457:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  a5045e:	00 
  a5045f:	4c                   	dec    %esp
  a50460:	8d 7c 24 58          	lea    0x58(%esp),%edi
  a50464:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  a5046b:	00 
  a5046c:	48                   	dec    %eax
  a5046d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  a50474:	00 
  a50475:	48                   	dec    %eax
  a50476:	89 14 24             	mov    %edx,(%esp)
  a50479:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a50480:	48                   	dec    %eax
  a50481:	b8 00 b2 f5 4c       	mov    $0x4cf5b200,%eax
  a50486:	b8 68 a5 4c 48       	mov    $0x484ca568,%eax
  a5048b:	8b 54 24 48          	mov    0x48(%esp),%edx
  a5048f:	4c                   	dec    %esp
  a50490:	8b 41 28             	mov    0x28(%ecx),%eax
  a50493:	48                   	dec    %eax
  a50494:	89 84 24 80 00 00 00 	mov    %eax,0x80(%esp)
  a5049b:	48                   	dec    %eax
  a5049c:	b8 9e ec b2 3e       	mov    $0x3eb2ec9e,%eax
  a504a1:	3f                   	aas    
  a504a2:	50                   	push   %eax
  a504a3:	02 9a 48 89 84 24    	add    0x24848948(%edx),%bl
  a504a9:	88 00                	mov    %al,(%eax)
  a504ab:	00 00                	add    %al,(%eax)
  a504ad:	48                   	dec    %eax
  a504ae:	8b 41 18             	mov    0x18(%ecx),%eax
  a504b1:	40                   	inc    %eax
  a504b2:	84 f6                	test   %dh,%dh
  a504b4:	0f 84 96 01 00 00    	je     a50650 <setup_graphics+0x450>
  a504ba:	4c                   	dec    %esp
  a504bb:	8b 34 ea             	mov    (%edx,%ebp,8),%esi
  a504be:	48                   	dec    %eax
  a504bf:	8b b8 98 00 00 00    	mov    0x98(%eax),%edi
  a504c5:	31 c0                	xor    %eax,%eax
  a504c7:	4c                   	dec    %esp
  a504c8:	89 e9                	mov    %ebp,%ecx
  a504ca:	4c                   	dec    %esp
  a504cb:	89 e2                	mov    %esp,%edx
  a504cd:	4c                   	dec    %esp
  a504ce:	89 f6                	mov    %esi,%esi
  a504d0:	41                   	inc    %ecx
  a504d1:	ff d0                	call   *%eax
  a504d3:	48                   	dec    %eax
  a504d4:	85 c0                	test   %eax,%eax
  a504d6:	0f 85 5a 01 00 00    	jne    a50636 <setup_graphics+0x436>
  a504dc:	48                   	dec    %eax
  a504dd:	c7 44 24 58 00 00 00 	movl   $0x0,0x58(%esp)
  a504e4:	00 
  a504e5:	48                   	dec    %eax
  a504e6:	8b 05 94 d4 01 00    	mov    0x1d494,%eax
  a504ec:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a504f0:	4c                   	dec    %esp
  a504f1:	8b 40 28             	mov    0x28(%eax),%eax
  a504f4:	48                   	dec    %eax
  a504f5:	8b 50 18             	mov    0x18(%eax),%edx
  a504f8:	0f 84 72 01 00 00    	je     a50670 <setup_graphics+0x470>
  a504fe:	48                   	dec    %eax
  a504ff:	8b ba 98 00 00 00    	mov    0x98(%edx),%edi
  a50505:	4c                   	dec    %esp
  a50506:	89 f6                	mov    %esi,%esi
  a50508:	31 c0                	xor    %eax,%eax
  a5050a:	48                   	dec    %eax
  a5050b:	8b 14 24             	mov    (%esp),%edx
  a5050e:	4c                   	dec    %esp
  a5050f:	89 f9                	mov    %edi,%ecx
  a50511:	41                   	inc    %ecx
  a50512:	ff d0                	call   *%eax
  a50514:	48                   	dec    %eax
  a50515:	8b 05 65 d4 01 00    	mov    0x1d465,%eax
  a5051b:	48                   	dec    %eax
  a5051c:	8b 74 24 50          	mov    0x50(%esp),%esi
  a50520:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a50524:	4c                   	dec    %esp
  a50525:	8b 50 28             	mov    0x28(%eax),%edx
  a50528:	0f 84 32 01 00 00    	je     a50660 <setup_graphics+0x460>
  a5052e:	48                   	dec    %eax
  a5052f:	8b 3e                	mov    (%esi),%edi
  a50531:	31 c0                	xor    %eax,%eax
  a50533:	48                   	dec    %eax
  a50534:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  a50538:	48                   	dec    %eax
  a50539:	8d 54 24 28          	lea    0x28(%esp),%edx
  a5053d:	4c                   	dec    %esp
  a5053e:	8d 4c 24 34          	lea    0x34(%esp),%ecx
  a50542:	4c                   	dec    %esp
  a50543:	8d 44 24 30          	lea    0x30(%esp),%eax
  a50547:	41                   	inc    %ecx
  a50548:	ff d2                	call   *%edx
  a5054a:	48                   	dec    %eax
  a5054b:	85 c0                	test   %eax,%eax
  a5054d:	0f 85 e3 00 00 00    	jne    a50636 <setup_graphics+0x436>
  a50553:	48                   	dec    %eax
  a50554:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  a50559:	0f 84 b1 00 00 00    	je     a50610 <setup_graphics+0x410>
  a5055f:	48                   	dec    %eax
  a50560:	83 7c 24 58 00       	cmpl   $0x0,0x58(%esp)
  a50565:	0f 84 cb 00 00 00    	je     a50636 <setup_graphics+0x436>
  a5056b:	8b 44 24 28          	mov    0x28(%esp),%eax
  a5056f:	48                   	dec    %eax
  a50570:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  a50574:	89 44 24 14          	mov    %eax,0x14(%esp)
  a50578:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  a5057c:	89 44 24 10          	mov    %eax,0x10(%esp)
  a50580:	48                   	dec    %eax
  a50581:	8b 0d f9 d3 01 00    	mov    0x1d3f9,%ecx
  a50587:	8b 44 24 14          	mov    0x14(%esp),%eax
  a5058b:	0b 44 24 10          	or     0x10(%esp),%eax
  a5058f:	74 2d                	je     a505be <setup_graphics+0x3be>
  a50591:	b8 20 00 00 00       	mov    $0x20,%eax
  a50596:	c6 43 0f 70          	movb   $0x70,0xf(%ebx)
  a5059a:	66 89 43 16          	mov    %ax,0x16(%ebx)
  a5059e:	0f b7 44 24 14       	movzwl 0x14(%esp),%eax
  a505a3:	66 89 43 12          	mov    %ax,0x12(%ebx)
  a505a7:	0f b7 44 24 10       	movzwl 0x10(%esp),%eax
  a505ac:	66 89 43 14          	mov    %ax,0x14(%ebx)
  a505b0:	48                   	dec    %eax
  a505b1:	b8 08 10 08 08       	mov    $0x8081008,%eax
  a505b6:	08 00                	or     %al,(%eax)
  a505b8:	08 18                	or     %bl,(%eax)
  a505ba:	48                   	dec    %eax
  a505bb:	89 43 26             	mov    %eax,0x26(%ebx)
  a505be:	0f b6 71 30          	movzbl 0x30(%ecx),%esi
  a505c2:	48                   	dec    %eax
  a505c3:	8b 51 28             	mov    0x28(%ecx),%edx
  a505c6:	4c                   	dec    %esp
  a505c7:	8b 44 24 48          	mov    0x48(%esp),%eax
  a505cb:	48                   	dec    %eax
  a505cc:	8b 41 18             	mov    0x18(%ecx),%eax
  a505cf:	40                   	inc    %eax
  a505d0:	84 f6                	test   %dh,%dh
  a505d2:	0f 84 a8 00 00 00    	je     a50680 <setup_graphics+0x480>
  a505d8:	48                   	dec    %eax
  a505d9:	8b 78 48             	mov    0x48(%eax),%edi
  a505dc:	4c                   	dec    %esp
  a505dd:	89 c6                	mov    %eax,%esi
  a505df:	31 c0                	xor    %eax,%eax
  a505e1:	ff d2                	call   *%edx
  a505e3:	e9 42 fd ff ff       	jmp    a5032a <setup_graphics+0x12a>
  a505e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a505ef:	00 
  a505f0:	8b 79 2c             	mov    0x2c(%ecx),%edi
  a505f3:	e9 c1 fd ff ff       	jmp    a503b9 <setup_graphics+0x1b9>
  a505f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a505ff:	00 
  a50600:	48                   	dec    %eax
  a50601:	8b ba b0 00 00 00    	mov    0xb0(%edx),%edi
  a50607:	e9 e6 fd ff ff       	jmp    a503f2 <setup_graphics+0x1f2>
  a5060c:	0f 1f 40 00          	nopl   0x0(%eax)
  a50610:	8b 44 24 28          	mov    0x28(%esp),%eax
  a50614:	48                   	dec    %eax
  a50615:	83 7c 24 58 00       	cmpl   $0x0,0x58(%esp)
  a5061a:	89 44 24 14          	mov    %eax,0x14(%esp)
  a5061e:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  a50622:	89 44 24 10          	mov    %eax,0x10(%esp)
  a50626:	0f 85 84 00 00 00    	jne    a506b0 <setup_graphics+0x4b0>
  a5062c:	48                   	dec    %eax
  a5062d:	8b 44 24 50          	mov    0x50(%esp),%eax
  a50631:	48                   	dec    %eax
  a50632:	89 44 24 08          	mov    %eax,0x8(%esp)
  a50636:	48                   	dec    %eax
  a50637:	83 c5 01             	add    $0x1,%ebp
  a5063a:	48                   	dec    %eax
  a5063b:	8b 0d 3f d3 01 00    	mov    0x1d33f,%ecx
  a50641:	48                   	dec    %eax
  a50642:	39 dd                	cmp    %ebx,%ebp
  a50644:	73 4a                	jae    a50690 <setup_graphics+0x490>
  a50646:	0f b6 71 30          	movzbl 0x30(%ecx),%esi
  a5064a:	e9 31 fe ff ff       	jmp    a50480 <setup_graphics+0x280>
  a5064f:	90                   	nop
  a50650:	44                   	inc    %esp
  a50651:	8b 34 aa             	mov    (%edx,%ebp,4),%esi
  a50654:	8b 78 58             	mov    0x58(%eax),%edi
  a50657:	e9 69 fe ff ff       	jmp    a504c5 <setup_graphics+0x2c5>
  a5065c:	0f 1f 40 00          	nopl   0x0(%eax)
  a50660:	8b 3e                	mov    (%esi),%edi
  a50662:	e9 ca fe ff ff       	jmp    a50531 <setup_graphics+0x331>
  a50667:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a5066e:	00 00 
  a50670:	8b 7a 58             	mov    0x58(%edx),%edi
  a50673:	e9 8d fe ff ff       	jmp    a50505 <setup_graphics+0x305>
  a50678:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5067f:	00 
  a50680:	8b 78 30             	mov    0x30(%eax),%edi
  a50683:	e9 54 ff ff ff       	jmp    a505dc <setup_graphics+0x3dc>
  a50688:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5068f:	00 
  a50690:	48                   	dec    %eax
  a50691:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  a50695:	e9 ed fe ff ff       	jmp    a50587 <setup_graphics+0x387>
  a5069a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a506a0:	48                   	dec    %eax
  a506a1:	8b 0d d9 d2 01 00    	mov    0x1d2d9,%ecx
  a506a7:	0f b6 71 30          	movzbl 0x30(%ecx),%esi
  a506ab:	e9 12 ff ff ff       	jmp    a505c2 <setup_graphics+0x3c2>
  a506b0:	48                   	dec    %eax
  a506b1:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  a506b5:	e9 c6 fe ff ff       	jmp    a50580 <setup_graphics+0x380>
  a506ba:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

0000000000a506c0 <make_boot_params>:
  a506c0:	f3 0f 1e fa          	endbr64 
  a506c4:	48                   	dec    %eax
  a506c5:	b8 a1 31 1b 5b       	mov    $0x5b1b31a1,%eax
  a506ca:	62 95 d2 11 41 54    	bound  %edx,0x544111d2(%ebp)
  a506d0:	45                   	inc    %ebp
  a506d1:	31 c0                	xor    %eax,%eax
  a506d3:	48                   	dec    %eax
  a506d4:	ba 49 42 49 20       	mov    $0x20494249,%edx
  a506d9:	53                   	push   %ebx
  a506da:	59                   	pop    %ecx
  a506db:	53                   	push   %ebx
  a506dc:	54                   	push   %esp
  a506dd:	55                   	push   %ebp
  a506de:	53                   	push   %ebx
  a506df:	48                   	dec    %eax
  a506e0:	83 ec 40             	sub    $0x40,%esp
  a506e3:	48                   	dec    %eax
  a506e4:	89 3d 96 d2 01 00    	mov    %edi,0x1d296
  a506ea:	48                   	dec    %eax
  a506eb:	89 44 24 30          	mov    %eax,0x30(%esp)
  a506ef:	48                   	dec    %eax
  a506f0:	b8 8e 3f 00 a0       	mov    $0xa0003f8e,%eax
  a506f5:	c9                   	leave  
  a506f6:	69 72 3b 48 89 44 24 	imul   $0x24448948,0x3b(%edx),%esi
  a506fd:	38 48 8b             	cmp    %cl,-0x75(%eax)
  a50700:	47                   	inc    %edi
  a50701:	08 c7                	or     %al,%bh
  a50703:	44                   	inc    %esp
  a50704:	24 0c                	and    $0xc,%al
  a50706:	00 00                	add    %al,(%eax)
  a50708:	00 00                	add    %al,(%eax)
  a5070a:	48                   	dec    %eax
  a5070b:	89 05 77 d2 01 00    	mov    %eax,0x1d277
  a50711:	48                   	dec    %eax
  a50712:	39 10                	cmp    %edx,(%eax)
  a50714:	0f 85 e0 01 00 00    	jne    a508fa <make_boot_params+0x23a>
  a5071a:	80 7f 30 00          	cmpb   $0x0,0x30(%edi)
  a5071e:	48                   	dec    %eax
  a5071f:	8b 37                	mov    (%edi),%esi
  a50721:	4c                   	dec    %esp
  a50722:	8b 47 28             	mov    0x28(%edi),%eax
  a50725:	0f 85 e5 01 00 00    	jne    a50910 <make_boot_params+0x250>
  a5072b:	8b 58 38             	mov    0x38(%eax),%ebx
  a5072e:	48                   	dec    %eax
  a5072f:	89 5f 10             	mov    %ebx,0x10(%edi)
  a50732:	8b 50 3c             	mov    0x3c(%eax),%edx
  a50735:	48                   	dec    %eax
  a50736:	89 57 18             	mov    %edx,0x18(%edi)
  a50739:	8b 40 2c             	mov    0x2c(%eax),%eax
  a5073c:	48                   	dec    %eax
  a5073d:	89 47 20             	mov    %eax,0x20(%edi)
  a50740:	8b 7a 58             	mov    0x58(%edx),%edi
  a50743:	31 c0                	xor    %eax,%eax
  a50745:	48                   	dec    %eax
  a50746:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  a5074a:	48                   	dec    %eax
  a5074b:	8d 54 24 30          	lea    0x30(%esp),%edx
  a5074f:	41                   	inc    %ecx
  a50750:	ff d0                	call   *%eax
  a50752:	48                   	dec    %eax
  a50753:	85 c0                	test   %eax,%eax
  a50755:	0f 85 65 02 00 00    	jne    a509c0 <make_boot_params+0x300>
  a5075b:	48                   	dec    %eax
  a5075c:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  a50760:	ba 01 00 00 00       	mov    $0x1,%edx
  a50765:	be 00 40 00 00       	mov    $0x4000,%esi
  a5076a:	48                   	dec    %eax
  a5076b:	8b 3d 17 d2 01 00    	mov    0x1d217,%edi
  a50771:	e8 6a 17 00 00       	call   a51ee0 <efi_low_alloc>
  a50776:	48                   	dec    %eax
  a50777:	85 c0                	test   %eax,%eax
  a50779:	0f 85 79 02 00 00    	jne    a509f8 <make_boot_params+0x338>
  a5077f:	48                   	dec    %eax
  a50780:	8b 7c 24 10          	mov    0x10(%esp),%edi
  a50784:	ba 00 40 00 00       	mov    $0x4000,%edx
  a50789:	31 f6                	xor    %esi,%esi
  a5078b:	e8 a0 d4 ff ff       	call   a4dc30 <memset>
  a50790:	4c                   	dec    %esp
  a50791:	8b 44 24 18          	mov    0x18(%esp),%eax
  a50795:	48                   	dec    %eax
  a50796:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  a5079a:	41                   	inc    %ecx
  a5079b:	b9 01 00 00 00       	mov    $0x1,%ecx
  a507a0:	41                   	inc    %ecx
  a507a1:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  a507a6:	41                   	inc    %ecx
  a507a7:	bb 55 aa ff ff       	mov    $0xffffaa55,%ebx
  a507ac:	49                   	dec    %ecx
  a507ad:	8b 40 40             	mov    0x40(%eax),%eax
  a507b0:	48                   	dec    %eax
  a507b1:	8d bb 08 02 00 00    	lea    0x208(%ebx),%edi
  a507b7:	48                   	dec    %eax
  a507b8:	8d 8b 00 02 00 00    	lea    0x200(%ebx),%ecx
  a507be:	48                   	dec    %eax
  a507bf:	83 e7 f8             	and    $0xfffffff8,%edi
  a507c2:	48                   	dec    %eax
  a507c3:	8b 90 00 02 00 00    	mov    0x200(%eax),%edx
  a507c9:	48                   	dec    %eax
  a507ca:	29 f9                	sub    %edi,%ecx
  a507cc:	48                   	dec    %eax
  a507cd:	8d b0 00 02 00 00    	lea    0x200(%eax),%esi
  a507d3:	48                   	dec    %eax
  a507d4:	29 ce                	sub    %ecx,%esi
  a507d6:	81 c1 00 02 00 00    	add    $0x200,%ecx
  a507dc:	48                   	dec    %eax
  a507dd:	89 93 00 02 00 00    	mov    %edx,0x200(%ebx)
  a507e3:	c1 e9 03             	shr    $0x3,%ecx
  a507e6:	48                   	dec    %eax
  a507e7:	8b 80 f8 03 00 00    	mov    0x3f8(%eax),%eax
  a507ed:	48                   	dec    %eax
  a507ee:	8d 54 24 0c          	lea    0xc(%esp),%edx
  a507f2:	48                   	dec    %eax
  a507f3:	89 83 f8 03 00 00    	mov    %eax,0x3f8(%ebx)
  a507f9:	f3 48                	repz dec %eax
  a507fb:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  a507fc:	66 44                	inc    %sp
  a507fe:	89 8b f2 01 00 00    	mov    %ecx,0x1f2(%ebx)
  a50804:	4c                   	dec    %esp
  a50805:	89 c6                	mov    %eax,%esi
  a50807:	66 44                	inc    %sp
  a50809:	89 93 fa 01 00 00    	mov    %edx,0x1fa(%ebx)
  a5080f:	66 44                	inc    %sp
  a50811:	89 9b fe 01 00 00    	mov    %ebx,0x1fe(%ebx)
  a50817:	48                   	dec    %eax
  a50818:	8b 3d 6a d1 01 00    	mov    0x1d16a,%edi
  a5081e:	c6 83 10 02 00 00 21 	movb   $0x21,0x210(%ebx)
  a50825:	e8 c6 24 00 00       	call   a52cf0 <efi_convert_cmdline>
  a5082a:	48                   	dec    %eax
  a5082b:	89 c7                	mov    %eax,%edi
  a5082d:	48                   	dec    %eax
  a5082e:	85 c0                	test   %eax,%eax
  a50830:	0f 84 ab 00 00 00    	je     a508e1 <make_boot_params+0x221>
  a50836:	89 83 28 02 00 00    	mov    %eax,0x228(%ebx)
  a5083c:	48                   	dec    %eax
  a5083d:	89 c2                	mov    %eax,%edx
  a5083f:	48                   	dec    %eax
  a50840:	8b 44 24 10          	mov    0x10(%esp),%eax
  a50844:	48                   	dec    %eax
  a50845:	c1 ea 20             	shr    $0x20,%edx
  a50848:	89 90 c8 00 00 00    	mov    %edx,0xc8(%eax)
  a5084e:	48                   	dec    %eax
  a5084f:	c7 83 18 02 00 00 00 	movl   $0x0,0x218(%ebx)
  a50856:	00 00 00 
  a50859:	48                   	dec    %eax
  a5085a:	c7 43 40 00 00 00 00 	movl   $0x0,0x40(%ebx)
  a50861:	48                   	dec    %eax
  a50862:	c7 43 48 00 00 00 00 	movl   $0x0,0x48(%ebx)
  a50869:	c7 43 50 00 00 00 00 	movl   $0x0,0x50(%ebx)
  a50870:	e8 db 18 00 00       	call   a52150 <efi_parse_options>
  a50875:	48                   	dec    %eax
  a50876:	85 c0                	test   %eax,%eax
  a50878:	0f 85 6a 01 00 00    	jne    a509e8 <make_boot_params+0x328>
  a5087e:	48                   	dec    %eax
  a5087f:	8d 6c 24 20          	lea    0x20(%esp),%ebp
  a50883:	48                   	dec    %eax
  a50884:	83 ec 08             	sub    $0x8,%esp
  a50887:	44                   	inc    %esp
  a50888:	8b 83 2c 02 00 00    	mov    0x22c(%ebx),%eax
  a5088e:	8b 93 28 02 00 00    	mov    0x228(%ebx),%edx
  a50894:	4c                   	dec    %esp
  a50895:	8d 64 24 30          	lea    0x30(%esp),%esp
  a50899:	48                   	dec    %eax
  a5089a:	8b 3d e8 d0 01 00    	mov    0x1d0e8,%edi
  a508a0:	49                   	dec    %ecx
  a508a1:	89 e9                	mov    %ebp,%ecx
  a508a3:	48                   	dec    %eax
  a508a4:	8d 0d 85 40 00 00    	lea    0x4085,%ecx
  a508aa:	41                   	inc    %ecx
  a508ab:	54                   	push   %esp
  a508ac:	48                   	dec    %eax
  a508ad:	8b 74 24 28          	mov    0x28(%esp),%esi
  a508b1:	e8 fa 19 00 00       	call   a522b0 <handle_cmdline_files>
  a508b6:	5e                   	pop    %esi
  a508b7:	5f                   	pop    %edi
  a508b8:	48                   	dec    %eax
  a508b9:	85 c0                	test   %eax,%eax
  a508bb:	0f 84 b8 00 00 00    	je     a50979 <make_boot_params+0x2b9>
  a508c1:	48                   	dec    %eax
  a508c2:	8b 3d c0 d0 01 00    	mov    0x1d0c0,%edi
  a508c8:	f6 83 36 02 00 00 02 	testb  $0x2,0x236(%ebx)
  a508cf:	75 67                	jne    a50938 <make_boot_params+0x278>
  a508d1:	8b 93 28 02 00 00    	mov    0x228(%ebx),%edx
  a508d7:	48                   	dec    %eax
  a508d8:	63 74 24 0c          	arpl   %si,0xc(%esp)
  a508dc:	e8 ff 17 00 00       	call   a520e0 <efi_free>
  a508e1:	48                   	dec    %eax
  a508e2:	8b 54 24 10          	mov    0x10(%esp),%edx
  a508e6:	48                   	dec    %eax
  a508e7:	8b 3d 9b d0 01 00    	mov    0x1d09b,%edi
  a508ed:	be 00 40 00 00       	mov    $0x4000,%esi
  a508f2:	e8 e9 17 00 00       	call   a520e0 <efi_free>
  a508f7:	45                   	inc    %ebp
  a508f8:	31 c0                	xor    %eax,%eax
  a508fa:	48                   	dec    %eax
  a508fb:	83 c4 40             	add    $0x40,%esp
  a508fe:	4c                   	dec    %esp
  a508ff:	89 c0                	mov    %eax,%eax
  a50901:	5b                   	pop    %ebx
  a50902:	5d                   	pop    %ebp
  a50903:	41                   	inc    %ecx
  a50904:	5c                   	pop    %esp
  a50905:	c3                   	ret    
  a50906:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a5090d:	00 00 00 
  a50910:	48                   	dec    %eax
  a50911:	8b 50 58             	mov    0x58(%eax),%edx
  a50914:	48                   	dec    %eax
  a50915:	89 57 10             	mov    %edx,0x10(%edi)
  a50918:	48                   	dec    %eax
  a50919:	8b 50 60             	mov    0x60(%eax),%edx
  a5091c:	48                   	dec    %eax
  a5091d:	89 57 18             	mov    %edx,0x18(%edi)
  a50920:	48                   	dec    %eax
  a50921:	8b 40 40             	mov    0x40(%eax),%eax
  a50924:	48                   	dec    %eax
  a50925:	89 47 20             	mov    %eax,0x20(%edi)
  a50928:	48                   	dec    %eax
  a50929:	8b ba 98 00 00 00    	mov    0x98(%edx),%edi
  a5092f:	e9 0f fe ff ff       	jmp    a50743 <make_boot_params+0x83>
  a50934:	0f 1f 40 00          	nopl   0x0(%eax)
  a50938:	48                   	dec    %eax
  a50939:	8d 35 a1 3e 00 00    	lea    0x3ea1,%esi
  a5093f:	e8 5c 10 00 00       	call   a519a0 <efi_printk>
  a50944:	8b 93 28 02 00 00    	mov    0x228(%ebx),%edx
  a5094a:	48                   	dec    %eax
  a5094b:	8b 3d 37 d0 01 00    	mov    0x1d037,%edi
  a50951:	48                   	dec    %eax
  a50952:	8d 0d d7 3f 00 00    	lea    0x3fd7,%ecx
  a50958:	48                   	dec    %eax
  a50959:	83 ec 08             	sub    $0x8,%esp
  a5095c:	49                   	dec    %ecx
  a5095d:	89 e9                	mov    %ebp,%ecx
  a5095f:	49                   	dec    %ecx
  a50960:	c7 c0 ff ff ff ff    	mov    $0xffffffff,%eax
  a50966:	41                   	inc    %ecx
  a50967:	54                   	push   %esp
  a50968:	48                   	dec    %eax
  a50969:	8b 74 24 28          	mov    0x28(%esp),%esi
  a5096d:	e8 3e 19 00 00       	call   a522b0 <handle_cmdline_files>
  a50972:	5a                   	pop    %edx
  a50973:	59                   	pop    %ecx
  a50974:	48                   	dec    %eax
  a50975:	85 c0                	test   %eax,%eax
  a50977:	75 6f                	jne    a509e8 <make_boot_params+0x328>
  a50979:	48                   	dec    %eax
  a5097a:	8b 54 24 20          	mov    0x20(%esp),%edx
  a5097e:	48                   	dec    %eax
  a5097f:	8b 44 24 28          	mov    0x28(%esp),%eax
  a50983:	4c                   	dec    %esp
  a50984:	8b 44 24 10          	mov    0x10(%esp),%eax
  a50988:	89 93 18 02 00 00    	mov    %edx,0x218(%ebx)
  a5098e:	48                   	dec    %eax
  a5098f:	c1 ea 20             	shr    $0x20,%edx
  a50992:	89 83 1c 02 00 00    	mov    %eax,0x21c(%ebx)
  a50998:	48                   	dec    %eax
  a50999:	c1 e8 20             	shr    $0x20,%eax
  a5099c:	41                   	inc    %ecx
  a5099d:	89 80 c4 00 00 00    	mov    %eax,0xc4(%eax)
  a509a3:	4c                   	dec    %esp
  a509a4:	89 c0                	mov    %eax,%eax
  a509a6:	41                   	inc    %ecx
  a509a7:	89 90 c0 00 00 00    	mov    %edx,0xc0(%eax)
  a509ad:	48                   	dec    %eax
  a509ae:	83 c4 40             	add    $0x40,%esp
  a509b1:	5b                   	pop    %ebx
  a509b2:	5d                   	pop    %ebp
  a509b3:	41                   	inc    %ecx
  a509b4:	5c                   	pop    %esp
  a509b5:	c3                   	ret    
  a509b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a509bd:	00 00 00 
  a509c0:	48                   	dec    %eax
  a509c1:	8b 3d c1 cf 01 00    	mov    0x1cfc1,%edi
  a509c7:	48                   	dec    %eax
  a509c8:	8d 35 b2 3d 00 00    	lea    0x3db2,%esi
  a509ce:	e8 cd 0f 00 00       	call   a519a0 <efi_printk>
  a509d3:	45                   	inc    %ebp
  a509d4:	31 c0                	xor    %eax,%eax
  a509d6:	48                   	dec    %eax
  a509d7:	83 c4 40             	add    $0x40,%esp
  a509da:	4c                   	dec    %esp
  a509db:	89 c0                	mov    %eax,%eax
  a509dd:	5b                   	pop    %ebx
  a509de:	5d                   	pop    %ebp
  a509df:	41                   	inc    %ecx
  a509e0:	5c                   	pop    %esp
  a509e1:	c3                   	ret    
  a509e2:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a509e8:	48                   	dec    %eax
  a509e9:	8b 3d 99 cf 01 00    	mov    0x1cf99,%edi
  a509ef:	e9 dd fe ff ff       	jmp    a508d1 <make_boot_params+0x211>
  a509f4:	0f 1f 40 00          	nopl   0x0(%eax)
  a509f8:	48                   	dec    %eax
  a509f9:	8b 3d 89 cf 01 00    	mov    0x1cf89,%edi
  a509ff:	48                   	dec    %eax
  a50a00:	8d 35 aa 3d 00 00    	lea    0x3daa,%esi
  a50a06:	e8 95 0f 00 00       	call   a519a0 <efi_printk>
  a50a0b:	45                   	inc    %ebp
  a50a0c:	31 c0                	xor    %eax,%eax
  a50a0e:	48                   	dec    %eax
  a50a0f:	83 c4 40             	add    $0x40,%esp
  a50a12:	4c                   	dec    %esp
  a50a13:	89 c0                	mov    %eax,%eax
  a50a15:	5b                   	pop    %ebx
  a50a16:	5d                   	pop    %ebp
  a50a17:	41                   	inc    %ecx
  a50a18:	5c                   	pop    %esp
  a50a19:	c3                   	ret    
  a50a1a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

0000000000a50a20 <efi_main>:
  a50a20:	f3 0f 1e fa          	endbr64 
  a50a24:	41                   	inc    %ecx
  a50a25:	57                   	push   %edi
  a50a26:	41                   	inc    %ecx
  a50a27:	56                   	push   %esi
  a50a28:	41                   	inc    %ecx
  a50a29:	55                   	push   %ebp
  a50a2a:	41                   	inc    %ecx
  a50a2b:	54                   	push   %esp
  a50a2c:	55                   	push   %ebp
  a50a2d:	53                   	push   %ebx
  a50a2e:	48                   	dec    %eax
  a50a2f:	81 ec 18 01 00 00    	sub    $0x118,%esp
  a50a35:	48                   	dec    %eax
  a50a36:	8b 07                	mov    (%edi),%eax
  a50a38:	4c                   	dec    %esp
  a50a39:	8b 47 08             	mov    0x8(%edi),%eax
  a50a3c:	48                   	dec    %eax
  a50a3d:	89 3d 3d cf 01 00    	mov    %edi,0x1cf3d
  a50a43:	48                   	dec    %eax
  a50a44:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
  a50a4b:	00 
  a50a4c:	48                   	dec    %eax
  a50a4d:	89 44 24 30          	mov    %eax,0x30(%esp)
  a50a51:	48                   	dec    %eax
  a50a52:	b8 49 42 49 20       	mov    $0x20494249,%eax
  a50a57:	53                   	push   %ebx
  a50a58:	59                   	pop    %ecx
  a50a59:	53                   	push   %ebx
  a50a5a:	54                   	push   %esp
  a50a5b:	4c                   	dec    %esp
  a50a5c:	89 05 26 cf 01 00    	mov    %eax,0x1cf26
  a50a62:	49                   	dec    %ecx
  a50a63:	39 00                	cmp    %eax,(%eax)
  a50a65:	0f 85 ff 03 00 00    	jne    a50e6a <efi_main+0x44a>
  a50a6b:	80 7f 30 00          	cmpb   $0x0,0x30(%edi)
  a50a6f:	48                   	dec    %eax
  a50a70:	89 f3                	mov    %esi,%ebx
  a50a72:	0f 85 18 04 00 00    	jne    a50e90 <efi_main+0x470>
  a50a78:	41                   	inc    %ecx
  a50a79:	8b 40 38             	mov    0x38(%eax),%eax
  a50a7c:	48                   	dec    %eax
  a50a7d:	89 47 10             	mov    %eax,0x10(%edi)
  a50a80:	41                   	inc    %ecx
  a50a81:	8b 40 3c             	mov    0x3c(%eax),%eax
  a50a84:	48                   	dec    %eax
  a50a85:	89 47 18             	mov    %eax,0x18(%edi)
  a50a88:	41                   	inc    %ecx
  a50a89:	8b 40 2c             	mov    0x2c(%eax),%eax
  a50a8c:	48                   	dec    %eax
  a50a8d:	89 47 20             	mov    %eax,0x20(%edi)
  a50a90:	8b bb c8 00 00 00    	mov    0xc8(%ebx),%edi
  a50a96:	8b 83 28 02 00 00    	mov    0x228(%ebx),%eax
  a50a9c:	48                   	dec    %eax
  a50a9d:	c1 e7 20             	shl    $0x20,%edi
  a50aa0:	48                   	dec    %eax
  a50aa1:	09 c7                	or     %eax,%edi
  a50aa3:	e8 a8 16 00 00       	call   a52150 <efi_parse_options>
  a50aa8:	80 bb ec 01 00 00 00 	cmpb   $0x0,0x1ec(%ebx)
  a50aaf:	0f 84 ab 09 00 00    	je     a51460 <efi_main+0xa40>
  a50ab5:	48                   	dec    %eax
  a50ab6:	8b 3d cc ce 01 00    	mov    0x1cecc,%edi
  a50abc:	e8 cf 2f 00 00       	call   a53a90 <efi_enable_reset_attack_mitigation>
  a50ac1:	48                   	dec    %eax
  a50ac2:	8b 3d c0 ce 01 00    	mov    0x1cec0,%edi
  a50ac8:	e8 93 30 00 00       	call   a53b60 <efi_retrieve_tpm2_eventlog>
  a50acd:	48                   	dec    %eax
  a50ace:	89 df                	mov    %ebx,%edi
  a50ad0:	e8 2b f7 ff ff       	call   a50200 <setup_graphics>
  a50ad5:	48                   	dec    %eax
  a50ad6:	b8 00 b2 f5 4c       	mov    $0x4cf5b200,%eax
  a50adb:	b8 68 a5 4c 48       	mov    $0x484ca568,%eax
  a50ae0:	89 84 24 e0 00 00 00 	mov    %eax,0xe0(%esp)
  a50ae7:	48                   	dec    %eax
  a50ae8:	b8 9e ec b2 3e       	mov    $0x3eb2ec9e,%eax
  a50aed:	3f                   	aas    
  a50aee:	50                   	push   %eax
  a50aef:	02 9a 48 89 84 24    	add    0x24848948(%edx),%bl
  a50af5:	e8 00 00 00 48       	call   48a50afa <z_output_len+0x46a25082>
  a50afa:	8b 05 80 ce 01 00    	mov    0x1ce80,%eax
  a50b00:	48                   	dec    %eax
  a50b01:	c7 84 24 90 00 00 00 	movl   $0x0,0x90(%esp)
  a50b08:	00 00 00 00 
  a50b0c:	48                   	dec    %eax
  a50b0d:	c7 84 24 98 00 00 00 	movl   $0x0,0x98(%esp)
  a50b14:	00 00 00 00 
  a50b18:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a50b1c:	4c                   	dec    %esp
  a50b1d:	8b 50 28             	mov    0x28(%eax),%edx
  a50b20:	48                   	dec    %eax
  a50b21:	8b 40 18             	mov    0x18(%eax),%eax
  a50b24:	0f 84 a6 06 00 00    	je     a511d0 <efi_main+0x7b0>
  a50b2a:	48                   	dec    %eax
  a50b2b:	8b b8 b0 00 00 00    	mov    0xb0(%eax),%edi
  a50b31:	48                   	dec    %eax
  a50b32:	8d 84 24 98 00 00 00 	lea    0x98(%esp),%eax
  a50b39:	4c                   	dec    %esp
  a50b3a:	8d b4 24 e0 00 00 00 	lea    0xe0(%esp),%esi
  a50b41:	45                   	inc    %ebp
  a50b42:	31 c9                	xor    %ecx,%ecx
  a50b44:	31 c9                	xor    %ecx,%ecx
  a50b46:	48                   	dec    %eax
  a50b47:	89 44 24 20          	mov    %eax,0x20(%esp)
  a50b4b:	49                   	dec    %ecx
  a50b4c:	89 c0                	mov    %eax,%eax
  a50b4e:	4c                   	dec    %esp
  a50b4f:	89 f2                	mov    %esi,%edx
  a50b51:	be 02 00 00 00       	mov    $0x2,%esi
  a50b56:	31 c0                	xor    %eax,%eax
  a50b58:	41                   	inc    %ecx
  a50b59:	ff d2                	call   *%edx
  a50b5b:	48                   	dec    %eax
  a50b5c:	89 c5                	mov    %eax,%ebp
  a50b5e:	48                   	dec    %eax
  a50b5f:	b8 05 00 00 00       	mov    $0x5,%eax
  a50b64:	00 00                	add    %al,(%eax)
  a50b66:	00 80 48 39 c5 0f    	add    %al,0xfc53948(%eax)
  a50b6c:	84 c7                	test   %al,%bh
  a50b6e:	06                   	push   %es
  a50b6f:	00 00                	add    %al,(%eax)
  a50b71:	48                   	dec    %eax
  a50b72:	8b 05 08 ce 01 00    	mov    0x1ce08,%eax
  a50b78:	48                   	dec    %eax
  a50b79:	8b b4 24 90 00 00 00 	mov    0x90(%esp),%esi
  a50b80:	0f b6 48 30          	movzbl 0x30(%eax),%ecx
  a50b84:	4c                   	dec    %esp
  a50b85:	8b 40 28             	mov    0x28(%eax),%eax
  a50b88:	48                   	dec    %eax
  a50b89:	8b 50 18             	mov    0x18(%eax),%edx
  a50b8c:	48                   	dec    %eax
  a50b8d:	85 ed                	test   %ebp,%ebp
  a50b8f:	0f 85 d8 05 00 00    	jne    a5116d <efi_main+0x74d>
  a50b95:	4c                   	dec    %esp
  a50b96:	8b ab 50 02 00 00    	mov    0x250(%ebx),%ebp
  a50b9c:	4d                   	dec    %ebp
  a50b9d:	85 ed                	test   %ebp,%ebp
  a50b9f:	75 0a                	jne    a50bab <efi_main+0x18b>
  a50ba1:	eb 11                	jmp    a50bb4 <efi_main+0x194>
  a50ba3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a50ba8:	49                   	dec    %ecx
  a50ba9:	89 c5                	mov    %eax,%ebp
  a50bab:	49                   	dec    %ecx
  a50bac:	8b 45 00             	mov    0x0(%ebp),%eax
  a50baf:	48                   	dec    %eax
  a50bb0:	85 c0                	test   %eax,%eax
  a50bb2:	75 f4                	jne    a50ba8 <efi_main+0x188>
  a50bb4:	48                   	dec    %eax
  a50bb5:	8b 84 24 98 00 00 00 	mov    0x98(%esp),%eax
  a50bbc:	84 c9                	test   %cl,%cl
  a50bbe:	0f 84 cc 08 00 00    	je     a51490 <efi_main+0xa70>
  a50bc4:	48                   	dec    %eax
  a50bc5:	89 c7                	mov    %eax,%edi
  a50bc7:	48                   	dec    %eax
  a50bc8:	c1 ef 03             	shr    $0x3,%edi
  a50bcb:	48                   	dec    %eax
  a50bcc:	89 7c 24 10          	mov    %edi,0x10(%esp)
  a50bd0:	48                   	dec    %eax
  a50bd1:	83 f8 07             	cmp    $0x7,%eax
  a50bd4:	0f 86 d6 02 00 00    	jbe    a50eb0 <efi_main+0x490>
  a50bda:	48                   	dec    %eax
  a50bdb:	8d 84 24 b0 00 00 00 	lea    0xb0(%esp),%eax
  a50be2:	4c                   	dec    %esp
  a50be3:	89 6c 24 18          	mov    %ebp,0x18(%esp)
  a50be7:	4c                   	dec    %esp
  a50be8:	8d bc 24 a0 00 00 00 	lea    0xa0(%esp),%edi
  a50bef:	48                   	dec    %eax
  a50bf0:	89 44 24 28          	mov    %eax,0x28(%esp)
  a50bf4:	48                   	dec    %eax
  a50bf5:	89 5c 24 38          	mov    %ebx,0x38(%esp)
  a50bf9:	e9 2f 02 00 00       	jmp    a50e2d <efi_main+0x40d>
  a50bfe:	66 90                	xchg   %ax,%ax
  a50c00:	48                   	dec    %eax
  a50c01:	8b 34 ee             	mov    (%esi,%ebp,8),%esi
  a50c04:	48                   	dec    %eax
  a50c05:	8b ba 98 00 00 00    	mov    0x98(%edx),%edi
  a50c0b:	31 c0                	xor    %eax,%eax
  a50c0d:	4c                   	dec    %esp
  a50c0e:	89 f9                	mov    %edi,%ecx
  a50c10:	4c                   	dec    %esp
  a50c11:	89 f2                	mov    %esi,%edx
  a50c13:	41                   	inc    %ecx
  a50c14:	ff d0                	call   *%eax
  a50c16:	48                   	dec    %eax
  a50c17:	85 c0                	test   %eax,%eax
  a50c19:	0f 85 e4 01 00 00    	jne    a50e03 <efi_main+0x3e3>
  a50c1f:	48                   	dec    %eax
  a50c20:	8b 05 5a cd 01 00    	mov    0x1cd5a,%eax
  a50c26:	4c                   	dec    %esp
  a50c27:	8b a4 24 a0 00 00 00 	mov    0xa0(%esp),%esp
  a50c2e:	0f b6 48 30          	movzbl 0x30(%eax),%ecx
  a50c32:	4c                   	dec    %esp
  a50c33:	8b 40 28             	mov    0x28(%eax),%eax
  a50c36:	48                   	dec    %eax
  a50c37:	8b 50 18             	mov    0x18(%eax),%edx
  a50c3a:	4d                   	dec    %ebp
  a50c3b:	85 e4                	test   %esp,%esp
  a50c3d:	0f 84 d3 01 00 00    	je     a50e16 <efi_main+0x3f6>
  a50c43:	48                   	dec    %eax
  a50c44:	c7 84 24 b0 00 00 00 	movl   $0x0,0xb0(%esp)
  a50c4b:	00 00 00 00 
  a50c4f:	84 c9                	test   %cl,%cl
  a50c51:	0f 84 f9 04 00 00    	je     a51150 <efi_main+0x730>
  a50c57:	49                   	dec    %ecx
  a50c58:	8b 84 24 98 00 00 00 	mov    0x98(%esp),%eax
  a50c5f:	4d                   	dec    %ebp
  a50c60:	8b ac 24 90 00 00 00 	mov    0x90(%esp),%ebp
  a50c67:	48                   	dec    %eax
  a50c68:	89 44 24 08          	mov    %eax,0x8(%esp)
  a50c6c:	48                   	dec    %eax
  a50c6d:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  a50c72:	0f 84 9e 01 00 00    	je     a50e16 <efi_main+0x3f6>
  a50c78:	4d                   	dec    %ebp
  a50c79:	85 ed                	test   %ebp,%ebp
  a50c7b:	0f 84 95 01 00 00    	je     a50e16 <efi_main+0x3f6>
  a50c81:	49                   	dec    %ecx
  a50c82:	81 fd 00 00 00 01    	cmp    $0x1000000,%ebp
  a50c88:	0f 87 88 01 00 00    	ja     a50e16 <efi_main+0x3f6>
  a50c8e:	49                   	dec    %ecx
  a50c8f:	8d 5d 40             	lea    0x40(%ebp),%ebx
  a50c92:	84 c9                	test   %cl,%cl
  a50c94:	0f 84 e6 04 00 00    	je     a51180 <efi_main+0x760>
  a50c9a:	48                   	dec    %eax
  a50c9b:	8b 7a 40             	mov    0x40(%edx),%edi
  a50c9e:	31 c0                	xor    %eax,%eax
  a50ca0:	48                   	dec    %eax
  a50ca1:	8b 4c 24 28          	mov    0x28(%esp),%ecx
  a50ca5:	48                   	dec    %eax
  a50ca6:	89 da                	mov    %ebx,%edx
  a50ca8:	be 02 00 00 00       	mov    $0x2,%esi
  a50cad:	41                   	inc    %ecx
  a50cae:	ff d0                	call   *%eax
  a50cb0:	48                   	dec    %eax
  a50cb1:	85 c0                	test   %eax,%eax
  a50cb3:	0f 85 27 05 00 00    	jne    a511e0 <efi_main+0x7c0>
  a50cb9:	48                   	dec    %eax
  a50cba:	8b 94 24 b0 00 00 00 	mov    0xb0(%esp),%edx
  a50cc1:	83 eb 10             	sub    $0x10,%ebx
  a50cc4:	48                   	dec    %eax
  a50cc5:	8d 7a 08             	lea    0x8(%edx),%edi
  a50cc8:	48                   	dec    %eax
  a50cc9:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  a50ccf:	48                   	dec    %eax
  a50cd0:	83 e7 f8             	and    $0xfffffff8,%edi
  a50cd3:	48                   	dec    %eax
  a50cd4:	c7 42 38 00 00 00 00 	movl   $0x0,0x38(%edx)
  a50cdb:	48                   	dec    %eax
  a50cdc:	29 fa                	sub    %edi,%edx
  a50cde:	8d 4a 40             	lea    0x40(%edx),%ecx
  a50ce1:	c1 e9 03             	shr    $0x3,%ecx
  a50ce4:	f3 48                	repz dec %eax
  a50ce6:	ab                   	stos   %eax,%es:(%edi)
  a50ce7:	48                   	dec    %eax
  a50ce8:	8b 84 24 b0 00 00 00 	mov    0xb0(%esp),%eax
  a50cef:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  a50cf6:	89 58 0c             	mov    %ebx,0xc(%eax)
  a50cf9:	48                   	dec    %eax
  a50cfa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  a50d00:	48                   	dec    %eax
  a50d01:	8b 9c 24 b0 00 00 00 	mov    0xb0(%esp),%ebx
  a50d08:	49                   	dec    %ecx
  a50d09:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
  a50d10:	4c                   	dec    %esp
  a50d11:	8d 4b 10             	lea    0x10(%ebx),%ecx
  a50d14:	48                   	dec    %eax
  a50d15:	89 43 18             	mov    %eax,0x18(%ebx)
  a50d18:	48                   	dec    %eax
  a50d19:	8b 05 61 cc 01 00    	mov    0x1cc61,%eax
  a50d1f:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a50d23:	4c                   	dec    %esp
  a50d24:	8b 58 28             	mov    0x28(%eax),%ebx
  a50d27:	0f 84 d3 04 00 00    	je     a51200 <efi_main+0x7e0>
  a50d2d:	49                   	dec    %ecx
  a50d2e:	8b 7c 24 30          	mov    0x30(%esp),%edi
  a50d32:	31 c9                	xor    %ecx,%ecx
  a50d34:	31 c0                	xor    %eax,%eax
  a50d36:	41                   	inc    %ecx
  a50d37:	b8 01 00 00 00       	mov    $0x1,%eax
  a50d3c:	ba 01 00 00 00       	mov    $0x1,%edx
  a50d41:	4c                   	dec    %esp
  a50d42:	89 e6                	mov    %esp,%esi
  a50d44:	41                   	inc    %ecx
  a50d45:	ff d3                	call   *%ebx
  a50d47:	48                   	dec    %eax
  a50d48:	85 c0                	test   %eax,%eax
  a50d4a:	0f 85 f0 08 00 00    	jne    a51640 <efi_main+0xc20>
  a50d50:	48                   	dec    %eax
  a50d51:	8b 05 29 cc 01 00    	mov    0x1cc29,%eax
  a50d57:	48                   	dec    %eax
  a50d58:	8b b4 24 b0 00 00 00 	mov    0xb0(%esp),%esi
  a50d5f:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a50d63:	4c                   	dec    %esp
  a50d64:	8b 58 28             	mov    0x28(%eax),%ebx
  a50d67:	4c                   	dec    %esp
  a50d68:	8d 4e 12             	lea    0x12(%esi),%ecx
  a50d6b:	0f 84 b7 04 00 00    	je     a51228 <efi_main+0x808>
  a50d71:	49                   	dec    %ecx
  a50d72:	8b 7c 24 30          	mov    0x30(%esp),%edi
  a50d76:	31 c0                	xor    %eax,%eax
  a50d78:	41                   	inc    %ecx
  a50d79:	b8 01 00 00 00       	mov    $0x1,%eax
  a50d7e:	b9 02 00 00 00       	mov    $0x2,%ecx
  a50d83:	4c                   	dec    %esp
  a50d84:	89 e6                	mov    %esp,%esi
  a50d86:	ba 01 00 00 00       	mov    $0x1,%edx
  a50d8b:	41                   	inc    %ecx
  a50d8c:	ff d3                	call   *%ebx
  a50d8e:	48                   	dec    %eax
  a50d8f:	85 c0                	test   %eax,%eax
  a50d91:	0f 85 59 09 00 00    	jne    a516f0 <efi_main+0xcd0>
  a50d97:	48                   	dec    %eax
  a50d98:	8b 94 24 b0 00 00 00 	mov    0xb0(%esp),%edx
  a50d9f:	48                   	dec    %eax
  a50da0:	8b 05 da cb 01 00    	mov    0x1cbda,%eax
  a50da6:	4c                   	dec    %esp
  a50da7:	8d 4a 38             	lea    0x38(%edx),%ecx
  a50daa:	4c                   	dec    %esp
  a50dab:	8d 42 30             	lea    0x30(%edx),%eax
  a50dae:	4c                   	dec    %esp
  a50daf:	8b 58 28             	mov    0x28(%eax),%ebx
  a50db2:	48                   	dec    %eax
  a50db3:	8d 4a 28             	lea    0x28(%edx),%ecx
  a50db6:	48                   	dec    %eax
  a50db7:	83 c2 20             	add    $0x20,%edx
  a50dba:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a50dbe:	0f 84 ec 06 00 00    	je     a514b0 <efi_main+0xa90>
  a50dc4:	49                   	dec    %ecx
  a50dc5:	8b 7c 24 70          	mov    0x70(%esp),%edi
  a50dc9:	31 c0                	xor    %eax,%eax
  a50dcb:	4c                   	dec    %esp
  a50dcc:	89 e6                	mov    %esp,%esi
  a50dce:	41                   	inc    %ecx
  a50dcf:	ff d3                	call   *%ebx
  a50dd1:	48                   	dec    %eax
  a50dd2:	85 c0                	test   %eax,%eax
  a50dd4:	0f 84 26 03 00 00    	je     a51100 <efi_main+0x6e0>
  a50dda:	48                   	dec    %eax
  a50ddb:	8b 05 9f cb 01 00    	mov    0x1cb9f,%eax
  a50de1:	48                   	dec    %eax
  a50de2:	8b b4 24 b0 00 00 00 	mov    0xb0(%esp),%esi
  a50de9:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a50ded:	48                   	dec    %eax
  a50dee:	8b 50 28             	mov    0x28(%eax),%edx
  a50df1:	48                   	dec    %eax
  a50df2:	8b 48 18             	mov    0x18(%eax),%ecx
  a50df5:	0f 84 85 06 00 00    	je     a51480 <efi_main+0xa60>
  a50dfb:	48                   	dec    %eax
  a50dfc:	8b 79 48             	mov    0x48(%ecx),%edi
  a50dff:	31 c0                	xor    %eax,%eax
  a50e01:	ff d2                	call   *%edx
  a50e03:	48                   	dec    %eax
  a50e04:	8b 05 76 cb 01 00    	mov    0x1cb76,%eax
  a50e0a:	4c                   	dec    %esp
  a50e0b:	8b 40 28             	mov    0x28(%eax),%eax
  a50e0e:	0f b6 48 30          	movzbl 0x30(%eax),%ecx
  a50e12:	48                   	dec    %eax
  a50e13:	8b 50 18             	mov    0x18(%eax),%edx
  a50e16:	48                   	dec    %eax
  a50e17:	8b b4 24 90 00 00 00 	mov    0x90(%esp),%esi
  a50e1e:	48                   	dec    %eax
  a50e1f:	83 c5 01             	add    $0x1,%ebp
  a50e22:	48                   	dec    %eax
  a50e23:	3b 6c 24 10          	cmp    0x10(%esp),%ebp
  a50e27:	0f 83 3b 03 00 00    	jae    a51168 <efi_main+0x748>
  a50e2d:	48                   	dec    %eax
  a50e2e:	c7 84 24 a0 00 00 00 	movl   $0x0,0xa0(%esp)
  a50e35:	00 00 00 00 
  a50e39:	84 c9                	test   %cl,%cl
  a50e3b:	0f 85 bf fd ff ff    	jne    a50c00 <efi_main+0x1e0>
  a50e41:	8b 34 ae             	mov    (%esi,%ebp,4),%esi
  a50e44:	8b 7a 58             	mov    0x58(%edx),%edi
  a50e47:	e9 bf fd ff ff       	jmp    a50c0b <efi_main+0x1eb>
  a50e4c:	0f 1f 40 00          	nopl   0x0(%eax)
  a50e50:	48                   	dec    %eax
  a50e51:	8b 3d 31 cb 01 00    	mov    0x1cb31,%edi
  a50e57:	48                   	dec    %eax
  a50e58:	8d 35 5a 3a 00 00    	lea    0x3a5a,%esi
  a50e5e:	e8 3d 0b 00 00       	call   a519a0 <efi_printk>
  a50e63:	4c                   	dec    %esp
  a50e64:	8b 05 1e cb 01 00    	mov    0x1cb1e,%eax
  a50e6a:	48                   	dec    %eax
  a50e6b:	8d 35 fd 3a 00 00    	lea    0x3afd,%esi
  a50e71:	4c                   	dec    %esp
  a50e72:	89 c7                	mov    %eax,%edi
  a50e74:	e8 27 0b 00 00       	call   a519a0 <efi_printk>
  a50e79:	31 c0                	xor    %eax,%eax
  a50e7b:	48                   	dec    %eax
  a50e7c:	81 c4 18 01 00 00    	add    $0x118,%esp
  a50e82:	5b                   	pop    %ebx
  a50e83:	5d                   	pop    %ebp
  a50e84:	41                   	inc    %ecx
  a50e85:	5c                   	pop    %esp
  a50e86:	41                   	inc    %ecx
  a50e87:	5d                   	pop    %ebp
  a50e88:	41                   	inc    %ecx
  a50e89:	5e                   	pop    %esi
  a50e8a:	41                   	inc    %ecx
  a50e8b:	5f                   	pop    %edi
  a50e8c:	c3                   	ret    
  a50e8d:	0f 1f 00             	nopl   (%eax)
  a50e90:	49                   	dec    %ecx
  a50e91:	8b 40 58             	mov    0x58(%eax),%eax
  a50e94:	48                   	dec    %eax
  a50e95:	89 47 10             	mov    %eax,0x10(%edi)
  a50e98:	49                   	dec    %ecx
  a50e99:	8b 40 60             	mov    0x60(%eax),%eax
  a50e9c:	48                   	dec    %eax
  a50e9d:	89 47 18             	mov    %eax,0x18(%edi)
  a50ea0:	49                   	dec    %ecx
  a50ea1:	8b 40 40             	mov    0x40(%eax),%eax
  a50ea4:	48                   	dec    %eax
  a50ea5:	89 47 20             	mov    %eax,0x20(%edi)
  a50ea8:	e9 e3 fb ff ff       	jmp    a50a90 <efi_main+0x70>
  a50ead:	0f 1f 00             	nopl   (%eax)
  a50eb0:	48                   	dec    %eax
  a50eb1:	8b 7a 48             	mov    0x48(%edx),%edi
  a50eb4:	31 c0                	xor    %eax,%eax
  a50eb6:	41                   	inc    %ecx
  a50eb7:	ff d0                	call   *%eax
  a50eb9:	48                   	dec    %eax
  a50eba:	8b 05 c0 ca 01 00    	mov    0x1cac0,%eax
  a50ec0:	48                   	dec    %eax
  a50ec1:	8b 0d c1 ca 01 00    	mov    0x1cac1,%ecx
  a50ec7:	0f b6 50 30          	movzbl 0x30(%eax),%edx
  a50ecb:	84 d2                	test   %dl,%dl
  a50ecd:	0f 84 cd 02 00 00    	je     a511a0 <efi_main+0x780>
  a50ed3:	48                   	dec    %eax
  a50ed4:	8b 49 18             	mov    0x18(%ecx),%ecx
  a50ed7:	48                   	dec    %eax
  a50ed8:	8b 35 a2 33 00 00    	mov    0x33a2,%esi
  a50ede:	48                   	dec    %eax
  a50edf:	39 31                	cmp    %esi,(%ecx)
  a50ee1:	0f 84 cc 02 00 00    	je     a511b3 <efi_main+0x793>
  a50ee7:	b9 01 00 00 00       	mov    $0x1,%ecx
  a50eec:	4c                   	dec    %esp
  a50eed:	8b 40 28             	mov    0x28(%eax),%eax
  a50ef0:	48                   	dec    %eax
  a50ef1:	8b 40 18             	mov    0x18(%eax),%eax
  a50ef4:	85 c9                	test   %ecx,%ecx
  a50ef6:	0f 84 c4 03 00 00    	je     a512c0 <efi_main+0x8a0>
  a50efc:	84 d2                	test   %dl,%dl
  a50efe:	0f 84 8c 02 00 00    	je     a51190 <efi_main+0x770>
  a50f04:	48                   	dec    %eax
  a50f05:	8b 78 40             	mov    0x40(%eax),%edi
  a50f08:	31 c0                	xor    %eax,%eax
  a50f0a:	48                   	dec    %eax
  a50f0b:	8d 4c 24 48          	lea    0x48(%esp),%ecx
  a50f0f:	ba 0a 00 00 00       	mov    $0xa,%edx
  a50f14:	be 02 00 00 00       	mov    $0x2,%esi
  a50f19:	41                   	inc    %ecx
  a50f1a:	ff d0                	call   *%eax
  a50f1c:	48                   	dec    %eax
  a50f1d:	85 c0                	test   %eax,%eax
  a50f1f:	0f 85 2b ff ff ff    	jne    a50e50 <efi_main+0x430>
  a50f25:	48                   	dec    %eax
  a50f26:	8b 44 24 48          	mov    0x48(%esp),%eax
  a50f2a:	ba 00 08 00 00       	mov    $0x800,%edx
  a50f2f:	48                   	dec    %eax
  a50f30:	8b 3d 52 ca 01 00    	mov    0x1ca52,%edi
  a50f36:	66 89 10             	mov    %dx,(%eax)
  a50f39:	48                   	dec    %eax
  a50f3a:	8b 44 24 48          	mov    0x48(%esp),%eax
  a50f3e:	ba 08 00 00 00       	mov    $0x8,%edx
  a50f43:	0f b7 30             	movzwl (%eax),%esi
  a50f46:	48                   	dec    %eax
  a50f47:	8d 48 02             	lea    0x2(%eax),%ecx
  a50f4a:	e8 91 0f 00 00       	call   a51ee0 <efi_low_alloc>
  a50f4f:	48                   	dec    %eax
  a50f50:	85 c0                	test   %eax,%eax
  a50f52:	0f 85 68 08 00 00    	jne    a517c0 <efi_main+0xda0>
  a50f58:	4c                   	dec    %esp
  a50f59:	8b 83 58 02 00 00    	mov    0x258(%ebx),%eax
  a50f5f:	8b 83 14 02 00 00    	mov    0x214(%ebx),%eax
  a50f65:	48                   	dec    %eax
  a50f66:	8b 3d 1c ca 01 00    	mov    0x1ca1c,%edi
  a50f6c:	49                   	dec    %ecx
  a50f6d:	39 c0                	cmp    %eax,%eax
  a50f6f:	74 4b                	je     a50fbc <efi_main+0x59c>
  a50f71:	8b 93 60 02 00 00    	mov    0x260(%ebx),%edx
  a50f77:	44                   	inc    %esp
  a50f78:	8b 8b 30 02 00 00    	mov    0x230(%ebx),%ecx
  a50f7e:	4c                   	dec    %esp
  a50f7f:	89 f6                	mov    %esi,%esi
  a50f81:	48                   	dec    %eax
  a50f82:	89 84 24 e0 00 00 00 	mov    %eax,0xe0(%esp)
  a50f89:	48                   	dec    %eax
  a50f8a:	89 d1                	mov    %edx,%ecx
  a50f8c:	e8 0f 1c 00 00       	call   a52ba0 <efi_relocate_kernel>
  a50f91:	48                   	dec    %eax
  a50f92:	85 c0                	test   %eax,%eax
  a50f94:	0f 85 9e 08 00 00    	jne    a51838 <efi_main+0xe18>
  a50f9a:	8b 83 14 02 00 00    	mov    0x214(%ebx),%eax
  a50fa0:	48                   	dec    %eax
  a50fa1:	8b 3d e1 c9 01 00    	mov    0x1c9e1,%edi
  a50fa7:	48                   	dec    %eax
  a50fa8:	89 83 58 02 00 00    	mov    %eax,0x258(%ebx)
  a50fae:	48                   	dec    %eax
  a50faf:	8b 84 24 e0 00 00 00 	mov    0xe0(%esp),%eax
  a50fb6:	89 83 14 02 00 00    	mov    %eax,0x214(%ebx)
  a50fbc:	48                   	dec    %eax
  a50fbd:	8d 44 24 70          	lea    0x70(%esp),%eax
  a50fc1:	4c                   	dec    %esp
  a50fc2:	89 f6                	mov    %esi,%esi
  a50fc4:	48                   	dec    %eax
  a50fc5:	c7 44 24 78 00 00 00 	movl   $0x0,0x78(%esp)
  a50fcc:	00 
  a50fcd:	48                   	dec    %eax
  a50fce:	89 84 24 b0 00 00 00 	mov    %eax,0xb0(%esp)
  a50fd5:	48                   	dec    %eax
  a50fd6:	8d 44 24 50          	lea    0x50(%esp),%eax
  a50fda:	48                   	dec    %eax
  a50fdb:	89 84 24 b8 00 00 00 	mov    %eax,0xb8(%esp)
  a50fe2:	48                   	dec    %eax
  a50fe3:	8d 44 24 60          	lea    0x60(%esp),%eax
  a50fe7:	48                   	dec    %eax
  a50fe8:	89 84 24 c0 00 00 00 	mov    %eax,0xc0(%esp)
  a50fef:	48                   	dec    %eax
  a50ff0:	8d 44 24 44          	lea    0x44(%esp),%eax
  a50ff4:	48                   	dec    %eax
  a50ff5:	89 84 24 c8 00 00 00 	mov    %eax,0xc8(%esp)
  a50ffc:	48                   	dec    %eax
  a50ffd:	8d 44 24 58          	lea    0x58(%esp),%eax
  a51001:	48                   	dec    %eax
  a51002:	89 84 24 d0 00 00 00 	mov    %eax,0xd0(%esp)
  a51009:	48                   	dec    %eax
  a5100a:	8d 44 24 68          	lea    0x68(%esp),%eax
  a5100e:	48                   	dec    %eax
  a5100f:	89 84 24 d8 00 00 00 	mov    %eax,0xd8(%esp)
  a51016:	48                   	dec    %eax
  a51017:	8d 83 c0 01 00 00    	lea    0x1c0(%ebx),%eax
  a5101d:	48                   	dec    %eax
  a5101e:	89 84 24 a8 00 00 00 	mov    %eax,0xa8(%esp)
  a51025:	48                   	dec    %eax
  a51026:	8b 44 24 20          	mov    0x20(%esp),%eax
  a5102a:	48                   	dec    %eax
  a5102b:	89 9c 24 a0 00 00 00 	mov    %ebx,0xa0(%esp)
  a51032:	48                   	dec    %eax
  a51033:	89 84 24 e0 00 00 00 	mov    %eax,0xe0(%esp)
  a5103a:	48                   	dec    %eax
  a5103b:	8d 84 24 80 00 00 00 	lea    0x80(%esp),%eax
  a51042:	48                   	dec    %eax
  a51043:	89 84 24 e8 00 00 00 	mov    %eax,0xe8(%esp)
  a5104a:	48                   	dec    %eax
  a5104b:	8d 84 24 88 00 00 00 	lea    0x88(%esp),%eax
  a51052:	48                   	dec    %eax
  a51053:	89 84 24 f0 00 00 00 	mov    %eax,0xf0(%esp)
  a5105a:	48                   	dec    %eax
  a5105b:	8d 84 24 90 00 00 00 	lea    0x90(%esp),%eax
  a51062:	48                   	dec    %eax
  a51063:	c7 84 24 f8 00 00 00 	movl   $0x0,0xf8(%esp)
  a5106a:	00 00 00 00 
  a5106e:	48                   	dec    %eax
  a5106f:	c7 84 24 00 01 00 00 	movl   $0x0,0x100(%esp)
  a51076:	00 00 00 00 
  a5107a:	48                   	dec    %eax
  a5107b:	89 84 24 08 01 00 00 	mov    %eax,0x108(%esp)
  a51082:	e8 a9 09 00 00       	call   a51a30 <efi_get_memory_map>
  a51087:	48                   	dec    %eax
  a51088:	85 c0                	test   %eax,%eax
  a5108a:	75 50                	jne    a510dc <efi_main+0x6bc>
  a5108c:	48                   	dec    %eax
  a5108d:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
  a51094:	31 d2                	xor    %edx,%edx
  a51096:	31 ed                	xor    %ebp,%ebp
  a51098:	48                   	dec    %eax
  a51099:	f7 b4 24 88 00 00 00 	divl   0x88(%esp)
  a510a0:	3d 80 00 00 00       	cmp    $0x80,%eax
  a510a5:	0f 87 bd 05 00 00    	ja     a51668 <efi_main+0xc48>
  a510ab:	48                   	dec    %eax
  a510ac:	8b 74 24 30          	mov    0x30(%esp),%esi
  a510b0:	48                   	dec    %eax
  a510b1:	8b 3d d1 c8 01 00    	mov    0x1c8d1,%edi
  a510b7:	48                   	dec    %eax
  a510b8:	8d 8c 24 a0 00 00 00 	lea    0xa0(%esp),%ecx
  a510bf:	48                   	dec    %eax
  a510c0:	8d 94 24 b0 00 00 00 	lea    0xb0(%esp),%edx
  a510c7:	4c                   	dec    %esp
  a510c8:	8d 05 72 f0 ff ff    	lea    0xfffff072,%eax
  a510ce:	e8 7d 1e 00 00       	call   a52f50 <efi_exit_boot_services>
  a510d3:	48                   	dec    %eax
  a510d4:	85 c0                	test   %eax,%eax
  a510d6:	0f 84 f4 03 00 00    	je     a514d0 <efi_main+0xab0>
  a510dc:	48                   	dec    %eax
  a510dd:	8b 3d a5 c8 01 00    	mov    0x1c8a5,%edi
  a510e3:	48                   	dec    %eax
  a510e4:	8d 35 98 38 00 00    	lea    0x3898,%esi
  a510ea:	e8 b1 08 00 00       	call   a519a0 <efi_printk>
  a510ef:	4c                   	dec    %esp
  a510f0:	8b 05 92 c8 01 00    	mov    0x1c892,%eax
  a510f6:	e9 6f fd ff ff       	jmp    a50e6a <efi_main+0x44a>
  a510fb:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a51100:	48                   	dec    %eax
  a51101:	8b 84 24 b0 00 00 00 	mov    0xb0(%esp),%eax
  a51108:	48                   	dec    %eax
  a51109:	8b 74 24 08          	mov    0x8(%esp),%esi
  a5110d:	4c                   	dec    %esp
  a5110e:	89 ea                	mov    %ebp,%edx
  a51110:	48                   	dec    %eax
  a51111:	8d 78 40             	lea    0x40(%eax),%edi
  a51114:	e8 a7 cb ff ff       	call   a4dcc0 <memcpy>
  a51119:	48                   	dec    %eax
  a5111a:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  a5111f:	0f 84 eb 00 00 00    	je     a51210 <efi_main+0x7f0>
  a51125:	48                   	dec    %eax
  a51126:	8b 44 24 18          	mov    0x18(%esp),%eax
  a5112a:	48                   	dec    %eax
  a5112b:	89 18                	mov    %ebx,(%eax)
  a5112d:	48                   	dec    %eax
  a5112e:	8b 05 4c c8 01 00    	mov    0x1c84c,%eax
  a51134:	48                   	dec    %eax
  a51135:	89 5c 24 18          	mov    %ebx,0x18(%esp)
  a51139:	4c                   	dec    %esp
  a5113a:	8b 40 28             	mov    0x28(%eax),%eax
  a5113d:	0f b6 48 30          	movzbl 0x30(%eax),%ecx
  a51141:	48                   	dec    %eax
  a51142:	8b 50 18             	mov    0x18(%eax),%edx
  a51145:	e9 cc fc ff ff       	jmp    a50e16 <efi_main+0x3f6>
  a5114a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a51150:	41                   	inc    %ecx
  a51151:	8b 44 24 50          	mov    0x50(%esp),%eax
  a51155:	4d                   	dec    %ebp
  a51156:	8b 6c 24 48          	mov    0x48(%esp),%ebp
  a5115a:	48                   	dec    %eax
  a5115b:	89 44 24 08          	mov    %eax,0x8(%esp)
  a5115f:	e9 08 fb ff ff       	jmp    a50c6c <efi_main+0x24c>
  a51164:	0f 1f 40 00          	nopl   0x0(%eax)
  a51168:	48                   	dec    %eax
  a51169:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  a5116d:	84 c9                	test   %cl,%cl
  a5116f:	0f 85 3b fd ff ff    	jne    a50eb0 <efi_main+0x490>
  a51175:	8b 7a 30             	mov    0x30(%edx),%edi
  a51178:	e9 37 fd ff ff       	jmp    a50eb4 <efi_main+0x494>
  a5117d:	0f 1f 00             	nopl   (%eax)
  a51180:	8b 7a 2c             	mov    0x2c(%edx),%edi
  a51183:	e9 16 fb ff ff       	jmp    a50c9e <efi_main+0x27e>
  a51188:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5118f:	00 
  a51190:	8b 78 2c             	mov    0x2c(%eax),%edi
  a51193:	e9 70 fd ff ff       	jmp    a50f08 <efi_main+0x4e8>
  a51198:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5119f:	00 
  a511a0:	8b 49 18             	mov    0x18(%ecx),%ecx
  a511a3:	48                   	dec    %eax
  a511a4:	8b 35 d6 30 00 00    	mov    0x30d6,%esi
  a511aa:	48                   	dec    %eax
  a511ab:	39 31                	cmp    %esi,(%ecx)
  a511ad:	0f 85 34 fd ff ff    	jne    a50ee7 <efi_main+0x4c7>
  a511b3:	8b 35 cf 30 00 00    	mov    0x30cf,%esi
  a511b9:	39 71 08             	cmp    %esi,0x8(%ecx)
  a511bc:	0f 85 25 fd ff ff    	jne    a50ee7 <efi_main+0x4c7>
  a511c2:	31 c9                	xor    %ecx,%ecx
  a511c4:	e9 23 fd ff ff       	jmp    a50eec <efi_main+0x4cc>
  a511c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a511d0:	8b 78 64             	mov    0x64(%eax),%edi
  a511d3:	e9 59 f9 ff ff       	jmp    a50b31 <efi_main+0x111>
  a511d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a511df:	00 
  a511e0:	48                   	dec    %eax
  a511e1:	8b 3d a1 c7 01 00    	mov    0x1c7a1,%edi
  a511e7:	48                   	dec    %eax
  a511e8:	8d 35 4a 36 00 00    	lea    0x364a,%esi
  a511ee:	e8 ad 07 00 00       	call   a519a0 <efi_printk>
  a511f3:	e9 0b fc ff ff       	jmp    a50e03 <efi_main+0x3e3>
  a511f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a511ff:	00 
  a51200:	41                   	inc    %ecx
  a51201:	8b 7c 24 18          	mov    0x18(%esp),%edi
  a51205:	e9 28 fb ff ff       	jmp    a50d32 <efi_main+0x312>
  a5120a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a51210:	48                   	dec    %eax
  a51211:	8b 44 24 38          	mov    0x38(%esp),%eax
  a51215:	48                   	dec    %eax
  a51216:	89 98 50 02 00 00    	mov    %ebx,0x250(%eax)
  a5121c:	e9 0c ff ff ff       	jmp    a5112d <efi_main+0x70d>
  a51221:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a51228:	41                   	inc    %ecx
  a51229:	8b 7c 24 18          	mov    0x18(%esp),%edi
  a5122d:	e9 44 fb ff ff       	jmp    a50d76 <efi_main+0x356>
  a51232:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a51238:	48                   	dec    %eax
  a51239:	8b 05 41 c7 01 00    	mov    0x1c741,%eax
  a5123f:	48                   	dec    %eax
  a51240:	8b 94 24 98 00 00 00 	mov    0x98(%esp),%edx
  a51247:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a5124b:	4c                   	dec    %esp
  a5124c:	8b 40 28             	mov    0x28(%eax),%eax
  a5124f:	48                   	dec    %eax
  a51250:	8b 48 18             	mov    0x18(%eax),%ecx
  a51253:	0f 85 67 02 00 00    	jne    a514c0 <efi_main+0xaa0>
  a51259:	8b 79 2c             	mov    0x2c(%ecx),%edi
  a5125c:	31 c0                	xor    %eax,%eax
  a5125e:	48                   	dec    %eax
  a5125f:	8d 8c 24 90 00 00 00 	lea    0x90(%esp),%ecx
  a51266:	be 02 00 00 00       	mov    $0x2,%esi
  a5126b:	41                   	inc    %ecx
  a5126c:	ff d0                	call   *%eax
  a5126e:	48                   	dec    %eax
  a5126f:	85 c0                	test   %eax,%eax
  a51271:	0f 85 91 05 00 00    	jne    a51808 <efi_main+0xde8>
  a51277:	48                   	dec    %eax
  a51278:	8b 05 02 c7 01 00    	mov    0x1c702,%eax
  a5127e:	4c                   	dec    %esp
  a5127f:	8b 8c 24 90 00 00 00 	mov    0x90(%esp),%ecx
  a51286:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a5128a:	4c                   	dec    %esp
  a5128b:	8b 50 28             	mov    0x28(%eax),%edx
  a5128e:	48                   	dec    %eax
  a5128f:	8b 50 18             	mov    0x18(%eax),%edx
  a51292:	0f 84 78 04 00 00    	je     a51710 <efi_main+0xcf0>
  a51298:	48                   	dec    %eax
  a51299:	8b ba b0 00 00 00    	mov    0xb0(%edx),%edi
  a5129f:	4c                   	dec    %esp
  a512a0:	8b 44 24 20          	mov    0x20(%esp),%eax
  a512a4:	31 c9                	xor    %ecx,%ecx
  a512a6:	4c                   	dec    %esp
  a512a7:	89 f2                	mov    %esi,%edx
  a512a9:	be 02 00 00 00       	mov    $0x2,%esi
  a512ae:	31 c0                	xor    %eax,%eax
  a512b0:	41                   	inc    %ecx
  a512b1:	ff d2                	call   *%edx
  a512b3:	48                   	dec    %eax
  a512b4:	89 c5                	mov    %eax,%ebp
  a512b6:	e9 b6 f8 ff ff       	jmp    a50b71 <efi_main+0x151>
  a512bb:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a512c0:	48                   	dec    %eax
  a512c1:	be fe 12 bd 91       	mov    $0x91bd12fe,%esi
  a512c6:	c3                   	ret    
  a512c7:	f6 fb                	idiv   %bl
  a512c9:	44                   	inc    %esp
  a512ca:	48                   	dec    %eax
  a512cb:	b9 a5 b7 51 22       	mov    $0x2251b7a5,%ecx
  a512d0:	ab                   	stos   %eax,%es:(%edi)
  a512d1:	30 3a                	xor    %bh,(%edx)
  a512d3:	e0 c7                	loopne a5129c <efi_main+0x87c>
  a512d5:	84 24 98             	test   %ah,(%eax,%ebx,4)
  a512d8:	00 00                	add    %al,(%eax)
  a512da:	00 00                	add    %al,(%eax)
  a512dc:	00 00                	add    %al,(%eax)
  a512de:	00 48 89             	add    %cl,-0x77(%eax)
  a512e1:	b4 24                	mov    $0x24,%ah
  a512e3:	e0 00                	loopne a512e5 <efi_main+0x8c5>
  a512e5:	00 00                	add    %al,(%eax)
  a512e7:	48                   	dec    %eax
  a512e8:	89 8c 24 e8 00 00 00 	mov    %ecx,0xe8(%esp)
  a512ef:	84 d2                	test   %dl,%dl
  a512f1:	0f 85 b9 02 00 00    	jne    a515b0 <efi_main+0xb90>
  a512f7:	8b b8 ac 00 00 00    	mov    0xac(%eax),%edi
  a512fd:	31 d2                	xor    %edx,%edx
  a512ff:	31 c0                	xor    %eax,%eax
  a51301:	48                   	dec    %eax
  a51302:	8d 8c 24 b0 00 00 00 	lea    0xb0(%esp),%ecx
  a51309:	4c                   	dec    %esp
  a5130a:	89 f6                	mov    %esi,%esi
  a5130c:	41                   	inc    %ecx
  a5130d:	ff d0                	call   *%eax
  a5130f:	48                   	dec    %eax
  a51310:	85 c0                	test   %eax,%eax
  a51312:	0f 85 28 01 00 00    	jne    a51440 <efi_main+0xa20>
  a51318:	48                   	dec    %eax
  a51319:	8b 05 61 c6 01 00    	mov    0x1c661,%eax
  a5131f:	48                   	dec    %eax
  a51320:	8b b4 24 b0 00 00 00 	mov    0xb0(%esp),%esi
  a51327:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a5132b:	0f 84 6f 04 00 00    	je     a517a0 <efi_main+0xd80>
  a51331:	48                   	dec    %eax
  a51332:	81 3e 00 00 01 00    	cmpl   $0x10000,(%esi)
  a51338:	0f 85 63 05 00 00    	jne    a518a1 <efi_main+0xe81>
  a5133e:	4c                   	dec    %esp
  a5133f:	8b 40 28             	mov    0x28(%eax),%eax
  a51342:	48                   	dec    %eax
  a51343:	8b 7e 20             	mov    0x20(%esi),%edi
  a51346:	4c                   	dec    %esp
  a51347:	8b 6c 24 20          	mov    0x20(%esp),%ebp
  a5134b:	31 d2                	xor    %edx,%edx
  a5134d:	31 c0                	xor    %eax,%eax
  a5134f:	4c                   	dec    %esp
  a51350:	89 e9                	mov    %ebp,%ecx
  a51352:	41                   	inc    %ecx
  a51353:	ff d0                	call   *%eax
  a51355:	8b 94 24 98 00 00 00 	mov    0x98(%esp),%edx
  a5135c:	85 d2                	test   %edx,%edx
  a5135e:	0f 84 dc 00 00 00    	je     a51440 <efi_main+0xa20>
  a51364:	4c                   	dec    %esp
  a51365:	8d a4 24 a0 00 00 00 	lea    0xa0(%esp),%esp
  a5136c:	48                   	dec    %eax
  a5136d:	bd 05 00 00 00       	mov    $0x5,%ebp
  a51372:	00 00                	add    %al,(%eax)
  a51374:	00 80 48 8b 05 03    	add    %al,0x3058b48(%eax)
  a5137a:	c6 01 00             	movb   $0x0,(%ecx)
  a5137d:	48                   	dec    %eax
  a5137e:	83 c2 10             	add    $0x10,%edx
  a51381:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a51385:	4c                   	dec    %esp
  a51386:	8b 40 28             	mov    0x28(%eax),%eax
  a51389:	48                   	dec    %eax
  a5138a:	8b 48 18             	mov    0x18(%eax),%ecx
  a5138d:	0f 84 2d 02 00 00    	je     a515c0 <efi_main+0xba0>
  a51393:	48                   	dec    %eax
  a51394:	8b 79 40             	mov    0x40(%ecx),%edi
  a51397:	31 c0                	xor    %eax,%eax
  a51399:	4c                   	dec    %esp
  a5139a:	89 e1                	mov    %esp,%ecx
  a5139c:	be 02 00 00 00       	mov    $0x2,%esi
  a513a1:	41                   	inc    %ecx
  a513a2:	ff d0                	call   *%eax
  a513a4:	48                   	dec    %eax
  a513a5:	85 c0                	test   %eax,%eax
  a513a7:	0f 85 73 04 00 00    	jne    a51820 <efi_main+0xe00>
  a513ad:	48                   	dec    %eax
  a513ae:	8b 05 cc c5 01 00    	mov    0x1c5cc,%eax
  a513b4:	48                   	dec    %eax
  a513b5:	8b b4 24 a0 00 00 00 	mov    0xa0(%esp),%esi
  a513bc:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a513c0:	48                   	dec    %eax
  a513c1:	8d 56 10             	lea    0x10(%esi),%edx
  a513c4:	4c                   	dec    %esp
  a513c5:	8b 40 28             	mov    0x28(%eax),%eax
  a513c8:	48                   	dec    %eax
  a513c9:	8b b4 24 b0 00 00 00 	mov    0xb0(%esp),%esi
  a513d0:	0f 84 fa 01 00 00    	je     a515d0 <efi_main+0xbb0>
  a513d6:	31 c0                	xor    %eax,%eax
  a513d8:	48                   	dec    %eax
  a513d9:	8b 7e 20             	mov    0x20(%esi),%edi
  a513dc:	4c                   	dec    %esp
  a513dd:	89 e9                	mov    %ebp,%ecx
  a513df:	41                   	inc    %ecx
  a513e0:	ff d0                	call   *%eax
  a513e2:	48                   	dec    %eax
  a513e3:	39 e8                	cmp    %ebp,%eax
  a513e5:	0f 84 f9 01 00 00    	je     a515e4 <efi_main+0xbc4>
  a513eb:	48                   	dec    %eax
  a513ec:	8b 84 24 a0 00 00 00 	mov    0xa0(%esp),%eax
  a513f3:	c7 40 08 05 00 00 00 	movl   $0x5,0x8(%eax)
  a513fa:	8b 94 24 98 00 00 00 	mov    0x98(%esp),%edx
  a51401:	48                   	dec    %eax
  a51402:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  a51408:	89 50 0c             	mov    %edx,0xc(%eax)
  a5140b:	48                   	dec    %eax
  a5140c:	8b 93 50 02 00 00    	mov    0x250(%ebx),%edx
  a51412:	48                   	dec    %eax
  a51413:	85 d2                	test   %edx,%edx
  a51415:	0f 84 d6 03 00 00    	je     a517f1 <efi_main+0xdd1>
  a5141b:	48                   	dec    %eax
  a5141c:	8b 02                	mov    (%edx),%eax
  a5141e:	48                   	dec    %eax
  a5141f:	85 c0                	test   %eax,%eax
  a51421:	74 10                	je     a51433 <efi_main+0xa13>
  a51423:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a51428:	48                   	dec    %eax
  a51429:	89 c2                	mov    %eax,%edx
  a5142b:	48                   	dec    %eax
  a5142c:	8b 00                	mov    (%eax),%eax
  a5142e:	48                   	dec    %eax
  a5142f:	85 c0                	test   %eax,%eax
  a51431:	75 f5                	jne    a51428 <efi_main+0xa08>
  a51433:	48                   	dec    %eax
  a51434:	8b 84 24 a0 00 00 00 	mov    0xa0(%esp),%eax
  a5143b:	48                   	dec    %eax
  a5143c:	89 02                	mov    %eax,(%edx)
  a5143e:	66 90                	xchg   %ax,%ax
  a51440:	48                   	dec    %eax
  a51441:	8b 15 39 c5 01 00    	mov    0x1c539,%edx
  a51447:	4c                   	dec    %esp
  a51448:	8b 42 28             	mov    0x28(%edx),%eax
  a5144b:	48                   	dec    %eax
  a5144c:	8b 42 18             	mov    0x18(%edx),%eax
  a5144f:	0f b6 52 30          	movzbl 0x30(%edx),%edx
  a51453:	e9 a4 fa ff ff       	jmp    a50efc <efi_main+0x4dc>
  a51458:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5145f:	00 
  a51460:	48                   	dec    %eax
  a51461:	8b 3d 21 c5 01 00    	mov    0x1c521,%edi
  a51467:	e8 74 24 00 00       	call   a538e0 <efi_get_secureboot>
  a5146c:	88 83 ec 01 00 00    	mov    %al,0x1ec(%ebx)
  a51472:	e9 3e f6 ff ff       	jmp    a50ab5 <efi_main+0x95>
  a51477:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a5147e:	00 00 
  a51480:	8b 79 30             	mov    0x30(%ecx),%edi
  a51483:	e9 77 f9 ff ff       	jmp    a50dff <efi_main+0x3df>
  a51488:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5148f:	00 
  a51490:	48                   	dec    %eax
  a51491:	89 c7                	mov    %eax,%edi
  a51493:	48                   	dec    %eax
  a51494:	c1 ef 02             	shr    $0x2,%edi
  a51497:	48                   	dec    %eax
  a51498:	89 7c 24 10          	mov    %edi,0x10(%esp)
  a5149c:	48                   	dec    %eax
  a5149d:	83 f8 03             	cmp    $0x3,%eax
  a514a0:	0f 87 34 f7 ff ff    	ja     a50bda <efi_main+0x1ba>
  a514a6:	e9 ca fc ff ff       	jmp    a51175 <efi_main+0x755>
  a514ab:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a514b0:	41                   	inc    %ecx
  a514b1:	8b 7c 24 38          	mov    0x38(%esp),%edi
  a514b5:	e9 0f f9 ff ff       	jmp    a50dc9 <efi_main+0x3a9>
  a514ba:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a514c0:	48                   	dec    %eax
  a514c1:	8b 79 40             	mov    0x40(%ecx),%edi
  a514c4:	e9 93 fd ff ff       	jmp    a5125c <efi_main+0x83c>
  a514c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a514d0:	8b b3 d4 01 00 00    	mov    0x1d4(%ebx),%esi
  a514d6:	8b 8b c8 01 00 00    	mov    0x1c8(%ebx),%ecx
  a514dc:	31 d2                	xor    %edx,%edx
  a514de:	c7 83 e0 01 00 00 00 	movl   $0x8000,0x1e0(%ebx)
  a514e5:	80 00 00 
  a514e8:	4c                   	dec    %esp
  a514e9:	8b 5c 24 78          	mov    0x78(%esp),%ebx
  a514ed:	48                   	dec    %eax
  a514ee:	8d bb d0 02 00 00    	lea    0x2d0(%ebx),%edi
  a514f4:	89 f0                	mov    %esi,%eax
  a514f6:	f7 f1                	div    %ecx
  a514f8:	39 ce                	cmp    %ecx,%esi
  a514fa:	0f 82 cb 03 00 00    	jb     a518cb <efi_main+0xeab>
  a51500:	8d 14 80             	lea    (%eax,%eax,4),%edx
  a51503:	31 f6                	xor    %esi,%esi
  a51505:	45                   	inc    %ebp
  a51506:	31 c0                	xor    %eax,%eax
  a51508:	45                   	inc    %ebp
  a51509:	31 d2                	xor    %edx,%edx
  a5150b:	44                   	inc    %esp
  a5150c:	8d 0c 95 10 00 00 00 	lea    0x10(,%edx,4),%ecx
  a51513:	4c                   	dec    %esp
  a51514:	8d 25 26 2d 00 00    	lea    0x2d26,%esp
  a5151a:	4d                   	dec    %ebp
  a5151b:	8d 6b 10             	lea    0x10(%ebx),%ebp
  a5151e:	eb 38                	jmp    a51558 <efi_main+0xb38>
  a51520:	48                   	dec    %eax
  a51521:	8b 51 08             	mov    0x8(%ecx),%edx
  a51524:	49                   	dec    %ecx
  a51525:	89 fa                	mov    %edi,%edx
  a51527:	41                   	inc    %ecx
  a51528:	83 c0 01             	add    $0x1,%eax
  a5152b:	48                   	dec    %eax
  a5152c:	83 c7 14             	add    $0x14,%edi
  a5152f:	48                   	dec    %eax
  a51530:	89 57 ec             	mov    %edx,-0x14(%edi)
  a51533:	48                   	dec    %eax
  a51534:	8b 51 18             	mov    0x18(%ecx),%edx
  a51537:	44                   	inc    %esp
  a51538:	89 77 fc             	mov    %esi,-0x4(%edi)
  a5153b:	48                   	dec    %eax
  a5153c:	c1 e2 0c             	shl    $0xc,%edx
  a5153f:	48                   	dec    %eax
  a51540:	89 57 f4             	mov    %edx,-0xc(%edi)
  a51543:	83 c6 01             	add    $0x1,%esi
  a51546:	41                   	inc    %ecx
  a51547:	83 e9 14             	sub    $0x14,%ecx
  a5154a:	39 f0                	cmp    %esi,%eax
  a5154c:	0f 86 ce 01 00 00    	jbe    a51720 <efi_main+0xd00>
  a51552:	8b 8b c8 01 00 00    	mov    0x1c8(%ebx),%ecx
  a51558:	8b 93 dc 01 00 00    	mov    0x1dc(%ebx),%edx
  a5155e:	0f af ce             	imul   %esi,%ecx
  a51561:	44                   	inc    %esp
  a51562:	8b b3 d0 01 00 00    	mov    0x1d0(%ebx),%esi
  a51568:	48                   	dec    %eax
  a51569:	c1 e2 20             	shl    $0x20,%edx
  a5156c:	4c                   	dec    %esp
  a5156d:	09 f2                	or     %esi,%edx
  a5156f:	48                   	dec    %eax
  a51570:	01 d1                	add    %edx,%ecx
  a51572:	8b 11                	mov    (%ecx),%edx
  a51574:	83 fa 0e             	cmp    $0xe,%edx
  a51577:	77 ca                	ja     a51543 <efi_main+0xb23>
  a51579:	45                   	inc    %ebp
  a5157a:	8b 34 94             	mov    (%esp,%edx,4),%esi
  a5157d:	4d                   	dec    %ebp
  a5157e:	85 d2                	test   %edx,%edx
  a51580:	74 0a                	je     a5158c <efi_main+0xb6c>
  a51582:	45                   	inc    %ebp
  a51583:	3b 72 10             	cmp    0x10(%edx),%esi
  a51586:	0f 84 8c 00 00 00    	je     a51618 <efi_main+0xbf8>
  a5158c:	41                   	inc    %ecx
  a5158d:	81 f8 80 00 00 00    	cmp    $0x80,%eax
  a51593:	75 8b                	jne    a51520 <efi_main+0xb00>
  a51595:	4d                   	dec    %ebp
  a51596:	85 db                	test   %ebx,%ebx
  a51598:	0f 84 3e fb ff ff    	je     a510dc <efi_main+0x6bc>
  a5159e:	44                   	inc    %esp
  a5159f:	39 cd                	cmp    %ecx,%ebp
  a515a1:	0f 82 35 fb ff ff    	jb     a510dc <efi_main+0x6bc>
  a515a7:	4c                   	dec    %esp
  a515a8:	89 ef                	mov    %ebp,%edi
  a515aa:	e9 71 ff ff ff       	jmp    a51520 <efi_main+0xb00>
  a515af:	90                   	nop
  a515b0:	48                   	dec    %eax
  a515b1:	8b b8 40 01 00 00    	mov    0x140(%eax),%edi
  a515b7:	e9 41 fd ff ff       	jmp    a512fd <efi_main+0x8dd>
  a515bc:	0f 1f 40 00          	nopl   0x0(%eax)
  a515c0:	8b 79 2c             	mov    0x2c(%ecx),%edi
  a515c3:	e9 cf fd ff ff       	jmp    a51397 <efi_main+0x977>
  a515c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a515cf:	00 
  a515d0:	31 c0                	xor    %eax,%eax
  a515d2:	8b 7e 10             	mov    0x10(%esi),%edi
  a515d5:	4c                   	dec    %esp
  a515d6:	89 e9                	mov    %ebp,%ecx
  a515d8:	41                   	inc    %ecx
  a515d9:	ff d0                	call   *%eax
  a515db:	48                   	dec    %eax
  a515dc:	39 e8                	cmp    %ebp,%eax
  a515de:	0f 85 07 fe ff ff    	jne    a513eb <efi_main+0x9cb>
  a515e4:	48                   	dec    %eax
  a515e5:	8b 05 95 c3 01 00    	mov    0x1c395,%eax
  a515eb:	48                   	dec    %eax
  a515ec:	8b b4 24 a0 00 00 00 	mov    0xa0(%esp),%esi
  a515f3:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a515f7:	48                   	dec    %eax
  a515f8:	8b 48 28             	mov    0x28(%eax),%ecx
  a515fb:	48                   	dec    %eax
  a515fc:	8b 50 18             	mov    0x18(%eax),%edx
  a515ff:	74 5f                	je     a51660 <efi_main+0xc40>
  a51601:	48                   	dec    %eax
  a51602:	8b 7a 48             	mov    0x48(%edx),%edi
  a51605:	31 c0                	xor    %eax,%eax
  a51607:	ff d1                	call   *%ecx
  a51609:	8b 94 24 98 00 00 00 	mov    0x98(%esp),%edx
  a51610:	e9 61 fd ff ff       	jmp    a51376 <efi_main+0x956>
  a51615:	0f 1f 00             	nopl   (%eax)
  a51618:	49                   	dec    %ecx
  a51619:	8b 52 08             	mov    0x8(%edx),%edx
  a5161c:	4d                   	dec    %ebp
  a5161d:	8b 3a                	mov    (%edx),%edi
  a5161f:	49                   	dec    %ecx
  a51620:	01 d7                	add    %edx,%edi
  a51622:	4c                   	dec    %esp
  a51623:	3b 79 08             	cmp    0x8(%ecx),%edi
  a51626:	0f 85 60 ff ff ff    	jne    a5158c <efi_main+0xb6c>
  a5162c:	48                   	dec    %eax
  a5162d:	8b 49 18             	mov    0x18(%ecx),%ecx
  a51630:	48                   	dec    %eax
  a51631:	c1 e1 0c             	shl    $0xc,%ecx
  a51634:	48                   	dec    %eax
  a51635:	01 ca                	add    %ecx,%edx
  a51637:	49                   	dec    %ecx
  a51638:	89 52 08             	mov    %edx,0x8(%edx)
  a5163b:	e9 03 ff ff ff       	jmp    a51543 <efi_main+0xb23>
  a51640:	48                   	dec    %eax
  a51641:	8b 3d 41 c3 01 00    	mov    0x1c341,%edi
  a51647:	48                   	dec    %eax
  a51648:	8d 35 e9 32 00 00    	lea    0x32e9,%esi
  a5164e:	e8 4d 03 00 00       	call   a519a0 <efi_printk>
  a51653:	e9 82 f7 ff ff       	jmp    a50dda <efi_main+0x3ba>
  a51658:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5165f:	00 
  a51660:	8b 7a 30             	mov    0x30(%edx),%edi
  a51663:	eb a0                	jmp    a51605 <efi_main+0xbe5>
  a51665:	0f 1f 00             	nopl   (%eax)
  a51668:	83 c0 80             	add    $0xffffff80,%eax
  a5166b:	48                   	dec    %eax
  a5166c:	8b 74 24 78          	mov    0x78(%esp),%esi
  a51670:	48                   	dec    %eax
  a51671:	8d 04 80             	lea    (%eax,%eax,4),%eax
  a51674:	48                   	dec    %eax
  a51675:	8d 2c 85 10 00 00 00 	lea    0x10(,%eax,4),%ebp
  a5167c:	48                   	dec    %eax
  a5167d:	8b 05 fd c2 01 00    	mov    0x1c2fd,%eax
  a51683:	4c                   	dec    %esp
  a51684:	8b 40 28             	mov    0x28(%eax),%eax
  a51687:	0f b6 50 30          	movzbl 0x30(%eax),%edx
  a5168b:	48                   	dec    %eax
  a5168c:	8b 40 18             	mov    0x18(%eax),%eax
  a5168f:	48                   	dec    %eax
  a51690:	85 f6                	test   %esi,%esi
  a51692:	74 2c                	je     a516c0 <efi_main+0xca0>
  a51694:	84 d2                	test   %dl,%dl
  a51696:	0f 85 4c 01 00 00    	jne    a517e8 <efi_main+0xdc8>
  a5169c:	8b 78 30             	mov    0x30(%eax),%edi
  a5169f:	31 c0                	xor    %eax,%eax
  a516a1:	41                   	inc    %ecx
  a516a2:	ff d0                	call   *%eax
  a516a4:	48                   	dec    %eax
  a516a5:	8b 05 d5 c2 01 00    	mov    0x1c2d5,%eax
  a516ab:	48                   	dec    %eax
  a516ac:	c7 44 24 78 00 00 00 	movl   $0x0,0x78(%esp)
  a516b3:	00 
  a516b4:	4c                   	dec    %esp
  a516b5:	8b 40 28             	mov    0x28(%eax),%eax
  a516b8:	0f b6 50 30          	movzbl 0x30(%eax),%edx
  a516bc:	48                   	dec    %eax
  a516bd:	8b 40 18             	mov    0x18(%eax),%eax
  a516c0:	84 d2                	test   %dl,%dl
  a516c2:	0f 84 18 01 00 00    	je     a517e0 <efi_main+0xdc0>
  a516c8:	48                   	dec    %eax
  a516c9:	8b 78 40             	mov    0x40(%eax),%edi
  a516cc:	31 c0                	xor    %eax,%eax
  a516ce:	48                   	dec    %eax
  a516cf:	8d 4c 24 78          	lea    0x78(%esp),%ecx
  a516d3:	48                   	dec    %eax
  a516d4:	89 ea                	mov    %ebp,%edx
  a516d6:	be 02 00 00 00       	mov    $0x2,%esi
  a516db:	41                   	inc    %ecx
  a516dc:	ff d0                	call   *%eax
  a516de:	48                   	dec    %eax
  a516df:	85 c0                	test   %eax,%eax
  a516e1:	0f 85 f5 f9 ff ff    	jne    a510dc <efi_main+0x6bc>
  a516e7:	e9 bf f9 ff ff       	jmp    a510ab <efi_main+0x68b>
  a516ec:	0f 1f 40 00          	nopl   0x0(%eax)
  a516f0:	48                   	dec    %eax
  a516f1:	8b 3d 91 c2 01 00    	mov    0x1c291,%edi
  a516f7:	48                   	dec    %eax
  a516f8:	8d 35 55 32 00 00    	lea    0x3255,%esi
  a516fe:	e8 9d 02 00 00       	call   a519a0 <efi_printk>
  a51703:	e9 d2 f6 ff ff       	jmp    a50dda <efi_main+0x3ba>
  a51708:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5170f:	00 
  a51710:	8b 7a 64             	mov    0x64(%edx),%edi
  a51713:	e9 87 fb ff ff       	jmp    a5129f <efi_main+0x87f>
  a51718:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5171f:	00 
  a51720:	41                   	inc    %ecx
  a51721:	81 f8 80 00 00 00    	cmp    $0x80,%eax
  a51727:	0f 87 2a 01 00 00    	ja     a51857 <efi_main+0xe37>
  a5172d:	48                   	dec    %eax
  a5172e:	8b 44 24 48          	mov    0x48(%esp),%eax
  a51732:	44                   	inc    %esp
  a51733:	88 83 e8 01 00 00    	mov    %al,0x1e8(%ebx)
  a51739:	31 f6                	xor    %esi,%esi
  a5173b:	0f b7 10             	movzwl (%eax),%edx
  a5173e:	48                   	dec    %eax
  a5173f:	8b 78 02             	mov    0x2(%eax),%edi
  a51742:	e8 e9 c4 ff ff       	call   a4dc30 <memset>
  a51747:	48                   	dec    %eax
  a51748:	8b 44 24 48          	mov    0x48(%esp),%eax
  a5174c:	48                   	dec    %eax
  a5174d:	be ff ff 00 00       	mov    $0xffff,%esi
  a51752:	00 9a cf 00 48 8b    	add    %bl,-0x74b7ff31(%edx)
  a51758:	40                   	inc    %eax
  a51759:	02 48 89             	add    -0x77(%eax),%cl
  a5175c:	70 08                	jo     a51766 <efi_main+0xd46>
  a5175e:	48                   	dec    %eax
  a5175f:	be ff ff 00 00       	mov    $0xffff,%esi
  a51764:	00 9a af 00 48 89    	add    %bl,-0x76b7ff51(%edx)
  a5176a:	70 10                	jo     a5177c <efi_main+0xd5c>
  a5176c:	48                   	dec    %eax
  a5176d:	be ff ff 00 00       	mov    $0xffff,%esi
  a51772:	00 92 cf 00 48 89    	add    %dl,-0x76b7ff31(%edx)
  a51778:	70 18                	jo     a51792 <efi_main+0xd72>
  a5177a:	48                   	dec    %eax
  a5177b:	be 00 00 00 00       	mov    $0x0,%esi
  a51780:	00 89 80 00 48 89    	add    %cl,-0x76b7ff80(%ecx)
  a51786:	70 20                	jo     a517a8 <efi_main+0xd88>
  a51788:	fa                   	cli    
  a51789:	48                   	dec    %eax
  a5178a:	8b 44 24 48          	mov    0x48(%esp),%eax
  a5178e:	0f 01 10             	lgdtl  (%eax)
  a51791:	48                   	dec    %eax
  a51792:	89 d8                	mov    %ebx,%eax
  a51794:	e9 e2 f6 ff ff       	jmp    a50e7b <efi_main+0x45b>
  a51799:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a517a0:	81 3e 00 00 01 00    	cmpl   $0x10000,(%esi)
  a517a6:	0f 85 f5 00 00 00    	jne    a518a1 <efi_main+0xe81>
  a517ac:	4c                   	dec    %esp
  a517ad:	8b 40 28             	mov    0x28(%eax),%eax
  a517b0:	8b 7e 10             	mov    0x10(%esi),%edi
  a517b3:	e9 8e fb ff ff       	jmp    a51346 <efi_main+0x926>
  a517b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a517bf:	00 
  a517c0:	48                   	dec    %eax
  a517c1:	8b 3d c1 c1 01 00    	mov    0x1c1c1,%edi
  a517c7:	48                   	dec    %eax
  a517c8:	8d 35 1a 31 00 00    	lea    0x311a,%esi
  a517ce:	e8 cd 01 00 00       	call   a519a0 <efi_printk>
  a517d3:	4c                   	dec    %esp
  a517d4:	8b 05 ae c1 01 00    	mov    0x1c1ae,%eax
  a517da:	e9 8b f6 ff ff       	jmp    a50e6a <efi_main+0x44a>
  a517df:	90                   	nop
  a517e0:	8b 78 2c             	mov    0x2c(%eax),%edi
  a517e3:	e9 e4 fe ff ff       	jmp    a516cc <efi_main+0xcac>
  a517e8:	48                   	dec    %eax
  a517e9:	8b 78 48             	mov    0x48(%eax),%edi
  a517ec:	e9 ae fe ff ff       	jmp    a5169f <efi_main+0xc7f>
  a517f1:	48                   	dec    %eax
  a517f2:	8b 84 24 a0 00 00 00 	mov    0xa0(%esp),%eax
  a517f9:	48                   	dec    %eax
  a517fa:	89 83 50 02 00 00    	mov    %eax,0x250(%ebx)
  a51800:	e9 3b fc ff ff       	jmp    a51440 <efi_main+0xa20>
  a51805:	0f 1f 00             	nopl   (%eax)
  a51808:	48                   	dec    %eax
  a51809:	8b 3d 79 c1 01 00    	mov    0x1c179,%edi
  a5180f:	48                   	dec    %eax
  a51810:	8d 35 f2 2f 00 00    	lea    0x2ff2,%esi
  a51816:	e8 85 01 00 00       	call   a519a0 <efi_printk>
  a5181b:	e9 99 f6 ff ff       	jmp    a50eb9 <efi_main+0x499>
  a51820:	48                   	dec    %eax
  a51821:	8b 3d 61 c1 01 00    	mov    0x1c161,%edi
  a51827:	48                   	dec    %eax
  a51828:	8d 35 5a 30 00 00    	lea    0x305a,%esi
  a5182e:	e8 6d 01 00 00       	call   a519a0 <efi_printk>
  a51833:	e9 08 fc ff ff       	jmp    a51440 <efi_main+0xa20>
  a51838:	48                   	dec    %eax
  a51839:	8b 3d 49 c1 01 00    	mov    0x1c149,%edi
  a5183f:	48                   	dec    %eax
  a51840:	8d 35 ca 30 00 00    	lea    0x30ca,%esi
  a51846:	e8 55 01 00 00       	call   a519a0 <efi_printk>
  a5184b:	4c                   	dec    %esp
  a5184c:	8b 05 36 c1 01 00    	mov    0x1c136,%eax
  a51852:	e9 13 f6 ff ff       	jmp    a50e6a <efi_main+0x44a>
  a51857:	43                   	inc    %ebx
  a51858:	8d 84 80 80 fd ff ff 	lea    -0x280(%eax,%eax,4),%eax
  a5185f:	41                   	inc    %ecx
  a51860:	c7 43 08 01 00 00 00 	movl   $0x1,0x8(%ebx)
  a51867:	c1 e0 02             	shl    $0x2,%eax
  a5186a:	49                   	dec    %ecx
  a5186b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  a51871:	41                   	inc    %ecx
  a51872:	89 43 0c             	mov    %eax,0xc(%ebx)
  a51875:	48                   	dec    %eax
  a51876:	8b 93 50 02 00 00    	mov    0x250(%ebx),%edx
  a5187c:	48                   	dec    %eax
  a5187d:	85 d2                	test   %edx,%edx
  a5187f:	75 0a                	jne    a5188b <efi_main+0xe6b>
  a51881:	eb 36                	jmp    a518b9 <efi_main+0xe99>
  a51883:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a51888:	48                   	dec    %eax
  a51889:	89 c2                	mov    %eax,%edx
  a5188b:	48                   	dec    %eax
  a5188c:	8b 02                	mov    (%edx),%eax
  a5188e:	48                   	dec    %eax
  a5188f:	85 c0                	test   %eax,%eax
  a51891:	75 f5                	jne    a51888 <efi_main+0xe68>
  a51893:	4c                   	dec    %esp
  a51894:	89 1a                	mov    %ebx,(%edx)
  a51896:	41                   	inc    %ecx
  a51897:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
  a5189c:	e9 8c fe ff ff       	jmp    a5172d <efi_main+0xd0d>
  a518a1:	48                   	dec    %eax
  a518a2:	8b 3d e0 c0 01 00    	mov    0x1c0e0,%edi
  a518a8:	48                   	dec    %eax
  a518a9:	8d 35 b1 2f 00 00    	lea    0x2fb1,%esi
  a518af:	e8 ec 00 00 00       	call   a519a0 <efi_printk>
  a518b4:	e9 87 fb ff ff       	jmp    a51440 <efi_main+0xa20>
  a518b9:	4c                   	dec    %esp
  a518ba:	89 9b 50 02 00 00    	mov    %ebx,0x250(%ebx)
  a518c0:	41                   	inc    %ecx
  a518c1:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
  a518c6:	e9 62 fe ff ff       	jmp    a5172d <efi_main+0xd0d>
  a518cb:	45                   	inc    %ebp
  a518cc:	31 c0                	xor    %eax,%eax
  a518ce:	e9 5a fe ff ff       	jmp    a5172d <efi_main+0xd0d>
  a518d3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a518da:	00 00 00 
  a518dd:	0f 1f 00             	nopl   (%eax)

0000000000a518e0 <efi_call>:
  a518e0:	55                   	push   %ebp
  a518e1:	48                   	dec    %eax
  a518e2:	89 e5                	mov    %esp,%ebp
  a518e4:	48                   	dec    %eax
  a518e5:	89 e0                	mov    %esp,%eax
  a518e7:	48                   	dec    %eax
  a518e8:	83 ec 70             	sub    $0x70,%esp
  a518eb:	48                   	dec    %eax
  a518ec:	83 e4 f0             	and    $0xfffffff0,%esp
  a518ef:	48                   	dec    %eax
  a518f0:	89 04 24             	mov    %eax,(%esp)
  a518f3:	0f 20 c0             	mov    %cr0,%eax
  a518f6:	0f 06                	clts   
  a518f8:	48                   	dec    %eax
  a518f9:	89 44 24 08          	mov    %eax,0x8(%esp)
  a518fd:	0f 29 44 24 60       	movaps %xmm0,0x60(%esp)
  a51902:	0f 29 4c 24 50       	movaps %xmm1,0x50(%esp)
  a51907:	0f 29 54 24 40       	movaps %xmm2,0x40(%esp)
  a5190c:	0f 29 5c 24 30       	movaps %xmm3,0x30(%esp)
  a51911:	0f 29 64 24 20       	movaps %xmm4,0x20(%esp)
  a51916:	0f 29 6c 24 10       	movaps %xmm5,0x10(%esp)
  a5191b:	48                   	dec    %eax
  a5191c:	8b 45 10             	mov    0x10(%ebp),%eax
  a5191f:	48                   	dec    %eax
  a51920:	83 ec 30             	sub    $0x30,%esp
  a51923:	4c                   	dec    %esp
  a51924:	89 4c 24 20          	mov    %ecx,0x20(%esp)
  a51928:	48                   	dec    %eax
  a51929:	89 44 24 28          	mov    %eax,0x28(%esp)
  a5192d:	4d                   	dec    %ebp
  a5192e:	89 c1                	mov    %eax,%ecx
  a51930:	49                   	dec    %ecx
  a51931:	89 c8                	mov    %ecx,%eax
  a51933:	48                   	dec    %eax
  a51934:	89 f1                	mov    %esi,%ecx
  a51936:	ff d7                	call   *%edi
  a51938:	48                   	dec    %eax
  a51939:	83 c4 30             	add    $0x30,%esp
  a5193c:	0f 28 44 24 60       	movaps 0x60(%esp),%xmm0
  a51941:	0f 28 4c 24 50       	movaps 0x50(%esp),%xmm1
  a51946:	0f 28 54 24 40       	movaps 0x40(%esp),%xmm2
  a5194b:	0f 28 5c 24 30       	movaps 0x30(%esp),%xmm3
  a51950:	0f 28 64 24 20       	movaps 0x20(%esp),%xmm4
  a51955:	0f 28 6c 24 10       	movaps 0x10(%esp),%xmm5
  a5195a:	48                   	dec    %eax
  a5195b:	8b 74 24 08          	mov    0x8(%esp),%esi
  a5195f:	0f 22 c6             	mov    %esi,%cr0
  a51962:	48                   	dec    %eax
  a51963:	8b 24 24             	mov    (%esp),%esp
  a51966:	5d                   	pop    %ebp
  a51967:	c3                   	ret    
  a51968:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5196f:	00 

0000000000a51970 <nokaslr>:
  a51970:	f3 0f 1e fa          	endbr64 
  a51974:	8b 05 be 45 00 00    	mov    0x45be,%eax
  a5197a:	c3                   	ret    
  a5197b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)

0000000000a51980 <is_quiet>:
  a51980:	f3 0f 1e fa          	endbr64 
  a51984:	8b 05 aa 45 00 00    	mov    0x45aa,%eax
  a5198a:	c3                   	ret    
  a5198b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)

0000000000a51990 <novamap>:
  a51990:	f3 0f 1e fa          	endbr64 
  a51994:	8b 05 96 45 00 00    	mov    0x4596,%eax
  a5199a:	c3                   	ret    
  a5199b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)

0000000000a519a0 <efi_printk>:
  a519a0:	f3 0f 1e fa          	endbr64 
  a519a4:	0f b6 06             	movzbl (%esi),%eax
  a519a7:	84 c0                	test   %al,%al
  a519a9:	74 75                	je     a51a20 <efi_printk+0x80>
  a519ab:	41                   	inc    %ecx
  a519ac:	55                   	push   %ebp
  a519ad:	41                   	inc    %ecx
  a519ae:	54                   	push   %esp
  a519af:	55                   	push   %ebp
  a519b0:	48                   	dec    %eax
  a519b1:	89 fd                	mov    %edi,%ebp
  a519b3:	53                   	push   %ebx
  a519b4:	48                   	dec    %eax
  a519b5:	89 f3                	mov    %esi,%ebx
  a519b7:	48                   	dec    %eax
  a519b8:	83 ec 18             	sub    $0x18,%esp
  a519bb:	4c                   	dec    %esp
  a519bc:	8d 64 24 08          	lea    0x8(%esp),%esp
  a519c0:	4c                   	dec    %esp
  a519c1:	8d 6c 24 0c          	lea    0xc(%esp),%ebp
  a519c5:	eb 1f                	jmp    a519e6 <efi_printk+0x46>
  a519c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a519ce:	00 00 
  a519d0:	4c                   	dec    %esp
  a519d1:	89 e6                	mov    %esp,%esi
  a519d3:	48                   	dec    %eax
  a519d4:	89 ef                	mov    %ebp,%edi
  a519d6:	48                   	dec    %eax
  a519d7:	83 c3 01             	add    $0x1,%ebx
  a519da:	e8 f1 e7 ff ff       	call   a501d0 <efi_char16_printk>
  a519df:	0f b6 03             	movzbl (%ebx),%eax
  a519e2:	84 c0                	test   %al,%al
  a519e4:	74 2a                	je     a51a10 <efi_printk+0x70>
  a519e6:	31 d2                	xor    %edx,%edx
  a519e8:	66 89 54 24 0a       	mov    %dx,0xa(%esp)
  a519ed:	66 0f be d0          	movsbw %al,%dx
  a519f1:	66 89 54 24 08       	mov    %dx,0x8(%esp)
  a519f6:	3c 0a                	cmp    $0xa,%al
  a519f8:	75 d6                	jne    a519d0 <efi_printk+0x30>
  a519fa:	4c                   	dec    %esp
  a519fb:	89 ee                	mov    %ebp,%esi
  a519fd:	48                   	dec    %eax
  a519fe:	89 ef                	mov    %ebp,%edi
  a51a00:	c7 44 24 0c 0d 00 00 	movl   $0xd,0xc(%esp)
  a51a07:	00 
  a51a08:	e8 c3 e7 ff ff       	call   a501d0 <efi_char16_printk>
  a51a0d:	eb c1                	jmp    a519d0 <efi_printk+0x30>
  a51a0f:	90                   	nop
  a51a10:	48                   	dec    %eax
  a51a11:	83 c4 18             	add    $0x18,%esp
  a51a14:	5b                   	pop    %ebx
  a51a15:	5d                   	pop    %ebp
  a51a16:	41                   	inc    %ecx
  a51a17:	5c                   	pop    %esp
  a51a18:	41                   	inc    %ecx
  a51a19:	5d                   	pop    %ebp
  a51a1a:	c3                   	ret    
  a51a1b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a51a20:	c3                   	ret    
  a51a21:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a51a28:	00 00 00 00 
  a51a2c:	0f 1f 40 00          	nopl   0x0(%eax)

0000000000a51a30 <efi_get_memory_map>:
  a51a30:	f3 0f 1e fa          	endbr64 
  a51a34:	41                   	inc    %ecx
  a51a35:	55                   	push   %ebp
  a51a36:	49                   	dec    %ecx
  a51a37:	bd 05 00 00 00       	mov    $0x5,%ebp
  a51a3c:	00 00                	add    %al,(%eax)
  a51a3e:	00 80 41 54 55 53    	add    %al,0x53555441(%eax)
  a51a44:	48                   	dec    %eax
  a51a45:	89 f3                	mov    %esi,%ebx
  a51a47:	48                   	dec    %eax
  a51a48:	83 ec 28             	sub    $0x28,%esp
  a51a4b:	48                   	dec    %eax
  a51a4c:	8b 46 10             	mov    0x10(%esi),%eax
  a51a4f:	48                   	dec    %eax
  a51a50:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  a51a57:	00 
  a51a58:	48                   	dec    %eax
  a51a59:	8d 6c 24 10          	lea    0x10(%esp),%ebp
  a51a5d:	48                   	dec    %eax
  a51a5e:	c7 00 28 00 00 00    	movl   $0x28,(%eax)
  a51a64:	48                   	dec    %eax
  a51a65:	8b 46 10             	mov    0x10(%esi),%eax
  a51a68:	48                   	dec    %eax
  a51a69:	8b 56 08             	mov    0x8(%esi),%edx
  a51a6c:	48                   	dec    %eax
  a51a6d:	8b 00                	mov    (%eax),%eax
  a51a6f:	48                   	dec    %eax
  a51a70:	c1 e0 05             	shl    $0x5,%eax
  a51a73:	48                   	dec    %eax
  a51a74:	89 02                	mov    %eax,(%edx)
  a51a76:	48                   	dec    %eax
  a51a77:	8b 56 08             	mov    0x8(%esi),%edx
  a51a7a:	48                   	dec    %eax
  a51a7b:	8b 46 28             	mov    0x28(%esi),%eax
  a51a7e:	48                   	dec    %eax
  a51a7f:	8b 12                	mov    (%edx),%edx
  a51a81:	48                   	dec    %eax
  a51a82:	89 10                	mov    %edx,(%eax)
  a51a84:	e9 d4 00 00 00       	jmp    a51b5d <efi_get_memory_map+0x12d>
  a51a89:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a51a90:	48                   	dec    %eax
  a51a91:	8b 79 40             	mov    0x40(%ecx),%edi
  a51a94:	48                   	dec    %eax
  a51a95:	89 e9                	mov    %ebp,%ecx
  a51a97:	be 02 00 00 00       	mov    $0x2,%esi
  a51a9c:	31 c0                	xor    %eax,%eax
  a51a9e:	41                   	inc    %ecx
  a51a9f:	ff d0                	call   *%eax
  a51aa1:	49                   	dec    %ecx
  a51aa2:	89 c4                	mov    %eax,%esp
  a51aa4:	48                   	dec    %eax
  a51aa5:	85 c0                	test   %eax,%eax
  a51aa7:	0f 85 0f 01 00 00    	jne    a51bbc <efi_get_memory_map+0x18c>
  a51aad:	48                   	dec    %eax
  a51aae:	8b 43 10             	mov    0x10(%ebx),%eax
  a51ab1:	48                   	dec    %eax
  a51ab2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  a51ab8:	48                   	dec    %eax
  a51ab9:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  a51ac0:	00 
  a51ac1:	e8 fa e6 ff ff       	call   a501c0 <__efi_early>
  a51ac6:	4c                   	dec    %esp
  a51ac7:	8b 43 10             	mov    0x10(%ebx),%eax
  a51aca:	48                   	dec    %eax
  a51acb:	8b 54 24 10          	mov    0x10(%esp),%edx
  a51acf:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a51ad3:	4c                   	dec    %esp
  a51ad4:	8b 50 28             	mov    0x28(%eax),%edx
  a51ad7:	48                   	dec    %eax
  a51ad8:	8b 73 08             	mov    0x8(%ebx),%esi
  a51adb:	48                   	dec    %eax
  a51adc:	8b 40 18             	mov    0x18(%eax),%eax
  a51adf:	0f 84 a3 00 00 00    	je     a51b88 <efi_get_memory_map+0x158>
  a51ae5:	48                   	dec    %eax
  a51ae6:	8b 78 38             	mov    0x38(%eax),%edi
  a51ae9:	48                   	dec    %eax
  a51aea:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  a51aee:	4c                   	dec    %esp
  a51aef:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
  a51af3:	31 c0                	xor    %eax,%eax
  a51af5:	41                   	inc    %ecx
  a51af6:	ff d2                	call   *%edx
  a51af8:	49                   	dec    %ecx
  a51af9:	89 c4                	mov    %eax,%esp
  a51afb:	4c                   	dec    %esp
  a51afc:	39 e8                	cmp    %ebp,%eax
  a51afe:	74 1d                	je     a51b1d <efi_get_memory_map+0xed>
  a51b00:	48                   	dec    %eax
  a51b01:	8b 53 08             	mov    0x8(%ebx),%edx
  a51b04:	48                   	dec    %eax
  a51b05:	8b 43 28             	mov    0x28(%ebx),%eax
  a51b08:	48                   	dec    %eax
  a51b09:	8b 73 10             	mov    0x10(%ebx),%esi
  a51b0c:	48                   	dec    %eax
  a51b0d:	8b 00                	mov    (%eax),%eax
  a51b0f:	48                   	dec    %eax
  a51b10:	2b 02                	sub    (%edx),%eax
  a51b12:	31 d2                	xor    %edx,%edx
  a51b14:	48                   	dec    %eax
  a51b15:	f7 36                	divl   (%esi)
  a51b17:	48                   	dec    %eax
  a51b18:	83 f8 07             	cmp    $0x7,%eax
  a51b1b:	77 7b                	ja     a51b98 <efi_get_memory_map+0x168>
  a51b1d:	e8 9e e6 ff ff       	call   a501c0 <__efi_early>
  a51b22:	48                   	dec    %eax
  a51b23:	8b 74 24 10          	mov    0x10(%esp),%esi
  a51b27:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a51b2b:	48                   	dec    %eax
  a51b2c:	8b 48 28             	mov    0x28(%eax),%ecx
  a51b2f:	48                   	dec    %eax
  a51b30:	8b 50 18             	mov    0x18(%eax),%edx
  a51b33:	74 5b                	je     a51b90 <efi_get_memory_map+0x160>
  a51b35:	48                   	dec    %eax
  a51b36:	8b 7a 48             	mov    0x48(%edx),%edi
  a51b39:	31 c0                	xor    %eax,%eax
  a51b3b:	ff d1                	call   *%ecx
  a51b3d:	48                   	dec    %eax
  a51b3e:	8b 43 10             	mov    0x10(%ebx),%eax
  a51b41:	48                   	dec    %eax
  a51b42:	8b 53 08             	mov    0x8(%ebx),%edx
  a51b45:	48                   	dec    %eax
  a51b46:	8b 00                	mov    (%eax),%eax
  a51b48:	48                   	dec    %eax
  a51b49:	c1 e0 03             	shl    $0x3,%eax
  a51b4c:	48                   	dec    %eax
  a51b4d:	01 02                	add    %eax,(%edx)
  a51b4f:	48                   	dec    %eax
  a51b50:	8b 53 08             	mov    0x8(%ebx),%edx
  a51b53:	48                   	dec    %eax
  a51b54:	8b 43 28             	mov    0x28(%ebx),%eax
  a51b57:	48                   	dec    %eax
  a51b58:	8b 12                	mov    (%edx),%edx
  a51b5a:	48                   	dec    %eax
  a51b5b:	89 10                	mov    %edx,(%eax)
  a51b5d:	e8 5e e6 ff ff       	call   a501c0 <__efi_early>
  a51b62:	48                   	dec    %eax
  a51b63:	8b 53 08             	mov    0x8(%ebx),%edx
  a51b66:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a51b6a:	4c                   	dec    %esp
  a51b6b:	8b 40 28             	mov    0x28(%eax),%eax
  a51b6e:	48                   	dec    %eax
  a51b6f:	8b 12                	mov    (%edx),%edx
  a51b71:	48                   	dec    %eax
  a51b72:	8b 48 18             	mov    0x18(%eax),%ecx
  a51b75:	0f 85 15 ff ff ff    	jne    a51a90 <efi_get_memory_map+0x60>
  a51b7b:	8b 79 2c             	mov    0x2c(%ecx),%edi
  a51b7e:	e9 11 ff ff ff       	jmp    a51a94 <efi_get_memory_map+0x64>
  a51b83:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a51b88:	8b 78 28             	mov    0x28(%eax),%edi
  a51b8b:	e9 59 ff ff ff       	jmp    a51ae9 <efi_get_memory_map+0xb9>
  a51b90:	8b 7a 30             	mov    0x30(%edx),%edi
  a51b93:	eb a4                	jmp    a51b39 <efi_get_memory_map+0x109>
  a51b95:	0f 1f 00             	nopl   (%eax)
  a51b98:	4d                   	dec    %ebp
  a51b99:	85 e4                	test   %esp,%esp
  a51b9b:	74 3b                	je     a51bd8 <efi_get_memory_map+0x1a8>
  a51b9d:	e8 1e e6 ff ff       	call   a501c0 <__efi_early>
  a51ba2:	48                   	dec    %eax
  a51ba3:	8b 74 24 10          	mov    0x10(%esp),%esi
  a51ba7:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a51bab:	48                   	dec    %eax
  a51bac:	8b 50 28             	mov    0x28(%eax),%edx
  a51baf:	48                   	dec    %eax
  a51bb0:	8b 48 18             	mov    0x18(%eax),%ecx
  a51bb3:	75 4b                	jne    a51c00 <efi_get_memory_map+0x1d0>
  a51bb5:	8b 79 30             	mov    0x30(%ecx),%edi
  a51bb8:	31 c0                	xor    %eax,%eax
  a51bba:	ff d2                	call   *%edx
  a51bbc:	48                   	dec    %eax
  a51bbd:	8b 03                	mov    (%ebx),%eax
  a51bbf:	48                   	dec    %eax
  a51bc0:	8b 54 24 10          	mov    0x10(%esp),%edx
  a51bc4:	48                   	dec    %eax
  a51bc5:	89 10                	mov    %edx,(%eax)
  a51bc7:	48                   	dec    %eax
  a51bc8:	83 c4 28             	add    $0x28,%esp
  a51bcb:	4c                   	dec    %esp
  a51bcc:	89 e0                	mov    %esp,%eax
  a51bce:	5b                   	pop    %ebx
  a51bcf:	5d                   	pop    %ebp
  a51bd0:	41                   	inc    %ecx
  a51bd1:	5c                   	pop    %esp
  a51bd2:	41                   	inc    %ecx
  a51bd3:	5d                   	pop    %ebp
  a51bd4:	c3                   	ret    
  a51bd5:	0f 1f 00             	nopl   (%eax)
  a51bd8:	48                   	dec    %eax
  a51bd9:	8b 43 20             	mov    0x20(%ebx),%eax
  a51bdc:	48                   	dec    %eax
  a51bdd:	85 c0                	test   %eax,%eax
  a51bdf:	74 08                	je     a51be9 <efi_get_memory_map+0x1b9>
  a51be1:	48                   	dec    %eax
  a51be2:	8b 54 24 18          	mov    0x18(%esp),%edx
  a51be6:	48                   	dec    %eax
  a51be7:	89 10                	mov    %edx,(%eax)
  a51be9:	48                   	dec    %eax
  a51bea:	8b 43 18             	mov    0x18(%ebx),%eax
  a51bed:	48                   	dec    %eax
  a51bee:	85 c0                	test   %eax,%eax
  a51bf0:	74 ca                	je     a51bbc <efi_get_memory_map+0x18c>
  a51bf2:	8b 54 24 0c          	mov    0xc(%esp),%edx
  a51bf6:	89 10                	mov    %edx,(%eax)
  a51bf8:	eb c2                	jmp    a51bbc <efi_get_memory_map+0x18c>
  a51bfa:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a51c00:	48                   	dec    %eax
  a51c01:	8b 79 48             	mov    0x48(%ecx),%edi
  a51c04:	eb b2                	jmp    a51bb8 <efi_get_memory_map+0x188>
  a51c06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a51c0d:	00 00 00 

0000000000a51c10 <get_dram_base>:
  a51c10:	f3 0f 1e fa          	endbr64 
  a51c14:	41                   	inc    %ecx
  a51c15:	54                   	push   %esp
  a51c16:	49                   	dec    %ecx
  a51c17:	c7 c4 ff ff ff ff    	mov    $0xffffffff,%esp
  a51c1d:	55                   	push   %ebp
  a51c1e:	48                   	dec    %eax
  a51c1f:	81 ec 88 00 00 00    	sub    $0x88,%esp
  a51c25:	48                   	dec    %eax
  a51c26:	8d 44 24 50          	lea    0x50(%esp),%eax
  a51c2a:	48                   	dec    %eax
  a51c2b:	8d 74 24 18          	lea    0x18(%esp),%esi
  a51c2f:	48                   	dec    %eax
  a51c30:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
  a51c37:	00 
  a51c38:	48                   	dec    %eax
  a51c39:	89 44 24 18          	mov    %eax,0x18(%esp)
  a51c3d:	48                   	dec    %eax
  a51c3e:	8d 44 24 08          	lea    0x8(%esp),%eax
  a51c42:	48                   	dec    %eax
  a51c43:	89 44 24 20          	mov    %eax,0x20(%esp)
  a51c47:	48                   	dec    %eax
  a51c48:	8d 44 24 70          	lea    0x70(%esp),%eax
  a51c4c:	48                   	dec    %eax
  a51c4d:	89 44 24 28          	mov    %eax,0x28(%esp)
  a51c51:	48                   	dec    %eax
  a51c52:	8d 44 24 10          	lea    0x10(%esp),%eax
  a51c56:	48                   	dec    %eax
  a51c57:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  a51c5e:	00 
  a51c5f:	48                   	dec    %eax
  a51c60:	89 44 24 40          	mov    %eax,0x40(%esp)
  a51c64:	e8 c7 fd ff ff       	call   a51a30 <efi_get_memory_map>
  a51c69:	48                   	dec    %eax
  a51c6a:	85 c0                	test   %eax,%eax
  a51c6c:	75 6f                	jne    a51cdd <get_dram_base+0xcd>
  a51c6e:	48                   	dec    %eax
  a51c6f:	8b 6c 24 50          	mov    0x50(%esp),%ebp
  a51c73:	48                   	dec    %eax
  a51c74:	8b 7c 24 08          	mov    0x8(%esp),%edi
  a51c78:	48                   	dec    %eax
  a51c79:	01 ef                	add    %ebp,%edi
  a51c7b:	48                   	dec    %eax
  a51c7c:	89 7c 24 58          	mov    %edi,0x58(%esp)
  a51c80:	48                   	dec    %eax
  a51c81:	85 ed                	test   %ebp,%ebp
  a51c83:	74 3b                	je     a51cc0 <get_dram_base+0xb0>
  a51c85:	48                   	dec    %eax
  a51c86:	8b 4c 24 70          	mov    0x70(%esp),%ecx
  a51c8a:	48                   	dec    %eax
  a51c8b:	8d 44 0d 00          	lea    0x0(%ebp,%ecx,1),%eax
  a51c8f:	48                   	dec    %eax
  a51c90:	39 c7                	cmp    %eax,%edi
  a51c92:	72 2c                	jb     a51cc0 <get_dram_base+0xb0>
  a51c94:	48                   	dec    %eax
  a51c95:	8d 55 08             	lea    0x8(%ebp),%edx
  a51c98:	eb 11                	jmp    a51cab <get_dram_base+0x9b>
  a51c9a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a51ca0:	48                   	dec    %eax
  a51ca1:	01 c8                	add    %ecx,%eax
  a51ca3:	48                   	dec    %eax
  a51ca4:	01 ca                	add    %ecx,%edx
  a51ca6:	48                   	dec    %eax
  a51ca7:	39 c7                	cmp    %eax,%edi
  a51ca9:	72 15                	jb     a51cc0 <get_dram_base+0xb0>
  a51cab:	f6 42 18 08          	testb  $0x8,0x18(%edx)
  a51caf:	74 0a                	je     a51cbb <get_dram_base+0xab>
  a51cb1:	48                   	dec    %eax
  a51cb2:	8b 32                	mov    (%edx),%esi
  a51cb4:	49                   	dec    %ecx
  a51cb5:	39 f4                	cmp    %esi,%esp
  a51cb7:	4c                   	dec    %esp
  a51cb8:	0f 47 e6             	cmova  %esi,%esp
  a51cbb:	48                   	dec    %eax
  a51cbc:	85 c0                	test   %eax,%eax
  a51cbe:	75 e0                	jne    a51ca0 <get_dram_base+0x90>
  a51cc0:	e8 fb e4 ff ff       	call   a501c0 <__efi_early>
  a51cc5:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a51cc9:	48                   	dec    %eax
  a51cca:	8b 50 28             	mov    0x28(%eax),%edx
  a51ccd:	48                   	dec    %eax
  a51cce:	8b 48 18             	mov    0x18(%eax),%ecx
  a51cd1:	75 1d                	jne    a51cf0 <get_dram_base+0xe0>
  a51cd3:	8b 79 30             	mov    0x30(%ecx),%edi
  a51cd6:	48                   	dec    %eax
  a51cd7:	89 ee                	mov    %ebp,%esi
  a51cd9:	31 c0                	xor    %eax,%eax
  a51cdb:	ff d2                	call   *%edx
  a51cdd:	48                   	dec    %eax
  a51cde:	81 c4 88 00 00 00    	add    $0x88,%esp
  a51ce4:	4c                   	dec    %esp
  a51ce5:	89 e0                	mov    %esp,%eax
  a51ce7:	5d                   	pop    %ebp
  a51ce8:	41                   	inc    %ecx
  a51ce9:	5c                   	pop    %esp
  a51cea:	c3                   	ret    
  a51ceb:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a51cf0:	48                   	dec    %eax
  a51cf1:	8b 79 48             	mov    0x48(%ecx),%edi
  a51cf4:	eb e0                	jmp    a51cd6 <get_dram_base+0xc6>
  a51cf6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a51cfd:	00 00 00 

0000000000a51d00 <efi_high_alloc>:
  a51d00:	f3 0f 1e fa          	endbr64 
  a51d04:	41                   	inc    %ecx
  a51d05:	57                   	push   %edi
  a51d06:	41                   	inc    %ecx
  a51d07:	56                   	push   %esi
  a51d08:	4d                   	dec    %ebp
  a51d09:	89 c6                	mov    %eax,%esi
  a51d0b:	41                   	inc    %ecx
  a51d0c:	55                   	push   %ebp
  a51d0d:	41                   	inc    %ecx
  a51d0e:	54                   	push   %esp
  a51d0f:	49                   	dec    %ecx
  a51d10:	89 f4                	mov    %esi,%esp
  a51d12:	55                   	push   %ebp
  a51d13:	48                   	dec    %eax
  a51d14:	89 cd                	mov    %ecx,%ebp
  a51d16:	53                   	push   %ebx
  a51d17:	48                   	dec    %eax
  a51d18:	89 d3                	mov    %edx,%ebx
  a51d1a:	48                   	dec    %eax
  a51d1b:	83 ec 68             	sub    $0x68,%esp
  a51d1e:	48                   	dec    %eax
  a51d1f:	8d 44 24 20          	lea    0x20(%esp),%eax
  a51d23:	48                   	dec    %eax
  a51d24:	8d 74 24 30          	lea    0x30(%esp),%esi
  a51d28:	48                   	dec    %eax
  a51d29:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  a51d30:	00 
  a51d31:	48                   	dec    %eax
  a51d32:	89 44 24 30          	mov    %eax,0x30(%esp)
  a51d36:	48                   	dec    %eax
  a51d37:	8d 44 24 08          	lea    0x8(%esp),%eax
  a51d3b:	48                   	dec    %eax
  a51d3c:	89 44 24 38          	mov    %eax,0x38(%esp)
  a51d40:	48                   	dec    %eax
  a51d41:	8d 44 24 10          	lea    0x10(%esp),%eax
  a51d45:	48                   	dec    %eax
  a51d46:	89 44 24 40          	mov    %eax,0x40(%esp)
  a51d4a:	48                   	dec    %eax
  a51d4b:	8d 44 24 18          	lea    0x18(%esp),%eax
  a51d4f:	48                   	dec    %eax
  a51d50:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
  a51d57:	00 
  a51d58:	48                   	dec    %eax
  a51d59:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
  a51d60:	00 
  a51d61:	48                   	dec    %eax
  a51d62:	89 44 24 58          	mov    %eax,0x58(%esp)
  a51d66:	e8 c5 fc ff ff       	call   a51a30 <efi_get_memory_map>
  a51d6b:	49                   	dec    %ecx
  a51d6c:	89 c5                	mov    %eax,%ebp
  a51d6e:	48                   	dec    %eax
  a51d6f:	85 c0                	test   %eax,%eax
  a51d71:	0f 85 2f 01 00 00    	jne    a51ea6 <efi_high_alloc+0x1a6>
  a51d77:	48                   	dec    %eax
  a51d78:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
  a51d7e:	b8 00 10 00 00       	mov    $0x1000,%eax
  a51d83:	4c                   	dec    %esp
  a51d84:	8b 7c 24 28          	mov    0x28(%esp),%edi
  a51d88:	48                   	dec    %eax
  a51d89:	0f 42 d8             	cmovb  %eax,%ebx
  a51d8c:	49                   	dec    %ecx
  a51d8d:	83 ec 01             	sub    $0x1,%esp
  a51d90:	49                   	dec    %ecx
  a51d91:	81 cc ff 0f 00 00    	or     $0xfff,%esp
  a51d97:	49                   	dec    %ecx
  a51d98:	83 c4 01             	add    $0x1,%esp
  a51d9b:	48                   	dec    %eax
  a51d9c:	f7 db                	neg    %ebx
  a51d9e:	4d                   	dec    %ebp
  a51d9f:	89 e5                	mov    %esp,%ebp
  a51da1:	49                   	dec    %ecx
  a51da2:	c1 ed 0c             	shr    $0xc,%ebp
  a51da5:	0f 1f 00             	nopl   (%eax)
  a51da8:	48                   	dec    %eax
  a51da9:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  a51dad:	48                   	dec    %eax
  a51dae:	8b 7c 24 10          	mov    0x10(%esp),%edi
  a51db2:	31 d2                	xor    %edx,%edx
  a51db4:	48                   	dec    %eax
  a51db5:	89 c8                	mov    %ecx,%eax
  a51db7:	48                   	dec    %eax
  a51db8:	f7 f7                	div    %edi
  a51dba:	48                   	dec    %eax
  a51dbb:	39 f9                	cmp    %edi,%ecx
  a51dbd:	72 6d                	jb     a51e2c <efi_high_alloc+0x12c>
  a51dbf:	48                   	dec    %eax
  a51dc0:	8b 4c 24 20          	mov    0x20(%esp),%ecx
  a51dc4:	31 f6                	xor    %esi,%esi
  a51dc6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a51dcd:	00 00 00 
  a51dd0:	83 39 07             	cmpl   $0x7,(%ecx)
  a51dd3:	75 4b                	jne    a51e20 <efi_high_alloc+0x120>
  a51dd5:	48                   	dec    %eax
  a51dd6:	8b 51 18             	mov    0x18(%ecx),%edx
  a51dd9:	4c                   	dec    %esp
  a51dda:	39 ea                	cmp    %ebp,%edx
  a51ddc:	72 42                	jb     a51e20 <efi_high_alloc+0x120>
  a51dde:	4c                   	dec    %esp
  a51ddf:	8b 41 08             	mov    0x8(%ecx),%eax
  a51de2:	48                   	dec    %eax
  a51de3:	c1 e2 0c             	shl    $0xc,%edx
  a51de6:	4c                   	dec    %esp
  a51de7:	01 c2                	add    %eax,%edx
  a51de9:	4f                   	dec    %edi
  a51dea:	8d 0c 04             	lea    (%esp,%eax,1),%ecx
  a51ded:	49                   	dec    %ecx
  a51dee:	39 d6                	cmp    %edx,%esi
  a51df0:	49                   	dec    %ecx
  a51df1:	0f 46 d6             	cmovbe %esi,%edx
  a51df4:	49                   	dec    %ecx
  a51df5:	39 d1                	cmp    %edx,%ecx
  a51df7:	77 27                	ja     a51e20 <efi_high_alloc+0x120>
  a51df9:	4c                   	dec    %esp
  a51dfa:	29 e2                	sub    %esp,%edx
  a51dfc:	48                   	dec    %eax
  a51dfd:	21 da                	and    %ebx,%edx
  a51dff:	4c                   	dec    %esp
  a51e00:	39 c2                	cmp    %eax,%edx
  a51e02:	72 1c                	jb     a51e20 <efi_high_alloc+0x120>
  a51e04:	48                   	dec    %eax
  a51e05:	85 d2                	test   %edx,%edx
  a51e07:	74 17                	je     a51e20 <efi_high_alloc+0x120>
  a51e09:	4c                   	dec    %esp
  a51e0a:	39 fa                	cmp    %edi,%edx
  a51e0c:	76 12                	jbe    a51e20 <efi_high_alloc+0x120>
  a51e0e:	48                   	dec    %eax
  a51e0f:	89 54 24 28          	mov    %edx,0x28(%esp)
  a51e13:	49                   	dec    %ecx
  a51e14:	89 d7                	mov    %edx,%edi
  a51e16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a51e1d:	00 00 00 
  a51e20:	48                   	dec    %eax
  a51e21:	83 c6 01             	add    $0x1,%esi
  a51e24:	48                   	dec    %eax
  a51e25:	01 f9                	add    %edi,%ecx
  a51e27:	48                   	dec    %eax
  a51e28:	39 f0                	cmp    %esi,%eax
  a51e2a:	77 a4                	ja     a51dd0 <efi_high_alloc+0xd0>
  a51e2c:	e8 8f e3 ff ff       	call   a501c0 <__efi_early>
  a51e31:	48                   	dec    %eax
  a51e32:	8b 50 18             	mov    0x18(%eax),%edx
  a51e35:	4d                   	dec    %ebp
  a51e36:	85 ff                	test   %edi,%edi
  a51e38:	74 4b                	je     a51e85 <efi_high_alloc+0x185>
  a51e3a:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a51e3e:	4c                   	dec    %esp
  a51e3f:	8b 48 28             	mov    0x28(%eax),%ecx
  a51e42:	74 3c                	je     a51e80 <efi_high_alloc+0x180>
  a51e44:	48                   	dec    %eax
  a51e45:	8b 7a 28             	mov    0x28(%edx),%edi
  a51e48:	31 c0                	xor    %eax,%eax
  a51e4a:	4c                   	dec    %esp
  a51e4b:	8d 44 24 28          	lea    0x28(%esp),%eax
  a51e4f:	4c                   	dec    %esp
  a51e50:	89 e9                	mov    %ebp,%ecx
  a51e52:	ba 02 00 00 00       	mov    $0x2,%edx
  a51e57:	be 02 00 00 00       	mov    $0x2,%esi
  a51e5c:	41                   	inc    %ecx
  a51e5d:	ff d1                	call   *%ecx
  a51e5f:	48                   	dec    %eax
  a51e60:	85 c0                	test   %eax,%eax
  a51e62:	74 59                	je     a51ebd <efi_high_alloc+0x1bd>
  a51e64:	4c                   	dec    %esp
  a51e65:	8b 74 24 28          	mov    0x28(%esp),%esi
  a51e69:	45                   	inc    %ebp
  a51e6a:	31 ff                	xor    %edi,%edi
  a51e6c:	48                   	dec    %eax
  a51e6d:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  a51e74:	00 
  a51e75:	e9 2e ff ff ff       	jmp    a51da8 <efi_high_alloc+0xa8>
  a51e7a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a51e80:	8b 7a 20             	mov    0x20(%edx),%edi
  a51e83:	eb c3                	jmp    a51e48 <efi_high_alloc+0x148>
  a51e85:	49                   	dec    %ecx
  a51e86:	bd 0e 00 00 00       	mov    $0xe,%ebp
  a51e8b:	00 00                	add    %al,(%eax)
  a51e8d:	00 80 80 78 30 00    	add    %al,0x307880(%eax)
  a51e93:	48                   	dec    %eax
  a51e94:	8b 48 28             	mov    0x28(%eax),%ecx
  a51e97:	48                   	dec    %eax
  a51e98:	8b 74 24 20          	mov    0x20(%esp),%esi
  a51e9c:	74 1a                	je     a51eb8 <efi_high_alloc+0x1b8>
  a51e9e:	48                   	dec    %eax
  a51e9f:	8b 7a 48             	mov    0x48(%edx),%edi
  a51ea2:	31 c0                	xor    %eax,%eax
  a51ea4:	ff d1                	call   *%ecx
  a51ea6:	48                   	dec    %eax
  a51ea7:	83 c4 68             	add    $0x68,%esp
  a51eaa:	4c                   	dec    %esp
  a51eab:	89 e8                	mov    %ebp,%eax
  a51ead:	5b                   	pop    %ebx
  a51eae:	5d                   	pop    %ebp
  a51eaf:	41                   	inc    %ecx
  a51eb0:	5c                   	pop    %esp
  a51eb1:	41                   	inc    %ecx
  a51eb2:	5d                   	pop    %ebp
  a51eb3:	41                   	inc    %ecx
  a51eb4:	5e                   	pop    %esi
  a51eb5:	41                   	inc    %ecx
  a51eb6:	5f                   	pop    %edi
  a51eb7:	c3                   	ret    
  a51eb8:	8b 7a 30             	mov    0x30(%edx),%edi
  a51ebb:	eb e5                	jmp    a51ea2 <efi_high_alloc+0x1a2>
  a51ebd:	48                   	dec    %eax
  a51ebe:	8b 44 24 28          	mov    0x28(%esp),%eax
  a51ec2:	45                   	inc    %ebp
  a51ec3:	31 ed                	xor    %ebp,%ebp
  a51ec5:	48                   	dec    %eax
  a51ec6:	89 45 00             	mov    %eax,0x0(%ebp)
  a51ec9:	e8 f2 e2 ff ff       	call   a501c0 <__efi_early>
  a51ece:	48                   	dec    %eax
  a51ecf:	8b 50 18             	mov    0x18(%eax),%edx
  a51ed2:	eb bb                	jmp    a51e8f <efi_high_alloc+0x18f>
  a51ed4:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a51edb:	00 00 00 00 
  a51edf:	90                   	nop

0000000000a51ee0 <efi_low_alloc>:
  a51ee0:	f3 0f 1e fa          	endbr64 
  a51ee4:	41                   	inc    %ecx
  a51ee5:	57                   	push   %edi
  a51ee6:	41                   	inc    %ecx
  a51ee7:	56                   	push   %esi
  a51ee8:	41                   	inc    %ecx
  a51ee9:	55                   	push   %ebp
  a51eea:	41                   	inc    %ecx
  a51eeb:	54                   	push   %esp
  a51eec:	55                   	push   %ebp
  a51eed:	48                   	dec    %eax
  a51eee:	89 d5                	mov    %edx,%ebp
  a51ef0:	53                   	push   %ebx
  a51ef1:	48                   	dec    %eax
  a51ef2:	89 f3                	mov    %esi,%ebx
  a51ef4:	48                   	dec    %eax
  a51ef5:	83 ec 78             	sub    $0x78,%esp
  a51ef8:	48                   	dec    %eax
  a51ef9:	8d 44 24 30          	lea    0x30(%esp),%eax
  a51efd:	48                   	dec    %eax
  a51efe:	8d 74 24 40          	lea    0x40(%esp),%esi
  a51f02:	48                   	dec    %eax
  a51f03:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  a51f07:	48                   	dec    %eax
  a51f08:	89 44 24 40          	mov    %eax,0x40(%esp)
  a51f0c:	48                   	dec    %eax
  a51f0d:	8d 44 24 18          	lea    0x18(%esp),%eax
  a51f11:	48                   	dec    %eax
  a51f12:	89 44 24 48          	mov    %eax,0x48(%esp)
  a51f16:	48                   	dec    %eax
  a51f17:	8d 44 24 20          	lea    0x20(%esp),%eax
  a51f1b:	48                   	dec    %eax
  a51f1c:	89 44 24 50          	mov    %eax,0x50(%esp)
  a51f20:	48                   	dec    %eax
  a51f21:	8d 44 24 28          	lea    0x28(%esp),%eax
  a51f25:	48                   	dec    %eax
  a51f26:	c7 44 24 58 00 00 00 	movl   $0x0,0x58(%esp)
  a51f2d:	00 
  a51f2e:	48                   	dec    %eax
  a51f2f:	c7 44 24 60 00 00 00 	movl   $0x0,0x60(%esp)
  a51f36:	00 
  a51f37:	48                   	dec    %eax
  a51f38:	89 44 24 68          	mov    %eax,0x68(%esp)
  a51f3c:	e8 ef fa ff ff       	call   a51a30 <efi_get_memory_map>
  a51f41:	49                   	dec    %ecx
  a51f42:	89 c6                	mov    %eax,%esi
  a51f44:	48                   	dec    %eax
  a51f45:	85 c0                	test   %eax,%eax
  a51f47:	0f 85 58 01 00 00    	jne    a520a5 <efi_low_alloc+0x1c5>
  a51f4d:	ba 00 10 00 00       	mov    $0x1000,%edx
  a51f52:	48                   	dec    %eax
  a51f53:	8b 4c 24 20          	mov    0x20(%esp),%ecx
  a51f57:	48                   	dec    %eax
  a51f58:	8b 74 24 30          	mov    0x30(%esp),%esi
  a51f5c:	48                   	dec    %eax
  a51f5d:	81 fd 00 10 00 00    	cmp    $0x1000,%ebp
  a51f63:	48                   	dec    %eax
  a51f64:	0f 42 ea             	cmovb  %edx,%ebp
  a51f67:	48                   	dec    %eax
  a51f68:	83 eb 01             	sub    $0x1,%ebx
  a51f6b:	48                   	dec    %eax
  a51f6c:	81 cb ff 0f 00 00    	or     $0xfff,%ebx
  a51f72:	48                   	dec    %eax
  a51f73:	83 c3 01             	add    $0x1,%ebx
  a51f76:	49                   	dec    %ecx
  a51f77:	89 dc                	mov    %ebx,%esp
  a51f79:	49                   	dec    %ecx
  a51f7a:	c1 ec 0c             	shr    $0xc,%esp
  a51f7d:	48                   	dec    %eax
  a51f7e:	3b 4c 24 18          	cmp    0x18(%esp),%ecx
  a51f82:	0f 87 3e 01 00 00    	ja     a520c6 <efi_low_alloc+0x1e6>
  a51f88:	45                   	inc    %ebp
  a51f89:	31 ff                	xor    %edi,%edi
  a51f8b:	41                   	inc    %ecx
  a51f8c:	bd 07 00 00 00       	mov    $0x7,%ebp
  a51f91:	eb 4d                	jmp    a51fe0 <efi_low_alloc+0x100>
  a51f93:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a51f98:	48                   	dec    %eax
  a51f99:	8b 7a 28             	mov    0x28(%edx),%edi
  a51f9c:	4c                   	dec    %esp
  a51f9d:	8d 44 24 38          	lea    0x38(%esp),%eax
  a51fa1:	4c                   	dec    %esp
  a51fa2:	89 e1                	mov    %esp,%ecx
  a51fa4:	ba 02 00 00 00       	mov    $0x2,%edx
  a51fa9:	31 c0                	xor    %eax,%eax
  a51fab:	be 02 00 00 00       	mov    $0x2,%esi
  a51fb0:	41                   	inc    %ecx
  a51fb1:	ff d1                	call   *%ecx
  a51fb3:	49                   	dec    %ecx
  a51fb4:	89 c6                	mov    %eax,%esi
  a51fb6:	48                   	dec    %eax
  a51fb7:	85 c0                	test   %eax,%eax
  a51fb9:	0f 84 91 00 00 00    	je     a52050 <efi_low_alloc+0x170>
  a51fbf:	48                   	dec    %eax
  a51fc0:	8b 74 24 30          	mov    0x30(%esp),%esi
  a51fc4:	48                   	dec    %eax
  a51fc5:	8b 4c 24 20          	mov    0x20(%esp),%ecx
  a51fc9:	48                   	dec    %eax
  a51fca:	8b 44 24 18          	mov    0x18(%esp),%eax
  a51fce:	31 d2                	xor    %edx,%edx
  a51fd0:	49                   	dec    %ecx
  a51fd1:	83 c7 01             	add    $0x1,%edi
  a51fd4:	48                   	dec    %eax
  a51fd5:	f7 f1                	div    %ecx
  a51fd7:	4c                   	dec    %esp
  a51fd8:	39 f8                	cmp    %edi,%eax
  a51fda:	0f 86 90 00 00 00    	jbe    a52070 <efi_low_alloc+0x190>
  a51fe0:	4c                   	dec    %esp
  a51fe1:	89 f8                	mov    %edi,%eax
  a51fe3:	48                   	dec    %eax
  a51fe4:	0f af c1             	imul   %ecx,%eax
  a51fe7:	48                   	dec    %eax
  a51fe8:	01 f0                	add    %esi,%eax
  a51fea:	83 38 07             	cmpl   $0x7,(%eax)
  a51fed:	75 da                	jne    a51fc9 <efi_low_alloc+0xe9>
  a51fef:	48                   	dec    %eax
  a51ff0:	8b 50 18             	mov    0x18(%eax),%edx
  a51ff3:	4c                   	dec    %esp
  a51ff4:	39 e2                	cmp    %esp,%edx
  a51ff6:	72 d1                	jb     a51fc9 <efi_low_alloc+0xe9>
  a51ff8:	48                   	dec    %eax
  a51ff9:	8b 78 08             	mov    0x8(%eax),%edi
  a51ffc:	48                   	dec    %eax
  a51ffd:	c1 e2 0c             	shl    $0xc,%edx
  a52000:	48                   	dec    %eax
  a52001:	01 fa                	add    %edi,%edx
  a52003:	48                   	dec    %eax
  a52004:	8d 47 ff             	lea    -0x1(%edi),%eax
  a52007:	48                   	dec    %eax
  a52008:	85 ff                	test   %edi,%edi
  a5200a:	49                   	dec    %ecx
  a5200b:	0f 44 c5             	cmove  %ebp,%eax
  a5200e:	48                   	dec    %eax
  a5200f:	89 c7                	mov    %eax,%edi
  a52011:	48                   	dec    %eax
  a52012:	8d 45 ff             	lea    -0x1(%ebp),%eax
  a52015:	48                   	dec    %eax
  a52016:	09 f8                	or     %edi,%eax
  a52018:	48                   	dec    %eax
  a52019:	83 c0 01             	add    $0x1,%eax
  a5201c:	48                   	dec    %eax
  a5201d:	89 44 24 38          	mov    %eax,0x38(%esp)
  a52021:	48                   	dec    %eax
  a52022:	01 d8                	add    %ebx,%eax
  a52024:	48                   	dec    %eax
  a52025:	39 d0                	cmp    %edx,%eax
  a52027:	77 a0                	ja     a51fc9 <efi_low_alloc+0xe9>
  a52029:	e8 92 e1 ff ff       	call   a501c0 <__efi_early>
  a5202e:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52032:	4c                   	dec    %esp
  a52033:	8b 48 28             	mov    0x28(%eax),%ecx
  a52036:	48                   	dec    %eax
  a52037:	8b 50 18             	mov    0x18(%eax),%edx
  a5203a:	0f 85 58 ff ff ff    	jne    a51f98 <efi_low_alloc+0xb8>
  a52040:	8b 7a 20             	mov    0x20(%edx),%edi
  a52043:	e9 54 ff ff ff       	jmp    a51f9c <efi_low_alloc+0xbc>
  a52048:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5204f:	00 
  a52050:	48                   	dec    %eax
  a52051:	8b 44 24 38          	mov    0x38(%esp),%eax
  a52055:	48                   	dec    %eax
  a52056:	8b 5c 24 08          	mov    0x8(%esp),%ebx
  a5205a:	31 d2                	xor    %edx,%edx
  a5205c:	48                   	dec    %eax
  a5205d:	8b 74 24 30          	mov    0x30(%esp),%esi
  a52061:	48                   	dec    %eax
  a52062:	89 03                	mov    %eax,(%ebx)
  a52064:	48                   	dec    %eax
  a52065:	8b 44 24 18          	mov    0x18(%esp),%eax
  a52069:	48                   	dec    %eax
  a5206a:	f7 74 24 20          	divl   0x20(%esp)
  a5206e:	66 90                	xchg   %ax,%ax
  a52070:	49                   	dec    %ecx
  a52071:	39 c7                	cmp    %eax,%edi
  a52073:	48                   	dec    %eax
  a52074:	b8 0e 00 00 00       	mov    $0xe,%eax
  a52079:	00 00                	add    %al,(%eax)
  a5207b:	00 80 4c 0f 44 f0    	add    %al,-0xfbbf0b4(%eax)
  a52081:	48                   	dec    %eax
  a52082:	89 74 24 08          	mov    %esi,0x8(%esp)
  a52086:	e8 35 e1 ff ff       	call   a501c0 <__efi_early>
  a5208b:	48                   	dec    %eax
  a5208c:	8b 74 24 08          	mov    0x8(%esp),%esi
  a52090:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52094:	48                   	dec    %eax
  a52095:	8b 50 28             	mov    0x28(%eax),%edx
  a52098:	48                   	dec    %eax
  a52099:	8b 48 18             	mov    0x18(%eax),%ecx
  a5209c:	75 22                	jne    a520c0 <efi_low_alloc+0x1e0>
  a5209e:	8b 79 30             	mov    0x30(%ecx),%edi
  a520a1:	31 c0                	xor    %eax,%eax
  a520a3:	ff d2                	call   *%edx
  a520a5:	48                   	dec    %eax
  a520a6:	83 c4 78             	add    $0x78,%esp
  a520a9:	4c                   	dec    %esp
  a520aa:	89 f0                	mov    %esi,%eax
  a520ac:	5b                   	pop    %ebx
  a520ad:	5d                   	pop    %ebp
  a520ae:	41                   	inc    %ecx
  a520af:	5c                   	pop    %esp
  a520b0:	41                   	inc    %ecx
  a520b1:	5d                   	pop    %ebp
  a520b2:	41                   	inc    %ecx
  a520b3:	5e                   	pop    %esi
  a520b4:	41                   	inc    %ecx
  a520b5:	5f                   	pop    %edi
  a520b6:	c3                   	ret    
  a520b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a520be:	00 00 
  a520c0:	48                   	dec    %eax
  a520c1:	8b 79 48             	mov    0x48(%ecx),%edi
  a520c4:	eb db                	jmp    a520a1 <efi_low_alloc+0x1c1>
  a520c6:	49                   	dec    %ecx
  a520c7:	be 0e 00 00 00       	mov    $0xe,%esi
  a520cc:	00 00                	add    %al,(%eax)
  a520ce:	00 80 eb af 66 66    	add    %al,0x6666afeb(%eax)
  a520d4:	2e 0f 1f 84 00 00 00 	nopl   %cs:0x0(%eax,%eax,1)
  a520db:	00 00 
  a520dd:	0f 1f 00             	nopl   (%eax)

0000000000a520e0 <efi_free>:
  a520e0:	f3 0f 1e fa          	endbr64 
  a520e4:	48                   	dec    %eax
  a520e5:	85 f6                	test   %esi,%esi
  a520e7:	74 57                	je     a52140 <efi_free+0x60>
  a520e9:	41                   	inc    %ecx
  a520ea:	54                   	push   %esp
  a520eb:	4c                   	dec    %esp
  a520ec:	8d 66 ff             	lea    -0x1(%esi),%esp
  a520ef:	55                   	push   %ebp
  a520f0:	4c                   	dec    %esp
  a520f1:	89 e6                	mov    %esp,%esi
  a520f3:	48                   	dec    %eax
  a520f4:	89 d5                	mov    %edx,%ebp
  a520f6:	48                   	dec    %eax
  a520f7:	81 ce ff 0f 00 00    	or     $0xfff,%esi
  a520fd:	4c                   	dec    %esp
  a520fe:	8d 66 01             	lea    0x1(%esi),%esp
  a52101:	48                   	dec    %eax
  a52102:	83 ec 08             	sub    $0x8,%esp
  a52105:	49                   	dec    %ecx
  a52106:	c1 ec 0c             	shr    $0xc,%esp
  a52109:	e8 b2 e0 ff ff       	call   a501c0 <__efi_early>
  a5210e:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52112:	48                   	dec    %eax
  a52113:	8b 48 28             	mov    0x28(%eax),%ecx
  a52116:	48                   	dec    %eax
  a52117:	8b 50 18             	mov    0x18(%eax),%edx
  a5211a:	75 14                	jne    a52130 <efi_free+0x50>
  a5211c:	8b 7a 24             	mov    0x24(%edx),%edi
  a5211f:	48                   	dec    %eax
  a52120:	83 c4 08             	add    $0x8,%esp
  a52123:	4c                   	dec    %esp
  a52124:	89 e2                	mov    %esp,%edx
  a52126:	48                   	dec    %eax
  a52127:	89 ee                	mov    %ebp,%esi
  a52129:	31 c0                	xor    %eax,%eax
  a5212b:	5d                   	pop    %ebp
  a5212c:	41                   	inc    %ecx
  a5212d:	5c                   	pop    %esp
  a5212e:	ff e1                	jmp    *%ecx
  a52130:	48                   	dec    %eax
  a52131:	8b 7a 30             	mov    0x30(%edx),%edi
  a52134:	eb e9                	jmp    a5211f <efi_free+0x3f>
  a52136:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a5213d:	00 00 00 
  a52140:	c3                   	ret    
  a52141:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a52148:	00 00 00 00 
  a5214c:	0f 1f 40 00          	nopl   0x0(%eax)

0000000000a52150 <efi_parse_options>:
  a52150:	f3 0f 1e fa          	endbr64 
  a52154:	55                   	push   %ebp
  a52155:	48                   	dec    %eax
  a52156:	8d 35 dd 24 00 00    	lea    0x24dd,%esi
  a5215c:	48                   	dec    %eax
  a5215d:	89 fd                	mov    %edi,%ebp
  a5215f:	53                   	push   %ebx
  a52160:	48                   	dec    %eax
  a52161:	83 ec 08             	sub    $0x8,%esp
  a52164:	e8 f7 b9 ff ff       	call   a4db60 <strstr>
  a52169:	48                   	dec    %eax
  a5216a:	39 c5                	cmp    %eax,%ebp
  a5216c:	0f 84 11 01 00 00    	je     a52283 <efi_parse_options+0x133>
  a52172:	48                   	dec    %eax
  a52173:	85 c0                	test   %eax,%eax
  a52175:	74 0f                	je     a52186 <efi_parse_options+0x36>
  a52177:	48                   	dec    %eax
  a52178:	39 c5                	cmp    %eax,%ebp
  a5217a:	73 0a                	jae    a52186 <efi_parse_options+0x36>
  a5217c:	80 78 ff 20          	cmpb   $0x20,-0x1(%eax)
  a52180:	0f 84 fd 00 00 00    	je     a52283 <efi_parse_options+0x133>
  a52186:	48                   	dec    %eax
  a52187:	8d 35 0a 28 00 00    	lea    0x280a,%esi
  a5218d:	48                   	dec    %eax
  a5218e:	89 ef                	mov    %ebp,%edi
  a52190:	e8 cb b9 ff ff       	call   a4db60 <strstr>
  a52195:	48                   	dec    %eax
  a52196:	39 c5                	cmp    %eax,%ebp
  a52198:	0f 84 f4 00 00 00    	je     a52292 <efi_parse_options+0x142>
  a5219e:	48                   	dec    %eax
  a5219f:	85 c0                	test   %eax,%eax
  a521a1:	74 0f                	je     a521b2 <efi_parse_options+0x62>
  a521a3:	48                   	dec    %eax
  a521a4:	39 c5                	cmp    %eax,%ebp
  a521a6:	73 0a                	jae    a521b2 <efi_parse_options+0x62>
  a521a8:	80 78 ff 20          	cmpb   $0x20,-0x1(%eax)
  a521ac:	0f 84 e0 00 00 00    	je     a52292 <efi_parse_options+0x142>
  a521b2:	48                   	dec    %eax
  a521b3:	8d 35 e4 27 00 00    	lea    0x27e4,%esi
  a521b9:	48                   	dec    %eax
  a521ba:	89 ef                	mov    %ebp,%edi
  a521bc:	e8 9f b9 ff ff       	call   a4db60 <strstr>
  a521c1:	48                   	dec    %eax
  a521c2:	89 c3                	mov    %eax,%ebx
  a521c4:	48                   	dec    %eax
  a521c5:	85 c0                	test   %eax,%eax
  a521c7:	74 73                	je     a5223c <efi_parse_options+0xec>
  a521c9:	48                   	dec    %eax
  a521ca:	8d 3d cd 27 00 00    	lea    0x27cd,%edi
  a521d0:	e8 5b b9 ff ff       	call   a4db30 <strlen>
  a521d5:	48                   	dec    %eax
  a521d6:	01 c3                	add    %eax,%ebx
  a521d8:	f6 03 df             	testb  $0xdf,(%ebx)
  a521db:	74 5f                	je     a5223c <efi_parse_options+0xec>
  a521dd:	48                   	dec    %eax
  a521de:	8d 2d be 27 00 00    	lea    0x27be,%ebp
  a521e4:	0f 1f 40 00          	nopl   0x0(%eax)
  a521e8:	ba 07 00 00 00       	mov    $0x7,%edx
  a521ed:	48                   	dec    %eax
  a521ee:	89 ee                	mov    %ebp,%esi
  a521f0:	48                   	dec    %eax
  a521f1:	89 df                	mov    %ebx,%edi
  a521f3:	e8 88 b7 ff ff       	call   a4d980 <strncmp>
  a521f8:	85 c0                	test   %eax,%eax
  a521fa:	74 6c                	je     a52268 <efi_parse_options+0x118>
  a521fc:	ba 07 00 00 00       	mov    $0x7,%edx
  a52201:	48                   	dec    %eax
  a52202:	8d 35 a2 27 00 00    	lea    0x27a2,%esi
  a52208:	48                   	dec    %eax
  a52209:	89 df                	mov    %ebx,%edi
  a5220b:	e8 70 b7 ff ff       	call   a4d980 <strncmp>
  a52210:	85 c0                	test   %eax,%eax
  a52212:	74 34                	je     a52248 <efi_parse_options+0xf8>
  a52214:	0f b6 03             	movzbl (%ebx),%eax
  a52217:	a8 df                	test   $0xdf,%al
  a52219:	75 09                	jne    a52224 <efi_parse_options+0xd4>
  a5221b:	eb 1f                	jmp    a5223c <efi_parse_options+0xec>
  a5221d:	0f 1f 00             	nopl   (%eax)
  a52220:	84 d2                	test   %dl,%dl
  a52222:	74 18                	je     a5223c <efi_parse_options+0xec>
  a52224:	89 c1                	mov    %eax,%ecx
  a52226:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
  a5222a:	48                   	dec    %eax
  a5222b:	83 c3 01             	add    $0x1,%ebx
  a5222e:	89 c2                	mov    %eax,%edx
  a52230:	83 e2 df             	and    $0xffffffdf,%edx
  a52233:	80 f9 2c             	cmp    $0x2c,%cl
  a52236:	75 e8                	jne    a52220 <efi_parse_options+0xd0>
  a52238:	84 d2                	test   %dl,%dl
  a5223a:	75 ac                	jne    a521e8 <efi_parse_options+0x98>
  a5223c:	48                   	dec    %eax
  a5223d:	83 c4 08             	add    $0x8,%esp
  a52240:	31 c0                	xor    %eax,%eax
  a52242:	5b                   	pop    %ebx
  a52243:	5d                   	pop    %ebp
  a52244:	c3                   	ret    
  a52245:	0f 1f 00             	nopl   (%eax)
  a52248:	48                   	dec    %eax
  a52249:	8d 3d 5b 27 00 00    	lea    0x275b,%edi
  a5224f:	e8 dc b8 ff ff       	call   a4db30 <strlen>
  a52254:	c7 05 d2 3c 00 00 01 	movl   $0x1,0x3cd2
  a5225b:	00 00 00 
  a5225e:	48                   	dec    %eax
  a5225f:	01 c3                	add    %eax,%ebx
  a52261:	eb b1                	jmp    a52214 <efi_parse_options+0xc4>
  a52263:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a52268:	48                   	dec    %eax
  a52269:	89 ef                	mov    %ebp,%edi
  a5226b:	e8 c0 b8 ff ff       	call   a4db30 <strlen>
  a52270:	48                   	dec    %eax
  a52271:	c7 05 c5 3c 00 00 ff 	movl   $0xffffffff,0x3cc5
  a52278:	ff ff ff 
  a5227b:	48                   	dec    %eax
  a5227c:	01 c3                	add    %eax,%ebx
  a5227e:	e9 79 ff ff ff       	jmp    a521fc <efi_parse_options+0xac>
  a52283:	c7 05 ab 3c 00 00 01 	movl   $0x1,0x3cab
  a5228a:	00 00 00 
  a5228d:	e9 f4 fe ff ff       	jmp    a52186 <efi_parse_options+0x36>
  a52292:	c7 05 98 3c 00 00 01 	movl   $0x1,0x3c98
  a52299:	00 00 00 
  a5229c:	e9 11 ff ff ff       	jmp    a521b2 <efi_parse_options+0x62>
  a522a1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a522a8:	00 00 00 00 
  a522ac:	0f 1f 40 00          	nopl   0x0(%eax)

0000000000a522b0 <handle_cmdline_files>:
  a522b0:	f3 0f 1e fa          	endbr64 
  a522b4:	41                   	inc    %ecx
  a522b5:	57                   	push   %edi
  a522b6:	41                   	inc    %ecx
  a522b7:	56                   	push   %esi
  a522b8:	41                   	inc    %ecx
  a522b9:	55                   	push   %ebp
  a522ba:	41                   	inc    %ecx
  a522bb:	54                   	push   %esp
  a522bc:	55                   	push   %ebp
  a522bd:	53                   	push   %ebx
  a522be:	48                   	dec    %eax
  a522bf:	81 ec a8 02 00 00    	sub    $0x2a8,%esp
  a522c5:	48                   	dec    %eax
  a522c6:	89 7c 24 20          	mov    %edi,0x20(%esp)
  a522ca:	48                   	dec    %eax
  a522cb:	89 74 24 48          	mov    %esi,0x48(%esp)
  a522cf:	4c                   	dec    %esp
  a522d0:	89 44 24 58          	mov    %eax,0x58(%esp)
  a522d4:	4c                   	dec    %esp
  a522d5:	89 4c 24 50          	mov    %ecx,0x50(%esp)
  a522d9:	48                   	dec    %eax
  a522da:	c7 44 24 70 00 00 00 	movl   $0x0,0x70(%esp)
  a522e1:	00 
  a522e2:	4d                   	dec    %ebp
  a522e3:	85 c9                	test   %ecx,%ecx
  a522e5:	0f 84 7d 03 00 00    	je     a52668 <handle_cmdline_files+0x3b8>
  a522eb:	48                   	dec    %eax
  a522ec:	83 bc 24 e0 02 00 00 	cmpl   $0x0,0x2e0(%esp)
  a522f3:	00 
  a522f4:	0f 84 6e 03 00 00    	je     a52668 <handle_cmdline_files+0x3b8>
  a522fa:	48                   	dec    %eax
  a522fb:	8b 84 24 e0 02 00 00 	mov    0x2e0(%esp),%eax
  a52302:	49                   	dec    %ecx
  a52303:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
  a52309:	48                   	dec    %eax
  a5230a:	89 d5                	mov    %edx,%ebp
  a5230c:	48                   	dec    %eax
  a5230d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  a52313:	48                   	dec    %eax
  a52314:	85 d2                	test   %edx,%edx
  a52316:	0f 84 2c 03 00 00    	je     a52648 <handle_cmdline_files+0x398>
  a5231c:	80 3a 00             	cmpb   $0x0,(%edx)
  a5231f:	0f 84 23 03 00 00    	je     a52648 <handle_cmdline_files+0x398>
  a52325:	49                   	dec    %ecx
  a52326:	89 cf                	mov    %ecx,%edi
  a52328:	48                   	dec    %eax
  a52329:	89 d7                	mov    %edx,%edi
  a5232b:	45                   	inc    %ebp
  a5232c:	31 e4                	xor    %esp,%esp
  a5232e:	66 90                	xchg   %ax,%ax
  a52330:	4c                   	dec    %esp
  a52331:	89 fe                	mov    %edi,%esi
  a52333:	e8 28 b8 ff ff       	call   a4db60 <strstr>
  a52338:	48                   	dec    %eax
  a52339:	89 c3                	mov    %eax,%ebx
  a5233b:	48                   	dec    %eax
  a5233c:	85 c0                	test   %eax,%eax
  a5233e:	0f 84 f6 02 00 00    	je     a5263a <handle_cmdline_files+0x38a>
  a52344:	4c                   	dec    %esp
  a52345:	89 ff                	mov    %edi,%edi
  a52347:	e8 e4 b7 ff ff       	call   a4db30 <strlen>
  a5234c:	48                   	dec    %eax
  a5234d:	8d 3c 03             	lea    (%ebx,%eax,1),%edi
  a52350:	0f b6 07             	movzbl (%edi),%eax
  a52353:	3c 2f                	cmp    $0x2f,%al
  a52355:	75 15                	jne    a5236c <handle_cmdline_files+0xbc>
  a52357:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a5235e:	00 00 
  a52360:	0f b6 47 01          	movzbl 0x1(%edi),%eax
  a52364:	48                   	dec    %eax
  a52365:	83 c7 01             	add    $0x1,%edi
  a52368:	3c 2f                	cmp    $0x2f,%al
  a5236a:	74 f4                	je     a52360 <handle_cmdline_files+0xb0>
  a5236c:	3c 5c                	cmp    $0x5c,%al
  a5236e:	74 f0                	je     a52360 <handle_cmdline_files+0xb0>
  a52370:	a8 df                	test   $0xdf,%al
  a52372:	74 14                	je     a52388 <handle_cmdline_files+0xd8>
  a52374:	0f 1f 40 00          	nopl   0x0(%eax)
  a52378:	3c 0a                	cmp    $0xa,%al
  a5237a:	74 0c                	je     a52388 <handle_cmdline_files+0xd8>
  a5237c:	0f b6 47 01          	movzbl 0x1(%edi),%eax
  a52380:	48                   	dec    %eax
  a52381:	83 c7 01             	add    $0x1,%edi
  a52384:	a8 df                	test   $0xdf,%al
  a52386:	75 f0                	jne    a52378 <handle_cmdline_files+0xc8>
  a52388:	41                   	inc    %ecx
  a52389:	83 c4 01             	add    $0x1,%esp
  a5238c:	84 c0                	test   %al,%al
  a5238e:	75 a0                	jne    a52330 <handle_cmdline_files+0x80>
  a52390:	44                   	inc    %esp
  a52391:	89 64 24 34          	mov    %esp,0x34(%esp)
  a52395:	e8 26 de ff ff       	call   a501c0 <__efi_early>
  a5239a:	48                   	dec    %eax
  a5239b:	63 54 24 34          	arpl   %dx,0x34(%esp)
  a5239f:	4c                   	dec    %esp
  a523a0:	8b 40 28             	mov    0x28(%eax),%eax
  a523a3:	48                   	dec    %eax
  a523a4:	8b 48 18             	mov    0x18(%eax),%ecx
  a523a7:	48                   	dec    %eax
  a523a8:	c1 e2 04             	shl    $0x4,%edx
  a523ab:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a523af:	0f 85 c4 02 00 00    	jne    a52679 <handle_cmdline_files+0x3c9>
  a523b5:	8b 79 2c             	mov    0x2c(%ecx),%edi
  a523b8:	48                   	dec    %eax
  a523b9:	8d 4c 24 68          	lea    0x68(%esp),%ecx
  a523bd:	be 02 00 00 00       	mov    $0x2,%esi
  a523c2:	31 c0                	xor    %eax,%eax
  a523c4:	41                   	inc    %ecx
  a523c5:	ff d0                	call   *%eax
  a523c7:	48                   	dec    %eax
  a523c8:	89 44 24 40          	mov    %eax,0x40(%esp)
  a523cc:	48                   	dec    %eax
  a523cd:	85 c0                	test   %eax,%eax
  a523cf:	0f 85 11 06 00 00    	jne    a529e6 <handle_cmdline_files+0x736>
  a523d5:	48                   	dec    %eax
  a523d6:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  a523dd:	00 
  a523de:	45                   	inc    %ebp
  a523df:	31 e4                	xor    %esp,%esp
  a523e1:	4d                   	dec    %ebp
  a523e2:	89 fe                	mov    %edi,%esi
  a523e4:	48                   	dec    %eax
  a523e5:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  a523ec:	00 
  a523ed:	0f 1f 00             	nopl   (%eax)
  a523f0:	48                   	dec    %eax
  a523f1:	89 ef                	mov    %ebp,%edi
  a523f3:	4c                   	dec    %esp
  a523f4:	89 f6                	mov    %esi,%esi
  a523f6:	44                   	inc    %esp
  a523f7:	89 64 24 30          	mov    %esp,0x30(%esp)
  a523fb:	44                   	inc    %esp
  a523fc:	89 64 24 1c          	mov    %esp,0x1c(%esp)
  a52400:	e8 5b b7 ff ff       	call   a4db60 <strstr>
  a52405:	48                   	dec    %eax
  a52406:	89 c5                	mov    %eax,%ebp
  a52408:	48                   	dec    %eax
  a52409:	85 c0                	test   %eax,%eax
  a5240b:	0f 84 db 02 00 00    	je     a526ec <handle_cmdline_files+0x43c>
  a52411:	4c                   	dec    %esp
  a52412:	89 f7                	mov    %esi,%edi
  a52414:	e8 17 b7 ff ff       	call   a4db30 <strlen>
  a52419:	48                   	dec    %eax
  a5241a:	01 c5                	add    %eax,%ebp
  a5241c:	4c                   	dec    %esp
  a5241d:	89 e0                	mov    %esp,%eax
  a5241f:	48                   	dec    %eax
  a52420:	c1 e0 04             	shl    $0x4,%eax
  a52423:	48                   	dec    %eax
  a52424:	03 44 24 68          	add    0x68(%esp),%eax
  a52428:	48                   	dec    %eax
  a52429:	89 44 24 08          	mov    %eax,0x8(%esp)
  a5242d:	66 0f be 45 00       	movsbw 0x0(%ebp),%ax
  a52432:	3c 5c                	cmp    $0x5c,%al
  a52434:	74 0a                	je     a52440 <handle_cmdline_files+0x190>
  a52436:	3c 2f                	cmp    $0x2f,%al
  a52438:	75 17                	jne    a52451 <handle_cmdline_files+0x1a1>
  a5243a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a52440:	66 0f be 45 01       	movsbw 0x1(%ebp),%ax
  a52445:	48                   	dec    %eax
  a52446:	83 c5 01             	add    $0x1,%ebp
  a52449:	3c 2f                	cmp    $0x2f,%al
  a5244b:	74 f3                	je     a52440 <handle_cmdline_files+0x190>
  a5244d:	3c 5c                	cmp    $0x5c,%al
  a5244f:	74 ef                	je     a52440 <handle_cmdline_files+0x190>
  a52451:	4c                   	dec    %esp
  a52452:	8d ac 24 a0 00 00 00 	lea    0xa0(%esp),%ebp
  a52459:	4c                   	dec    %esp
  a5245a:	89 ea                	mov    %ebp,%edx
  a5245c:	a8 df                	test   $0xdf,%al
  a5245e:	74 43                	je     a524a3 <handle_cmdline_files+0x1f3>
  a52460:	3c 0a                	cmp    $0xa,%al
  a52462:	74 3f                	je     a524a3 <handle_cmdline_files+0x1f3>
  a52464:	bf 5c 00 00 00       	mov    $0x5c,%edi
  a52469:	eb 12                	jmp    a5247d <handle_cmdline_files+0x1cd>
  a5246b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a52470:	48                   	dec    %eax
  a52471:	8d 9c 24 a0 02 00 00 	lea    0x2a0(%esp),%ebx
  a52478:	48                   	dec    %eax
  a52479:	39 da                	cmp    %ebx,%edx
  a5247b:	73 26                	jae    a524a3 <handle_cmdline_files+0x1f3>
  a5247d:	48                   	dec    %eax
  a5247e:	83 c5 01             	add    $0x1,%ebp
  a52481:	48                   	dec    %eax
  a52482:	83 c2 02             	add    $0x2,%edx
  a52485:	3c 2f                	cmp    $0x2f,%al
  a52487:	0f 44 c7             	cmove  %edi,%eax
  a5248a:	66 89 42 fe          	mov    %ax,-0x2(%edx)
  a5248e:	66 0f be 45 00       	movsbw 0x0(%ebp),%ax
  a52493:	a8 df                	test   $0xdf,%al
  a52495:	40                   	inc    %eax
  a52496:	0f 95 c6             	setne  %dh
  a52499:	3c 0a                	cmp    $0xa,%al
  a5249b:	0f 95 c1             	setne  %cl
  a5249e:	40                   	inc    %eax
  a5249f:	84 ce                	test   %cl,%dh
  a524a1:	75 cd                	jne    a52470 <handle_cmdline_files+0x1c0>
  a524a3:	31 c0                	xor    %eax,%eax
  a524a5:	66 89 02             	mov    %ax,(%edx)
  a524a8:	4d                   	dec    %ebp
  a524a9:	85 e4                	test   %esp,%esp
  a524ab:	0f 84 af 02 00 00    	je     a52760 <handle_cmdline_files+0x4b0>
  a524b1:	48                   	dec    %eax
  a524b2:	b8 92 6e 57 09       	mov    $0x9576e92,%eax
  a524b7:	3f                   	aas    
  a524b8:	6d                   	insl   (%dx),%es:(%edi)
  a524b9:	d2 11                	rclb   %cl,(%ecx)
  a524bb:	48                   	dec    %eax
  a524bc:	89 84 24 90 00 00 00 	mov    %eax,0x90(%esp)
  a524c3:	48                   	dec    %eax
  a524c4:	b8 8e 39 00 a0       	mov    $0xa000398e,%eax
  a524c9:	c9                   	leave  
  a524ca:	69 72 3b 48 89 84 24 	imul   $0x24848948,0x3b(%edx),%esi
  a524d1:	98                   	cwtl   
  a524d2:	00 00                	add    %al,(%eax)
  a524d4:	00 e8                	add    %ch,%al
  a524d6:	e6 dc                	out    %al,$0xdc
  a524d8:	ff                   	(bad)  
  a524d9:	ff 80 78 30 00 4c    	incl   0x4c003078(%eax)
  a524df:	8b 50 28             	mov    0x28(%eax),%edx
  a524e2:	48                   	dec    %eax
  a524e3:	8b 44 24 10          	mov    0x10(%esp),%eax
  a524e7:	0f 84 53 02 00 00    	je     a52740 <handle_cmdline_files+0x490>
  a524ed:	48                   	dec    %eax
  a524ee:	8b 78 08             	mov    0x8(%eax),%edi
  a524f1:	45                   	inc    %ebp
  a524f2:	31 c9                	xor    %ecx,%ecx
  a524f4:	31 c0                	xor    %eax,%eax
  a524f6:	48                   	dec    %eax
  a524f7:	8b 74 24 10          	mov    0x10(%esp),%esi
  a524fb:	48                   	dec    %eax
  a524fc:	8d 54 24 78          	lea    0x78(%esp),%edx
  a52500:	41                   	inc    %ecx
  a52501:	b8 01 00 00 00       	mov    $0x1,%eax
  a52506:	4c                   	dec    %esp
  a52507:	89 e9                	mov    %ebp,%ecx
  a52509:	41                   	inc    %ecx
  a5250a:	ff d2                	call   *%edx
  a5250c:	48                   	dec    %eax
  a5250d:	85 c0                	test   %eax,%eax
  a5250f:	0f 85 fb 03 00 00    	jne    a52910 <handle_cmdline_files+0x660>
  a52515:	4c                   	dec    %esp
  a52516:	8b 7c 24 78          	mov    0x78(%esp),%edi
  a5251a:	48                   	dec    %eax
  a5251b:	8b 44 24 08          	mov    0x8(%esp),%eax
  a5251f:	4c                   	dec    %esp
  a52520:	89 38                	mov    %edi,(%eax)
  a52522:	48                   	dec    %eax
  a52523:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
  a5252a:	00 00 00 00 
  a5252e:	e8 8d dc ff ff       	call   a501c0 <__efi_early>
  a52533:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52537:	4c                   	dec    %esp
  a52538:	8b 48 28             	mov    0x28(%eax),%ecx
  a5253b:	0f 84 0f 02 00 00    	je     a52750 <handle_cmdline_files+0x4a0>
  a52541:	49                   	dec    %ecx
  a52542:	8b 7f 40             	mov    0x40(%edi),%edi
  a52545:	4c                   	dec    %esp
  a52546:	8d ac 24 88 00 00 00 	lea    0x88(%esp),%ebp
  a5254d:	4c                   	dec    %esp
  a5254e:	89 fe                	mov    %edi,%esi
  a52550:	45                   	inc    %ebp
  a52551:	31 c0                	xor    %eax,%eax
  a52553:	31 c0                	xor    %eax,%eax
  a52555:	48                   	dec    %eax
  a52556:	8d 9c 24 90 00 00 00 	lea    0x90(%esp),%ebx
  a5255d:	4c                   	dec    %esp
  a5255e:	89 e9                	mov    %ebp,%ecx
  a52560:	48                   	dec    %eax
  a52561:	89 da                	mov    %ebx,%edx
  a52563:	41                   	inc    %ecx
  a52564:	ff d1                	call   *%ecx
  a52566:	48                   	dec    %eax
  a52567:	89 c2                	mov    %eax,%edx
  a52569:	4c                   	dec    %esp
  a5256a:	8d bc 24 80 00 00 00 	lea    0x80(%esp),%edi
  a52571:	48                   	dec    %eax
  a52572:	b8 05 00 00 00       	mov    $0x5,%eax
  a52577:	00 00                	add    %al,(%eax)
  a52579:	00 80 48 39 c2 0f    	add    %al,0xfc23948(%eax)
  a5257f:	84 8f 00 00 00 e9    	test   %cl,-0x17000000(%edi)
  a52585:	17                   	pop    %ss
  a52586:	01 00                	add    %eax,(%eax)
  a52588:	00 0f                	add    %cl,(%edi)
  a5258a:	1f                   	pop    %ds
  a5258b:	80 00 00             	addb   $0x0,(%eax)
  a5258e:	00 00                	add    %al,(%eax)
  a52590:	48                   	dec    %eax
  a52591:	8b 79 40             	mov    0x40(%ecx),%edi
  a52594:	31 c0                	xor    %eax,%eax
  a52596:	4c                   	dec    %esp
  a52597:	89 f9                	mov    %edi,%ecx
  a52599:	be 02 00 00 00       	mov    $0x2,%esi
  a5259e:	41                   	inc    %ecx
  a5259f:	ff d0                	call   *%eax
  a525a1:	48                   	dec    %eax
  a525a2:	85 c0                	test   %eax,%eax
  a525a4:	0f 85 76 02 00 00    	jne    a52820 <handle_cmdline_files+0x570>
  a525aa:	e8 11 dc ff ff       	call   a501c0 <__efi_early>
  a525af:	4c                   	dec    %esp
  a525b0:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
  a525b7:	48                   	dec    %eax
  a525b8:	8b 74 24 78          	mov    0x78(%esp),%esi
  a525bc:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a525c0:	4c                   	dec    %esp
  a525c1:	8b 48 28             	mov    0x28(%eax),%ecx
  a525c4:	0f 84 be 00 00 00    	je     a52688 <handle_cmdline_files+0x3d8>
  a525ca:	48                   	dec    %eax
  a525cb:	8b 7e 40             	mov    0x40(%esi),%edi
  a525ce:	4c                   	dec    %esp
  a525cf:	89 e9                	mov    %ebp,%ecx
  a525d1:	48                   	dec    %eax
  a525d2:	89 da                	mov    %ebx,%edx
  a525d4:	31 c0                	xor    %eax,%eax
  a525d6:	41                   	inc    %ecx
  a525d7:	ff d1                	call   *%ecx
  a525d9:	48                   	dec    %eax
  a525da:	b9 05 00 00 00       	mov    $0x5,%ecx
  a525df:	00 00                	add    %al,(%eax)
  a525e1:	00 80 48 39 c8 0f    	add    %al,0xfc83948(%eax)
  a525e7:	85 b4 02 00 00 e8 cf 	test   %esi,-0x30180000(%edx,%eax,1)
  a525ee:	db ff                	(bad)  
  a525f0:	ff 48 8b             	decl   -0x75(%eax)
  a525f3:	b4 24                	mov    $0x24,%ah
  a525f5:	80 00 00             	addb   $0x0,(%eax)
  a525f8:	00 80 78 30 00 48    	add    %al,0x48003078(%eax)
  a525fe:	8b 50 28             	mov    0x28(%eax),%edx
  a52601:	48                   	dec    %eax
  a52602:	8b 48 18             	mov    0x18(%eax),%ecx
  a52605:	0f 84 85 00 00 00    	je     a52690 <handle_cmdline_files+0x3e0>
  a5260b:	48                   	dec    %eax
  a5260c:	8b 79 48             	mov    0x48(%ecx),%edi
  a5260f:	31 c0                	xor    %eax,%eax
  a52611:	ff d2                	call   *%edx
  a52613:	e8 a8 db ff ff       	call   a501c0 <__efi_early>
  a52618:	48                   	dec    %eax
  a52619:	8b 94 24 88 00 00 00 	mov    0x88(%esp),%edx
  a52620:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52624:	4c                   	dec    %esp
  a52625:	8b 40 28             	mov    0x28(%eax),%eax
  a52628:	48                   	dec    %eax
  a52629:	8b 48 18             	mov    0x18(%eax),%ecx
  a5262c:	0f 85 5e ff ff ff    	jne    a52590 <handle_cmdline_files+0x2e0>
  a52632:	8b 79 2c             	mov    0x2c(%ecx),%edi
  a52635:	e9 5a ff ff ff       	jmp    a52594 <handle_cmdline_files+0x2e4>
  a5263a:	44                   	inc    %esp
  a5263b:	89 64 24 34          	mov    %esp,0x34(%esp)
  a5263f:	45                   	inc    %ebp
  a52640:	85 e4                	test   %esp,%esp
  a52642:	0f 85 4d fd ff ff    	jne    a52395 <handle_cmdline_files+0xe5>
  a52648:	48                   	dec    %eax
  a52649:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%esp)
  a52650:	00 
  a52651:	48                   	dec    %eax
  a52652:	8b 44 24 40          	mov    0x40(%esp),%eax
  a52656:	48                   	dec    %eax
  a52657:	81 c4 a8 02 00 00    	add    $0x2a8,%esp
  a5265d:	5b                   	pop    %ebx
  a5265e:	5d                   	pop    %ebp
  a5265f:	41                   	inc    %ecx
  a52660:	5c                   	pop    %esp
  a52661:	41                   	inc    %ecx
  a52662:	5d                   	pop    %ebp
  a52663:	41                   	inc    %ecx
  a52664:	5e                   	pop    %esi
  a52665:	41                   	inc    %ecx
  a52666:	5f                   	pop    %edi
  a52667:	c3                   	ret    
  a52668:	48                   	dec    %eax
  a52669:	b8 02 00 00 00       	mov    $0x2,%eax
  a5266e:	00 00                	add    %al,(%eax)
  a52670:	00 80 48 89 44 24    	add    %al,0x24448948(%eax)
  a52676:	40                   	inc    %eax
  a52677:	eb d8                	jmp    a52651 <handle_cmdline_files+0x3a1>
  a52679:	48                   	dec    %eax
  a5267a:	8b 79 40             	mov    0x40(%ecx),%edi
  a5267d:	e9 36 fd ff ff       	jmp    a523b8 <handle_cmdline_files+0x108>
  a52682:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a52688:	8b 7e 24             	mov    0x24(%esi),%edi
  a5268b:	e9 3e ff ff ff       	jmp    a525ce <handle_cmdline_files+0x31e>
  a52690:	8b 79 30             	mov    0x30(%ecx),%edi
  a52693:	e9 77 ff ff ff       	jmp    a5260f <handle_cmdline_files+0x35f>
  a52698:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5269f:	00 
  a526a0:	48                   	dec    %eax
  a526a1:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a526a5:	48                   	dec    %eax
  a526a6:	8d 35 4e 23 00 00    	lea    0x234e,%esi
  a526ac:	48                   	dec    %eax
  a526ad:	89 54 24 28          	mov    %edx,0x28(%esp)
  a526b1:	e8 ea f2 ff ff       	call   a519a0 <efi_printk>
  a526b6:	48                   	dec    %eax
  a526b7:	8b 54 24 28          	mov    0x28(%esp),%edx
  a526bb:	48                   	dec    %eax
  a526bc:	85 d2                	test   %edx,%edx
  a526be:	0f 85 d0 04 00 00    	jne    a52b94 <handle_cmdline_files+0x8e4>
  a526c4:	8b 44 24 30          	mov    0x30(%esp),%eax
  a526c8:	48                   	dec    %eax
  a526c9:	8b 5c 24 08          	mov    0x8(%esp),%ebx
  a526cd:	49                   	dec    %ecx
  a526ce:	83 c4 01             	add    $0x1,%esp
  a526d1:	83 c0 01             	add    $0x1,%eax
  a526d4:	48                   	dec    %eax
  a526d5:	8b 5b 08             	mov    0x8(%ebx),%ebx
  a526d8:	48                   	dec    %eax
  a526d9:	01 5c 24 38          	add    %ebx,0x38(%esp)
  a526dd:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  a526e1:	44                   	inc    %esp
  a526e2:	39 64 24 34          	cmp    %esp,0x34(%esp)
  a526e6:	0f 8f 04 fd ff ff    	jg     a523f0 <handle_cmdline_files+0x140>
  a526ec:	48                   	dec    %eax
  a526ed:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
  a526f2:	0f 85 0a 03 00 00    	jne    a52a02 <handle_cmdline_files+0x752>
  a526f8:	e8 c3 da ff ff       	call   a501c0 <__efi_early>
  a526fd:	48                   	dec    %eax
  a526fe:	8b 74 24 68          	mov    0x68(%esp),%esi
  a52702:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52706:	48                   	dec    %eax
  a52707:	8b 50 28             	mov    0x28(%eax),%edx
  a5270a:	48                   	dec    %eax
  a5270b:	8b 48 18             	mov    0x18(%eax),%ecx
  a5270e:	0f 85 e5 02 00 00    	jne    a529f9 <handle_cmdline_files+0x749>
  a52714:	8b 79 30             	mov    0x30(%ecx),%edi
  a52717:	31 c0                	xor    %eax,%eax
  a52719:	ff d2                	call   *%edx
  a5271b:	48                   	dec    %eax
  a5271c:	8b 44 24 70          	mov    0x70(%esp),%eax
  a52720:	48                   	dec    %eax
  a52721:	8b 5c 24 50          	mov    0x50(%esp),%ebx
  a52725:	48                   	dec    %eax
  a52726:	89 03                	mov    %eax,(%ebx)
  a52728:	48                   	dec    %eax
  a52729:	8b 84 24 e0 02 00 00 	mov    0x2e0(%esp),%eax
  a52730:	48                   	dec    %eax
  a52731:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  a52735:	48                   	dec    %eax
  a52736:	89 18                	mov    %ebx,(%eax)
  a52738:	e9 14 ff ff ff       	jmp    a52651 <handle_cmdline_files+0x3a1>
  a5273d:	0f 1f 00             	nopl   (%eax)
  a52740:	8b 78 08             	mov    0x8(%eax),%edi
  a52743:	e9 a9 fd ff ff       	jmp    a524f1 <handle_cmdline_files+0x241>
  a52748:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5274f:	00 
  a52750:	41                   	inc    %ecx
  a52751:	8b 7f 24             	mov    0x24(%edi),%edi
  a52754:	e9 ec fd ff ff       	jmp    a52545 <handle_cmdline_files+0x295>
  a52759:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a52760:	48                   	dec    %eax
  a52761:	b8 22 5b 4e 96       	mov    $0x964e5b22,%eax
  a52766:	59                   	pop    %ecx
  a52767:	64 d2 11             	rclb   %cl,%fs:(%ecx)
  a5276a:	48                   	dec    %eax
  a5276b:	89 84 24 90 00 00 00 	mov    %eax,0x90(%esp)
  a52772:	48                   	dec    %eax
  a52773:	b8 8e 39 00 a0       	mov    $0xa000398e,%eax
  a52778:	c9                   	leave  
  a52779:	69 72 3b 48 89 84 24 	imul   $0x24848948,0x3b(%edx),%esi
  a52780:	98                   	cwtl   
  a52781:	00 00                	add    %al,(%eax)
  a52783:	00 e8                	add    %ch,%al
  a52785:	37                   	aaa    
  a52786:	da ff                	(bad)  
  a52788:	ff 48 8b             	decl   -0x75(%eax)
  a5278b:	5c                   	pop    %esp
  a5278c:	24 48                	and    $0x48,%al
  a5278e:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52792:	0f 84 b8 01 00 00    	je     a52950 <handle_cmdline_files+0x6a0>
  a52798:	4c                   	dec    %esp
  a52799:	8b 40 28             	mov    0x28(%eax),%eax
  a5279c:	48                   	dec    %eax
  a5279d:	8b 40 18             	mov    0x18(%eax),%eax
  a527a0:	48                   	dec    %eax
  a527a1:	8b 73 18             	mov    0x18(%ebx),%esi
  a527a4:	48                   	dec    %eax
  a527a5:	8b b8 98 00 00 00    	mov    0x98(%eax),%edi
  a527ab:	4c                   	dec    %esp
  a527ac:	8d bc 24 80 00 00 00 	lea    0x80(%esp),%edi
  a527b3:	48                   	dec    %eax
  a527b4:	8d 94 24 90 00 00 00 	lea    0x90(%esp),%edx
  a527bb:	31 c0                	xor    %eax,%eax
  a527bd:	4c                   	dec    %esp
  a527be:	89 f9                	mov    %edi,%ecx
  a527c0:	41                   	inc    %ecx
  a527c1:	ff d0                	call   *%eax
  a527c3:	48                   	dec    %eax
  a527c4:	89 c3                	mov    %eax,%ebx
  a527c6:	48                   	dec    %eax
  a527c7:	85 c0                	test   %eax,%eax
  a527c9:	0f 85 ff 01 00 00    	jne    a529ce <handle_cmdline_files+0x71e>
  a527cf:	e8 ec d9 ff ff       	call   a501c0 <__efi_early>
  a527d4:	48                   	dec    %eax
  a527d5:	8b b4 24 80 00 00 00 	mov    0x80(%esp),%esi
  a527dc:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a527e0:	48                   	dec    %eax
  a527e1:	8b 48 28             	mov    0x28(%eax),%ecx
  a527e4:	0f 84 7e 01 00 00    	je     a52968 <handle_cmdline_files+0x6b8>
  a527ea:	48                   	dec    %eax
  a527eb:	8b 7e 08             	mov    0x8(%esi),%edi
  a527ee:	48                   	dec    %eax
  a527ef:	8d 94 24 88 00 00 00 	lea    0x88(%esp),%edx
  a527f6:	31 c0                	xor    %eax,%eax
  a527f8:	ff d1                	call   *%ecx
  a527fa:	48                   	dec    %eax
  a527fb:	89 c3                	mov    %eax,%ebx
  a527fd:	48                   	dec    %eax
  a527fe:	85 c0                	test   %eax,%eax
  a52800:	0f 85 72 01 00 00    	jne    a52978 <handle_cmdline_files+0x6c8>
  a52806:	48                   	dec    %eax
  a52807:	8b 84 24 88 00 00 00 	mov    0x88(%esp),%eax
  a5280e:	48                   	dec    %eax
  a5280f:	89 44 24 10          	mov    %eax,0x10(%esp)
  a52813:	e9 99 fc ff ff       	jmp    a524b1 <handle_cmdline_files+0x201>
  a52818:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5281f:	00 
  a52820:	48                   	dec    %eax
  a52821:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a52825:	48                   	dec    %eax
  a52826:	8d 35 4c 22 00 00    	lea    0x224c,%esi
  a5282c:	49                   	dec    %ecx
  a5282d:	89 c6                	mov    %eax,%esi
  a5282f:	e8 6c f1 ff ff       	call   a519a0 <efi_printk>
  a52834:	4c                   	dec    %esp
  a52835:	89 74 24 40          	mov    %esi,0x40(%esp)
  a52839:	31 ed                	xor    %ebp,%ebp
  a5283b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  a5283f:	39 c5                	cmp    %eax,%ebp
  a52841:	0f 8d 47 01 00 00    	jge    a5298e <handle_cmdline_files+0x6de>
  a52847:	8d 55 01             	lea    0x1(%ebp),%edx
  a5284a:	83 e8 01             	sub    $0x1,%eax
  a5284d:	48                   	dec    %eax
  a5284e:	63 dd                	arpl   %bx,%bp
  a52850:	29 e8                	sub    %ebp,%eax
  a52852:	48                   	dec    %eax
  a52853:	63 d2                	arpl   %dx,%dx
  a52855:	48                   	dec    %eax
  a52856:	c1 e3 04             	shl    $0x4,%ebx
  a52859:	48                   	dec    %eax
  a5285a:	01 d0                	add    %edx,%eax
  a5285c:	48                   	dec    %eax
  a5285d:	c1 e0 04             	shl    $0x4,%eax
  a52860:	48                   	dec    %eax
  a52861:	89 c5                	mov    %eax,%ebp
  a52863:	eb 1c                	jmp    a52881 <handle_cmdline_files+0x5d1>
  a52865:	0f 1f 00             	nopl   (%eax)
  a52868:	49                   	dec    %ecx
  a52869:	8b 7c 24 10          	mov    0x10(%esp),%edi
  a5286d:	48                   	dec    %eax
  a5286e:	83 c3 10             	add    $0x10,%ebx
  a52871:	4c                   	dec    %esp
  a52872:	89 e6                	mov    %esp,%esi
  a52874:	31 c0                	xor    %eax,%eax
  a52876:	ff d2                	call   *%edx
  a52878:	48                   	dec    %eax
  a52879:	39 dd                	cmp    %ebx,%ebp
  a5287b:	0f 84 0d 01 00 00    	je     a5298e <handle_cmdline_files+0x6de>
  a52881:	48                   	dec    %eax
  a52882:	8b 44 24 68          	mov    0x68(%esp),%eax
  a52886:	4c                   	dec    %esp
  a52887:	8b 24 18             	mov    (%eax,%ebx,1),%esp
  a5288a:	e8 31 d9 ff ff       	call   a501c0 <__efi_early>
  a5288f:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52893:	48                   	dec    %eax
  a52894:	8b 50 28             	mov    0x28(%eax),%edx
  a52897:	75 cf                	jne    a52868 <handle_cmdline_files+0x5b8>
  a52899:	41                   	inc    %ecx
  a5289a:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  a5289e:	eb cd                	jmp    a5286d <handle_cmdline_files+0x5bd>
  a528a0:	4c                   	dec    %esp
  a528a1:	8b ac 24 80 00 00 00 	mov    0x80(%esp),%ebp
  a528a8:	48                   	dec    %eax
  a528a9:	8b 5c 24 08          	mov    0x8(%esp),%ebx
  a528ad:	48                   	dec    %eax
  a528ae:	89 44 24 28          	mov    %eax,0x28(%esp)
  a528b2:	49                   	dec    %ecx
  a528b3:	8b 45 08             	mov    0x8(%ebp),%eax
  a528b6:	48                   	dec    %eax
  a528b7:	89 43 08             	mov    %eax,0x8(%ebx)
  a528ba:	e8 01 d9 ff ff       	call   a501c0 <__efi_early>
  a528bf:	48                   	dec    %eax
  a528c0:	8b 54 24 28          	mov    0x28(%esp),%edx
  a528c4:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a528c8:	48                   	dec    %eax
  a528c9:	8b 48 28             	mov    0x28(%eax),%ecx
  a528cc:	48                   	dec    %eax
  a528cd:	8b 40 18             	mov    0x18(%eax),%eax
  a528d0:	0f 84 9a 00 00 00    	je     a52970 <handle_cmdline_files+0x6c0>
  a528d6:	48                   	dec    %eax
  a528d7:	8b 78 48             	mov    0x48(%eax),%edi
  a528da:	48                   	dec    %eax
  a528db:	89 54 24 28          	mov    %edx,0x28(%esp)
  a528df:	4c                   	dec    %esp
  a528e0:	89 ee                	mov    %ebp,%esi
  a528e2:	31 c0                	xor    %eax,%eax
  a528e4:	ff d1                	call   *%ecx
  a528e6:	48                   	dec    %eax
  a528e7:	8b 54 24 28          	mov    0x28(%esp),%edx
  a528eb:	48                   	dec    %eax
  a528ec:	85 d2                	test   %edx,%edx
  a528ee:	0f 84 d0 fd ff ff    	je     a526c4 <handle_cmdline_files+0x414>
  a528f4:	48                   	dec    %eax
  a528f5:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a528f9:	48                   	dec    %eax
  a528fa:	8d 35 18 21 00 00    	lea    0x2118,%esi
  a52900:	49                   	dec    %ecx
  a52901:	89 d6                	mov    %edx,%esi
  a52903:	e8 98 f0 ff ff       	call   a519a0 <efi_printk>
  a52908:	e9 27 ff ff ff       	jmp    a52834 <handle_cmdline_files+0x584>
  a5290d:	0f 1f 00             	nopl   (%eax)
  a52910:	48                   	dec    %eax
  a52911:	8b 5c 24 20          	mov    0x20(%esp),%ebx
  a52915:	48                   	dec    %eax
  a52916:	8d 35 c8 20 00 00    	lea    0x20c8,%esi
  a5291c:	49                   	dec    %ecx
  a5291d:	89 c6                	mov    %eax,%esi
  a5291f:	48                   	dec    %eax
  a52920:	89 df                	mov    %ebx,%edi
  a52922:	e8 79 f0 ff ff       	call   a519a0 <efi_printk>
  a52927:	4c                   	dec    %esp
  a52928:	89 ee                	mov    %ebp,%esi
  a5292a:	48                   	dec    %eax
  a5292b:	89 df                	mov    %ebx,%edi
  a5292d:	e8 9e d8 ff ff       	call   a501d0 <efi_char16_printk>
  a52932:	48                   	dec    %eax
  a52933:	8d 35 aa 1c 00 00    	lea    0x1caa,%esi
  a52939:	48                   	dec    %eax
  a5293a:	89 df                	mov    %ebx,%edi
  a5293c:	e8 5f f0 ff ff       	call   a519a0 <efi_printk>
  a52941:	e9 ee fe ff ff       	jmp    a52834 <handle_cmdline_files+0x584>
  a52946:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a5294d:	00 00 00 
  a52950:	4c                   	dec    %esp
  a52951:	8b 40 28             	mov    0x28(%eax),%eax
  a52954:	48                   	dec    %eax
  a52955:	8b 40 18             	mov    0x18(%eax),%eax
  a52958:	8b 73 0c             	mov    0xc(%ebx),%esi
  a5295b:	8b 78 58             	mov    0x58(%eax),%edi
  a5295e:	e9 48 fe ff ff       	jmp    a527ab <handle_cmdline_files+0x4fb>
  a52963:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a52968:	8b 7e 08             	mov    0x8(%esi),%edi
  a5296b:	e9 7e fe ff ff       	jmp    a527ee <handle_cmdline_files+0x53e>
  a52970:	8b 78 30             	mov    0x30(%eax),%edi
  a52973:	e9 62 ff ff ff       	jmp    a528da <handle_cmdline_files+0x62a>
  a52978:	48                   	dec    %eax
  a52979:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a5297d:	48                   	dec    %eax
  a5297e:	8d 35 49 20 00 00    	lea    0x2049,%esi
  a52984:	e8 17 f0 ff ff       	call   a519a0 <efi_printk>
  a52989:	48                   	dec    %eax
  a5298a:	89 5c 24 40          	mov    %ebx,0x40(%esp)
  a5298e:	e8 2d d8 ff ff       	call   a501c0 <__efi_early>
  a52993:	48                   	dec    %eax
  a52994:	8b 74 24 68          	mov    0x68(%esp),%esi
  a52998:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a5299c:	48                   	dec    %eax
  a5299d:	8b 48 28             	mov    0x28(%eax),%ecx
  a529a0:	48                   	dec    %eax
  a529a1:	8b 50 18             	mov    0x18(%eax),%edx
  a529a4:	74 3b                	je     a529e1 <handle_cmdline_files+0x731>
  a529a6:	48                   	dec    %eax
  a529a7:	8b 7a 48             	mov    0x48(%edx),%edi
  a529aa:	31 c0                	xor    %eax,%eax
  a529ac:	ff d1                	call   *%ecx
  a529ae:	48                   	dec    %eax
  a529af:	8b 44 24 50          	mov    0x50(%esp),%eax
  a529b3:	48                   	dec    %eax
  a529b4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  a529ba:	48                   	dec    %eax
  a529bb:	8b 84 24 e0 02 00 00 	mov    0x2e0(%esp),%eax
  a529c2:	48                   	dec    %eax
  a529c3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  a529c9:	e9 83 fc ff ff       	jmp    a52651 <handle_cmdline_files+0x3a1>
  a529ce:	48                   	dec    %eax
  a529cf:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a529d3:	48                   	dec    %eax
  a529d4:	8d 35 d8 1f 00 00    	lea    0x1fd8,%esi
  a529da:	e8 c1 ef ff ff       	call   a519a0 <efi_printk>
  a529df:	eb a8                	jmp    a52989 <handle_cmdline_files+0x6d9>
  a529e1:	8b 7a 30             	mov    0x30(%edx),%edi
  a529e4:	eb c4                	jmp    a529aa <handle_cmdline_files+0x6fa>
  a529e6:	48                   	dec    %eax
  a529e7:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a529eb:	48                   	dec    %eax
  a529ec:	8d 35 46 20 00 00    	lea    0x2046,%esi
  a529f2:	e8 a9 ef ff ff       	call   a519a0 <efi_printk>
  a529f7:	eb b5                	jmp    a529ae <handle_cmdline_files+0x6fe>
  a529f9:	48                   	dec    %eax
  a529fa:	8b 79 48             	mov    0x48(%ecx),%edi
  a529fd:	e9 15 fd ff ff       	jmp    a52717 <handle_cmdline_files+0x467>
  a52a02:	4c                   	dec    %esp
  a52a03:	8b 44 24 58          	mov    0x58(%esp),%eax
  a52a07:	48                   	dec    %eax
  a52a08:	8b 74 24 38          	mov    0x38(%esp),%esi
  a52a0c:	48                   	dec    %eax
  a52a0d:	8d 4c 24 70          	lea    0x70(%esp),%ecx
  a52a11:	ba 00 10 00 00       	mov    $0x1000,%edx
  a52a16:	48                   	dec    %eax
  a52a17:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a52a1b:	e8 e0 f2 ff ff       	call   a51d00 <efi_high_alloc>
  a52a20:	48                   	dec    %eax
  a52a21:	89 44 24 08          	mov    %eax,0x8(%esp)
  a52a25:	48                   	dec    %eax
  a52a26:	85 c0                	test   %eax,%eax
  a52a28:	0f 85 20 01 00 00    	jne    a52b4e <handle_cmdline_files+0x89e>
  a52a2e:	48                   	dec    %eax
  a52a2f:	8b 5c 24 70          	mov    0x70(%esp),%ebx
  a52a33:	4c                   	dec    %esp
  a52a34:	8d ac 24 a0 00 00 00 	lea    0xa0(%esp),%ebp
  a52a3b:	48                   	dec    %eax
  a52a3c:	3b 5c 24 58          	cmp    0x58(%esp),%ebx
  a52a40:	0f 87 2a 01 00 00    	ja     a52b70 <handle_cmdline_files+0x8c0>
  a52a46:	4c                   	dec    %esp
  a52a47:	8b 64 24 08          	mov    0x8(%esp),%esp
  a52a4b:	48                   	dec    %eax
  a52a4c:	8b 44 24 68          	mov    0x68(%esp),%eax
  a52a50:	44                   	inc    %esp
  a52a51:	89 e5                	mov    %esp,%ebp
  a52a53:	49                   	dec    %ecx
  a52a54:	c1 e4 04             	shl    $0x4,%esp
  a52a57:	4a                   	dec    %edx
  a52a58:	8d 14 20             	lea    (%eax,%eiz,1),%edx
  a52a5b:	4c                   	dec    %esp
  a52a5c:	8b 7a 08             	mov    0x8(%edx),%edi
  a52a5f:	4d                   	dec    %ebp
  a52a60:	85 ff                	test   %edi,%edi
  a52a62:	75 3e                	jne    a52aa2 <handle_cmdline_files+0x7f2>
  a52a64:	eb 73                	jmp    a52ad9 <handle_cmdline_files+0x829>
  a52a66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a52a6d:	00 00 00 
  a52a70:	49                   	dec    %ecx
  a52a71:	8b 7e 20             	mov    0x20(%esi),%edi
  a52a74:	31 c0                	xor    %eax,%eax
  a52a76:	48                   	dec    %eax
  a52a77:	89 d9                	mov    %ebx,%ecx
  a52a79:	4c                   	dec    %esp
  a52a7a:	89 ea                	mov    %ebp,%edx
  a52a7c:	4c                   	dec    %esp
  a52a7d:	89 f6                	mov    %esi,%esi
  a52a7f:	41                   	inc    %ecx
  a52a80:	ff d0                	call   *%eax
  a52a82:	48                   	dec    %eax
  a52a83:	85 c0                	test   %eax,%eax
  a52a85:	0f 85 85 00 00 00    	jne    a52b10 <handle_cmdline_files+0x860>
  a52a8b:	48                   	dec    %eax
  a52a8c:	8b 44 24 68          	mov    0x68(%esp),%eax
  a52a90:	48                   	dec    %eax
  a52a91:	03 9c 24 a0 00 00 00 	add    0xa0(%esp),%ebx
  a52a98:	4c                   	dec    %esp
  a52a99:	2b bc 24 a0 00 00 00 	sub    0xa0(%esp),%edi
  a52aa0:	74 33                	je     a52ad5 <handle_cmdline_files+0x825>
  a52aa2:	4c                   	dec    %esp
  a52aa3:	39 3d 97 34 00 00    	cmp    %edi,0x3497
  a52aa9:	4c                   	dec    %esp
  a52aaa:	89 fa                	mov    %edi,%edx
  a52aac:	48                   	dec    %eax
  a52aad:	0f 46 15 8c 34 00 00 	cmovbe 0x348c,%edx
  a52ab4:	48                   	dec    %eax
  a52ab5:	89 94 24 a0 00 00 00 	mov    %edx,0xa0(%esp)
  a52abc:	4e                   	dec    %esi
  a52abd:	8b 34 20             	mov    (%eax,%eiz,1),%esi
  a52ac0:	e8 fb d6 ff ff       	call   a501c0 <__efi_early>
  a52ac5:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52ac9:	4c                   	dec    %esp
  a52aca:	8b 40 28             	mov    0x28(%eax),%eax
  a52acd:	75 a1                	jne    a52a70 <handle_cmdline_files+0x7c0>
  a52acf:	41                   	inc    %ecx
  a52ad0:	8b 7e 14             	mov    0x14(%esi),%edi
  a52ad3:	eb 9f                	jmp    a52a74 <handle_cmdline_files+0x7c4>
  a52ad5:	4a                   	dec    %edx
  a52ad6:	8d 14 20             	lea    (%eax,%eiz,1),%edx
  a52ad9:	48                   	dec    %eax
  a52ada:	8b 2a                	mov    (%edx),%ebp
  a52adc:	e8 df d6 ff ff       	call   a501c0 <__efi_early>
  a52ae1:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52ae5:	48                   	dec    %eax
  a52ae6:	8b 50 28             	mov    0x28(%eax),%edx
  a52ae9:	74 5e                	je     a52b49 <handle_cmdline_files+0x899>
  a52aeb:	48                   	dec    %eax
  a52aec:	8b 7d 10             	mov    0x10(%ebp),%edi
  a52aef:	48                   	dec    %eax
  a52af0:	89 ee                	mov    %ebp,%esi
  a52af2:	31 c0                	xor    %eax,%eax
  a52af4:	ff d2                	call   *%edx
  a52af6:	48                   	dec    %eax
  a52af7:	83 44 24 08 01       	addl   $0x1,0x8(%esp)
  a52afc:	48                   	dec    %eax
  a52afd:	8b 44 24 08          	mov    0x8(%esp),%eax
  a52b01:	39 44 24 34          	cmp    %eax,0x34(%esp)
  a52b05:	0f 8f 3b ff ff ff    	jg     a52a46 <handle_cmdline_files+0x796>
  a52b0b:	e9 e8 fb ff ff       	jmp    a526f8 <handle_cmdline_files+0x448>
  a52b10:	48                   	dec    %eax
  a52b11:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a52b15:	48                   	dec    %eax
  a52b16:	8d 35 f4 1f 00 00    	lea    0x1ff4,%esi
  a52b1c:	48                   	dec    %eax
  a52b1d:	89 44 24 08          	mov    %eax,0x8(%esp)
  a52b21:	e8 7a ee ff ff       	call   a519a0 <efi_printk>
  a52b26:	48                   	dec    %eax
  a52b27:	8b 44 24 08          	mov    0x8(%esp),%eax
  a52b2b:	48                   	dec    %eax
  a52b2c:	89 44 24 40          	mov    %eax,0x40(%esp)
  a52b30:	48                   	dec    %eax
  a52b31:	8b 54 24 70          	mov    0x70(%esp),%edx
  a52b35:	48                   	dec    %eax
  a52b36:	8b 74 24 38          	mov    0x38(%esp),%esi
  a52b3a:	48                   	dec    %eax
  a52b3b:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a52b3f:	e8 9c f5 ff ff       	call   a520e0 <efi_free>
  a52b44:	e9 f2 fc ff ff       	jmp    a5283b <handle_cmdline_files+0x58b>
  a52b49:	8b 7d 0c             	mov    0xc(%ebp),%edi
  a52b4c:	eb a1                	jmp    a52aef <handle_cmdline_files+0x83f>
  a52b4e:	48                   	dec    %eax
  a52b4f:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a52b53:	48                   	dec    %eax
  a52b54:	8d 35 46 1f 00 00    	lea    0x1f46,%esi
  a52b5a:	31 ed                	xor    %ebp,%ebp
  a52b5c:	e8 3f ee ff ff       	call   a519a0 <efi_printk>
  a52b61:	48                   	dec    %eax
  a52b62:	8b 44 24 08          	mov    0x8(%esp),%eax
  a52b66:	48                   	dec    %eax
  a52b67:	89 44 24 40          	mov    %eax,0x40(%esp)
  a52b6b:	e9 cb fc ff ff       	jmp    a5283b <handle_cmdline_files+0x58b>
  a52b70:	48                   	dec    %eax
  a52b71:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a52b75:	48                   	dec    %eax
  a52b76:	8d 35 5c 1f 00 00    	lea    0x1f5c,%esi
  a52b7c:	31 ed                	xor    %ebp,%ebp
  a52b7e:	e8 1d ee ff ff       	call   a519a0 <efi_printk>
  a52b83:	48                   	dec    %eax
  a52b84:	b8 02 00 00 00       	mov    $0x2,%eax
  a52b89:	00 00                	add    %al,(%eax)
  a52b8b:	00 80 48 89 44 24    	add    %al,0x24448948(%eax)
  a52b91:	40                   	inc    %eax
  a52b92:	eb 9c                	jmp    a52b30 <handle_cmdline_files+0x880>
  a52b94:	49                   	dec    %ecx
  a52b95:	89 d6                	mov    %edx,%esi
  a52b97:	e9 98 fc ff ff       	jmp    a52834 <handle_cmdline_files+0x584>
  a52b9c:	0f 1f 40 00          	nopl   0x0(%eax)

0000000000a52ba0 <efi_relocate_kernel>:
  a52ba0:	f3 0f 1e fa          	endbr64 
  a52ba4:	41                   	inc    %ecx
  a52ba5:	57                   	push   %edi
  a52ba6:	41                   	inc    %ecx
  a52ba7:	56                   	push   %esi
  a52ba8:	41                   	inc    %ecx
  a52ba9:	55                   	push   %ebp
  a52baa:	41                   	inc    %ecx
  a52bab:	54                   	push   %esp
  a52bac:	49                   	dec    %ecx
  a52bad:	89 d4                	mov    %edx,%esp
  a52baf:	55                   	push   %ebp
  a52bb0:	53                   	push   %ebx
  a52bb1:	48                   	dec    %eax
  a52bb2:	83 ec 28             	sub    $0x28,%esp
  a52bb5:	48                   	dec    %eax
  a52bb6:	85 d2                	test   %edx,%edx
  a52bb8:	0f 94 c0             	sete   %al
  a52bbb:	48                   	dec    %eax
  a52bbc:	39 ca                	cmp    %ecx,%edx
  a52bbe:	4c                   	dec    %esp
  a52bbf:	89 44 24 18          	mov    %eax,0x18(%esp)
  a52bc3:	48                   	dec    %eax
  a52bc4:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  a52bcb:	00 
  a52bcc:	0f 97 c2             	seta   %dl
  a52bcf:	09 d0                	or     %edx,%eax
  a52bd1:	48                   	dec    %eax
  a52bd2:	85 c9                	test   %ecx,%ecx
  a52bd4:	0f 94 c2             	sete   %dl
  a52bd7:	08 d0                	or     %dl,%al
  a52bd9:	0f 85 99 00 00 00    	jne    a52c78 <efi_relocate_kernel+0xd8>
  a52bdf:	48                   	dec    %eax
  a52be0:	89 f3                	mov    %esi,%ebx
  a52be2:	48                   	dec    %eax
  a52be3:	85 f6                	test   %esi,%esi
  a52be5:	0f 84 8d 00 00 00    	je     a52c78 <efi_relocate_kernel+0xd8>
  a52beb:	48                   	dec    %eax
  a52bec:	89 cd                	mov    %ecx,%ebp
  a52bee:	48                   	dec    %eax
  a52bef:	8d 49 ff             	lea    -0x1(%ecx),%ecx
  a52bf2:	4d                   	dec    %ebp
  a52bf3:	89 ce                	mov    %ecx,%esi
  a52bf5:	4c                   	dec    %esp
  a52bf6:	8b 3e                	mov    (%esi),%edi
  a52bf8:	48                   	dec    %eax
  a52bf9:	81 c9 ff 0f 00 00    	or     $0xfff,%ecx
  a52bff:	49                   	dec    %ecx
  a52c00:	89 fd                	mov    %edi,%ebp
  a52c02:	48                   	dec    %eax
  a52c03:	83 c1 01             	add    $0x1,%ecx
  a52c06:	48                   	dec    %eax
  a52c07:	c1 e9 0c             	shr    $0xc,%ecx
  a52c0a:	48                   	dec    %eax
  a52c0b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  a52c0f:	e8 ac d5 ff ff       	call   a501c0 <__efi_early>
  a52c14:	48                   	dec    %eax
  a52c15:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  a52c19:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52c1d:	4c                   	dec    %esp
  a52c1e:	8b 48 28             	mov    0x28(%eax),%ecx
  a52c21:	48                   	dec    %eax
  a52c22:	8b 50 18             	mov    0x18(%eax),%edx
  a52c25:	74 71                	je     a52c98 <efi_relocate_kernel+0xf8>
  a52c27:	48                   	dec    %eax
  a52c28:	8b 7a 28             	mov    0x28(%edx),%edi
  a52c2b:	4c                   	dec    %esp
  a52c2c:	8d 44 24 18          	lea    0x18(%esp),%eax
  a52c30:	ba 02 00 00 00       	mov    $0x2,%edx
  a52c35:	be 02 00 00 00       	mov    $0x2,%esi
  a52c3a:	31 c0                	xor    %eax,%eax
  a52c3c:	41                   	inc    %ecx
  a52c3d:	ff d1                	call   *%ecx
  a52c3f:	48                   	dec    %eax
  a52c40:	8b 7c 24 18          	mov    0x18(%esp),%edi
  a52c44:	48                   	dec    %eax
  a52c45:	89 7c 24 10          	mov    %edi,0x10(%esp)
  a52c49:	48                   	dec    %eax
  a52c4a:	85 c0                	test   %eax,%eax
  a52c4c:	75 52                	jne    a52ca0 <efi_relocate_kernel+0x100>
  a52c4e:	4c                   	dec    %esp
  a52c4f:	89 e2                	mov    %esp,%edx
  a52c51:	4c                   	dec    %esp
  a52c52:	89 fe                	mov    %edi,%esi
  a52c54:	e8 67 b0 ff ff       	call   a4dcc0 <memcpy>
  a52c59:	48                   	dec    %eax
  a52c5a:	8b 44 24 10          	mov    0x10(%esp),%eax
  a52c5e:	48                   	dec    %eax
  a52c5f:	89 03                	mov    %eax,(%ebx)
  a52c61:	48                   	dec    %eax
  a52c62:	83 c4 28             	add    $0x28,%esp
  a52c65:	31 c0                	xor    %eax,%eax
  a52c67:	5b                   	pop    %ebx
  a52c68:	5d                   	pop    %ebp
  a52c69:	41                   	inc    %ecx
  a52c6a:	5c                   	pop    %esp
  a52c6b:	41                   	inc    %ecx
  a52c6c:	5d                   	pop    %ebp
  a52c6d:	41                   	inc    %ecx
  a52c6e:	5e                   	pop    %esi
  a52c6f:	41                   	inc    %ecx
  a52c70:	5f                   	pop    %edi
  a52c71:	c3                   	ret    
  a52c72:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a52c78:	48                   	dec    %eax
  a52c79:	b8 02 00 00 00       	mov    $0x2,%eax
  a52c7e:	00 00                	add    %al,(%eax)
  a52c80:	00 80 48 83 c4 28    	add    %al,0x28c48348(%eax)
  a52c86:	5b                   	pop    %ebx
  a52c87:	5d                   	pop    %ebp
  a52c88:	41                   	inc    %ecx
  a52c89:	5c                   	pop    %esp
  a52c8a:	41                   	inc    %ecx
  a52c8b:	5d                   	pop    %ebp
  a52c8c:	41                   	inc    %ecx
  a52c8d:	5e                   	pop    %esi
  a52c8e:	41                   	inc    %ecx
  a52c8f:	5f                   	pop    %edi
  a52c90:	c3                   	ret    
  a52c91:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a52c98:	8b 7a 20             	mov    0x20(%edx),%edi
  a52c9b:	eb 8e                	jmp    a52c2b <efi_relocate_kernel+0x8b>
  a52c9d:	0f 1f 00             	nopl   (%eax)
  a52ca0:	48                   	dec    %eax
  a52ca1:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  a52ca5:	4c                   	dec    %esp
  a52ca6:	89 f2                	mov    %esi,%edx
  a52ca8:	48                   	dec    %eax
  a52ca9:	89 ee                	mov    %ebp,%esi
  a52cab:	4c                   	dec    %esp
  a52cac:	89 ef                	mov    %ebp,%edi
  a52cae:	e8 2d f2 ff ff       	call   a51ee0 <efi_low_alloc>
  a52cb3:	48                   	dec    %eax
  a52cb4:	85 c0                	test   %eax,%eax
  a52cb6:	74 28                	je     a52ce0 <efi_relocate_kernel+0x140>
  a52cb8:	4c                   	dec    %esp
  a52cb9:	89 ef                	mov    %ebp,%edi
  a52cbb:	48                   	dec    %eax
  a52cbc:	8d 35 76 1e 00 00    	lea    0x1e76,%esi
  a52cc2:	48                   	dec    %eax
  a52cc3:	89 44 24 08          	mov    %eax,0x8(%esp)
  a52cc7:	e8 d4 ec ff ff       	call   a519a0 <efi_printk>
  a52ccc:	48                   	dec    %eax
  a52ccd:	8b 44 24 08          	mov    0x8(%esp),%eax
  a52cd1:	48                   	dec    %eax
  a52cd2:	83 c4 28             	add    $0x28,%esp
  a52cd5:	5b                   	pop    %ebx
  a52cd6:	5d                   	pop    %ebp
  a52cd7:	41                   	inc    %ecx
  a52cd8:	5c                   	pop    %esp
  a52cd9:	41                   	inc    %ecx
  a52cda:	5d                   	pop    %ebp
  a52cdb:	41                   	inc    %ecx
  a52cdc:	5e                   	pop    %esi
  a52cdd:	41                   	inc    %ecx
  a52cde:	5f                   	pop    %edi
  a52cdf:	c3                   	ret    
  a52ce0:	48                   	dec    %eax
  a52ce1:	8b 7c 24 10          	mov    0x10(%esp),%edi
  a52ce5:	e9 64 ff ff ff       	jmp    a52c4e <efi_relocate_kernel+0xae>
  a52cea:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

0000000000a52cf0 <efi_convert_cmdline>:
  a52cf0:	f3 0f 1e fa          	endbr64 
  a52cf4:	41                   	inc    %ecx
  a52cf5:	56                   	push   %esi
  a52cf6:	41                   	inc    %ecx
  a52cf7:	55                   	push   %ebp
  a52cf8:	41                   	inc    %ecx
  a52cf9:	54                   	push   %esp
  a52cfa:	55                   	push   %ebp
  a52cfb:	53                   	push   %ebx
  a52cfc:	48                   	dec    %eax
  a52cfd:	89 d3                	mov    %edx,%ebx
  a52cff:	48                   	dec    %eax
  a52d00:	83 ec 10             	sub    $0x10,%esp
  a52d03:	4c                   	dec    %esp
  a52d04:	8b 66 38             	mov    0x38(%esi),%esp
  a52d07:	48                   	dec    %eax
  a52d08:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  a52d0f:	00 
  a52d10:	4d                   	dec    %ebp
  a52d11:	85 e4                	test   %esp,%esp
  a52d13:	0f 84 d7 01 00 00    	je     a52ef0 <efi_convert_cmdline+0x200>
  a52d19:	41                   	inc    %ecx
  a52d1a:	0f b7 04 24          	movzwl (%esp),%eax
  a52d1e:	44                   	inc    %esp
  a52d1f:	8b 46 30             	mov    0x30(%esi),%eax
  a52d22:	41                   	inc    %ecx
  a52d23:	d1 e8                	shr    %eax
  a52d25:	66 83 f8 0a          	cmp    $0xa,%ax
  a52d29:	0f 95 c1             	setne  %cl
  a52d2c:	66 85 c0             	test   %ax,%ax
  a52d2f:	0f 95 c2             	setne  %dl
  a52d32:	84 d1                	test   %dl,%cl
  a52d34:	0f 84 b6 01 00 00    	je     a52ef0 <efi_convert_cmdline+0x200>
  a52d3a:	45                   	inc    %ebp
  a52d3b:	85 c0                	test   %eax,%eax
  a52d3d:	0f 84 ad 01 00 00    	je     a52ef0 <efi_convert_cmdline+0x200>
  a52d43:	4c                   	dec    %esp
  a52d44:	89 e2                	mov    %esp,%edx
  a52d46:	45                   	inc    %ebp
  a52d47:	31 f6                	xor    %esi,%esi
  a52d49:	45                   	inc    %ebp
  a52d4a:	31 ed                	xor    %ebp,%ebp
  a52d4c:	eb 0a                	jmp    a52d58 <efi_convert_cmdline+0x68>
  a52d4e:	66 90                	xchg   %ax,%ax
  a52d50:	41                   	inc    %ecx
  a52d51:	39 e8                	cmp    %ebp,%eax
  a52d53:	7e 3b                	jle    a52d90 <efi_convert_cmdline+0xa0>
  a52d55:	41                   	inc    %ecx
  a52d56:	89 ee                	mov    %ebp,%esi
  a52d58:	48                   	dec    %eax
  a52d59:	83 c2 02             	add    $0x2,%edx
  a52d5c:	31 c9                	xor    %ecx,%ecx
  a52d5e:	41                   	inc    %ecx
  a52d5f:	8d 6e 01             	lea    0x1(%esi),%ebp
  a52d62:	66 83 f8 7f          	cmp    $0x7f,%ax
  a52d66:	0f 97 c1             	seta   %cl
  a52d69:	66 3d ff 07          	cmp    $0x7ff,%ax
  a52d6d:	0f 97 c0             	seta   %al
  a52d70:	0f b6 c0             	movzbl %al,%eax
  a52d73:	8d 44 01 01          	lea    0x1(%ecx,%eax,1),%eax
  a52d77:	41                   	inc    %ecx
  a52d78:	01 c5                	add    %eax,%ebp
  a52d7a:	0f b7 02             	movzwl (%edx),%eax
  a52d7d:	66 85 c0             	test   %ax,%ax
  a52d80:	40                   	inc    %eax
  a52d81:	0f 95 c6             	setne  %dh
  a52d84:	66 83 f8 0a          	cmp    $0xa,%ax
  a52d88:	0f 95 c1             	setne  %cl
  a52d8b:	40                   	inc    %eax
  a52d8c:	84 ce                	test   %cl,%dh
  a52d8e:	75 c0                	jne    a52d50 <efi_convert_cmdline+0x60>
  a52d90:	41                   	inc    %ecx
  a52d91:	83 c5 01             	add    $0x1,%ebp
  a52d94:	31 d2                	xor    %edx,%edx
  a52d96:	48                   	dec    %eax
  a52d97:	8d 4c 24 08          	lea    0x8(%esp),%ecx
  a52d9b:	41                   	inc    %ecx
  a52d9c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a52da1:	49                   	dec    %ecx
  a52da2:	63 f5                	arpl   %si,%bp
  a52da4:	e8 57 ef ff ff       	call   a51d00 <efi_high_alloc>
  a52da9:	48                   	dec    %eax
  a52daa:	85 c0                	test   %eax,%eax
  a52dac:	0f 85 5a 01 00 00    	jne    a52f0c <efi_convert_cmdline+0x21c>
  a52db2:	48                   	dec    %eax
  a52db3:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  a52db7:	eb 3b                	jmp    a52df4 <efi_convert_cmdline+0x104>
  a52db9:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a52dc0:	bf bd ff ff ff       	mov    $0xffffffbd,%edi
  a52dc5:	ba bf ff ff ff       	mov    $0xffffffbf,%edx
  a52dca:	be ef ff ff ff       	mov    $0xffffffef,%esi
  a52dcf:	40                   	inc    %eax
  a52dd0:	88 31                	mov    %dh,(%ecx)
  a52dd2:	44                   	inc    %esp
  a52dd3:	89 f5                	mov    %esi,%ebp
  a52dd5:	4d                   	dec    %ebp
  a52dd6:	89 cc                	mov    %ecx,%esp
  a52dd8:	4c                   	dec    %esp
  a52dd9:	89 c6                	mov    %eax,%esi
  a52ddb:	88 16                	mov    %dl,(%esi)
  a52ddd:	4c                   	dec    %esp
  a52dde:	8d 46 01             	lea    0x1(%esi),%eax
  a52de1:	41                   	inc    %ecx
  a52de2:	88 38                	mov    %bh,(%eax)
  a52de4:	49                   	dec    %ecx
  a52de5:	8d 48 01             	lea    0x1(%eax),%ecx
  a52de8:	44                   	inc    %esp
  a52de9:	8d 75 ff             	lea    -0x1(%ebp),%esi
  a52dec:	85 ed                	test   %ebp,%ebp
  a52dee:	0f 84 dc 00 00 00    	je     a52ed0 <efi_convert_cmdline+0x1e0>
  a52df4:	41                   	inc    %ecx
  a52df5:	0f b7 04 24          	movzwl (%esp),%eax
  a52df9:	4d                   	dec    %ebp
  a52dfa:	8d 4c 24 02          	lea    0x2(%esp),%ecx
  a52dfe:	8d 90 00 28 00 00    	lea    0x2800(%eax),%edx
  a52e04:	89 c7                	mov    %eax,%edi
  a52e06:	66 81 fa ff 03       	cmp    $0x3ff,%dx
  a52e0b:	77 05                	ja     a52e12 <efi_convert_cmdline+0x122>
  a52e0d:	45                   	inc    %ebp
  a52e0e:	85 f6                	test   %esi,%esi
  a52e10:	75 3e                	jne    a52e50 <efi_convert_cmdline+0x160>
  a52e12:	8d 90 00 28 ff ff    	lea    -0xd800(%eax),%edx
  a52e18:	4c                   	dec    %esp
  a52e19:	8d 41 01             	lea    0x1(%ecx),%eax
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
  a52e46:	44                   	inc    %esp
  a52e47:	89 f5                	mov    %esi,%ebp
  a52e49:	4d                   	dec    %ebp
  a52e4a:	89 cc                	mov    %ecx,%esp
  a52e4c:	88 11                	mov    %dl,(%ecx)
  a52e4e:	eb 91                	jmp    a52de1 <efi_convert_cmdline+0xf1>
  a52e50:	41                   	inc    %ecx
  a52e51:	0f b7 54 24 02       	movzwl 0x2(%esp),%edx
  a52e56:	8d b2 00 24 00 00    	lea    0x2400(%edx),%esi
  a52e5c:	66 81 fe ff 03       	cmp    $0x3ff,%si
  a52e61:	77 af                	ja     a52e12 <efi_convert_cmdline+0x122>
  a52e63:	c1 e0 0a             	shl    $0xa,%eax
  a52e66:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  a52e6c:	49                   	dec    %ecx
  a52e6d:	83 c4 04             	add    $0x4,%esp
  a52e70:	83 ed 02             	sub    $0x2,%ebp
  a52e73:	25 00 fc 0f 00       	and    $0xffc00,%eax
  a52e78:	48                   	dec    %eax
  a52e79:	8d 71 02             	lea    0x2(%ecx),%esi
  a52e7c:	09 d0                	or     %edx,%eax
  a52e7e:	05 00 00 01 00       	add    $0x10000,%eax
  a52e83:	89 c2                	mov    %eax,%edx
  a52e85:	c1 ea 12             	shr    $0x12,%edx
  a52e88:	83 ea 10             	sub    $0x10,%edx
  a52e8b:	88 11                	mov    %dl,(%ecx)
  a52e8d:	89 c2                	mov    %eax,%edx
  a52e8f:	c1 ea 0c             	shr    $0xc,%edx
  a52e92:	83 e2 3f             	and    $0x3f,%edx
  a52e95:	83 c2 80             	add    $0xffffff80,%edx
  a52e98:	88 51 01             	mov    %dl,0x1(%ecx)
  a52e9b:	89 c2                	mov    %eax,%edx
  a52e9d:	83 e0 3f             	and    $0x3f,%eax
  a52ea0:	c1 ea 06             	shr    $0x6,%edx
  a52ea3:	8d 78 80             	lea    -0x80(%eax),%edi
  a52ea6:	83 e2 3f             	and    $0x3f,%edx
  a52ea9:	83 c2 80             	add    $0xffffff80,%edx
  a52eac:	e9 2a ff ff ff       	jmp    a52ddb <efi_convert_cmdline+0xeb>
  a52eb1:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a52eb8:	44                   	inc    %esp
  a52eb9:	89 f5                	mov    %esi,%ebp
  a52ebb:	40                   	inc    %eax
  a52ebc:	88 39                	mov    %bh,(%ecx)
  a52ebe:	4d                   	dec    %ebp
  a52ebf:	89 cc                	mov    %ecx,%esp
  a52ec1:	4c                   	dec    %esp
  a52ec2:	89 c1                	mov    %eax,%ecx
  a52ec4:	44                   	inc    %esp
  a52ec5:	8d 75 ff             	lea    -0x1(%ebp),%esi
  a52ec8:	85 ed                	test   %ebp,%ebp
  a52eca:	0f 85 24 ff ff ff    	jne    a52df4 <efi_convert_cmdline+0x104>
  a52ed0:	c6 01 00             	movb   $0x0,(%ecx)
  a52ed3:	48                   	dec    %eax
  a52ed4:	8b 44 24 08          	mov    0x8(%esp),%eax
  a52ed8:	44                   	inc    %esp
  a52ed9:	89 2b                	mov    %ebp,(%ebx)
  a52edb:	48                   	dec    %eax
  a52edc:	83 c4 10             	add    $0x10,%esp
  a52edf:	5b                   	pop    %ebx
  a52ee0:	5d                   	pop    %ebp
  a52ee1:	41                   	inc    %ecx
  a52ee2:	5c                   	pop    %esp
  a52ee3:	41                   	inc    %ecx
  a52ee4:	5d                   	pop    %ebp
  a52ee5:	41                   	inc    %ecx
  a52ee6:	5e                   	pop    %esi
  a52ee7:	c3                   	ret    
  a52ee8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a52eef:	00 
  a52ef0:	31 d2                	xor    %edx,%edx
  a52ef2:	48                   	dec    %eax
  a52ef3:	8d 4c 24 08          	lea    0x8(%esp),%ecx
  a52ef7:	41                   	inc    %ecx
  a52ef8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  a52efd:	be 01 00 00 00       	mov    $0x1,%esi
  a52f02:	e8 f9 ed ff ff       	call   a51d00 <efi_high_alloc>
  a52f07:	48                   	dec    %eax
  a52f08:	85 c0                	test   %eax,%eax
  a52f0a:	74 2c                	je     a52f38 <efi_convert_cmdline+0x248>
  a52f0c:	48                   	dec    %eax
  a52f0d:	83 c4 10             	add    $0x10,%esp
  a52f10:	31 c0                	xor    %eax,%eax
  a52f12:	5b                   	pop    %ebx
  a52f13:	5d                   	pop    %ebp
  a52f14:	41                   	inc    %ecx
  a52f15:	5c                   	pop    %esp
  a52f16:	41                   	inc    %ecx
  a52f17:	5d                   	pop    %ebp
  a52f18:	41                   	inc    %ecx
  a52f19:	5e                   	pop    %esi
  a52f1a:	c3                   	ret    
  a52f1b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a52f20:	c1 e8 0c             	shr    $0xc,%eax
  a52f23:	83 e2 3f             	and    $0x3f,%edx
  a52f26:	8d 70 e0             	lea    -0x20(%eax),%esi
  a52f29:	83 c2 80             	add    $0xffffff80,%edx
  a52f2c:	e9 9e fe ff ff       	jmp    a52dcf <efi_convert_cmdline+0xdf>
  a52f31:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a52f38:	48                   	dec    %eax
  a52f39:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  a52f3d:	41                   	inc    %ecx
  a52f3e:	bd 01 00 00 00       	mov    $0x1,%ebp
  a52f43:	eb 8b                	jmp    a52ed0 <efi_convert_cmdline+0x1e0>
  a52f45:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a52f4c:	00 00 00 00 

0000000000a52f50 <efi_exit_boot_services>:
  a52f50:	f3 0f 1e fa          	endbr64 
  a52f54:	41                   	inc    %ecx
  a52f55:	57                   	push   %edi
  a52f56:	49                   	dec    %ecx
  a52f57:	89 f7                	mov    %esi,%edi
  a52f59:	48                   	dec    %eax
  a52f5a:	89 d6                	mov    %edx,%esi
  a52f5c:	41                   	inc    %ecx
  a52f5d:	56                   	push   %esi
  a52f5e:	49                   	dec    %ecx
  a52f5f:	89 ce                	mov    %ecx,%esi
  a52f61:	41                   	inc    %ecx
  a52f62:	55                   	push   %ebp
  a52f63:	4d                   	dec    %ebp
  a52f64:	89 c5                	mov    %eax,%ebp
  a52f66:	41                   	inc    %ecx
  a52f67:	54                   	push   %esp
  a52f68:	55                   	push   %ebp
  a52f69:	48                   	dec    %eax
  a52f6a:	89 fd                	mov    %edi,%ebp
  a52f6c:	53                   	push   %ebx
  a52f6d:	48                   	dec    %eax
  a52f6e:	89 d3                	mov    %edx,%ebx
  a52f70:	48                   	dec    %eax
  a52f71:	83 ec 08             	sub    $0x8,%esp
  a52f74:	e8 b7 ea ff ff       	call   a51a30 <efi_get_memory_map>
  a52f79:	49                   	dec    %ecx
  a52f7a:	89 c4                	mov    %eax,%esp
  a52f7c:	48                   	dec    %eax
  a52f7d:	85 c0                	test   %eax,%eax
  a52f7f:	75 4e                	jne    a52fcf <efi_exit_boot_services+0x7f>
  a52f81:	4c                   	dec    %esp
  a52f82:	89 f2                	mov    %esi,%edx
  a52f84:	48                   	dec    %eax
  a52f85:	89 de                	mov    %ebx,%esi
  a52f87:	48                   	dec    %eax
  a52f88:	89 ef                	mov    %ebp,%edi
  a52f8a:	41                   	inc    %ecx
  a52f8b:	ff d5                	call   *%ebp
  a52f8d:	49                   	dec    %ecx
  a52f8e:	89 c4                	mov    %eax,%esp
  a52f90:	48                   	dec    %eax
  a52f91:	85 c0                	test   %eax,%eax
  a52f93:	75 53                	jne    a52fe8 <efi_exit_boot_services+0x98>
  a52f95:	e8 26 d2 ff ff       	call   a501c0 <__efi_early>
  a52f9a:	48                   	dec    %eax
  a52f9b:	8b 53 20             	mov    0x20(%ebx),%edx
  a52f9e:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52fa2:	48                   	dec    %eax
  a52fa3:	8b 48 28             	mov    0x28(%eax),%ecx
  a52fa6:	48                   	dec    %eax
  a52fa7:	8b 12                	mov    (%edx),%edx
  a52fa9:	48                   	dec    %eax
  a52faa:	8b 70 18             	mov    0x18(%eax),%esi
  a52fad:	74 61                	je     a53010 <efi_exit_boot_services+0xc0>
  a52faf:	48                   	dec    %eax
  a52fb0:	8b be e8 00 00 00    	mov    0xe8(%esi),%edi
  a52fb6:	4c                   	dec    %esp
  a52fb7:	89 fe                	mov    %edi,%esi
  a52fb9:	31 c0                	xor    %eax,%eax
  a52fbb:	ff d1                	call   *%ecx
  a52fbd:	49                   	dec    %ecx
  a52fbe:	89 c4                	mov    %eax,%esp
  a52fc0:	48                   	dec    %eax
  a52fc1:	b8 02 00 00 00       	mov    $0x2,%eax
  a52fc6:	00 00                	add    %al,(%eax)
  a52fc8:	00 80 49 39 c4 74    	add    %al,0x74c43949(%eax)
  a52fce:	51                   	push   %ecx
  a52fcf:	48                   	dec    %eax
  a52fd0:	83 c4 08             	add    $0x8,%esp
  a52fd3:	4c                   	dec    %esp
  a52fd4:	89 e0                	mov    %esp,%eax
  a52fd6:	5b                   	pop    %ebx
  a52fd7:	5d                   	pop    %ebp
  a52fd8:	41                   	inc    %ecx
  a52fd9:	5c                   	pop    %esp
  a52fda:	41                   	inc    %ecx
  a52fdb:	5d                   	pop    %ebp
  a52fdc:	41                   	inc    %ecx
  a52fdd:	5e                   	pop    %esi
  a52fde:	41                   	inc    %ecx
  a52fdf:	5f                   	pop    %edi
  a52fe0:	c3                   	ret    
  a52fe1:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a52fe8:	e8 d3 d1 ff ff       	call   a501c0 <__efi_early>
  a52fed:	48                   	dec    %eax
  a52fee:	8b 0b                	mov    (%ebx),%ecx
  a52ff0:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a52ff4:	48                   	dec    %eax
  a52ff5:	8b 50 28             	mov    0x28(%eax),%edx
  a52ff8:	48                   	dec    %eax
  a52ff9:	8b 31                	mov    (%ecx),%esi
  a52ffb:	48                   	dec    %eax
  a52ffc:	8b 48 18             	mov    0x18(%eax),%ecx
  a52fff:	0f 85 bb 00 00 00    	jne    a530c0 <efi_exit_boot_services+0x170>
  a53005:	8b 79 30             	mov    0x30(%ecx),%edi
  a53008:	31 c0                	xor    %eax,%eax
  a5300a:	ff d2                	call   *%edx
  a5300c:	eb c1                	jmp    a52fcf <efi_exit_boot_services+0x7f>
  a5300e:	66 90                	xchg   %ax,%ax
  a53010:	8b be 80 00 00 00    	mov    0x80(%esi),%edi
  a53016:	eb 9e                	jmp    a52fb6 <efi_exit_boot_services+0x66>
  a53018:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5301f:	00 
  a53020:	48                   	dec    %eax
  a53021:	8b 53 28             	mov    0x28(%ebx),%edx
  a53024:	48                   	dec    %eax
  a53025:	8b 43 08             	mov    0x8(%ebx),%eax
  a53028:	48                   	dec    %eax
  a53029:	8b 12                	mov    (%edx),%edx
  a5302b:	48                   	dec    %eax
  a5302c:	89 10                	mov    %edx,(%eax)
  a5302e:	e8 8d d1 ff ff       	call   a501c0 <__efi_early>
  a53033:	48                   	dec    %eax
  a53034:	8b 13                	mov    (%ebx),%edx
  a53036:	4c                   	dec    %esp
  a53037:	8b 4b 18             	mov    0x18(%ebx),%ecx
  a5303a:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a5303e:	4c                   	dec    %esp
  a5303f:	8b 50 28             	mov    0x28(%eax),%edx
  a53042:	4c                   	dec    %esp
  a53043:	8b 43 10             	mov    0x10(%ebx),%eax
  a53046:	48                   	dec    %eax
  a53047:	8b 4b 20             	mov    0x20(%ebx),%ecx
  a5304a:	48                   	dec    %eax
  a5304b:	8b 12                	mov    (%edx),%edx
  a5304d:	48                   	dec    %eax
  a5304e:	8b 73 08             	mov    0x8(%ebx),%esi
  a53051:	48                   	dec    %eax
  a53052:	8b 40 18             	mov    0x18(%eax),%eax
  a53055:	74 79                	je     a530d0 <efi_exit_boot_services+0x180>
  a53057:	48                   	dec    %eax
  a53058:	8b 78 38             	mov    0x38(%eax),%edi
  a5305b:	31 c0                	xor    %eax,%eax
  a5305d:	41                   	inc    %ecx
  a5305e:	ff d2                	call   *%edx
  a53060:	49                   	dec    %ecx
  a53061:	89 c4                	mov    %eax,%esp
  a53063:	48                   	dec    %eax
  a53064:	85 c0                	test   %eax,%eax
  a53066:	0f 85 63 ff ff ff    	jne    a52fcf <efi_exit_boot_services+0x7f>
  a5306c:	4c                   	dec    %esp
  a5306d:	89 f2                	mov    %esi,%edx
  a5306f:	48                   	dec    %eax
  a53070:	89 de                	mov    %ebx,%esi
  a53072:	48                   	dec    %eax
  a53073:	89 ef                	mov    %ebp,%edi
  a53075:	41                   	inc    %ecx
  a53076:	ff d5                	call   *%ebp
  a53078:	49                   	dec    %ecx
  a53079:	89 c4                	mov    %eax,%esp
  a5307b:	48                   	dec    %eax
  a5307c:	85 c0                	test   %eax,%eax
  a5307e:	0f 85 4b ff ff ff    	jne    a52fcf <efi_exit_boot_services+0x7f>
  a53084:	e8 37 d1 ff ff       	call   a501c0 <__efi_early>
  a53089:	48                   	dec    %eax
  a5308a:	8b 53 20             	mov    0x20(%ebx),%edx
  a5308d:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a53091:	48                   	dec    %eax
  a53092:	8b 48 28             	mov    0x28(%eax),%ecx
  a53095:	48                   	dec    %eax
  a53096:	8b 12                	mov    (%edx),%edx
  a53098:	48                   	dec    %eax
  a53099:	8b 70 18             	mov    0x18(%eax),%esi
  a5309c:	75 3a                	jne    a530d8 <efi_exit_boot_services+0x188>
  a5309e:	8b be 80 00 00 00    	mov    0x80(%esi),%edi
  a530a4:	48                   	dec    %eax
  a530a5:	83 c4 08             	add    $0x8,%esp
  a530a8:	4c                   	dec    %esp
  a530a9:	89 fe                	mov    %edi,%esi
  a530ab:	31 c0                	xor    %eax,%eax
  a530ad:	5b                   	pop    %ebx
  a530ae:	5d                   	pop    %ebp
  a530af:	41                   	inc    %ecx
  a530b0:	5c                   	pop    %esp
  a530b1:	41                   	inc    %ecx
  a530b2:	5d                   	pop    %ebp
  a530b3:	41                   	inc    %ecx
  a530b4:	5e                   	pop    %esi
  a530b5:	41                   	inc    %ecx
  a530b6:	5f                   	pop    %edi
  a530b7:	ff e1                	jmp    *%ecx
  a530b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a530c0:	48                   	dec    %eax
  a530c1:	8b 79 48             	mov    0x48(%ecx),%edi
  a530c4:	e9 3f ff ff ff       	jmp    a53008 <efi_exit_boot_services+0xb8>
  a530c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a530d0:	8b 78 28             	mov    0x28(%eax),%edi
  a530d3:	eb 86                	jmp    a5305b <efi_exit_boot_services+0x10b>
  a530d5:	0f 1f 00             	nopl   (%eax)
  a530d8:	48                   	dec    %eax
  a530d9:	8b be e8 00 00 00    	mov    0xe8(%esi),%edi
  a530df:	eb c3                	jmp    a530a4 <efi_exit_boot_services+0x154>
  a530e1:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a530e8:	00 00 00 
  a530eb:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)

0000000000a530f0 <setup_pixel_info>:
  a530f0:	45                   	inc    %ebp
  a530f1:	85 c0                	test   %eax,%eax
  a530f3:	75 23                	jne    a53118 <setup_pixel_info+0x28>
  a530f5:	b9 20 00 00 00       	mov    $0x20,%ecx
  a530fa:	c1 e6 02             	shl    $0x2,%esi
  a530fd:	48                   	dec    %eax
  a530fe:	b8 08 00 08 08       	mov    $0x8080008,%eax
  a53103:	08 10                	or     %dl,(%eax)
  a53105:	08 18                	or     %bl,(%eax)
  a53107:	66 89 4f 16          	mov    %cx,0x16(%edi)
  a5310b:	66 89 77 24          	mov    %si,0x24(%edi)
  a5310f:	48                   	dec    %eax
  a53110:	89 47 26             	mov    %eax,0x26(%edi)
  a53113:	c3                   	ret    
  a53114:	0f 1f 40 00          	nopl   0x0(%eax)
  a53118:	41                   	inc    %ecx
  a53119:	83 f8 01             	cmp    $0x1,%eax
  a5311c:	74 2a                	je     a53148 <setup_pixel_info+0x58>
  a5311e:	41                   	inc    %ecx
  a5311f:	83 f8 02             	cmp    $0x2,%eax
  a53122:	74 4c                	je     a53170 <setup_pixel_info+0x80>
  a53124:	b8 04 00 00 00       	mov    $0x4,%eax
  a53129:	48                   	dec    %eax
  a5312a:	c7 47 26 00 00 00 00 	movl   $0x0,0x26(%edi)
  a53131:	66 89 47 16          	mov    %ax,0x16(%edi)
  a53135:	0f b7 47 12          	movzwl 0x12(%edi),%eax
  a53139:	66 d1 e8             	shr    %ax
  a5313c:	66 89 47 24          	mov    %ax,0x24(%edi)
  a53140:	c3                   	ret    
  a53141:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a53148:	ba 20 00 00 00       	mov    $0x20,%edx
  a5314d:	c1 e6 02             	shl    $0x2,%esi
  a53150:	48                   	dec    %eax
  a53151:	b8 08 10 08 08       	mov    $0x8081008,%eax
  a53156:	08 00                	or     %al,(%eax)
  a53158:	08 18                	or     %bl,(%eax)
  a5315a:	66 89 57 16          	mov    %dx,0x16(%edi)
  a5315e:	66 89 77 24          	mov    %si,0x24(%edi)
  a53162:	48                   	dec    %eax
  a53163:	89 47 26             	mov    %eax,0x26(%edi)
  a53166:	c3                   	ret    
  a53167:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a5316e:	00 00 
  a53170:	48                   	dec    %eax
  a53171:	89 d0                	mov    %edx,%eax
  a53173:	83 e0 ff             	and    $0xffffffff,%eax
  a53176:	0f 85 ec 00 00 00    	jne    a53268 <setup_pixel_info+0x178>
  a5317c:	45                   	inc    %ebp
  a5317d:	31 c0                	xor    %eax,%eax
  a5317f:	45                   	inc    %ebp
  a53180:	31 c9                	xor    %ecx,%ecx
  a53182:	45                   	inc    %ebp
  a53183:	31 d2                	xor    %edx,%edx
  a53185:	48                   	dec    %eax
  a53186:	c1 ea 20             	shr    $0x20,%edx
  a53189:	44                   	inc    %esp
  a5318a:	88 57 27             	mov    %dl,0x27(%edi)
  a5318d:	48                   	dec    %eax
  a5318e:	89 d0                	mov    %edx,%eax
  a53190:	44                   	inc    %esp
  a53191:	88 4f 26             	mov    %cl,0x26(%edi)
  a53194:	83 e0 ff             	and    $0xffffffff,%eax
  a53197:	0f 84 13 01 00 00    	je     a532b0 <setup_pixel_info+0x1c0>
  a5319d:	45                   	inc    %ebp
  a5319e:	31 c9                	xor    %ecx,%ecx
  a531a0:	83 e2 01             	and    $0x1,%edx
  a531a3:	75 0e                	jne    a531b3 <setup_pixel_info+0xc3>
  a531a5:	0f 1f 00             	nopl   (%eax)
  a531a8:	48                   	dec    %eax
  a531a9:	d1 e8                	shr    %eax
  a531ab:	41                   	inc    %ecx
  a531ac:	83 c1 01             	add    $0x1,%ecx
  a531af:	a8 01                	test   $0x1,%al
  a531b1:	74 f5                	je     a531a8 <setup_pixel_info+0xb8>
  a531b3:	31 d2                	xor    %edx,%edx
  a531b5:	0f 1f 00             	nopl   (%eax)
  a531b8:	48                   	dec    %eax
  a531b9:	d1 e8                	shr    %eax
  a531bb:	83 c2 01             	add    $0x1,%edx
  a531be:	a8 01                	test   $0x1,%al
  a531c0:	75 f6                	jne    a531b8 <setup_pixel_info+0xc8>
  a531c2:	0f b6 c2             	movzbl %dl,%eax
  a531c5:	41                   	inc    %ecx
  a531c6:	01 c0                	add    %eax,%eax
  a531c8:	48                   	dec    %eax
  a531c9:	89 c8                	mov    %ecx,%eax
  a531cb:	44                   	inc    %esp
  a531cc:	88 4f 29             	mov    %cl,0x29(%edi)
  a531cf:	88 57 28             	mov    %dl,0x28(%edi)
  a531d2:	83 e0 ff             	and    $0xffffffff,%eax
  a531d5:	0f 84 c5 00 00 00    	je     a532a0 <setup_pixel_info+0x1b0>
  a531db:	45                   	inc    %ebp
  a531dc:	31 c9                	xor    %ecx,%ecx
  a531de:	f6 c1 01             	test   $0x1,%cl
  a531e1:	75 10                	jne    a531f3 <setup_pixel_info+0x103>
  a531e3:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a531e8:	48                   	dec    %eax
  a531e9:	d1 e8                	shr    %eax
  a531eb:	41                   	inc    %ecx
  a531ec:	83 c1 01             	add    $0x1,%ecx
  a531ef:	a8 01                	test   $0x1,%al
  a531f1:	74 f5                	je     a531e8 <setup_pixel_info+0xf8>
  a531f3:	31 d2                	xor    %edx,%edx
  a531f5:	0f 1f 00             	nopl   (%eax)
  a531f8:	48                   	dec    %eax
  a531f9:	d1 e8                	shr    %eax
  a531fb:	83 c2 01             	add    $0x1,%edx
  a531fe:	a8 01                	test   $0x1,%al
  a53200:	75 f6                	jne    a531f8 <setup_pixel_info+0x108>
  a53202:	0f b6 c2             	movzbl %dl,%eax
  a53205:	41                   	inc    %ecx
  a53206:	01 c0                	add    %eax,%eax
  a53208:	48                   	dec    %eax
  a53209:	c1 e9 20             	shr    $0x20,%ecx
  a5320c:	44                   	inc    %esp
  a5320d:	88 4f 2b             	mov    %cl,0x2b(%edi)
  a53210:	48                   	dec    %eax
  a53211:	89 c8                	mov    %ecx,%eax
  a53213:	88 57 2a             	mov    %dl,0x2a(%edi)
  a53216:	83 e0 ff             	and    $0xffffffff,%eax
  a53219:	74 7d                	je     a53298 <setup_pixel_info+0x1a8>
  a5321b:	83 e1 01             	and    $0x1,%ecx
  a5321e:	b9 00 00 00 00       	mov    $0x0,%ecx
  a53223:	75 0d                	jne    a53232 <setup_pixel_info+0x142>
  a53225:	0f 1f 00             	nopl   (%eax)
  a53228:	48                   	dec    %eax
  a53229:	d1 e8                	shr    %eax
  a5322b:	83 c1 01             	add    $0x1,%ecx
  a5322e:	a8 01                	test   $0x1,%al
  a53230:	74 f6                	je     a53228 <setup_pixel_info+0x138>
  a53232:	31 d2                	xor    %edx,%edx
  a53234:	0f 1f 40 00          	nopl   0x0(%eax)
  a53238:	48                   	dec    %eax
  a53239:	d1 e8                	shr    %eax
  a5323b:	83 c2 01             	add    $0x1,%edx
  a5323e:	a8 01                	test   $0x1,%al
  a53240:	75 f6                	jne    a53238 <setup_pixel_info+0x148>
  a53242:	0f b6 c2             	movzbl %dl,%eax
  a53245:	41                   	inc    %ecx
  a53246:	01 c0                	add    %eax,%eax
  a53248:	66 44                	inc    %sp
  a5324a:	89 47 16             	mov    %eax,0x16(%edi)
  a5324d:	45                   	inc    %ebp
  a5324e:	0f b7 c0             	movzwl %ax,%eax
  a53251:	41                   	inc    %ecx
  a53252:	0f af f0             	imul   %eax,%esi
  a53255:	88 4f 2d             	mov    %cl,0x2d(%edi)
  a53258:	88 57 2c             	mov    %dl,0x2c(%edi)
  a5325b:	c1 ee 03             	shr    $0x3,%esi
  a5325e:	66 89 77 24          	mov    %si,0x24(%edi)
  a53262:	c3                   	ret    
  a53263:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a53268:	45                   	inc    %ebp
  a53269:	31 d2                	xor    %edx,%edx
  a5326b:	f6 c2 01             	test   $0x1,%dl
  a5326e:	75 0b                	jne    a5327b <setup_pixel_info+0x18b>
  a53270:	48                   	dec    %eax
  a53271:	d1 e8                	shr    %eax
  a53273:	41                   	inc    %ecx
  a53274:	83 c2 01             	add    $0x1,%edx
  a53277:	a8 01                	test   $0x1,%al
  a53279:	74 f5                	je     a53270 <setup_pixel_info+0x180>
  a5327b:	45                   	inc    %ebp
  a5327c:	31 c9                	xor    %ecx,%ecx
  a5327e:	66 90                	xchg   %ax,%ax
  a53280:	48                   	dec    %eax
  a53281:	d1 e8                	shr    %eax
  a53283:	41                   	inc    %ecx
  a53284:	83 c1 01             	add    $0x1,%ecx
  a53287:	a8 01                	test   $0x1,%al
  a53289:	75 f5                	jne    a53280 <setup_pixel_info+0x190>
  a5328b:	45                   	inc    %ebp
  a5328c:	0f b6 c1             	movzbl %cl,%eax
  a5328f:	e9 f1 fe ff ff       	jmp    a53185 <setup_pixel_info+0x95>
  a53294:	0f 1f 40 00          	nopl   0x0(%eax)
  a53298:	31 d2                	xor    %edx,%edx
  a5329a:	31 c9                	xor    %ecx,%ecx
  a5329c:	eb aa                	jmp    a53248 <setup_pixel_info+0x158>
  a5329e:	66 90                	xchg   %ax,%ax
  a532a0:	31 d2                	xor    %edx,%edx
  a532a2:	45                   	inc    %ebp
  a532a3:	31 c9                	xor    %ecx,%ecx
  a532a5:	e9 5e ff ff ff       	jmp    a53208 <setup_pixel_info+0x118>
  a532aa:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a532b0:	31 d2                	xor    %edx,%edx
  a532b2:	45                   	inc    %ebp
  a532b3:	31 c9                	xor    %ecx,%ecx
  a532b5:	e9 0e ff ff ff       	jmp    a531c8 <setup_pixel_info+0xd8>
  a532ba:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

0000000000a532c0 <efi_setup_gop>:
  a532c0:	f3 0f 1e fa          	endbr64 
  a532c4:	41                   	inc    %ecx
  a532c5:	57                   	push   %edi
  a532c6:	41                   	inc    %ecx
  a532c7:	56                   	push   %esi
  a532c8:	41                   	inc    %ecx
  a532c9:	55                   	push   %ebp
  a532ca:	41                   	inc    %ecx
  a532cb:	54                   	push   %esp
  a532cc:	55                   	push   %ebp
  a532cd:	48                   	dec    %eax
  a532ce:	89 d5                	mov    %edx,%ebp
  a532d0:	53                   	push   %ebx
  a532d1:	48                   	dec    %eax
  a532d2:	81 ec b8 00 00 00    	sub    $0xb8,%esp
  a532d8:	48                   	dec    %eax
  a532d9:	89 74 24 10          	mov    %esi,0x10(%esp)
  a532dd:	48                   	dec    %eax
  a532de:	89 4c 24 78          	mov    %ecx,0x78(%esp)
  a532e2:	48                   	dec    %eax
  a532e3:	c7 84 24 88 00 00 00 	movl   $0x0,0x88(%esp)
  a532ea:	00 00 00 00 
  a532ee:	e8 cd ce ff ff       	call   a501c0 <__efi_early>
  a532f3:	48                   	dec    %eax
  a532f4:	8b 54 24 78          	mov    0x78(%esp),%edx
  a532f8:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a532fc:	4c                   	dec    %esp
  a532fd:	8b 40 28             	mov    0x28(%eax),%eax
  a53300:	48                   	dec    %eax
  a53301:	8b 40 18             	mov    0x18(%eax),%eax
  a53304:	0f 84 0e 02 00 00    	je     a53518 <efi_setup_gop+0x258>
  a5330a:	48                   	dec    %eax
  a5330b:	8b 78 40             	mov    0x40(%eax),%edi
  a5330e:	48                   	dec    %eax
  a5330f:	8d 8c 24 88 00 00 00 	lea    0x88(%esp),%ecx
  a53316:	be 02 00 00 00       	mov    $0x2,%esi
  a5331b:	31 c0                	xor    %eax,%eax
  a5331d:	41                   	inc    %ecx
  a5331e:	ff d0                	call   *%eax
  a53320:	48                   	dec    %eax
  a53321:	89 44 24 08          	mov    %eax,0x8(%esp)
  a53325:	48                   	dec    %eax
  a53326:	85 c0                	test   %eax,%eax
  a53328:	0f 85 d0 01 00 00    	jne    a534fe <efi_setup_gop+0x23e>
  a5332e:	e8 8d ce ff ff       	call   a501c0 <__efi_early>
  a53333:	4c                   	dec    %esp
  a53334:	8b 8c 24 88 00 00 00 	mov    0x88(%esp),%ecx
  a5333b:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a5333f:	4c                   	dec    %esp
  a53340:	8b 50 28             	mov    0x28(%eax),%edx
  a53343:	48                   	dec    %eax
  a53344:	8b 50 18             	mov    0x18(%eax),%edx
  a53347:	0f 85 d3 01 00 00    	jne    a53520 <efi_setup_gop+0x260>
  a5334d:	8b 7a 64             	mov    0x64(%edx),%edi
  a53350:	4c                   	dec    %esp
  a53351:	8d 44 24 78          	lea    0x78(%esp),%eax
  a53355:	31 c9                	xor    %ecx,%ecx
  a53357:	48                   	dec    %eax
  a53358:	89 ea                	mov    %ebp,%edx
  a5335a:	be 02 00 00 00       	mov    $0x2,%esi
  a5335f:	31 c0                	xor    %eax,%eax
  a53361:	41                   	inc    %ecx
  a53362:	ff d2                	call   *%edx
  a53364:	48                   	dec    %eax
  a53365:	89 44 24 08          	mov    %eax,0x8(%esp)
  a53369:	48                   	dec    %eax
  a5336a:	85 c0                	test   %eax,%eax
  a5336c:	0f 85 62 01 00 00    	jne    a534d4 <efi_setup_gop+0x214>
  a53372:	e8 49 ce ff ff       	call   a501c0 <__efi_early>
  a53377:	4c                   	dec    %esp
  a53378:	8b a4 24 88 00 00 00 	mov    0x88(%esp),%esp
  a5337f:	49                   	dec    %ecx
  a53380:	89 c0                	mov    %eax,%eax
  a53382:	48                   	dec    %eax
  a53383:	8b 44 24 78          	mov    0x78(%esp),%eax
  a53387:	41                   	inc    %ecx
  a53388:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a5338c:	48                   	dec    %eax
  a5338d:	c7 84 24 90 00 00 00 	movl   $0x0,0x90(%esp)
  a53394:	00 00 00 00 
  a53398:	0f 84 b2 02 00 00    	je     a53650 <efi_setup_gop+0x390>
  a5339e:	48                   	dec    %eax
  a5339f:	c1 e8 03             	shr    $0x3,%eax
  a533a2:	0f 84 ff 04 00 00    	je     a538a7 <efi_setup_gop+0x5e7>
  a533a8:	49                   	dec    %ecx
  a533a9:	8d 04 c4             	lea    (%esp,%eax,8),%eax
  a533ac:	4c                   	dec    %esp
  a533ad:	89 e3                	mov    %esp,%ebx
  a533af:	48                   	dec    %eax
  a533b0:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  a533b7:	00 
  a533b8:	4c                   	dec    %esp
  a533b9:	8d ac 24 90 00 00 00 	lea    0x90(%esp),%ebp
  a533c0:	49                   	dec    %ecx
  a533c1:	bf 2c 6f b3 d3       	mov    $0xd3b36f2c,%edi
  a533c6:	51                   	push   %ecx
  a533c7:	d5 d4                	aad    $0xd4
  a533c9:	11 48 89             	adc    %ecx,-0x77(%eax)
  a533cc:	04 24                	add    $0x24,%al
  a533ce:	48                   	dec    %eax
  a533cf:	8d 84 24 98 00 00 00 	lea    0x98(%esp),%eax
  a533d6:	49                   	dec    %ecx
  a533d7:	be 9a 46 00 90       	mov    $0x9000469a,%esi
  a533dc:	27                   	daa    
  a533dd:	3f                   	aas    
  a533de:	c1 4d 48 89          	rorl   $0x89,0x48(%ebp)
  a533e2:	44                   	inc    %esp
  a533e3:	24 18                	and    $0x18,%al
  a533e5:	48                   	dec    %eax
  a533e6:	8d 84 24 a0 00 00 00 	lea    0xa0(%esp),%eax
  a533ed:	48                   	dec    %eax
  a533ee:	89 44 24 20          	mov    %eax,0x20(%esp)
  a533f2:	eb 2c                	jmp    a53420 <efi_setup_gop+0x160>
  a533f4:	0f 1f 40 00          	nopl   0x0(%eax)
  a533f8:	48                   	dec    %eax
  a533f9:	8b b8 98 00 00 00    	mov    0x98(%eax),%edi
  a533ff:	31 c0                	xor    %eax,%eax
  a53401:	4c                   	dec    %esp
  a53402:	89 e9                	mov    %ebp,%ecx
  a53404:	48                   	dec    %eax
  a53405:	89 ea                	mov    %ebp,%edx
  a53407:	4c                   	dec    %esp
  a53408:	89 e6                	mov    %esp,%esi
  a5340a:	41                   	inc    %ecx
  a5340b:	ff d0                	call   *%eax
  a5340d:	48                   	dec    %eax
  a5340e:	85 c0                	test   %eax,%eax
  a53410:	0f 84 1a 01 00 00    	je     a53530 <efi_setup_gop+0x270>
  a53416:	48                   	dec    %eax
  a53417:	83 c3 08             	add    $0x8,%ebx
  a5341a:	48                   	dec    %eax
  a5341b:	3b 1c 24             	cmp    (%esp),%ebx
  a5341e:	74 40                	je     a53460 <efi_setup_gop+0x1a0>
  a53420:	4c                   	dec    %esp
  a53421:	89 bc 24 a0 00 00 00 	mov    %edi,0xa0(%esp)
  a53428:	4c                   	dec    %esp
  a53429:	89 b4 24 a8 00 00 00 	mov    %esi,0xa8(%esp)
  a53430:	48                   	dec    %eax
  a53431:	c7 84 24 98 00 00 00 	movl   $0x0,0x98(%esp)
  a53438:	00 00 00 00 
  a5343c:	4c                   	dec    %esp
  a5343d:	8b 23                	mov    (%ebx),%esp
  a5343f:	e8 7c cd ff ff       	call   a501c0 <__efi_early>
  a53444:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a53448:	4c                   	dec    %esp
  a53449:	8b 40 28             	mov    0x28(%eax),%eax
  a5344c:	48                   	dec    %eax
  a5344d:	8b 40 18             	mov    0x18(%eax),%eax
  a53450:	75 a6                	jne    a533f8 <efi_setup_gop+0x138>
  a53452:	8b 78 58             	mov    0x58(%eax),%edi
  a53455:	eb a8                	jmp    a533ff <efi_setup_gop+0x13f>
  a53457:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a5345e:	00 00 
  a53460:	48                   	dec    %eax
  a53461:	83 7c 24 28 00       	cmpl   $0x0,0x28(%esp)
  a53466:	0f 84 4f 04 00 00    	je     a538bb <efi_setup_gop+0x5fb>
  a5346c:	48                   	dec    %eax
  a5346d:	8b 74 24 10          	mov    0x10(%esp),%esi
  a53471:	0f b7 44 24 30       	movzwl 0x30(%esp),%eax
  a53476:	66 89 46 12          	mov    %ax,0x12(%esi)
  a5347a:	0f b7 44 24 32       	movzwl 0x32(%esp),%eax
  a5347f:	c6 46 0f 70          	movb   $0x70,0xf(%esi)
  a53483:	66 89 46 14          	mov    %ax,0x14(%esi)
  a53487:	48                   	dec    %eax
  a53488:	8b 44 24 38          	mov    0x38(%esp),%eax
  a5348c:	89 46 18             	mov    %eax,0x18(%esi)
  a5348f:	48                   	dec    %eax
  a53490:	c1 e8 20             	shr    $0x20,%eax
  a53493:	74 07                	je     a5349c <efi_setup_gop+0x1dc>
  a53495:	83 4e 36 02          	orl    $0x2,0x36(%esi)
  a53499:	89 46 3a             	mov    %eax,0x3a(%esi)
  a5349c:	48                   	dec    %eax
  a5349d:	8b 7c 24 10          	mov    0x10(%esp),%edi
  a534a1:	ba 01 00 00 00       	mov    $0x1,%edx
  a534a6:	44                   	inc    %esp
  a534a7:	8b 44 24 40          	mov    0x40(%esp),%eax
  a534ab:	48                   	dec    %eax
  a534ac:	8b 4c 24 68          	mov    0x68(%esp),%ecx
  a534b0:	8b 74 24 34          	mov    0x34(%esp),%esi
  a534b4:	66 89 57 32          	mov    %dx,0x32(%edi)
  a534b8:	48                   	dec    %eax
  a534b9:	8b 54 24 60          	mov    0x60(%esp),%edx
  a534bd:	e8 2e fc ff ff       	call   a530f0 <setup_pixel_info>
  a534c2:	0f b7 47 24          	movzwl 0x24(%edi),%eax
  a534c6:	0f b7 57 14          	movzwl 0x14(%edi),%edx
  a534ca:	83 4f 36 01          	orl    $0x1,0x36(%edi)
  a534ce:	0f af c2             	imul   %edx,%eax
  a534d1:	89 47 1c             	mov    %eax,0x1c(%edi)
  a534d4:	4c                   	dec    %esp
  a534d5:	8b a4 24 88 00 00 00 	mov    0x88(%esp),%esp
  a534dc:	e8 df cc ff ff       	call   a501c0 <__efi_early>
  a534e1:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a534e5:	48                   	dec    %eax
  a534e6:	8b 50 28             	mov    0x28(%eax),%edx
  a534e9:	48                   	dec    %eax
  a534ea:	8b 48 18             	mov    0x18(%eax),%ecx
  a534ed:	0f 84 4d 01 00 00    	je     a53640 <efi_setup_gop+0x380>
  a534f3:	48                   	dec    %eax
  a534f4:	8b 79 48             	mov    0x48(%ecx),%edi
  a534f7:	4c                   	dec    %esp
  a534f8:	89 e6                	mov    %esp,%esi
  a534fa:	31 c0                	xor    %eax,%eax
  a534fc:	ff d2                	call   *%edx
  a534fe:	48                   	dec    %eax
  a534ff:	8b 44 24 08          	mov    0x8(%esp),%eax
  a53503:	48                   	dec    %eax
  a53504:	81 c4 b8 00 00 00    	add    $0xb8,%esp
  a5350a:	5b                   	pop    %ebx
  a5350b:	5d                   	pop    %ebp
  a5350c:	41                   	inc    %ecx
  a5350d:	5c                   	pop    %esp
  a5350e:	41                   	inc    %ecx
  a5350f:	5d                   	pop    %ebp
  a53510:	41                   	inc    %ecx
  a53511:	5e                   	pop    %esi
  a53512:	41                   	inc    %ecx
  a53513:	5f                   	pop    %edi
  a53514:	c3                   	ret    
  a53515:	0f 1f 00             	nopl   (%eax)
  a53518:	8b 78 2c             	mov    0x2c(%eax),%edi
  a5351b:	e9 ee fd ff ff       	jmp    a5330e <efi_setup_gop+0x4e>
  a53520:	48                   	dec    %eax
  a53521:	8b ba b0 00 00 00    	mov    0xb0(%edx),%edi
  a53527:	e9 24 fe ff ff       	jmp    a53350 <efi_setup_gop+0x90>
  a5352c:	0f 1f 40 00          	nopl   0x0(%eax)
  a53530:	e8 8b cc ff ff       	call   a501c0 <__efi_early>
  a53535:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a53539:	4c                   	dec    %esp
  a5353a:	8b 40 28             	mov    0x28(%eax),%eax
  a5353d:	48                   	dec    %eax
  a5353e:	8b 50 18             	mov    0x18(%eax),%edx
  a53541:	0f 84 89 00 00 00    	je     a535d0 <efi_setup_gop+0x310>
  a53547:	48                   	dec    %eax
  a53548:	8b ba 98 00 00 00    	mov    0x98(%edx),%edi
  a5354e:	31 c0                	xor    %eax,%eax
  a53550:	48                   	dec    %eax
  a53551:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  a53555:	48                   	dec    %eax
  a53556:	8b 54 24 20          	mov    0x20(%esp),%edx
  a5355a:	4c                   	dec    %esp
  a5355b:	89 e6                	mov    %esp,%esi
  a5355d:	41                   	inc    %ecx
  a5355e:	ff d0                	call   *%eax
  a53560:	48                   	dec    %eax
  a53561:	85 c0                	test   %eax,%eax
  a53563:	74 7b                	je     a535e0 <efi_setup_gop+0x320>
  a53565:	48                   	dec    %eax
  a53566:	83 7c 24 28 00       	cmpl   $0x0,0x28(%esp)
  a5356b:	0f 85 a5 fe ff ff    	jne    a53416 <efi_setup_gop+0x156>
  a53571:	48                   	dec    %eax
  a53572:	8b 94 24 90 00 00 00 	mov    0x90(%esp),%edx
  a53579:	48                   	dec    %eax
  a5357a:	8b 72 18             	mov    0x18(%edx),%esi
  a5357d:	48                   	dec    %eax
  a5357e:	8b 46 08             	mov    0x8(%esi),%eax
  a53581:	8b 48 0c             	mov    0xc(%eax),%ecx
  a53584:	83 f9 03             	cmp    $0x3,%ecx
  a53587:	0f 84 89 fe ff ff    	je     a53416 <efi_setup_gop+0x156>
  a5358d:	48                   	dec    %eax
  a5358e:	8b 76 18             	mov    0x18(%esi),%esi
  a53591:	48                   	dec    %eax
  a53592:	8b 78 18             	mov    0x18(%eax),%edi
  a53595:	89 4c 24 40          	mov    %ecx,0x40(%esp)
  a53599:	48                   	dec    %eax
  a5359a:	89 54 24 28          	mov    %edx,0x28(%esp)
  a5359e:	48                   	dec    %eax
  a5359f:	89 74 24 38          	mov    %esi,0x38(%esp)
  a535a3:	0f b7 70 04          	movzwl 0x4(%eax),%esi
  a535a7:	48                   	dec    %eax
  a535a8:	89 7c 24 68          	mov    %edi,0x68(%esp)
  a535ac:	66 89 74 24 30       	mov    %si,0x30(%esp)
  a535b1:	0f b7 70 08          	movzwl 0x8(%eax),%esi
  a535b5:	66 89 74 24 32       	mov    %si,0x32(%esp)
  a535ba:	48                   	dec    %eax
  a535bb:	8b 70 10             	mov    0x10(%eax),%esi
  a535be:	8b 40 20             	mov    0x20(%eax),%eax
  a535c1:	48                   	dec    %eax
  a535c2:	89 74 24 60          	mov    %esi,0x60(%esp)
  a535c6:	89 44 24 34          	mov    %eax,0x34(%esp)
  a535ca:	e9 47 fe ff ff       	jmp    a53416 <efi_setup_gop+0x156>
  a535cf:	90                   	nop
  a535d0:	8b 7a 58             	mov    0x58(%edx),%edi
  a535d3:	e9 76 ff ff ff       	jmp    a5354e <efi_setup_gop+0x28e>
  a535d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a535df:	00 
  a535e0:	48                   	dec    %eax
  a535e1:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
  a535e8:	48                   	dec    %eax
  a535e9:	8b 48 18             	mov    0x18(%eax),%ecx
  a535ec:	48                   	dec    %eax
  a535ed:	8b 41 08             	mov    0x8(%ecx),%eax
  a535f0:	8b 50 0c             	mov    0xc(%eax),%edx
  a535f3:	83 fa 03             	cmp    $0x3,%edx
  a535f6:	0f 84 1a fe ff ff    	je     a53416 <efi_setup_gop+0x156>
  a535fc:	48                   	dec    %eax
  a535fd:	8b 59 18             	mov    0x18(%ecx),%ebx
  a53600:	48                   	dec    %eax
  a53601:	8b 70 10             	mov    0x10(%eax),%esi
  a53604:	89 54 24 40          	mov    %edx,0x40(%esp)
  a53608:	48                   	dec    %eax
  a53609:	8b 78 18             	mov    0x18(%eax),%edi
  a5360c:	48                   	dec    %eax
  a5360d:	89 5c 24 38          	mov    %ebx,0x38(%esp)
  a53611:	0f b7 58 04          	movzwl 0x4(%eax),%ebx
  a53615:	48                   	dec    %eax
  a53616:	89 74 24 60          	mov    %esi,0x60(%esp)
  a5361a:	66 89 5c 24 30       	mov    %bx,0x30(%esp)
  a5361f:	0f b7 58 08          	movzwl 0x8(%eax),%ebx
  a53623:	8b 40 20             	mov    0x20(%eax),%eax
  a53626:	48                   	dec    %eax
  a53627:	89 7c 24 68          	mov    %edi,0x68(%esp)
  a5362b:	66 89 5c 24 32       	mov    %bx,0x32(%esp)
  a53630:	89 44 24 34          	mov    %eax,0x34(%esp)
  a53634:	e9 33 fe ff ff       	jmp    a5346c <efi_setup_gop+0x1ac>
  a53639:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a53640:	8b 79 30             	mov    0x30(%ecx),%edi
  a53643:	e9 af fe ff ff       	jmp    a534f7 <efi_setup_gop+0x237>
  a53648:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a5364f:	00 
  a53650:	48                   	dec    %eax
  a53651:	c1 e8 02             	shr    $0x2,%eax
  a53654:	0f 84 4d 02 00 00    	je     a538a7 <efi_setup_gop+0x5e7>
  a5365a:	49                   	dec    %ecx
  a5365b:	8d 04 84             	lea    (%esp,%eax,4),%eax
  a5365e:	4c                   	dec    %esp
  a5365f:	89 e3                	mov    %esp,%ebx
  a53661:	48                   	dec    %eax
  a53662:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  a53669:	00 
  a5366a:	4c                   	dec    %esp
  a5366b:	8d ac 24 90 00 00 00 	lea    0x90(%esp),%ebp
  a53672:	49                   	dec    %ecx
  a53673:	bf 2c 6f b3 d3       	mov    $0xd3b36f2c,%edi
  a53678:	51                   	push   %ecx
  a53679:	d5 d4                	aad    $0xd4
  a5367b:	11 48 89             	adc    %ecx,-0x77(%eax)
  a5367e:	04 24                	add    $0x24,%al
  a53680:	48                   	dec    %eax
  a53681:	8d 84 24 98 00 00 00 	lea    0x98(%esp),%eax
  a53688:	49                   	dec    %ecx
  a53689:	be 9a 46 00 90       	mov    $0x9000469a,%esi
  a5368e:	27                   	daa    
  a5368f:	3f                   	aas    
  a53690:	c1 4d 48 89          	rorl   $0x89,0x48(%ebp)
  a53694:	44                   	inc    %esp
  a53695:	24 18                	and    $0x18,%al
  a53697:	48                   	dec    %eax
  a53698:	8d 84 24 a0 00 00 00 	lea    0xa0(%esp),%eax
  a5369f:	48                   	dec    %eax
  a536a0:	89 44 24 20          	mov    %eax,0x20(%esp)
  a536a4:	eb 32                	jmp    a536d8 <efi_setup_gop+0x418>
  a536a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
  a536ad:	00 00 00 
  a536b0:	48                   	dec    %eax
  a536b1:	8b b8 98 00 00 00    	mov    0x98(%eax),%edi
  a536b7:	31 c0                	xor    %eax,%eax
  a536b9:	4c                   	dec    %esp
  a536ba:	89 e9                	mov    %ebp,%ecx
  a536bc:	48                   	dec    %eax
  a536bd:	89 ea                	mov    %ebp,%edx
  a536bf:	4c                   	dec    %esp
  a536c0:	89 e6                	mov    %esp,%esi
  a536c2:	41                   	inc    %ecx
  a536c3:	ff d0                	call   *%eax
  a536c5:	48                   	dec    %eax
  a536c6:	85 c0                	test   %eax,%eax
  a536c8:	74 46                	je     a53710 <efi_setup_gop+0x450>
  a536ca:	48                   	dec    %eax
  a536cb:	83 c3 04             	add    $0x4,%ebx
  a536ce:	48                   	dec    %eax
  a536cf:	3b 1c 24             	cmp    (%esp),%ebx
  a536d2:	0f 84 e8 00 00 00    	je     a537c0 <efi_setup_gop+0x500>
  a536d8:	4c                   	dec    %esp
  a536d9:	89 bc 24 a0 00 00 00 	mov    %edi,0xa0(%esp)
  a536e0:	4c                   	dec    %esp
  a536e1:	89 b4 24 a8 00 00 00 	mov    %esi,0xa8(%esp)
  a536e8:	48                   	dec    %eax
  a536e9:	c7 84 24 98 00 00 00 	movl   $0x0,0x98(%esp)
  a536f0:	00 00 00 00 
  a536f4:	44                   	inc    %esp
  a536f5:	8b 23                	mov    (%ebx),%esp
  a536f7:	e8 c4 ca ff ff       	call   a501c0 <__efi_early>
  a536fc:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a53700:	4c                   	dec    %esp
  a53701:	8b 40 28             	mov    0x28(%eax),%eax
  a53704:	48                   	dec    %eax
  a53705:	8b 40 18             	mov    0x18(%eax),%eax
  a53708:	75 a6                	jne    a536b0 <efi_setup_gop+0x3f0>
  a5370a:	8b 78 58             	mov    0x58(%eax),%edi
  a5370d:	eb a8                	jmp    a536b7 <efi_setup_gop+0x3f7>
  a5370f:	90                   	nop
  a53710:	e8 ab ca ff ff       	call   a501c0 <__efi_early>
  a53715:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a53719:	4c                   	dec    %esp
  a5371a:	8b 40 28             	mov    0x28(%eax),%eax
  a5371d:	48                   	dec    %eax
  a5371e:	8b 50 18             	mov    0x18(%eax),%edx
  a53721:	0f 84 21 01 00 00    	je     a53848 <efi_setup_gop+0x588>
  a53727:	48                   	dec    %eax
  a53728:	8b ba 98 00 00 00    	mov    0x98(%edx),%edi
  a5372e:	31 c0                	xor    %eax,%eax
  a53730:	48                   	dec    %eax
  a53731:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  a53735:	48                   	dec    %eax
  a53736:	8b 54 24 20          	mov    0x20(%esp),%edx
  a5373a:	4c                   	dec    %esp
  a5373b:	89 e6                	mov    %esp,%esi
  a5373d:	41                   	inc    %ecx
  a5373e:	ff d0                	call   *%eax
  a53740:	48                   	dec    %eax
  a53741:	85 c0                	test   %eax,%eax
  a53743:	0f 84 07 01 00 00    	je     a53850 <efi_setup_gop+0x590>
  a53749:	48                   	dec    %eax
  a5374a:	83 7c 24 28 00       	cmpl   $0x0,0x28(%esp)
  a5374f:	0f 85 75 ff ff ff    	jne    a536ca <efi_setup_gop+0x40a>
  a53755:	48                   	dec    %eax
  a53756:	8b 94 24 90 00 00 00 	mov    0x90(%esp),%edx
  a5375d:	8b 72 0c             	mov    0xc(%edx),%esi
  a53760:	8b 46 08             	mov    0x8(%esi),%eax
  a53763:	8b 48 0c             	mov    0xc(%eax),%ecx
  a53766:	83 f9 03             	cmp    $0x3,%ecx
  a53769:	0f 84 5b ff ff ff    	je     a536ca <efi_setup_gop+0x40a>
  a5376f:	48                   	dec    %eax
  a53770:	8b 76 10             	mov    0x10(%esi),%esi
  a53773:	48                   	dec    %eax
  a53774:	8b 78 18             	mov    0x18(%eax),%edi
  a53777:	89 4c 24 74          	mov    %ecx,0x74(%esp)
  a5377b:	48                   	dec    %eax
  a5377c:	83 c3 04             	add    $0x4,%ebx
  a5377f:	48                   	dec    %eax
  a53780:	89 54 24 28          	mov    %edx,0x28(%esp)
  a53784:	48                   	dec    %eax
  a53785:	89 74 24 48          	mov    %esi,0x48(%esp)
  a53789:	0f b7 70 04          	movzwl 0x4(%eax),%esi
  a5378d:	48                   	dec    %eax
  a5378e:	89 7c 24 58          	mov    %edi,0x58(%esp)
  a53792:	66 89 74 24 44       	mov    %si,0x44(%esp)
  a53797:	0f b7 70 08          	movzwl 0x8(%eax),%esi
  a5379b:	66 89 74 24 46       	mov    %si,0x46(%esp)
  a537a0:	48                   	dec    %eax
  a537a1:	8b 70 10             	mov    0x10(%eax),%esi
  a537a4:	8b 40 20             	mov    0x20(%eax),%eax
  a537a7:	48                   	dec    %eax
  a537a8:	89 74 24 50          	mov    %esi,0x50(%esp)
  a537ac:	89 44 24 70          	mov    %eax,0x70(%esp)
  a537b0:	48                   	dec    %eax
  a537b1:	3b 1c 24             	cmp    (%esp),%ebx
  a537b4:	0f 85 1e ff ff ff    	jne    a536d8 <efi_setup_gop+0x418>
  a537ba:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a537c0:	48                   	dec    %eax
  a537c1:	83 7c 24 28 00       	cmpl   $0x0,0x28(%esp)
  a537c6:	0f 84 ef 00 00 00    	je     a538bb <efi_setup_gop+0x5fb>
  a537cc:	48                   	dec    %eax
  a537cd:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  a537d1:	0f b7 44 24 44       	movzwl 0x44(%esp),%eax
  a537d6:	66 89 41 12          	mov    %ax,0x12(%ecx)
  a537da:	0f b7 44 24 46       	movzwl 0x46(%esp),%eax
  a537df:	c6 41 0f 70          	movb   $0x70,0xf(%ecx)
  a537e3:	66 89 41 14          	mov    %ax,0x14(%ecx)
  a537e7:	48                   	dec    %eax
  a537e8:	8b 44 24 48          	mov    0x48(%esp),%eax
  a537ec:	89 41 18             	mov    %eax,0x18(%ecx)
  a537ef:	48                   	dec    %eax
  a537f0:	c1 e8 20             	shr    $0x20,%eax
  a537f3:	74 07                	je     a537fc <efi_setup_gop+0x53c>
  a537f5:	83 49 36 02          	orl    $0x2,0x36(%ecx)
  a537f9:	89 41 3a             	mov    %eax,0x3a(%ecx)
  a537fc:	48                   	dec    %eax
  a537fd:	8b 7c 24 10          	mov    0x10(%esp),%edi
  a53801:	b8 01 00 00 00       	mov    $0x1,%eax
  a53806:	48                   	dec    %eax
  a53807:	8b 54 24 50          	mov    0x50(%esp),%edx
  a5380b:	44                   	inc    %esp
  a5380c:	8b 44 24 74          	mov    0x74(%esp),%eax
  a53810:	48                   	dec    %eax
  a53811:	8b 4c 24 58          	mov    0x58(%esp),%ecx
  a53815:	66 89 47 32          	mov    %ax,0x32(%edi)
  a53819:	8b 74 24 70          	mov    0x70(%esp),%esi
  a5381d:	e8 ce f8 ff ff       	call   a530f0 <setup_pixel_info>
  a53822:	0f b7 47 24          	movzwl 0x24(%edi),%eax
  a53826:	0f b7 57 14          	movzwl 0x14(%edi),%edx
  a5382a:	83 4f 36 01          	orl    $0x1,0x36(%edi)
  a5382e:	4c                   	dec    %esp
  a5382f:	8b a4 24 88 00 00 00 	mov    0x88(%esp),%esp
  a53836:	0f af c2             	imul   %edx,%eax
  a53839:	89 47 1c             	mov    %eax,0x1c(%edi)
  a5383c:	e9 9b fc ff ff       	jmp    a534dc <efi_setup_gop+0x21c>
  a53841:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a53848:	8b 7a 58             	mov    0x58(%edx),%edi
  a5384b:	e9 de fe ff ff       	jmp    a5372e <efi_setup_gop+0x46e>
  a53850:	48                   	dec    %eax
  a53851:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
  a53858:	8b 48 0c             	mov    0xc(%eax),%ecx
  a5385b:	8b 41 08             	mov    0x8(%ecx),%eax
  a5385e:	8b 50 0c             	mov    0xc(%eax),%edx
  a53861:	83 fa 03             	cmp    $0x3,%edx
  a53864:	0f 84 60 fe ff ff    	je     a536ca <efi_setup_gop+0x40a>
  a5386a:	48                   	dec    %eax
  a5386b:	8b 59 10             	mov    0x10(%ecx),%ebx
  a5386e:	48                   	dec    %eax
  a5386f:	8b 70 10             	mov    0x10(%eax),%esi
  a53872:	89 54 24 74          	mov    %edx,0x74(%esp)
  a53876:	48                   	dec    %eax
  a53877:	8b 78 18             	mov    0x18(%eax),%edi
  a5387a:	48                   	dec    %eax
  a5387b:	89 5c 24 48          	mov    %ebx,0x48(%esp)
  a5387f:	0f b7 58 04          	movzwl 0x4(%eax),%ebx
  a53883:	48                   	dec    %eax
  a53884:	89 74 24 50          	mov    %esi,0x50(%esp)
  a53888:	66 89 5c 24 44       	mov    %bx,0x44(%esp)
  a5388d:	0f b7 58 08          	movzwl 0x8(%eax),%ebx
  a53891:	8b 40 20             	mov    0x20(%eax),%eax
  a53894:	48                   	dec    %eax
  a53895:	89 7c 24 58          	mov    %edi,0x58(%esp)
  a53899:	66 89 5c 24 46       	mov    %bx,0x46(%esp)
  a5389e:	89 44 24 70          	mov    %eax,0x70(%esp)
  a538a2:	e9 25 ff ff ff       	jmp    a537cc <efi_setup_gop+0x50c>
  a538a7:	48                   	dec    %eax
  a538a8:	b8 0e 00 00 00       	mov    $0xe,%eax
  a538ad:	00 00                	add    %al,(%eax)
  a538af:	00 80 48 89 44 24    	add    %al,0x24448948(%eax)
  a538b5:	08 e9                	or     %ch,%cl
  a538b7:	21 fc                	and    %edi,%esp
  a538b9:	ff                   	(bad)  
  a538ba:	ff 48 b8             	decl   -0x48(%eax)
  a538bd:	0e                   	push   %cs
  a538be:	00 00                	add    %al,(%eax)
  a538c0:	00 00                	add    %al,(%eax)
  a538c2:	00 00                	add    %al,(%eax)
  a538c4:	80 4c 8b a4 24       	orb    $0x24,-0x5c(%ebx,%ecx,4)
  a538c9:	88 00                	mov    %al,(%eax)
  a538cb:	00 00                	add    %al,(%eax)
  a538cd:	48                   	dec    %eax
  a538ce:	89 44 24 08          	mov    %eax,0x8(%esp)
  a538d2:	e9 05 fc ff ff       	jmp    a534dc <efi_setup_gop+0x21c>
  a538d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
  a538de:	00 00 

0000000000a538e0 <efi_get_secureboot>:
  a538e0:	f3 0f 1e fa          	endbr64 
  a538e4:	55                   	push   %ebp
  a538e5:	48                   	dec    %eax
  a538e6:	89 fd                	mov    %edi,%ebp
  a538e8:	53                   	push   %ebx
  a538e9:	48                   	dec    %eax
  a538ea:	83 ec 28             	sub    $0x28,%esp
  a538ed:	48                   	dec    %eax
  a538ee:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%esp)
  a538f5:	00 
  a538f6:	e8 c5 c8 ff ff       	call   a501c0 <__efi_early>
  a538fb:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a538ff:	4c                   	dec    %esp
  a53900:	8b 50 28             	mov    0x28(%eax),%edx
  a53903:	48                   	dec    %eax
  a53904:	8b 40 10             	mov    0x10(%eax),%eax
  a53907:	0f 84 33 01 00 00    	je     a53a40 <efi_get_secureboot+0x160>
  a5390d:	48                   	dec    %eax
  a5390e:	8b 78 48             	mov    0x48(%eax),%edi
  a53911:	48                   	dec    %eax
  a53912:	8d 5c 24 18          	lea    0x18(%esp),%ebx
  a53916:	48                   	dec    %eax
  a53917:	8d 15 e3 09 00 00    	lea    0x9e3,%edx
  a5391d:	31 c9                	xor    %ecx,%ecx
  a5391f:	31 c0                	xor    %eax,%eax
  a53921:	4c                   	dec    %esp
  a53922:	8d 4c 24 11          	lea    0x11(%esp),%ecx
  a53926:	49                   	dec    %ecx
  a53927:	89 d8                	mov    %ebx,%eax
  a53929:	48                   	dec    %eax
  a5392a:	8d 35 b0 09 00 00    	lea    0x9b0,%esi
  a53930:	41                   	inc    %ecx
  a53931:	ff d2                	call   *%edx
  a53933:	48                   	dec    %eax
  a53934:	ba 0e 00 00 00       	mov    $0xe,%edx
  a53939:	00 00                	add    %al,(%eax)
  a5393b:	00 80 48 39 d0 0f    	add    %al,0xfd03948(%eax)
  a53941:	84 2a                	test   %ch,(%edx)
  a53943:	01 00                	add    %eax,(%eax)
  a53945:	00 48 85             	add    %cl,-0x7b(%eax)
  a53948:	c0 0f 85             	rorb   $0x85,(%edi)
  a5394b:	01 01                	add    %eax,(%ecx)
  a5394d:	00 00                	add    %al,(%eax)
  a5394f:	48                   	dec    %eax
  a53950:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%esp)
  a53957:	00 
  a53958:	e8 63 c8 ff ff       	call   a501c0 <__efi_early>
  a5395d:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a53961:	4c                   	dec    %esp
  a53962:	8b 50 28             	mov    0x28(%eax),%edx
  a53965:	48                   	dec    %eax
  a53966:	8b 40 10             	mov    0x10(%eax),%eax
  a53969:	0f 85 c1 00 00 00    	jne    a53a30 <efi_get_secureboot+0x150>
  a5396f:	8b 78 30             	mov    0x30(%eax),%edi
  a53972:	31 c9                	xor    %ecx,%ecx
  a53974:	31 c0                	xor    %eax,%eax
  a53976:	4c                   	dec    %esp
  a53977:	8d 4c 24 12          	lea    0x12(%esp),%ecx
  a5397b:	49                   	dec    %ecx
  a5397c:	89 d8                	mov    %ebx,%eax
  a5397e:	48                   	dec    %eax
  a5397f:	8d 15 7b 09 00 00    	lea    0x97b,%edx
  a53985:	48                   	dec    %eax
  a53986:	8d 35 34 09 00 00    	lea    0x934,%esi
  a5398c:	41                   	inc    %ecx
  a5398d:	ff d2                	call   *%edx
  a5398f:	48                   	dec    %eax
  a53990:	85 c0                	test   %eax,%eax
  a53992:	0f 85 b8 00 00 00    	jne    a53a50 <efi_get_secureboot+0x170>
  a53998:	80 7c 24 11 00       	cmpb   $0x0,0x11(%esp)
  a5399d:	0f 84 cd 00 00 00    	je     a53a70 <efi_get_secureboot+0x190>
  a539a3:	80 7c 24 12 01       	cmpb   $0x1,0x12(%esp)
  a539a8:	0f 84 c2 00 00 00    	je     a53a70 <efi_get_secureboot+0x190>
  a539ae:	48                   	dec    %eax
  a539af:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%esp)
  a539b6:	00 
  a539b7:	e8 04 c8 ff ff       	call   a501c0 <__efi_early>
  a539bc:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a539c0:	4c                   	dec    %esp
  a539c1:	8b 50 28             	mov    0x28(%eax),%edx
  a539c4:	48                   	dec    %eax
  a539c5:	8b 40 10             	mov    0x10(%eax),%eax
  a539c8:	0f 85 b2 00 00 00    	jne    a53a80 <efi_get_secureboot+0x1a0>
  a539ce:	8b 78 30             	mov    0x30(%eax),%edi
  a539d1:	31 c0                	xor    %eax,%eax
  a539d3:	48                   	dec    %eax
  a539d4:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  a539d8:	4c                   	dec    %esp
  a539d9:	8d 4c 24 13          	lea    0x13(%esp),%ecx
  a539dd:	49                   	dec    %ecx
  a539de:	89 d8                	mov    %ebx,%eax
  a539e0:	48                   	dec    %eax
  a539e1:	8d 15 c9 08 00 00    	lea    0x8c9,%edx
  a539e7:	48                   	dec    %eax
  a539e8:	8d 35 a2 08 00 00    	lea    0x8a2,%esi
  a539ee:	41                   	inc    %ecx
  a539ef:	ff d2                	call   *%edx
  a539f1:	48                   	dec    %eax
  a539f2:	85 c0                	test   %eax,%eax
  a539f4:	75 0e                	jne    a53a04 <efi_get_secureboot+0x124>
  a539f6:	f6 44 24 14 04       	testb  $0x4,0x14(%esp)
  a539fb:	75 07                	jne    a53a04 <efi_get_secureboot+0x124>
  a539fd:	80 7c 24 13 01       	cmpb   $0x1,0x13(%esp)
  a53a02:	74 6c                	je     a53a70 <efi_get_secureboot+0x190>
  a53a04:	e8 77 df ff ff       	call   a51980 <is_quiet>
  a53a09:	41                   	inc    %ecx
  a53a0a:	89 c0                	mov    %eax,%eax
  a53a0c:	b8 03 00 00 00       	mov    $0x3,%eax
  a53a11:	45                   	inc    %ebp
  a53a12:	85 c0                	test   %eax,%eax
  a53a14:	75 4e                	jne    a53a64 <efi_get_secureboot+0x184>
  a53a16:	48                   	dec    %eax
  a53a17:	8d 35 5b 11 00 00    	lea    0x115b,%esi
  a53a1d:	48                   	dec    %eax
  a53a1e:	89 ef                	mov    %ebp,%edi
  a53a20:	89 44 24 0c          	mov    %eax,0xc(%esp)
  a53a24:	e8 77 df ff ff       	call   a519a0 <efi_printk>
  a53a29:	8b 44 24 0c          	mov    0xc(%esp),%eax
  a53a2d:	eb 35                	jmp    a53a64 <efi_get_secureboot+0x184>
  a53a2f:	90                   	nop
  a53a30:	48                   	dec    %eax
  a53a31:	8b 78 48             	mov    0x48(%eax),%edi
  a53a34:	e9 39 ff ff ff       	jmp    a53972 <efi_get_secureboot+0x92>
  a53a39:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a53a40:	8b 78 30             	mov    0x30(%eax),%edi
  a53a43:	e9 c9 fe ff ff       	jmp    a53911 <efi_get_secureboot+0x31>
  a53a48:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a53a4f:	00 
  a53a50:	48                   	dec    %eax
  a53a51:	8d 35 49 11 00 00    	lea    0x1149,%esi
  a53a57:	48                   	dec    %eax
  a53a58:	89 ef                	mov    %ebp,%edi
  a53a5a:	e8 41 df ff ff       	call   a519a0 <efi_printk>
  a53a5f:	b8 01 00 00 00       	mov    $0x1,%eax
  a53a64:	48                   	dec    %eax
  a53a65:	83 c4 28             	add    $0x28,%esp
  a53a68:	5b                   	pop    %ebx
  a53a69:	5d                   	pop    %ebp
  a53a6a:	c3                   	ret    
  a53a6b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a53a70:	48                   	dec    %eax
  a53a71:	83 c4 28             	add    $0x28,%esp
  a53a74:	b8 02 00 00 00       	mov    $0x2,%eax
  a53a79:	5b                   	pop    %ebx
  a53a7a:	5d                   	pop    %ebp
  a53a7b:	c3                   	ret    
  a53a7c:	0f 1f 40 00          	nopl   0x0(%eax)
  a53a80:	48                   	dec    %eax
  a53a81:	8b 78 48             	mov    0x48(%eax),%edi
  a53a84:	e9 48 ff ff ff       	jmp    a539d1 <efi_get_secureboot+0xf1>
  a53a89:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)

0000000000a53a90 <efi_enable_reset_attack_mitigation>:
  a53a90:	f3 0f 1e fa          	endbr64 
  a53a94:	48                   	dec    %eax
  a53a95:	b8 be 39 09 e2       	mov    $0xe20939be,%eax
  a53a9a:	d4 32                	aam    $0x32
  a53a9c:	be 41 41 54 48       	mov    $0x48544141,%esi
  a53aa1:	83 ec 20             	sub    $0x20,%esp
  a53aa4:	48                   	dec    %eax
  a53aa5:	89 44 24 10          	mov    %eax,0x10(%esp)
  a53aa9:	48                   	dec    %eax
  a53aaa:	b8 a1 50 89 7f       	mov    $0x7f8950a1,%eax
  a53aaf:	85 d4                	test   %edx,%esp
  a53ab1:	98                   	cwtl   
  a53ab2:	29 c6                	sub    %eax,%esi
  a53ab4:	44                   	inc    %esp
  a53ab5:	24 07                	and    $0x7,%al
  a53ab7:	01 48 89             	add    %ecx,-0x77(%eax)
  a53aba:	44                   	inc    %esp
  a53abb:	24 18                	and    $0x18,%al
  a53abd:	48                   	dec    %eax
  a53abe:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  a53ac5:	00 
  a53ac6:	e8 f5 c6 ff ff       	call   a501c0 <__efi_early>
  a53acb:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a53acf:	4c                   	dec    %esp
  a53ad0:	8b 50 28             	mov    0x28(%eax),%edx
  a53ad3:	48                   	dec    %eax
  a53ad4:	8b 40 10             	mov    0x10(%eax),%eax
  a53ad7:	74 77                	je     a53b50 <efi_enable_reset_attack_mitigation+0xc0>
  a53ad9:	48                   	dec    %eax
  a53ada:	8b 78 48             	mov    0x48(%eax),%edi
  a53add:	4c                   	dec    %esp
  a53ade:	8d 64 24 10          	lea    0x10(%esp),%esp
  a53ae2:	4c                   	dec    %esp
  a53ae3:	8d 44 24 08          	lea    0x8(%esp),%eax
  a53ae7:	45                   	inc    %ebp
  a53ae8:	31 c9                	xor    %ecx,%ecx
  a53aea:	31 c9                	xor    %ecx,%ecx
  a53aec:	4c                   	dec    %esp
  a53aed:	89 e2                	mov    %esp,%edx
  a53aef:	48                   	dec    %eax
  a53af0:	8d 35 2a 08 00 00    	lea    0x82a,%esi
  a53af6:	31 c0                	xor    %eax,%eax
  a53af8:	41                   	inc    %ecx
  a53af9:	ff d2                	call   *%edx
  a53afb:	49                   	dec    %ecx
  a53afc:	89 c0                	mov    %eax,%eax
  a53afe:	48                   	dec    %eax
  a53aff:	b8 0e 00 00 00       	mov    $0xe,%eax
  a53b04:	00 00                	add    %al,(%eax)
  a53b06:	00 80 49 39 c0 74    	add    %al,0x74c03949(%eax)
  a53b0c:	35 e8 ae c6 ff       	xor    $0xffc6aee8,%eax
  a53b11:	ff 80 78 30 00 4c    	incl   0x4c003078(%eax)
  a53b17:	8b 50 28             	mov    0x28(%eax),%edx
  a53b1a:	48                   	dec    %eax
  a53b1b:	8b 50 10             	mov    0x10(%eax),%edx
  a53b1e:	75 38                	jne    a53b58 <efi_enable_reset_attack_mitigation+0xc8>
  a53b20:	8b 7a 38             	mov    0x38(%edx),%edi
  a53b23:	4c                   	dec    %esp
  a53b24:	8d 4c 24 07          	lea    0x7(%esp),%ecx
  a53b28:	41                   	inc    %ecx
  a53b29:	b8 01 00 00 00       	mov    $0x1,%eax
  a53b2e:	4c                   	dec    %esp
  a53b2f:	89 e2                	mov    %esp,%edx
  a53b31:	31 c0                	xor    %eax,%eax
  a53b33:	b9 07 00 00 00       	mov    $0x7,%ecx
  a53b38:	48                   	dec    %eax
  a53b39:	8d 35 e1 07 00 00    	lea    0x7e1,%esi
  a53b3f:	41                   	inc    %ecx
  a53b40:	ff d2                	call   *%edx
  a53b42:	48                   	dec    %eax
  a53b43:	83 c4 20             	add    $0x20,%esp
  a53b46:	41                   	inc    %ecx
  a53b47:	5c                   	pop    %esp
  a53b48:	c3                   	ret    
  a53b49:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a53b50:	8b 78 30             	mov    0x30(%eax),%edi
  a53b53:	eb 88                	jmp    a53add <efi_enable_reset_attack_mitigation+0x4d>
  a53b55:	0f 1f 00             	nopl   (%eax)
  a53b58:	48                   	dec    %eax
  a53b59:	8b 7a 58             	mov    0x58(%edx),%edi
  a53b5c:	eb c5                	jmp    a53b23 <efi_enable_reset_attack_mitigation+0x93>
  a53b5e:	66 90                	xchg   %ax,%ax

0000000000a53b60 <efi_retrieve_tpm2_eventlog>:
  a53b60:	f3 0f 1e fa          	endbr64 
  a53b64:	48                   	dec    %eax
  a53b65:	b8 6c 76 7f 60       	mov    $0x607f766c,%eax
  a53b6a:	55                   	push   %ebp
  a53b6b:	74 be                	je     a53b2b <efi_enable_reset_attack_mitigation+0x9b>
  a53b6d:	42                   	inc    %edx
  a53b6e:	41                   	inc    %ecx
  a53b6f:	56                   	push   %esi
  a53b70:	41                   	inc    %ecx
  a53b71:	55                   	push   %ebp
  a53b72:	41                   	inc    %ecx
  a53b73:	54                   	push   %esp
  a53b74:	55                   	push   %ebp
  a53b75:	48                   	dec    %eax
  a53b76:	89 fd                	mov    %edi,%ebp
  a53b78:	48                   	dec    %eax
  a53b79:	83 ec 58             	sub    $0x58,%esp
  a53b7c:	48                   	dec    %eax
  a53b7d:	89 44 24 30          	mov    %eax,0x30(%esp)
  a53b81:	48                   	dec    %eax
  a53b82:	b8 93 0b e4 d7       	mov    $0xd7e40b93,%eax
  a53b87:	6d                   	insl   (%dx),%es:(%edi)
  a53b88:	b2 72                	mov    $0x72,%dl
  a53b8a:	0f 48 89 44 24 38 48 	cmovs  0x48382444(%ecx),%ecx
  a53b91:	b8 b0 9c 79 b7       	mov    $0xb7799cb0,%eax
  a53b96:	a2 ec 43 49 48       	mov    %al,0x484943ec
  a53b9b:	89 44 24 40          	mov    %eax,0x40(%esp)
  a53b9f:	48                   	dec    %eax
  a53ba0:	b8 96 67 1f ae       	mov    $0xae1f6796,%eax
  a53ba5:	07                   	pop    %es
  a53ba6:	b7 47                	mov    $0x47,%bh
  a53ba8:	fa                   	cli    
  a53ba9:	48                   	dec    %eax
  a53baa:	89 44 24 48          	mov    %eax,0x48(%esp)
  a53bae:	48                   	dec    %eax
  a53baf:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  a53bb6:	00 
  a53bb7:	48                   	dec    %eax
  a53bb8:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  a53bbf:	00 
  a53bc0:	48                   	dec    %eax
  a53bc1:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
  a53bc8:	00 
  a53bc9:	48                   	dec    %eax
  a53bca:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  a53bd1:	00 
  a53bd2:	e8 e9 c5 ff ff       	call   a501c0 <__efi_early>
  a53bd7:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a53bdb:	4c                   	dec    %esp
  a53bdc:	8b 40 28             	mov    0x28(%eax),%eax
  a53bdf:	48                   	dec    %eax
  a53be0:	8b 40 18             	mov    0x18(%eax),%eax
  a53be3:	0f 84 4f 01 00 00    	je     a53d38 <efi_retrieve_tpm2_eventlog+0x1d8>
  a53be9:	48                   	dec    %eax
  a53bea:	8b b8 40 01 00 00    	mov    0x140(%eax),%edi
  a53bf0:	31 d2                	xor    %edx,%edx
  a53bf2:	48                   	dec    %eax
  a53bf3:	8d 4c 24 28          	lea    0x28(%esp),%ecx
  a53bf7:	48                   	dec    %eax
  a53bf8:	8d 74 24 30          	lea    0x30(%esp),%esi
  a53bfc:	31 c0                	xor    %eax,%eax
  a53bfe:	41                   	inc    %ecx
  a53bff:	ff d0                	call   *%eax
  a53c01:	48                   	dec    %eax
  a53c02:	85 c0                	test   %eax,%eax
  a53c04:	0f 85 1c 01 00 00    	jne    a53d26 <efi_retrieve_tpm2_eventlog+0x1c6>
  a53c0a:	e8 b1 c5 ff ff       	call   a501c0 <__efi_early>
  a53c0f:	48                   	dec    %eax
  a53c10:	8b 74 24 28          	mov    0x28(%esp),%esi
  a53c14:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a53c18:	4c                   	dec    %esp
  a53c19:	8b 50 28             	mov    0x28(%eax),%edx
  a53c1c:	0f 85 26 01 00 00    	jne    a53d48 <efi_retrieve_tpm2_eventlog+0x1e8>
  a53c22:	8b 7e 04             	mov    0x4(%esi),%edi
  a53c25:	31 c0                	xor    %eax,%eax
  a53c27:	48                   	dec    %eax
  a53c28:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  a53c2c:	4c                   	dec    %esp
  a53c2d:	8d 4c 24 0f          	lea    0xf(%esp),%ecx
  a53c31:	ba 01 00 00 00       	mov    $0x1,%edx
  a53c36:	4c                   	dec    %esp
  a53c37:	8d 44 24 18          	lea    0x18(%esp),%eax
  a53c3b:	41                   	inc    %ecx
  a53c3c:	ff d2                	call   *%edx
  a53c3e:	48                   	dec    %eax
  a53c3f:	85 c0                	test   %eax,%eax
  a53c41:	0f 85 df 00 00 00    	jne    a53d26 <efi_retrieve_tpm2_eventlog+0x1c6>
  a53c47:	4c                   	dec    %esp
  a53c48:	8b 6c 24 10          	mov    0x10(%esp),%ebp
  a53c4c:	4d                   	dec    %ebp
  a53c4d:	85 ed                	test   %ebp,%ebp
  a53c4f:	0f 84 d1 00 00 00    	je     a53d26 <efi_retrieve_tpm2_eventlog+0x1c6>
  a53c55:	4c                   	dec    %esp
  a53c56:	8b 64 24 18          	mov    0x18(%esp),%esp
  a53c5a:	41                   	inc    %ecx
  a53c5b:	be 08 00 00 00       	mov    $0x8,%esi
  a53c60:	4d                   	dec    %ebp
  a53c61:	85 e4                	test   %esp,%esp
  a53c63:	0f 85 ff 00 00 00    	jne    a53d68 <efi_retrieve_tpm2_eventlog+0x208>
  a53c69:	e8 52 c5 ff ff       	call   a501c0 <__efi_early>
  a53c6e:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a53c72:	4c                   	dec    %esp
  a53c73:	8b 40 28             	mov    0x28(%eax),%eax
  a53c76:	48                   	dec    %eax
  a53c77:	8b 50 18             	mov    0x18(%eax),%edx
  a53c7a:	0f 85 d8 00 00 00    	jne    a53d58 <efi_retrieve_tpm2_eventlog+0x1f8>
  a53c80:	8b 7a 2c             	mov    0x2c(%edx),%edi
  a53c83:	31 c0                	xor    %eax,%eax
  a53c85:	48                   	dec    %eax
  a53c86:	8d 4c 24 20          	lea    0x20(%esp),%ecx
  a53c8a:	4c                   	dec    %esp
  a53c8b:	89 f2                	mov    %esi,%edx
  a53c8d:	be 02 00 00 00       	mov    $0x2,%esi
  a53c92:	41                   	inc    %ecx
  a53c93:	ff d0                	call   *%eax
  a53c95:	48                   	dec    %eax
  a53c96:	85 c0                	test   %eax,%eax
  a53c98:	0f 85 ea 00 00 00    	jne    a53d88 <efi_retrieve_tpm2_eventlog+0x228>
  a53c9e:	48                   	dec    %eax
  a53c9f:	8b 7c 24 20          	mov    0x20(%esp),%edi
  a53ca3:	31 f6                	xor    %esi,%esi
  a53ca5:	4c                   	dec    %esp
  a53ca6:	89 f2                	mov    %esi,%edx
  a53ca8:	e8 83 9f ff ff       	call   a4dc30 <memset>
  a53cad:	48                   	dec    %eax
  a53cae:	8b 44 24 20          	mov    0x20(%esp),%eax
  a53cb2:	4c                   	dec    %esp
  a53cb3:	89 e2                	mov    %esp,%edx
  a53cb5:	4c                   	dec    %esp
  a53cb6:	89 ee                	mov    %ebp,%esi
  a53cb8:	44                   	inc    %esp
  a53cb9:	89 20                	mov    %esp,(%eax)
  a53cbb:	48                   	dec    %eax
  a53cbc:	8b 44 24 20          	mov    0x20(%esp),%eax
  a53cc0:	c6 40 04 01          	movb   $0x1,0x4(%eax)
  a53cc4:	48                   	dec    %eax
  a53cc5:	8b 44 24 20          	mov    0x20(%esp),%eax
  a53cc9:	48                   	dec    %eax
  a53cca:	8d 78 05             	lea    0x5(%eax),%edi
  a53ccd:	e8 ee 9f ff ff       	call   a4dcc0 <memcpy>
  a53cd2:	e8 e9 c4 ff ff       	call   a501c0 <__efi_early>
  a53cd7:	48                   	dec    %eax
  a53cd8:	8b 54 24 20          	mov    0x20(%esp),%edx
  a53cdc:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a53ce0:	48                   	dec    %eax
  a53ce1:	8b 48 28             	mov    0x28(%eax),%ecx
  a53ce4:	48                   	dec    %eax
  a53ce5:	8b 40 18             	mov    0x18(%eax),%eax
  a53ce8:	0f 84 b2 00 00 00    	je     a53da0 <efi_retrieve_tpm2_eventlog+0x240>
  a53cee:	48                   	dec    %eax
  a53cef:	8b b8 c0 00 00 00    	mov    0xc0(%eax),%edi
  a53cf5:	31 c0                	xor    %eax,%eax
  a53cf7:	48                   	dec    %eax
  a53cf8:	8d 74 24 40          	lea    0x40(%esp),%esi
  a53cfc:	ff d1                	call   *%ecx
  a53cfe:	48                   	dec    %eax
  a53cff:	85 c0                	test   %eax,%eax
  a53d01:	74 23                	je     a53d26 <efi_retrieve_tpm2_eventlog+0x1c6>
  a53d03:	e8 b8 c4 ff ff       	call   a501c0 <__efi_early>
  a53d08:	48                   	dec    %eax
  a53d09:	8b 74 24 20          	mov    0x20(%esp),%esi
  a53d0d:	80 78 30 00          	cmpb   $0x0,0x30(%eax)
  a53d11:	48                   	dec    %eax
  a53d12:	8b 50 28             	mov    0x28(%eax),%edx
  a53d15:	48                   	dec    %eax
  a53d16:	8b 48 18             	mov    0x18(%eax),%ecx
  a53d19:	0f 85 91 00 00 00    	jne    a53db0 <efi_retrieve_tpm2_eventlog+0x250>
  a53d1f:	8b 79 30             	mov    0x30(%ecx),%edi
  a53d22:	31 c0                	xor    %eax,%eax
  a53d24:	ff d2                	call   *%edx
  a53d26:	48                   	dec    %eax
  a53d27:	83 c4 58             	add    $0x58,%esp
  a53d2a:	5d                   	pop    %ebp
  a53d2b:	41                   	inc    %ecx
  a53d2c:	5c                   	pop    %esp
  a53d2d:	41                   	inc    %ecx
  a53d2e:	5d                   	pop    %ebp
  a53d2f:	41                   	inc    %ecx
  a53d30:	5e                   	pop    %esi
  a53d31:	c3                   	ret    
  a53d32:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a53d38:	8b b8 ac 00 00 00    	mov    0xac(%eax),%edi
  a53d3e:	e9 ad fe ff ff       	jmp    a53bf0 <efi_retrieve_tpm2_eventlog+0x90>
  a53d43:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
  a53d48:	48                   	dec    %eax
  a53d49:	8b 7e 08             	mov    0x8(%esi),%edi
  a53d4c:	e9 d4 fe ff ff       	jmp    a53c25 <efi_retrieve_tpm2_eventlog+0xc5>
  a53d51:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a53d58:	48                   	dec    %eax
  a53d59:	8b 7a 40             	mov    0x40(%edx),%edi
  a53d5c:	e9 22 ff ff ff       	jmp    a53c83 <efi_retrieve_tpm2_eventlog+0x123>
  a53d61:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a53d68:	4c                   	dec    %esp
  a53d69:	89 e2                	mov    %esp,%edx
  a53d6b:	41                   	inc    %ecx
  a53d6c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  a53d70:	4c                   	dec    %esp
  a53d71:	29 ea                	sub    %ebp,%edx
  a53d73:	4c                   	dec    %esp
  a53d74:	8d 64 02 20          	lea    0x20(%edx,%eax,1),%esp
  a53d78:	4d                   	dec    %ebp
  a53d79:	8d 74 24 08          	lea    0x8(%esp),%esi
  a53d7d:	e9 e7 fe ff ff       	jmp    a53c69 <efi_retrieve_tpm2_eventlog+0x109>
  a53d82:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
  a53d88:	48                   	dec    %eax
  a53d89:	8d 35 51 0e 00 00    	lea    0xe51,%esi
  a53d8f:	48                   	dec    %eax
  a53d90:	89 ef                	mov    %ebp,%edi
  a53d92:	e8 09 dc ff ff       	call   a519a0 <efi_printk>
  a53d97:	eb 8d                	jmp    a53d26 <efi_retrieve_tpm2_eventlog+0x1c6>
  a53d99:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
  a53da0:	8b 78 6c             	mov    0x6c(%eax),%edi
  a53da3:	e9 4d ff ff ff       	jmp    a53cf5 <efi_retrieve_tpm2_eventlog+0x195>
  a53da8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
  a53daf:	00 
  a53db0:	48                   	dec    %eax
  a53db1:	8b 79 48             	mov    0x48(%ecx),%edi
  a53db4:	e9 69 ff ff ff       	jmp    a53d22 <efi_retrieve_tpm2_eventlog+0x1c2>
  a53db9:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)

0000000000a53dc0 <efi64_thunk>:
  a53dc0:	55                   	push   %ebp
  a53dc1:	53                   	push   %ebx
  a53dc2:	48                   	dec    %eax
  a53dc3:	83 ec 08             	sub    $0x8,%esp
  a53dc6:	48                   	dec    %eax
  a53dc7:	8d 05 a3 00 00 00    	lea    0xa3,%eax
  a53dcd:	89 44 24 04          	mov    %eax,0x4(%esp)
  a53dd1:	48                   	dec    %eax
  a53dd2:	8d 05 8c 21 00 00    	lea    0x218c,%eax
  a53dd8:	89 04 24             	mov    %eax,(%esp)
  a53ddb:	89 40 02             	mov    %eax,0x2(%eax)
  a53dde:	8c d8                	mov    %ds,%eax
  a53de0:	50                   	push   %eax
  a53de1:	8c c0                	mov    %es,%eax
  a53de3:	50                   	push   %eax
  a53de4:	8c d0                	mov    %ss,%eax
  a53de6:	50                   	push   %eax
  a53de7:	48                   	dec    %eax
  a53de8:	83 ec 20             	sub    $0x20,%esp
  a53deb:	89 34 24             	mov    %esi,(%esp)
  a53dee:	89 54 24 04          	mov    %edx,0x4(%esp)
  a53df2:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  a53df6:	4c                   	dec    %esp
  a53df7:	89 c6                	mov    %eax,%esi
  a53df9:	89 74 24 0c          	mov    %esi,0xc(%esp)
  a53dfd:	4c                   	dec    %esp
  a53dfe:	89 ce                	mov    %ecx,%esi
  a53e00:	89 74 24 10          	mov    %esi,0x10(%esp)
  a53e04:	0f 01 05 47 21 00 00 	sgdtl  0x2147
  a53e0b:	48                   	dec    %eax
  a53e0c:	8d 1d 1d 00 00 00    	lea    0x1d,%ebx
  a53e12:	48                   	dec    %eax
  a53e13:	89 1d 43 21 00 00    	mov    %ebx,0x2143
  a53e19:	48                   	dec    %eax
  a53e1a:	8d 05 28 21 00 00    	lea    0x2128,%eax
  a53e20:	0f 01 10             	lgdtl  (%eax)
  a53e23:	6a 10                	push   $0x10
  a53e25:	48                   	dec    %eax
  a53e26:	8d 05 54 00 00 00    	lea    0x54,%eax
  a53e2c:	50                   	push   %eax
  a53e2d:	48                   	dec    %eax
  a53e2e:	cb                   	lret   
  a53e2f:	48                   	dec    %eax
  a53e30:	83 c4 20             	add    $0x20,%esp
  a53e33:	0f 01 15 18 21 00 00 	lgdtl  0x2118
  a53e3a:	5b                   	pop    %ebx
  a53e3b:	8e d3                	mov    %ebx,%ss
  a53e3d:	5b                   	pop    %ebx
  a53e3e:	8e c3                	mov    %ebx,%es
  a53e40:	5b                   	pop    %ebx
  a53e41:	8e db                	mov    %ebx,%ds
  a53e43:	48                   	dec    %eax
  a53e44:	85 c0                	test   %eax,%eax
  a53e46:	74 14                	je     a53e5c <efi64_thunk+0x9c>
  a53e48:	89 c1                	mov    %eax,%ecx
  a53e4a:	81 e1 ff ff ff 0f    	and    $0xfffffff,%ecx
  a53e50:	25 00 00 00 f0       	and    $0xf0000000,%eax
  a53e55:	48                   	dec    %eax
  a53e56:	c1 e0 20             	shl    $0x20,%eax
  a53e59:	48                   	dec    %eax
  a53e5a:	09 c8                	or     %ecx,%eax
  a53e5c:	48                   	dec    %eax
  a53e5d:	83 c4 08             	add    $0x8,%esp
  a53e60:	5b                   	pop    %ebx
  a53e61:	5d                   	pop    %ebp
  a53e62:	c3                   	ret    
  a53e63:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%eax,%eax,1)
  a53e6a:	00 00 00 00 
  a53e6e:	66 90                	xchg   %ax,%ax

0000000000a53e70 <efi_exit32>:
  a53e70:	48                   	dec    %eax
  a53e71:	8b 05 e5 20 00 00    	mov    0x20e5,%eax
  a53e77:	50                   	push   %eax
  a53e78:	48                   	dec    %eax
  a53e79:	89 f8                	mov    %edi,%eax
  a53e7b:	c3                   	ret    
  a53e7c:	0f 1f 40 00          	nopl   0x0(%eax)

0000000000a53e80 <efi_enter32>:
  a53e80:	b8 18 00 00 00       	mov    $0x18,%eax
  a53e85:	8e d8                	mov    %eax,%ds
  a53e87:	8e c0                	mov    %eax,%es
  a53e89:	8e d0                	mov    %eax,%ss
  a53e8b:	0f 20 d8             	mov    %cr3,%eax
  a53e8e:	0f 22 d8             	mov    %eax,%cr3
  a53e91:	0f 20 c0             	mov    %cr0,%eax
  a53e94:	0f ba f0 1f          	btr    $0x1f,%eax
  a53e98:	0f 22 c0             	mov    %eax,%cr0
  a53e9b:	b9 80 00 00 c0       	mov    $0xc0000080,%ecx
  a53ea0:	0f 32                	rdmsr  
  a53ea2:	0f ba f0 08          	btr    $0x8,%eax
  a53ea6:	0f 30                	wrmsr  
  a53ea8:	ff d7                	call   *%edi
  a53eaa:	89 c7                	mov    %eax,%edi
  a53eac:	fa                   	cli    
  a53ead:	8b 44 24 38          	mov    0x38(%esp),%eax
  a53eb1:	89 40 02             	mov    %eax,0x2(%eax)
  a53eb4:	0f 01 10             	lgdtl  (%eax)
  a53eb7:	0f 20 e0             	mov    %cr4,%eax
  a53eba:	0f ba e8 05          	bts    $0x5,%eax
  a53ebe:	0f 22 e0             	mov    %eax,%cr4
  a53ec1:	0f 20 d8             	mov    %cr3,%eax
  a53ec4:	0f 22 d8             	mov    %eax,%cr3
  a53ec7:	b9 80 00 00 c0       	mov    $0xc0000080,%ecx
  a53ecc:	0f 32                	rdmsr  
  a53ece:	0f ba e8 08          	bts    $0x8,%eax
  a53ed2:	0f 30                	wrmsr  
  a53ed4:	31 c0                	xor    %eax,%eax
  a53ed6:	0f 00 d0             	lldt   %ax
  a53ed9:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  a53edd:	6a 10                	push   $0x10
  a53edf:	50                   	push   %eax
  a53ee0:	0f 20 c0             	mov    %cr0,%eax
  a53ee3:	0f ba e8 1f          	bts    $0x1f,%eax
  a53ee7:	0f 22 c0             	mov    %eax,%cr0
  a53eea:	cb                   	lret   

0000000000a53eeb <fortify_panic>:
  a53eeb:	f3 0f 1e fa          	endbr64 
  a53eef:	50                   	push   %eax
  a53ef0:	58                   	pop    %eax
  a53ef1:	48                   	dec    %eax
  a53ef2:	8d 3d 9a 06 00 00    	lea    0x69a,%edi
  a53ef8:	50                   	push   %eax
  a53ef9:	e8 52 a2 ff ff       	call   a4e150 <error>
