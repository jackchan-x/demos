
setup.elf:     file format elf32-i386


Disassembly of section .bstext:

00000000 <bootsect_start>:
   0:	4d                   	dec    %bp
   1:	5a                   	pop    %dx
	.byte 0x4d
	.byte 0x5a
#endif

	# Normalize the start address
	ljmp	$BOOTSEG, $start2
   2:	ea 07 00 c0 07       	ljmp   $0x7c0,$0x7

00000007 <start2>:

start2:
	movw	%cs, %ax
   7:	8c c8                	mov    %cs,%ax
	movw	%ax, %ds
   9:	8e d8                	mov    %ax,%ds
	movw	%ax, %es
   b:	8e c0                	mov    %ax,%es
	movw	%ax, %ss
   d:	8e d0                	mov    %ax,%ss
	xorw	%sp, %sp
   f:	31 e4                	xor    %sp,%sp
	sti
  11:	fb                   	sti    
	cld
  12:	fc                   	cld    

	movw	$bugger_off_msg, %si
  13:	be 40 00             	mov    $0x40,%si

00000016 <msg_loop>:

msg_loop:
	lodsb
  16:	ac                   	lods   %ds:(%si),%al
	andb	%al, %al
  17:	20 c0                	and    %al,%al
	jz	bs_die
  19:	74 09                	je     24 <bs_die>
	movb	$0xe, %ah
  1b:	b4 0e                	mov    $0xe,%ah
	movw	$7, %bx
  1d:	bb 07 00             	mov    $0x7,%bx
	int	$0x10
  20:	cd 10                	int    $0x10
	jmp	msg_loop
  22:	eb f2                	jmp    16 <msg_loop>

00000024 <bs_die>:

bs_die:
	# Allow the user to press a key, then reboot
	xorw	%ax, %ax
  24:	31 c0                	xor    %ax,%ax
	int	$0x16
  26:	cd 16                	int    $0x16
	int	$0x19
  28:	cd 19                	int    $0x19

	# int 0x19 should never return.  In case it does anyway,
	# invoke the BIOS reset code...
	ljmp	$0xf000,$0xfff0
  2a:	ea f0 ff 00 f0       	ljmp   $0xf000,$0xfff0
	...
  3b:	00 82 00 00          	add    %al,0x0(%bp,%si)
	...

Disassembly of section .entrytext:

00000268 <start_of_setup>:
# End of setup header #####################################################

	.section ".entrytext", "ax"
start_of_setup:
# Force %es = %ds
	movw	%ds, %ax
 268:	8c d8                	mov    %ds,%ax
	movw	%ax, %es
 26a:	8e c0                	mov    %ax,%es
	cld
 26c:	fc                   	cld    
# Apparently some ancient versions of LILO invoked the kernel with %ss != %ds,
# which happened to work by accident for the old code.  Recalculate the stack
# pointer if %ss is invalid.  Otherwise leave it alone, LOADLIN sets up the
# stack behind its own code, so we can't blindly put it directly past the heap.

	movw	%ss, %dx
 26d:	8c d2                	mov    %ss,%dx
	cmpw	%ax, %dx	# %ds == %ss?
 26f:	39 c2                	cmp    %ax,%dx
	movw	%sp, %dx
 271:	89 e2                	mov    %sp,%dx
	je	2f		# -> assume %sp is reasonably set
 273:	74 16                	je     28b <start_of_setup+0x23>

	# Invalid %ss, make up a new stack
	movw	$_end, %dx
 275:	ba c0 57             	mov    $0x57c0,%dx
	testb	$CAN_USE_HEAP, loadflags
 278:	f6 06 11 02 80       	testb  $0x80,0x211
	jz	1f
 27d:	74 04                	je     283 <start_of_setup+0x1b>
	movw	heap_end_ptr, %dx
 27f:	8b 16 24 02          	mov    0x224,%dx
1:	addw	$STACK_SIZE, %dx
 283:	81 c2 00 04          	add    $0x400,%dx
	jnc	2f
 287:	73 02                	jae    28b <start_of_setup+0x23>
	xorw	%dx, %dx	# Prevent wraparound
 289:	31 d2                	xor    %dx,%dx

2:	# Now %dx should point to the end of our stack space
	andw	$~3, %dx	# dword align (might as well...)
 28b:	83 e2 fc             	and    $0xfffc,%dx
	jnz	3f
 28e:	75 03                	jne    293 <start_of_setup+0x2b>
	movw	$0xfffc, %dx	# Make sure we're not zero
 290:	ba fc ff             	mov    $0xfffc,%dx
3:	movw	%ax, %ss
 293:	8e d0                	mov    %ax,%ss
	movzwl	%dx, %esp	# Clear upper half of %esp
 295:	66 0f b7 e2          	movzwl %dx,%esp
	sti			# Now we should have a working stack
 299:	fb                   	sti    

# We will have entered with %cs = %ds+0x20, normalize %cs so
# it is on par with the other segments.
	pushw	%ds
 29a:	1e                   	push   %ds
	pushw	$6f
 29b:	68 9f 02             	push   $0x29f
	lretw
 29e:	cb                   	lret   
6:

# Check signature at end of setup
	cmpl	$0x5a5aaa55, setup_sig
 29f:	66 81 3e 78 44 55 aa 	cmpl   $0x5a5aaa55,0x4478
 2a6:	5a 5a 
	jne	setup_bad
 2a8:	75 17                	jne    2c1 <setup_bad>

# Zero the bss
	movw	$__bss_start, %di
 2aa:	bf 80 44             	mov    $0x4480,%di
	movw	$_end+3, %cx
 2ad:	b9 c3 57             	mov    $0x57c3,%cx
	xorl	%eax, %eax
 2b0:	66 31 c0             	xor    %eax,%eax
	subw	%di, %cx
 2b3:	29 f9                	sub    %di,%cx
	shrw	$2, %cx
 2b5:	c1 e9 02             	shr    $0x2,%cx
	rep; stosl
 2b8:	f3 66 ab             	rep stos %eax,%es:(%di)

# Jump to C code (should not return)
	calll	main
 2bb:	66 e8 0b 30 00 00    	calll  32cc <main>

000002c1 <setup_bad>:

# Setup corrupt somehow...
setup_bad:
	movl	$setup_corrupt, %eax
 2c1:	66 b8 dd 03 00 00    	mov    $0x3dd,%eax
	calll	puts
 2c7:	66 e8 f0 00 00 00    	calll  3bd <puts>

000002cd <die>:
	# Fall through...

	.globl	die
	.type	die, @function
die:
	hlt
 2cd:	f4                   	hlt    
	jmp	die
 2ce:	eb fd                	jmp    2cd <die>

Disassembly of section .inittext:

000002d0 <intcall>:
	.section ".inittext","ax"
	.globl	intcall
	.type	intcall, @function
intcall:
	/* Self-modify the INT instruction.  Ugly, but works. */
	cmpb	%al, 3f
 2d0:	38 06 fb 02          	cmp    %al,0x2fb
	je	1f
 2d4:	74 05                	je     2db <intcall+0xb>
	movb	%al, 3f
 2d6:	a2 fb 02             	mov    %al,0x2fb
	jmp	1f		/* Synchronize pipeline */
 2d9:	eb 00                	jmp    2db <intcall+0xb>
1:
	/* Save state */
	pushfl
 2db:	66 9c                	pushfl 
	pushw	%fs
 2dd:	0f a0                	push   %fs
	pushw	%gs
 2df:	0f a8                	push   %gs
	pushal
 2e1:	66 60                	pushal 

	/* Copy input state to stack frame */
	subw	$44, %sp
 2e3:	83 ec 2c             	sub    $0x2c,%sp
	movw	%dx, %si
 2e6:	89 d6                	mov    %dx,%si
	movw	%sp, %di
 2e8:	89 e7                	mov    %sp,%di
	movw	$11, %cx
 2ea:	b9 0b 00             	mov    $0xb,%cx
	rep; movsd
 2ed:	f3 66 a5             	rep movsl %ds:(%si),%es:(%di)

	/* Pop full state from the stack */
	popal
 2f0:	66 61                	popal  
	popw	%gs
 2f2:	0f a9                	pop    %gs
	popw	%fs
 2f4:	0f a1                	pop    %fs
	popw	%es
 2f6:	07                   	pop    %es
	popw	%ds
 2f7:	1f                   	pop    %ds
	popfl
 2f8:	66 9d                	popfl  
 2fa:	cd 00                	int    $0x0
	/* Actual INT */
	.byte	0xcd		/* INT opcode */
3:	.byte	0

	/* Push full state to the stack */
	pushfl
 2fc:	66 9c                	pushfl 
	pushw	%ds
 2fe:	1e                   	push   %ds
	pushw	%es
 2ff:	06                   	push   %es
	pushw	%fs
 300:	0f a0                	push   %fs
	pushw	%gs
 302:	0f a8                	push   %gs
	pushal
 304:	66 60                	pushal 

	/* Re-establish C environment invariants */
	cld
 306:	fc                   	cld    
	movzwl	%sp, %esp
 307:	66 0f b7 e4          	movzwl %sp,%esp
	movw	%cs, %ax
 30b:	8c c8                	mov    %cs,%ax
	movw	%ax, %ds
 30d:	8e d8                	mov    %ax,%ds
	movw	%ax, %es
 30f:	8e c0                	mov    %ax,%es

	/* Copy output state from stack frame */
	movw	68(%esp), %di	/* Original %cx == 3rd argument */
 311:	67 8b 7c 24 44       	mov    0x44(%esp),%di
	andw	%di, %di
 316:	21 ff                	and    %di,%di
	jz	4f
 318:	74 08                	je     322 <intcall+0x52>
	movw	%sp, %si
 31a:	89 e6                	mov    %sp,%si
	movw	$11, %cx
 31c:	b9 0b 00             	mov    $0xb,%cx
	rep; movsd
 31f:	f3 66 a5             	rep movsl %ds:(%si),%es:(%di)
4:	addw	$44, %sp
 322:	83 c4 2c             	add    $0x2c,%sp

	/* Restore state and return */
	popal
 325:	66 61                	popal  
	popw	%gs
 327:	0f a9                	pop    %gs
	popw	%fs
 329:	0f a1                	pop    %fs
	popfl
 32b:	66 9d                	popfl  
	retl
 32d:	66 c3                	retl   

0000032f <putchar>:
	ireg.al = ch;
	intcall(0x10, &ireg, NULL);
}

void __attribute__((section(".inittext"))) putchar(int ch)
{
 32f:	f3 0f 1e fb          	endbr32 
 333:	66 56                	push   %esi
 335:	66 53                	push   %ebx
 337:	66 83 ec 2c          	sub    $0x2c,%esp
 33b:	66 89 c3             	mov    %eax,%ebx
	if (ch == '\n')
 33e:	66 83 f8 0a          	cmp    $0xa,%eax
 342:	75 0c                	jne    350 <putchar+0x21>
		putchar('\r');	/* \n -> \r\n */
 344:	66 b8 0d 00 00 00    	mov    $0xd,%eax
 34a:	66 e8 df ff ff ff    	calll  32f <putchar>
	initregs(&ireg);
 350:	66 89 e0             	mov    %esp,%eax
 353:	66 e8 5d 19 00 00    	calll  1cb6 <initregs>
	ireg.bx = 0x0007;
 359:	67 c7 44 24 10 07 00 	movw   $0x7,0x10(%esp)
	ireg.cx = 0x0001;
 360:	67 c7 44 24 18 01 00 	movw   $0x1,0x18(%esp)
	ireg.ah = 0x0e;
 367:	67 c6 44 24 1d 0e    	movb   $0xe,0x1d(%esp)
	ireg.al = ch;
 36d:	67 88 5c 24 1c       	mov    %bl,0x1c(%esp)
	intcall(0x10, &ireg, NULL);
 372:	66 31 c9             	xor    %ecx,%ecx
 375:	66 89 e2             	mov    %esp,%edx
 378:	66 b8 10 00 00 00    	mov    $0x10,%eax
 37e:	66 e8 4c ff ff ff    	calll  2d0 <intcall>

	bios_putchar(ch);

	if (early_serial_base != 0)
 384:	66 83 3e 8c 55 00    	cmpl   $0x0,0x558c
 38a:	74 27                	je     3b3 <putchar+0x84>
 38c:	66 b9 ff ff 00 00    	mov    $0xffff,%ecx
	while ((inb(early_serial_base + LSR) & XMTRDY) == 0 && --timeout)
 392:	66 8b 16 8c 55       	mov    0x558c,%edx
 397:	66 89 d6             	mov    %edx,%esi
 39a:	66 83 c2 05          	add    $0x5,%edx
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
}
static inline u8 inb(u16 port)
{
	u8 v;
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
 39e:	ec                   	in     (%dx),%al
 39f:	a8 20                	test   $0x20,%al
 3a1:	74 08                	je     3ab <putchar+0x7c>
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
 3a3:	88 d8                	mov    %bl,%al
 3a5:	66 89 f2             	mov    %esi,%edx
 3a8:	ee                   	out    %al,(%dx)
}
 3a9:	eb 08                	jmp    3b3 <putchar+0x84>
	while ((inb(early_serial_base + LSR) & XMTRDY) == 0 && --timeout)
 3ab:	66 49                	dec    %ecx
 3ad:	74 f4                	je     3a3 <putchar+0x74>
		cpu_relax();
 3af:	f3 90                	pause  
 3b1:	eb df                	jmp    392 <putchar+0x63>
		serial_putchar(ch);
}
 3b3:	66 83 c4 2c          	add    $0x2c,%esp
 3b7:	66 5b                	pop    %ebx
 3b9:	66 5e                	pop    %esi
 3bb:	66 c3                	retl   

000003bd <puts>:

void __attribute__((section(".inittext"))) puts(const char *str)
{
 3bd:	f3 0f 1e fb          	endbr32 
 3c1:	66 53                	push   %ebx
 3c3:	66 89 c3             	mov    %eax,%ebx
	while (*str)
 3c6:	67 66 0f be 03       	movsbl (%ebx),%eax
 3cb:	84 c0                	test   %al,%al
 3cd:	74 0a                	je     3d9 <puts+0x1c>
		putchar(*str++);
 3cf:	66 43                	inc    %ebx
 3d1:	66 e8 58 ff ff ff    	calll  32f <putchar>
 3d7:	eb ed                	jmp    3c6 <puts+0x9>
}
 3d9:	66 5b                	pop    %ebx
 3db:	66 c3                	retl   

Disassembly of section .text:

000003fb <empty_8042>:
{
	u8 status;
	int loops = MAX_8042_LOOPS;
	int ffs   = MAX_8042_FF;

	while (loops--) {
     3fb:	66 ba a1 86 01 00    	mov    $0x186a1,%edx
	int ffs   = MAX_8042_FF;
     401:	66 b9 20 00 00 00    	mov    $0x20,%ecx
	while (loops--) {
     407:	66 4a                	dec    %edx
     409:	74 21                	je     42c <empty_8042+0x31>
}

static inline void io_delay(void)
{
	const u16 DELAY_PORT = 0x80;
	asm volatile("outb %%al,%0" : : "dN" (DELAY_PORT));
     40b:	e6 80                	out    %al,$0x80
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
     40d:	e4 64                	in     $0x64,%al
		io_delay();

		status = inb(0x64);
		if (status == 0xff) {
     40f:	3c ff                	cmp    $0xff,%al
     411:	75 06                	jne    419 <empty_8042+0x1e>
			/* FF is a plausible, but very unlikely status */
			if (!--ffs)
     413:	66 49                	dec    %ecx
     415:	75 06                	jne    41d <empty_8042+0x22>
     417:	eb 13                	jmp    42c <empty_8042+0x31>
				return -1; /* Assume no KBC present */
		}
		if (status & 1) {
     419:	a8 01                	test   $0x1,%al
     41b:	74 06                	je     423 <empty_8042+0x28>
	asm volatile("outb %%al,%0" : : "dN" (DELAY_PORT));
     41d:	e6 80                	out    %al,$0x80
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
     41f:	e4 60                	in     $0x60,%al
	return v;
     421:	eb e4                	jmp    407 <empty_8042+0xc>
			/* Read and discard input data */
			io_delay();
			(void)inb(0x60);
		} else if (!(status & 2)) {
     423:	a8 02                	test   $0x2,%al
     425:	75 e0                	jne    407 <empty_8042+0xc>
			/* Buffers empty, finished! */
			return 0;
     427:	66 31 c0             	xor    %eax,%eax
		}
	}

	return -1;
}
     42a:	66 c3                	retl   
				return -1; /* Assume no KBC present */
     42c:	66 83 c8 ff          	or     $0xffffffff,%eax
     430:	66 c3                	retl   

00000432 <a20_test>:
#define A20_TEST_ADDR	(4*0x80)
#define A20_TEST_SHORT  32
#define A20_TEST_LONG	2097152	/* 2^21 */

static int a20_test(int loops)
{
     432:	66 53                	push   %ebx
     434:	66 89 c1             	mov    %eax,%ecx
	return seg;
}

static inline void set_fs(u16 seg)
{
	asm volatile("movw %0,%%fs" : : "rm" (seg));
     437:	66 31 c0             	xor    %eax,%eax
     43a:	8e e0                	mov    %ax,%fs
	return seg;
}

static inline void set_gs(u16 seg)
{
	asm volatile("movw %0,%%gs" : : "rm" (seg));
     43c:	66 83 c8 ff          	or     $0xffffffff,%eax
     440:	8e e8                	mov    %ax,%gs
	return v;
}
static inline u32 rdfs32(addr_t addr)
{
	u32 v;
	asm volatile("movl %%fs:%1,%0" : "=r" (v) : "m" (*(u32 *)addr));
     442:	64 66 8b 1e 00 02    	mov    %fs:0x200,%ebx
	int saved, ctr;

	set_fs(0x0000);
	set_gs(0xffff);

	saved = ctr = rdfs32(A20_TEST_ADDR);
     448:	66 89 d8             	mov    %ebx,%eax

	while (loops--) {
     44b:	66 01 d9             	add    %ebx,%ecx
     44e:	66 39 c8             	cmp    %ecx,%eax
     451:	74 16                	je     469 <a20_test+0x37>
		wrfs32(++ctr, A20_TEST_ADDR);
     453:	66 40                	inc    %eax
{
	asm volatile("movw %1,%%fs:%0" : "+m" (*(u16 *)addr) : "ri" (v));
}
static inline void wrfs32(u32 v, addr_t addr)
{
	asm volatile("movl %1,%%fs:%0" : "+m" (*(u32 *)addr) : "ri" (v));
     455:	64 66 a3 00 02       	mov    %eax,%fs:0x200
	asm volatile("outb %%al,%0" : : "dN" (DELAY_PORT));
     45a:	e6 80                	out    %al,$0x80
	return v;
}
static inline u32 rdgs32(addr_t addr)
{
	u32 v;
	asm volatile("movl %%gs:%1,%0" : "=r" (v) : "m" (*(u32 *)addr));
     45c:	65 66 8b 16 10 02    	mov    %gs:0x210,%edx
		io_delay();	/* Serialize and make delay constant */
		ok = rdgs32(A20_TEST_ADDR+0x10) ^ ctr;
		if (ok)
     462:	66 31 c2             	xor    %eax,%edx
     465:	74 e7                	je     44e <a20_test+0x1c>
     467:	eb 03                	jmp    46c <a20_test+0x3a>
     469:	66 31 d2             	xor    %edx,%edx
	asm volatile("movl %1,%%fs:%0" : "+m" (*(u32 *)addr) : "ri" (v));
     46c:	64 66 89 1e 00 02    	mov    %ebx,%fs:0x200
			break;
	}

	wrfs32(saved, A20_TEST_ADDR);
	return ok;
}
     472:	66 89 d0             	mov    %edx,%eax
     475:	66 5b                	pop    %ebx
     477:	66 c3                	retl   

00000479 <enable_a20>:
 */

#define A20_ENABLE_LOOPS 255	/* Number of times to try */

int enable_a20(void)
{
     479:	f3 0f 1e fb          	endbr32 
     47d:	66 56                	push   %esi
     47f:	66 53                	push   %ebx
     481:	66 83 ec 2c          	sub    $0x2c,%esp
       int loops = A20_ENABLE_LOOPS;
       int kbc_err;

       while (loops--) {
     485:	66 bb 00 01 00 00    	mov    $0x100,%ebx
     48b:	66 4b                	dec    %ebx
     48d:	0f 84 c2 00          	je     553 <enable_a20+0xda>
	return a20_test(A20_TEST_SHORT);
     491:	66 b8 20 00 00 00    	mov    $0x20,%eax
     497:	66 e8 95 ff ff ff    	calll  432 <a20_test>
	       /* First, check to see if A20 is already enabled
		  (legacy free, etc.) */
	       if (a20_test_short())
     49d:	66 85 c0             	test   %eax,%eax
     4a0:	74 06                	je     4a8 <enable_a20+0x2f>
		       return 0;
     4a2:	66 31 c0             	xor    %eax,%eax
     4a5:	e9 af 00             	jmp    557 <enable_a20+0xde>
	initregs(&ireg);
     4a8:	66 89 e0             	mov    %esp,%eax
     4ab:	66 e8 05 18 00 00    	calll  1cb6 <initregs>
	ireg.ax = 0x2401;
     4b1:	67 c7 44 24 1c 01 24 	movw   $0x2401,0x1c(%esp)
	intcall(0x15, &ireg, NULL);
     4b8:	66 31 c9             	xor    %ecx,%ecx
     4bb:	66 89 e2             	mov    %esp,%edx
     4be:	66 b8 15 00 00 00    	mov    $0x15,%eax
     4c4:	66 e8 06 fe ff ff    	calll  2d0 <intcall>
	return a20_test(A20_TEST_SHORT);
     4ca:	66 b8 20 00 00 00    	mov    $0x20,%eax
     4d0:	66 e8 5c ff ff ff    	calll  432 <a20_test>
	       
	       /* Next, try the BIOS (INT 0x15, AX=0x2401) */
	       enable_a20_bios();
	       if (a20_test_short())
     4d6:	66 85 c0             	test   %eax,%eax
     4d9:	75 c7                	jne    4a2 <enable_a20+0x29>
		       return 0;
	       
	       /* Try enabling A20 through the keyboard controller */
	       kbc_err = empty_8042();
     4db:	66 e8 1a ff ff ff    	calll  3fb <empty_8042>
     4e1:	66 89 c6             	mov    %eax,%esi
	return a20_test(A20_TEST_SHORT);
     4e4:	66 b8 20 00 00 00    	mov    $0x20,%eax
     4ea:	66 e8 42 ff ff ff    	calll  432 <a20_test>

	       if (a20_test_short())
     4f0:	66 85 c0             	test   %eax,%eax
     4f3:	75 ad                	jne    4a2 <enable_a20+0x29>
		       return 0; /* BIOS worked, but with delayed reaction */
	
	       if (!kbc_err) {
     4f5:	66 85 f6             	test   %esi,%esi
     4f8:	74 21                	je     51b <enable_a20+0xa2>
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
     4fa:	e4 92                	in     $0x92,%al
	port_a &= ~0x01;	/* Do not reset machine */
     4fc:	66 83 e0 fe          	and    $0xfffffffe,%eax
     500:	66 83 c8 02          	or     $0x2,%eax
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
     504:	e6 92                	out    %al,$0x92
	return a20_test(A20_TEST_LONG);
     506:	66 b8 00 00 20 00    	mov    $0x200000,%eax
     50c:	66 e8 20 ff ff ff    	calll  432 <a20_test>
			       return 0;
	       }
	       
	       /* Finally, try enabling the "fast A20 gate" */
	       enable_a20_fast();
	       if (a20_test_long())
     512:	66 85 c0             	test   %eax,%eax
     515:	0f 84 72 ff          	je     48b <enable_a20+0x12>
     519:	eb 87                	jmp    4a2 <enable_a20+0x29>
	empty_8042();
     51b:	66 e8 da fe ff ff    	calll  3fb <empty_8042>
     521:	b0 d1                	mov    $0xd1,%al
     523:	e6 64                	out    %al,$0x64
	empty_8042();
     525:	66 e8 d0 fe ff ff    	calll  3fb <empty_8042>
     52b:	b0 df                	mov    $0xdf,%al
     52d:	e6 60                	out    %al,$0x60
	empty_8042();
     52f:	66 e8 c6 fe ff ff    	calll  3fb <empty_8042>
     535:	b0 ff                	mov    $0xff,%al
     537:	e6 64                	out    %al,$0x64
	empty_8042();
     539:	66 e8 bc fe ff ff    	calll  3fb <empty_8042>
	return a20_test(A20_TEST_LONG);
     53f:	66 b8 00 00 20 00    	mov    $0x200000,%eax
     545:	66 e8 e7 fe ff ff    	calll  432 <a20_test>
		       if (a20_test_long())
     54b:	66 85 c0             	test   %eax,%eax
     54e:	74 aa                	je     4fa <enable_a20+0x81>
     550:	e9 4f ff             	jmp    4a2 <enable_a20+0x29>
		       return 0;
       }
       
       return -1;
     553:	66 83 c8 ff          	or     $0xffffffff,%eax
}
     557:	66 83 c4 2c          	add    $0x2c,%esp
     55b:	66 5b                	pop    %ebx
     55d:	66 5e                	pop    %esi
     55f:	66 c3                	retl   

00000561 <__cmdline_find_option>:
 *
 * Returns the length of the argument (regardless of if it was
 * truncated to fit in the buffer), or -1 on not found.
 */
int __cmdline_find_option(unsigned long cmdline_ptr, const char *option, char *buffer, int bufsize)
{
     561:	f3 0f 1e fb          	endbr32 
     565:	66 55                	push   %ebp
     567:	66 57                	push   %edi
     569:	66 56                	push   %esi
     56b:	66 53                	push   %ebx
     56d:	66 83 ec 08          	sub    $0x8,%esp
     571:	67 66 89 14 24       	mov    %edx,(%esp)
		st_wordcmp,	/* Comparing this word */
		st_wordskip,	/* Miscompare, skip */
		st_bufcpy	/* Copying this to buffer */
	} state = st_wordstart;

	if (!cmdline_ptr)
     576:	66 85 c0             	test   %eax,%eax
     579:	0f 84 d5 00          	je     652 <__cmdline_find_option+0xf1>
     57d:	66 89 cd             	mov    %ecx,%ebp
		return -1;      /* No command line */

	cptr = cmdline_ptr & 0xf;
     580:	66 89 c7             	mov    %eax,%edi
     583:	66 83 e7 0f          	and    $0xf,%edi
	set_fs(cmdline_ptr >> 4);
     587:	66 c1 e8 04          	shr    $0x4,%eax
	asm volatile("movw %0,%%fs" : : "rm" (seg));
     58b:	8e e0                	mov    %ax,%fs
	char *bufptr = buffer;
     58d:	66 89 cb             	mov    %ecx,%ebx
	} state = st_wordstart;
     590:	66 31 c0             	xor    %eax,%eax
	const char *opptr = NULL;
     593:	66 31 f6             	xor    %esi,%esi
	int len = -1;
     596:	66 83 c9 ff          	or     $0xffffffff,%ecx

		case st_bufcpy:
			if (myisspace(c)) {
				state = st_wordstart;
			} else {
				if (len < bufsize-1)
     59a:	67 66 8b 54 24 1c    	mov    0x1c(%esp),%edx
     5a0:	66 4a                	dec    %edx
     5a2:	67 66 89 54 24 04    	mov    %edx,0x4(%esp)
	asm volatile("movb %%fs:%1,%0" : "=q" (v) : "m" (*(u8 *)addr));
     5a8:	64 67 8a 17          	mov    %fs:(%edi),%dl
	while (cptr < 0x10000 && (c = rdfs8(cptr++))) {
     5ac:	84 d2                	test   %dl,%dl
     5ae:	0f 84 91 00          	je     643 <__cmdline_find_option+0xe2>
		switch (state) {
     5b2:	66 83 f8 02          	cmp    $0x2,%eax
     5b6:	74 50                	je     608 <__cmdline_find_option+0xa7>
     5b8:	66 83 f8 03          	cmp    $0x3,%eax
     5bc:	74 51                	je     60f <__cmdline_find_option+0xae>
     5be:	66 48                	dec    %eax
     5c0:	74 0a                	je     5cc <__cmdline_find_option+0x6b>
					*bufptr++ = c;
				len++;
			}
			break;
		}
	}
     5c2:	66 31 c0             	xor    %eax,%eax
			if (myisspace(c))
     5c5:	80 fa 20             	cmp    $0x20,%dl
     5c8:	76 6c                	jbe    636 <__cmdline_find_option+0xd5>
     5ca:	eb 07                	jmp    5d3 <__cmdline_find_option+0x72>
			if (c == '=' && !*opptr) {
     5cc:	80 fa 3d             	cmp    $0x3d,%dl
     5cf:	75 19                	jne    5ea <__cmdline_find_option+0x89>
     5d1:	eb 0f                	jmp    5e2 <__cmdline_find_option+0x81>
			opptr = option;
     5d3:	67 66 8b 04 24       	mov    (%esp),%eax
			if (c == '=' && !*opptr) {
     5d8:	80 fa 3d             	cmp    $0x3d,%dl
     5db:	75 18                	jne    5f5 <__cmdline_find_option+0x94>
			opptr = option;
     5dd:	67 66 8b 34 24       	mov    (%esp),%esi
			if (c == '=' && !*opptr) {
     5e2:	67 80 3e 00          	cmpb   $0x0,(%esi)
     5e6:	74 3d                	je     625 <__cmdline_find_option+0xc4>
     5e8:	eb 08                	jmp    5f2 <__cmdline_find_option+0x91>
				state = st_wordstart;
     5ea:	66 31 c0             	xor    %eax,%eax
			} else if (myisspace(c)) {
     5ed:	80 fa 20             	cmp    $0x20,%dl
     5f0:	76 44                	jbe    636 <__cmdline_find_option+0xd5>
     5f2:	66 89 f0             	mov    %esi,%eax
			} else if (c != *opptr++) {
     5f5:	67 66 8d 70 01       	lea    0x1(%eax),%esi
				state = st_wordskip;
     5fa:	67 38 10             	cmp    %dl,(%eax)
     5fd:	0f 95 c0             	setne  %al
     600:	66 0f b6 c0          	movzbl %al,%eax
     604:	66 40                	inc    %eax
     606:	eb 2e                	jmp    636 <__cmdline_find_option+0xd5>
			if (myisspace(c))
     608:	80 fa 20             	cmp    $0x20,%dl
     60b:	77 29                	ja     636 <__cmdline_find_option+0xd5>
     60d:	eb 24                	jmp    633 <__cmdline_find_option+0xd2>
			if (myisspace(c)) {
     60f:	80 fa 20             	cmp    $0x20,%dl
     612:	76 1f                	jbe    633 <__cmdline_find_option+0xd2>
				if (len < bufsize-1)
     614:	67 66 39 4c 24 04    	cmp    %ecx,0x4(%esp)
     61a:	7e 05                	jle    621 <__cmdline_find_option+0xc0>
					*bufptr++ = c;
     61c:	67 88 13             	mov    %dl,(%ebx)
     61f:	66 43                	inc    %ebx
				len++;
     621:	66 41                	inc    %ecx
     623:	eb 11                	jmp    636 <__cmdline_find_option+0xd5>
				bufptr = buffer;
     625:	66 89 eb             	mov    %ebp,%ebx
				state = st_bufcpy;
     628:	66 b8 03 00 00 00    	mov    $0x3,%eax
				len = 0;
     62e:	66 31 c9             	xor    %ecx,%ecx
     631:	eb 03                	jmp    636 <__cmdline_find_option+0xd5>
				state = st_wordstart;
     633:	66 31 c0             	xor    %eax,%eax
	while (cptr < 0x10000 && (c = rdfs8(cptr++))) {
     636:	66 47                	inc    %edi
     638:	66 81 ff 00 00 01 00 	cmp    $0x10000,%edi
     63f:	0f 85 65 ff          	jne    5a8 <__cmdline_find_option+0x47>

	if (bufsize)
     643:	67 66 83 7c 24 1c 00 	cmpl   $0x0,0x1c(%esp)
     64a:	74 0a                	je     656 <__cmdline_find_option+0xf5>
		*bufptr = '\0';
     64c:	67 c6 03 00          	movb   $0x0,(%ebx)
     650:	eb 04                	jmp    656 <__cmdline_find_option+0xf5>
		return -1;      /* No command line */
     652:	66 83 c9 ff          	or     $0xffffffff,%ecx

	return len;
}
     656:	66 89 c8             	mov    %ecx,%eax
     659:	66 83 c4 08          	add    $0x8,%esp
     65d:	66 5b                	pop    %ebx
     65f:	66 5e                	pop    %esi
     661:	66 5f                	pop    %edi
     663:	66 5d                	pop    %ebp
     665:	66 c3                	retl   

00000667 <__cmdline_find_option_bool>:
 *
 * Returns the position of that option (starts counting with 1)
 * or 0 on not found
 */
int __cmdline_find_option_bool(unsigned long cmdline_ptr, const char *option)
{
     667:	f3 0f 1e fb          	endbr32 
		st_wordstart,	/* Start of word/after whitespace */
		st_wordcmp,	/* Comparing this word */
		st_wordskip,	/* Miscompare, skip */
	} state = st_wordstart;

	if (!cmdline_ptr)
     66b:	66 85 c0             	test   %eax,%eax
     66e:	0f 84 92 00          	je     704 <__cmdline_find_option_bool+0x9d>
{
     672:	66 55                	push   %ebp
     674:	66 57                	push   %edi
     676:	66 56                	push   %esi
     678:	66 53                	push   %ebx
     67a:	66 51                	push   %ecx
     67c:	66 89 d7             	mov    %edx,%edi
		return -1;      /* No command line */

	cptr = cmdline_ptr & 0xf;
     67f:	66 89 c5             	mov    %eax,%ebp
     682:	66 83 e5 0f          	and    $0xf,%ebp
	set_fs(cmdline_ptr >> 4);
     686:	66 c1 e8 04          	shr    $0x4,%eax
	asm volatile("movw %0,%%fs" : : "rm" (seg));
     68a:	8e e0                	mov    %ax,%fs

	while (cptr < 0x10000) {
     68c:	66 b8 00 00 01 00    	mov    $0x10000,%eax
     692:	66 29 e8             	sub    %ebp,%eax
     695:	67 66 89 04 24       	mov    %eax,(%esp)
	} state = st_wordstart;
     69a:	66 31 db             	xor    %ebx,%ebx
	const char *opptr = NULL;
     69d:	66 31 f6             	xor    %esi,%esi
	int pos = 0, wstart = 0;
     6a0:	66 31 c0             	xor    %eax,%eax
     6a3:	66 31 c9             	xor    %ecx,%ecx
	asm volatile("movb %%fs:%1,%0" : "=q" (v) : "m" (*(u8 *)addr));
     6a6:	64 67 8a 14 29       	mov    %fs:(%ecx,%ebp,1),%dl
		c = rdfs8(cptr++);
		pos++;
     6ab:	66 41                	inc    %ecx

		switch (state) {
     6ad:	66 83 fb 01          	cmp    $0x1,%ebx
     6b1:	74 15                	je     6c8 <__cmdline_find_option_bool+0x61>
     6b3:	66 83 fb 02          	cmp    $0x2,%ebx
     6b7:	74 36                	je     6ef <__cmdline_find_option_bool+0x88>
		case st_wordstart:
			if (!c)
     6b9:	84 d2                	test   %dl,%dl
     6bb:	74 4d                	je     70a <__cmdline_find_option_bool+0xa3>
				return 0;
			else if (myisspace(c))
     6bd:	80 fa 20             	cmp    $0x20,%dl
     6c0:	76 36                	jbe    6f8 <__cmdline_find_option_bool+0x91>
				break;

			state = st_wordcmp;
			opptr = option;
     6c2:	66 89 fe             	mov    %edi,%esi
		pos++;
     6c5:	66 89 c8             	mov    %ecx,%eax
			wstart = pos;
			/* fall through */

		case st_wordcmp:
			if (!*opptr)
     6c8:	67 8a 1e             	mov    (%esi),%bl
     6cb:	84 db                	test   %bl,%bl
     6cd:	75 0d                	jne    6dc <__cmdline_find_option_bool+0x75>
				if (!c || myisspace(c))
     6cf:	80 fa 20             	cmp    $0x20,%dl
     6d2:	76 39                	jbe    70d <__cmdline_find_option_bool+0xa6>
					return wstart;
				else
					state = st_wordskip;
     6d4:	66 bb 02 00 00 00    	mov    $0x2,%ebx
     6da:	eb 1f                	jmp    6fb <__cmdline_find_option_bool+0x94>
			else if (!c)
     6dc:	84 d2                	test   %dl,%dl
     6de:	74 2a                	je     70a <__cmdline_find_option_bool+0xa3>
				return 0;
			else if (c != *opptr++)
     6e0:	66 46                	inc    %esi
				state = st_wordskip;
     6e2:	38 d3                	cmp    %dl,%bl
     6e4:	0f 95 c3             	setne  %bl
     6e7:	66 0f b6 db          	movzbl %bl,%ebx
     6eb:	66 43                	inc    %ebx
     6ed:	eb 0c                	jmp    6fb <__cmdline_find_option_bool+0x94>
			break;

		case st_wordskip:
			if (!c)
     6ef:	84 d2                	test   %dl,%dl
     6f1:	74 17                	je     70a <__cmdline_find_option_bool+0xa3>
				return 0;
			else if (myisspace(c))
     6f3:	80 fa 20             	cmp    $0x20,%dl
     6f6:	77 03                	ja     6fb <__cmdline_find_option_bool+0x94>
				state = st_wordstart;
			break;
		}
	}
     6f8:	66 31 db             	xor    %ebx,%ebx
	while (cptr < 0x10000) {
     6fb:	67 66 39 0c 24       	cmp    %ecx,(%esp)
     700:	75 a4                	jne    6a6 <__cmdline_find_option_bool+0x3f>
     702:	eb 06                	jmp    70a <__cmdline_find_option_bool+0xa3>
		return -1;      /* No command line */
     704:	66 83 c8 ff          	or     $0xffffffff,%eax

	return 0;	/* Buffer overrun */
}
     708:	66 c3                	retl   
				return 0;
     70a:	66 31 c0             	xor    %eax,%eax
}
     70d:	66 5a                	pop    %edx
     70f:	66 5b                	pop    %ebx
     711:	66 5e                	pop    %esi
     713:	66 5f                	pop    %edi
     715:	66 5d                	pop    %ebp
     717:	66 c3                	retl   

00000719 <memcpy>:

	.code16
	.text

GLOBAL(memcpy)
	pushw	%si
     719:	56                   	push   %si
	pushw	%di
     71a:	57                   	push   %di
	movw	%ax, %di
     71b:	89 c7                	mov    %ax,%di
	movw	%dx, %si
     71d:	89 d6                	mov    %dx,%si
	pushw	%cx
     71f:	51                   	push   %cx
	shrw	$2, %cx
     720:	c1 e9 02             	shr    $0x2,%cx
	rep; movsl
     723:	f3 66 a5             	rep movsl %ds:(%si),%es:(%di)
	popw	%cx
     726:	59                   	pop    %cx
	andw	$3, %cx
     727:	83 e1 03             	and    $0x3,%cx
	rep; movsb
     72a:	f3 a4                	rep movsb %ds:(%si),%es:(%di)
	popw	%di
     72c:	5f                   	pop    %di
	popw	%si
     72d:	5e                   	pop    %si
	retl
     72e:	66 c3                	retl   

00000730 <memset>:
ENDPROC(memcpy)

GLOBAL(memset)
	pushw	%di
     730:	57                   	push   %di
	movw	%ax, %di
     731:	89 c7                	mov    %ax,%di
	movzbl	%dl, %eax
     733:	66 0f b6 c2          	movzbl %dl,%eax
	imull	$0x01010101,%eax
     737:	66 69 c0 01 01 01 01 	imul   $0x1010101,%eax,%eax
	pushw	%cx
     73e:	51                   	push   %cx
	shrw	$2, %cx
     73f:	c1 e9 02             	shr    $0x2,%cx
	rep; stosl
     742:	f3 66 ab             	rep stos %eax,%es:(%di)
	popw	%cx
     745:	59                   	pop    %cx
	andw	$3, %cx
     746:	83 e1 03             	and    $0x3,%cx
	rep; stosb
     749:	f3 aa                	rep stos %al,%es:(%di)
	popw	%di
     74b:	5f                   	pop    %di
	retl
     74c:	66 c3                	retl   

0000074e <copy_from_fs>:
ENDPROC(memset)

GLOBAL(copy_from_fs)
	pushw	%ds
     74e:	1e                   	push   %ds
	pushw	%fs
     74f:	0f a0                	push   %fs
	popw	%ds
     751:	1f                   	pop    %ds
	calll	memcpy
     752:	66 e8 c1 ff ff ff    	calll  719 <memcpy>
	popw	%ds
     758:	1f                   	pop    %ds
	retl
     759:	66 c3                	retl   

0000075b <copy_to_fs>:
ENDPROC(copy_from_fs)

GLOBAL(copy_to_fs)
	pushw	%es
     75b:	06                   	push   %es
	pushw	%fs
     75c:	0f a0                	push   %fs
	popw	%es
     75e:	07                   	pop    %es
	calll	memcpy
     75f:	66 e8 b4 ff ff ff    	calll  719 <memcpy>
	popw	%es
     765:	07                   	pop    %es
	retl
     766:	66 c3                	retl   

00000768 <validate_cpu>:
	}
#endif
}

int validate_cpu(void)
{
     768:	f3 0f 1e fb          	endbr32 
     76c:	66 55                	push   %ebp
     76e:	66 57                	push   %edi
     770:	66 56                	push   %esi
     772:	66 53                	push   %ebx
     774:	66 83 ec 10          	sub    $0x10,%esp
	u32 *err_flags;
	int cpu_level, req_level;

	check_cpu(&cpu_level, &req_level, &err_flags);
     778:	67 66 8d 4c 24 04    	lea    0x4(%esp),%ecx
     77e:	67 66 8d 54 24 0c    	lea    0xc(%esp),%edx
     784:	67 66 8d 44 24 08    	lea    0x8(%esp),%eax
     78a:	66 e8 4f 03 00 00    	calll  adf <check_cpu>

	if (cpu_level < req_level) {
     790:	67 66 8b 44 24 0c    	mov    0xc(%esp),%eax
     796:	67 66 39 44 24 08    	cmp    %eax,0x8(%esp)
     79c:	0f 8d 99 00          	jge    839 <BOOTSEG+0x79>
		return "x86-64";
     7a0:	66 ba c0 34 00 00    	mov    $0x34c0,%edx
	if (level == 64) {
     7a6:	66 83 f8 40          	cmp    $0x40,%eax
     7aa:	74 2a                	je     7d6 <BOOTSEG+0x16>
		if (level == 15)
     7ac:	66 83 f8 0f          	cmp    $0xf,%eax
     7b0:	75 06                	jne    7b8 <validate_cpu+0x50>
			level = 6;
     7b2:	66 b8 06 00 00 00    	mov    $0x6,%eax
		sprintf(buf, "i%d86", level);
     7b8:	66 50                	push   %eax
     7ba:	66 68 c7 34 00 00    	pushl  $0x34c7
     7c0:	66 68 80 44 00 00    	pushl  $0x4480
     7c6:	66 e8 8a 14 00 00    	calll  1c56 <sprintf>
     7cc:	66 83 c4 0c          	add    $0xc,%esp
     7d0:	66 ba 80 44 00 00    	mov    $0x4480,%edx
		printf("This kernel requires an %s CPU, ",
     7d6:	66 52                	push   %edx
     7d8:	66 68 cd 34 00 00    	pushl  $0x34cd
     7de:	66 e8 90 14 00 00    	calll  1c74 <printf>
		       cpu_name(req_level));
		printf("but only detected an %s CPU.\n",
     7e4:	67 66 8b 44 24 10    	mov    0x10(%esp),%eax
	if (level == 64) {
     7ea:	66 5e                	pop    %esi
     7ec:	66 5f                	pop    %edi
		return "x86-64";
     7ee:	66 ba c0 34 00 00    	mov    $0x34c0,%edx
	if (level == 64) {
     7f4:	66 83 f8 40          	cmp    $0x40,%eax
     7f8:	74 2a                	je     824 <BOOTSEG+0x64>
		if (level == 15)
     7fa:	66 83 f8 0f          	cmp    $0xf,%eax
     7fe:	75 06                	jne    806 <BOOTSEG+0x46>
			level = 6;
     800:	66 b8 06 00 00 00    	mov    $0x6,%eax
		sprintf(buf, "i%d86", level);
     806:	66 50                	push   %eax
     808:	66 68 c7 34 00 00    	pushl  $0x34c7
     80e:	66 68 80 44 00 00    	pushl  $0x4480
     814:	66 e8 3c 14 00 00    	calll  1c56 <sprintf>
     81a:	66 83 c4 0c          	add    $0xc,%esp
     81e:	66 ba 80 44 00 00    	mov    $0x4480,%edx
		printf("but only detected an %s CPU.\n",
     824:	66 52                	push   %edx
     826:	66 68 ee 34 00 00    	pushl  $0x34ee
     82c:	66 e8 42 14 00 00    	calll  1c74 <printf>
		       cpu_name(cpu_level));
		return -1;
     832:	66 59                	pop    %ecx
     834:	66 5b                	pop    %ebx
     836:	e9 d1 00             	jmp    90a <BOOTSEG+0x14a>
	}

	if (err_flags) {
     839:	67 66 83 7c 24 04 00 	cmpl   $0x0,0x4(%esp)
     840:	0f 84 cc 00          	je     910 <BOOTSEG+0x150>
		puts("This kernel requires the following features "
     844:	66 b8 0c 35 00 00    	mov    $0x350c,%eax
     84a:	66 e8 6d fb ff ff    	calll  3bd <puts>
		     "not present on the CPU:\n");
		show_cap_strs(err_flags);
     850:	67 66 8b 44 24 04    	mov    0x4(%esp),%eax
     856:	67 66 89 04 24       	mov    %eax,(%esp)
	const unsigned char *msg_strs = (const unsigned char *)x86_cap_strs;
     85b:	66 bb 60 35 00 00    	mov    $0x3560,%ebx
	for (i = 0; i < NCAPINTS; i++) {
     861:	66 31 f6             	xor    %esi,%esi
		u32 e = err_flags[i];
     864:	67 66 8b 04 24       	mov    (%esp),%eax
     869:	67 66 8b 3c b0       	mov    (%eax,%esi,4),%edi
		for (j = 0; j < 32; j++) {
     86e:	66 31 ed             	xor    %ebp,%ebp
			if (msg_strs[0] < i ||
     871:	67 66 0f b6 03       	movzbl (%ebx),%eax
     876:	66 39 f0             	cmp    %esi,%eax
     879:	7c 0d                	jl     888 <BOOTSEG+0xc8>
     87b:	75 18                	jne    895 <BOOTSEG+0xd5>
			    (msg_strs[0] == i && msg_strs[1] < j)) {
     87d:	67 66 0f b6 43 01    	movzbl 0x1(%ebx),%eax
     883:	66 39 e8             	cmp    %ebp,%eax
     886:	7d 0d                	jge    895 <BOOTSEG+0xd5>
				msg_strs += 2;
     888:	66 83 c3 02          	add    $0x2,%ebx
				while (*msg_strs++)
     88c:	66 43                	inc    %ebx
     88e:	67 80 7b ff 00       	cmpb   $0x0,-0x1(%ebx)
     893:	75 f7                	jne    88c <BOOTSEG+0xcc>
			if (e & 1) {
     895:	66 f7 c7 01 00 00 00 	test   $0x1,%edi
     89c:	74 49                	je     8e7 <BOOTSEG+0x127>
				if (msg_strs[0] == i &&
     89e:	67 66 0f b6 03       	movzbl (%ebx),%eax
     8a3:	66 39 f0             	cmp    %esi,%eax
     8a6:	75 2b                	jne    8d3 <BOOTSEG+0x113>
				    msg_strs[1] == j &&
     8a8:	67 66 0f b6 43 01    	movzbl 0x1(%ebx),%eax
				if (msg_strs[0] == i &&
     8ae:	66 39 e8             	cmp    %ebp,%eax
     8b1:	75 20                	jne    8d3 <BOOTSEG+0x113>
				    msg_strs[1] == j &&
     8b3:	67 80 7b 02 00       	cmpb   $0x0,0x2(%ebx)
     8b8:	74 19                	je     8d3 <BOOTSEG+0x113>
					printf("%s ", msg_strs+2);
     8ba:	67 66 8d 43 02       	lea    0x2(%ebx),%eax
     8bf:	66 50                	push   %eax
     8c1:	66 68 51 35 00 00    	pushl  $0x3551
     8c7:	66 e8 a7 13 00 00    	calll  1c74 <printf>
     8cd:	66 58                	pop    %eax
     8cf:	66 5a                	pop    %edx
     8d1:	eb 14                	jmp    8e7 <BOOTSEG+0x127>
					printf("%d:%d ", i, j);
     8d3:	66 55                	push   %ebp
     8d5:	66 56                	push   %esi
     8d7:	66 68 55 35 00 00    	pushl  $0x3555
     8dd:	66 e8 91 13 00 00    	calll  1c74 <printf>
     8e3:	66 83 c4 0c          	add    $0xc,%esp
			e >>= 1;
     8e7:	66 d1 ef             	shr    %edi
		for (j = 0; j < 32; j++) {
     8ea:	66 45                	inc    %ebp
     8ec:	66 83 fd 20          	cmp    $0x20,%ebp
     8f0:	0f 85 7d ff          	jne    871 <BOOTSEG+0xb1>
	for (i = 0; i < NCAPINTS; i++) {
     8f4:	66 46                	inc    %esi
     8f6:	66 83 fe 13          	cmp    $0x13,%esi
     8fa:	0f 85 66 ff          	jne    864 <BOOTSEG+0xa4>
		putchar('\n');
     8fe:	66 b8 0a 00 00 00    	mov    $0xa,%eax
     904:	66 e8 25 fa ff ff    	calll  32f <putchar>
		return -1;
     90a:	66 83 c8 ff          	or     $0xffffffff,%eax
     90e:	eb 13                	jmp    923 <BOOTSEG+0x163>
	} else if (check_knl_erratum()) {
     910:	66 e8 11 04 00 00    	calll  d27 <check_knl_erratum>
     916:	66 85 c0             	test   %eax,%eax
     919:	0f 95 c0             	setne  %al
     91c:	66 0f b6 c0          	movzbl %al,%eax
     920:	66 f7 d8             	neg    %eax
		return -1;
	} else {
		return 0;
	}
}
     923:	66 83 c4 10          	add    $0x10,%esp
     927:	66 5b                	pop    %ebx
     929:	66 5e                	pop    %esi
     92b:	66 5f                	pop    %edi
     92d:	66 5d                	pop    %ebp
     92f:	66 c3                	retl   

00000931 <has_eflag>:
#define PUSHF "pushfl"
#define POPF "popfl"
#endif

int has_eflag(unsigned long mask)
{
     931:	f3 0f 1e fb          	endbr32 
	unsigned long f0, f1;

	asm volatile(PUSHF "	\n\t"
     935:	66 9c                	pushfl 
     937:	66 9c                	pushfl 
     939:	66 5a                	pop    %edx
     93b:	66 89 d1             	mov    %edx,%ecx
     93e:	66 31 c1             	xor    %eax,%ecx
     941:	66 51                	push   %ecx
     943:	66 9d                	popfl  
     945:	66 9c                	pushfl 
     947:	66 59                	pop    %ecx
     949:	66 9d                	popfl  
		     "pop %1	\n\t"
		     POPF
		     : "=&r" (f0), "=&r" (f1)
		     : "ri" (mask));

	return !!((f0^f1) & mask);
     94b:	66 31 ca             	xor    %ecx,%edx
     94e:	66 85 c2             	test   %eax,%edx
     951:	0f 95 c0             	setne  %al
     954:	66 0f b6 c0          	movzbl %al,%eax
}
     958:	66 c3                	retl   

0000095a <get_cpuflags>:
}

#define cpuid(id, a, b, c, d) cpuid_count(id, 0, a, b, c, d)

void get_cpuflags(void)
{
     95a:	f3 0f 1e fb          	endbr32 
	u32 max_intel_level, max_amd_level;
	u32 tfms;
	u32 ignored;

	if (loaded_flags)
     95e:	80 3e 18 45 00       	cmpb   $0x0,0x4518
     963:	0f 85 30 01          	jne    a97 <get_cpuflags+0x13d>
{
     967:	66 57                	push   %edi
     969:	66 56                	push   %esi
     96b:	66 53                	push   %ebx
     96d:	66 52                	push   %edx
		return;
	loaded_flags = true;
     96f:	c6 06 18 45 01       	movb   $0x1,0x4518
	u16 fcw = -1, fsw = -1;
     974:	67 c7 04 24 ff ff    	movw   $0xffff,(%esp)
     97a:	67 c7 44 24 02 ff ff 	movw   $0xffff,0x2(%esp)
	asm volatile("mov %%cr0,%0" : "=r" (cr0));
     981:	0f 20 c0             	mov    %cr0,%eax
	if (cr0 & (X86_CR0_EM|X86_CR0_TS)) {
     984:	a8 0c                	test   $0xc,%al
     986:	74 07                	je     98f <get_cpuflags+0x35>
		cr0 &= ~(X86_CR0_EM|X86_CR0_TS);
     988:	66 83 e0 f3          	and    $0xfffffff3,%eax
		asm volatile("mov %0,%%cr0" : : "r" (cr0));
     98c:	0f 22 c0             	mov    %eax,%cr0
	asm volatile("fninit ; fnstsw %0 ; fnstcw %1"
     98f:	db e3                	fninit 
     991:	67 dd 7c 24 02       	fnstsw 0x2(%esp)
     996:	67 d9 3c 24          	fnstcw (%esp)
	return fsw == 0 && (fcw & 0x103f) == 0x003f;
     99a:	67 83 7c 24 02 00    	cmpw   $0x0,0x2(%esp)
     9a0:	75 14                	jne    9b6 <get_cpuflags+0x5c>
     9a2:	67 66 8b 04 24       	mov    (%esp),%eax
     9a7:	25 3f 10             	and    $0x103f,%ax
     9aa:	83 f8 3f             	cmp    $0x3f,%ax
     9ad:	75 07                	jne    9b6 <get_cpuflags+0x5c>
 constant_test_bit((nr),(addr)) : \
 variable_test_bit((nr),(addr)))

static inline void set_bit(int nr, void *addr)
{
	asm("btsl %1,%0" : "+m" (*(u32 *)addr) : "Ir" (nr));
     9af:	66 0f ba 2e cc 44 00 	btsl   $0x0,0x44cc

	if (has_fpu())
		set_bit(X86_FEATURE_FPU, cpu.flags);

	if (has_eflag(X86_EFLAGS_ID)) {
     9b6:	66 b8 00 00 20 00    	mov    $0x200000,%eax
     9bc:	66 e8 6f ff ff ff    	calll  931 <has_eflag>
     9c2:	66 85 c0             	test   %eax,%eax
     9c5:	0f 84 c4 00          	je     a8d <get_cpuflags+0x133>
	asm volatile(".ifnc %%ebx,%3 ; movl  %%ebx,%3 ; .endif	\n\t"
     9c9:	66 31 f6             	xor    %esi,%esi
     9cc:	66 89 f0             	mov    %esi,%eax
     9cf:	66 89 f1             	mov    %esi,%ecx
     9d2:	0f a2                	cpuid  
     9d4:	66 89 c7             	mov    %eax,%edi
     9d7:	66 89 0e a8 44       	mov    %ecx,0x44a8
     9dc:	66 89 16 a4 44       	mov    %edx,0x44a4
     9e1:	66 89 1e a0 44       	mov    %ebx,0x44a0
		cpuid(0x0, &max_intel_level, &cpu_vendor[0], &cpu_vendor[2],
		      &cpu_vendor[1]);

		if (max_intel_level >= 0x00000001 &&
     9e6:	67 66 8d 40 ff       	lea    -0x1(%eax),%eax
     9eb:	66 3d fe ff 00 00    	cmp    $0xfffe,%eax
     9f1:	77 53                	ja     a46 <get_cpuflags+0xec>
	asm volatile(".ifnc %%ebx,%3 ; movl  %%ebx,%3 ; .endif	\n\t"
     9f3:	66 b8 01 00 00 00    	mov    $0x1,%eax
     9f9:	66 89 f1             	mov    %esi,%ecx
     9fc:	0f a2                	cpuid  
     9fe:	66 89 0e dc 44       	mov    %ecx,0x44dc
     a03:	66 89 16 cc 44       	mov    %edx,0x44cc
		    max_intel_level <= 0x0000ffff) {
			cpuid(0x1, &tfms, &ignored, &cpu.flags[4],
			      &cpu.flags[0]);
			cpu.level = (tfms >> 8) & 15;
     a08:	66 89 c2             	mov    %eax,%edx
     a0b:	66 c1 ea 08          	shr    $0x8,%edx
     a0f:	66 83 e2 0f          	and    $0xf,%edx
     a13:	66 89 16 c0 44       	mov    %edx,0x44c0
			cpu.family = cpu.level;
     a18:	66 89 16 c4 44       	mov    %edx,0x44c4
			cpu.model = (tfms >> 4) & 15;
     a1d:	66 89 c1             	mov    %eax,%ecx
     a20:	66 c1 e9 04          	shr    $0x4,%ecx
     a24:	66 83 e1 0f          	and    $0xf,%ecx
			if (cpu.level >= 6)
     a28:	66 83 fa 05          	cmp    $0x5,%edx
     a2c:	7f 07                	jg     a35 <get_cpuflags+0xdb>
			cpu.model = (tfms >> 4) & 15;
     a2e:	66 89 0e c8 44       	mov    %ecx,0x44c8
     a33:	eb 11                	jmp    a46 <get_cpuflags+0xec>
				cpu.model += ((tfms >> 16) & 0xf) << 4;
     a35:	66 c1 e8 0c          	shr    $0xc,%eax
     a39:	66 25 f0 00 00 00    	and    $0xf0,%eax
     a3f:	66 01 c8             	add    %ecx,%eax
     a42:	66 a3 c8 44          	mov    %eax,0x44c8
		}

		if (max_intel_level >= 0x00000007) {
     a46:	66 83 ff 06          	cmp    $0x6,%edi
     a4a:	76 10                	jbe    a5c <get_cpuflags+0x102>
	asm volatile(".ifnc %%ebx,%3 ; movl  %%ebx,%3 ; .endif	\n\t"
     a4c:	66 b8 07 00 00 00    	mov    $0x7,%eax
     a52:	66 31 c9             	xor    %ecx,%ecx
     a55:	0f a2                	cpuid  
     a57:	66 89 0e 0c 45       	mov    %ecx,0x450c
     a5c:	66 31 f6             	xor    %esi,%esi
     a5f:	66 b8 00 00 00 80    	mov    $0x80000000,%eax
     a65:	66 89 f1             	mov    %esi,%ecx
     a68:	0f a2                	cpuid  
		}

		cpuid(0x80000000, &max_amd_level, &ignored, &ignored,
		      &ignored);

		if (max_amd_level >= 0x80000001 &&
     a6a:	66 05 ff ff ff 7f    	add    $0x7fffffff,%eax
     a70:	66 3d fe ff 00 00    	cmp    $0xfffe,%eax
     a76:	77 15                	ja     a8d <get_cpuflags+0x133>
	asm volatile(".ifnc %%ebx,%3 ; movl  %%ebx,%3 ; .endif	\n\t"
     a78:	66 b8 01 00 00 80    	mov    $0x80000001,%eax
     a7e:	66 89 f1             	mov    %esi,%ecx
     a81:	0f a2                	cpuid  
     a83:	66 89 0e e4 44       	mov    %ecx,0x44e4
     a88:	66 89 16 d0 44       	mov    %edx,0x44d0
		    max_amd_level <= 0x8000ffff) {
			cpuid(0x80000001, &ignored, &ignored, &cpu.flags[6],
			      &cpu.flags[1]);
		}
	}
}
     a8d:	66 58                	pop    %eax
     a8f:	66 5b                	pop    %ebx
     a91:	66 5e                	pop    %esi
     a93:	66 5f                	pop    %edi
     a95:	66 c3                	retl   
     a97:	66 c3                	retl   

00000a99 <check_cpuflags>:
	       cpu_vendor[2] == A32('n', 't', 'e', 'l');
}

/* Returns a bitmask of which words we have error bits in */
static int check_cpuflags(void)
{
     a99:	66 53                	push   %ebx
	u32 err;
	int i;

	err = 0;
	for (i = 0; i < NCAPINTS; i++) {
     a9b:	66 31 c9             	xor    %ecx,%ecx
	err = 0;
     a9e:	66 31 d2             	xor    %edx,%edx
		err_flags[i] = req_flags[i] & ~cpu.flags[i];
		if (err_flags[i])
			err |= 1 << i;
     aa1:	66 bb 01 00 00 00    	mov    $0x1,%ebx
		err_flags[i] = req_flags[i] & ~cpu.flags[i];
     aa7:	67 66 8b 04 8d cc 44 	mov    0x44cc(,%ecx,4),%eax
     aae:	00 00 
     ab0:	66 f7 d0             	not    %eax
     ab3:	67 66 23 04 8d 20 36 	and    0x3620(,%ecx,4),%eax
     aba:	00 00 
     abc:	67 66 89 04 8d 20 45 	mov    %eax,0x4520(,%ecx,4)
     ac3:	00 00 
		if (err_flags[i])
     ac5:	74 09                	je     ad0 <check_cpuflags+0x37>
			err |= 1 << i;
     ac7:	66 89 d8             	mov    %ebx,%eax
     aca:	66 d3 e0             	shl    %cl,%eax
     acd:	66 09 c2             	or     %eax,%edx
	for (i = 0; i < NCAPINTS; i++) {
     ad0:	66 41                	inc    %ecx
     ad2:	66 83 f9 13          	cmp    $0x13,%ecx
     ad6:	75 cf                	jne    aa7 <check_cpuflags+0xe>
	}

	return err;
}
     ad8:	66 89 d0             	mov    %edx,%eax
     adb:	66 5b                	pop    %ebx
     add:	66 c3                	retl   

00000adf <check_cpu>:
 * level.  x86-64 is considered level 64 for this purpose.
 *
 * *err_flags_ptr is set to the flags error array if there are flags missing.
 */
int check_cpu(int *cpu_level_ptr, int *req_level_ptr, u32 **err_flags_ptr)
{
     adf:	f3 0f 1e fb          	endbr32 
     ae3:	66 55                	push   %ebp
     ae5:	66 57                	push   %edi
     ae7:	66 56                	push   %esi
     ae9:	66 53                	push   %ebx
     aeb:	66 83 ec 0c          	sub    $0xc,%esp
     aef:	67 66 89 04 24       	mov    %eax,(%esp)
     af4:	66 89 d5             	mov    %edx,%ebp
     af7:	66 89 ce             	mov    %ecx,%esi
	int err;

	memset(&cpu.flags, 0, sizeof cpu.flags);
     afa:	66 ba cc 44 00 00    	mov    $0x44cc,%edx
     b00:	66 b9 13 00 00 00    	mov    $0x13,%ecx
     b06:	66 31 c0             	xor    %eax,%eax
     b09:	66 89 d7             	mov    %edx,%edi
     b0c:	66 f3 ab             	rep stos %eax,%es:(%di)
	cpu.level = 3;
     b0f:	66 c7 06 c0 44 03 00 	movl   $0x3,0x44c0
     b16:	00 00 

	if (has_eflag(X86_EFLAGS_AC))
     b18:	66 b8 00 00 04 00    	mov    $0x40000,%eax
     b1e:	66 e8 0d fe ff ff    	calll  931 <has_eflag>
     b24:	66 85 c0             	test   %eax,%eax
     b27:	74 09                	je     b32 <check_cpu+0x53>
		cpu.level = 4;
     b29:	66 c7 06 c0 44 04 00 	movl   $0x4,0x44c0
     b30:	00 00 

	get_cpuflags();
     b32:	66 e8 22 fe ff ff    	calll  95a <get_cpuflags>
	err = check_cpuflags();
     b38:	66 e8 5b ff ff ff    	calll  a99 <check_cpuflags>
     b3e:	66 89 c7             	mov    %eax,%edi

	if (test_bit(X86_FEATURE_LM, cpu.flags))
     b41:	f6 06 d3 44 20       	testb  $0x20,0x44d3
     b46:	74 09                	je     b51 <check_cpu+0x72>
		cpu.level = 64;
     b48:	66 c7 06 c0 44 40 00 	movl   $0x40,0x44c0
     b4f:	00 00 

	if (err == 0x01 &&
     b51:	66 83 ff 01          	cmp    $0x1,%edi
     b55:	0f 85 6d 01          	jne    cc6 <check_cpu+0x1e7>
	    !(err_flags[0] &
     b59:	66 8b 16 20 45       	mov    0x4520,%edx
	return cpu_vendor[0] == A32('A', 'u', 't', 'h') &&
     b5e:	66 a1 a0 44          	mov    0x44a0,%eax
	if (err == 0x01 &&
     b62:	66 f7 c2 ff ff ff f9 	test   $0xf9ffffff,%edx
     b69:	75 33                	jne    b9e <check_cpu+0xbf>
	       cpu_vendor[1] == A32('e', 'n', 't', 'i') &&
     b6b:	66 3d 41 75 74 68    	cmp    $0x68747541,%eax
     b71:	75 2b                	jne    b9e <check_cpu+0xbf>
	return cpu_vendor[0] == A32('A', 'u', 't', 'h') &&
     b73:	66 81 3e a4 44 65 6e 	cmpl   $0x69746e65,0x44a4
     b7a:	74 69 
     b7c:	75 20                	jne    b9e <check_cpu+0xbf>
	       cpu_vendor[1] == A32('e', 'n', 't', 'i') &&
     b7e:	66 81 3e a8 44 63 41 	cmpl   $0x444d4163,0x44a8
     b85:	4d 44 
     b87:	75 15                	jne    b9e <check_cpu+0xbf>
		   turn them on */

		u32 ecx = MSR_K7_HWCR;
		u32 eax, edx;

		asm("rdmsr" : "=a" (eax), "=d" (edx) : "c" (ecx));
     b89:	66 b9 15 00 01 c0    	mov    $0xc0010015,%ecx
     b8f:	0f 32                	rdmsr  
		eax &= ~(1 << 15);
     b91:	80 e4 7f             	and    $0x7f,%ah
		asm("wrmsr" : : "a" (eax), "d" (edx), "c" (ecx));
     b94:	0f 30                	wrmsr  

		get_cpuflags();	/* Make sure it really did something */
     b96:	66 e8 be fd ff ff    	calll  95a <get_cpuflags>
		err = check_cpuflags();
     b9c:	eb 46                	jmp    be4 <check_cpu+0x105>
	} else if (err == 0x01 &&
     b9e:	66 f7 c2 ff fe ff ff 	test   $0xfffffeff,%edx
     ba5:	75 49                	jne    bf0 <check_cpu+0x111>
	       cpu_vendor[1] == A32('a', 'u', 'r', 'H') &&
     ba7:	66 3d 43 65 6e 74    	cmp    $0x746e6543,%eax
     bad:	75 41                	jne    bf0 <check_cpu+0x111>
	return cpu_vendor[0] == A32('C', 'e', 'n', 't') &&
     baf:	66 81 3e a4 44 61 75 	cmpl   $0x48727561,0x44a4
     bb6:	72 48 
     bb8:	0f 85 8f 00          	jne    c4b <check_cpu+0x16c>
	       cpu_vendor[1] == A32('a', 'u', 'r', 'H') &&
     bbc:	66 81 3e a8 44 61 75 	cmpl   $0x736c7561,0x44a8
     bc3:	6c 73 
     bc5:	0f 85 82 00          	jne    c4b <check_cpu+0x16c>
		   !(err_flags[0] & ~(1 << X86_FEATURE_CX8)) &&
		   is_centaur() && cpu.model >= 6) {
     bc9:	66 83 3e c8 44 05    	cmpl   $0x5,0x44c8
     bcf:	7e 7a                	jle    c4b <check_cpu+0x16c>
		   explicitly */

		u32 ecx = MSR_VIA_FCR;
		u32 eax, edx;

		asm("rdmsr" : "=a" (eax), "=d" (edx) : "c" (ecx));
     bd1:	66 b9 07 11 00 00    	mov    $0x1107,%ecx
     bd7:	0f 32                	rdmsr  
		eax |= (1<<1)|(1<<7);
     bd9:	0c 82                	or     $0x82,%al
		asm("wrmsr" : : "a" (eax), "d" (edx), "c" (ecx));
     bdb:	0f 30                	wrmsr  
     bdd:	66 0f ba 2e cc 44 08 	btsl   $0x8,0x44cc

		set_bit(X86_FEATURE_CX8, cpu.flags);
		err = check_cpuflags();
     be4:	66 e8 af fe ff ff    	calll  a99 <check_cpuflags>
     bea:	66 89 c7             	mov    %eax,%edi
		   is_centaur() && cpu.model >= 6) {
     bed:	e9 d6 00             	jmp    cc6 <check_cpu+0x1e7>
	       cpu_vendor[1] == A32('i', 'n', 'e', 'T') &&
     bf0:	66 3d 47 65 6e 75    	cmp    $0x756e6547,%eax
     bf6:	75 53                	jne    c4b <check_cpu+0x16c>
	return cpu_vendor[0] == A32('G', 'e', 'n', 'u') &&
     bf8:	66 81 3e a4 44 69 6e 	cmpl   $0x54656e69,0x44a4
     bff:	65 54 
     c01:	75 48                	jne    c4b <check_cpu+0x16c>
	       cpu_vendor[1] == A32('i', 'n', 'e', 'T') &&
     c03:	66 81 3e a8 44 4d 78 	cmpl   $0x3638784d,0x44a8
     c0a:	38 36 
     c0c:	75 3d                	jne    c4b <check_cpu+0x16c>

		u32 ecx = 0x80860004;
		u32 eax, edx;
		u32 level = 1;

		asm("rdmsr" : "=a" (eax), "=d" (edx) : "c" (ecx));
     c0e:	66 bf 04 00 86 80    	mov    $0x80860004,%edi
     c14:	66 89 f9             	mov    %edi,%ecx
     c17:	0f 32                	rdmsr  
     c19:	67 66 89 54 24 04    	mov    %edx,0x4(%esp)
     c1f:	67 66 89 44 24 08    	mov    %eax,0x8(%esp)
		asm("wrmsr" : : "a" (~0), "d" (edx), "c" (ecx));
     c25:	66 83 c8 ff          	or     $0xffffffff,%eax
     c29:	0f 30                	wrmsr  
		asm("cpuid"
     c2b:	66 b8 01 00 00 00    	mov    $0x1,%eax
     c31:	0f a2                	cpuid  
     c33:	66 89 16 cc 44       	mov    %edx,0x44cc
		    : "+a" (level), "=d" (cpu.flags[0])
		    : : "ecx", "ebx");
		asm("wrmsr" : : "a" (eax), "d" (edx), "c" (ecx));
     c38:	67 66 8b 44 24 08    	mov    0x8(%esp),%eax
     c3e:	67 66 8b 54 24 04    	mov    0x4(%esp),%edx
     c44:	66 89 f9             	mov    %edi,%ecx
     c47:	0f 30                	wrmsr  

		err = check_cpuflags();
     c49:	eb 99                	jmp    be4 <check_cpu+0x105>
	} else if (err == 0x01 &&
     c4b:	66 83 e2 bf          	and    $0xffffffbf,%edx
     c4f:	75 7d                	jne    cce <check_cpu+0x1ef>
	       cpu_vendor[1] == A32('i', 'n', 'e', 'I') &&
     c51:	66 3d 47 65 6e 75    	cmp    $0x756e6547,%eax
     c57:	75 75                	jne    cce <check_cpu+0x1ef>
	return cpu_vendor[0] == A32('G', 'e', 'n', 'u') &&
     c59:	66 81 3e a4 44 69 6e 	cmpl   $0x49656e69,0x44a4
     c60:	65 49 
     c62:	75 6a                	jne    cce <check_cpu+0x1ef>
	       cpu_vendor[1] == A32('i', 'n', 'e', 'I') &&
     c64:	66 81 3e a8 44 6e 74 	cmpl   $0x6c65746e,0x44a8
     c6b:	65 6c 
     c6d:	75 5f                	jne    cce <check_cpu+0x1ef>
		   !(err_flags[0] & ~(1 << X86_FEATURE_PAE)) &&
		   is_intel() && cpu.level == 6 &&
     c6f:	66 83 3e c0 44 06    	cmpl   $0x6,0x44c0
     c75:	75 57                	jne    cce <check_cpu+0x1ef>
     c77:	66 a1 c8 44          	mov    0x44c8,%eax
     c7b:	66 83 e0 fb          	and    $0xfffffffb,%eax
		   (cpu.model == 9 || cpu.model == 13)) {
     c7f:	66 83 f8 09          	cmp    $0x9,%eax
     c83:	75 49                	jne    cce <check_cpu+0x1ef>
	return __cmdline_find_option(cmd_line_ptr, option, buffer, bufsize);
}

static inline int cmdline_find_option_bool(const char *option)
{
	unsigned long cmd_line_ptr = boot_params.hdr.cmd_line_ptr;
     c85:	66 a1 98 47          	mov    0x4798,%eax

	if (cmd_line_ptr >= 0x100000)
     c89:	66 3d ff ff 0f 00    	cmp    $0xfffff,%eax
     c8f:	76 16                	jbe    ca7 <check_cpu+0x1c8>
		/* PAE is disabled on this Pentium M but can be forced */
		if (cmdline_find_option_bool("forcepae")) {
			puts("WARNING: Forcing PAE in CPU flags\n");
     c91:	66 b8 a2 35 00 00    	mov    $0x35a2,%eax
     c97:	66 e8 20 f7 ff ff    	calll  3bd <puts>
     c9d:	66 0f ba 2e cc 44 06 	btsl   $0x6,0x44cc
			set_bit(X86_FEATURE_PAE, cpu.flags);
			err = check_cpuflags();
     ca4:	e9 3d ff             	jmp    be4 <check_cpu+0x105>
		return -1;      /* inaccessible */

	return __cmdline_find_option_bool(cmd_line_ptr, option);
     ca7:	66 ba c5 35 00 00    	mov    $0x35c5,%edx
     cad:	66 e8 b4 f9 ff ff    	calll  667 <__cmdline_find_option_bool>
		if (cmdline_find_option_bool("forcepae")) {
     cb3:	66 85 c0             	test   %eax,%eax
     cb6:	75 d9                	jne    c91 <check_cpu+0x1b2>
		}
		else {
			puts("WARNING: PAE disabled. Use parameter 'forcepae' to enable at your own risk!\n");
     cb8:	66 b8 ce 35 00 00    	mov    $0x35ce,%eax
     cbe:	66 e8 f9 f6 ff ff    	calll  3bd <puts>
		}
	}
	if (!err)
     cc4:	eb 08                	jmp    cce <check_cpu+0x1ef>
		err = check_knl_erratum();

	if (err_flags_ptr)
		*err_flags_ptr = err ? err_flags : NULL;
     cc6:	66 31 c0             	xor    %eax,%eax
	if (!err)
     cc9:	66 85 ff             	test   %edi,%edi
     ccc:	74 06                	je     cd4 <check_cpu+0x1f5>
		*err_flags_ptr = err ? err_flags : NULL;
     cce:	66 b8 20 45 00 00    	mov    $0x4520,%eax
	if (err_flags_ptr)
     cd4:	66 85 f6             	test   %esi,%esi
     cd7:	74 04                	je     cdd <check_cpu+0x1fe>
		*err_flags_ptr = err ? err_flags : NULL;
     cd9:	67 66 89 06          	mov    %eax,(%esi)
	if (cpu_level_ptr)
     cdd:	67 66 83 3c 24 00    	cmpl   $0x0,(%esp)
     ce3:	74 0d                	je     cf2 <check_cpu+0x213>
		*cpu_level_ptr = cpu.level;
     ce5:	66 a1 c0 44          	mov    0x44c0,%eax
     ce9:	67 66 8b 1c 24       	mov    (%esp),%ebx
     cee:	67 66 89 03          	mov    %eax,(%ebx)
	if (req_level_ptr)
     cf2:	66 85 ed             	test   %ebp,%ebp
     cf5:	74 09                	je     d00 <check_cpu+0x221>
		*req_level_ptr = req_level;
     cf7:	67 66 c7 45 00 40 00 	movl   $0x40,0x0(%ebp)
     cfe:	00 00 

	return (cpu.level < req_level || err) ? -1 : 0;
     d00:	66 83 3e c0 44 3f    	cmpl   $0x3f,0x44c0
     d06:	0f 9e c0             	setle  %al
     d09:	66 85 ff             	test   %edi,%edi
     d0c:	0f 95 c2             	setne  %dl
     d0f:	66 09 d0             	or     %edx,%eax
     d12:	66 0f b6 c0          	movzbl %al,%eax
     d16:	66 f7 d8             	neg    %eax
}
     d19:	66 83 c4 0c          	add    $0xc,%esp
     d1d:	66 5b                	pop    %ebx
     d1f:	66 5e                	pop    %esi
     d21:	66 5f                	pop    %edi
     d23:	66 5d                	pop    %ebp
     d25:	66 c3                	retl   

00000d27 <check_knl_erratum>:

int check_knl_erratum(void)
{
     d27:	f3 0f 1e fb          	endbr32 
	puts("This 32-bit kernel can not run on this Xeon Phi x200\n"
	     "processor due to a processor erratum.  Use a 64-bit\n"
	     "kernel, or enable PAE in this 32-bit kernel.\n\n");

	return -1;
}
     d2b:	66 31 c0             	xor    %eax,%eax
     d2e:	66 c3                	retl   

00000d30 <early_serial_init>:
#define DLH             1       /*  Divisor latch High        */

#define DEFAULT_BAUD 9600

static void early_serial_init(int port, int baud)
{
     d30:	66 55                	push   %ebp
     d32:	66 57                	push   %edi
     d34:	66 56                	push   %esi
     d36:	66 53                	push   %ebx
     d38:	66 89 c1             	mov    %eax,%ecx
     d3b:	66 89 d3             	mov    %edx,%ebx
	unsigned char c;
	unsigned divisor;

	outb(0x3, port + LCR);	/* 8n1 */
     d3e:	67 66 8d 78 03       	lea    0x3(%eax),%edi
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
     d43:	66 be 03 00 00 00    	mov    $0x3,%esi
     d49:	66 89 f0             	mov    %esi,%eax
     d4c:	66 89 fa             	mov    %edi,%edx
     d4f:	ee                   	out    %al,(%dx)
	outb(0, port + IER);	/* no interrupt */
     d50:	67 66 8d 69 01       	lea    0x1(%ecx),%ebp
     d55:	66 31 c0             	xor    %eax,%eax
     d58:	66 89 ea             	mov    %ebp,%edx
     d5b:	ee                   	out    %al,(%dx)
	outb(0, port + FCR);	/* no fifo */
     d5c:	67 66 8d 51 02       	lea    0x2(%ecx),%edx
     d61:	ee                   	out    %al,(%dx)
	outb(0x3, port + MCR);	/* DTR + RTS */
     d62:	67 66 8d 51 04       	lea    0x4(%ecx),%edx
     d67:	66 89 f0             	mov    %esi,%eax
     d6a:	ee                   	out    %al,(%dx)

	divisor	= 115200 / baud;
     d6b:	66 b8 00 c2 01 00    	mov    $0x1c200,%eax
     d71:	66 99                	cltd   
     d73:	66 f7 fb             	idiv   %ebx
     d76:	66 89 c3             	mov    %eax,%ebx
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
     d79:	66 89 fa             	mov    %edi,%edx
     d7c:	ec                   	in     (%dx),%al
     d7d:	66 89 c6             	mov    %eax,%esi
	c = inb(port + LCR);
	outb(c | DLAB, port + LCR);
     d80:	66 83 c8 80          	or     $0xffffff80,%eax
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
     d84:	ee                   	out    %al,(%dx)
     d85:	88 d8                	mov    %bl,%al
     d87:	66 89 ca             	mov    %ecx,%edx
     d8a:	ee                   	out    %al,(%dx)
	outb(divisor & 0xff, port + DLL);
	outb((divisor >> 8) & 0xff, port + DLH);
     d8b:	66 89 d8             	mov    %ebx,%eax
     d8e:	66 c1 e8 08          	shr    $0x8,%eax
     d92:	66 89 ea             	mov    %ebp,%edx
     d95:	ee                   	out    %al,(%dx)
     d96:	66 89 f0             	mov    %esi,%eax
     d99:	66 83 e0 7f          	and    $0x7f,%eax
     d9d:	66 89 fa             	mov    %edi,%edx
     da0:	ee                   	out    %al,(%dx)
	outb(c & ~DLAB, port + LCR);

	early_serial_base = port;
     da1:	66 89 0e 8c 55       	mov    %ecx,0x558c
}
     da6:	66 5b                	pop    %ebx
     da8:	66 5e                	pop    %esi
     daa:	66 5f                	pop    %edi
     dac:	66 5d                	pop    %ebp
     dae:	66 c3                	retl   

00000db0 <console_init>:
	if (port)
		early_serial_init(port, baud);
}

void console_init(void)
{
     db0:	f3 0f 1e fb          	endbr32 
     db4:	66 55                	push   %ebp
     db6:	66 57                	push   %edi
     db8:	66 56                	push   %esi
     dba:	66 53                	push   %ebx
     dbc:	66 83 ec 48          	sub    $0x48,%esp
	unsigned long cmd_line_ptr = boot_params.hdr.cmd_line_ptr;
     dc0:	66 a1 98 47          	mov    0x4798,%eax
	if (cmd_line_ptr >= 0x100000)
     dc4:	66 3d ff ff 0f 00    	cmp    $0xfffff,%eax
     dca:	0f 87 35 01          	ja     f03 <console_init+0x153>
	return __cmdline_find_option(cmd_line_ptr, option, buffer, bufsize);
     dce:	67 66 8d 7c 24 08    	lea    0x8(%esp),%edi
     dd4:	66 6a 20             	pushl  $0x20
     dd7:	66 89 f9             	mov    %edi,%ecx
     dda:	66 ba 6c 36 00 00    	mov    $0x366c,%edx
     de0:	66 e8 7b f7 ff ff    	calll  561 <__cmdline_find_option>
	if (cmdline_find_option("earlyprintk", arg, sizeof arg) > 0) {
     de6:	66 59                	pop    %ecx
     de8:	66 85 c0             	test   %eax,%eax
     deb:	0f 8e 14 01          	jle    f03 <console_init+0x153>
		if (!strncmp(arg, "serial", 6)) {
     def:	66 b9 06 00 00 00    	mov    $0x6,%ecx
     df5:	66 ba 78 36 00 00    	mov    $0x3678,%edx
     dfb:	66 89 f8             	mov    %edi,%eax
     dfe:	66 e8 60 0f 00 00    	calll  1d64 <strncmp>
			port = DEFAULT_SERIAL_PORT;
     e04:	66 83 f8 01          	cmp    $0x1,%eax
     e08:	66 19 f6             	sbb    %esi,%esi
     e0b:	66 81 e6 f8 03 00 00 	and    $0x3f8,%esi
     e12:	66 83 f8 01          	cmp    $0x1,%eax
     e16:	66 19 db             	sbb    %ebx,%ebx
     e19:	66 83 e3 06          	and    $0x6,%ebx
		if (arg[pos] == ',')
     e1d:	67 80 7c 1c 08 2c    	cmpb   $0x2c,0x8(%esp,%ebx,1)
     e23:	75 58                	jne    e7d <console_init+0xcd>
			pos++;
     e25:	66 43                	inc    %ebx
		if (pos == 7 && !strncmp(arg + pos, "0x", 2)) {
     e27:	66 83 fb 07          	cmp    $0x7,%ebx
     e2b:	75 50                	jne    e7d <console_init+0xcd>
     e2d:	67 66 8d 6c 24 0f    	lea    0xf(%esp),%ebp
     e33:	66 b9 02 00 00 00    	mov    $0x2,%ecx
     e39:	66 ba 7f 36 00 00    	mov    $0x367f,%edx
     e3f:	66 89 e8             	mov    %ebp,%eax
     e42:	66 e8 1c 0f 00 00    	calll  1d64 <strncmp>
     e48:	66 85 c0             	test   %eax,%eax
     e4b:	75 30                	jne    e7d <console_init+0xcd>
			port = simple_strtoull(arg + pos, &e, 16);
     e4d:	66 b9 10 00 00 00    	mov    $0x10,%ecx
     e53:	67 66 8d 54 24 04    	lea    0x4(%esp),%edx
     e59:	66 89 e8             	mov    %ebp,%eax
     e5c:	66 e8 88 0f 00 00    	calll  1dea <simple_strtoull>
     e62:	66 89 c6             	mov    %eax,%esi
			if (port == 0 || arg + pos == e)
     e65:	66 85 c0             	test   %eax,%eax
     e68:	74 50                	je     eba <console_init+0x10a>
     e6a:	67 66 8b 44 24 04    	mov    0x4(%esp),%eax
     e70:	66 39 e8             	cmp    %ebp,%eax
     e73:	74 45                	je     eba <console_init+0x10a>
				pos = e - arg;
     e75:	66 29 f8             	sub    %edi,%eax
     e78:	66 89 c3             	mov    %eax,%ebx
     e7b:	eb 43                	jmp    ec0 <console_init+0x110>
		} else if (!strncmp(arg + pos, "ttyS", 4)) {
     e7d:	67 66 8d 04 1f       	lea    (%edi,%ebx,1),%eax
     e82:	66 b9 04 00 00 00    	mov    $0x4,%ecx
     e88:	66 ba 82 36 00 00    	mov    $0x3682,%edx
     e8e:	66 e8 d0 0e 00 00    	calll  1d64 <strncmp>
     e94:	66 85 c0             	test   %eax,%eax
     e97:	75 27                	jne    ec0 <console_init+0x110>
			pos += 4;
     e99:	67 66 8d 43 04       	lea    0x4(%ebx),%eax
			if (arg[pos++] == '1')
     e9e:	66 83 c3 05          	add    $0x5,%ebx
     ea2:	67 80 7c 04 08 31    	cmpb   $0x31,0x8(%esp,%eax,1)
     ea8:	0f 94 c0             	sete   %al
     eab:	66 0f b6 c0          	movzbl %al,%eax
			port = bases[idx];
     eaf:	67 66 8b 34 85 a8 36 	mov    0x36a8(,%eax,4),%esi
     eb6:	00 00 
     eb8:	eb 06                	jmp    ec0 <console_init+0x110>
				port = DEFAULT_SERIAL_PORT;
     eba:	66 be f8 03 00 00    	mov    $0x3f8,%esi
		if (arg[pos] == ',')
     ec0:	67 80 7c 1c 08 2c    	cmpb   $0x2c,0x8(%esp,%ebx,1)
     ec6:	75 02                	jne    eca <console_init+0x11a>
			pos++;
     ec8:	66 43                	inc    %ebx
		baud = simple_strtoull(arg + pos, &e, 0);
     eca:	66 01 fb             	add    %edi,%ebx
     ecd:	66 31 c9             	xor    %ecx,%ecx
     ed0:	67 66 8d 54 24 04    	lea    0x4(%esp),%edx
     ed6:	66 89 d8             	mov    %ebx,%eax
     ed9:	66 e8 0b 0f 00 00    	calll  1dea <simple_strtoull>
     edf:	66 89 c2             	mov    %eax,%edx
		if (baud == 0 || arg + pos == e)
     ee2:	66 85 c0             	test   %eax,%eax
     ee5:	74 08                	je     eef <console_init+0x13f>
     ee7:	67 66 3b 5c 24 04    	cmp    0x4(%esp),%ebx
     eed:	75 06                	jne    ef5 <console_init+0x145>
			baud = DEFAULT_BAUD;
     eef:	66 ba 80 25 00 00    	mov    $0x2580,%edx
	if (port)
     ef5:	66 85 f6             	test   %esi,%esi
     ef8:	74 09                	je     f03 <console_init+0x153>
		early_serial_init(port, baud);
     efa:	66 89 f0             	mov    %esi,%eax
     efd:	66 e8 2d fe ff ff    	calll  d30 <early_serial_init>
	parse_earlyprintk();

	if (!early_serial_base)
     f03:	66 83 3e 8c 55 00    	cmpl   $0x0,0x558c
     f09:	0f 85 0a 01          	jne    1017 <SYSSEG+0x17>
	unsigned long cmd_line_ptr = boot_params.hdr.cmd_line_ptr;
     f0d:	66 a1 98 47          	mov    0x4798,%eax
	if (cmd_line_ptr >= 0x100000)
     f11:	66 3d ff ff 0f 00    	cmp    $0xfffff,%eax
     f17:	0f 87 fc 00          	ja     1017 <SYSSEG+0x17>
	return __cmdline_find_option(cmd_line_ptr, option, buffer, bufsize);
     f1b:	67 66 8d 5c 24 08    	lea    0x8(%esp),%ebx
     f21:	66 6a 40             	pushl  $0x40
     f24:	66 89 d9             	mov    %ebx,%ecx
     f27:	66 ba 87 36 00 00    	mov    $0x3687,%edx
     f2d:	66 e8 2e f6 ff ff    	calll  561 <__cmdline_find_option>
	if (cmdline_find_option("console", optstr, sizeof optstr) <= 0)
     f33:	66 5a                	pop    %edx
     f35:	66 85 c0             	test   %eax,%eax
     f38:	0f 8e db 00          	jle    1017 <SYSSEG+0x17>
	options = optstr;
     f3c:	67 66 89 5c 24 04    	mov    %ebx,0x4(%esp)
	if (!strncmp(options, "uart8250,io,", 12))
     f42:	66 b9 0c 00 00 00    	mov    $0xc,%ecx
     f48:	66 ba 8f 36 00 00    	mov    $0x368f,%edx
     f4e:	66 89 d8             	mov    %ebx,%eax
     f51:	66 e8 0d 0e 00 00    	calll  1d64 <strncmp>
     f57:	66 85 c0             	test   %eax,%eax
     f5a:	67 66 8b 44 24 04    	mov    0x4(%esp),%eax
     f60:	75 06                	jne    f68 <console_init+0x1b8>
		port = simple_strtoull(options + 12, &options, 0);
     f62:	66 83 c0 0c          	add    $0xc,%eax
     f66:	eb 23                	jmp    f8b <console_init+0x1db>
	else if (!strncmp(options, "uart,io,", 8))
     f68:	66 b9 08 00 00 00    	mov    $0x8,%ecx
     f6e:	66 ba 9c 36 00 00    	mov    $0x369c,%edx
     f74:	66 e8 ea 0d 00 00    	calll  1d64 <strncmp>
     f7a:	66 85 c0             	test   %eax,%eax
     f7d:	0f 85 96 00          	jne    1017 <SYSSEG+0x17>
		port = simple_strtoull(options + 8, &options, 0);
     f81:	67 66 8b 44 24 04    	mov    0x4(%esp),%eax
     f87:	66 83 c0 08          	add    $0x8,%eax
     f8b:	66 31 c9             	xor    %ecx,%ecx
     f8e:	67 66 8d 54 24 04    	lea    0x4(%esp),%edx
     f94:	66 e8 50 0e 00 00    	calll  1dea <simple_strtoull>
     f9a:	66 89 c3             	mov    %eax,%ebx
	if (options && (options[0] == ','))
     f9d:	67 66 8b 44 24 04    	mov    0x4(%esp),%eax
     fa3:	66 85 c0             	test   %eax,%eax
     fa6:	74 19                	je     fc1 <console_init+0x211>
     fa8:	67 80 38 2c          	cmpb   $0x2c,(%eax)
     fac:	75 13                	jne    fc1 <console_init+0x211>
		baud = simple_strtoull(options + 1, &options, 0);
     fae:	66 40                	inc    %eax
     fb0:	66 31 c9             	xor    %ecx,%ecx
     fb3:	67 66 8d 54 24 04    	lea    0x4(%esp),%edx
     fb9:	66 e8 2b 0e 00 00    	calll  1dea <simple_strtoull>
     fbf:	eb 45                	jmp    1006 <SYSSEG+0x6>
	lcr = inb(port + LCR);
     fc1:	67 66 8d 73 03       	lea    0x3(%ebx),%esi
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
     fc6:	66 89 f2             	mov    %esi,%edx
     fc9:	ec                   	in     (%dx),%al
     fca:	66 89 c7             	mov    %eax,%edi
	outb(lcr | DLAB, port + LCR);
     fcd:	66 83 c8 80          	or     $0xffffff80,%eax
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
     fd1:	ee                   	out    %al,(%dx)
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
     fd2:	66 89 da             	mov    %ebx,%edx
     fd5:	ec                   	in     (%dx),%al
     fd6:	67 88 44 24 03       	mov    %al,0x3(%esp)
	dlh = inb(port + DLH);
     fdb:	67 66 8d 53 01       	lea    0x1(%ebx),%edx
     fe0:	ec                   	in     (%dx),%al
     fe1:	66 0f b6 c8          	movzbl %al,%ecx
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
     fe5:	66 89 f8             	mov    %edi,%eax
     fe8:	66 89 f2             	mov    %esi,%edx
     feb:	ee                   	out    %al,(%dx)
	quot = (dlh << 8) | dll;
     fec:	66 c1 e1 08          	shl    $0x8,%ecx
     ff0:	67 66 0f b6 44 24 03 	movzbl 0x3(%esp),%eax
     ff7:	66 09 c1             	or     %eax,%ecx
	return BASE_BAUD / quot;
     ffa:	66 b8 00 c2 01 00    	mov    $0x1c200,%eax
		baud = probe_baud(port);
    1000:	66 31 d2             	xor    %edx,%edx
    1003:	66 f7 f1             	div    %ecx
	if (port)
    1006:	66 85 db             	test   %ebx,%ebx
    1009:	74 0c                	je     1017 <SYSSEG+0x17>
		early_serial_init(port, baud);
    100b:	66 89 c2             	mov    %eax,%edx
    100e:	66 89 d8             	mov    %ebx,%eax
    1011:	66 e8 19 fd ff ff    	calll  d30 <early_serial_init>
		parse_console_uart8250();
}
    1017:	66 83 c4 48          	add    $0x48,%esp
    101b:	66 5b                	pop    %ebx
    101d:	66 5e                	pop    %esi
    101f:	66 5f                	pop    %edi
    1021:	66 5d                	pop    %ebp
    1023:	66 c3                	retl   

00001025 <query_edd>:

	return 0;
}

void query_edd(void)
{
    1025:	f3 0f 1e fb          	endbr32 
    1029:	66 55                	push   %ebp
    102b:	66 57                	push   %edi
    102d:	66 56                	push   %esi
    102f:	66 53                	push   %ebx
    1031:	66 81 ec c8 00 00 00 	sub    $0xc8,%esp
	unsigned long cmd_line_ptr = boot_params.hdr.cmd_line_ptr;
    1038:	66 a1 98 47          	mov    0x4798,%eax
	if (cmd_line_ptr >= 0x100000)
    103c:	66 3d ff ff 0f 00    	cmp    $0xfffff,%eax
    1042:	76 06                	jbe    104a <query_edd+0x25>
	char eddarg[8];
	int do_mbr = 1;
#ifdef CONFIG_EDD_OFF
	int do_edd = 0;
    1044:	66 31 db             	xor    %ebx,%ebx
    1047:	e9 8d 00             	jmp    10d7 <query_edd+0xb2>
	return __cmdline_find_option(cmd_line_ptr, option, buffer, bufsize);
    104a:	66 6a 08             	pushl  $0x8
    104d:	67 66 8d 4c 24 18    	lea    0x18(%esp),%ecx
    1053:	66 ba b0 36 00 00    	mov    $0x36b0,%edx
    1059:	66 e8 02 f5 ff ff    	calll  561 <__cmdline_find_option>
	int be_quiet;
	int devno;
	struct edd_info ei, *edp;
	u32 *mbrptr;

	if (cmdline_find_option("edd", eddarg, sizeof eddarg) > 0) {
    105f:	66 59                	pop    %ecx
    1061:	66 85 c0             	test   %eax,%eax
    1064:	7e de                	jle    1044 <query_edd+0x1f>
		if (!strcmp(eddarg, "skipmbr") || !strcmp(eddarg, "skip")) {
    1066:	66 ba b4 36 00 00    	mov    $0x36b4,%edx
    106c:	67 66 8d 44 24 14    	lea    0x14(%esp),%eax
    1072:	66 e8 b3 0c 00 00    	calll  1d2b <strcmp>
    1078:	66 85 c0             	test   %eax,%eax
    107b:	75 11                	jne    108e <query_edd+0x69>
			do_edd = 1;
    107d:	66 bb 01 00 00 00    	mov    $0x1,%ebx
			do_mbr = 0;
    1083:	67 66 c7 04 24 00 00 	movl   $0x0,(%esp)
    108a:	00 00 
    108c:	eb 52                	jmp    10e0 <query_edd+0xbb>
		if (!strcmp(eddarg, "skipmbr") || !strcmp(eddarg, "skip")) {
    108e:	66 ba bc 36 00 00    	mov    $0x36bc,%edx
    1094:	67 66 8d 44 24 14    	lea    0x14(%esp),%eax
    109a:	66 e8 8b 0c 00 00    	calll  1d2b <strcmp>
    10a0:	66 85 c0             	test   %eax,%eax
    10a3:	74 d8                	je     107d <query_edd+0x58>
		}
		else if (!strcmp(eddarg, "off"))
    10a5:	66 ba c1 36 00 00    	mov    $0x36c1,%edx
    10ab:	67 66 8d 44 24 14    	lea    0x14(%esp),%eax
    10b1:	66 e8 74 0c 00 00    	calll  1d2b <strcmp>
    10b7:	66 85 c0             	test   %eax,%eax
    10ba:	74 88                	je     1044 <query_edd+0x1f>
			do_edd = 0;
		else if (!strcmp(eddarg, "on"))
    10bc:	66 ba c5 36 00 00    	mov    $0x36c5,%edx
    10c2:	67 66 8d 44 24 14    	lea    0x14(%esp),%eax
    10c8:	66 e8 5d 0c 00 00    	calll  1d2b <strcmp>
    10ce:	66 31 db             	xor    %ebx,%ebx
    10d1:	66 85 c0             	test   %eax,%eax
    10d4:	0f 94 c3             	sete   %bl
	int do_mbr = 1;
    10d7:	67 66 c7 04 24 01 00 	movl   $0x1,(%esp)
    10de:	00 00 
	unsigned long cmd_line_ptr = boot_params.hdr.cmd_line_ptr;
    10e0:	66 a1 98 47          	mov    0x4798,%eax
	if (cmd_line_ptr >= 0x100000)
    10e4:	66 3d ff ff 0f 00    	cmp    $0xfffff,%eax
    10ea:	0f 87 84 02          	ja     1372 <query_edd+0x34d>
	return __cmdline_find_option_bool(cmd_line_ptr, option);
    10ee:	66 ba c8 36 00 00    	mov    $0x36c8,%edx
    10f4:	66 e8 6d f5 ff ff    	calll  667 <__cmdline_find_option_bool>
    10fa:	67 66 89 44 24 04    	mov    %eax,0x4(%esp)
	be_quiet = cmdline_find_option_bool("quiet");

	edp    = boot_params.eddbuf;
	mbrptr = boot_params.edd_mbr_sig_buffer;

	if (!do_edd)
    1100:	66 85 db             	test   %ebx,%ebx
    1103:	0f 84 7d 02          	je     1384 <query_edd+0x35f>

	/* Bugs in OnBoard or AddOnCards Bios may hang the EDD probe,
	 * so give a hint if this happens.
	 */

	if (!be_quiet)
    1107:	66 85 c0             	test   %eax,%eax
    110a:	75 0e                	jne    111a <query_edd+0xf5>
		printf("Probing EDD (edd=off to disable)... ");
    110c:	66 68 ce 36 00 00    	pushl  $0x36ce
    1112:	66 e8 5c 0b 00 00    	calll  1c74 <printf>
    1118:	66 5a                	pop    %edx
		return -1;      /* inaccessible */
    111a:	66 bd 00 48 00 00    	mov    $0x4800,%ebp
    1120:	67 66 c7 44 24 08 70 	movl   $0x5270,0x8(%esp)
    1127:	52 00 00 
    112a:	66 bb 80 00 00 00    	mov    $0x80,%ebx
	asm("movw %%ds,%0" : "=rm" (seg));
    1130:	8c d8                	mov    %ds,%ax
	buf_base = (ds() << 4) + (u32)&_end;
    1132:	66 0f b7 c0          	movzwl %ax,%eax
    1136:	67 66 89 44 24 10    	mov    %eax,0x10(%esp)
	for (devno = 0x80; devno < 0x80+EDD_MBR_SIG_MAX; devno++) {
		/*
		 * Scan the BIOS-supported hard disks and query EDD
		 * information...
		 */
		if (!get_edd_info(devno, &ei)
    113c:	67 88 5c 24 0c       	mov    %bl,0xc(%esp)
	memset(ei, 0, sizeof *ei);
    1141:	67 66 8d 54 24 76    	lea    0x76(%esp),%edx
    1147:	66 b9 52 00 00 00    	mov    $0x52,%ecx
    114d:	66 31 c0             	xor    %eax,%eax
    1150:	66 89 d7             	mov    %edx,%edi
    1153:	f3 aa                	rep stos %al,%es:(%di)
	initregs(&ireg);
    1155:	67 66 8d 44 24 1c    	lea    0x1c(%esp),%eax
    115b:	66 e8 55 0b 00 00    	calll  1cb6 <initregs>
	ireg.ah = 0x41;
    1161:	67 c6 44 24 39 41    	movb   $0x41,0x39(%esp)
	ireg.bx = EDDMAGIC1;
    1167:	67 c7 44 24 2c aa 55 	movw   $0x55aa,0x2c(%esp)
	ireg.dl = devno;
    116e:	67 88 5c 24 30       	mov    %bl,0x30(%esp)
	intcall(0x13, &ireg, &oreg);
    1173:	67 66 8d 4c 24 48    	lea    0x48(%esp),%ecx
    1179:	67 66 8d 54 24 1c    	lea    0x1c(%esp),%edx
    117f:	66 b8 13 00 00 00    	mov    $0x13,%eax
    1185:	66 e8 45 f1 ff ff    	calll  2d0 <intcall>
	if (oreg.eflags & X86_EFLAGS_CF)
    118b:	67 f6 44 24 70 01    	testb  $0x1,0x70(%esp)
    1191:	0f 85 db 00          	jne    1270 <query_edd+0x24b>
	if (oreg.bx != EDDMAGIC2)
    1195:	67 81 7c 24 58 55 aa 	cmpw   $0xaa55,0x58(%esp)
    119c:	0f 85 d0 00          	jne    1270 <query_edd+0x24b>
	ei->device  = devno;
    11a0:	67 88 5c 24 76       	mov    %bl,0x76(%esp)
	ei->version = oreg.ah;		 /* EDD version number */
    11a5:	67 8a 44 24 65       	mov    0x65(%esp),%al
    11aa:	67 88 44 24 77       	mov    %al,0x77(%esp)
	ei->interface_support = oreg.cx; /* EDD functionality subsets */
    11af:	67 66 8b 44 24 60    	mov    0x60(%esp),%eax
    11b5:	67 89 44 24 78       	mov    %ax,0x78(%esp)
	ei->params.length = sizeof(ei->params);
    11ba:	67 c7 44 24 7e 4a 00 	movw   $0x4a,0x7e(%esp)
	ireg.ah = 0x48;
    11c1:	67 c6 44 24 39 48    	movb   $0x48,0x39(%esp)
	ireg.si = (size_t)&ei->params;
    11c7:	67 66 8d 44 24 7e    	lea    0x7e(%esp),%eax
    11cd:	67 89 44 24 20       	mov    %ax,0x20(%esp)
	intcall(0x13, &ireg, &oreg);
    11d2:	67 66 8d 4c 24 48    	lea    0x48(%esp),%ecx
    11d8:	67 66 8d 54 24 1c    	lea    0x1c(%esp),%edx
    11de:	66 b8 13 00 00 00    	mov    $0x13,%eax
    11e4:	66 e8 e6 f0 ff ff    	calll  2d0 <intcall>
	ireg.ah = 0x08;
    11ea:	67 c6 44 24 39 08    	movb   $0x8,0x39(%esp)
	ireg.es = 0;
    11f0:	67 c7 44 24 40 00 00 	movw   $0x0,0x40(%esp)
	intcall(0x13, &ireg, &oreg);
    11f7:	67 66 8d 4c 24 48    	lea    0x48(%esp),%ecx
    11fd:	67 66 8d 54 24 1c    	lea    0x1c(%esp),%edx
    1203:	66 b8 13 00 00 00    	mov    $0x13,%eax
    1209:	66 e8 c1 f0 ff ff    	calll  2d0 <intcall>
	if (!(oreg.eflags & X86_EFLAGS_CF)) {
    120f:	67 f6 44 24 70 01    	testb  $0x1,0x70(%esp)
    1215:	75 33                	jne    124a <query_edd+0x225>
		ei->legacy_max_cylinder = oreg.ch + ((oreg.cl & 0xc0) << 2);
    1217:	67 8a 54 24 60       	mov    0x60(%esp),%dl
    121c:	67 66 8d 04 95 00 00 	lea    0x0(,%edx,4),%eax
    1223:	00 00 
    1225:	25 00 03             	and    $0x300,%ax
    1228:	67 66 0f b6 4c 24 61 	movzbl 0x61(%esp),%ecx
    122f:	66 01 c8             	add    %ecx,%eax
    1232:	67 89 44 24 7a       	mov    %ax,0x7a(%esp)
		ei->legacy_max_head = oreg.dh;
    1237:	67 8a 44 24 5d       	mov    0x5d(%esp),%al
    123c:	67 88 44 24 7c       	mov    %al,0x7c(%esp)
		ei->legacy_sectors_per_track = oreg.cl & 0x3f;
    1241:	66 83 e2 3f          	and    $0x3f,%edx
    1245:	67 88 54 24 7d       	mov    %dl,0x7d(%esp)
		    && boot_params.eddbuf_entries < EDDMAXNR) {
    124a:	80 3e 59 47 05       	cmpb   $0x5,0x4759
    124f:	77 1f                	ja     1270 <query_edd+0x24b>
			memcpy(edp, &ei, sizeof ei);
    1251:	67 66 8d 74 24 76    	lea    0x76(%esp),%esi
    1257:	66 b9 52 00 00 00    	mov    $0x52,%ecx
    125d:	67 66 8b 7c 24 08    	mov    0x8(%esp),%edi
    1263:	f3 a4                	rep movsb %ds:(%si),%es:(%di)
			edp++;
    1265:	67 66 83 44 24 08 52 	addl   $0x52,0x8(%esp)
			boot_params.eddbuf_entries++;
    126c:	fe 06 59 47          	incb   0x4759
		}

		if (do_mbr && !read_mbr_sig(devno, &ei, mbrptr++))
    1270:	67 66 89 6c 24 0c    	mov    %ebp,0xc(%esp)
    1276:	67 66 83 3c 24 00    	cmpl   $0x0,(%esp)
    127c:	0f 84 c5 00          	je     1345 <query_edd+0x320>
    1280:	67 66 8d 45 04       	lea    0x4(%ebp),%eax
    1285:	67 66 89 44 24 0c    	mov    %eax,0xc(%esp)
	sector_size = ei->params.bytes_per_sector;
    128b:	67 66 0f b7 8c 24 96 	movzwl 0x96(%esp),%ecx
    1292:	00 00 00 
	if (!sector_size)
    1295:	66 85 c9             	test   %ecx,%ecx
    1298:	75 06                	jne    12a0 <query_edd+0x27b>
		sector_size = 512; /* Best available guess */
    129a:	66 b9 00 02 00 00    	mov    $0x200,%ecx
	if (!(boot_params.hdr.loadflags & CAN_USE_HEAP))
    12a0:	80 3e 81 47 00       	cmpb   $0x0,0x4781
    12a5:	0f 89 9c 00          	jns    1345 <query_edd+0x320>
	buf_base = (ds() << 4) + (u32)&_end;
    12a9:	67 66 8b 44 24 10    	mov    0x10(%esp),%eax
    12af:	66 c1 e0 04          	shl    $0x4,%eax
	mbr_base = (buf_base+sector_size-1) & ~(sector_size-1);
    12b3:	67 66 8d b4 01 bf 57 	lea    0x57bf(%ecx,%eax,1),%esi
    12ba:	00 00 
    12bc:	66 89 ca             	mov    %ecx,%edx
    12bf:	66 f7 da             	neg    %edx
    12c2:	66 21 d6             	and    %edx,%esi
	mbrbuf_ptr = _end + (mbr_base-buf_base);
    12c5:	66 29 c6             	sub    %eax,%esi
	mbrbuf_end = mbrbuf_ptr + sector_size;
    12c8:	67 66 8d 14 0e       	lea    (%esi,%ecx,1),%edx
	if (mbrbuf_end > (char *)(size_t)boot_params.hdr.heap_end_ptr)
    12cd:	66 0f b7 06 94 47    	movzwl 0x4794,%eax
    12d3:	66 39 c2             	cmp    %eax,%edx
    12d6:	77 6d                	ja     1345 <query_edd+0x320>
	memset(mbrbuf_ptr, 0, sector_size);
    12d8:	66 31 c0             	xor    %eax,%eax
    12db:	66 89 f7             	mov    %esi,%edi
    12de:	f3 aa                	rep stos %al,%es:(%di)
	initregs(&ireg);
    12e0:	67 66 8d 44 24 1c    	lea    0x1c(%esp),%eax
    12e6:	66 e8 ca 09 00 00    	calll  1cb6 <initregs>
	ireg.ax = 0x0201;		/* Legacy Read, one sector */
    12ec:	67 c7 44 24 38 01 02 	movw   $0x201,0x38(%esp)
	ireg.cx = 0x0001;		/* Sector 0-0-1 */
    12f3:	67 c7 44 24 34 01 00 	movw   $0x1,0x34(%esp)
	ireg.dl = devno;
    12fa:	67 88 5c 24 30       	mov    %bl,0x30(%esp)
	ireg.bx = (size_t)buf;
    12ff:	67 89 74 24 2c       	mov    %si,0x2c(%esp)
	intcall(0x13, &ireg, &oreg);
    1304:	67 66 8d 4c 24 48    	lea    0x48(%esp),%ecx
    130a:	67 66 8d 54 24 1c    	lea    0x1c(%esp),%edx
    1310:	66 b8 13 00 00 00    	mov    $0x13,%eax
    1316:	66 e8 b4 ef ff ff    	calll  2d0 <intcall>
	if (read_mbr(devno, mbrbuf_ptr))
    131c:	67 f6 44 24 70 01    	testb  $0x1,0x70(%esp)
    1322:	75 21                	jne    1345 <query_edd+0x320>
	*mbrsig = *(u32 *)&mbrbuf_ptr[EDD_MBR_SIG_OFFSET];
    1324:	67 66 8b 86 b8 01 00 	mov    0x1b8(%esi),%eax
    132b:	00 
    132c:	67 66 89 45 00       	mov    %eax,0x0(%ebp)
	return mbr_magic == 0xAA55 ? 0 : -1;
    1331:	67 81 be fe 01 00 00 	cmpw   $0xaa55,0x1fe(%esi)
    1338:	55 aa 
    133a:	75 09                	jne    1345 <query_edd+0x320>
			boot_params.edd_mbr_sig_buf_entries = devno-0x80+1;
    133c:	88 d8                	mov    %bl,%al
    133e:	66 83 e8 7f          	sub    $0x7f,%eax
    1342:	a2 5a 47             	mov    %al,0x475a
	for (devno = 0x80; devno < 0x80+EDD_MBR_SIG_MAX; devno++) {
    1345:	66 43                	inc    %ebx
    1347:	66 81 fb 90 00 00 00 	cmp    $0x90,%ebx
    134e:	74 09                	je     1359 <query_edd+0x334>
    1350:	67 66 8b 6c 24 0c    	mov    0xc(%esp),%ebp
    1356:	e9 e3 fd             	jmp    113c <query_edd+0x117>
	}

	if (!be_quiet)
    1359:	67 66 83 7c 24 04 00 	cmpl   $0x0,0x4(%esp)
    1360:	75 22                	jne    1384 <query_edd+0x35f>
		printf("ok\n");
    1362:	66 68 f3 36 00 00    	pushl  $0x36f3
    1368:	66 e8 06 09 00 00    	calll  1c74 <printf>
    136e:	66 58                	pop    %eax
    1370:	eb 12                	jmp    1384 <query_edd+0x35f>
	if (!do_edd)
    1372:	66 85 db             	test   %ebx,%ebx
    1375:	74 0d                	je     1384 <query_edd+0x35f>
		return -1;      /* inaccessible */
    1377:	67 66 c7 44 24 04 ff 	movl   $0xffffffff,0x4(%esp)
    137e:	ff ff ff 
    1381:	e9 96 fd             	jmp    111a <query_edd+0xf5>
}
    1384:	66 81 c4 c8 00 00 00 	add    $0xc8,%esp
    138b:	66 5b                	pop    %ebx
    138d:	66 5e                	pop    %esi
    138f:	66 5f                	pop    %edi
    1391:	66 5d                	pop    %ebp
    1393:	66 c3                	retl   

00001395 <detect_memory>:

	return -(oreg.eflags & X86_EFLAGS_CF); /* 0 or -1 */
}

int detect_memory(void)
{
    1395:	f3 0f 1e fb          	endbr32 
    1399:	66 57                	push   %edi
    139b:	66 56                	push   %esi
    139d:	66 53                	push   %ebx
    139f:	66 83 ec 58          	sub    $0x58,%esp
	initregs(&ireg);
    13a3:	66 89 e0             	mov    %esp,%eax
    13a6:	66 e8 0a 09 00 00    	calll  1cb6 <initregs>
	ireg.ax  = 0xe820;
    13ac:	67 c7 44 24 1c 20 e8 	movw   $0xe820,0x1c(%esp)
	ireg.cx  = sizeof buf;
    13b3:	67 c7 44 24 18 14 00 	movw   $0x14,0x18(%esp)
	ireg.edx = SMAP;
    13ba:	67 66 c7 44 24 14 50 	movl   $0x534d4150,0x14(%esp)
    13c1:	41 4d 53 
	ireg.di  = (size_t)&buf;
    13c4:	66 b8 70 55 00 00    	mov    $0x5570,%eax
    13ca:	67 89 04 24          	mov    %ax,(%esp)
	int count = 0;
    13ce:	66 31 db             	xor    %ebx,%ebx
		intcall(0x15, &ireg, &oreg);
    13d1:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    13d7:	66 89 e2             	mov    %esp,%edx
    13da:	66 b8 15 00 00 00    	mov    $0x15,%eax
    13e0:	66 e8 ea ee ff ff    	calll  2d0 <intcall>
		ireg.ebx = oreg.ebx; /* for next iteration... */
    13e6:	67 66 8b 44 24 3c    	mov    0x3c(%esp),%eax
    13ec:	67 66 89 44 24 10    	mov    %eax,0x10(%esp)
		if (oreg.eflags & X86_EFLAGS_CF)
    13f2:	67 f6 44 24 54 01    	testb  $0x1,0x54(%esp)
    13f8:	75 3b                	jne    1435 <detect_memory+0xa0>
		if (oreg.eax != SMAP) {
    13fa:	67 66 81 7c 24 48 50 	cmpl   $0x534d4150,0x48(%esp)
    1401:	41 4d 53 
    1404:	75 2c                	jne    1432 <detect_memory+0x9d>
		*desc++ = buf;
    1406:	66 6b fb 14          	imul   $0x14,%ebx,%edi
    140a:	66 81 c7 40 48 00 00 	add    $0x4840,%edi
    1411:	66 be 70 55 00 00    	mov    $0x5570,%esi
    1417:	66 b9 05 00 00 00    	mov    $0x5,%ecx
    141d:	66 f3 a5             	rep movsl %ds:(%si),%es:(%di)
		count++;
    1420:	66 43                	inc    %ebx
	} while (ireg.ebx && count < ARRAY_SIZE(boot_params.e820_table));
    1422:	66 85 c0             	test   %eax,%eax
    1425:	74 0e                	je     1435 <detect_memory+0xa0>
    1427:	66 81 fb 80 00 00 00 	cmp    $0x80,%ebx
    142e:	75 a1                	jne    13d1 <detect_memory+0x3c>
    1430:	eb 03                	jmp    1435 <detect_memory+0xa0>
			count = 0;
    1432:	66 31 db             	xor    %ebx,%ebx
	return boot_params.e820_entries = count;
    1435:	88 1e 58 47          	mov    %bl,0x4758
	int err = -1;

	if (detect_memory_e820() > 0)
    1439:	66 85 db             	test   %ebx,%ebx
    143c:	0f 94 c3             	sete   %bl
    143f:	66 0f b6 db          	movzbl %bl,%ebx
    1443:	66 f7 db             	neg    %ebx
	initregs(&ireg);
    1446:	66 89 e0             	mov    %esp,%eax
    1449:	66 e8 67 08 00 00    	calll  1cb6 <initregs>
	ireg.ax = 0xe801;
    144f:	67 c7 44 24 1c 01 e8 	movw   $0xe801,0x1c(%esp)
	intcall(0x15, &ireg, &oreg);
    1456:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    145c:	66 89 e2             	mov    %esp,%edx
    145f:	66 b8 15 00 00 00    	mov    $0x15,%eax
    1465:	66 e8 65 ee ff ff    	calll  2d0 <intcall>
	if (oreg.eflags & X86_EFLAGS_CF)
    146b:	67 f6 44 24 54 01    	testb  $0x1,0x54(%esp)
    1471:	75 43                	jne    14b6 <detect_memory+0x121>
	if (oreg.cx || oreg.dx) {
    1473:	67 66 8b 54 24 44    	mov    0x44(%esp),%edx
    1479:	67 66 8b 44 24 40    	mov    0x40(%esp),%eax
    147f:	66 89 d6             	mov    %edx,%esi
    1482:	09 c6                	or     %ax,%si
    1484:	74 0a                	je     1490 <detect_memory+0xfb>
		oreg.ax = oreg.cx;
    1486:	67 89 54 24 48       	mov    %dx,0x48(%esp)
		oreg.bx = oreg.dx;
    148b:	67 89 44 24 3c       	mov    %ax,0x3c(%esp)
	if (oreg.ax > 15*1024) {
    1490:	67 66 0f b7 44 24 48 	movzwl 0x48(%esp),%eax
    1497:	3d 00 3c             	cmp    $0x3c00,%ax
    149a:	77 1a                	ja     14b6 <detect_memory+0x121>
	} else if (oreg.ax == 15*1024) {
    149c:	75 11                	jne    14af <detect_memory+0x11a>
		boot_params.alt_mem_k = (oreg.bx << 6) + oreg.ax;
    149e:	67 66 0f b7 44 24 3c 	movzwl 0x3c(%esp),%eax
    14a5:	66 c1 e0 06          	shl    $0x6,%eax
    14a9:	66 05 00 3c 00 00    	add    $0x3c00,%eax
		boot_params.alt_mem_k = oreg.ax;
    14af:	66 a3 50 47          	mov    %eax,0x4750
		err = 0;

	if (!detect_memory_e801())
		err = 0;
    14b3:	66 31 db             	xor    %ebx,%ebx
	initregs(&ireg);
    14b6:	66 89 e0             	mov    %esp,%eax
    14b9:	66 e8 f7 07 00 00    	calll  1cb6 <initregs>
	ireg.ah = 0x88;
    14bf:	67 c6 44 24 1d 88    	movb   $0x88,0x1d(%esp)
	intcall(0x15, &ireg, &oreg);
    14c5:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    14cb:	66 89 e2             	mov    %esp,%edx
    14ce:	66 b8 15 00 00 00    	mov    $0x15,%eax
    14d4:	66 e8 f6 ed ff ff    	calll  2d0 <intcall>
	boot_params.screen_info.ext_mem_k = oreg.ax;
    14da:	67 66 8b 44 24 48    	mov    0x48(%esp),%eax
    14e0:	a3 72 45             	mov    %ax,0x4572

	if (!detect_memory_88())
    14e3:	67 f6 44 24 54 01    	testb  $0x1,0x54(%esp)
    14e9:	75 03                	jne    14ee <detect_memory+0x159>
		err = 0;
    14eb:	66 31 db             	xor    %ebx,%ebx

	return err;
}
    14ee:	66 89 d8             	mov    %ebx,%eax
    14f1:	66 83 c4 58          	add    $0x58,%esp
    14f5:	66 5b                	pop    %ebx
    14f7:	66 5e                	pop    %esi
    14f9:	66 5f                	pop    %edi
    14fb:	66 c3                	retl   

000014fd <go_to_protected_mode>:

/*
 * Actual invocation sequence
 */
void go_to_protected_mode(void)
{
    14fd:	f3 0f 1e fb          	endbr32 
    1501:	66 53                	push   %ebx
	if (boot_params.hdr.realmode_swtch) {
    1503:	66 83 3e 78 47 00    	cmpl   $0x0,0x4778
    1509:	74 06                	je     1511 <go_to_protected_mode+0x14>
		asm volatile("lcallw *%0"
    150b:	ff 1e 78 47          	lcall  *0x4778
    150f:	eb 07                	jmp    1518 <go_to_protected_mode+0x1b>
		asm volatile("cli");
    1511:	fa                   	cli    
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
    1512:	b0 80                	mov    $0x80,%al
    1514:	e6 70                	out    %al,$0x70
	asm volatile("outb %%al,%0" : : "dN" (DELAY_PORT));
    1516:	e6 80                	out    %al,$0x80
	/* Hook before leaving real mode, also disables interrupts */
	realmode_switch_hook();

	/* Enable the A20 gate */
	if (enable_a20()) {
    1518:	66 e8 5b ef ff ff    	calll  479 <enable_a20>
    151e:	66 85 c0             	test   %eax,%eax
    1521:	74 12                	je     1535 <go_to_protected_mode+0x38>
		puts("A20 gate not responding, unable to boot...\n");
    1523:	66 b8 9b 37 00 00    	mov    $0x379b,%eax
    1529:	66 e8 8e ee ff ff    	calll  3bd <puts>
		die();
    152f:	66 e8 98 ed ff ff    	calll  2cd <die>
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
    1535:	66 31 c0             	xor    %eax,%eax
    1538:	e6 f0                	out    %al,$0xf0
	asm volatile("outb %%al,%0" : : "dN" (DELAY_PORT));
    153a:	e6 80                	out    %al,$0x80
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
    153c:	e6 f1                	out    %al,$0xf1
	asm volatile("outb %%al,%0" : : "dN" (DELAY_PORT));
    153e:	e6 80                	out    %al,$0x80
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
    1540:	b0 ff                	mov    $0xff,%al
    1542:	e6 a1                	out    %al,$0xa1
	asm volatile("outb %%al,%0" : : "dN" (DELAY_PORT));
    1544:	e6 80                	out    %al,$0x80
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
    1546:	b0 fb                	mov    $0xfb,%al
    1548:	e6 21                	out    %al,$0x21
	asm volatile("outb %%al,%0" : : "dN" (DELAY_PORT));
    154a:	e6 80                	out    %al,$0x80
	asm volatile("lidtl %0" : : "m" (null_idt));
    154c:	66 0f 01 1e f8 37    	lidtl  0x37f8
	gdt.len = sizeof(boot_gdt)-1;
    1552:	c7 06 84 55 27 00    	movw   $0x27,0x5584
	asm("movw %%ds,%0" : "=rm" (seg));
    1558:	8c da                	mov    %ds,%dx
	gdt.ptr = (u32)&boot_gdt + (ds() << 4);
    155a:	66 0f b7 d2          	movzwl %dx,%edx
    155e:	66 c1 e2 04          	shl    $0x4,%edx
    1562:	67 66 8d 82 d0 37 00 	lea    0x37d0(%edx),%eax
    1569:	00 
    156a:	66 a3 86 55          	mov    %eax,0x5586
	asm volatile("lgdtl %0" : : "m" (gdt));
    156e:	66 0f 01 16 84 55    	lgdtl  0x5584
	mask_all_interrupts();

	/* Actual transition to protected mode... */
	setup_idt();
	setup_gdt();
	protected_mode_jump(boot_params.hdr.code32_start,
    1574:	66 81 c2 70 45 00 00 	add    $0x4570,%edx
    157b:	66 a1 84 47          	mov    0x4784,%eax
    157f:	66 e8 00 00 00 00    	calll  1585 <protected_mode_jump>

00001585 <protected_mode_jump>:

/*
 * void protected_mode_jump(u32 entrypoint, u32 bootparams);
 */
GLOBAL(protected_mode_jump)
	movl	%edx, %esi		# Pointer to boot_params table
    1585:	66 89 d6             	mov    %edx,%esi

	xorl	%ebx, %ebx
    1588:	66 31 db             	xor    %ebx,%ebx
	movw	%cs, %bx
    158b:	8c cb                	mov    %cs,%bx
	shll	$4, %ebx
    158d:	66 c1 e3 04          	shl    $0x4,%ebx
	addl	%ebx, 2f
    1591:	66 01 1e a9 15       	add    %ebx,0x15a9
	jmp	1f			# Short jump to serialize on 386/486
    1596:	eb 00                	jmp    1598 <protected_mode_jump+0x13>
1:

	movw	$__BOOT_DS, %cx
    1598:	b9 18 00             	mov    $0x18,%cx
	movw	$__BOOT_TSS, %di
    159b:	bf 20 00             	mov    $0x20,%di

	movl	%cr0, %edx
    159e:	0f 20 c2             	mov    %cr0,%edx
	orb	$X86_CR0_PE, %dl	# Protected mode
    15a1:	80 ca 01             	or     $0x1,%dl
	movl	%edx, %cr0
    15a4:	0f 22 c2             	mov    %edx,%cr0
    15a7:	66 ea 95 34 00 00 10 	ljmpl  $0x10,$0x3495
    15ae:	00 

000015af <number>:
n = ((unsigned long) n) / (unsigned) base; \
__res; })

static char *number(char *str, long num, int base, int size, int precision,
		    int type)
{
    15af:	66 55                	push   %ebp
    15b1:	66 57                	push   %edi
    15b3:	66 56                	push   %esi
    15b5:	66 53                	push   %ebx
    15b7:	66 83 ec 5c          	sub    $0x5c,%esp
    15bb:	66 89 c3             	mov    %eax,%ebx
    15be:	67 66 89 14 24       	mov    %edx,(%esp)
    15c3:	67 66 89 4c 24 04    	mov    %ecx,0x4(%esp)
    15c9:	67 66 8b 6c 24 70    	mov    0x70(%esp),%ebp
    15cf:	67 66 8b 7c 24 78    	mov    0x78(%esp),%edi
	char c, sign, locase;
	int i;

	/* locase = 0 or 0x20. ORing digits or letters with 'locase'
	 * produces same digits or (maybe lowercased) letters */
	locase = (type & SMALL);
    15d5:	66 89 f9             	mov    %edi,%ecx
    15d8:	66 83 e1 20          	and    $0x20,%ecx
    15dc:	67 88 4c 24 0b       	mov    %cl,0xb(%esp)
	if (type & LEFT)
    15e1:	66 89 f8             	mov    %edi,%eax
    15e4:	66 83 e0 10          	and    $0x10,%eax
    15e8:	67 66 89 44 24 0c    	mov    %eax,0xc(%esp)
    15ee:	74 06                	je     15f6 <number+0x47>
		type &= ~ZEROPAD;
    15f0:	66 83 e7 fe          	and    $0xfffffffe,%edi
	if (base < 2 || base > 16)
		return NULL;
	c = (type & ZEROPAD) ? '0' : ' ';
    15f4:	eb 0f                	jmp    1605 <number+0x56>
    15f6:	67 c6 44 24 0a 30    	movb   $0x30,0xa(%esp)
    15fc:	66 f7 c7 01 00 00 00 	test   $0x1,%edi
    1603:	75 06                	jne    160b <number+0x5c>
    1605:	67 c6 44 24 0a 20    	movb   $0x20,0xa(%esp)
	sign = 0;
    160b:	66 31 f6             	xor    %esi,%esi
	if (type & SIGN) {
    160e:	66 f7 c7 02 00 00 00 	test   $0x2,%edi
    1615:	74 3b                	je     1652 <number+0xa3>
		if (num < 0) {
    1617:	67 66 83 3c 24 00    	cmpl   $0x0,(%esp)
    161d:	79 0f                	jns    162e <number+0x7f>
			sign = '-';
			num = -num;
    161f:	67 66 f7 1c 24       	negl   (%esp)
			size--;
    1624:	66 4d                	dec    %ebp
			sign = '-';
    1626:	66 be 2d 00 00 00    	mov    $0x2d,%esi
    162c:	eb 24                	jmp    1652 <number+0xa3>
		} else if (type & PLUS) {
    162e:	66 f7 c7 04 00 00 00 	test   $0x4,%edi
    1635:	74 0a                	je     1641 <number+0x92>
			sign = '+';
			size--;
    1637:	66 4d                	dec    %ebp
			sign = '+';
    1639:	66 be 2b 00 00 00    	mov    $0x2b,%esi
    163f:	eb 11                	jmp    1652 <number+0xa3>
		} else if (type & SPACE) {
    1641:	66 f7 c7 08 00 00 00 	test   $0x8,%edi
    1648:	74 08                	je     1652 <number+0xa3>
			sign = ' ';
			size--;
    164a:	66 4d                	dec    %ebp
			sign = ' ';
    164c:	66 be 20 00 00 00    	mov    $0x20,%esi
		}
	}
	if (type & SPECIAL) {
    1652:	66 89 f8             	mov    %edi,%eax
    1655:	66 83 e0 40          	and    $0x40,%eax
    1659:	67 66 89 44 24 10    	mov    %eax,0x10(%esp)
    165f:	74 1a                	je     167b <number+0xcc>
		if (base == 16)
    1661:	67 66 83 7c 24 04 10 	cmpl   $0x10,0x4(%esp)
    1668:	75 06                	jne    1670 <number+0xc1>
			size -= 2;
    166a:	66 83 ed 02          	sub    $0x2,%ebp
    166e:	eb 0b                	jmp    167b <number+0xcc>
		else if (base == 8)
    1670:	67 66 83 7c 24 04 08 	cmpl   $0x8,0x4(%esp)
    1677:	75 02                	jne    167b <number+0xcc>
			size--;
    1679:	66 4d                	dec    %ebp
	}
	i = 0;
	if (num == 0)
    167b:	67 66 83 3c 24 00    	cmpl   $0x0,(%esp)
    1681:	75 0e                	jne    1691 <number+0xe2>
		tmp[i++] = '0';
    1683:	67 c6 44 24 1a 30    	movb   $0x30,0x1a(%esp)
    1689:	66 b9 01 00 00 00    	mov    $0x1,%ecx
    168f:	eb 3d                	jmp    16ce <number+0x11f>
	i = 0;
    1691:	66 31 c9             	xor    %ecx,%ecx
	else
		while (num != 0)
			tmp[i++] = (digits[__do_div(num, base)] | locase);
    1694:	67 66 8b 04 24       	mov    (%esp),%eax
    1699:	67 66 89 44 24 14    	mov    %eax,0x14(%esp)
    169f:	66 31 d2             	xor    %edx,%edx
    16a2:	67 66 f7 74 24 04    	divl   0x4(%esp)
    16a8:	67 66 89 04 24       	mov    %eax,(%esp)
    16ad:	66 41                	inc    %ecx
    16af:	67 8a 44 24 0b       	mov    0xb(%esp),%al
    16b4:	67 0a 82 58 38 00 00 	or     0x3858(%edx),%al
    16bb:	67 88 44 0c 19       	mov    %al,0x19(%esp,%ecx,1)
		while (num != 0)
    16c0:	67 66 8b 44 24 04    	mov    0x4(%esp),%eax
    16c6:	67 66 3b 44 24 14    	cmp    0x14(%esp),%eax
    16cc:	76 c6                	jbe    1694 <number+0xe5>
	if (i > precision)
    16ce:	67 66 89 0c 24       	mov    %ecx,(%esp)
    16d3:	67 66 3b 4c 24 74    	cmp    0x74(%esp),%ecx
    16d9:	7d 0b                	jge    16e6 <number+0x137>
    16db:	67 66 8b 44 24 74    	mov    0x74(%esp),%eax
    16e1:	67 66 89 04 24       	mov    %eax,(%esp)
		precision = i;
	size -= precision;
    16e6:	67 66 2b 2c 24       	sub    (%esp),%ebp
	if (!(type & (ZEROPAD + LEFT)))
    16eb:	66 83 e7 11          	and    $0x11,%edi
    16ef:	75 2a                	jne    171b <number+0x16c>
    16f1:	66 31 c0             	xor    %eax,%eax
		while (size-- > 0)
    16f4:	66 89 ef             	mov    %ebp,%edi
    16f7:	66 29 c7             	sub    %eax,%edi
    16fa:	66 85 ff             	test   %edi,%edi
    16fd:	7e 09                	jle    1708 <number+0x159>
			*str++ = ' ';
    16ff:	67 c6 04 03 20       	movb   $0x20,(%ebx,%eax,1)
    1704:	66 40                	inc    %eax
    1706:	eb ec                	jmp    16f4 <number+0x145>
    1708:	66 89 ef             	mov    %ebp,%edi
    170b:	66 85 ed             	test   %ebp,%ebp
    170e:	79 03                	jns    1713 <number+0x164>
    1710:	66 31 ff             	xor    %edi,%edi
    1713:	66 01 fb             	add    %edi,%ebx
    1716:	66 4d                	dec    %ebp
		while (size-- > 0)
    1718:	66 29 fd             	sub    %edi,%ebp
	if (sign)
    171b:	66 89 f0             	mov    %esi,%eax
    171e:	84 c0                	test   %al,%al
    1720:	74 05                	je     1727 <number+0x178>
		*str++ = sign;
    1722:	67 88 03             	mov    %al,(%ebx)
    1725:	66 43                	inc    %ebx
	if (type & SPECIAL) {
    1727:	67 66 83 7c 24 10 00 	cmpl   $0x0,0x10(%esp)
    172e:	74 2f                	je     175f <number+0x1b0>
		if (base == 8)
    1730:	67 66 83 7c 24 04 08 	cmpl   $0x8,0x4(%esp)
    1737:	75 08                	jne    1741 <number+0x192>
			*str++ = '0';
    1739:	67 c6 03 30          	movb   $0x30,(%ebx)
    173d:	66 43                	inc    %ebx
    173f:	eb 1e                	jmp    175f <number+0x1b0>
		else if (base == 16) {
    1741:	67 66 83 7c 24 04 10 	cmpl   $0x10,0x4(%esp)
    1748:	75 15                	jne    175f <number+0x1b0>
			*str++ = '0';
    174a:	67 c6 03 30          	movb   $0x30,(%ebx)
			*str++ = ('X' | locase);
    174e:	67 8a 44 24 0b       	mov    0xb(%esp),%al
    1753:	66 83 c8 58          	or     $0x58,%eax
    1757:	67 88 43 01          	mov    %al,0x1(%ebx)
    175b:	66 83 c3 02          	add    $0x2,%ebx
		}
	}
	if (!(type & LEFT))
    175f:	67 66 83 7c 24 0c 00 	cmpl   $0x0,0xc(%esp)
    1766:	75 33                	jne    179b <number+0x1ec>
    1768:	66 89 d8             	mov    %ebx,%eax
    176b:	67 66 8d 3c 2b       	lea    (%ebx,%ebp,1),%edi
		while (size-- > 0)
    1770:	66 89 fe             	mov    %edi,%esi
    1773:	66 29 c6             	sub    %eax,%esi
    1776:	66 85 f6             	test   %esi,%esi
    1779:	7e 0d                	jle    1788 <number+0x1d9>
			*str++ = c;
    177b:	66 40                	inc    %eax
    177d:	67 8a 54 24 0a       	mov    0xa(%esp),%dl
    1782:	67 88 50 ff          	mov    %dl,-0x1(%eax)
    1786:	eb e8                	jmp    1770 <number+0x1c1>
    1788:	66 89 ee             	mov    %ebp,%esi
    178b:	66 85 ed             	test   %ebp,%ebp
    178e:	79 03                	jns    1793 <number+0x1e4>
    1790:	66 31 f6             	xor    %esi,%esi
    1793:	66 01 f3             	add    %esi,%ebx
    1796:	66 4d                	dec    %ebp
		while (size-- > 0)
    1798:	66 29 f5             	sub    %esi,%ebp
    179b:	66 89 d8             	mov    %ebx,%eax
	while (i < precision--)
    179e:	67 66 8b 14 24       	mov    (%esp),%edx
    17a3:	67 66 8d 3c 13       	lea    (%ebx,%edx,1),%edi
    17a8:	66 89 fe             	mov    %edi,%esi
    17ab:	66 29 c6             	sub    %eax,%esi
    17ae:	66 39 f1             	cmp    %esi,%ecx
    17b1:	7d 09                	jge    17bc <number+0x20d>
		*str++ = '0';
    17b3:	66 40                	inc    %eax
    17b5:	67 c6 40 ff 30       	movb   $0x30,-0x1(%eax)
    17ba:	eb ec                	jmp    17a8 <number+0x1f9>
    17bc:	66 89 c8             	mov    %ecx,%eax
    17bf:	66 31 f6             	xor    %esi,%esi
    17c2:	67 66 3b 0c 24       	cmp    (%esp),%ecx
    17c7:	7f 0b                	jg     17d4 <number+0x225>
    17c9:	67 66 8b 14 24       	mov    (%esp),%edx
    17ce:	66 29 ca             	sub    %ecx,%edx
    17d1:	66 89 d6             	mov    %edx,%esi
    17d4:	66 01 f3             	add    %esi,%ebx
	while (i < precision--)
    17d7:	66 89 de             	mov    %ebx,%esi
	while (i-- > 0)
    17da:	66 83 e9 01          	sub    $0x1,%ecx
    17de:	72 0d                	jb     17ed <number+0x23e>
		*str++ = tmp[i];
    17e0:	66 46                	inc    %esi
    17e2:	67 8a 54 0c 1a       	mov    0x1a(%esp,%ecx,1),%dl
    17e7:	67 88 56 ff          	mov    %dl,-0x1(%esi)
    17eb:	eb ed                	jmp    17da <number+0x22b>
    17ed:	66 01 c3             	add    %eax,%ebx
	while (i-- > 0)
    17f0:	66 31 c0             	xor    %eax,%eax
	while (size-- > 0)
    17f3:	66 89 ea             	mov    %ebp,%edx
    17f6:	66 29 c2             	sub    %eax,%edx
    17f9:	66 85 d2             	test   %edx,%edx
    17fc:	7e 09                	jle    1807 <number+0x258>
		*str++ = ' ';
    17fe:	67 c6 04 03 20       	movb   $0x20,(%ebx,%eax,1)
    1803:	66 40                	inc    %eax
    1805:	eb ec                	jmp    17f3 <number+0x244>
	return str;
}
    1807:	66 85 ed             	test   %ebp,%ebp
    180a:	79 03                	jns    180f <number+0x260>
    180c:	66 31 ed             	xor    %ebp,%ebp
    180f:	67 66 8d 04 2b       	lea    (%ebx,%ebp,1),%eax
    1814:	66 83 c4 5c          	add    $0x5c,%esp
    1818:	66 5b                	pop    %ebx
    181a:	66 5e                	pop    %esi
    181c:	66 5f                	pop    %edi
    181e:	66 5d                	pop    %ebp
    1820:	66 c3                	retl   

00001822 <vsprintf>:

int vsprintf(char *buf, const char *fmt, va_list args)
{
    1822:	f3 0f 1e fb          	endbr32 
    1826:	66 55                	push   %ebp
    1828:	66 57                	push   %edi
    182a:	66 56                	push   %esi
    182c:	66 53                	push   %ebx
    182e:	66 83 ec 14          	sub    $0x14,%esp
    1832:	67 66 89 44 24 08    	mov    %eax,0x8(%esp)
    1838:	66 89 d7             	mov    %edx,%edi
    183b:	66 89 c8             	mov    %ecx,%eax
	int field_width;	/* width of output field */
	int precision;		/* min. # of digits for integers; max
				   number of chars for from string */
	int qualifier;		/* 'h', 'l', or 'L' for integer fields */

	for (str = buf; *fmt; ++fmt) {
    183e:	67 66 8b 5c 24 08    	mov    0x8(%esp),%ebx
    1844:	67 8a 17             	mov    (%edi),%dl
    1847:	84 d2                	test   %dl,%dl
    1849:	0f 84 ee 03          	je     1c3b <vsprintf+0x419>
		if (*fmt != '%') {
    184d:	80 fa 25             	cmp    $0x25,%dl
    1850:	74 09                	je     185b <vsprintf+0x39>
			*str++ = *fmt;
    1852:	67 88 13             	mov    %dl,(%ebx)
			continue;
    1855:	66 89 fd             	mov    %edi,%ebp
    1858:	e9 35 03             	jmp    1b90 <vsprintf+0x36e>
		}

		/* process flags */
		flags = 0;
    185b:	67 66 c7 04 24 00 00 	movl   $0x0,(%esp)
    1862:	00 00 
	      repeat:
		++fmt;		/* this also skips first '%' */
    1864:	67 66 8d 6f 01       	lea    0x1(%edi),%ebp
		switch (*fmt) {
    1869:	67 8a 57 01          	mov    0x1(%edi),%dl
    186d:	80 fa 2b             	cmp    $0x2b,%dl
    1870:	74 31                	je     18a3 <vsprintf+0x81>
    1872:	7f 15                	jg     1889 <vsprintf+0x67>
    1874:	80 fa 20             	cmp    $0x20,%dl
    1877:	74 32                	je     18ab <vsprintf+0x89>
    1879:	80 fa 23             	cmp    $0x23,%dl
    187c:	75 35                	jne    18b3 <vsprintf+0x91>
			goto repeat;
		case ' ':
			flags |= SPACE;
			goto repeat;
		case '#':
			flags |= SPECIAL;
    187e:	67 66 83 0c 24 40    	orl    $0x40,(%esp)
{
    1884:	66 89 ef             	mov    %ebp,%edi
    1887:	eb db                	jmp    1864 <vsprintf+0x42>
		switch (*fmt) {
    1889:	80 fa 2d             	cmp    $0x2d,%dl
    188c:	74 0d                	je     189b <vsprintf+0x79>
    188e:	80 fa 30             	cmp    $0x30,%dl
    1891:	75 20                	jne    18b3 <vsprintf+0x91>
			goto repeat;
		case '0':
			flags |= ZEROPAD;
    1893:	67 66 83 0c 24 01    	orl    $0x1,(%esp)
			goto repeat;
    1899:	eb e9                	jmp    1884 <vsprintf+0x62>
			flags |= LEFT;
    189b:	67 66 83 0c 24 10    	orl    $0x10,(%esp)
			goto repeat;
    18a1:	eb e1                	jmp    1884 <vsprintf+0x62>
			flags |= PLUS;
    18a3:	67 66 83 0c 24 04    	orl    $0x4,(%esp)
			goto repeat;
    18a9:	eb d9                	jmp    1884 <vsprintf+0x62>
			flags |= SPACE;
    18ab:	67 66 83 0c 24 08    	orl    $0x8,(%esp)
			goto repeat;
    18b1:	eb d1                	jmp    1884 <vsprintf+0x62>
#ifndef BOOT_CTYPE_H
#define BOOT_CTYPE_H

static inline int isdigit(int ch)
{
	return (ch >= '0') && (ch <= '9');
    18b3:	66 0f be ca          	movsbl %dl,%ecx
    18b7:	66 83 e9 30          	sub    $0x30,%ecx
		}

		/* get field width */
		field_width = -1;
		if (isdigit(*fmt))
    18bb:	66 83 f9 09          	cmp    $0x9,%ecx
    18bf:	77 22                	ja     18e3 <vsprintf+0xc1>
	int i = 0;
    18c1:	66 31 f6             	xor    %esi,%esi
    18c4:	67 66 0f be 55 00    	movsbl 0x0(%ebp),%edx
    18ca:	67 66 8d 4a d0       	lea    -0x30(%edx),%ecx
	while (isdigit(**s))
    18cf:	66 83 f9 09          	cmp    $0x9,%ecx
    18d3:	77 32                	ja     1907 <vsprintf+0xe5>
		i = i * 10 + *((*s)++) - '0';
    18d5:	66 45                	inc    %ebp
    18d7:	66 6b f6 0a          	imul   $0xa,%esi,%esi
    18db:	67 66 8d 74 16 d0    	lea    -0x30(%esi,%edx,1),%esi
    18e1:	eb e1                	jmp    18c4 <vsprintf+0xa2>
		field_width = -1;
    18e3:	66 83 ce ff          	or     $0xffffffff,%esi
			field_width = skip_atoi(&fmt);
		else if (*fmt == '*') {
    18e7:	80 fa 2a             	cmp    $0x2a,%dl
    18ea:	75 1b                	jne    1907 <vsprintf+0xe5>
			++fmt;
    18ec:	67 66 8d 6f 02       	lea    0x2(%edi),%ebp
			/* it's the next argument */
			field_width = va_arg(args, int);
    18f1:	67 66 8b 30          	mov    (%eax),%esi
    18f5:	66 83 c0 04          	add    $0x4,%eax
			if (field_width < 0) {
    18f9:	66 85 f6             	test   %esi,%esi
    18fc:	79 09                	jns    1907 <vsprintf+0xe5>
				field_width = -field_width;
    18fe:	66 f7 de             	neg    %esi
				flags |= LEFT;
    1901:	67 66 83 0c 24 10    	orl    $0x10,(%esp)
			}
		}

		/* get the precision */
		precision = -1;
    1907:	66 83 cf ff          	or     $0xffffffff,%edi
		if (*fmt == '.') {
    190b:	67 80 7d 00 2e       	cmpb   $0x2e,0x0(%ebp)
    1910:	75 61                	jne    1973 <vsprintf+0x151>
			++fmt;
    1912:	67 66 8d 4d 01       	lea    0x1(%ebp),%ecx
			if (isdigit(*fmt))
    1917:	67 66 0f be 7d 01    	movsbl 0x1(%ebp),%edi
    191d:	66 89 fa             	mov    %edi,%edx
    1920:	66 83 ef 30          	sub    $0x30,%edi
    1924:	66 83 ff 09          	cmp    $0x9,%edi
    1928:	77 21                	ja     194b <vsprintf+0x129>
	int i = 0;
    192a:	66 31 d2             	xor    %edx,%edx
    192d:	67 66 0f be 39       	movsbl (%ecx),%edi
    1932:	67 66 8d 6f d0       	lea    -0x30(%edi),%ebp
	while (isdigit(**s))
    1937:	66 83 fd 09          	cmp    $0x9,%ebp
    193b:	77 20                	ja     195d <vsprintf+0x13b>
		i = i * 10 + *((*s)++) - '0';
    193d:	66 41                	inc    %ecx
    193f:	66 6b d2 0a          	imul   $0xa,%edx,%edx
    1943:	67 66 8d 54 3a d0    	lea    -0x30(%edx,%edi,1),%edx
    1949:	eb e2                	jmp    192d <vsprintf+0x10b>
				precision = skip_atoi(&fmt);
			else if (*fmt == '*') {
    194b:	80 fa 2a             	cmp    $0x2a,%dl
    194e:	75 1d                	jne    196d <vsprintf+0x14b>
				++fmt;
    1950:	67 66 8d 4d 02       	lea    0x2(%ebp),%ecx
				/* it's the next argument */
				precision = va_arg(args, int);
    1955:	67 66 8b 10          	mov    (%eax),%edx
    1959:	66 83 c0 04          	add    $0x4,%eax
			}
			if (precision < 0)
    195d:	66 89 d7             	mov    %edx,%edi
    1960:	66 85 d2             	test   %edx,%edx
    1963:	79 03                	jns    1968 <vsprintf+0x146>
    1965:	66 31 ff             	xor    %edi,%edi
    1968:	66 89 cd             	mov    %ecx,%ebp
    196b:	eb 06                	jmp    1973 <vsprintf+0x151>
			++fmt;
    196d:	66 89 cd             	mov    %ecx,%ebp
				precision = 0;
    1970:	66 31 ff             	xor    %edi,%edi
		}

		/* get the conversion qualifier */
		qualifier = -1;
		if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L') {
    1973:	67 8a 55 00          	mov    0x0(%ebp),%dl
    1977:	88 d1                	mov    %dl,%cl
    1979:	66 83 e1 df          	and    $0xffffffdf,%ecx
    197d:	80 f9 4c             	cmp    $0x4c,%cl
    1980:	74 0f                	je     1991 <vsprintf+0x16f>
		qualifier = -1;
    1982:	67 66 c7 44 24 04 ff 	movl   $0xffffffff,0x4(%esp)
    1989:	ff ff ff 
		if (*fmt == 'h' || *fmt == 'l' || *fmt == 'L') {
    198c:	80 fa 68             	cmp    $0x68,%dl
    198f:	75 0c                	jne    199d <vsprintf+0x17b>
			qualifier = *fmt;
    1991:	66 0f be ca          	movsbl %dl,%ecx
    1995:	67 66 89 4c 24 04    	mov    %ecx,0x4(%esp)
			++fmt;
    199b:	66 45                	inc    %ebp
		}

		/* default base */
		base = 10;

		switch (*fmt) {
    199d:	67 8a 55 00          	mov    0x0(%ebp),%dl
    19a1:	80 fa 78             	cmp    $0x78,%dl
    19a4:	0f 8f 03 02          	jg     1bab <vsprintf+0x389>
    19a8:	80 fa 62             	cmp    $0x62,%dl
    19ab:	7f 17                	jg     19c4 <vsprintf+0x1a2>
    19ad:	80 fa 25             	cmp    $0x25,%dl
    19b0:	0f 84 d8 01          	je     1b8c <vsprintf+0x36a>
    19b4:	66 b9 10 00 00 00    	mov    $0x10,%ecx
    19ba:	80 fa 58             	cmp    $0x58,%dl
    19bd:	0f 84 0c 02          	je     1bcd <vsprintf+0x3ab>
    19c1:	e9 e7 01             	jmp    1bab <vsprintf+0x389>
    19c4:	66 83 ea 63          	sub    $0x63,%edx
    19c8:	80 fa 15             	cmp    $0x15,%dl
    19cb:	0f 87 dc 01          	ja     1bab <vsprintf+0x389>
    19cf:	66 0f b6 d2          	movzbl %dl,%edx
    19d3:	3e 67 ff 24 95 00 38 	notrack jmp *0x3800(,%edx,4)
    19da:	00 00 
			*str++ = '%';
			continue;

			/* integer number formats - set up the flags and "break" */
		case 'o':
			base = 8;
    19dc:	66 b9 08 00 00 00    	mov    $0x8,%ecx
    19e2:	e9 e8 01             	jmp    1bcd <vsprintf+0x3ab>
			if (!(flags & LEFT))
    19e5:	67 f6 04 24 10       	testb  $0x10,(%esp)
    19ea:	75 3e                	jne    1a2a <vsprintf+0x208>
    19ec:	66 31 d2             	xor    %edx,%edx
				while (--field_width > 0)
    19ef:	66 42                	inc    %edx
    19f1:	66 89 f1             	mov    %esi,%ecx
    19f4:	66 29 d1             	sub    %edx,%ecx
    19f7:	66 85 c9             	test   %ecx,%ecx
    19fa:	7e 08                	jle    1a04 <vsprintf+0x1e2>
					*str++ = ' ';
    19fc:	67 c6 44 13 ff 20    	movb   $0x20,-0x1(%ebx,%edx,1)
    1a02:	eb eb                	jmp    19ef <vsprintf+0x1cd>
    1a04:	67 66 8d 56 ff       	lea    -0x1(%esi),%edx
    1a09:	66 31 c9             	xor    %ecx,%ecx
    1a0c:	66 85 f6             	test   %esi,%esi
    1a0f:	7e 03                	jle    1a14 <vsprintf+0x1f2>
    1a11:	66 89 d1             	mov    %edx,%ecx
    1a14:	66 01 cb             	add    %ecx,%ebx
    1a17:	66 85 f6             	test   %esi,%esi
    1a1a:	7f 06                	jg     1a22 <vsprintf+0x200>
    1a1c:	66 be 01 00 00 00    	mov    $0x1,%esi
    1a22:	66 29 f2             	sub    %esi,%edx
				while (--field_width > 0)
    1a25:	67 66 8d 72 01       	lea    0x1(%edx),%esi
			*str++ = (unsigned char)va_arg(args, int);
    1a2a:	67 66 8d 50 04       	lea    0x4(%eax),%edx
    1a2f:	67 66 8b 00          	mov    (%eax),%eax
    1a33:	67 88 03             	mov    %al,(%ebx)
			while (--field_width > 0)
    1a36:	66 31 c0             	xor    %eax,%eax
    1a39:	66 40                	inc    %eax
    1a3b:	66 89 f1             	mov    %esi,%ecx
    1a3e:	66 29 c1             	sub    %eax,%ecx
    1a41:	66 85 c9             	test   %ecx,%ecx
    1a44:	7e 07                	jle    1a4d <vsprintf+0x22b>
				*str++ = ' ';
    1a46:	67 c6 04 03 20       	movb   $0x20,(%ebx,%eax,1)
    1a4b:	eb ec                	jmp    1a39 <vsprintf+0x217>
    1a4d:	66 31 c0             	xor    %eax,%eax
    1a50:	66 85 f6             	test   %esi,%esi
    1a53:	7e 05                	jle    1a5a <vsprintf+0x238>
    1a55:	67 66 8d 46 ff       	lea    -0x1(%esi),%eax
    1a5a:	67 66 8d 5c 03 01    	lea    0x1(%ebx,%eax,1),%ebx
			*str++ = (unsigned char)va_arg(args, int);
    1a60:	66 89 d0             	mov    %edx,%eax
    1a63:	e9 cd 01             	jmp    1c33 <vsprintf+0x411>
			s = va_arg(args, char *);
    1a66:	67 66 8d 48 04       	lea    0x4(%eax),%ecx
    1a6b:	67 66 89 4c 24 0c    	mov    %ecx,0xc(%esp)
    1a71:	67 66 8b 00          	mov    (%eax),%eax
    1a75:	67 66 89 44 24 04    	mov    %eax,0x4(%esp)
			len = strnlen(s, precision);
    1a7b:	66 89 fa             	mov    %edi,%edx
    1a7e:	66 e8 1a 03 00 00    	calll  1d9e <strnlen>
			if (!(flags & LEFT))
    1a84:	67 f6 04 24 10       	testb  $0x10,(%esp)
    1a89:	75 48                	jne    1ad3 <vsprintf+0x2b1>
    1a8b:	66 89 da             	mov    %ebx,%edx
				while (len < field_width--)
    1a8e:	67 66 8d 3c 33       	lea    (%ebx,%esi,1),%edi
    1a93:	66 89 f9             	mov    %edi,%ecx
    1a96:	66 29 d1             	sub    %edx,%ecx
    1a99:	66 39 c8             	cmp    %ecx,%eax
    1a9c:	7d 09                	jge    1aa7 <vsprintf+0x285>
					*str++ = ' ';
    1a9e:	66 42                	inc    %edx
    1aa0:	67 c6 42 ff 20       	movb   $0x20,-0x1(%edx)
    1aa5:	eb ec                	jmp    1a93 <vsprintf+0x271>
    1aa7:	66 89 f1             	mov    %esi,%ecx
    1aaa:	66 29 c1             	sub    %eax,%ecx
    1aad:	66 31 d2             	xor    %edx,%edx
    1ab0:	66 39 c6             	cmp    %eax,%esi
    1ab3:	7c 03                	jl     1ab8 <vsprintf+0x296>
    1ab5:	66 89 ca             	mov    %ecx,%edx
    1ab8:	66 01 d3             	add    %edx,%ebx
    1abb:	67 66 8d 7e ff       	lea    -0x1(%esi),%edi
    1ac0:	66 31 d2             	xor    %edx,%edx
    1ac3:	66 39 c6             	cmp    %eax,%esi
    1ac6:	7c 06                	jl     1ace <vsprintf+0x2ac>
    1ac8:	66 f7 d9             	neg    %ecx
    1acb:	66 89 ca             	mov    %ecx,%edx
				while (len < field_width--)
    1ace:	67 66 8d 34 17       	lea    (%edi,%edx,1),%esi
			for (i = 0; i < len; ++i)
    1ad3:	66 31 d2             	xor    %edx,%edx
    1ad6:	66 39 c2             	cmp    %eax,%edx
    1ad9:	7d 12                	jge    1aed <vsprintf+0x2cb>
				*str++ = *s++;
    1adb:	67 66 8b 7c 24 04    	mov    0x4(%esp),%edi
    1ae1:	67 8a 0c 17          	mov    (%edi,%edx,1),%cl
    1ae5:	67 88 0c 13          	mov    %cl,(%ebx,%edx,1)
			for (i = 0; i < len; ++i)
    1ae9:	66 42                	inc    %edx
    1aeb:	eb e9                	jmp    1ad6 <vsprintf+0x2b4>
    1aed:	66 89 c2             	mov    %eax,%edx
    1af0:	66 85 c0             	test   %eax,%eax
    1af3:	79 03                	jns    1af8 <vsprintf+0x2d6>
    1af5:	66 31 d2             	xor    %edx,%edx
    1af8:	66 01 d3             	add    %edx,%ebx
    1afb:	66 89 da             	mov    %ebx,%edx
			while (len < field_width--)
    1afe:	67 66 8d 3c 33       	lea    (%ebx,%esi,1),%edi
    1b03:	66 89 f9             	mov    %edi,%ecx
    1b06:	66 29 d1             	sub    %edx,%ecx
    1b09:	66 39 c8             	cmp    %ecx,%eax
    1b0c:	7d 09                	jge    1b17 <vsprintf+0x2f5>
				*str++ = ' ';
    1b0e:	66 42                	inc    %edx
    1b10:	67 c6 42 ff 20       	movb   $0x20,-0x1(%edx)
    1b15:	eb ec                	jmp    1b03 <vsprintf+0x2e1>
    1b17:	66 31 d2             	xor    %edx,%edx
    1b1a:	66 39 c6             	cmp    %eax,%esi
    1b1d:	7c 06                	jl     1b25 <vsprintf+0x303>
    1b1f:	66 29 c6             	sub    %eax,%esi
    1b22:	66 89 f2             	mov    %esi,%edx
    1b25:	66 01 d3             	add    %edx,%ebx
    1b28:	e9 02 01             	jmp    1c2d <vsprintf+0x40b>
			if (field_width == -1) {
    1b2b:	66 83 fe ff          	cmp    $0xffffffff,%esi
    1b2f:	75 0c                	jne    1b3d <vsprintf+0x31b>
				flags |= ZEROPAD;
    1b31:	67 66 83 0c 24 01    	orl    $0x1,(%esp)
				field_width = 2 * sizeof(void *);
    1b37:	66 be 08 00 00 00    	mov    $0x8,%esi
				     (unsigned long)va_arg(args, void *), 16,
    1b3d:	67 66 8d 48 04       	lea    0x4(%eax),%ecx
    1b42:	67 66 89 4c 24 04    	mov    %ecx,0x4(%esp)
			str = number(str,
    1b48:	67 66 ff 34 24       	pushl  (%esp)
    1b4d:	66 57                	push   %edi
    1b4f:	66 56                	push   %esi
    1b51:	66 b9 10 00 00 00    	mov    $0x10,%ecx
    1b57:	67 66 8b 10          	mov    (%eax),%edx
    1b5b:	66 89 d8             	mov    %ebx,%eax
    1b5e:	66 e8 4b fa ff ff    	calll  15af <number>
    1b64:	66 89 c3             	mov    %eax,%ebx
			continue;
    1b67:	66 83 c4 0c          	add    $0xc,%esp
				     (unsigned long)va_arg(args, void *), 16,
    1b6b:	67 66 8b 44 24 04    	mov    0x4(%esp),%eax
			continue;
    1b71:	e9 bf 00             	jmp    1c33 <vsprintf+0x411>
				*ip = (str - buf);
    1b74:	66 89 d9             	mov    %ebx,%ecx
    1b77:	67 66 2b 4c 24 08    	sub    0x8(%esp),%ecx
			s = va_arg(args, char *);
    1b7d:	67 66 8b 10          	mov    (%eax),%edx
			*str++ = (unsigned char)va_arg(args, int);
    1b81:	66 83 c0 04          	add    $0x4,%eax
				*ip = (str - buf);
    1b85:	67 66 89 0a          	mov    %ecx,(%edx)
    1b89:	e9 a7 00             	jmp    1c33 <vsprintf+0x411>
			*str++ = '%';
    1b8c:	67 c6 03 25          	movb   $0x25,(%ebx)
    1b90:	66 43                	inc    %ebx
			continue;
    1b92:	e9 9e 00             	jmp    1c33 <vsprintf+0x411>
			break;

		case 'x':
			flags |= SMALL;
    1b95:	67 66 83 0c 24 20    	orl    $0x20,(%esp)
		case 'X':
			base = 16;
    1b9b:	66 b9 10 00 00 00    	mov    $0x10,%ecx
    1ba1:	eb 2a                	jmp    1bcd <vsprintf+0x3ab>
			break;

		case 'd':
		case 'i':
			flags |= SIGN;
    1ba3:	67 66 83 0c 24 02    	orl    $0x2,(%esp)
    1ba9:	eb 1c                	jmp    1bc7 <vsprintf+0x3a5>
		case 'u':
			break;

		default:
			*str++ = '%';
    1bab:	67 c6 03 25          	movb   $0x25,(%ebx)
			if (*fmt)
    1baf:	67 8a 55 00          	mov    0x0(%ebp),%dl
    1bb3:	84 d2                	test   %dl,%dl
    1bb5:	74 0a                	je     1bc1 <vsprintf+0x39f>
				*str++ = *fmt;
    1bb7:	67 88 53 01          	mov    %dl,0x1(%ebx)
    1bbb:	66 83 c3 02          	add    $0x2,%ebx
    1bbf:	eb 72                	jmp    1c33 <vsprintf+0x411>
			*str++ = '%';
    1bc1:	66 43                	inc    %ebx
			else
				--fmt;
    1bc3:	66 4d                	dec    %ebp
    1bc5:	eb 6c                	jmp    1c33 <vsprintf+0x411>
		base = 10;
    1bc7:	66 b9 0a 00 00 00    	mov    $0xa,%ecx
			*str++ = (unsigned char)va_arg(args, int);
    1bcd:	67 66 8d 50 04       	lea    0x4(%eax),%edx
    1bd2:	67 66 89 54 24 0c    	mov    %edx,0xc(%esp)
			continue;
		}
		if (qualifier == 'l')
    1bd8:	67 66 83 7c 24 04 6c 	cmpl   $0x6c,0x4(%esp)
    1bdf:	74 2f                	je     1c10 <vsprintf+0x3ee>
			num = va_arg(args, unsigned long);
		else if (qualifier == 'h') {
			num = (unsigned short)va_arg(args, int);
			if (flags & SIGN)
    1be1:	67 66 8b 14 24       	mov    (%esp),%edx
    1be6:	66 83 e2 02          	and    $0x2,%edx
    1bea:	67 66 89 54 24 10    	mov    %edx,0x10(%esp)
		else if (qualifier == 'h') {
    1bf0:	67 66 83 7c 24 04 68 	cmpl   $0x68,0x4(%esp)
    1bf7:	75 17                	jne    1c10 <vsprintf+0x3ee>
			num = (unsigned short)va_arg(args, int);
    1bf9:	67 66 8b 00          	mov    (%eax),%eax
				num = (short)num;
    1bfd:	66 0f bf d0          	movswl %ax,%edx
			if (flags & SIGN)
    1c01:	67 66 83 7c 24 10 00 	cmpl   $0x0,0x10(%esp)
    1c08:	75 0a                	jne    1c14 <vsprintf+0x3f2>
			num = (unsigned short)va_arg(args, int);
    1c0a:	66 0f b7 d0          	movzwl %ax,%edx
    1c0e:	eb 04                	jmp    1c14 <vsprintf+0x3f2>
		} else if (flags & SIGN)
			num = va_arg(args, int);
    1c10:	67 66 8b 10          	mov    (%eax),%edx
		else
			num = va_arg(args, unsigned int);
		str = number(str, num, base, field_width, precision, flags);
    1c14:	67 66 ff 34 24       	pushl  (%esp)
    1c19:	66 57                	push   %edi
    1c1b:	66 56                	push   %esi
    1c1d:	66 89 d8             	mov    %ebx,%eax
    1c20:	66 e8 89 f9 ff ff    	calll  15af <number>
    1c26:	66 89 c3             	mov    %eax,%ebx
    1c29:	66 83 c4 0c          	add    $0xc,%esp
    1c2d:	67 66 8b 44 24 0c    	mov    0xc(%esp),%eax
	for (str = buf; *fmt; ++fmt) {
    1c33:	67 66 8d 7d 01       	lea    0x1(%ebp),%edi
    1c38:	e9 09 fc             	jmp    1844 <vsprintf+0x22>
	}
	*str = '\0';
    1c3b:	67 c6 03 00          	movb   $0x0,(%ebx)
	return str - buf;
    1c3f:	66 89 d8             	mov    %ebx,%eax
    1c42:	67 66 2b 44 24 08    	sub    0x8(%esp),%eax
}
    1c48:	66 83 c4 14          	add    $0x14,%esp
    1c4c:	66 5b                	pop    %ebx
    1c4e:	66 5e                	pop    %esi
    1c50:	66 5f                	pop    %edi
    1c52:	66 5d                	pop    %ebp
    1c54:	66 c3                	retl   

00001c56 <sprintf>:

int sprintf(char *buf, const char *fmt, ...)
{
    1c56:	f3 0f 1e fb          	endbr32 
	va_list args;
	int i;

	va_start(args, fmt);
	i = vsprintf(buf, fmt, args);
    1c5a:	67 66 8d 4c 24 0c    	lea    0xc(%esp),%ecx
    1c60:	67 66 8b 54 24 08    	mov    0x8(%esp),%edx
    1c66:	67 66 8b 44 24 04    	mov    0x4(%esp),%eax
    1c6c:	66 e8 b0 fb ff ff    	calll  1822 <vsprintf>
	va_end(args);
	return i;
}
    1c72:	66 c3                	retl   

00001c74 <printf>:

int printf(const char *fmt, ...)
{
    1c74:	f3 0f 1e fb          	endbr32 
    1c78:	66 53                	push   %ebx
    1c7a:	66 81 ec 00 04 00 00 	sub    $0x400,%esp
	char printf_buf[1024];
	va_list args;
	int printed;

	va_start(args, fmt);
	printed = vsprintf(printf_buf, fmt, args);
    1c81:	67 66 8d 8c 24 0c 04 	lea    0x40c(%esp),%ecx
    1c88:	00 00 
    1c8a:	67 66 8b 94 24 08 04 	mov    0x408(%esp),%edx
    1c91:	00 00 
    1c93:	66 89 e0             	mov    %esp,%eax
    1c96:	66 e8 86 fb ff ff    	calll  1822 <vsprintf>
    1c9c:	66 89 c3             	mov    %eax,%ebx
	va_end(args);

	puts(printf_buf);
    1c9f:	66 89 e0             	mov    %esp,%eax
    1ca2:	66 e8 15 e7 ff ff    	calll  3bd <puts>

	return printed;
}
    1ca8:	66 89 d8             	mov    %ebx,%eax
    1cab:	66 81 c4 00 04 00 00 	add    $0x400,%esp
    1cb2:	66 5b                	pop    %ebx
    1cb4:	66 c3                	retl   

00001cb6 <initregs>:

#include "boot.h"
#include "string.h"

void initregs(struct biosregs *reg)
{
    1cb6:	f3 0f 1e fb          	endbr32 
    1cba:	66 57                	push   %edi
    1cbc:	66 89 c2             	mov    %eax,%edx
	memset(reg, 0, sizeof *reg);
    1cbf:	66 b9 0b 00 00 00    	mov    $0xb,%ecx
    1cc5:	66 31 c0             	xor    %eax,%eax
    1cc8:	66 89 d7             	mov    %edx,%edi
    1ccb:	66 f3 ab             	rep stos %eax,%es:(%di)
	reg->eflags |= X86_EFLAGS_CF;
    1cce:	67 66 c7 42 28 01 00 	movl   $0x1,0x28(%edx)
    1cd5:	00 00 
    1cd7:	8c d8                	mov    %ds,%ax
	reg->ds = ds();
    1cd9:	67 89 42 26          	mov    %ax,0x26(%edx)
	reg->es = ds();
    1cdd:	67 89 42 24          	mov    %ax,0x24(%edx)
	asm volatile("movw %%fs,%0" : "=rm" (seg));
    1ce1:	8c e0                	mov    %fs,%ax
	reg->fs = fs();
    1ce3:	67 89 42 22          	mov    %ax,0x22(%edx)
	asm volatile("movw %%gs,%0" : "=rm" (seg));
    1ce7:	8c e8                	mov    %gs,%ax
	reg->gs = gs();
    1ce9:	67 89 42 20          	mov    %ax,0x20(%edx)
}
    1ced:	66 5f                	pop    %edi
    1cef:	66 c3                	retl   

00001cf1 <memcmp>:
#undef memcpy
#undef memset
#undef memcmp

int memcmp(const void *s1, const void *s2, size_t len)
{
    1cf1:	f3 0f 1e fb          	endbr32 
    1cf5:	66 57                	push   %edi
    1cf7:	66 56                	push   %esi
	bool diff;
	asm("repe; cmpsb" CC_SET(nz)
    1cf9:	66 89 c7             	mov    %eax,%edi
    1cfc:	66 89 d6             	mov    %edx,%esi
    1cff:	f3 a6                	repz cmpsb %es:(%di),%ds:(%si)
	    : CC_OUT(nz) (diff), "+D" (s1), "+S" (s2), "+c" (len));
	return diff;
    1d01:	0f 95 c0             	setne  %al
    1d04:	66 0f b6 c0          	movzbl %al,%eax
}
    1d08:	66 5e                	pop    %esi
    1d0a:	66 5f                	pop    %edi
    1d0c:	66 c3                	retl   

00001d0e <bcmp>:
    1d0e:	f3 0f 1e fb          	endbr32 
    1d12:	66 57                	push   %edi
    1d14:	66 56                	push   %esi
    1d16:	66 89 c7             	mov    %eax,%edi
    1d19:	66 89 d6             	mov    %edx,%esi
    1d1c:	f3 a6                	repz cmpsb %es:(%di),%ds:(%si)
    1d1e:	0f 95 c0             	setne  %al
    1d21:	66 0f b6 c0          	movzbl %al,%eax
    1d25:	66 5e                	pop    %esi
    1d27:	66 5f                	pop    %edi
    1d29:	66 c3                	retl   

00001d2b <strcmp>:
{
	return memcmp(s1, s2, len);
}

int strcmp(const char *str1, const char *str2)
{
    1d2b:	f3 0f 1e fb          	endbr32 
    1d2f:	66 57                	push   %edi
    1d31:	66 56                	push   %esi
    1d33:	66 53                	push   %ebx
    1d35:	66 89 c7             	mov    %eax,%edi
    1d38:	66 89 d6             	mov    %edx,%esi
	const unsigned char *s1 = (const unsigned char *)str1;
	const unsigned char *s2 = (const unsigned char *)str2;
	int delta = 0;

	while (*s1 || *s2) {
    1d3b:	66 31 c9             	xor    %ecx,%ecx
    1d3e:	67 66 0f b6 04 0f    	movzbl (%edi,%ecx,1),%eax
		delta = *s1 - *s2;
    1d44:	67 66 0f b6 14 0e    	movzbl (%esi,%ecx,1),%edx
	while (*s1 || *s2) {
    1d4a:	88 c3                	mov    %al,%bl
    1d4c:	08 d3                	or     %dl,%bl
    1d4e:	74 09                	je     1d59 <strcmp+0x2e>
		if (delta)
    1d50:	66 41                	inc    %ecx
    1d52:	66 29 d0             	sub    %edx,%eax
    1d55:	74 e7                	je     1d3e <strcmp+0x13>
    1d57:	eb 03                	jmp    1d5c <strcmp+0x31>
			return delta;
		s1++;
		s2++;
	}
	return 0;
    1d59:	66 31 c0             	xor    %eax,%eax
}
    1d5c:	66 5b                	pop    %ebx
    1d5e:	66 5e                	pop    %esi
    1d60:	66 5f                	pop    %edi
    1d62:	66 c3                	retl   

00001d64 <strncmp>:

int strncmp(const char *cs, const char *ct, size_t count)
{
    1d64:	f3 0f 1e fb          	endbr32 
	unsigned char c1, c2;

	while (count) {
    1d68:	66 01 d1             	add    %edx,%ecx
    1d6b:	66 39 ca             	cmp    %ecx,%edx
    1d6e:	75 05                	jne    1d75 <strncmp+0x11>
			return c1 < c2 ? -1 : 1;
		if (!c1)
			break;
		count--;
	}
	return 0;
    1d70:	66 31 c0             	xor    %eax,%eax
}
    1d73:	66 c3                	retl   
{
    1d75:	66 53                	push   %ebx
		c1 = *cs++;
    1d77:	66 40                	inc    %eax
    1d79:	67 8a 58 ff          	mov    -0x1(%eax),%bl
		c2 = *ct++;
    1d7d:	66 42                	inc    %edx
		if (c1 != c2)
    1d7f:	67 3a 5a ff          	cmp    -0x1(%edx),%bl
    1d83:	74 09                	je     1d8e <strncmp+0x2a>
			return c1 < c2 ? -1 : 1;
    1d85:	66 19 c0             	sbb    %eax,%eax
    1d88:	66 83 c8 01          	or     $0x1,%eax
    1d8c:	eb 0c                	jmp    1d9a <strncmp+0x36>
		if (!c1)
    1d8e:	84 db                	test   %bl,%bl
    1d90:	74 05                	je     1d97 <strncmp+0x33>
	while (count) {
    1d92:	66 39 ca             	cmp    %ecx,%edx
    1d95:	75 e0                	jne    1d77 <strncmp+0x13>
	return 0;
    1d97:	66 31 c0             	xor    %eax,%eax
}
    1d9a:	66 5b                	pop    %ebx
    1d9c:	66 c3                	retl   

00001d9e <strnlen>:

size_t strnlen(const char *s, size_t maxlen)
{
    1d9e:	f3 0f 1e fb          	endbr32 
    1da2:	66 89 c1             	mov    %eax,%ecx
	const char *es = s;
	while (*es && maxlen) {
    1da5:	66 01 c2             	add    %eax,%edx
    1da8:	66 39 d0             	cmp    %edx,%eax
    1dab:	74 0a                	je     1db7 <strnlen+0x19>
    1dad:	67 80 38 00          	cmpb   $0x0,(%eax)
    1db1:	74 04                	je     1db7 <strnlen+0x19>
		es++;
    1db3:	66 40                	inc    %eax
		maxlen--;
    1db5:	eb f1                	jmp    1da8 <strnlen+0xa>
	}

	return (es - s);
    1db7:	66 29 c8             	sub    %ecx,%eax
}
    1dba:	66 c3                	retl   

00001dbc <atou>:

unsigned int atou(const char *s)
{
    1dbc:	f3 0f 1e fb          	endbr32 
    1dc0:	66 53                	push   %ebx
    1dc2:	66 89 c2             	mov    %eax,%edx
	unsigned int i = 0;
    1dc5:	66 31 c0             	xor    %eax,%eax
    1dc8:	67 66 0f be 0a       	movsbl (%edx),%ecx
    1dcd:	67 66 8d 59 d0       	lea    -0x30(%ecx),%ebx
	while (isdigit(*s))
    1dd2:	66 83 fb 09          	cmp    $0x9,%ebx
    1dd6:	77 0e                	ja     1de6 <atou+0x2a>
		i = i * 10 + (*s++ - '0');
    1dd8:	66 42                	inc    %edx
    1dda:	66 6b c0 0a          	imul   $0xa,%eax,%eax
    1dde:	67 66 8d 44 01 d0    	lea    -0x30(%ecx,%eax,1),%eax
    1de4:	eb e2                	jmp    1dc8 <atou+0xc>
	return i;
}
    1de6:	66 5b                	pop    %ebx
    1de8:	66 c3                	retl   

00001dea <simple_strtoull>:
 * @endp: A pointer to the end of the parsed string will be placed here
 * @base: The number base to use
 */

unsigned long long simple_strtoull(const char *cp, char **endp, unsigned int base)
{
    1dea:	f3 0f 1e fb          	endbr32 
    1dee:	66 55                	push   %ebp
    1df0:	66 89 e5             	mov    %esp,%ebp
    1df3:	66 57                	push   %edi
    1df5:	66 56                	push   %esi
    1df7:	66 53                	push   %ebx
    1df9:	66 83 ec 0c          	sub    $0xc,%esp
    1dfd:	66 89 c3             	mov    %eax,%ebx
    1e00:	67 66 89 14 24       	mov    %edx,(%esp)
	if (cp[0] == '0') {
    1e05:	67 8a 00             	mov    (%eax),%al
	unsigned long long result = 0;

	if (!base)
    1e08:	66 85 c9             	test   %ecx,%ecx
    1e0b:	75 3d                	jne    1e4a <simple_strtoull+0x60>
		return 10;
    1e0d:	66 b9 0a 00 00 00    	mov    $0xa,%ecx
	if (cp[0] == '0') {
    1e13:	3c 30                	cmp    $0x30,%al
    1e15:	75 53                	jne    1e6a <simple_strtoull+0x80>
		if (TOLOWER(cp[1]) == 'x' && isxdigit(cp[2]))
    1e17:	67 8a 43 01          	mov    0x1(%ebx),%al
    1e1b:	66 83 c8 20          	or     $0x20,%eax
			return 8;
    1e1f:	66 b9 08 00 00 00    	mov    $0x8,%ecx
		if (TOLOWER(cp[1]) == 'x' && isxdigit(cp[2]))
    1e25:	3c 78                	cmp    $0x78,%al
    1e27:	75 41                	jne    1e6a <simple_strtoull+0x80>
    1e29:	67 66 0f be 53 02    	movsbl 0x2(%ebx),%edx
    1e2f:	66 89 d0             	mov    %edx,%eax
    1e32:	66 83 ea 30          	sub    $0x30,%edx
}

static inline int isxdigit(int ch)
{
	if (isdigit(ch))
    1e36:	66 83 fa 09          	cmp    $0x9,%edx
    1e3a:	76 24                	jbe    1e60 <simple_strtoull+0x76>
    1e3c:	66 83 e0 df          	and    $0xffffffdf,%eax
    1e40:	66 83 e8 41          	sub    $0x41,%eax
    1e44:	3c 05                	cmp    $0x5,%al
    1e46:	76 18                	jbe    1e60 <simple_strtoull+0x76>
    1e48:	eb 20                	jmp    1e6a <simple_strtoull+0x80>
		base = simple_guess_base(cp);

	if (base == 16 && cp[0] == '0' && TOLOWER(cp[1]) == 'x')
    1e4a:	66 83 f9 10          	cmp    $0x10,%ecx
    1e4e:	75 1a                	jne    1e6a <simple_strtoull+0x80>
    1e50:	3c 30                	cmp    $0x30,%al
    1e52:	75 16                	jne    1e6a <simple_strtoull+0x80>
    1e54:	67 8a 43 01          	mov    0x1(%ebx),%al
    1e58:	66 83 c8 20          	or     $0x20,%eax
    1e5c:	3c 78                	cmp    $0x78,%al
    1e5e:	75 0a                	jne    1e6a <simple_strtoull+0x80>
		cp += 2;
    1e60:	66 83 c3 02          	add    $0x2,%ebx
    1e64:	66 b9 10 00 00 00    	mov    $0x10,%ecx
			return 8;
    1e6a:	67 66 c7 44 24 04 00 	movl   $0x0,0x4(%esp)
    1e71:	00 00 00 
    1e74:	67 66 c7 44 24 08 00 	movl   $0x0,0x8(%esp)
    1e7b:	00 00 00 

	while (isxdigit(*cp)) {
    1e7e:	67 66 0f b6 3b       	movzbl (%ebx),%edi
	return (ch >= '0') && (ch <= '9');
    1e83:	66 89 f8             	mov    %edi,%eax
    1e86:	66 0f be f0          	movsbl %al,%esi
    1e8a:	66 83 ee 30          	sub    $0x30,%esi
	if (isdigit(ch))
    1e8e:	66 83 fe 09          	cmp    $0x9,%esi
    1e92:	77 34                	ja     1ec8 <simple_strtoull+0xde>
		unsigned int value;

		value = isdigit(*cp) ? *cp - '0' : TOLOWER(*cp) - 'a' + 10;
		if (value >= base)
    1e94:	66 39 ce             	cmp    %ecx,%esi
    1e97:	73 52                	jae    1eeb <simple_strtoull+0x101>
			break;
		result = result * base + value;
    1e99:	67 66 8b 7c 24 08    	mov    0x8(%esp),%edi
    1e9f:	66 0f af f9          	imul   %ecx,%edi
    1ea3:	67 66 8b 44 24 04    	mov    0x4(%esp),%eax
    1ea9:	66 f7 e1             	mul    %ecx
    1eac:	66 01 fa             	add    %edi,%edx
    1eaf:	66 31 ff             	xor    %edi,%edi
    1eb2:	66 01 f0             	add    %esi,%eax
    1eb5:	66 11 fa             	adc    %edi,%edx
    1eb8:	67 66 89 44 24 04    	mov    %eax,0x4(%esp)
    1ebe:	67 66 89 54 24 08    	mov    %edx,0x8(%esp)
		cp++;
    1ec4:	66 43                	inc    %ebx
    1ec6:	eb b6                	jmp    1e7e <simple_strtoull+0x94>
	while (isxdigit(*cp)) {
    1ec8:	66 89 fe             	mov    %edi,%esi
    1ecb:	66 83 e6 df          	and    $0xffffffdf,%esi
    1ecf:	66 83 ee 41          	sub    $0x41,%esi
    1ed3:	66 89 f0             	mov    %esi,%eax
    1ed6:	3c 05                	cmp    $0x5,%al
    1ed8:	77 11                	ja     1eeb <simple_strtoull+0x101>
		value = isdigit(*cp) ? *cp - '0' : TOLOWER(*cp) - 'a' + 10;
    1eda:	66 83 cf 20          	or     $0x20,%edi
    1ede:	66 89 f8             	mov    %edi,%eax
    1ee1:	66 0f be f0          	movsbl %al,%esi
    1ee5:	66 83 ee 57          	sub    $0x57,%esi
    1ee9:	eb a9                	jmp    1e94 <simple_strtoull+0xaa>
	}
	if (endp)
    1eeb:	67 66 83 3c 24 00    	cmpl   $0x0,(%esp)
    1ef1:	74 09                	je     1efc <simple_strtoull+0x112>
		*endp = (char *)cp;
    1ef3:	67 66 8b 04 24       	mov    (%esp),%eax
    1ef8:	67 66 89 18          	mov    %ebx,(%eax)

	return result;
}
    1efc:	67 66 8b 44 24 04    	mov    0x4(%esp),%eax
    1f02:	67 66 8b 54 24 08    	mov    0x8(%esp),%edx
    1f08:	66 83 c4 0c          	add    $0xc,%esp
    1f0c:	66 5b                	pop    %ebx
    1f0e:	66 5e                	pop    %esi
    1f10:	66 5f                	pop    %edi
    1f12:	66 5d                	pop    %ebp
    1f14:	66 c3                	retl   

00001f16 <simple_strtol>:

long simple_strtol(const char *cp, char **endp, unsigned int base)
{
    1f16:	f3 0f 1e fb          	endbr32 
	if (*cp == '-')
    1f1a:	67 80 38 2d          	cmpb   $0x2d,(%eax)
    1f1e:	75 0d                	jne    1f2d <simple_strtol+0x17>
		return -simple_strtoull(cp + 1, endp, base);
    1f20:	66 40                	inc    %eax
    1f22:	66 e8 c2 fe ff ff    	calll  1dea <simple_strtoull>
    1f28:	66 f7 d8             	neg    %eax
    1f2b:	66 c3                	retl   

	return simple_strtoull(cp, endp, base);
    1f2d:	66 e8 b7 fe ff ff    	calll  1dea <simple_strtoull>
}
    1f33:	66 c3                	retl   

00001f35 <strlen>:
/**
 * strlen - Find the length of a string
 * @s: The string to be sized
 */
size_t strlen(const char *s)
{
    1f35:	f3 0f 1e fb          	endbr32 
    1f39:	66 89 c2             	mov    %eax,%edx
	const char *sc;

	for (sc = s; *sc != '\0'; ++sc)
    1f3c:	67 80 38 00          	cmpb   $0x0,(%eax)
    1f40:	74 04                	je     1f46 <strlen+0x11>
    1f42:	66 40                	inc    %eax
    1f44:	eb f6                	jmp    1f3c <strlen+0x7>
		/* nothing */;
	return sc - s;
    1f46:	66 29 d0             	sub    %edx,%eax
}
    1f49:	66 c3                	retl   

00001f4b <strstr>:
 * strstr - Find the first substring in a %NUL terminated string
 * @s1: The string to be searched
 * @s2: The string to search for
 */
char *strstr(const char *s1, const char *s2)
{
    1f4b:	f3 0f 1e fb          	endbr32 
    1f4f:	66 55                	push   %ebp
    1f51:	66 57                	push   %edi
    1f53:	66 56                	push   %esi
    1f55:	66 53                	push   %ebx
    1f57:	66 51                	push   %ecx
    1f59:	66 89 c1             	mov    %eax,%ecx
    1f5c:	66 89 d5             	mov    %edx,%ebp
	size_t l1, l2;

	l2 = strlen(s2);
    1f5f:	66 89 d0             	mov    %edx,%eax
    1f62:	66 e8 cd ff ff ff    	calll  1f35 <strlen>
	if (!l2)
    1f68:	66 85 c0             	test   %eax,%eax
    1f6b:	74 3a                	je     1fa7 <strstr+0x5c>
    1f6d:	66 89 c3             	mov    %eax,%ebx
		return (char *)s1;
	l1 = strlen(s1);
    1f70:	66 89 c8             	mov    %ecx,%eax
    1f73:	66 e8 bc ff ff ff    	calll  1f35 <strlen>
    1f79:	66 89 c2             	mov    %eax,%edx
	while (l1 >= l2) {
    1f7c:	66 01 c8             	add    %ecx,%eax
    1f7f:	67 66 89 04 24       	mov    %eax,(%esp)
    1f84:	67 66 8b 04 24       	mov    (%esp),%eax
    1f89:	66 29 d0             	sub    %edx,%eax
    1f8c:	66 39 da             	cmp    %ebx,%edx
    1f8f:	72 11                	jb     1fa2 <strstr+0x57>
		l1--;
    1f91:	66 4a                	dec    %edx
	asm("repe; cmpsb" CC_SET(nz)
    1f93:	66 89 c7             	mov    %eax,%edi
    1f96:	66 89 ee             	mov    %ebp,%esi
    1f99:	66 89 d9             	mov    %ebx,%ecx
    1f9c:	f3 a6                	repz cmpsb %es:(%di),%ds:(%si)
		if (!memcmp(s1, s2, l2))
    1f9e:	75 e4                	jne    1f84 <strstr+0x39>
    1fa0:	eb 08                	jmp    1faa <strstr+0x5f>
			return (char *)s1;
		s1++;
	}
	return NULL;
    1fa2:	66 31 c0             	xor    %eax,%eax
    1fa5:	eb 03                	jmp    1faa <strstr+0x5f>
		return (char *)s1;
    1fa7:	66 89 c8             	mov    %ecx,%eax
}
    1faa:	66 5a                	pop    %edx
    1fac:	66 5b                	pop    %ebx
    1fae:	66 5e                	pop    %esi
    1fb0:	66 5f                	pop    %edi
    1fb2:	66 5d                	pop    %ebp
    1fb4:	66 c3                	retl   

00001fb6 <strchr>:
 * strchr - Find the first occurrence of the character c in the string s.
 * @s: the string to be searched
 * @c: the character to search for
 */
char *strchr(const char *s, int c)
{
    1fb6:	f3 0f 1e fb          	endbr32 
	while (*s != (char)c)
    1fba:	67 8a 08             	mov    (%eax),%cl
    1fbd:	38 d1                	cmp    %dl,%cl
    1fbf:	74 0b                	je     1fcc <strchr+0x16>
		if (*s++ == '\0')
    1fc1:	66 40                	inc    %eax
    1fc3:	84 c9                	test   %cl,%cl
    1fc5:	75 f3                	jne    1fba <strchr+0x4>
			return NULL;
    1fc7:	66 31 c0             	xor    %eax,%eax
	return (char *)s;
}
    1fca:	66 c3                	retl   
    1fcc:	66 c3                	retl   

00001fce <kbd_pending>:

	return oreg.al;
}

static int kbd_pending(void)
{
    1fce:	66 83 ec 58          	sub    $0x58,%esp
	struct biosregs ireg, oreg;

	initregs(&ireg);
    1fd2:	66 89 e0             	mov    %esp,%eax
    1fd5:	66 e8 db fc ff ff    	calll  1cb6 <initregs>
	ireg.ah = 0x01;
    1fdb:	67 c6 44 24 1d 01    	movb   $0x1,0x1d(%esp)
	intcall(0x16, &ireg, &oreg);
    1fe1:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    1fe7:	66 89 e2             	mov    %esp,%edx
    1fea:	66 b8 16 00 00 00    	mov    $0x16,%eax
    1ff0:	66 e8 da e2 ff ff    	calll  2d0 <intcall>

	return !(oreg.eflags & X86_EFLAGS_ZF);
    1ff6:	67 66 8b 44 24 54    	mov    0x54(%esp),%eax
    1ffc:	66 c1 e8 06          	shr    $0x6,%eax
    2000:	66 83 f0 01          	xor    $0x1,%eax
    2004:	66 83 e0 01          	and    $0x1,%eax
}
    2008:	66 83 c4 58          	add    $0x58,%esp
    200c:	66 c3                	retl   

0000200e <gettime>:
{
    200e:	66 83 ec 58          	sub    $0x58,%esp
	initregs(&ireg);
    2012:	66 89 e0             	mov    %esp,%eax
    2015:	66 e8 9b fc ff ff    	calll  1cb6 <initregs>
	ireg.ah = 0x02;
    201b:	67 c6 44 24 1d 02    	movb   $0x2,0x1d(%esp)
	intcall(0x1a, &ireg, &oreg);
    2021:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    2027:	66 89 e2             	mov    %esp,%edx
    202a:	66 b8 1a 00 00 00    	mov    $0x1a,%eax
    2030:	66 e8 9a e2 ff ff    	calll  2d0 <intcall>
}
    2036:	67 8a 44 24 41       	mov    0x41(%esp),%al
    203b:	66 83 c4 58          	add    $0x58,%esp
    203f:	66 c3                	retl   

00002041 <getchar>:
{
    2041:	f3 0f 1e fb          	endbr32 
    2045:	66 83 ec 58          	sub    $0x58,%esp
	initregs(&ireg);
    2049:	66 89 e0             	mov    %esp,%eax
    204c:	66 e8 64 fc ff ff    	calll  1cb6 <initregs>
	intcall(0x16, &ireg, &oreg);
    2052:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    2058:	66 89 e2             	mov    %esp,%edx
    205b:	66 b8 16 00 00 00    	mov    $0x16,%eax
    2061:	66 e8 69 e2 ff ff    	calll  2d0 <intcall>
	return oreg.al;
    2067:	67 66 0f b6 44 24 48 	movzbl 0x48(%esp),%eax
}
    206e:	66 83 c4 58          	add    $0x58,%esp
    2072:	66 c3                	retl   

00002074 <kbd_flush>:

void kbd_flush(void)
{
    2074:	f3 0f 1e fb          	endbr32 
	for (;;) {
		if (!kbd_pending())
    2078:	66 e8 50 ff ff ff    	calll  1fce <kbd_pending>
    207e:	66 85 c0             	test   %eax,%eax
    2081:	74 08                	je     208b <kbd_flush+0x17>
			break;
		getchar();
    2083:	66 e8 b8 ff ff ff    	calll  2041 <getchar>
		if (!kbd_pending())
    2089:	eb ed                	jmp    2078 <kbd_flush+0x4>
	}
}
    208b:	66 c3                	retl   

0000208d <getchar_timeout>:

int getchar_timeout(void)
{
    208d:	f3 0f 1e fb          	endbr32 
    2091:	66 56                	push   %esi
    2093:	66 53                	push   %ebx
	int cnt = 30;
	int t0, t1;

	t0 = gettime();
    2095:	66 e8 73 ff ff ff    	calll  200e <gettime>
    209b:	66 0f b6 d8          	movzbl %al,%ebx
	int cnt = 30;
    209f:	66 be 1e 00 00 00    	mov    $0x1e,%esi

	while (cnt) {
		if (kbd_pending())
    20a5:	66 e8 23 ff ff ff    	calll  1fce <kbd_pending>
    20ab:	66 85 c0             	test   %eax,%eax
    20ae:	74 06                	je     20b6 <getchar_timeout+0x29>
			t0 = t1;
		}
	}

	return 0;		/* Timeout! */
}
    20b0:	66 5b                	pop    %ebx
    20b2:	66 5e                	pop    %esi
			return getchar();
    20b4:	eb 8b                	jmp    2041 <getchar>
		t1 = gettime();
    20b6:	66 e8 52 ff ff ff    	calll  200e <gettime>
    20bc:	66 0f b6 c0          	movzbl %al,%eax
		if (t0 != t1) {
    20c0:	66 39 d8             	cmp    %ebx,%eax
    20c3:	74 02                	je     20c7 <getchar_timeout+0x3a>
			cnt--;
    20c5:	66 4e                	dec    %esi
	while (cnt) {
    20c7:	66 85 f6             	test   %esi,%esi
    20ca:	74 05                	je     20d1 <getchar_timeout+0x44>
		t1 = gettime();
    20cc:	66 89 c3             	mov    %eax,%ebx
    20cf:	eb d4                	jmp    20a5 <getchar_timeout+0x18>
}
    20d1:	66 31 c0             	xor    %eax,%eax
    20d4:	66 5b                	pop    %ebx
    20d6:	66 5e                	pop    %esi
    20d8:	66 c3                	retl   

000020da <store_cursor_position>:
#include "vesa.h"

static u16 video_segment;

static void store_cursor_position(void)
{
    20da:	66 83 ec 58          	sub    $0x58,%esp
	struct biosregs ireg, oreg;

	initregs(&ireg);
    20de:	66 89 e0             	mov    %esp,%eax
    20e1:	66 e8 cf fb ff ff    	calll  1cb6 <initregs>
	ireg.ah = 0x03;
    20e7:	67 c6 44 24 1d 03    	movb   $0x3,0x1d(%esp)
	intcall(0x10, &ireg, &oreg);
    20ed:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    20f3:	66 89 e2             	mov    %esp,%edx
    20f6:	66 b8 10 00 00 00    	mov    $0x10,%eax
    20fc:	66 e8 ce e1 ff ff    	calll  2d0 <intcall>

	boot_params.screen_info.orig_x = oreg.dl;
    2102:	67 66 8b 44 24 40    	mov    0x40(%esp),%eax
    2108:	a3 70 45             	mov    %ax,0x4570
	boot_params.screen_info.orig_y = oreg.dh;

	if (oreg.ch & 0x20)
    210b:	67 8a 44 24 45       	mov    0x45(%esp),%al
    2110:	a8 20                	test   $0x20,%al
    2112:	74 05                	je     2119 <store_cursor_position+0x3f>
		boot_params.screen_info.flags |= VIDEO_FLAGS_NOCURSOR;
    2114:	80 0e 78 45 01       	orb    $0x1,0x4578

	if ((oreg.ch & 0x1f) > (oreg.cl & 0x1f))
    2119:	66 83 e0 1f          	and    $0x1f,%eax
    211d:	67 8a 54 24 44       	mov    0x44(%esp),%dl
    2122:	66 83 e2 1f          	and    $0x1f,%edx
    2126:	38 d0                	cmp    %dl,%al
    2128:	76 05                	jbe    212f <store_cursor_position+0x55>
		boot_params.screen_info.flags |= VIDEO_FLAGS_NOCURSOR;
    212a:	80 0e 78 45 01       	orb    $0x1,0x4578
}
    212f:	66 83 c4 58          	add    $0x58,%esp
    2133:	66 c3                	retl   

00002135 <store_mode_params.part.0>:
 * Store the video mode parameters for later usage by the kernel.
 * This is done by asking the BIOS except for the rows/columns
 * parameters in the default 80x25 mode -- these are set directly,
 * because some very obscure BIOSes supply insane values.
 */
static void store_mode_params(void)
    2135:	66 83 ec 58          	sub    $0x58,%esp
	/* For graphics mode, it is up to the mode-setting driver
	   (currently only video-vesa.c) to store the parameters */
	if (graphic_mode)
		return;

	store_cursor_position();
    2139:	66 e8 9b ff ff ff    	calll  20da <store_cursor_position>
	initregs(&ireg);
    213f:	66 89 e0             	mov    %esp,%eax
    2142:	66 e8 6e fb ff ff    	calll  1cb6 <initregs>
	ireg.ah = 0x0f;
    2148:	67 c6 44 24 1d 0f    	movb   $0xf,0x1d(%esp)
	intcall(0x10, &ireg, &oreg);
    214e:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    2154:	66 89 e2             	mov    %esp,%edx
    2157:	66 b8 10 00 00 00    	mov    $0x10,%eax
    215d:	66 e8 6d e1 ff ff    	calll  2d0 <intcall>
	boot_params.screen_info.orig_video_mode = oreg.al & 0x7f;
    2163:	67 8a 44 24 48       	mov    0x48(%esp),%al
    2168:	66 83 e0 7f          	and    $0x7f,%eax
    216c:	a2 76 45             	mov    %al,0x4576
	boot_params.screen_info.orig_video_page = oreg.bh;
    216f:	67 66 0f b6 54 24 3d 	movzbl 0x3d(%esp),%edx
    2176:	89 16 74 45          	mov    %dx,0x4574
	if (boot_params.screen_info.orig_video_mode == 0x07) {
		/* MDA, HGC, or VGA in monochrome mode */
		video_segment = 0xb000;
	} else {
		/* CGA, EGA, VGA and so forth */
		video_segment = 0xb800;
    217a:	66 ba 00 b8 ff ff    	mov    $0xffffb800,%edx
	if (boot_params.screen_info.orig_video_mode == 0x07) {
    2180:	3c 07                	cmp    $0x7,%al
    2182:	75 06                	jne    218a <store_mode_params.part.0+0x55>
    2184:	66 ba 00 b0 ff ff    	mov    $0xffffb000,%edx
    218a:	89 16 a4 55          	mov    %dx,0x55a4
	asm volatile("movw %0,%%fs" : : "rm" (seg));
    218e:	66 31 c0             	xor    %eax,%eax
    2191:	8e e0                	mov    %ax,%fs
	asm volatile("movw %%fs:%1,%0" : "=r" (v) : "m" (*(u16 *)addr));
    2193:	64 a1 85 04          	mov    %fs:0x485,%ax
	}

	set_fs(0);
	font_size = rdfs16(0x485); /* Font size, BIOS area */
	boot_params.screen_info.orig_video_points = font_size;
    2197:	a3 80 45             	mov    %ax,0x4580
    219a:	64 8b 0e 4a 04       	mov    %fs:0x44a,%cx

	x = rdfs16(0x44a);
	y = (adapter == ADAPTER_CGA) ? 25 : rdfs8(0x484)+1;
    219f:	66 b8 19 00 00 00    	mov    $0x19,%eax
    21a5:	66 83 3e b8 55 00    	cmpl   $0x0,0x55b8
    21ab:	74 0a                	je     21b7 <store_mode_params.part.0+0x82>
	asm volatile("movb %%fs:%1,%0" : "=q" (v) : "m" (*(u8 *)addr));
    21ad:	64 a0 84 04          	mov    %fs:0x484,%al
    21b1:	66 0f b6 c0          	movzbl %al,%eax
    21b5:	66 40                	inc    %eax

	if (force_x)
    21b7:	66 8b 16 b4 55       	mov    0x55b4,%edx
    21bc:	66 85 d2             	test   %edx,%edx
    21bf:	75 04                	jne    21c5 <store_mode_params.part.0+0x90>
	x = rdfs16(0x44a);
    21c1:	66 0f b7 d1          	movzwl %cx,%edx
		x = force_x;
	if (force_y)
    21c5:	66 8b 0e b0 55       	mov    0x55b0,%ecx
    21ca:	66 85 c9             	test   %ecx,%ecx
    21cd:	74 03                	je     21d2 <store_mode_params.part.0+0x9d>
    21cf:	66 89 c8             	mov    %ecx,%eax
		y = force_y;

	boot_params.screen_info.orig_video_cols  = x;
    21d2:	88 16 77 45          	mov    %dl,0x4577
	boot_params.screen_info.orig_video_lines = y;
    21d6:	a2 7e 45             	mov    %al,0x457e
}
    21d9:	66 83 c4 58          	add    $0x58,%esp
    21dd:	66 c3                	retl   

000021df <set_video>:

	store_cursor_position();
}

void set_video(void)
{
    21df:	f3 0f 1e fb          	endbr32 
    21e3:	66 55                	push   %ebp
    21e5:	66 57                	push   %edi
    21e7:	66 56                	push   %esi
    21e9:	66 53                	push   %ebx
    21eb:	66 83 ec 38          	sub    $0x38,%esp
	u16 mode = boot_params.hdr.vid_mode;
    21ef:	8b 1e 6a 47          	mov    0x476a,%bx

	RESET_HEAP();
    21f3:	66 c7 06 04 44 c0 57 	movl   $0x57c0,0x4404
    21fa:	00 00 
	if (graphic_mode)
    21fc:	66 83 3e a8 55 00    	cmpl   $0x0,0x55a8
    2202:	75 06                	jne    220a <set_video+0x2b>
    2204:	66 e8 2b ff ff ff    	calll  2135 <store_mode_params.part.0>
	saved.x = boot_params.screen_info.orig_video_cols;
    220a:	66 0f b6 0e 77 45    	movzbl 0x4577,%ecx
    2210:	66 89 0e 90 55       	mov    %ecx,0x5590
	saved.y = boot_params.screen_info.orig_video_lines;
    2215:	66 0f b6 06 7e 45    	movzbl 0x457e,%eax
    221b:	66 a3 94 55          	mov    %eax,0x5594
	saved.curx = boot_params.screen_info.orig_x;
    221f:	66 0f b6 16 70 45    	movzbl 0x4570,%edx
    2225:	66 89 16 98 55       	mov    %edx,0x5598
	saved.cury = boot_params.screen_info.orig_y;
    222a:	66 0f b6 16 71 45    	movzbl 0x4571,%edx
    2230:	66 89 16 9c 55       	mov    %edx,0x559c
	if (!heap_free(saved.x*saved.y*sizeof(u16)+512))
    2235:	66 0f af c8          	imul   %eax,%ecx
    2239:	66 81 c1 00 01 00 00 	add    $0x100,%ecx
    2240:	66 01 c9             	add    %ecx,%ecx
	return (int)(heap_end-HEAP) >= (int)n;
    2243:	66 a1 04 44          	mov    0x4404,%eax
    2247:	66 8b 16 00 44       	mov    0x4400,%edx
    224c:	66 29 c2             	sub    %eax,%edx
    224f:	66 39 ca             	cmp    %ecx,%edx
    2252:	7c 28                	jl     227c <set_video+0x9d>
	HEAP = (char *)(((size_t)HEAP+(a-1)) & ~(a-1));
    2254:	66 40                	inc    %eax
    2256:	66 83 e0 fe          	and    $0xfffffffe,%eax
	HEAP += s*n;
    225a:	66 81 e9 00 02 00 00 	sub    $0x200,%ecx
    2261:	67 66 8d 14 08       	lea    (%eax,%ecx,1),%edx
    2266:	66 89 16 04 44       	mov    %edx,0x4404
	saved.data = GET_HEAP(u16, saved.x*saved.y);
    226b:	66 a3 a0 55          	mov    %eax,0x55a0
	asm volatile("movw %0,%%fs" : : "rm" (seg));
    226f:	8e 26 a4 55          	mov    0x55a4,%fs
	copy_from_fs(saved.data, 0, saved.x*saved.y*sizeof(u16));
    2273:	66 31 d2             	xor    %edx,%edx
    2276:	66 e8 d2 e4 ff ff    	calll  74e <copy_from_fs>

	store_mode_params();
	save_screen();
	probe_cards(0);
    227c:	66 31 c0             	xor    %eax,%eax
    227f:	66 e8 13 04 00 00    	calll  2698 <probe_cards>

	for (;;) {
		if (mode == ASK_VGA)
    2285:	83 fb fd             	cmp    $0xfffd,%bx
    2288:	0f 85 b5 02          	jne    2541 <set_video+0x362>
	puts("Press <ENTER> to see video modes available, "
    228c:	66 b8 68 38 00 00    	mov    $0x3868,%eax
    2292:	66 e8 25 e1 ff ff    	calll  3bd <puts>
	kbd_flush();
    2298:	66 e8 d6 fd ff ff    	calll  2074 <kbd_flush>
		key = getchar_timeout();
    229e:	66 e8 e9 fd ff ff    	calll  208d <getchar_timeout>
		if (key == ' ' || key == 0)
    22a4:	66 a9 df ff ff ff    	test   $0xffffffdf,%eax
    22aa:	0f 84 8d 02          	je     253b <set_video+0x35c>
		if (key == '\r')
    22ae:	66 83 f8 0d          	cmp    $0xd,%eax
    22b2:	0f 84 c0 00          	je     2376 <set_video+0x197>
		putchar('\a');	/* Beep! */
    22b6:	66 b8 07 00 00 00    	mov    $0x7,%eax
    22bc:	66 e8 6d e0 ff ff    	calll  32f <putchar>
		key = getchar_timeout();
    22c2:	eb da                	jmp    229e <set_video+0xbf>
	if (col)
    22c4:	66 85 f6             	test   %esi,%esi
    22c7:	74 0c                	je     22d5 <set_video+0xf6>
		putchar('\n');
    22c9:	66 b8 0a 00 00 00    	mov    $0xa,%eax
    22cf:	66 e8 5a e0 ff ff    	calll  32f <putchar>
		puts("Enter a video mode or \"scan\" to scan for "
    22d5:	66 b8 ef 38 00 00    	mov    $0x38ef,%eax
    22db:	66 e8 dc e0 ff ff    	calll  3bd <puts>
	int i, len = 0;
    22e1:	66 31 f6             	xor    %esi,%esi
		key = getchar();
    22e4:	66 e8 57 fd ff ff    	calll  2041 <getchar>
    22ea:	66 89 c3             	mov    %eax,%ebx
		if (key == '\b') {
    22ed:	66 83 f8 08          	cmp    $0x8,%eax
    22f1:	0f 84 0d 02          	je     2502 <set_video+0x323>
		} else if ((key >= '0' && key <= '9') ||
    22f5:	67 66 8d 40 d0       	lea    -0x30(%eax),%eax
    22fa:	66 83 f8 09          	cmp    $0x9,%eax
    22fe:	0f 86 18 02          	jbe    251a <set_video+0x33b>
    2302:	66 89 d8             	mov    %ebx,%eax
    2305:	66 83 e0 df          	and    $0xffffffdf,%eax
    2309:	66 83 e8 41          	sub    $0x41,%eax
    230d:	66 83 f8 19          	cmp    $0x19,%eax
    2311:	0f 86 05 02          	jbe    251a <set_video+0x33b>
	} while (key != '\r');
    2315:	66 83 fb 0d          	cmp    $0xd,%ebx
    2319:	75 c9                	jne    22e4 <set_video+0x105>
	putchar('\n');
    231b:	66 b8 0a 00 00 00    	mov    $0xa,%eax
    2321:	66 e8 08 e0 ff ff    	calll  32f <putchar>
	if (len == 0)
    2327:	66 85 f6             	test   %esi,%esi
    232a:	0f 84 0d 02          	je     253b <set_video+0x35c>
	for (i = 0; i < len; i++) {
    232e:	66 31 d2             	xor    %edx,%edx
	v = 0;
    2331:	66 31 db             	xor    %ebx,%ebx
		v <<= 4;
    2334:	66 c1 e3 04          	shl    $0x4,%ebx
		key = entry_buf[i] | 0x20;
    2338:	67 8a 44 14 0c       	mov    0xc(%esp,%edx,1),%al
    233d:	66 83 c8 20          	or     $0x20,%eax
    2341:	66 0f be c0          	movsbl %al,%eax
		v += (key > '9') ? key-'a'+10 : key-'0';
    2345:	67 66 8d 48 d0       	lea    -0x30(%eax),%ecx
    234a:	66 83 f8 39          	cmp    $0x39,%eax
    234e:	7e 05                	jle    2355 <set_video+0x176>
    2350:	67 66 8d 48 a9       	lea    -0x57(%eax),%ecx
    2355:	66 01 cb             	add    %ecx,%ebx
	for (i = 0; i < len; i++) {
    2358:	66 42                	inc    %edx
    235a:	66 39 f2             	cmp    %esi,%edx
    235d:	75 d5                	jne    2334 <set_video+0x155>
		if (sel != SCAN)
    235f:	66 81 fb b7 cc 01 00 	cmp    $0x1ccb7,%ebx
    2366:	0f 85 d7 01          	jne    2541 <set_video+0x362>
		probe_cards(1);
    236a:	66 b8 01 00 00 00    	mov    $0x1,%eax
    2370:	66 e8 22 03 00 00    	calll  2698 <probe_cards>
	nmodes = 0;
    2376:	66 31 d2             	xor    %edx,%edx
	for (card = video_cards; card < video_cards_end; card++)
    2379:	66 b8 94 43 00 00    	mov    $0x4394,%eax
    237f:	66 3d e8 43 00 00    	cmp    $0x43e8,%eax
    2385:	73 0b                	jae    2392 <set_video+0x1b3>
		nmodes += card->nmodes;
    2387:	67 66 03 50 10       	add    0x10(%eax),%edx
	for (card = video_cards; card < video_cards_end; card++)
    238c:	66 83 c0 1c          	add    $0x1c,%eax
    2390:	eb ed                	jmp    237f <set_video+0x1a0>
		modes_per_line = 3;
    2392:	66 31 c0             	xor    %eax,%eax
    2395:	66 83 fa 14          	cmp    $0x14,%edx
    2399:	0f 9d c0             	setge  %al
    239c:	67 66 8d 44 00 01    	lea    0x1(%eax,%eax,1),%eax
    23a2:	67 66 89 44 24 04    	mov    %eax,0x4(%esp)
	for (col = 0; col < modes_per_line; col++)
    23a8:	66 31 db             	xor    %ebx,%ebx
		puts("Mode: Resolution:  Type: ");
    23ab:	66 b8 b9 38 00 00    	mov    $0x38b9,%eax
    23b1:	66 e8 06 e0 ff ff    	calll  3bd <puts>
	for (col = 0; col < modes_per_line; col++)
    23b7:	66 43                	inc    %ebx
    23b9:	67 66 3b 5c 24 04    	cmp    0x4(%esp),%ebx
    23bf:	75 ea                	jne    23ab <set_video+0x1cc>
	putchar('\n');
    23c1:	66 b8 0a 00 00 00    	mov    $0xa,%eax
    23c7:	66 e8 62 df ff ff    	calll  32f <putchar>
	col = 0;
    23cd:	66 31 f6             	xor    %esi,%esi
	ch = '0';
    23d0:	67 c6 04 24 30       	movb   $0x30,(%esp)
	for (card = video_cards; card < video_cards_end; card++) {
    23d5:	66 bd 94 43 00 00    	mov    $0x4394,%ebp
    23db:	66 81 fd e8 43 00 00 	cmp    $0x43e8,%ebp
    23e2:	0f 83 de fe          	jae    22c4 <set_video+0xe5>
		mi = card->modes;
    23e6:	67 66 8b 7d 0c       	mov    0xc(%ebp),%edi
		for (i = 0; i < card->nmodes; i++, mi++) {
    23eb:	66 31 db             	xor    %ebx,%ebx
    23ee:	67 66 3b 5d 10       	cmp    0x10(%ebp),%ebx
    23f3:	0f 8d 04 01          	jge    24fb <set_video+0x31c>
			int visible = mi->x && mi->y;
    23f7:	67 8b 4c df 02       	mov    0x2(%edi,%ebx,8),%cx
    23fc:	66 31 d2             	xor    %edx,%edx
    23ff:	85 c9                	test   %cx,%cx
    2401:	74 0c                	je     240f <set_video+0x230>
    2403:	66 31 d2             	xor    %edx,%edx
    2406:	67 83 7c df 04 00    	cmpw   $0x0,0x4(%edi,%ebx,8)
    240c:	0f 95 c2             	setne  %dl
			u16 mode_id = mi->mode ? mi->mode :
    240f:	67 8b 04 df          	mov    (%edi,%ebx,8),%ax
    2413:	67 89 44 24 0a       	mov    %ax,0xa(%esp)
    2418:	85 c0                	test   %ax,%ax
    241a:	75 11                	jne    242d <set_video+0x24e>
				(mi->y << 8)+mi->x;
    241c:	67 8b 44 df 04       	mov    0x4(%edi,%ebx,8),%ax
    2421:	66 c1 e0 08          	shl    $0x8,%eax
			u16 mode_id = mi->mode ? mi->mode :
    2425:	66 01 c8             	add    %ecx,%eax
    2428:	67 89 44 24 0a       	mov    %ax,0xa(%esp)
			if (!visible)
    242d:	66 85 d2             	test   %edx,%edx
    2430:	0f 84 c2 00          	je     24f6 <set_video+0x317>
			if (mi->depth)
    2434:	67 66 0f b7 44 df 06 	movzwl 0x6(%edi,%ebx,8),%eax
				sprintf(resbuf, "%dx%d", mi->y, mi->depth);
    243b:	67 66 0f b7 54 df 04 	movzwl 0x4(%edi,%ebx,8),%edx
			if (mi->depth)
    2442:	85 c0                	test   %ax,%ax
    2444:	74 1e                	je     2464 <set_video+0x285>
				sprintf(resbuf, "%dx%d", mi->y, mi->depth);
    2446:	66 50                	push   %eax
    2448:	66 52                	push   %edx
    244a:	66 68 d3 38 00 00    	pushl  $0x38d3
    2450:	67 66 8d 44 24 18    	lea    0x18(%esp),%eax
    2456:	66 50                	push   %eax
    2458:	66 e8 f8 f7 ff ff    	calll  1c56 <sprintf>
    245e:	66 83 c4 10          	add    $0x10,%esp
    2462:	eb 1a                	jmp    247e <set_video+0x29f>
				sprintf(resbuf, "%d", mi->y);
    2464:	66 52                	push   %edx
    2466:	66 68 d6 38 00 00    	pushl  $0x38d6
    246c:	67 66 8d 44 24 14    	lea    0x14(%esp),%eax
    2472:	66 50                	push   %eax
    2474:	66 e8 dc f7 ff ff    	calll  1c56 <sprintf>
    247a:	66 83 c4 0c          	add    $0xc,%esp
			printf("%c %03X %4dx%-7s %-6s",
    247e:	67 66 ff 75 00       	pushl  0x0(%ebp)
    2483:	67 66 8d 44 24 10    	lea    0x10(%esp),%eax
    2489:	66 50                	push   %eax
    248b:	67 66 0f b7 44 df 02 	movzwl 0x2(%edi,%ebx,8),%eax
    2492:	66 50                	push   %eax
    2494:	67 66 0f b7 44 24 16 	movzwl 0x16(%esp),%eax
    249b:	66 50                	push   %eax
    249d:	67 66 0f be 44 24 10 	movsbl 0x10(%esp),%eax
    24a4:	66 50                	push   %eax
    24a6:	66 68 d9 38 00 00    	pushl  $0x38d9
    24ac:	66 e8 c2 f7 ff ff    	calll  1c74 <printf>
			col++;
    24b2:	66 46                	inc    %esi
			if (col >= modes_per_line) {
    24b4:	66 83 c4 18          	add    $0x18,%esp
    24b8:	67 66 39 74 24 04    	cmp    %esi,0x4(%esp)
    24be:	7f 0f                	jg     24cf <set_video+0x2f0>
				putchar('\n');
    24c0:	66 b8 0a 00 00 00    	mov    $0xa,%eax
    24c6:	66 e8 63 de ff ff    	calll  32f <putchar>
				col = 0;
    24cc:	66 31 f6             	xor    %esi,%esi
			if (ch == '9')
    24cf:	67 80 3c 24 39       	cmpb   $0x39,(%esp)
    24d4:	74 14                	je     24ea <set_video+0x30b>
			else if (ch == 'z' || ch == ' ')
    24d6:	67 80 3c 24 20       	cmpb   $0x20,(%esp)
    24db:	74 14                	je     24f1 <set_video+0x312>
    24dd:	67 80 3c 24 7a       	cmpb   $0x7a,(%esp)
    24e2:	74 0d                	je     24f1 <set_video+0x312>
				ch++;
    24e4:	67 fe 04 24          	incb   (%esp)
    24e8:	eb 0c                	jmp    24f6 <set_video+0x317>
				ch = 'a';
    24ea:	67 c6 04 24 61       	movb   $0x61,(%esp)
    24ef:	eb 05                	jmp    24f6 <set_video+0x317>
				ch = ' '; /* Out of keys... */
    24f1:	67 c6 04 24 20       	movb   $0x20,(%esp)
		for (i = 0; i < card->nmodes; i++, mi++) {
    24f6:	66 43                	inc    %ebx
    24f8:	e9 f3 fe             	jmp    23ee <set_video+0x20f>
	for (card = video_cards; card < video_cards_end; card++) {
    24fb:	66 83 c5 1c          	add    $0x1c,%ebp
    24ff:	e9 d9 fe             	jmp    23db <set_video+0x1fc>
			if (len > 0) {
    2502:	66 85 f6             	test   %esi,%esi
    2505:	0f 84 db fd          	je     22e4 <set_video+0x105>
				puts("\b \b");
    2509:	66 b8 2b 39 00 00    	mov    $0x392b,%eax
    250f:	66 e8 a8 de ff ff    	calll  3bd <puts>
				len--;
    2515:	66 4e                	dec    %esi
    2517:	e9 ca fd             	jmp    22e4 <set_video+0x105>
			if (len < sizeof entry_buf) {
    251a:	66 83 fe 03          	cmp    $0x3,%esi
    251e:	0f 8f f3 fd          	jg     2315 <set_video+0x136>
				entry_buf[len++] = key;
    2522:	67 66 8d 7e 01       	lea    0x1(%esi),%edi
    2527:	67 88 5c 34 0c       	mov    %bl,0xc(%esp,%esi,1)
				putchar(key);
    252c:	66 89 d8             	mov    %ebx,%eax
    252f:	66 e8 fa dd ff ff    	calll  32f <putchar>
				entry_buf[len++] = key;
    2535:	66 89 fe             	mov    %edi,%esi
    2538:	e9 da fd             	jmp    2315 <set_video+0x136>
			return VIDEO_CURRENT_MODE; /* Default */
    253b:	66 bb 04 0f 00 00    	mov    $0xf04,%ebx
			mode = mode_menu();

		if (!set_mode(mode))
    2541:	66 0f b7 f3          	movzwl %bx,%esi
    2545:	66 89 f0             	mov    %esi,%eax
    2548:	66 e8 ff 01 00 00    	calll  274d <set_mode>
    254e:	66 85 c0             	test   %eax,%eax
    2551:	74 15                	je     2568 <set_video+0x389>
			break;

		printf("Undefined video mode number: %x\n", mode);
    2553:	66 56                	push   %esi
    2555:	66 68 2f 39 00 00    	pushl  $0x392f
    255b:	66 e8 13 f7 ff ff    	calll  1c74 <printf>
    2561:	66 58                	pop    %eax
    2563:	66 5a                	pop    %edx
    2565:	e9 24 fd             	jmp    228c <set_video+0xad>
		mode = ASK_VGA;
	}
	boot_params.hdr.vid_mode = mode;
    2568:	89 1e 6a 47          	mov    %bx,0x476a
	vesa_store_edid();
    256c:	66 e8 1e 0b 00 00    	calll  3090 <vesa_store_edid>
	if (graphic_mode)
    2572:	66 83 3e a8 55 00    	cmpl   $0x0,0x55a8
    2578:	75 06                	jne    2580 <set_video+0x3a1>
    257a:	66 e8 b5 fb ff ff    	calll  2135 <store_mode_params.part.0>
	store_mode_params();

	if (do_restore)
    2580:	66 83 3e ac 55 00    	cmpl   $0x0,0x55ac
    2586:	0f 84 00 01          	je     268a <set_video+0x4ab>
	u16 *src = saved.data;
    258a:	66 8b 2e a0 55       	mov    0x55a0,%ebp
	if (!src)
    258f:	66 83 3e a8 55 00    	cmpl   $0x0,0x55a8
    2595:	0f 85 f1 00          	jne    268a <set_video+0x4ab>
    2599:	66 85 ed             	test   %ebp,%ebp
    259c:	0f 84 ea 00          	je     268a <set_video+0x4ab>
	int xs = boot_params.screen_info.orig_video_cols;
    25a0:	66 0f b6 1e 77 45    	movzbl 0x4577,%ebx
	int ys = boot_params.screen_info.orig_video_lines;
    25a6:	66 0f b6 06 7e 45    	movzbl 0x457e,%eax
    25ac:	67 66 89 04 24       	mov    %eax,(%esp)
    25b1:	8e 26 a4 55          	mov    0x55a4,%fs
	for (y = 0; y < ys; y++) {
    25b5:	66 31 f6             	xor    %esi,%esi
	addr_t dst = 0;
    25b8:	66 31 ff             	xor    %edi,%edi
	for (y = 0; y < ys; y++) {
    25bb:	67 66 39 34 24       	cmp    %esi,(%esp)
    25c0:	7e 69                	jle    262b <set_video+0x44c>
	int xs = boot_params.screen_info.orig_video_cols;
    25c2:	66 89 d9             	mov    %ebx,%ecx
		if (y < saved.y) {
    25c5:	66 39 36 94 55       	cmp    %esi,0x5594
    25ca:	7e 45                	jle    2611 <set_video+0x432>
			int copy = (xs < saved.x) ? xs : saved.x;
    25cc:	66 8b 0e 90 55       	mov    0x5590,%ecx
    25d1:	66 39 d9             	cmp    %ebx,%ecx
    25d4:	7e 03                	jle    25d9 <set_video+0x3fa>
    25d6:	66 89 d9             	mov    %ebx,%ecx
			copy_to_fs(dst, src, copy*sizeof(u16));
    25d9:	66 01 c9             	add    %ecx,%ecx
    25dc:	67 66 89 4c 24 04    	mov    %ecx,0x4(%esp)
    25e2:	66 89 ea             	mov    %ebp,%edx
    25e5:	66 89 f8             	mov    %edi,%eax
    25e8:	66 e8 6d e1 ff ff    	calll  75b <copy_to_fs>
			dst += copy*sizeof(u16);
    25ee:	67 66 8b 4c 24 04    	mov    0x4(%esp),%ecx
    25f4:	66 01 cf             	add    %ecx,%edi
			src += saved.x;
    25f7:	66 a1 90 55          	mov    0x5590,%eax
    25fb:	67 66 8d 14 00       	lea    (%eax,%eax,1),%edx
    2600:	66 01 d5             	add    %edx,%ebp
			npad = (xs < saved.x) ? 0 : xs-saved.x;
    2603:	66 31 c9             	xor    %ecx,%ecx
    2606:	66 39 c3             	cmp    %eax,%ebx
    2609:	7c 06                	jl     2611 <set_video+0x432>
    260b:	66 89 d9             	mov    %ebx,%ecx
    260e:	66 29 c1             	sub    %eax,%ecx
		asm volatile("pushw %%es ; "
    2611:	8b 16 a4 55          	mov    0x55a4,%dx
    2615:	66 b8 20 07 20 07    	mov    $0x7200720,%eax
    261b:	06                   	push   %es
    261c:	8e c2                	mov    %dx,%es
    261e:	d1 e9                	shr    %cx
    2620:	73 01                	jae    2623 <set_video+0x444>
    2622:	ab                   	stos   %ax,%es:(%di)
    2623:	f3 66 ab             	rep stos %eax,%es:(%di)
    2626:	07                   	pop    %es
	for (y = 0; y < ys; y++) {
    2627:	66 46                	inc    %esi
    2629:	eb 90                	jmp    25bb <set_video+0x3dc>
	if (saved.curx >= xs)
    262b:	66 3b 1e 98 55       	cmp    0x5598,%ebx
    2630:	7f 07                	jg     2639 <set_video+0x45a>
		saved.curx = xs-1;
    2632:	66 4b                	dec    %ebx
    2634:	66 89 1e 98 55       	mov    %ebx,0x5598
	if (saved.cury >= ys)
    2639:	67 66 8b 04 24       	mov    (%esp),%eax
    263e:	66 3b 06 9c 55       	cmp    0x559c,%eax
    2643:	7f 06                	jg     264b <set_video+0x46c>
		saved.cury = ys-1;
    2645:	66 48                	dec    %eax
    2647:	66 a3 9c 55          	mov    %eax,0x559c
	initregs(&ireg);
    264b:	67 66 8d 44 24 0c    	lea    0xc(%esp),%eax
    2651:	66 e8 5f f6 ff ff    	calll  1cb6 <initregs>
	ireg.ah = 0x02;		/* Set cursor position */
    2657:	67 c6 44 24 29 02    	movb   $0x2,0x29(%esp)
	ireg.dh = saved.cury;
    265d:	66 a1 9c 55          	mov    0x559c,%eax
    2661:	67 88 44 24 21       	mov    %al,0x21(%esp)
	ireg.dl = saved.curx;
    2666:	66 a1 98 55          	mov    0x5598,%eax
    266a:	67 88 44 24 20       	mov    %al,0x20(%esp)
	intcall(0x10, &ireg, NULL);
    266f:	66 31 c9             	xor    %ecx,%ecx
    2672:	67 66 8d 54 24 0c    	lea    0xc(%esp),%edx
    2678:	66 b8 10 00 00 00    	mov    $0x10,%eax
    267e:	66 e8 4c dc ff ff    	calll  2d0 <intcall>
	store_cursor_position();
    2684:	66 e8 50 fa ff ff    	calll  20da <store_cursor_position>
		restore_screen();
}
    268a:	66 83 c4 38          	add    $0x38,%esp
    268e:	66 5b                	pop    %ebx
    2690:	66 5e                	pop    %esi
    2692:	66 5f                	pop    %edi
    2694:	66 5d                	pop    %ebp
    2696:	66 c3                	retl   

00002698 <probe_cards>:
int do_restore;		/* Screen contents changed during mode flip */
int graphic_mode;	/* Graphic mode with linear frame buffer */

/* Probe the video drivers and have them generate their mode lists. */
void probe_cards(int unsafe)
{
    2698:	f3 0f 1e fb          	endbr32 
	struct card_info *card;
	static u8 probed[2];

	if (probed[unsafe])
    269c:	67 80 b8 bc 55 00 00 	cmpb   $0x0,0x55bc(%eax)
    26a3:	00 
    26a4:	75 4e                	jne    26f4 <probe_cards+0x5c>
{
    26a6:	66 56                	push   %esi
    26a8:	66 53                	push   %ebx
    26aa:	66 89 c6             	mov    %eax,%esi
		return;

	probed[unsafe] = 1;
    26ad:	67 c6 80 bc 55 00 00 	movb   $0x1,0x55bc(%eax)
    26b4:	01 

	for (card = video_cards; card < video_cards_end; card++) {
    26b5:	66 bb 94 43 00 00    	mov    $0x4394,%ebx
    26bb:	66 81 fb e8 43 00 00 	cmp    $0x43e8,%ebx
    26c2:	73 2a                	jae    26ee <probe_cards+0x56>
		if (card->unsafe == unsafe) {
    26c4:	67 66 39 73 14       	cmp    %esi,0x14(%ebx)
    26c9:	75 1d                	jne    26e8 <probe_cards+0x50>
			if (card->probe)
    26cb:	67 66 8b 43 08       	mov    0x8(%ebx),%eax
    26d0:	66 85 c0             	test   %eax,%eax
    26d3:	74 0a                	je     26df <probe_cards+0x47>
				card->nmodes = card->probe();
    26d5:	66 ff d0             	calll  *%eax
    26d8:	67 66 89 43 10       	mov    %eax,0x10(%ebx)
    26dd:	eb 09                	jmp    26e8 <probe_cards+0x50>
			else
				card->nmodes = 0;
    26df:	67 66 c7 43 10 00 00 	movl   $0x0,0x10(%ebx)
    26e6:	00 00 
	for (card = video_cards; card < video_cards_end; card++) {
    26e8:	66 83 c3 1c          	add    $0x1c,%ebx
    26ec:	eb cd                	jmp    26bb <probe_cards+0x23>
		}
	}
}
    26ee:	66 5b                	pop    %ebx
    26f0:	66 5e                	pop    %esi
    26f2:	66 c3                	retl   
    26f4:	66 c3                	retl   

000026f6 <mode_defined>:

/* Test if a mode is defined */
int mode_defined(u16 mode)
{
    26f6:	f3 0f 1e fb          	endbr32 
    26fa:	66 89 c1             	mov    %eax,%ecx
	struct card_info *card;
	struct mode_info *mi;
	int i;

	for (card = video_cards; card < video_cards_end; card++) {
    26fd:	66 b8 94 43 00 00    	mov    $0x4394,%eax
    2703:	66 3d e8 43 00 00    	cmp    $0x43e8,%eax
    2709:	72 05                	jb     2710 <mode_defined+0x1a>
			if (mi->mode == mode)
				return 1;
		}
	}

	return 0;
    270b:	66 31 c0             	xor    %eax,%eax
}
    270e:	66 c3                	retl   
{
    2710:	66 56                	push   %esi
    2712:	66 53                	push   %ebx
		mi = card->modes;
    2714:	67 66 8b 70 0c       	mov    0xc(%eax),%esi
		for (i = 0; i < card->nmodes; i++, mi++) {
    2719:	67 66 8b 58 10       	mov    0x10(%eax),%ebx
    271e:	66 31 d2             	xor    %edx,%edx
    2721:	66 39 d3             	cmp    %edx,%ebx
    2724:	7e 0a                	jle    2730 <mode_defined+0x3a>
			if (mi->mode == mode)
    2726:	67 39 0c d6          	cmp    %cx,(%esi,%edx,8)
    272a:	74 15                	je     2741 <mode_defined+0x4b>
		for (i = 0; i < card->nmodes; i++, mi++) {
    272c:	66 42                	inc    %edx
    272e:	eb f1                	jmp    2721 <mode_defined+0x2b>
	for (card = video_cards; card < video_cards_end; card++) {
    2730:	66 83 c0 1c          	add    $0x1c,%eax
    2734:	66 3d e8 43 00 00    	cmp    $0x43e8,%eax
    273a:	72 d8                	jb     2714 <mode_defined+0x1e>
	return 0;
    273c:	66 31 c0             	xor    %eax,%eax
    273f:	eb 06                	jmp    2747 <mode_defined+0x51>
				return 1;
    2741:	66 b8 01 00 00 00    	mov    $0x1,%eax
}
    2747:	66 5b                	pop    %ebx
    2749:	66 5e                	pop    %esi
    274b:	66 c3                	retl   

0000274d <set_mode>:
	out_idx(ov, crtc, 0x07);
}

/* Set mode (with recalc if specified) */
int set_mode(u16 mode)
{
    274d:	f3 0f 1e fb          	endbr32 
    2751:	66 55                	push   %ebp
    2753:	66 57                	push   %edi
    2755:	66 56                	push   %esi
    2757:	66 53                	push   %ebx
    2759:	66 83 ec 20          	sub    $0x20,%esp
	int rv;
	u16 real_mode;

	/* Very special mode numbers... */
	if (mode == VIDEO_CURRENT_MODE)
		return 0;	/* Nothing to do... */
    275d:	66 31 ff             	xor    %edi,%edi
	if (mode == VIDEO_CURRENT_MODE)
    2760:	3d 04 0f             	cmp    $0xf04,%ax
    2763:	0f 84 f9 01          	je     2960 <set_mode+0x213>
	else if (mode == NORMAL_VGA)
		mode = VIDEO_80x25;
    2767:	66 bb 00 0f 00 00    	mov    $0xf00,%ebx
	else if (mode == NORMAL_VGA)
    276d:	83 f8 ff             	cmp    $0xffff,%ax
    2770:	74 0e                	je     2780 <set_mode+0x33>
    2772:	66 89 c3             	mov    %eax,%ebx
	else if (mode == EXTENDED_VGA)
    2775:	83 f8 fe             	cmp    $0xfffe,%ax
    2778:	75 06                	jne    2780 <set_mode+0x33>
		mode = VIDEO_8POINT;
    277a:	66 bb 01 0f 00 00    	mov    $0xf01,%ebx
	mode &= ~VIDEO_RECALC;
    2780:	66 89 dd             	mov    %ebx,%ebp
    2783:	81 e5 ff 7f          	and    $0x7fff,%bp
	for (card = video_cards; card < video_cards_end; card++) {
    2787:	66 ba 94 43 00 00    	mov    $0x4394,%edx
	nmode = 0;
    278d:	67 66 c7 44 24 08 00 	movl   $0x0,0x8(%esp)
    2794:	00 00 00 
			if ((mode == nmode && visible) ||
    2797:	66 89 d8             	mov    %ebx,%eax
    279a:	66 25 ff 7f 00 00    	and    $0x7fff,%eax
    27a0:	67 66 89 44 24 10    	mov    %eax,0x10(%esp)
	for (card = video_cards; card < video_cards_end; card++) {
    27a6:	66 81 fa e8 43 00 00 	cmp    $0x43e8,%edx
    27ad:	0f 83 b4 00          	jae    2865 <set_mode+0x118>
		mi = card->modes;
    27b1:	67 66 8b 42 0c       	mov    0xc(%edx),%eax
		for (i = 0; i < card->nmodes; i++, mi++) {
    27b6:	67 66 8b 72 10       	mov    0x10(%edx),%esi
    27bb:	67 66 89 74 24 14    	mov    %esi,0x14(%esp)
    27c1:	67 66 c7 44 24 0c 00 	movl   $0x0,0xc(%esp)
    27c8:	00 00 00 
    27cb:	67 66 8b 74 24 14    	mov    0x14(%esp),%esi
    27d1:	67 66 39 74 24 0c    	cmp    %esi,0xc(%esp)
    27d7:	0f 8d 83 00          	jge    285e <set_mode+0x111>
			int visible = mi->x || mi->y;
    27db:	67 8b 70 02          	mov    0x2(%eax),%si
    27df:	67 89 74 24 06       	mov    %si,0x6(%esp)
    27e4:	67 66 c7 04 24 01 00 	movl   $0x1,(%esp)
    27eb:	00 00 
    27ed:	85 f6                	test   %si,%si
    27ef:	75 10                	jne    2801 <set_mode+0xb4>
    27f1:	66 31 c9             	xor    %ecx,%ecx
    27f4:	67 83 78 04 00       	cmpw   $0x0,0x4(%eax)
    27f9:	0f 95 c1             	setne  %cl
    27fc:	67 66 89 0c 24       	mov    %ecx,(%esp)
			    mode == mi->mode ||
    2801:	67 8b 30             	mov    (%eax),%si
			if ((mode == nmode && visible) ||
    2804:	67 66 8b 7c 24 08    	mov    0x8(%esp),%edi
    280a:	67 66 39 7c 24 10    	cmp    %edi,0x10(%esp)
    2810:	75 08                	jne    281a <set_mode+0xcd>
    2812:	67 66 83 3c 24 00    	cmpl   $0x0,(%esp)
    2818:	75 20                	jne    283a <set_mode+0xed>
    281a:	39 f5                	cmp    %si,%bp
    281c:	74 1c                	je     283a <set_mode+0xed>
			    mode == (mi->y << 8)+mi->x) {
    281e:	67 66 0f b7 48 04    	movzwl 0x4(%eax),%ecx
    2824:	66 c1 e1 08          	shl    $0x8,%ecx
    2828:	67 66 0f b7 7c 24 06 	movzwl 0x6(%esp),%edi
    282f:	66 01 cf             	add    %ecx,%edi
			    mode == mi->mode ||
    2832:	67 66 39 7c 24 10    	cmp    %edi,0x10(%esp)
    2838:	75 0a                	jne    2844 <set_mode+0xf7>
				return card->set_mode(mi);
    283a:	67 66 ff 52 04       	calll  *0x4(%edx)
    283f:	66 89 c7             	mov    %eax,%edi
    2842:	eb 7b                	jmp    28bf <set_mode+0x172>
				nmode++;
    2844:	67 66 83 3c 24 01    	cmpl   $0x1,(%esp)
    284a:	67 66 83 5c 24 08 ff 	sbbl   $0xffffffff,0x8(%esp)
		for (i = 0; i < card->nmodes; i++, mi++) {
    2851:	67 66 ff 44 24 0c    	incl   0xc(%esp)
    2857:	66 83 c0 08          	add    $0x8,%eax
    285b:	e9 6d ff             	jmp    27cb <set_mode+0x7e>
	for (card = video_cards; card < video_cards_end; card++) {
    285e:	66 83 c2 1c          	add    $0x1c,%edx
    2862:	e9 41 ff             	jmp    27a6 <set_mode+0x59>
	for (card = video_cards; card < video_cards_end; card++) {
    2865:	66 ba 94 43 00 00    	mov    $0x4394,%edx
		    mode < card->xmode_first+card->xmode_n) {
    286b:	66 0f b7 cd          	movzwl %bp,%ecx
	for (card = video_cards; card < video_cards_end; card++) {
    286f:	66 81 fa e8 43 00 00 	cmp    $0x43e8,%edx
    2876:	73 40                	jae    28b8 <set_mode+0x16b>
		if (mode >= card->xmode_first &&
    2878:	67 66 0f b7 42 18    	movzwl 0x18(%edx),%eax
    287e:	39 c5                	cmp    %ax,%bp
    2880:	72 30                	jb     28b2 <set_mode+0x165>
		    mode < card->xmode_first+card->xmode_n) {
    2882:	67 66 0f b7 72 1a    	movzwl 0x1a(%edx),%esi
    2888:	66 01 f0             	add    %esi,%eax
		if (mode >= card->xmode_first &&
    288b:	66 39 c1             	cmp    %eax,%ecx
    288e:	7d 22                	jge    28b2 <set_mode+0x165>
			*real_mode = mix.mode = mode;
    2890:	67 89 6c 24 18       	mov    %bp,0x18(%esp)
			mix.x = mix.y = 0;
    2895:	67 66 c7 44 24 1a 00 	movl   $0x0,0x1a(%esp)
    289c:	00 00 00 
			return card->set_mode(&mix);
    289f:	67 66 8d 44 24 18    	lea    0x18(%esp),%eax
    28a5:	67 66 ff 52 04       	calll  *0x4(%edx)
    28aa:	66 89 c7             	mov    %eax,%edi
    28ad:	66 89 ee             	mov    %ebp,%esi
    28b0:	eb 0d                	jmp    28bf <set_mode+0x172>
	for (card = video_cards; card < video_cards_end; card++) {
    28b2:	66 83 c2 1c          	add    $0x1c,%edx
    28b6:	eb b7                	jmp    286f <set_mode+0x122>
	return -1;
    28b8:	66 83 cf ff          	or     $0xffffffff,%edi
    28bc:	e9 a1 00             	jmp    2960 <set_mode+0x213>

	rv = raw_set_mode(mode, &real_mode);
	if (rv)
    28bf:	66 85 ff             	test   %edi,%edi
    28c2:	0f 85 9a 00          	jne    2960 <set_mode+0x213>
		return rv;

	if (mode & VIDEO_RECALC)
    28c6:	85 db                	test   %bx,%bx
    28c8:	0f 89 90 00          	jns    295c <set_mode+0x20f>
    28cc:	66 31 c0             	xor    %eax,%eax
    28cf:	8e e0                	mov    %ax,%fs
	asm volatile("movb %%fs:%1,%0" : "=q" (v) : "m" (*(u8 *)addr));
    28d1:	64 8a 1e 85 04       	mov    %fs:0x485,%bl
	font_size = rdfs8(0x485); /* BIOS: font size (pixels) */
    28d6:	66 0f b6 db          	movzbl %bl,%ebx
	rows = force_y ? force_y : rdfs8(0x484)+1; /* Text rows */
    28da:	66 a1 b0 55          	mov    0x55b0,%eax
    28de:	66 85 c0             	test   %eax,%eax
    28e1:	75 0a                	jne    28ed <set_mode+0x1a0>
    28e3:	64 a0 84 04          	mov    %fs:0x484,%al
    28e7:	66 0f b6 c0          	movzbl %al,%eax
    28eb:	66 40                	inc    %eax
	rows *= font_size;	/* Visible scan lines */
    28ed:	66 0f af c3          	imul   %ebx,%eax
	rows--;			/* ... minus one */
    28f1:	67 66 8d 58 ff       	lea    -0x1(%eax),%ebx
	crtc = vga_crtc();
    28f6:	66 e8 25 02 00 00    	calll  2b21 <vga_crtc>
    28fc:	66 89 c1             	mov    %eax,%ecx
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
    28ff:	b0 11                	mov    $0x11,%al
    2901:	66 89 ca             	mov    %ecx,%edx
    2904:	ee                   	out    %al,(%dx)

/* Accessing VGA indexed registers */
static inline u8 in_idx(u16 port, u8 index)
{
	outb(index, port);
	return inb(port+1);
    2905:	67 66 8d 69 01       	lea    0x1(%ecx),%ebp
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
    290a:	66 89 ea             	mov    %ebp,%edx
    290d:	ec                   	in     (%dx),%al
}

static inline void out_idx(u8 v, u16 port, u8 index)
{
	outw(index+(v << 8), port);
    290e:	66 83 e0 7f          	and    $0x7f,%eax
    2912:	66 c1 e0 08          	shl    $0x8,%eax
    2916:	66 83 c0 11          	add    $0x11,%eax
	asm volatile("outw %0,%1" : : "a" (v), "dN" (port));
    291a:	66 89 ca             	mov    %ecx,%edx
    291d:	ef                   	out    %ax,(%dx)
    291e:	66 89 d8             	mov    %ebx,%eax
    2921:	66 c1 e0 08          	shl    $0x8,%eax
    2925:	66 83 c0 12          	add    $0x12,%eax
    2929:	ef                   	out    %ax,(%dx)
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
    292a:	b0 07                	mov    $0x7,%al
    292c:	ee                   	out    %al,(%dx)
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
    292d:	66 89 ea             	mov    %ebp,%edx
    2930:	ec                   	in     (%dx),%al
	ov &= 0xbd;
    2931:	66 83 e0 bd          	and    $0xffffffbd,%eax
    2935:	88 c2                	mov    %al,%dl
	ov |= (rows >> (8-1)) & 0x02;
    2937:	66 89 d8             	mov    %ebx,%eax
    293a:	66 c1 e8 07          	shr    $0x7,%eax
    293e:	66 83 e0 02          	and    $0x2,%eax
	ov |= (rows >> (9-6)) & 0x40;
    2942:	66 c1 eb 03          	shr    $0x3,%ebx
    2946:	66 83 e3 40          	and    $0x40,%ebx
    294a:	66 09 d8             	or     %ebx,%eax
    294d:	66 09 d0             	or     %edx,%eax
    2950:	66 c1 e0 08          	shl    $0x8,%eax
    2954:	66 83 c0 07          	add    $0x7,%eax
	asm volatile("outw %0,%1" : : "a" (v), "dN" (port));
    2958:	66 89 ca             	mov    %ecx,%edx
    295b:	ef                   	out    %ax,(%dx)
		vga_recalc_vertical();

	/* Save the canonical mode number for the kernel, not
	   an alias, size specification or menu position */
#ifndef _WAKEUP
	boot_params.hdr.vid_mode = real_mode;
    295c:	89 36 6a 47          	mov    %si,0x476a
#endif
	return 0;
}
    2960:	66 89 f8             	mov    %edi,%eax
    2963:	66 83 c4 20          	add    $0x20,%esp
    2967:	66 5b                	pop    %ebx
    2969:	66 5e                	pop    %esi
    296b:	66 5f                	pop    %edi
    296d:	66 5d                	pop    %ebp
    296f:	66 c3                	retl   

00002971 <vga_probe>:
 * Note: this probe includes basic information required by all
 * systems.  It should be executed first, by making sure
 * video-vga.c is listed first in the Makefile.
 */
static int vga_probe(void)
{
    2971:	f3 0f 1e fb          	endbr32 
    2975:	66 83 ec 58          	sub    $0x58,%esp
		ARRAY_SIZE(vga_modes),
	};

	struct biosregs ireg, oreg;

	initregs(&ireg);
    2979:	66 89 e0             	mov    %esp,%eax
    297c:	66 e8 34 f3 ff ff    	calll  1cb6 <initregs>

	ireg.ax = 0x1200;
    2982:	67 c7 44 24 1c 00 12 	movw   $0x1200,0x1c(%esp)
	ireg.bl = 0x10;		/* Check EGA/VGA */
    2989:	67 c6 44 24 10 10    	movb   $0x10,0x10(%esp)
	intcall(0x10, &ireg, &oreg);
    298f:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    2995:	66 89 e2             	mov    %esp,%edx
    2998:	66 b8 10 00 00 00    	mov    $0x10,%eax
    299e:	66 e8 2c d9 ff ff    	calll  2d0 <intcall>

#ifndef _WAKEUP
	boot_params.screen_info.orig_video_ega_bx = oreg.bx;
    29a4:	67 66 8b 44 24 3c    	mov    0x3c(%esp),%eax
    29aa:	a3 7a 45             	mov    %ax,0x457a
#endif

	/* If we have MDA/CGA/HGC then BL will be unchanged at 0x10 */
	if (oreg.bl != 0x10) {
    29ad:	67 80 7c 24 3c 10    	cmpb   $0x10,0x3c(%esp)
    29b3:	74 3f                	je     29f4 <vga_probe+0x83>
		/* EGA/VGA */
		ireg.ax = 0x1a00;
    29b5:	67 c7 44 24 1c 00 1a 	movw   $0x1a00,0x1c(%esp)
		intcall(0x10, &ireg, &oreg);
    29bc:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    29c2:	66 89 e2             	mov    %esp,%edx
    29c5:	66 b8 10 00 00 00    	mov    $0x10,%eax
    29cb:	66 e8 ff d8 ff ff    	calll  2d0 <intcall>

		if (oreg.al == 0x1a) {
    29d1:	67 80 7c 24 48 1a    	cmpb   $0x1a,0x48(%esp)
    29d7:	75 10                	jne    29e9 <vga_probe+0x78>
			adapter = ADAPTER_VGA;
    29d9:	66 c7 06 b8 55 02 00 	movl   $0x2,0x55b8
    29e0:	00 00 
#ifndef _WAKEUP
			boot_params.screen_info.orig_video_isVGA = 1;
    29e2:	c6 06 7f 45 01       	movb   $0x1,0x457f
    29e7:	eb 14                	jmp    29fd <vga_probe+0x8c>
#endif
		} else {
			adapter = ADAPTER_EGA;
    29e9:	66 c7 06 b8 55 01 00 	movl   $0x1,0x55b8
    29f0:	00 00 
    29f2:	eb 09                	jmp    29fd <vga_probe+0x8c>
		}
	} else {
		adapter = ADAPTER_CGA;
    29f4:	66 c7 06 b8 55 00 00 	movl   $0x0,0x55b8
    29fb:	00 00 
	}

	video_vga.modes = mode_lists[adapter];
    29fd:	66 a1 b8 55          	mov    0x55b8,%eax
    2a01:	67 66 8b 14 85 d4 39 	mov    0x39d4(,%eax,4),%edx
    2a08:	00 00 
    2a0a:	66 89 16 a0 43       	mov    %edx,0x43a0
	video_vga.card_name = card_name[adapter];
    2a0f:	67 66 8b 14 85 c8 39 	mov    0x39c8(,%eax,4),%edx
    2a16:	00 00 
    2a18:	66 89 16 94 43       	mov    %edx,0x4394
	return mode_count[adapter];
    2a1d:	67 66 8b 04 85 bc 39 	mov    0x39bc(,%eax,4),%eax
    2a24:	00 00 
}
    2a26:	66 83 c4 58          	add    $0x58,%esp
    2a2a:	66 c3                	retl   

00002a2c <vga_set_8font>:
{
    2a2c:	66 83 ec 2c          	sub    $0x2c,%esp
	initregs(&ireg);
    2a30:	66 89 e0             	mov    %esp,%eax
    2a33:	66 e8 7d f2 ff ff    	calll  1cb6 <initregs>
	ireg.ax = 0x1112;
    2a39:	67 c7 44 24 1c 12 11 	movw   $0x1112,0x1c(%esp)
	intcall(0x10, &ireg, NULL);
    2a40:	66 31 c9             	xor    %ecx,%ecx
    2a43:	66 89 e2             	mov    %esp,%edx
    2a46:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2a4c:	66 e8 7e d8 ff ff    	calll  2d0 <intcall>
	ireg.ax = 0x1200;
    2a52:	67 c7 44 24 1c 00 12 	movw   $0x1200,0x1c(%esp)
	ireg.bl = 0x20;
    2a59:	67 c6 44 24 10 20    	movb   $0x20,0x10(%esp)
	intcall(0x10, &ireg, NULL);
    2a5f:	66 31 c9             	xor    %ecx,%ecx
    2a62:	66 89 e2             	mov    %esp,%edx
    2a65:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2a6b:	66 e8 5f d8 ff ff    	calll  2d0 <intcall>
	ireg.ax = 0x1201;
    2a71:	67 c7 44 24 1c 01 12 	movw   $0x1201,0x1c(%esp)
	ireg.bl = 0x34;
    2a78:	67 c6 44 24 10 34    	movb   $0x34,0x10(%esp)
	intcall(0x10, &ireg, NULL);
    2a7e:	66 31 c9             	xor    %ecx,%ecx
    2a81:	66 89 e2             	mov    %esp,%edx
    2a84:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2a8a:	66 e8 40 d8 ff ff    	calll  2d0 <intcall>
	ireg.ax = 0x0100;
    2a90:	67 c7 44 24 1c 00 01 	movw   $0x100,0x1c(%esp)
	ireg.cx = 0x0607;
    2a97:	67 c7 44 24 18 07 06 	movw   $0x607,0x18(%esp)
	intcall(0x10, &ireg, NULL);
    2a9e:	66 31 c9             	xor    %ecx,%ecx
    2aa1:	66 89 e2             	mov    %esp,%edx
    2aa4:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2aaa:	66 e8 20 d8 ff ff    	calll  2d0 <intcall>
}
    2ab0:	66 83 c4 2c          	add    $0x2c,%esp
    2ab4:	66 c3                	retl   

00002ab6 <vga_set_14font>:
{
    2ab6:	66 83 ec 2c          	sub    $0x2c,%esp
	initregs(&ireg);
    2aba:	66 89 e0             	mov    %esp,%eax
    2abd:	66 e8 f3 f1 ff ff    	calll  1cb6 <initregs>
	ireg.ax = 0x1111;
    2ac3:	67 c7 44 24 1c 11 11 	movw   $0x1111,0x1c(%esp)
	intcall(0x10, &ireg, NULL);
    2aca:	66 31 c9             	xor    %ecx,%ecx
    2acd:	66 89 e2             	mov    %esp,%edx
    2ad0:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2ad6:	66 e8 f4 d7 ff ff    	calll  2d0 <intcall>
	ireg.ax = 0x1201;
    2adc:	67 c7 44 24 1c 01 12 	movw   $0x1201,0x1c(%esp)
	ireg.bl = 0x34;
    2ae3:	67 c6 44 24 10 34    	movb   $0x34,0x10(%esp)
	intcall(0x10, &ireg, NULL);
    2ae9:	66 31 c9             	xor    %ecx,%ecx
    2aec:	66 89 e2             	mov    %esp,%edx
    2aef:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2af5:	66 e8 d5 d7 ff ff    	calll  2d0 <intcall>
	ireg.ax = 0x0100;
    2afb:	67 c7 44 24 1c 00 01 	movw   $0x100,0x1c(%esp)
	ireg.cx = 0x0b0c;
    2b02:	67 c7 44 24 18 0c 0b 	movw   $0xb0c,0x18(%esp)
	intcall(0x10, &ireg, NULL);
    2b09:	66 31 c9             	xor    %ecx,%ecx
    2b0c:	66 89 e2             	mov    %esp,%edx
    2b0f:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2b15:	66 e8 b5 d7 ff ff    	calll  2d0 <intcall>
}
    2b1b:	66 83 c4 2c          	add    $0x2c,%esp
    2b1f:	66 c3                	retl   

00002b21 <vga_crtc>:
{
    2b21:	f3 0f 1e fb          	endbr32 
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
    2b25:	66 ba cc 03 00 00    	mov    $0x3cc,%edx
    2b2b:	ec                   	in     (%dx),%al
    2b2c:	88 c2                	mov    %al,%dl
	return (inb(0x3cc) & 1) ? 0x3d4 : 0x3b4;
    2b2e:	66 b8 d4 03 00 00    	mov    $0x3d4,%eax
    2b34:	80 e2 01             	and    $0x1,%dl
    2b37:	75 06                	jne    2b3f <vga_crtc+0x1e>
    2b39:	66 b8 b4 03 00 00    	mov    $0x3b4,%eax
}
    2b3f:	66 c3                	retl   

00002b41 <vga_set_480_scanlines>:
	crtc = vga_crtc();
    2b41:	66 e8 da ff ff ff    	calll  2b21 <vga_crtc>
    2b47:	66 89 c2             	mov    %eax,%edx
	asm volatile("outw %0,%1" : : "a" (v), "dN" (port));
    2b4a:	66 b8 11 0c 00 00    	mov    $0xc11,%eax
    2b50:	ef                   	out    %ax,(%dx)
    2b51:	66 b8 06 0b 00 00    	mov    $0xb06,%eax
    2b57:	ef                   	out    %ax,(%dx)
    2b58:	66 b8 07 3e 00 00    	mov    $0x3e07,%eax
    2b5e:	ef                   	out    %ax,(%dx)
    2b5f:	66 b8 10 ea ff ff    	mov    $0xffffea10,%eax
    2b65:	ef                   	out    %ax,(%dx)
    2b66:	66 b8 12 df ff ff    	mov    $0xffffdf12,%eax
    2b6c:	ef                   	out    %ax,(%dx)
    2b6d:	66 b8 15 e7 ff ff    	mov    $0xffffe715,%eax
    2b73:	ef                   	out    %ax,(%dx)
    2b74:	66 b8 16 04 00 00    	mov    $0x416,%eax
    2b7a:	ef                   	out    %ax,(%dx)
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
    2b7b:	66 ba cc 03 00 00    	mov    $0x3cc,%edx
    2b81:	ec                   	in     (%dx),%al
	csel &= 0x0d;
    2b82:	66 83 e0 0d          	and    $0xd,%eax
	csel |= 0xe2;
    2b86:	66 83 c8 e2          	or     $0xffffffe2,%eax
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
    2b8a:	66 ba c2 03 00 00    	mov    $0x3c2,%edx
    2b90:	ee                   	out    %al,(%dx)
}
    2b91:	66 c3                	retl   

00002b93 <vga_set_mode>:
{
    2b93:	f3 0f 1e fb          	endbr32 
    2b97:	66 53                	push   %ebx
    2b99:	66 83 ec 58          	sub    $0x58,%esp
    2b9d:	66 89 c3             	mov    %eax,%ebx
	initregs(&ireg);
    2ba0:	66 89 e0             	mov    %esp,%eax
    2ba3:	66 e8 0d f1 ff ff    	calll  1cb6 <initregs>
	ireg.ax = 0x0f00;
    2ba9:	67 c7 44 24 1c 00 0f 	movw   $0xf00,0x1c(%esp)
	intcall(0x10, &ireg, &oreg);
    2bb0:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    2bb6:	66 89 e2             	mov    %esp,%edx
    2bb9:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2bbf:	66 e8 0b d7 ff ff    	calll  2d0 <intcall>
	mode = oreg.al;
    2bc5:	67 66 0f b6 44 24 48 	movzbl 0x48(%esp),%eax
	if (mode != 3 && mode != 7)
    2bcc:	3c 07                	cmp    $0x7,%al
    2bce:	74 06                	je     2bd6 <vga_set_mode+0x43>
		mode = 3;
    2bd0:	66 b8 03 00 00 00    	mov    $0x3,%eax
	ireg.ax = mode;		/* AH=0: set mode */
    2bd6:	67 89 44 24 1c       	mov    %ax,0x1c(%esp)
	intcall(0x10, &ireg, NULL);
    2bdb:	66 31 c9             	xor    %ecx,%ecx
    2bde:	66 89 e2             	mov    %esp,%edx
    2be1:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2be7:	66 e8 e3 d6 ff ff    	calll  2d0 <intcall>
	do_restore = 1;
    2bed:	66 c7 06 ac 55 01 00 	movl   $0x1,0x55ac
    2bf4:	00 00 
	force_x = mode->x;
    2bf6:	67 66 0f b7 43 02    	movzwl 0x2(%ebx),%eax
    2bfc:	66 a3 b4 55          	mov    %eax,0x55b4
	force_y = mode->y;
    2c00:	67 66 0f b7 43 04    	movzwl 0x4(%ebx),%eax
    2c06:	66 a3 b0 55          	mov    %eax,0x55b0
	switch (mode->mode) {
    2c0a:	67 8b 03             	mov    (%ebx),%ax
    2c0d:	2d 01 0f             	sub    $0xf01,%ax
    2c10:	83 f8 06             	cmp    $0x6,%ax
    2c13:	0f 87 b6 00          	ja     2ccd <vga_set_mode+0x13a>
    2c17:	66 0f b7 c0          	movzwl %ax,%eax
    2c1b:	3e 67 ff 24 85 a0 39 	notrack jmp *0x39a0(,%eax,4)
    2c22:	00 00 
	initregs(&ireg);
    2c24:	67 66 8d 44 24 2c    	lea    0x2c(%esp),%eax
    2c2a:	66 e8 86 f0 ff ff    	calll  1cb6 <initregs>
	ireg.ax = 0x1201;
    2c30:	67 c7 44 24 48 01 12 	movw   $0x1201,0x48(%esp)
	ireg.bl = 0x30;
    2c37:	67 c6 44 24 3c 30    	movb   $0x30,0x3c(%esp)
	intcall(0x10, &ireg, NULL);
    2c3d:	66 31 c9             	xor    %ecx,%ecx
    2c40:	67 66 8d 54 24 2c    	lea    0x2c(%esp),%edx
    2c46:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2c4c:	66 e8 7e d6 ff ff    	calll  2d0 <intcall>
	ireg.ax = 0x0003;
    2c52:	67 c7 44 24 48 03 00 	movw   $0x3,0x48(%esp)
	intcall(0x10, &ireg, NULL);
    2c59:	66 31 c9             	xor    %ecx,%ecx
    2c5c:	67 66 8d 54 24 2c    	lea    0x2c(%esp),%edx
    2c62:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2c68:	66 e8 62 d6 ff ff    	calll  2d0 <intcall>
	vga_set_8font();
    2c6e:	66 e8 b8 fd ff ff    	calll  2a2c <vga_set_8font>
}
    2c74:	eb 57                	jmp    2ccd <vga_set_mode+0x13a>
		vga_set_14font();
    2c76:	66 e8 3a fe ff ff    	calll  2ab6 <vga_set_14font>
		break;
    2c7c:	eb 4f                	jmp    2ccd <vga_set_mode+0x13a>
	vga_set_480_scanlines();
    2c7e:	66 e8 bd fe ff ff    	calll  2b41 <vga_set_480_scanlines>
	crtc = vga_crtc();
    2c84:	eb 30                	jmp    2cb6 <vga_set_mode+0x123>
	vga_set_480_scanlines();
    2c86:	66 e8 b5 fe ff ff    	calll  2b41 <vga_set_480_scanlines>
	vga_set_14font();
    2c8c:	66 e8 24 fe ff ff    	calll  2ab6 <vga_set_14font>
	crtc = vga_crtc();
    2c92:	66 e8 89 fe ff ff    	calll  2b21 <vga_crtc>
    2c98:	66 89 c2             	mov    %eax,%edx
	asm volatile("outw %0,%1" : : "a" (v), "dN" (port));
    2c9b:	66 b8 07 3e 00 00    	mov    $0x3e07,%eax
    2ca1:	ef                   	out    %ax,(%dx)
    2ca2:	66 b8 12 db ff ff    	mov    $0xffffdb12,%eax
    2ca8:	eb 22                	jmp    2ccc <vga_set_mode+0x139>
	vga_set_480_scanlines();
    2caa:	66 e8 91 fe ff ff    	calll  2b41 <vga_set_480_scanlines>
	vga_set_8font();
    2cb0:	66 e8 76 fd ff ff    	calll  2a2c <vga_set_8font>
	crtc = vga_crtc();
    2cb6:	66 e8 65 fe ff ff    	calll  2b21 <vga_crtc>
    2cbc:	66 89 c2             	mov    %eax,%edx
    2cbf:	66 b8 07 3e 00 00    	mov    $0x3e07,%eax
    2cc5:	ef                   	out    %ax,(%dx)
    2cc6:	66 b8 12 df ff ff    	mov    $0xffffdf12,%eax
    2ccc:	ef                   	out    %ax,(%dx)
}
    2ccd:	66 31 c0             	xor    %eax,%eax
    2cd0:	66 83 c4 58          	add    $0x58,%esp
    2cd4:	66 5b                	pop    %ebx
    2cd6:	66 c3                	retl   

00002cd8 <vesa_probe>:
#else /* _WAKEUP */
static inline void vesa_store_mode_params_graphics(void) {}
#endif /* _WAKEUP */

static int vesa_probe(void)
{
    2cd8:	f3 0f 1e fb          	endbr32 
    2cdc:	66 55                	push   %ebp
    2cde:	66 57                	push   %edi
    2ce0:	66 56                	push   %esi
    2ce2:	66 53                	push   %ebx
    2ce4:	66 83 ec 58          	sub    $0x58,%esp
	HEAP = (char *)(((size_t)HEAP+(a-1)) & ~(a-1));
    2ce8:	66 a1 04 44          	mov    0x4404,%eax
    2cec:	66 40                	inc    %eax
    2cee:	66 83 e0 fe          	and    $0xfffffffe,%eax
	HEAP += s*n;
    2cf2:	66 a3 04 44          	mov    %eax,0x4404
	u16 mode;
	addr_t mode_ptr;
	struct mode_info *mi;
	int nmodes = 0;

	video_vesa.modes = GET_HEAP(struct mode_info, 0);
    2cf6:	66 a3 bc 43          	mov    %eax,0x43bc

	initregs(&ireg);
    2cfa:	66 89 e0             	mov    %esp,%eax
    2cfd:	66 e8 b3 ef ff ff    	calll  1cb6 <initregs>
	ireg.ax = 0x4f00;
    2d03:	67 c7 44 24 1c 00 4f 	movw   $0x4f00,0x1c(%esp)
	ireg.di = (size_t)&vginfo;
    2d0a:	66 b8 c0 56 00 00    	mov    $0x56c0,%eax
    2d10:	67 89 04 24          	mov    %ax,(%esp)
	intcall(0x10, &ireg, &oreg);
    2d14:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    2d1a:	66 89 e2             	mov    %esp,%edx
    2d1d:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2d23:	66 e8 a7 d5 ff ff    	calll  2d0 <intcall>

	if (oreg.ax != 0x004f ||
	    vginfo.signature != VESA_MAGIC ||
	    vginfo.version < 0x0102)
		return 0;	/* Not present */
    2d29:	66 31 f6             	xor    %esi,%esi
	if (oreg.ax != 0x004f ||
    2d2c:	67 83 7c 24 48 4f    	cmpw   $0x4f,0x48(%esp)
    2d32:	0f 85 1a 01          	jne    2e50 <vesa_probe+0x178>
    2d36:	66 81 3e c0 56 56 45 	cmpl   $0x41534556,0x56c0
    2d3d:	53 41 
    2d3f:	0f 85 0d 01          	jne    2e50 <vesa_probe+0x178>
	    vginfo.signature != VESA_MAGIC ||
    2d43:	81 3e c4 56 01 01    	cmpw   $0x101,0x56c4
    2d49:	0f 86 03 01          	jbe    2e50 <vesa_probe+0x178>
	asm volatile("movw %0,%%fs" : : "rm" (seg));
    2d4d:	8e 26 d0 56          	mov    0x56d0,%fs

	set_fs(vginfo.video_mode_ptr.seg);
	mode_ptr = vginfo.video_mode_ptr.off;
    2d51:	66 0f b7 2e ce 56    	movzwl 0x56ce,%ebp
	asm volatile("movw %%fs:%1,%0" : "=r" (v) : "m" (*(u16 *)addr));
    2d57:	64 67 8b 5d 00       	mov    %fs:0x0(%ebp),%bx

	while ((mode = rdfs16(mode_ptr)) != 0xffff) {
    2d5c:	83 fb ff             	cmp    $0xffff,%bx
    2d5f:	0f 84 ed 00          	je     2e50 <vesa_probe+0x178>
		mode_ptr += 2;
    2d63:	66 83 c5 02          	add    $0x2,%ebp
	return (int)(heap_end-HEAP) >= (int)n;
    2d67:	66 a1 00 44          	mov    0x4400,%eax
    2d6b:	66 2b 06 04 44       	sub    0x4404,%eax

		if (!heap_free(sizeof(struct mode_info)))
    2d70:	66 83 f8 07          	cmp    $0x7,%eax
    2d74:	0f 8e d8 00          	jle    2e50 <vesa_probe+0x178>
			break;	/* Heap full, can't save mode info */

		if (mode & ~0x1ff)
    2d78:	66 89 d8             	mov    %ebx,%eax
    2d7b:	66 25 00 fe 00 00    	and    $0xfe00,%eax
    2d81:	75 d4                	jne    2d57 <vesa_probe+0x7f>
			continue;

		memset(&vminfo, 0, sizeof vminfo); /* Just in case... */
    2d83:	66 ba c0 55 00 00    	mov    $0x55c0,%edx
    2d89:	66 b9 40 00 00 00    	mov    $0x40,%ecx
    2d8f:	66 89 d7             	mov    %edx,%edi
    2d92:	66 f3 ab             	rep stos %eax,%es:(%di)

		ireg.ax = 0x4f01;
    2d95:	67 c7 44 24 1c 01 4f 	movw   $0x4f01,0x1c(%esp)
		ireg.cx = mode;
    2d9c:	67 89 5c 24 18       	mov    %bx,0x18(%esp)
		ireg.di = (size_t)&vminfo;
    2da1:	67 89 14 24          	mov    %dx,(%esp)
		intcall(0x10, &ireg, &oreg);
    2da5:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    2dab:	66 89 e2             	mov    %esp,%edx
    2dae:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2db4:	66 e8 16 d5 ff ff    	calll  2d0 <intcall>

		if (oreg.ax != 0x004f)
    2dba:	67 83 7c 24 48 4f    	cmpw   $0x4f,0x48(%esp)
    2dc0:	75 95                	jne    2d57 <vesa_probe+0x7f>
			continue;

		if ((vminfo.mode_attr & 0x15) == 0x05) {
    2dc2:	66 a1 c0 55          	mov    0x55c0,%eax
    2dc6:	66 89 c2             	mov    %eax,%edx
    2dc9:	66 83 e2 15          	and    $0x15,%edx
    2dcd:	83 fa 05             	cmp    $0x5,%dx
    2dd0:	75 23                	jne    2df5 <vesa_probe+0x11d>
	HEAP = (char *)(((size_t)HEAP+(a-1)) & ~(a-1));
    2dd2:	66 a1 04 44          	mov    0x4404,%eax
    2dd6:	66 40                	inc    %eax
    2dd8:	66 83 e0 fe          	and    $0xfffffffe,%eax
	HEAP += s*n;
    2ddc:	67 66 8d 50 08       	lea    0x8(%eax),%edx
    2de1:	66 89 16 04 44       	mov    %edx,0x4404
			/* Text Mode, TTY BIOS supported,
			   supported by hardware */
			mi = GET_HEAP(struct mode_info, 1);
			mi->mode  = mode + VIDEO_FIRST_VESA;
    2de6:	81 c3 00 02          	add    $0x200,%bx
    2dea:	67 89 18             	mov    %bx,(%eax)
			mi->depth = 0; /* text */
    2ded:	67 c7 40 06 00 00    	movw   $0x0,0x6(%eax)
			mi->x     = vminfo.h_res;
    2df3:	eb 45                	jmp    2e3a <vesa_probe+0x162>
			mi->y     = vminfo.v_res;
			nmodes++;
		} else if ((vminfo.mode_attr & 0x99) == 0x99 &&
    2df5:	25 99 00             	and    $0x99,%ax
    2df8:	3d 99 00             	cmp    $0x99,%ax
    2dfb:	0f 85 58 ff          	jne    2d57 <vesa_probe+0x7f>
    2dff:	a0 db 55             	mov    0x55db,%al
    2e02:	66 83 e0 fd          	and    $0xfffffffd,%eax
			   (vminfo.memory_layout == 4 ||
    2e06:	3c 04                	cmp    $0x4,%al
    2e08:	0f 85 4b ff          	jne    2d57 <vesa_probe+0x7f>
			    vminfo.memory_layout == 6) &&
    2e0c:	80 3e d8 55 01       	cmpb   $0x1,0x55d8
    2e11:	0f 85 42 ff          	jne    2d57 <vesa_probe+0x7f>
	HEAP = (char *)(((size_t)HEAP+(a-1)) & ~(a-1));
    2e15:	66 a1 04 44          	mov    0x4404,%eax
    2e19:	66 40                	inc    %eax
    2e1b:	66 83 e0 fe          	and    $0xfffffffe,%eax
	HEAP += s*n;
    2e1f:	67 66 8d 50 08       	lea    0x8(%eax),%edx
    2e24:	66 89 16 04 44       	mov    %edx,0x4404
			/* Graphics mode, color, linear frame buffer
			   supported.  Only register the mode if
			   if framebuffer is configured, however,
			   otherwise the user will be left without a screen. */
			mi = GET_HEAP(struct mode_info, 1);
			mi->mode = mode + VIDEO_FIRST_VESA;
    2e29:	81 c3 00 02          	add    $0x200,%bx
    2e2d:	67 89 18             	mov    %bx,(%eax)
			mi->depth = vminfo.bpp;
    2e30:	66 0f b6 16 d9 55    	movzbl 0x55d9,%edx
    2e36:	67 89 50 06          	mov    %dx,0x6(%eax)
			mi->x = vminfo.h_res;
    2e3a:	8b 16 d2 55          	mov    0x55d2,%dx
    2e3e:	67 89 50 02          	mov    %dx,0x2(%eax)
			mi->y = vminfo.v_res;
    2e42:	66 8b 16 d4 55       	mov    0x55d4,%edx
    2e47:	67 89 50 04          	mov    %dx,0x4(%eax)
			nmodes++;
    2e4b:	66 46                	inc    %esi
    2e4d:	e9 07 ff             	jmp    2d57 <vesa_probe+0x7f>
#endif
		}
	}

	return nmodes;
}
    2e50:	66 89 f0             	mov    %esi,%eax
    2e53:	66 83 c4 58          	add    $0x58,%esp
    2e57:	66 5b                	pop    %ebx
    2e59:	66 5e                	pop    %esi
    2e5b:	66 5f                	pop    %edi
    2e5d:	66 5d                	pop    %ebp
    2e5f:	66 c3                	retl   

00002e61 <vesa_set_mode>:

static int vesa_set_mode(struct mode_info *mode)
{
    2e61:	f3 0f 1e fb          	endbr32 
    2e65:	66 55                	push   %ebp
    2e67:	66 57                	push   %edi
    2e69:	66 56                	push   %esi
    2e6b:	66 53                	push   %ebx
    2e6d:	66 81 ec b0 00 00 00 	sub    $0xb0,%esp
    2e74:	66 89 c5             	mov    %eax,%ebp
	struct biosregs ireg, oreg;
	int is_graphic;
	u16 vesa_mode = mode->mode - VIDEO_FIRST_VESA;
    2e77:	67 8b 00             	mov    (%eax),%ax
    2e7a:	67 66 8d b0 00 fe ff 	lea    -0x200(%eax),%esi
    2e81:	ff 

	memset(&vminfo, 0, sizeof vminfo); /* Just in case... */
    2e82:	66 bb c0 55 00 00    	mov    $0x55c0,%ebx
    2e88:	66 b9 40 00 00 00    	mov    $0x40,%ecx
    2e8e:	66 31 c0             	xor    %eax,%eax
    2e91:	66 89 df             	mov    %ebx,%edi
    2e94:	66 f3 ab             	rep stos %eax,%es:(%di)

	initregs(&ireg);
    2e97:	66 89 e0             	mov    %esp,%eax
    2e9a:	66 e8 16 ee ff ff    	calll  1cb6 <initregs>
	ireg.ax = 0x4f01;
    2ea0:	67 c7 44 24 1c 01 4f 	movw   $0x4f01,0x1c(%esp)
	ireg.cx = vesa_mode;
    2ea7:	67 89 74 24 18       	mov    %si,0x18(%esp)
	ireg.di = (size_t)&vminfo;
    2eac:	67 89 1c 24          	mov    %bx,(%esp)
	intcall(0x10, &ireg, &oreg);
    2eb0:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    2eb6:	66 89 e2             	mov    %esp,%edx
    2eb9:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2ebf:	66 e8 0b d4 ff ff    	calll  2d0 <intcall>

	if (oreg.ax != 0x004f)
    2ec5:	67 83 7c 24 48 4f    	cmpw   $0x4f,0x48(%esp)
    2ecb:	74 07                	je     2ed4 <vesa_set_mode+0x73>
		return -1;
    2ecd:	66 83 cb ff          	or     $0xffffffff,%ebx
    2ed1:	e9 a8 01             	jmp    307c <vesa_set_mode+0x21b>

	if ((vminfo.mode_attr & 0x15) == 0x05) {
    2ed4:	66 a1 c0 55          	mov    0x55c0,%eax
    2ed8:	66 89 c2             	mov    %eax,%edx
    2edb:	66 83 e2 15          	and    $0x15,%edx
    2edf:	83 fa 05             	cmp    $0x5,%dx
    2ee2:	74 14                	je     2ef8 <vesa_set_mode+0x97>
		/* It's a supported text mode */
		is_graphic = 0;
#ifdef CONFIG_FB_BOOT_VESA_SUPPORT
	} else if ((vminfo.mode_attr & 0x99) == 0x99) {
    2ee4:	25 99 00             	and    $0x99,%ax
    2ee7:	3d 99 00             	cmp    $0x99,%ax
    2eea:	75 e1                	jne    2ecd <vesa_set_mode+0x6c>
		/* It's a graphics mode with linear frame buffer */
		is_graphic = 1;
		vesa_mode |= 0x4000; /* Request linear frame buffer */
    2eec:	81 ce 00 40          	or     $0x4000,%si
		is_graphic = 1;
    2ef0:	66 bb 01 00 00 00    	mov    $0x1,%ebx
    2ef6:	eb 03                	jmp    2efb <vesa_set_mode+0x9a>
		is_graphic = 0;
    2ef8:	66 31 db             	xor    %ebx,%ebx
	} else {
		return -1;	/* Invalid mode */
	}


	initregs(&ireg);
    2efb:	66 89 e0             	mov    %esp,%eax
    2efe:	66 e8 b2 ed ff ff    	calll  1cb6 <initregs>
	ireg.ax = 0x4f02;
    2f04:	67 c7 44 24 1c 02 4f 	movw   $0x4f02,0x1c(%esp)
	ireg.bx = vesa_mode;
    2f0b:	67 89 74 24 10       	mov    %si,0x10(%esp)
	intcall(0x10, &ireg, &oreg);
    2f10:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    2f16:	66 89 e2             	mov    %esp,%edx
    2f19:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2f1f:	66 e8 ab d3 ff ff    	calll  2d0 <intcall>

	if (oreg.ax != 0x004f)
    2f25:	67 83 7c 24 48 4f    	cmpw   $0x4f,0x48(%esp)
    2f2b:	75 a0                	jne    2ecd <vesa_set_mode+0x6c>
		return -1;

	graphic_mode = is_graphic;
    2f2d:	66 89 1e a8 55       	mov    %ebx,0x55a8
	if (!is_graphic) {
    2f32:	66 85 db             	test   %ebx,%ebx
    2f35:	75 20                	jne    2f57 <vesa_set_mode+0xf6>
		/* Text mode */
		force_x = mode->x;
    2f37:	67 66 0f b7 45 02    	movzwl 0x2(%ebp),%eax
    2f3d:	66 a3 b4 55          	mov    %eax,0x55b4
		force_y = mode->y;
    2f41:	67 66 0f b7 45 04    	movzwl 0x4(%ebp),%eax
    2f47:	66 a3 b0 55          	mov    %eax,0x55b0
		do_restore = 1;
    2f4b:	66 c7 06 ac 55 01 00 	movl   $0x1,0x55ac
    2f52:	00 00 
    2f54:	e9 25 01             	jmp    307c <vesa_set_mode+0x21b>
 * Save video mode parameters for graphics mode
 */
static void vesa_store_mode_params_graphics(void)
{
	/* Tell the kernel we're in VESA graphics mode */
	boot_params.screen_info.orig_video_isVGA = VIDEO_TYPE_VLFB;
    2f57:	c6 06 7f 45 23       	movb   $0x23,0x457f

	/* Mode parameters */
	boot_params.screen_info.vesa_attributes = vminfo.mode_attr;
    2f5c:	66 a1 c0 55          	mov    0x55c0,%eax
    2f60:	a3 a4 45             	mov    %ax,0x45a4
	boot_params.screen_info.lfb_linelength = vminfo.logical_scan;
    2f63:	66 a1 d0 55          	mov    0x55d0,%eax
    2f67:	a3 94 45             	mov    %ax,0x4594
	boot_params.screen_info.lfb_width = vminfo.h_res;
    2f6a:	66 a1 d2 55          	mov    0x55d2,%eax
    2f6e:	66 a3 82 45          	mov    %eax,0x4582
	boot_params.screen_info.lfb_height = vminfo.v_res;
	boot_params.screen_info.lfb_depth = vminfo.bpp;
    2f72:	66 0f b6 16 d9 55    	movzbl 0x55d9,%edx
    2f78:	66 89 d0             	mov    %edx,%eax
    2f7b:	89 16 86 45          	mov    %dx,0x4586
	boot_params.screen_info.pages = vminfo.image_planes;
    2f7f:	66 0f b6 16 dd 55    	movzbl 0x55dd,%edx
    2f85:	89 16 a2 45          	mov    %dx,0x45a2
	boot_params.screen_info.lfb_base = vminfo.lfb_ptr;
    2f89:	66 8b 16 e8 55       	mov    0x55e8,%edx
    2f8e:	66 89 16 88 45       	mov    %edx,0x4588
	memcpy(&boot_params.screen_info.red_size,
    2f93:	66 8b 0e df 55       	mov    0x55df,%ecx
    2f98:	66 8b 1e e3 55       	mov    0x55e3,%ebx
    2f9d:	66 89 0e 96 45       	mov    %ecx,0x4596
    2fa2:	66 89 1e 9a 45       	mov    %ebx,0x459a
	       &vminfo.rmask, 8);

	/* General parameters */
	boot_params.screen_info.lfb_size = vginfo.total_memory;
    2fa7:	66 0f b7 16 d2 56    	movzwl 0x56d2,%edx
    2fad:	66 89 16 8c 45       	mov    %edx,0x458c

	if (vminfo.bpp <= 8)
    2fb2:	3c 08                	cmp    $0x8,%al
    2fb4:	77 72                	ja     3028 <vesa_set_mode+0x1c7>
	if (vginfo.capabilities & 1) {
    2fb6:	f6 06 ca 56 01       	testb  $0x1,0x56ca
    2fbb:	75 04                	jne    2fc1 <vesa_set_mode+0x160>
	u8 dac_size = 6;
    2fbd:	b0 06                	mov    $0x6,%al
    2fbf:	eb 47                	jmp    3008 <vesa_set_mode+0x1a7>
		initregs(&ireg);
    2fc1:	67 66 8d 44 24 58    	lea    0x58(%esp),%eax
    2fc7:	66 e8 e9 ec ff ff    	calll  1cb6 <initregs>
		ireg.ax = 0x4f08;
    2fcd:	67 c7 44 24 74 08 4f 	movw   $0x4f08,0x74(%esp)
		ireg.bh = 0x08;
    2fd4:	67 c6 44 24 69 08    	movb   $0x8,0x69(%esp)
		intcall(0x10, &ireg, &oreg);
    2fda:	67 66 8d 8c 24 84 00 	lea    0x84(%esp),%ecx
    2fe1:	00 00 
    2fe3:	67 66 8d 54 24 58    	lea    0x58(%esp),%edx
    2fe9:	66 b8 10 00 00 00    	mov    $0x10,%eax
    2fef:	66 e8 db d2 ff ff    	calll  2d0 <intcall>
		if (oreg.ax == 0x004f)
    2ff5:	67 83 bc 24 a0 00 00 	cmpw   $0x4f,0xa0(%esp)
    2ffc:	00 4f 
    2ffe:	75 bd                	jne    2fbd <vesa_set_mode+0x15c>
			dac_size = oreg.bh;
    3000:	67 8a 84 24 95 00 00 	mov    0x95(%esp),%al
    3007:	00 
	boot_params.screen_info.red_size   = dac_size;
    3008:	a2 96 45             	mov    %al,0x4596
	boot_params.screen_info.green_size = dac_size;
    300b:	a2 98 45             	mov    %al,0x4598
	boot_params.screen_info.blue_size  = dac_size;
    300e:	a2 9a 45             	mov    %al,0x459a
	boot_params.screen_info.rsvd_size  = dac_size;
    3011:	a2 9c 45             	mov    %al,0x459c
	boot_params.screen_info.red_pos    = 0;
    3014:	c6 06 97 45 00       	movb   $0x0,0x4597
	boot_params.screen_info.green_pos  = 0;
    3019:	c6 06 99 45 00       	movb   $0x0,0x4599
	boot_params.screen_info.blue_pos   = 0;
    301e:	c6 06 9b 45 00       	movb   $0x0,0x459b
	boot_params.screen_info.rsvd_pos   = 0;
    3023:	c6 06 9d 45 00       	movb   $0x0,0x459d
	initregs(&ireg);
    3028:	67 66 8d 44 24 58    	lea    0x58(%esp),%eax
    302e:	66 e8 82 ec ff ff    	calll  1cb6 <initregs>
	ireg.ax = 0x4f0a;
    3034:	67 c7 44 24 74 0a 4f 	movw   $0x4f0a,0x74(%esp)
	intcall(0x10, &ireg, &oreg);
    303b:	67 66 8d 8c 24 84 00 	lea    0x84(%esp),%ecx
    3042:	00 00 
    3044:	67 66 8d 54 24 58    	lea    0x58(%esp),%edx
    304a:	66 b8 10 00 00 00    	mov    $0x10,%eax
    3050:	66 e8 7a d2 ff ff    	calll  2d0 <intcall>
	if (oreg.ax != 0x004f)
    3056:	67 83 bc 24 a0 00 00 	cmpw   $0x4f,0xa0(%esp)
    305d:	00 4f 
    305f:	75 18                	jne    3079 <vesa_set_mode+0x218>
	boot_params.screen_info.vesapm_seg = oreg.es;
    3061:	67 66 8b 84 24 a8 00 	mov    0xa8(%esp),%eax
    3068:	00 00 
    306a:	a3 9e 45             	mov    %ax,0x459e
	boot_params.screen_info.vesapm_off = oreg.di;
    306d:	67 66 8b 84 24 84 00 	mov    0x84(%esp),%eax
    3074:	00 00 
    3076:	a3 a0 45             	mov    %ax,0x45a0
	return 0;
    3079:	66 31 db             	xor    %ebx,%ebx
}
    307c:	66 89 d8             	mov    %ebx,%eax
    307f:	66 81 c4 b0 00 00 00 	add    $0xb0,%esp
    3086:	66 5b                	pop    %ebx
    3088:	66 5e                	pop    %esi
    308a:	66 5f                	pop    %edi
    308c:	66 5d                	pop    %ebp
    308e:	66 c3                	retl   

00003090 <vesa_store_edid>:
/*
 * Save EDID information for the kernel; this is invoked, separately,
 * after mode-setting.
 */
void vesa_store_edid(void)
{
    3090:	f3 0f 1e fb          	endbr32 
    3094:	66 57                	push   %edi
    3096:	66 53                	push   %ebx
    3098:	66 83 ec 58          	sub    $0x58,%esp
#ifdef CONFIG_FIRMWARE_EDID
	struct biosregs ireg, oreg;

	/* Apparently used as a nonsense token... */
	memset(&boot_params.edid_info, 0x13, sizeof boot_params.edid_info);
    309c:	66 bb b0 46 00 00    	mov    $0x46b0,%ebx
    30a2:	66 b9 80 00 00 00    	mov    $0x80,%ecx
    30a8:	b0 13                	mov    $0x13,%al
    30aa:	66 89 df             	mov    %ebx,%edi
    30ad:	f3 aa                	rep stos %al,%es:(%di)

	if (vginfo.version < 0x0200)
    30af:	81 3e c4 56 ff 01    	cmpw   $0x1ff,0x56c4
    30b5:	76 62                	jbe    3119 <vesa_store_edid+0x89>
		return;		/* EDID requires VBE 2.0+ */

	initregs(&ireg);
    30b7:	66 89 e0             	mov    %esp,%eax
    30ba:	66 e8 f6 eb ff ff    	calll  1cb6 <initregs>
	ireg.ax = 0x4f15;		/* VBE DDC */
    30c0:	67 c7 44 24 1c 15 4f 	movw   $0x4f15,0x1c(%esp)
	/* ireg.bx = 0x0000; */		/* Report DDC capabilities */
	/* ireg.cx = 0;	*/		/* Controller 0 */
	ireg.es = 0;			/* ES:DI must be 0 by spec */
    30c7:	67 c7 44 24 24 00 00 	movw   $0x0,0x24(%esp)
	intcall(0x10, &ireg, &oreg);
    30ce:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    30d4:	66 89 e2             	mov    %esp,%edx
    30d7:	66 b8 10 00 00 00    	mov    $0x10,%eax
    30dd:	66 e8 ed d1 ff ff    	calll  2d0 <intcall>

	if (oreg.ax != 0x004f)
    30e3:	67 83 7c 24 48 4f    	cmpw   $0x4f,0x48(%esp)
    30e9:	75 2e                	jne    3119 <vesa_store_edid+0x89>
		return;		/* No EDID */

	/* BH = time in seconds to transfer EDD information */
	/* BL = DDC level supported */

	ireg.ax = 0x4f15;		/* VBE DDC */
    30eb:	67 c7 44 24 1c 15 4f 	movw   $0x4f15,0x1c(%esp)
	ireg.bx = 0x0001;		/* Read EDID */
    30f2:	67 c7 44 24 10 01 00 	movw   $0x1,0x10(%esp)
	asm("movw %%ds,%0" : "=rm" (seg));
    30f9:	8c d8                	mov    %ds,%ax
	/* ireg.cx = 0; */		/* Controller 0 */
	/* ireg.dx = 0;	*/		/* EDID block number */
	ireg.es = ds();
    30fb:	67 89 44 24 24       	mov    %ax,0x24(%esp)
	ireg.di =(size_t)&boot_params.edid_info; /* (ES:)Pointer to block */
    3100:	67 89 1c 24          	mov    %bx,(%esp)
	intcall(0x10, &ireg, &oreg);
    3104:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    310a:	66 89 e2             	mov    %esp,%edx
    310d:	66 b8 10 00 00 00    	mov    $0x10,%eax
    3113:	66 e8 b7 d1 ff ff    	calll  2d0 <intcall>
#endif /* CONFIG_FIRMWARE_EDID */
}
    3119:	66 83 c4 58          	add    $0x58,%esp
    311d:	66 5b                	pop    %ebx
    311f:	66 5f                	pop    %edi
    3121:	66 c3                	retl   

00003123 <set_bios_mode>:
{
	return set_bios_mode(mi->mode - VIDEO_FIRST_BIOS);
}

static int set_bios_mode(u8 mode)
{
    3123:	66 53                	push   %ebx
    3125:	66 83 ec 58          	sub    $0x58,%esp
    3129:	66 89 c3             	mov    %eax,%ebx
	struct biosregs ireg, oreg;
	u8 new_mode;

	initregs(&ireg);
    312c:	66 89 e0             	mov    %esp,%eax
    312f:	66 e8 81 eb ff ff    	calll  1cb6 <initregs>
	ireg.al = mode;		/* AH=0x00 Set Video Mode */
    3135:	67 88 5c 24 1c       	mov    %bl,0x1c(%esp)
	intcall(0x10, &ireg, NULL);
    313a:	66 31 c9             	xor    %ecx,%ecx
    313d:	66 89 e2             	mov    %esp,%edx
    3140:	66 b8 10 00 00 00    	mov    $0x10,%eax
    3146:	66 e8 84 d1 ff ff    	calll  2d0 <intcall>

	ireg.ah = 0x0f;		/* Get Current Video Mode */
    314c:	67 c6 44 24 1d 0f    	movb   $0xf,0x1d(%esp)
	intcall(0x10, &ireg, &oreg);
    3152:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    3158:	66 89 e2             	mov    %esp,%edx
    315b:	66 b8 10 00 00 00    	mov    $0x10,%eax
    3161:	66 e8 69 d1 ff ff    	calll  2d0 <intcall>

	do_restore = 1;		/* Assume video contents were lost */
    3167:	66 c7 06 ac 55 01 00 	movl   $0x1,0x55ac
    316e:	00 00 

	/* Not all BIOSes are clean with the top bit */
	new_mode = oreg.al & 0x7f;
    3170:	67 8a 54 24 48       	mov    0x48(%esp),%dl
    3175:	66 83 e2 7f          	and    $0x7f,%edx

	if (new_mode == mode)
    3179:	38 d3                	cmp    %dl,%bl
    317b:	74 27                	je     31a4 <set_bios_mode+0x81>
		return 0;	/* Mode change OK */

#ifndef _WAKEUP
	if (new_mode != boot_params.screen_info.orig_video_mode) {
    317d:	66 0f b6 06 76 45    	movzbl 0x4576,%eax
		   video mode. */
		ireg.ax = boot_params.screen_info.orig_video_mode;
		intcall(0x10, &ireg, NULL);
	}
#endif
	return -1;
    3183:	66 83 cb ff          	or     $0xffffffff,%ebx
	if (new_mode != boot_params.screen_info.orig_video_mode) {
    3187:	38 d0                	cmp    %dl,%al
    3189:	74 1c                	je     31a7 <set_bios_mode+0x84>
		ireg.ax = boot_params.screen_info.orig_video_mode;
    318b:	67 89 44 24 1c       	mov    %ax,0x1c(%esp)
		intcall(0x10, &ireg, NULL);
    3190:	66 31 c9             	xor    %ecx,%ecx
    3193:	66 89 e2             	mov    %esp,%edx
    3196:	66 b8 10 00 00 00    	mov    $0x10,%eax
    319c:	66 e8 2e d1 ff ff    	calll  2d0 <intcall>
    31a2:	eb 03                	jmp    31a7 <set_bios_mode+0x84>
		return 0;	/* Mode change OK */
    31a4:	66 31 db             	xor    %ebx,%ebx
}
    31a7:	66 89 d8             	mov    %ebx,%eax
    31aa:	66 83 c4 58          	add    $0x58,%esp
    31ae:	66 5b                	pop    %ebx
    31b0:	66 c3                	retl   

000031b2 <bios_probe>:

static int bios_probe(void)
{
    31b2:	f3 0f 1e fb          	endbr32 
    31b6:	66 55                	push   %ebp
    31b8:	66 57                	push   %edi
    31ba:	66 56                	push   %esi
    31bc:	66 53                	push   %ebx
#endif
	u16 crtc;
	struct mode_info *mi;
	int nmodes = 0;

	if (adapter != ADAPTER_EGA && adapter != ADAPTER_VGA)
    31be:	66 a1 b8 55          	mov    0x55b8,%eax
    31c2:	66 48                	dec    %eax
		return 0;
    31c4:	66 31 ff             	xor    %edi,%edi
	if (adapter != ADAPTER_EGA && adapter != ADAPTER_VGA)
    31c7:	66 83 f8 01          	cmp    $0x1,%eax
    31cb:	0f 87 e4 00          	ja     32b3 <bios_probe+0x101>
	u8 saved_mode = boot_params.screen_info.orig_video_mode;
    31cf:	8a 1e 76 45          	mov    0x4576,%bl
	asm volatile("movw %0,%%fs" : : "rm" (seg));
    31d3:	66 31 c0             	xor    %eax,%eax
    31d6:	8e e0                	mov    %ax,%fs

	set_fs(0);
	crtc = vga_crtc();
    31d8:	66 e8 43 f9 ff ff    	calll  2b21 <vga_crtc>
    31de:	66 89 c6             	mov    %eax,%esi
	HEAP = (char *)(((size_t)HEAP+(a-1)) & ~(a-1));
    31e1:	66 a1 04 44          	mov    0x4404,%eax
    31e5:	66 40                	inc    %eax
    31e7:	66 83 e0 fe          	and    $0xfffffffe,%eax
	HEAP += s*n;
    31eb:	66 a3 04 44          	mov    %eax,0x4404

	video_bios.modes = GET_HEAP(struct mode_info, 0);
    31ef:	66 a3 d8 43          	mov    %eax,0x43d8
    31f3:	66 bd 14 01 00 00    	mov    $0x114,%ebp
	return (int)(heap_end-HEAP) >= (int)n;
    31f9:	66 a1 00 44          	mov    0x4400,%eax
    31fd:	66 2b 06 04 44       	sub    0x4404,%eax

	for (mode = 0x14; mode <= 0x7f; mode++) {
		if (!heap_free(sizeof(struct mode_info)))
    3202:	66 83 f8 07          	cmp    $0x7,%eax
    3206:	0f 8e 9f 00          	jle    32a9 <bios_probe+0xf7>
			break;

		if (mode_defined(VIDEO_FIRST_BIOS+mode))
    320a:	66 89 e8             	mov    %ebp,%eax
    320d:	66 e8 e3 f4 ff ff    	calll  26f6 <mode_defined>
    3213:	66 85 c0             	test   %eax,%eax
    3216:	0f 85 82 00          	jne    329c <bios_probe+0xea>
			continue;

		if (set_bios_mode(mode))
    321a:	67 66 8d 85 00 ff ff 	lea    -0x100(%ebp),%eax
    3221:	ff 
    3222:	66 e8 fb fe ff ff    	calll  3123 <set_bios_mode>
    3228:	66 85 c0             	test   %eax,%eax
    322b:	75 6f                	jne    329c <bios_probe+0xea>
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
    322d:	b0 10                	mov    $0x10,%al
    322f:	66 ba c0 03 00 00    	mov    $0x3c0,%edx
    3235:	ee                   	out    %al,(%dx)
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
    3236:	66 ba c1 03 00 00    	mov    $0x3c1,%edx
    323c:	ec                   	in     (%dx),%al
			continue;

		/* Try to verify that it's a text mode. */

		/* Attribute Controller: make graphics controller disabled */
		if (in_idx(0x3c0, 0x10) & 0x01)
    323d:	a8 01                	test   $0x1,%al
    323f:	75 5b                	jne    329c <bios_probe+0xea>
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
    3241:	b0 06                	mov    $0x6,%al
    3243:	66 ba ce 03 00 00    	mov    $0x3ce,%edx
    3249:	ee                   	out    %al,(%dx)
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
    324a:	66 ba cf 03 00 00    	mov    $0x3cf,%edx
    3250:	ec                   	in     (%dx),%al
			continue;

		/* Graphics Controller: verify Alpha addressing enabled */
		if (in_idx(0x3ce, 0x06) & 0x01)
    3251:	a8 01                	test   $0x1,%al
    3253:	75 47                	jne    329c <bios_probe+0xea>
	asm volatile("outb %0,%1" : : "a" (v), "dN" (port));
    3255:	b0 0f                	mov    $0xf,%al
    3257:	66 89 f2             	mov    %esi,%edx
    325a:	ee                   	out    %al,(%dx)
	return inb(port+1);
    325b:	67 66 8d 56 01       	lea    0x1(%esi),%edx
	asm volatile("inb %1,%0" : "=a" (v) : "dN" (port));
    3260:	ec                   	in     (%dx),%al
			continue;

		/* CRTC cursor location low should be zero(?) */
		if (in_idx(crtc, 0x0f))
    3261:	84 c0                	test   %al,%al
    3263:	75 37                	jne    329c <bios_probe+0xea>
	HEAP = (char *)(((size_t)HEAP+(a-1)) & ~(a-1));
    3265:	66 a1 04 44          	mov    0x4404,%eax
    3269:	66 40                	inc    %eax
    326b:	66 83 e0 fe          	and    $0xfffffffe,%eax
	HEAP += s*n;
    326f:	67 66 8d 50 08       	lea    0x8(%eax),%edx
    3274:	66 89 16 04 44       	mov    %edx,0x4404
			continue;

		mi = GET_HEAP(struct mode_info, 1);
		mi->mode = VIDEO_FIRST_BIOS+mode;
    3279:	67 89 28             	mov    %bp,(%eax)
		mi->depth = 0;	/* text */
    327c:	67 c7 40 06 00 00    	movw   $0x0,0x6(%eax)
	asm volatile("movw %%fs:%1,%0" : "=r" (v) : "m" (*(u16 *)addr));
    3282:	64 8b 16 4a 04       	mov    %fs:0x44a,%dx
		mi->x = rdfs16(0x44a);
    3287:	67 89 50 02          	mov    %dx,0x2(%eax)
	asm volatile("movb %%fs:%1,%0" : "=q" (v) : "m" (*(u8 *)addr));
    328b:	64 8a 16 84 04       	mov    %fs:0x484,%dl
		mi->y = rdfs8(0x484)+1;
    3290:	66 0f b6 d2          	movzbl %dl,%edx
    3294:	66 42                	inc    %edx
    3296:	67 89 50 04          	mov    %dx,0x4(%eax)
		nmodes++;
    329a:	66 47                	inc    %edi
	for (mode = 0x14; mode <= 0x7f; mode++) {
    329c:	66 45                	inc    %ebp
    329e:	66 81 fd 80 01 00 00 	cmp    $0x180,%ebp
    32a5:	0f 85 50 ff          	jne    31f9 <bios_probe+0x47>
	}

	set_bios_mode(saved_mode);
    32a9:	66 0f b6 c3          	movzbl %bl,%eax
    32ad:	66 e8 70 fe ff ff    	calll  3123 <set_bios_mode>

	return nmodes;
}
    32b3:	66 89 f8             	mov    %edi,%eax
    32b6:	66 5b                	pop    %ebx
    32b8:	66 5e                	pop    %esi
    32ba:	66 5f                	pop    %edi
    32bc:	66 5d                	pop    %ebp
    32be:	66 c3                	retl   

000032c0 <bios_set_mode>:
{
    32c0:	f3 0f 1e fb          	endbr32 
	return set_bios_mode(mi->mode - VIDEO_FIRST_BIOS);
    32c4:	67 66 0f b6 00       	movzbl (%eax),%eax
    32c9:	e9 57 fe             	jmp    3123 <set_bios_mode>

Disassembly of section .text.startup:

000032cc <main>:
		     "may be limited!\n");
	}
}

void main(void)
{
    32cc:	f3 0f 1e fb          	endbr32 
    32d0:	66 57                	push   %edi
    32d2:	66 56                	push   %esi
    32d4:	66 83 ec 58          	sub    $0x58,%esp
	memcpy(&boot_params.hdr, &hdr, sizeof hdr);
    32d8:	66 b8 61 47 00 00    	mov    $0x4761,%eax
    32de:	66 be f1 01 00 00    	mov    $0x1f1,%esi
    32e4:	66 b9 77 00 00 00    	mov    $0x77,%ecx
    32ea:	66 89 c7             	mov    %eax,%edi
    32ed:	f3 a4                	rep movsb %ds:(%si),%es:(%di)
	if (!boot_params.hdr.cmd_line_ptr &&
    32ef:	66 83 3e 98 47 00    	cmpl   $0x0,0x4798
    32f5:	75 2b                	jne    3322 <main+0x56>
    32f7:	81 3e 20 00 3f a3    	cmpw   $0xa33f,0x20
    32fd:	75 23                	jne    3322 <main+0x56>
		if (oldcmd->cl_offset < boot_params.hdr.setup_move_size)
    32ff:	66 0f b7 16 22 00    	movzwl 0x22,%edx
			cmdline_seg = 0x9000;
    3305:	66 b8 00 90 ff ff    	mov    $0xffff9000,%eax
		if (oldcmd->cl_offset < boot_params.hdr.setup_move_size)
    330b:	3b 16 82 47          	cmp    0x4782,%dx
    330f:	73 02                	jae    3313 <main+0x47>
	asm("movw %%ds,%0" : "=rm" (seg));
    3311:	8c d8                	mov    %ds,%ax
			(cmdline_seg << 4) + oldcmd->cl_offset;
    3313:	66 0f b7 c0          	movzwl %ax,%eax
    3317:	66 c1 e0 04          	shl    $0x4,%eax
    331b:	66 01 d0             	add    %edx,%eax
    331e:	66 a3 98 47          	mov    %eax,0x4798
	/* First, copy the boot header into the "zeropage" */
	copy_boot_params();

	/* Initialize the early-boot console */
	console_init();
    3322:	66 e8 88 da ff ff    	calll  db0 <console_init>
	unsigned long cmd_line_ptr = boot_params.hdr.cmd_line_ptr;
    3328:	66 a1 98 47          	mov    0x4798,%eax
	if (cmd_line_ptr >= 0x100000)
    332c:	66 3d ff ff 0f 00    	cmp    $0xfffff,%eax
    3332:	76 0e                	jbe    3342 <main+0x76>
	if (cmdline_find_option_bool("debug"))
		puts("early console in setup code\n");
    3334:	66 b8 f7 36 00 00    	mov    $0x36f7,%eax
    333a:	66 e8 7d d0 ff ff    	calll  3bd <puts>
    3340:	eb 11                	jmp    3353 <main+0x87>
	return __cmdline_find_option_bool(cmd_line_ptr, option);
    3342:	66 ba 14 37 00 00    	mov    $0x3714,%edx
    3348:	66 e8 19 d3 ff ff    	calll  667 <__cmdline_find_option_bool>
	if (cmdline_find_option_bool("debug"))
    334e:	66 85 c0             	test   %eax,%eax
    3351:	75 e1                	jne    3334 <main+0x68>
	if (boot_params.hdr.loadflags & CAN_USE_HEAP) {
    3353:	80 3e 81 47 00       	cmpb   $0x0,0x4781
    3358:	79 27                	jns    3381 <main+0xb5>
		asm("leal %P1(%%esp),%0"
    335a:	67 66 8d 94 24 00 fc 	lea    -0x400(%esp),%edx
    3361:	ff ff 
			((size_t)boot_params.hdr.heap_end_ptr + 0x200);
    3363:	66 0f b7 06 94 47    	movzwl 0x4794,%eax
    3369:	66 05 00 02 00 00    	add    $0x200,%eax
		if (heap_end > stack_end)
    336f:	66 39 c2             	cmp    %eax,%edx
    3372:	72 06                	jb     337a <main+0xae>
		heap_end = (char *)
    3374:	66 a3 00 44          	mov    %eax,0x4400
    3378:	eb 13                	jmp    338d <main+0xc1>
			heap_end = stack_end;
    337a:	66 89 16 00 44       	mov    %edx,0x4400
    337f:	eb 0c                	jmp    338d <main+0xc1>
		puts("WARNING: Ancient bootloader, some functionality "
    3381:	66 b8 1a 37 00 00    	mov    $0x371a,%eax
    3387:	66 e8 30 d0 ff ff    	calll  3bd <puts>

	/* End of heap check */
	init_heap();

	/* Make sure we have all the proper CPU support */
	if (validate_cpu()) {
    338d:	66 e8 d5 d3 ff ff    	calll  768 <validate_cpu>
    3393:	66 85 c0             	test   %eax,%eax
    3396:	74 12                	je     33aa <main+0xde>
		puts("Unable to boot - please use a kernel appropriate "
    3398:	66 b8 5b 37 00 00    	mov    $0x375b,%eax
    339e:	66 e8 19 d0 ff ff    	calll  3bd <puts>
		     "for your CPU.\n");
		die();
    33a4:	66 e8 23 cf ff ff    	calll  2cd <die>
	initregs(&ireg);
    33aa:	67 66 8d 44 24 2c    	lea    0x2c(%esp),%eax
    33b0:	66 e8 00 e9 ff ff    	calll  1cb6 <initregs>
	ireg.ax = 0xec00;
    33b6:	67 c7 44 24 48 00 ec 	movw   $0xec00,0x48(%esp)
	ireg.bx = 2;
    33bd:	67 c7 44 24 3c 02 00 	movw   $0x2,0x3c(%esp)
	intcall(0x15, &ireg, NULL);
    33c4:	66 31 c9             	xor    %ecx,%ecx
    33c7:	67 66 8d 54 24 2c    	lea    0x2c(%esp),%edx
    33cd:	66 b8 15 00 00 00    	mov    $0x15,%eax
    33d3:	66 e8 f7 ce ff ff    	calll  2d0 <intcall>

	/* Tell the BIOS what CPU mode we intend to run in. */
	set_bios_mode();

	/* Detect memory layout */
	detect_memory();
    33d9:	66 e8 b6 df ff ff    	calll  1395 <detect_memory>
	initregs(&ireg);
    33df:	66 89 e0             	mov    %esp,%eax
    33e2:	66 e8 ce e8 ff ff    	calll  1cb6 <initregs>
	ireg.ah = 0x02;		/* Get keyboard status */
    33e8:	67 c6 44 24 1d 02    	movb   $0x2,0x1d(%esp)
	intcall(0x16, &ireg, &oreg);
    33ee:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    33f4:	66 89 e2             	mov    %esp,%edx
    33f7:	66 b8 16 00 00 00    	mov    $0x16,%eax
    33fd:	66 e8 cd ce ff ff    	calll  2d0 <intcall>
	boot_params.kbd_status = oreg.al;
    3403:	67 8a 44 24 48       	mov    0x48(%esp),%al
    3408:	a2 5b 47             	mov    %al,0x475b
	ireg.ax = 0x0305;	/* Set keyboard repeat rate */
    340b:	67 c7 44 24 1c 05 03 	movw   $0x305,0x1c(%esp)
	intcall(0x16, &ireg, NULL);
    3412:	66 31 c9             	xor    %ecx,%ecx
    3415:	66 89 e2             	mov    %esp,%edx
    3418:	66 b8 16 00 00 00    	mov    $0x16,%eax
    341e:	66 e8 ac ce ff ff    	calll  2d0 <intcall>
	if (cpu.level < 6)
    3424:	66 83 3e c0 44 05    	cmpl   $0x5,0x44c0
    342a:	7e 57                	jle    3483 <main+0x1b7>
	initregs(&ireg);
    342c:	66 89 e0             	mov    %esp,%eax
    342f:	66 e8 81 e8 ff ff    	calll  1cb6 <initregs>
	ireg.ax  = 0xe980;	 /* IST Support */
    3435:	67 c7 44 24 1c 80 e9 	movw   $0xe980,0x1c(%esp)
	ireg.edx = 0x47534943;	 /* Request value */
    343c:	67 66 c7 44 24 14 43 	movl   $0x47534943,0x14(%esp)
    3443:	49 53 47 
	intcall(0x15, &ireg, &oreg);
    3446:	67 66 8d 4c 24 2c    	lea    0x2c(%esp),%ecx
    344c:	66 89 e2             	mov    %esp,%edx
    344f:	66 b8 15 00 00 00    	mov    $0x15,%eax
    3455:	66 e8 75 ce ff ff    	calll  2d0 <intcall>
	boot_params.ist_info.signature  = oreg.eax;
    345b:	67 66 8b 44 24 48    	mov    0x48(%esp),%eax
    3461:	66 a3 d0 45          	mov    %eax,0x45d0
	boot_params.ist_info.command    = oreg.ebx;
    3465:	67 66 8b 44 24 3c    	mov    0x3c(%esp),%eax
    346b:	66 a3 d4 45          	mov    %eax,0x45d4
	boot_params.ist_info.event      = oreg.ecx;
    346f:	67 66 8b 44 24 44    	mov    0x44(%esp),%eax
    3475:	66 a3 d8 45          	mov    %eax,0x45d8
	boot_params.ist_info.perf_level = oreg.edx;
    3479:	67 66 8b 44 24 40    	mov    0x40(%esp),%eax
    347f:	66 a3 dc 45          	mov    %eax,0x45dc
	query_apm_bios();
#endif

	/* Query EDD information */
#if defined(CONFIG_EDD) || defined(CONFIG_EDD_MODULE)
	query_edd();
    3483:	66 e8 9c db ff ff    	calll  1025 <query_edd>
#endif

	/* Set the video mode */
	set_video();
    3489:	66 e8 50 ed ff ff    	calll  21df <set_video>

	/* Do the last things and invoke protected mode */
	go_to_protected_mode();
    348f:	66 e8 68 e0 ff ff    	calll  14fd <go_to_protected_mode>

Disassembly of section .text32:

00003495 <in_pm32>:

	.code32
	.section ".text32","ax"
GLOBAL(in_pm32)
	# Set up data segments for flat 32-bit mode
	movl	%ecx, %ds
    3495:	8e d9                	mov    %cx,%ds
	movl	%ecx, %es
    3497:	8e c1                	mov    %cx,%es
	movl	%ecx, %fs
    3499:	8e e1                	mov    %cx,%fs
	movl	%ecx, %gs
    349b:	8e e9                	mov    %cx,%gs
	movl	%ecx, %ss
    349d:	8e d1                	mov    %cx,%ss
	# The 32-bit code sets up its own stack, but this way we do have
	# a valid stack if some debugging hack wants to use it.
	addl	%ebx, %esp
    349f:	01 dc                	add    %bx,%sp

	# Set up TR to make Intel VT happy
	ltr	%di
    34a1:	0f 00 df             	ltr    %di

	# Clear registers to allow for future extensions to the
	# 32-bit boot protocol
	xorl	%ecx, %ecx
    34a4:	31 c9                	xor    %cx,%cx
	xorl	%edx, %edx
    34a6:	31 d2                	xor    %dx,%dx
	xorl	%ebx, %ebx
    34a8:	31 db                	xor    %bx,%bx
	xorl	%ebp, %ebp
    34aa:	31 ed                	xor    %bp,%bp
	xorl	%edi, %edi
    34ac:	31 ff                	xor    %di,%di

	# Set up LDTR to make Intel VT happy
	lldt	%cx
    34ae:	0f 00 d1             	lldt   %cx

	jmpl	*%eax			# Jump to the 32-bit entrypoint
    34b1:	ff e0                	jmp    *%ax
