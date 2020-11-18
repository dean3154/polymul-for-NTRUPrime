.p2align 2,,3
.syntax unified

.data
buffer: .space 10080
.text
buffer_bridge:
    .word buffer
wpad:
    .word 831230
    .word 4282386411
    .word 168294228
    .word 4140894499
    .word 126746378
    .word 4269538485
    .word 99417980
    .word 50002679
    .word 12778959
    .word 5765158
    .word 167705975
    .word 147454288
    .word 4200859372
    .word 97580835
    .word 4287366620
    .word 108590760
    .word 158137326
    .word 95750292
    .word 144049038
    .word 65667255
    .word 102302154
    .word 4261808493
    .word 1702737
    .word 4197972657
    .word 58066579
    .word 4167235698

.global ntt41_rader
.type ntt41_rader, %function
@nttLen = 1722
@f_seq = 
@[1, 6, 36, 11, 25, 27, 39, 29, 10, 19, 32, 28, 4, 24, 21, 3, 18, 26, 33, 34, 
@ 40, 35, 5, 30, 16, 14, 2, 12, 31, 22, 9, 13, 37, 17, 20, 38, 23, 15, 8, 7]
@[1, 6, 5, 11, 16, 14, 2, 12, 10, 19]
@[9, 13, 4, 17, 20, 3, 18, 15, 8 ,7]
@[1, 6, -5, 11, -16, -14, -2, -12, 10, 19, #(10)# -9, -13, 4, -17, -20, 3, 18, -15, -8, -7] crt once
@w_seq = 
@[34, 33, 26, 18, 3, 21, 24, 4, 28, 32, 19, 10, 29, 39, 27, 25, 11, 36, 6, 1, 
@ 7, 8, 15, 23, 38, 20, 17, 37, 13, 9, 22, 31, 12, 2, 14, 16, 30, 5, 35, 40]
ntt41_rader:
    push {r2-r12, lr}
    vpush {s16-s31}
    add.w r2, r1, #32
    adr.w r3, wpad
    ldr.w r4, [r3], #4 @ qinv
    ldr.w r5, buffer_bridge
    vmov s0, r0 @ output
    vmov s1, r1 @ input
    vmov s2, r2 @ loop end
    vmov s3, r3 @ wpad
    vmov s4, r4 @ qinv
    vmov s14, r5 @ buffer
@ crt : {(x^10 - 1) x (x^10 + 1)} x (x^20 + 1)
    mov.w lr, #0
crt_1: 
    ldr.w r2, [r1, #84] @ a1
    ldr.w r3, [r1, #756] @ a9
    ldr.w r4, [r1, #504] @ a6
    ldr.w r5, [r1, #1092] @ a13
    ldr.w r6, [r1, #420] @ a5
    ldr.w r7, [r1, #336] @ a4
    ldr.w r8, [r1, #924] @ a11
    ldr.w r9, [r1, #1428] @ a17
    ldr.w r10, [r1, #1344] @ a16
    ldr.w r11, [r1, #1680] @ a20
    sadd16 r12, r2, r3
    sadd16 r12, r12, r4
    sadd16 r12, r12, r5
    sadd16 r12, r12, r6
    sadd16 r12, r12, r7
    sadd16 r12, r12, r8
    sadd16 r12, r12, r9
    sadd16 r12, r12, r10
    sadd16 r12, r12, r11
    ssub16 r6, lr, r6 @ -a5
    ssub16 r10, lr, r10 @ -a16
    ssub16 r3, lr, r3 @ -a9
    ssub16 r5, lr, r5 @ -a13
    ssub16 r9, lr, r9 @ -a17
    ssub16 r11, lr, r11 @ -a20
    vmov s5, r12 @ sum0, sum1
    str.w r2, [r0, #1764] @ b21
    str.w r4, [r0, #1848] @ b22
    str.w r6, [r0, #1932] @ b23
    str.w r8, [r0, #2016] @ b24
    str.w r10, [r0, #2100] @ b25
    str.w r3, [r0, #2604] @ b31
    str.w r5, [r0, #2688] @ b32
    str.w r7, [r0, #2772] @ b33
    str.w r9, [r0, #2856] @ b34
    str.w r11, [r0, #2940] @ b35
    ssub16 r12, r10, r11
    ssub16 r12, lr, r12 @ b15
    sadd16 r11, r10, r11
    ssub16 r11, lr, r11 @ b5
    sadd16 r10, r8, r9 @ b14
    ssub16 r9, r8, r9 @ b4
    sadd16 r8, r6, r7
    ssub16 r8, lr, r8 @ b13
    ssub16 r7, r7, r6 @ b3
    sadd16 r6, r4, r5 @ b12
    ssub16 r5, r4, r5 @ b2
    sadd16 r4, r2, r3 @ b11
    ssub16 r3, r2, r3 @ b1
    str.w r3, [r0, #84] @ b1
    str.w r5, [r0, #168] @ b2
    str.w r7, [r0, #252] @ b3
    str.w r9, [r0, #336] @ b4
    str.w r11, [r0, #420] @ b5
    str.w r4, [r0, #924] @ b11
    str.w r6, [r0, #1008] @ b12
    str.w r8, [r0, #1092] @ b13
    str.w r10, [r0, #1176] @ b14
    str.w r12, [r0, #1260] @ b15
    ldr.w r2, [r1, #1176] @ a14
    ldr.w r3, [r1, #252] @ a3
    ldr.w r4, [r1, #168] @ a2
    ldr.w r5, [r1, #1512] @ a18
    ldr.w r6, [r1, #1008] @ a12
    ldr.w r7, [r1, #1260] @ a15
    ldr.w r8, [r1, #840] @ a10
    ldr.w r9, [r1, #672] @ a8
    ldr.w r10, [r1, #1596] @ a19
    ldr.w r11, [r1, #588] @ a7
    sadd16 r12, r2, r3
    sadd16 r12, r12, r4
    sadd16 r12, r12, r5
    sadd16 r12, r12, r6
    sadd16 r12, r12, r7
    sadd16 r12, r12, r8
    sadd16 r12, r12, r9
    sadd16 r12, r12, r10
    sadd16 r12, r12, r11
    ssub16 r2, lr, r2 @ -a14
    ssub16 r4, lr, r4 @ -a2
    ssub16 r6, lr, r6 @ -a12
    ssub16 r7, lr, r7 @ -a15
    ssub16 r9, lr, r9 @ -a8
    ssub16 r11, lr, r11 @ -a7
    vmov s6, r12
    str.w r2, [r0, #2184] @ b26
    str.w r4, [r0, #2268] @ b27
    str.w r6, [r0, #2352] @ b28
    str.w r8, [r0, #2436] @ b29
    str.w r10, [r0, #2520] @ b30
    str.w r3, [r0, #3024] @ b36
    str.w r5, [r0, #3108] @ b37
    str.w r7, [r0, #3192] @ b38
    str.w r9, [r0, #3276] @ b39
    str.w r11, [r0, #3360] @ b40
    sadd16 r12, r10, r11 @ b20
    ssub16 r11, r10, r11 @ b10
    sadd16 r10, r8, r9 @ b19
    ssub16 r9, r8, r9 @ b9
    ssub16 r8, r6, r7
    ssub16 r8, lr, r8 @ b18
    sadd16 r7, r6, r7
    ssub16 r7, lr, r7 @ b8
    sadd16 r6, r4, r5
    ssub16 r6, lr, r6 @ b17
    ssub16 r5, r5, r4 @ b7
    sadd16 r4, r2, r3
    ssub16 r4, lr, r4 @ b16
    ssub16 r3, r3, r2 @ b6
    str.w r3, [r0, #504] @ b6
    str.w r5, [r0, #588] @ b7
    str.w r7, [r0, #672] @ b8
    str.w r9, [r0, #756] @ b9
    str.w r11, [r0, #840] @ b10
    str.w r4, [r0, #1344] @ b16
    str.w r6, [r0, #1428] @ b17
    str.w r8, [r0, #1512] @ b18
    str.w r10, [r0, #1596] @ b19
    str.w r12, [r0, #1680] @ b20
    ldr.w r2, [r1], #4
    vmov r3, s5
    vmov r4, s6
    mov.w r5, #5167
    vmov r6, s4 @ qinv
    sbfx r7, r3, #0, #16
    sbfx r8, r3, #16, #16
    sbfx r9, r4, #0, #16
    sbfx r10, r4, #16, #16
    add.w r7, r7, r9
    add.w r8, r8, r10
    smmulr r9, r7, r6
    mls r7, r9, r5, r7
    smmulr r9, r8, r6
    mls r8, r9, r5, r8
    pkhbt r3, r7, r8, lsl #16
    sadd16 r2, r2, r3
    str.w r2, [r0], #4
    vmov r3, s2
    cmp.w r1, r3
    bne.w crt_1
    add.w r3, r3, #52
    vmov s2, r3
@ load a856a857 but a857 = 0
    ldr.w r2, [r1, #84] @ a1
    ldr.w r3, [r1, #756] @ a9
    ldr.w r4, [r1, #504] @ a6
    ldr.w r5, [r1, #1092] @ a13
    ldr.w r6, [r1, #420] @ a5
    ldr.w r7, [r1, #336] @ a4
    ldr.w r8, [r1, #924] @ a11
    ldr.w r9, [r1, #1428] @ a17
    ldr.w r10, [r1, #1344] @ a16
    ldr.w r11, [r1, #1680] @ a20
    ubfx r11, r11, #0, #16
    sadd16 r12, r2, r3
    sadd16 r12, r12, r4
    sadd16 r12, r12, r5
    sadd16 r12, r12, r6
    sadd16 r12, r12, r7
    sadd16 r12, r12, r8
    sadd16 r12, r12, r9
    sadd16 r12, r12, r10
    sadd16 r12, r12, r11
    ssub16 r6, lr, r6 @ -a5
    ssub16 r10, lr, r10 @ -a16
    ssub16 r3, lr, r3 @ -a9
    ssub16 r5, lr, r5 @ -a13
    ssub16 r9, lr, r9 @ -a17
    ssub16 r11, lr, r11 @ -a20
    vmov s5, r12 @ sum0, sum1
    str.w r2, [r0, #1764] @ b21
    str.w r4, [r0, #1848] @ b22
    str.w r6, [r0, #1932] @ b23
    str.w r8, [r0, #2016] @ b24
    str.w r10, [r0, #2100] @ b25
    str.w r3, [r0, #2604] @ b31
    str.w r5, [r0, #2688] @ b32
    str.w r7, [r0, #2772] @ b33
    str.w r9, [r0, #2856] @ b34
    str.w r11, [r0, #2940] @ b35
    ssub16 r12, r10, r11
    ssub16 r12, lr, r12 @ b15
    sadd16 r11, r10, r11
    ssub16 r11, lr, r11 @ b5
    sadd16 r10, r8, r9 @ b14
    ssub16 r9, r8, r9 @ b4
    sadd16 r8, r6, r7
    ssub16 r8, lr, r8 @ b13
    ssub16 r7, r7, r6 @ b3
    sadd16 r6, r4, r5 @ b12
    ssub16 r5, r4, r5 @ b2
    sadd16 r4, r2, r3 @ b11
    ssub16 r3, r2, r3 @ b1
    str.w r3, [r0, #84] @ b1
    str.w r5, [r0, #168] @ b2
    str.w r7, [r0, #252] @ b3
    str.w r9, [r0, #336] @ b4
    str.w r11, [r0, #420] @ b5
    str.w r4, [r0, #924] @ b11
    str.w r6, [r0, #1008] @ b12
    str.w r8, [r0, #1092] @ b13
    str.w r10, [r0, #1176] @ b14
    str.w r12, [r0, #1260] @ b15
    ldr.w r2, [r1, #1176] @ a14
    ldr.w r3, [r1, #252] @ a3
    ldr.w r4, [r1, #168] @ a2
    ldr.w r5, [r1, #1512] @ a18
    ldr.w r6, [r1, #1008] @ a12
    ldr.w r7, [r1, #1260] @ a15
    ldr.w r8, [r1, #840] @ a10
    ldr.w r9, [r1, #672] @ a8
    ldr.w r10, [r1, #1596] @ a19
    ldr.w r11, [r1, #588] @ a7
    sadd16 r12, r2, r3
    sadd16 r12, r12, r4
    sadd16 r12, r12, r5
    sadd16 r12, r12, r6
    sadd16 r12, r12, r7
    sadd16 r12, r12, r8
    sadd16 r12, r12, r9
    sadd16 r12, r12, r10
    sadd16 r12, r12, r11
    ssub16 r2, lr, r2 @ -a14
    ssub16 r4, lr, r4 @ -a2
    ssub16 r6, lr, r6 @ -a12
    ssub16 r7, lr, r7 @ -a15
    ssub16 r9, lr, r9 @ -a8
    ssub16 r11, lr, r11 @ -a7
    vmov s6, r12
    str.w r2, [r0, #2184] @ b26
    str.w r4, [r0, #2268] @ b27
    str.w r6, [r0, #2352] @ b28
    str.w r8, [r0, #2436] @ b29
    str.w r10, [r0, #2520] @ b30
    str.w r3, [r0, #3024] @ b36
    str.w r5, [r0, #3108] @ b37
    str.w r7, [r0, #3192] @ b38
    str.w r9, [r0, #3276] @ b39
    str.w r11, [r0, #3360] @ b40
    sadd16 r12, r10, r11 @ b20
    ssub16 r11, r10, r11 @ b10
    sadd16 r10, r8, r9 @ b19
    ssub16 r9, r8, r9 @ b9
    ssub16 r8, r6, r7
    ssub16 r8, lr, r8 @ b18
    sadd16 r7, r6, r7
    ssub16 r7, lr, r7 @ b8
    sadd16 r6, r4, r5
    ssub16 r6, lr, r6 @ b17
    ssub16 r5, r5, r4 @ b7
    sadd16 r4, r2, r3
    ssub16 r4, lr, r4 @ b16
    ssub16 r3, r3, r2 @ b6
    str.w r3, [r0, #504] @ b6
    str.w r5, [r0, #588] @ b7
    str.w r7, [r0, #672] @ b8
    str.w r9, [r0, #756] @ b9
    str.w r11, [r0, #840] @ b10
    str.w r4, [r0, #1344] @ b16
    str.w r6, [r0, #1428] @ b17
    str.w r8, [r0, #1512] @ b18
    str.w r10, [r0, #1596] @ b19
    str.w r12, [r0, #1680] @ b20
    ldr.w r2, [r1], #4
    vmov r3, s5
    vmov r4, s6
    mov.w r5, #5167
    vmov r6, s4 @ qinv
    sbfx r7, r3, #0, #16
    sbfx r8, r3, #16, #16
    sbfx r9, r4, #0, #16
    sbfx r10, r4, #16, #16
    add.w r7, r7, r9
    add.w r8, r8, r10
    smmulr r9, r7, r6
    mls r7, r9, r5, r7
    smmulr r9, r8, r6
    mls r8, r9, r5, r8
    pkhbt r3, r7, r8, lsl #16
    sadd16 r2, r2, r3
    str.w r2, [r0], #4
crt_2:
    ldr.w r2, [r1, #84] @ a1
    ldr.w r3, [r1, #756] @ a9
    ldr.w r4, [r1, #504] @ a6
    ldr.w r5, [r1, #1092] @ a13
    ldr.w r6, [r1, #420] @ a5
    ldr.w r7, [r1, #336] @ a4
    ldr.w r8, [r1, #924] @ a11
    ldr.w r9, [r1, #1428] @ a17
    ldr.w r10, [r1, #1344] @ a16
    mov.w r11, #0
    sadd16 r12, r2, r3
    sadd16 r12, r12, r4
    sadd16 r12, r12, r5
    sadd16 r12, r12, r6
    sadd16 r12, r12, r7
    sadd16 r12, r12, r8
    sadd16 r12, r12, r9
    sadd16 r12, r12, r10
    @ sadd16 r12, r12, r11
    ssub16 r6, lr, r6 @ -a5
    ssub16 r10, lr, r10 @ -a16
    ssub16 r3, lr, r3 @ -a9
    ssub16 r5, lr, r5 @ -a13
    ssub16 r9, lr, r9 @ -a17
    @ ssub16 r11, lr, r11 @ -a20
    vmov s5, r12 @ sum0, sum1
    str.w r2, [r0, #1764] @ b21
    str.w r4, [r0, #1848] @ b22
    str.w r6, [r0, #1932] @ b23
    str.w r8, [r0, #2016] @ b24
    str.w r10, [r0, #2100] @ b25
    str.w r3, [r0, #2604] @ b31
    str.w r5, [r0, #2688] @ b32
    str.w r7, [r0, #2772] @ b33
    str.w r9, [r0, #2856] @ b34
    str.w r11, [r0, #2940] @ b35
    ssub16 r12, r10, r11
    ssub16 r12, lr, r12 @ b15
    sadd16 r11, r10, r11
    ssub16 r11, lr, r11 @ b5
    sadd16 r10, r8, r9 @ b14
    ssub16 r9, r8, r9 @ b4
    sadd16 r8, r6, r7
    ssub16 r8, lr, r8 @ b13
    ssub16 r7, r7, r6 @ b3
    sadd16 r6, r4, r5 @ b12
    ssub16 r5, r4, r5 @ b2
    sadd16 r4, r2, r3 @ b11
    ssub16 r3, r2, r3 @ b1
    str.w r3, [r0, #84] @ b1
    str.w r5, [r0, #168] @ b2
    str.w r7, [r0, #252] @ b3
    str.w r9, [r0, #336] @ b4
    str.w r11, [r0, #420] @ b5
    str.w r4, [r0, #924] @ b11
    str.w r6, [r0, #1008] @ b12
    str.w r8, [r0, #1092] @ b13
    str.w r10, [r0, #1176] @ b14
    str.w r12, [r0, #1260] @ b15
    ldr.w r2, [r1, #1176] @ a14
    ldr.w r3, [r1, #252] @ a3
    ldr.w r4, [r1, #168] @ a2
    ldr.w r5, [r1, #1512] @ a18
    ldr.w r6, [r1, #1008] @ a12
    ldr.w r7, [r1, #1260] @ a15
    ldr.w r8, [r1, #840] @ a10
    ldr.w r9, [r1, #672] @ a8
    ldr.w r10, [r1, #1596] @ a19
    ldr.w r11, [r1, #588] @ a7
    sadd16 r12, r2, r3
    sadd16 r12, r12, r4
    sadd16 r12, r12, r5
    sadd16 r12, r12, r6
    sadd16 r12, r12, r7
    sadd16 r12, r12, r8
    sadd16 r12, r12, r9
    sadd16 r12, r12, r10
    sadd16 r12, r12, r11
    ssub16 r2, lr, r2 @ -a14
    ssub16 r4, lr, r4 @ -a2
    ssub16 r6, lr, r6 @ -a12
    ssub16 r7, lr, r7 @ -a15
    ssub16 r9, lr, r9 @ -a8
    ssub16 r11, lr, r11 @ -a7
    vmov s6, r12
    str.w r2, [r0, #2184] @ b26
    str.w r4, [r0, #2268] @ b27
    str.w r6, [r0, #2352] @ b28
    str.w r8, [r0, #2436] @ b29
    str.w r10, [r0, #2520] @ b30
    str.w r3, [r0, #3024] @ b36
    str.w r5, [r0, #3108] @ b37
    str.w r7, [r0, #3192] @ b38
    str.w r9, [r0, #3276] @ b39
    str.w r11, [r0, #3360] @ b40
    sadd16 r12, r10, r11 @ b20
    ssub16 r11, r10, r11 @ b10
    sadd16 r10, r8, r9 @ b19
    ssub16 r9, r8, r9 @ b9
    ssub16 r8, r6, r7
    ssub16 r8, lr, r8 @ b18
    sadd16 r7, r6, r7
    ssub16 r7, lr, r7 @ b8
    sadd16 r6, r4, r5
    ssub16 r6, lr, r6 @ b17
    ssub16 r5, r5, r4 @ b7
    sadd16 r4, r2, r3
    ssub16 r4, lr, r4 @ b16
    ssub16 r3, r3, r2 @ b6
    str.w r3, [r0, #504] @ b6
    str.w r5, [r0, #588] @ b7
    str.w r7, [r0, #672] @ b8
    str.w r9, [r0, #756] @ b9
    str.w r11, [r0, #840] @ b10
    str.w r4, [r0, #1344] @ b16
    str.w r6, [r0, #1428] @ b17
    str.w r8, [r0, #1512] @ b18
    str.w r10, [r0, #1596] @ b19
    str.w r12, [r0, #1680] @ b20
    ldr.w r2, [r1], #4
    vmov r3, s5
    vmov r4, s6
    mov.w r5, #5167
    vmov r6, s4 @ qinv
    sbfx r7, r3, #0, #16
    sbfx r8, r3, #16, #16
    sbfx r9, r4, #0, #16
    sbfx r10, r4, #16, #16
    add.w r7, r7, r9
    add.w r8, r8, r10
    smmulr r9, r7, r6
    mls r7, r9, r5, r7
    smmulr r9, r8, r6
    mls r8, r9, r5, r8
    pkhbt r3, r7, r8, lsl #16
    sadd16 r2, r2, r3
    str.w r2, [r0], #4
    vmov r3, s2
    cmp.w r1, r3
    bne.w crt_2
@ crt done : {(x^10 - 1) X (x^10 + 1)} X (x^20 + 1)
    vmov r0, s0
    add.w r1, r0, #84
    vmov s2, r1
polymul_10x10_positive:
    ldr.w r2, [r0, #84] @ a1
    ldr.w r3, [r0, #168] @ a2
    ldr.w r4, [r0, #252] @ a3
    ldr.w r5, [r0, #336] @ a4
    ldr.w r6, [r0, #420] @ a5
    ldr.w r7, [r0, #504] @ a6
    ldr.w r8, [r0, #588] @ a7
    ldr.w r9, [r0, #672] @ a8
    ldr.w r10, [r0, #756] @ a9
    ldr.w r11, [r0, #840] @ a10
    sadd16 r1, r2, r7
    ssub16 r7, r2, r7
    sadd16 r2, r3, r8
    ssub16 r8, r3, r8
    sadd16 r3, r4, r9
    ssub16 r9, r4, r9
    sadd16 r4, r5, r10
    ssub16 r10, r5, r10
    sadd16 r5, r6, r11
    ssub16 r11, r6, r11
    str.w r7, [r0, #504] @ a6
    str.w r8, [r0, #588] @ a7
    str.w r9, [r0, #672] @ a8
    str.w r10, [r0, #756] @ a9
    str.w r11, [r0, #840] @ a10
    vmov s5, r0
@ r1-r5 = 5x5 mod x^5 - 1
    vmov lr, s3
    ldr.w r6, [lr] @ w1w2
    ldr.w r7, [lr, #4] @ w3w4
    ldr.w r8, [lr, #8] @ w5w6
    vmov r9, s4 @ qinv
    mov.w r10, #5167
    smulbb r11, r1, r6
    smlabb r11, r2, r8, r11
    smlabt r11, r3, r7, r11
    smlabb r11, r4, r7, r11
    smlabt r11, r5, r6, r11 @ b1
    smultb r12, r1, r6
    smlatb r12, r2, r8, r12
    smlatt r12, r3, r7, r12
    smlatb r12, r4, r7, r12
    smlatt r12, r5, r6, r12 @ b'1
    smmulr r0, r11, r9
    mls r11, r0, r10, r11
    smmulr r0, r12, r9
    mls r12, r0, r10, r12
    pkhbt r11, r11, r12, lsl #16 @ d1
    smulbt r12, r1, r6
    smlabb r12, r2, r6, r12
    smlabb r12, r3, r8, r12
    smlabt r12, r4, r7, r12
    smlabb r12, r5, r7, r12 @ b2
    smultt lr, r1, r6
    smlatb lr, r2, r6, lr
    smlatb lr, r3, r8, lr
    smlatt lr, r4, r7, lr
    smlatb lr, r5, r7, lr @ b'2
    smmulr r0, r12, r9
    mls r12, r0, r10, r12
    smmulr r0, lr, r9
    mls lr, r0, r10, lr
    pkhbt r12, r12, lr, lsl #16 @ d2
    vmov s7, r11 @ d1
    vmov s8, r12 @ d2
    smulbb r11, r1, r7
    smlabt r11, r2, r6, r11
    smlabb r11, r3, r6, r11
    smlabb r11, r4, r8, r11
    smlabt r11, r5, r7, r11 @ b3
    smultb r12, r1, r7
    smlatt r12, r2, r6, r12
    smlatb r12, r3, r6, r12
    smlatb r12, r4, r8, r12
    smlatt r12, r5, r7, r12 @ b'3
    smmulr r0, r11, r9
    mls r11, r0, r10, r11
    smmulr r0, r12, r9
    mls r12, r0, r10, r12
    pkhbt r11, r11, r12, lsl #16 @ d3
    smulbt r12, r1, r7
    smlabb r12, r2, r7, r12
    smlabt r12, r3, r6, r12
    smlabb r12, r4, r6, r12
    smlabb r12, r5, r8, r12 @ b4
    smultt lr, r1, r7
    smlatb lr, r2, r7, lr
    smlatt lr, r3, r6, lr
    smlatb lr, r4, r6, lr
    smlatb lr, r5, r8, lr @ b'4
    smmulr r0, r12, r9
    mls r12, r0, r10, r12
    smmulr r0, lr, r9
    mls lr, r0, r10, lr
    pkhbt r12, r12, lr, lsl #16 @ d4
    smulbb lr, r1, r8
    smlabt lr, r2, r7, lr
    smlabb lr, r3, r7, lr
    smlabt lr, r4, r6, lr
    smlabb lr, r5, r6, lr @ b5
    smultb r0, r1, r8
    smlatt r0, r2, r7, r0
    smlatb r0, r3, r7, r0
    smlatt r0, r4, r6, r0
    smlatb r0, r5, r6, r0 @ b'5
    smmulr r6, lr, r9
    mls lr, r6, r10, lr
    smmulr r6, r0, r9
    mls r0, r6, r10, r0
    pkhbt lr, lr, r0, lsl #16 @ d5
    vmov s9, r11 @ d3
    vmov s10, r12 @ d4
    vmov s11, lr @ d5
    vmov r0, s5
    ldr.w r1, [r0, #504] @ a6
    ldr.w r2, [r0, #588] @ a7
    ldr.w r3, [r0, #672] @ a8
    ldr.w r4, [r0, #756] @ a9
    ldr.w r5, [r0, #840] @ a10
    vmov lr, s3
    ldr.w r6, [lr, #12] @ w7w8
    ldr.w r7, [lr, #16] @ w9w10
    @ r8 = w5w6
    smulbt r11, r1, r8
    smulbt r12, r2, r7
    smlabb r12, r3, r7, r12
    smlabt r12, r4, r6, r12
    smlabb r12, r5, r6, r12
    sub.w r11, r11, r12 @ b6
    smultt r12, r1, r8
    smultt lr, r2, r7
    smlatb lr, r3, r7, lr
    smlatt lr, r4, r6, lr
    smlatb lr, r5, r6, lr
    sub.w r12, r12, lr @ b'6
    smmulr r0, r11, r9
    mls r11, r0, r10, r11
    smmulr r0, r12, r9
    mls r12, r0, r10, r12
    pkhbt r11, r11, r12, lsl #16 @ d6
    smulbb r12, r1, r6
    smlabt r12, r2, r8, r12
    smulbt lr, r3, r7
    smlabb lr, r4, r7, lr
    smlabt lr, r5, r6, lr
    sub.w r12, r12, lr @ b7
    smultb lr, r1, r6
    smlatt lr, r2, r8, lr
    smultt r0, r3, r7
    smlatb r0, r4, r7, r0
    smlatt r0, r5, r6, r0
    sub.w lr, lr, r0 @ b'7
    smmulr r0, r12, r9
    mls r12, r0, r10, r12
    smmulr r0, lr, r9
    mls lr, r0, r10, lr
    pkhbt r12, r12, lr, lsl #16 @ d7
    vmov s12, r11 @ d6
    vmov s13, r12 @ d7
    smulbt r11, r1, r6
    smlabb r11, r2, r6, r11
    smlabt r11, r3, r8, r11
    smulbt r12, r4, r7
    smlabb r12, r5, r7, r12
    sub.w r11, r11, r12 @ b8
    smultt r12, r1, r6
    smlatb r12, r2, r6, r12
    smlatt r12, r3, r8, r12
    smultt lr, r4, r7
    smlatb lr, r5, r7, lr
    sub.w r12, r12, lr @ b'8
    smmulr r0, r11, r9
    mls r11, r0, r10, r11
    smmulr r0, r12, r9
    mls r12, r0, r10, r12
    pkhbt r11, r11, r12, lsl #16 @ d8
    smulbb r12, r1, r7
    smlabt r12, r2, r6, r12
    smlabb r12, r3, r6, r12
    smlabt r12, r4, r8, r12
    smulbt lr, r5, r7
    sub.w r12, r12, lr @ b9
    smultb lr, r1, r7
    smlatt lr, r2, r6, lr
    smlatb lr, r3, r6, lr
    smlatt lr, r4, r8, lr
    smultt r0, r5, r7
    sub.w lr, lr, r0 @ b'9
    smmulr r0, r12, r9
    mls r12, r0, r10, r12
    smmulr r0, lr, r9
    mls lr, r0, r10, lr
    pkhbt r12, r12, lr, lsl #16 @ d9
    smulbt lr, r1, r7
    smlabb lr, r2, r7, lr
    smlabt lr, r3, r6, lr
    smlabb lr, r4, r6, lr
    smlabt lr, r5, r8, lr @ b10
    smultt r0, r1, r7
    smlatb r0, r2, r7, r0
    smlatt r0, r3, r6, r0
    smlatb r0, r4, r6, r0
    smlatt r0, r5, r8, r0 @ b'10
    smmulr r6, lr, r9
    mls lr, r6, r10, lr
    smmulr r6, r0, r9
    mls r0, r6, r10, r0
    pkhbt lr, lr, r0, lsl #16 @ d10
    vmov r10, s13 @ d7
    vmov r9, s12 @ d6
    vmov r8, s11 @ d5
    vmov r7, s10 @ d4
    vmov r6, s9 @ d3
    vmov r5, s8 @ d2
    vmov r4, s7 @ d1
    sadd16 r1, r4, r9 @ p1
    ssub16 r2, r4, r9 @ p6
    sadd16 r3, r5, r10 @ p2
    ssub16 r4, r5, r10 @ p7
    sadd16 r5, r6, r11 @ p3
    ssub16 r6, r6, r11 @ p8
    sadd16 r9, r7, r12 @ p4
    ssub16 r10, r7, r12 @ p9
    sadd16 r11, r8, lr @ p5
    ssub16 r12, r8, lr @ p10
    vmov r0, s5
    str.w r1, [r0, #84] @ a1
    str.w r3, [r0, #168] @ a2
    str.w r5, [r0, #252] @ a3
    str.w r9, [r0, #336] @ a4
    str.w r11, [r0, #420] @ a5
    str.w r2, [r0, #504] @ a6
    str.w r4, [r0, #588] @ a7
    str.w r6, [r0, #672] @ a8
    str.w r10, [r0, #756] @ a9
    str.w r12, [r0, #840] @ a10
    vmov r1, s2
    add.w r0, r0, #4
    cmp.w r0, r1
    bne.w polymul_10x10_positive
    vmov r0, s0
polymul_10x10_negative_part1:
    ldr.w r2, [r0, #924] @ a11
    ldr.w r7, [r0, #1008] @ a12
    ldr.w r3, [r0, #1092] @ a13
    ldr.w r8, [r0, #1176] @ a14
    ldr.w r4, [r0, #1260] @ a15
    ldr.w r9, [r0, #1344] @ a16
    ldr.w r5, [r0, #1428] @ a17
    ldr.w r10, [r0, #1512] @ a18
    ldr.w r6, [r0, #1596] @ a19
    ldr.w r11, [r0, #1680] @ a20
    pkhbt r1, r2, r7, lsl #16 @ c1c2
    pkhtb r7, r7, r2, asr #16
    pkhbt r2, r3, r8, lsl #16 @ c3c4
    pkhtb r8, r8, r3, asr #16 
    pkhbt r3, r4, r9, lsl #16 @ c5c6
    pkhtb r9, r9, r4, asr #16 
    pkhbt r4, r5, r10, lsl #16 @ c7c8
    pkhtb r10, r10, r5, asr #16 
    pkhbt r5, r6, r11, lsl #16 @ c9c10
    pkhtb r11, r11, r6, asr #16
    str.w r7, [r0, #1344]
    str.w r8, [r0, #1428]
    str.w r9, [r0, #1512]
    str.w r10, [r0, #1596]
    str.w r11, [r0, #1680]
    vmov s5, r0
    vmov lr, s3
    ldr.w r6, [lr, #20]
    ldr.w r7, [lr, #24]
    ldr.w r8, [lr, #28]
    ldr.w r9, [lr, #32]
    ldr.w r10, [lr, #36]
@ r1-r5 * r6-r10 : 10 x 10 mod (x^10 + 1)
@ free r0, r11, r12, lr
    smuadx r11, r6, r1
    smuadx r12, r7, r5
    smladx r12, r8, r4, r12
    smladx r12, r9, r3, r12
    smladx r12, r10, r2, r12
    sub.w r11, r11, r12 @ c1
    smuadx r12, r6, r2
    smladx r12, r7, r1, r12
    smuadx lr, r8, r5
    smladx lr, r9, r4, lr
    smladx lr, r10, r3, lr
    sub.w r12, r12, lr @ c3
    smuadx lr, r6, r3
    smladx lr, r7, r2, lr
    smladx lr, r8, r1, lr
    smuadx r0, r9, r5
    smladx r0, r10, r4, r0
    sub.w lr, lr, r0 @ c5
    smuadx r0, r6, r5
    smladx r0, r7, r4, r0
    smladx r0, r8, r3, r0
    smladx r0, r9, r2, r0
    smladx r0, r10, r1, r0 @ c9
    vmov s6, r11 @ c1
    vmov s7, r12 @ c3
    vmov s8, lr @ c5
    vmov s10, r0 @ c9
    smuadx r11, r6, r4
    smladx r11, r7, r3, r11
    smladx r11, r8, r2, r11
    smladx r11, r9, r1, r11
    smuadx r12, r10, r5
    sub.w r11, r11, r12 @ c7
    pkhbt r0, r1, r5 @ a0a9
    pkhtb r1, r1, r2 @ a2a1
    pkhtb r2, r2, r3 @ a4a3
    pkhtb r3, r3, r4 @ a6a5
    pkhtb r4, r4, r5 @ a8a7
@ free r5, r12, lr
    smusd r5, r6, r0
    smuad r12, r7, r4
    smlad r12, r8, r3, r12
    smlad r12, r9, r2, r12
    smlad r12, r10, r1, r12
    sub.w r5, r5, r12 @ c0
    smuad r12, r6, r1
    smlsd r12, r7, r0, r12
    smuad lr, r8, r4
    smlad lr, r9, r3, lr
    smlad lr, r10, r2, lr
    sub.w r12, r12, lr @ c2
    vmov s9, r11 @ c7
    vmov s11, r5 @ c0
    vmov s12, r12 @ c2
    smuad r5, r6, r2
    smlad r5, r7, r1, r5
    smlsd r5, r8, r0, r5
    smuad r11, r9, r4
    smlad r11, r10, r3, r11
    sub.w r5, r5, r11 @ c4
    smuad r11, r6, r3
    smlad r11, r7, r2, r11
    smlad r11, r8, r1, r11
    smlsd r11, r9, r0, r11
    smuad r12, r10, r4
    sub.w r11, r11, r12 @ c6
    smuad r12, r6, r4
    smlad r12, r7, r3, r12
    smlad r12, r8, r2, r12
    smlad r12, r9, r1, r12
    smlsd r12, r10, r0, r12 @ c8
    vmov r0, s5
    vmov r1, s4
    mov.w r2, #5167
    vmov r3, s11 @ c0
    vmov r4, s6 @ c1
    vmov r6, s8 @ c5
    vmov r7, s12 @ c2
    vmov r8, s7 @ c3
    vmov r9, s9 @ c7
    vmov r10, s10 @ c9
    smmulr lr, r3, r1
    mls r3, lr, r2, r3
    smmulr lr, r4, r1
    mls r4, lr, r2, r4
    smmulr lr, r5, r1
    mls r5, lr, r2, r5
    smmulr lr, r6, r1
    mls r6, lr, r2, r6
    smmulr lr, r7, r1
    mls r7, lr, r2, r7
    smmulr lr, r8, r1
    mls r8, lr, r2, r8
    smmulr lr, r9, r1
    mls r9, lr, r2, r9
    smmulr lr, r10, r1
    mls r10, lr, r2, r10
    smmulr lr, r11, r1
    mls r11, lr, r2, r11
    smmulr lr, r12, r1
    mls r12, lr, r2, r12
    pkhbt r3, r3, r4, lsl #16
    pkhbt r4, r7, r8, lsl #16
    pkhbt r5, r5, r6, lsl #16
    pkhbt r6, r11, r9, lsl #16
    pkhbt r7, r12, r10, lsl #16
    str.w r3, [r0, #924]
    str.w r4, [r0, #1008]
    str.w r5, [r0, #1092]
    str.w r6, [r0, #1176]
    str.w r7, [r0, #1260]
    vmov r1, s2
    add.w r0, r0, #4
    cmp.w r0, r1
    bne.w polymul_10x10_negative_part1
    vmov r0, s0
polymul_10x10_negative_part2:
    ldr.w r1, [r0, #1344]
    ldr.w r2, [r0, #1428]
    ldr.w r3, [r0, #1512]
    ldr.w r4, [r0, #1596]
    ldr.w r5, [r0, #1680]
    vmov s5, r0
    vmov lr, s3
    ldr.w r6, [lr, #20]
    ldr.w r7, [lr, #24]
    ldr.w r8, [lr, #28]
    ldr.w r9, [lr, #32]
    ldr.w r10, [lr, #36]
@ r1-r5 * r6-r10 : 10 x 10 mod (x^10 + 1)
@ free r0, r11, r12, lr
    smuadx r11, r6, r1
    smuadx r12, r7, r5
    smladx r12, r8, r4, r12
    smladx r12, r9, r3, r12
    smladx r12, r10, r2, r12
    sub.w r11, r11, r12 @ c1
    smuadx r12, r6, r2
    smladx r12, r7, r1, r12
    smuadx lr, r8, r5
    smladx lr, r9, r4, lr
    smladx lr, r10, r3, lr
    sub.w r12, r12, lr @ c3
    smuadx lr, r6, r3
    smladx lr, r7, r2, lr
    smladx lr, r8, r1, lr
    smuadx r0, r9, r5
    smladx r0, r10, r4, r0
    sub.w lr, lr, r0 @ c5
    smuadx r0, r6, r5
    smladx r0, r7, r4, r0
    smladx r0, r8, r3, r0
    smladx r0, r9, r2, r0
    smladx r0, r10, r1, r0 @ c9
    vmov s6, r11 @ c1
    vmov s7, r12 @ c3
    vmov s8, lr @ c5
    vmov s10, r0 @ c9
    smuadx r11, r6, r4
    smladx r11, r7, r3, r11
    smladx r11, r8, r2, r11
    smladx r11, r9, r1, r11
    smuadx r12, r10, r5
    sub.w r11, r11, r12 @ c7
    pkhbt r0, r1, r5 @ a0a9
    pkhtb r1, r1, r2 @ a2a1
    pkhtb r2, r2, r3 @ a4a3
    pkhtb r3, r3, r4 @ a6a5
    pkhtb r4, r4, r5 @ a8a7
@ free r5, r12, lr
    smusd r5, r6, r0
    smuad r12, r7, r4
    smlad r12, r8, r3, r12
    smlad r12, r9, r2, r12
    smlad r12, r10, r1, r12
    sub.w r5, r5, r12 @ c0
    smuad r12, r6, r1
    smlsd r12, r7, r0, r12
    smuad lr, r8, r4
    smlad lr, r9, r3, lr
    smlad lr, r10, r2, lr
    sub.w r12, r12, lr @ c2
    vmov s9, r11 @ c7
    vmov s11, r5 @ c0
    vmov s12, r12 @ c2
    smuad r5, r6, r2
    smlad r5, r7, r1, r5
    smlsd r5, r8, r0, r5
    smuad r11, r9, r4
    smlad r11, r10, r3, r11
    sub.w r5, r5, r11 @ c4
    smuad r11, r6, r3
    smlad r11, r7, r2, r11
    smlad r11, r8, r1, r11
    smlsd r11, r9, r0, r11
    smuad r12, r10, r4
    sub.w r11, r11, r12 @ c6
    smuad r12, r6, r4
    smlad r12, r7, r3, r12
    smlad r12, r8, r2, r12
    smlad r12, r9, r1, r12
    smlsd r12, r10, r0, r12 @ c8
    vmov r0, s5
    vmov r1, s4
    mov.w r2, #5167
    vmov r3, s11 @ c0
    vmov r4, s6 @ c1
    vmov r6, s8 @ c5
    vmov r7, s12 @ c2
    vmov r8, s7 @ c3
    vmov r9, s9 @ c7
    vmov r10, s10 @ c9
    smmulr lr, r3, r1
    mls r3, lr, r2, r3
    smmulr lr, r4, r1
    mls r4, lr, r2, r4
    smmulr lr, r5, r1
    mls r5, lr, r2, r5
    smmulr lr, r6, r1
    mls r6, lr, r2, r6
    smmulr lr, r7, r1
    mls r7, lr, r2, r7
    smmulr lr, r8, r1
    mls r8, lr, r2, r8
    smmulr lr, r9, r1
    mls r9, lr, r2, r9
    smmulr lr, r10, r1
    mls r10, lr, r2, r10
    smmulr lr, r11, r1
    mls r11, lr, r2, r11
    smmulr lr, r12, r1
    mls r12, lr, r2, r12
    pkhbt r3, r3, r4, lsl #16
    pkhbt r4, r7, r8, lsl #16
    pkhbt r5, r5, r6, lsl #16
    pkhbt r6, r11, r9, lsl #16
    pkhbt r7, r12, r10, lsl #16
    ldr.w r8, [r0, #924]
    ldr.w r9, [r0, #1008]
    ldr.w r10, [r0, #1092]
    ldr.w r11, [r0, #1176]
    ldr.w r12, [r0, #1260]
    pkhbt r1, r8, r3, lsl #16 @ 1
    pkhtb r8, r3, r8, asr #16 @ 2
    pkhbt r2, r9, r4, lsl #16 @ 3
    pkhtb r9, r4, r9, asr #16 @ 4
    pkhbt r3, r10, r5, lsl #16 @ 5
    pkhtb r10, r5, r10, asr #16 @ 6
    pkhbt r4, r11, r6, lsl #16 @ 7
    pkhtb r11, r6, r11, asr #16 @ 8
    pkhbt r5, r12, r7, lsl #16 @ 9
    pkhtb r12, r7, r12, asr #16 @ 10
    ldr.w r6, [r0, #84]
    ldr.w r7, [r0, #168]
    sadd16 lr, r6, r1 @ 1
    ssub16 r1, r6, r1 @ 11
    sadd16 r6, r7, r8 @ 2
    ssub16 r7, r7, r8 @ 12
    str.w lr, [r0, #84]
    str.w r1, [r0, #924]
    str.w r6, [r0, #168]
    str.w r7, [r0, #1008]
    ldr.w r1, [r0, #252]
    ldr.w r6, [r0, #336]
    ldr.w r7, [r0, #420]
    ldr.w r8, [r0, #504]
    sadd16 lr, r1, r2 @ 3
    ssub16 r1, r1, r2 @ 13
    sadd16 r2, r6, r9 @ 4
    ssub16 r6, r6, r9 @ 14
    sadd16 r9, r7, r3 @ 5
    ssub16 r3, r7, r3 @ 15
    sadd16 r7, r8, r10 @ 6
    ssub16 r8, r8, r10 @ 16
    str.w lr, [r0, #252]
    str.w r1, [r0, #1092]
    str.w r2, [r0, #336]
    str.w r6, [r0, #1176]
    str.w r9, [r0, #420]
    str.w r3, [r0, #1260]
    str.w r7, [r0, #504]
    str.w r8, [r0, #1344]
    ldr.w r1, [r0, #588]
    ldr.w r2, [r0, #672]
    ldr.w r3, [r0, #756]
    ldr.w r6, [r0, #840]
    sadd16 lr, r1, r4 @ 7
    ssub16 r1, r1, r4 @ 17
    sadd16 r7, r2, r11 @ 8
    ssub16 r2, r2, r11 @ 18
    sadd16 r8, r3, r5 @ 9
    ssub16 r3, r3, r5 @ 19
    sadd16 r9, r6, r12 @ 10
    ssub16 r6, r6, r12 @ 20
    str.w lr, [r0, #588]
    str.w r1, [r0, #1428]
    str.w r7, [r0, #672]
    str.w r2, [r0, #1512]
    str.w r8, [r0, #756]
    str.w r3, [r0, #1596]
    str.w r9, [r0, #840]
    str.w r6, [r0, #1680]
    add.w r0, r0, #4
    vmov r1, s2
    cmp.w r0, r1
    bne.w polymul_10x10_negative_part2
    vmov r0, s0
    vmov lr, s14 @ buffer
polymul_20x20_negative_part1:
@ karatsuba
@ a0+a1, store
    ldr.w r2, [r0, #1764] @ 21
    ldr.w r3, [r0, #1848] @ 22
    ldr.w r4, [r0, #1932] @ 23
    ldr.w r5, [r0, #2016] @ 24
    ldr.w r6, [r0, #2604] @ 31
    ldr.w r7, [r0, #2688] @ 32
    ldr.w r8, [r0, #2772] @ 33
    ldr.w r9, [r0, #2856] @ 34
    pkhbt r1, r2, r3, lsl #16 @ 21, 22
    pkhtb r2, r3, r2, asr #16
    pkhbt r3, r4, r5, lsl #16 @ 23, 24
    pkhtb r4, r5, r4, asr #16
    pkhbt r5, r6, r7, lsl #16 @ 31, 32
    pkhtb r6, r7, r6, asr #16
    pkhbt r7, r8, r9, lsl #16 @ 33, 34
    pkhtb r8, r9, r8, asr #16
    sadd16 r9, r1, r5
    sadd16 r10, r3, r7
    sadd16 r11, r2, r6
    sadd16 r12, r4, r8
    str.w r1, [lr]
    str.w r3, [lr, #4]
    str.w r5, [lr, #80]
    str.w r7, [lr, #84]
    str.w r9, [lr, #160]
    str.w r10, [lr, #164]
    str.w r2, [lr, #240]
    str.w r4, [lr, #244]
    str.w r6, [lr, #320]
    str.w r8, [lr, #324]
    str.w r11, [lr, #400]
    str.w r12, [lr, #404]
    ldr.w r2, [r0, #2100] @ 25
    ldr.w r3, [r0, #2184] @ 26
    ldr.w r4, [r0, #2268] @ 27
    ldr.w r5, [r0, #2352] @ 28
    ldr.w r6, [r0, #2940] @ 35
    ldr.w r7, [r0, #3024] @ 36
    ldr.w r8, [r0, #3108] @ 37
    ldr.w r9, [r0, #3192] @ 38
    pkhbt r1, r2, r3, lsl #16 @ 25, 26
    pkhtb r2, r3, r2, asr #16
    pkhbt r3, r4, r5, lsl #16 @ 27, 28
    pkhtb r4, r5, r4, asr #16
    pkhbt r5, r6, r7, lsl #16 @ 35, 36
    pkhtb r6, r7, r6, asr #16
    pkhbt r7, r8, r9, lsl #16 @ 37, 38
    pkhtb r8, r9, r8, asr #16
    sadd16 r9, r1, r5
    sadd16 r10, r3, r7
    sadd16 r11, r2, r6
    sadd16 r12, r4, r8
    str.w r1, [lr, #8]
    str.w r3, [lr, #12]
    str.w r5, [lr, #88]
    str.w r7, [lr, #92]
    str.w r9, [lr, #168]
    str.w r10, [lr, #172]
    str.w r2, [lr, #248]
    str.w r4, [lr, #252]
    str.w r6, [lr, #328]
    str.w r8, [lr, #332]
    str.w r11, [lr, #408]
    str.w r12, [lr, #412]
    ldr.w r2, [r0, #2436] @ 29
    ldr.w r3, [r0, #2520] @ 30
    ldr.w r4, [r0, #3276] @ 39
    ldr.w r5, [r0, #3360] @ 40
    pkhbt r1, r2, r3, lsl #16 @ 29, 30
    pkhtb r2, r3, r2, asr #16
    pkhbt r3, r4, r5, lsl #16 @ 39, 40
    pkhtb r4, r5, r4, asr #16
    sadd16 r5, r1, r3
    sadd16 r6, r2, r4
    str.w r1, [lr, #16]
    str.w r3, [lr, #96]
    str.w r5, [lr, #176]
    str.w r2, [lr, #256]
    str.w r4, [lr, #336]
    str.w r6, [lr, #416]
    vmov r1, s2
    add.w r0, r0, #4
    add.w lr, lr, #480
    cmp.w r0, r1
    bne.w polymul_20x20_negative_part1
@ a0 = #0~19, a1 = #80~99, a0+a1 = #160~179, offset = 240 * i
    vmov lr, s14
    mov.w r1, #5040
    add.w r1, r1, r1
    add.w r12, lr, r1
    vmov s15, r12 @ buffer end
    vmov r12, s3
    ldr.w r6, [r12, #40]
    ldr.w r7, [r12, #44]
    ldr.w r8, [r12, #48]
    ldr.w r9, [r12, #52]
    ldr.w r10, [r12, #56]
polymul_20x20_negative_part2:
@ a0*b0(1-x) mod x^2 + 1
    ldr.w r1, [lr]
    ldr.w r2, [lr, #4]
    ldr.w r3, [lr, #8]
    ldr.w r4, [lr, #12]
    ldr.w r5, [lr, #16]
    smuadx r11, r1, r6 @ 1
    smuadx r12, r2, r10
    smladx r12, r3, r9, r12
    smladx r12, r4, r8, r12
    smladx r12, r5, r7, r12 @ 11
    add.w r0, r11, r12 @ 1
    sub.w r12, r12, r11 @ 11
    str.w r0, [lr, #4]
    str.w r12, [lr, #44]
    smuadx r11, r1, r7
    smladx r11, r2, r6, r11 @ 3
    smuadx r12, r3, r10
    smladx r12, r4, r9, r12
    smladx r12, r5, r8, r12 @ 13
    add.w r0, r11, r12 @ 3
    sub.w r12, r12, r11 @ 13
    str.w r0, [lr, #12]
    str.w r12, [lr, #52]
    smuadx r11, r1, r8
    smladx r11, r2, r7, r11
    smladx r11, r3, r6, r11 @ 5
    smuadx r12, r4, r10
    smladx r12, r5, r9, r12 @ 15
    add.w r0, r11, r12 @ 5
    sub.w r12, r12, r11 @ 15
    str.w r0, [lr, #20]
    str.w r12, [lr, #60]
    smuadx r11, r1, r9
    smladx r11, r2, r8, r11
    smladx r11, r3, r7, r11
    smladx r11, r4, r6, r11 @ 7
    smuadx r12, r5, r10 @ 17
    add.w r0, r11, r12 @ 7
    sub.w r12, r12, r11 @ 17
    str.w r0, [lr, #28]
    str.w r12, [lr, #68]
    smuadx r11, r1, r10
    smladx r11, r2, r9, r11
    smladx r11, r3, r8, r11
    smladx r11, r4, r7, r11
    smladx r11, r5, r6, r11 @ 9
    mov.w r12, #0
    @ add.w r0, r11, r12 @ 9
    sub.w r12, r12, r11 @ 19
    str.w r11, [lr, #36]
    str.w r12, [lr, #76]
    pkhbt r0, r1, r5
    pkhtb r1, r1, r2
    pkhtb r2, r2, r3
    pkhtb r3, r3, r4
    pkhtb r4, r4, r5
    smulbb r11, r6, r0 @ 0
    smuad r12, r7, r4
    smlad r12, r8, r3, r12
    smlad r12, r9, r2, r12
    smlad r12, r10, r1, r12
    smlatt r12, r6, r0, r12 @ 10
    add.w r5, r11, r12 @ 0
    sub.w r12, r12, r11 @ 10
    str.w r5, [lr]
    str.w r12, [lr, #40]
    smuad r11, r6, r1
    smlabb r11, r7, r0, r11 @ 2
    smuad r12, r8, r4
    smlad r12, r9, r3, r12
    smlad r12, r10, r2, r12
    smlatt r12, r7, r0, r12 @ 12
    add.w r5, r11, r12 @ 2
    sub.w r12, r12, r11 @ 12
    str.w r5, [lr, #8]
    str.w r12, [lr, #48]
    smuad r11, r6, r2
    smlad r11, r7, r1, r11
    smlabb r11, r8, r0, r11 @ 4
    smuad r12, r9, r4
    smlad r12, r10, r3, r12
    smlatt r12, r8, r0, r12 @ 14
    add.w r5, r11, r12 @ 4
    sub.w r12, r12, r11 @ 14
    str.w r5, [lr, #16]
    str.w r12, [lr, #56]
    smuad r11, r6, r3
    smlad r11, r7, r2, r11
    smlad r11, r8, r1, r11
    smlabb r11, r9, r0, r11 @ 6
    smuad r12, r10, r4
    smlatt r12, r9, r0, r12 @ 16
    add.w r5, r11, r12 @ 6
    sub.w r12, r12, r11 @ 16
    str.w r5, [lr, #24]
    str.w r12, [lr, #64]
    smuad r11, r6, r4
    smlad r11, r7, r3, r11
    smlad r11, r8, r2, r11
    smlad r11, r9, r1, r11
    smlabb r11, r10, r0, r11 @ 8
    smultt r12, r10, r0 @ 18
    add.w r5, r11, r12 @ 8
    sub.w r12, r12, r11 @ 18
    str.w r5, [lr, #32]
    str.w r12, [lr, #72]
    vmov r5, s15
    add.w lr, lr, #240
    cmp.w lr, r5
    bne.w polymul_20x20_negative_part2
    vmov lr, s14
    vmov r12, s3
    ldr.w r6, [r12, #60]
    ldr.w r7, [r12, #64]
    ldr.w r8, [r12, #68]
    ldr.w r9, [r12, #72]
    ldr.w r10, [r12, #76]
polymul_20x20_negative_part3:
@ a1b1x(1-x) mod x^2 + 1, substract
    ldr.w r1, [lr, #80]
    ldr.w r2, [lr, #84]
    ldr.w r3, [lr, #88]
    ldr.w r4, [lr, #92]
    ldr.w r5, [lr, #96]
    smuadx r11, r1, r6 @ 1
    smuadx r12, r2, r10
    smladx r12, r3, r9, r12
    smladx r12, r4, r8, r12
    smladx r12, r5, r7, r12 @ 11
    sub.w r0, r11, r12 @ 1
    add.w r12, r12, r11 @ 11
    str.w r0, [lr, #84]
    str.w r12, [lr, #124]
    smuadx r11, r1, r7
    smladx r11, r2, r6, r11 @ 3
    smuadx r12, r3, r10
    smladx r12, r4, r9, r12
    smladx r12, r5, r8, r12 @ 13
    sub.w r0, r11, r12 @ 3
    add.w r12, r12, r11 @ 13
    str.w r0, [lr, #92]
    str.w r12, [lr, #132]
    smuadx r11, r1, r8
    smladx r11, r2, r7, r11
    smladx r11, r3, r6, r11 @ 5
    smuadx r12, r4, r10
    smladx r12, r5, r9, r12 @ 15
    sub.w r0, r11, r12 @ 5
    add.w r12, r12, r11 @ 15
    str.w r0, [lr, #100]
    str.w r12, [lr, #140]
    smuadx r11, r1, r9
    smladx r11, r2, r8, r11
    smladx r11, r3, r7, r11
    smladx r11, r4, r6, r11 @ 7
    smuadx r12, r5, r10 @ 17
    sub.w r0, r11, r12 @ 7
    add.w r12, r12, r11 @ 17
    str.w r0, [lr, #108]
    str.w r12, [lr, #148]
    smuadx r11, r1, r10
    smladx r11, r2, r9, r11
    smladx r11, r3, r8, r11
    smladx r11, r4, r7, r11
    smladx r11, r5, r6, r11 @ 9
    @ mov.w r12, #0
    @ sub.w r0, r11, r12 @ 9
    @ add.w r12, r12, r11 @ 19
    str.w r11, [lr, #116]
    str.w r11, [lr, #156]
    pkhbt r0, r1, r5 @ a0a9
    pkhtb r1, r1, r2 @ a2a1
    pkhtb r2, r2, r3 @ a4a3
    pkhtb r3, r3, r4 @ a6a5
    pkhtb r4, r4, r5 @ a8a7
    smulbb r11, r6, r0 @ 0
    smuad r12, r7, r4
    smlad r12, r8, r3, r12
    smlad r12, r9, r2, r12
    smlad r12, r10, r1, r12
    smlatt r12, r6, r0, r12 @ 10
    sub.w r5, r11, r12 @ 0
    add.w r12, r12, r11 @ 10
    str.w r5, [lr, #80]
    str.w r12, [lr, #120]
    smuad r11, r6, r1
    smlabb r11, r7, r0, r11 @ 2
    smuad r12, r8, r4
    smlad r12, r9, r3, r12
    smlad r12, r10, r2, r12
    smlatt r12, r7, r0, r12 @ 12
    sub.w r5, r11, r12 @ 2
    add.w r12, r12, r11 @ 12
    str.w r5, [lr, #88]
    str.w r12, [lr, #128]
    smuad r11, r6, r2
    smlad r11, r7, r1, r11
    smlabb r11, r8, r0, r11 @ 4
    smuad r12, r9, r4
    smlad r12, r10, r3, r12
    smlatt r12, r8, r0, r12 @ 14
    sub.w r5, r11, r12 @ 4
    add.w r12, r12, r11 @ 14
    str.w r5, [lr, #96]
    str.w r12, [lr, #136]
    smuad r11, r6, r3
    smlad r11, r7, r2, r11
    smlad r11, r8, r1, r11
    smlabb r11, r9, r0, r11 @ 6
    smuad r12, r10, r4
    smlatt r12, r9, r0, r12 @ 16
    sub.w r5, r11, r12 @ 6
    add.w r12, r12, r11 @ 16
    str.w r5, [lr, #104]
    str.w r12, [lr, #144]
    smuad r11, r6, r4
    smlad r11, r7, r3, r11
    smlad r11, r8, r2, r11
    smlad r11, r9, r1, r11
    smlabb r11, r10, r0, r11 @ 8
    smultt r12, r10, r0 @ 18
    sub.w r5, r11, r12 @ 8
    add.w r12, r12, r11 @ 18
    str.w r5, [lr, #112]
    str.w r12, [lr, #152]
    vmov r5, s15
    add.w lr, lr, #240
    cmp.w lr, r5
    bne.w polymul_20x20_negative_part3
    vmov lr, s14
    vmov r12, s3
    ldr.w r6, [r12, #80]
    ldr.w r7, [r12, #84]
    ldr.w r8, [r12, #88]
    ldr.w r9, [r12, #92]
    ldr.w r10, [r12, #96]
polymul_20x20_negative_part4:
@ (a0+a1)(b0+b1)x mod x^2 + 1
    ldr.w r1, [lr, #160]
    ldr.w r2, [lr, #164]
    ldr.w r3, [lr, #168]
    ldr.w r4, [lr, #172]
    ldr.w r5, [lr, #176]
    mov.w r0, #0
    smuadx r11, r1, r6 @ 1
    smuadx r12, r2, r10
    smladx r12, r3, r9, r12
    smladx r12, r4, r8, r12
    smladx r12, r5, r7, r12 @ 11
    sub.w r12, r0, r12
    str.w r12, [lr, #164]
    str.w r11, [lr, #204]
    smuadx r11, r1, r7
    smladx r11, r2, r6, r11 @ 3
    smuadx r12, r3, r10
    smladx r12, r4, r9, r12
    smladx r12, r5, r8, r12 @ 13
    sub.w r12, r0, r12
    str.w r12, [lr, #172]
    str.w r11, [lr, #212]
    smuadx r11, r1, r8
    smladx r11, r2, r7, r11
    smladx r11, r3, r6, r11 @ 5
    smuadx r12, r4, r10
    smladx r12, r5, r9, r12 @ 15
    sub.w r12, r0, r12
    str.w r12, [lr, #180]
    str.w r11, [lr, #220]
    smuadx r11, r1, r9
    smladx r11, r2, r8, r11
    smladx r11, r3, r7, r11
    smladx r11, r4, r6, r11 @ 7
    smuadx r12, r5, r10 @ 17
    sub.w r12, r0, r12
    str.w r12, [lr, #188]
    str.w r11, [lr, #228]
    smuadx r11, r1, r10
    smladx r11, r2, r9, r11
    smladx r11, r3, r8, r11
    smladx r11, r4, r7, r11
    smladx r11, r5, r6, r11 @ 9
    str.w r0, [lr, #196]
    str.w r11, [lr, #236]
    pkhbt r0, r1, r5
    pkhtb r1, r1, r2
    pkhtb r2, r2, r3
    pkhtb r3, r3, r4
    pkhtb r4, r4, r5
    mov.w r5, #0
    smulbb r11, r6, r0 @ 0
    smuad r12, r7, r4
    smlad r12, r8, r3, r12
    smlad r12, r9, r2, r12
    smlad r12, r10, r1, r12
    smlatt r12, r6, r0, r12 @ 10
    sub.w r12, r5, r12
    str.w r12, [lr, #160]
    str.w r11, [lr, #200]
    smuad r11, r6, r1
    smlabb r11, r7, r0, r11 @ 2
    smuad r12, r8, r4
    smlad r12, r9, r3, r12
    smlad r12, r10, r2, r12
    smlatt r12, r7, r0, r12 @ 12
    sub.w r12, r5, r12
    str.w r12, [lr, #168]
    str.w r11, [lr, #208]
    smuad r11, r6, r2
    smlad r11, r7, r1, r11
    smlabb r11, r8, r0, r11 @ 4
    smuad r12, r9, r4
    smlad r12, r10, r3, r12
    smlatt r12, r8, r0, r12 @ 14
    sub.w r12, r5, r12
    str.w r12, [lr, #176]
    str.w r11, [lr, #216]
    smuad r11, r6, r3
    smlad r11, r7, r2, r11
    smlad r11, r8, r1, r11
    smlabb r11, r9, r0, r11 @ 6
    smuad r12, r10, r4
    smlatt r12, r9, r0, r12 @ 16
    sub.w r12, r5, r12
    str.w r12, [lr, #184]
    str.w r11, [lr, #224]
    smuad r11, r6, r4
    smlad r11, r7, r3, r11
    smlad r11, r8, r2, r11
    smlad r11, r9, r1, r11
    smlabb r11, r10, r0, r11 @ 8
    smultt r12, r10, r0 @ 18
    sub.w r12, r5, r12
    str.w r12, [lr, #192]
    str.w r11, [lr, #232]
    vmov r5, s15
    add.w lr, lr, #240
    cmp.w lr, r5
    bne.w polymul_20x20_negative_part4
    vmov lr, s14
    vmov r0, s0
    vmov r1, s1
    vmov r2, s4
    mov.w r3, #5167
polymul_20x20_negative_part5:
@ part2 - part3 + part4 : 
    add.w r12, lr, #80
    ldr.w r4, [r1], #4 @ constant term
    vmov s5, r0
polymul_20x20_negative_part5_1:
    ldr.w r5, [r0, #84] @ 1 (part of mod x^20 - 1)
    ldr.w r6, [lr]
    ldr.w r7, [lr, #80]
    ldr.w r8, [lr, #160]
    ldr.w r9, [lr, #240]
    ldr.w r10, [lr, #320]
    ldr.w r11, [lr, #400]
    sub.w r6, r6, r7
    add.w r6, r6, r8
    sub.w r7, r9, r10
    add.w r7, r7, r11
    smmulr r8, r6, r2
    mls r6, r8, r3, r6
    smmulr r8, r7, r2
    mls r7, r8, r3, r7
    pkhbt r6, r6, r7, lsl #16 @ 21 (part of mod x^20 + 1)
    sadd16 r7, r5, r6
    ssub16 r8, r5, r6
    sadd16 r7, r7, r4 @ 1
    sadd16 r8, r8, r4 @ 21
    str.w r8, [lr, #80]
    str.w r7, [lr], #4
    add.w r0, r0, #84
    cmp.w lr, r12
    bne.w polymul_20x20_negative_part5_1
    vmov r0, s5
    add.w r0, r0, #4
    add.w lr, lr, #400
    vmov r5, s15
    cmp.w lr, r5
    bne.w polymul_20x20_negative_part5
    vmov lr, s14
    vmov r0, s0
    adr.w r12, twist_pad
    movw.w r11, #5167 @ q
    vmov r10, s4 @ qinv
twist_1:
    ldr.w r1, [lr, #76] @ 1
    ldr.w r2, [lr, #132] @ 2
    ldr.w r3, [lr, #16] @ 3
    ldr.w r4, [lr, #28] @ 4
    ldr.w r5, [r12]
    ldr.w r6, [r12, #4]
    ldr.w r7, [r12, #8]
    ldr.w r8, [r12, #12]
    smulbb r9, r1, r5 @ 1-1
    smultt r1, r1, r5 @ 1-2
    smmulr r5, r9, r10
    mls r9, r5, r11, r9
    smmulr r5, r1, r10
    mls r1, r5, r11, r1
    pkhbt r1, r9, r1, lsl #16 @ 1
    smulbb r5, r2, r6 @ 2-1
    smultt r6, r2, r6 @ 2-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r2, r5, r6, lsl #16 @ 2
    smulbb r5, r3, r7 @ 3-1
    smultt r6, r3, r7 @ 3-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r3, r5, r6, lsl #16 @ 3
    smulbb r5, r4, r8 @ 4-1
    smultt r6, r4, r8 @ 4-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r4, r5, r6, lsl #16 @ 4
    str.w r1, [r0, #84]
    str.w r2, [r0, #168]
    str.w r3, [r0, #252]
    str.w r4, [r0, #336]
    ldr.w r1, [lr, #148] @ 5
    ldr.w r2, [lr, #72] @ 6
    ldr.w r3, [lr, #80] @ 7
    ldr.w r4, [lr, #84] @ 8
    ldr.w r5, [r12, #16]
    ldr.w r6, [r12, #20]
    ldr.w r7, [r12, #24]
    ldr.w r8, [r12, #28]
    smulbb r9, r1, r5 @ 5-1
    smultt r1, r1, r5 @ 5-2
    smmulr r5, r9, r10
    mls r9, r5, r11, r9
    smmulr r5, r1, r10
    mls r1, r5, r11, r1
    pkhbt r1, r9, r1, lsl #16 @ 5
    smulbb r5, r2, r6 @ 6-1
    smultt r6, r2, r6 @ 6-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r2, r5, r6, lsl #16 @ 6
    smulbb r5, r3, r7 @ 7-1
    smultt r6, r3, r7 @ 7-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r3, r5, r6, lsl #16 @ 7
    smulbb r5, r4, r8 @ 8-1
    smultt r6, r4, r8 @ 8-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r4, r5, r6, lsl #16 @ 8
    str.w r1, [r0, #420]
    str.w r2, [r0, #504]
    str.w r3, [r0, #588]
    str.w r4, [r0, #672]
    ldr.w r1, [lr, #116] @ 9
    ldr.w r2, [lr, #44] @ 10
    ldr.w r3, [lr, #64] @ 11
    ldr.w r4, [lr, #128] @ 12
    ldr.w r5, [r12, #32]
    ldr.w r6, [r12, #36]
    ldr.w r7, [r12, #40]
    ldr.w r8, [r12, #44]
    smulbb r9, r1, r5 @ 9-1
    smultt r1, r1, r5 @ 9-2
    smmulr r5, r9, r10
    mls r9, r5, r11, r9
    smmulr r5, r1, r10
    mls r1, r5, r11, r1
    pkhbt r1, r9, r1, lsl #16 @ 9
    smulbb r5, r2, r6 @ 10-1
    smultt r6, r2, r6 @ 10-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r2, r5, r6, lsl #16 @ 10
    smulbb r5, r3, r7 @ 11-1
    smultt r6, r3, r7 @ 11-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r3, r5, r6, lsl #16 @ 11
    smulbb r5, r4, r8 @ 12-1
    smultt r6, r4, r8 @ 12-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r4, r5, r6, lsl #16 @ 12
    str.w r1, [r0, #756]
    str.w r2, [r0, #840]
    str.w r3, [r0, #924]
    str.w r4, [r0, #1008]
    ldr.w r1, [lr, #112] @ 13
    ldr.w r2, [lr, #136] @ 14
    ldr.w r3, [lr, #88] @ 15
    ldr.w r4, [lr, #140] @ 16
    ldr.w r5, [r12, #48]
    ldr.w r6, [r12, #52]
    ldr.w r7, [r12, #56]
    ldr.w r8, [r12, #60]
    smulbb r9, r1, r5 @ 13-1
    smultt r1, r1, r5 @ 13-2
    smmulr r5, r9, r10
    mls r9, r5, r11, r9
    smmulr r5, r1, r10
    mls r1, r5, r11, r1
    pkhbt r1, r9, r1, lsl #16 @ 13
    smulbb r5, r2, r6 @ 14-1
    smultt r6, r2, r6 @ 14-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r2, r5, r6, lsl #16 @ 14
    smulbb r5, r3, r7 @ 15-1
    smultt r6, r3, r7 @ 15-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r3, r5, r6, lsl #16 @ 15
    smulbb r5, r4, r8 @ 16-1
    smultt r6, r4, r8 @ 16-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r4, r5, r6, lsl #16 @ 16
    str.w r1, [r0, #1092]
    str.w r2, [r0, #1176]
    str.w r3, [r0, #1260]
    str.w r4, [r0, #1344]
    ldr.w r1, [lr, #104] @ 17
    ldr.w r2, [lr, #12] @ 18
    ldr.w r3, [lr, #40] @ 19
    ldr.w r4, [lr, #100] @ 20
    ldr.w r5, [r12, #64]
    ldr.w r6, [r12, #68]
    ldr.w r7, [r12, #72]
    ldr.w r8, [r12, #76]
    smulbb r9, r1, r5 @ 17-1
    smultt r1, r1, r5 @ 17-2
    smmulr r5, r9, r10
    mls r9, r5, r11, r9
    smmulr r5, r1, r10
    mls r1, r5, r11, r1
    pkhbt r1, r9, r1, lsl #16 @ 17
    smulbb r5, r2, r6 @ 18-1
    smultt r6, r2, r6 @ 18-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r2, r5, r6, lsl #16 @ 18
    smulbb r5, r3, r7 @ 19-1
    smultt r6, r3, r7 @ 19-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r3, r5, r6, lsl #16 @ 19
    smulbb r5, r4, r8 @ 20-1
    smultt r6, r4, r8 @ 20-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r4, r5, r6, lsl #16 @ 20
    str.w r1, [r0, #1428]
    str.w r2, [r0, #1512]
    str.w r3, [r0, #1596]
    str.w r4, [r0, #1680]
    vmov r1, s15
    add.w lr, lr, #480
    add.w r0, r0, #4
    add.w r12, r12, #160
    cmp.w lr, r1
    bne.w twist_1
    vmov lr, s14
    vmov r0, s0
    adr.w r12, twist_pad
twist_2:
    ldr.w r1, [lr, #20] @ 21
    ldr.w r2, [lr, #120] @ 22
    ldr.w r3, [lr, #92] @ 23
    ldr.w r4, [lr, #24] @ 24
    ldr.w r5, [r12, #80]
    ldr.w r6, [r12, #84]
    ldr.w r7, [r12, #88]
    ldr.w r8, [r12, #92]
    smulbb r9, r1, r5 @ 21-1
    smultt r1, r1, r5 @ 21-2
    smmulr r5, r9, r10
    mls r9, r5, r11, r9
    smmulr r5, r1, r10
    mls r1, r5, r11, r1
    pkhbt r1, r9, r1, lsl #16 @ 21
    smulbb r5, r2, r6 @ 22-1
    smultt r6, r2, r6 @ 22-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r2, r5, r6, lsl #16 @ 22
    smulbb r5, r3, r7 @ 23-1
    smultt r6, r3, r7 @ 23-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r3, r5, r6, lsl #16 @ 23
    smulbb r5, r4, r8 @ 24-1
    smultt r6, r4, r8 @ 24-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r4, r5, r6, lsl #16 @ 24
    str.w r1, [r0, #1764]
    str.w r2, [r0, #1848]
    str.w r3, [r0, #1932]
    str.w r4, [r0, #2016]
    ldr.w r1, [lr, #60] @ 25
    ldr.w r2, [lr, #8] @ 26
    ldr.w r3, [lr, #56] @ 27
    ldr.w r4, [lr, #32] @ 28
    ldr.w r5, [r12, #96]
    ldr.w r6, [r12, #100]
    ldr.w r7, [r12, #104]
    ldr.w r8, [r12, #108]
    smulbb r9, r1, r5 @ 25-1
    smultt r1, r1, r5 @ 25-2
    smmulr r5, r9, r10
    mls r9, r5, r11, r9
    smmulr r5, r1, r10
    mls r1, r5, r11, r1
    pkhbt r1, r9, r1, lsl #16 @ 25
    smulbb r5, r2, r6 @ 26-1
    smultt r6, r2, r6 @ 26-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r2, r5, r6, lsl #16 @ 26
    smulbb r5, r3, r7 @ 27-1
    smultt r6, r3, r7 @ 27-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r3, r5, r6, lsl #16 @ 27
    smulbb r5, r4, r8 @ 28-1
    smultt r6, r4, r8 @ 28-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r4, r5, r6, lsl #16 @ 28
    str.w r1, [r0, #2100]
    str.w r2, [r0, #2184]
    str.w r3, [r0, #2268]
    str.w r4, [r0, #2352]
    ldr.w r1, [lr, #48] @ 29
    ldr.w r2, [lr, #144] @ 30
    ldr.w r3, [lr, #124] @ 31
    ldr.w r4, [lr, #36] @ 32
    ldr.w r5, [r12, #112]
    ldr.w r6, [r12, #116]
    ldr.w r7, [r12, #120]
    ldr.w r8, [r12, #124]
    smulbb r9, r1, r5 @ 29-1
    smultt r1, r1, r5 @ 29-2
    smmulr r5, r9, r10
    mls r9, r5, r11, r9
    smmulr r5, r1, r10
    mls r1, r5, r11, r1
    pkhbt r1, r9, r1, lsl #16 @ 29
    smulbb r5, r2, r6 @ 30-1
    smultt r6, r2, r6 @ 30-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r2, r5, r6, lsl #16 @ 30
    smulbb r5, r3, r7 @ 31-1
    smultt r6, r3, r7 @ 31-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r3, r5, r6, lsl #16 @ 31
    smulbb r5, r4, r8 @ 32-1
    smultt r6, r4, r8 @ 32-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r4, r5, r6, lsl #16 @ 32
    str.w r1, [r0, #2436]
    str.w r2, [r0, #2520]
    str.w r3, [r0, #2604]
    str.w r4, [r0, #2688]
    ldr.w r1, [lr, #4] @ 33
    ldr.w r2, [lr] @ 34
    ldr.w r3, [lr, #152] @ 35
    ldr.w r4, [lr, #68] @ 36
    ldr.w r5, [r12, #128]
    ldr.w r6, [r12, #132]
    ldr.w r7, [r12, #136]
    ldr.w r8, [r12, #140]
    smulbb r9, r1, r5 @ 33-1
    smultt r1, r1, r5 @ 33-2
    smmulr r5, r9, r10
    mls r9, r5, r11, r9
    smmulr r5, r1, r10
    mls r1, r5, r11, r1
    pkhbt r1, r9, r1, lsl #16 @ 33
    smulbb r5, r2, r6 @ 34-1
    smultt r6, r2, r6 @ 34-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r2, r5, r6, lsl #16 @ 34
    smulbb r5, r3, r7 @ 35-1
    smultt r6, r3, r7 @ 35-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r3, r5, r6, lsl #16 @ 35
    smulbb r5, r4, r8 @ 36-1
    smultt r6, r4, r8 @ 36-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r4, r5, r6, lsl #16 @ 36
    str.w r1, [r0, #2772]
    str.w r2, [r0, #2856]
    str.w r3, [r0, #2940]
    str.w r4, [r0, #3024]
    ldr.w r1, [lr, #108] @ 37
    ldr.w r2, [lr, #96] @ 38
    ldr.w r3, [lr, #52] @ 39
    ldr.w r4, [lr, #156] @ 40
    ldr.w r5, [r12, #144]
    ldr.w r6, [r12, #148]
    ldr.w r7, [r12, #152]
    ldr.w r8, [r12, #156]
    smulbb r9, r1, r5 @ 37-1
    smultt r1, r1, r5 @ 37-2
    smmulr r5, r9, r10
    mls r9, r5, r11, r9
    smmulr r5, r1, r10
    mls r1, r5, r11, r1
    pkhbt r1, r9, r1, lsl #16 @ 37
    smulbb r5, r2, r6 @ 38-1
    smultt r6, r2, r6 @ 38-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r2, r5, r6, lsl #16 @ 38
    smulbb r5, r3, r7 @ 39-1
    smultt r6, r3, r7 @ 39-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r3, r5, r6, lsl #16 @ 39
    smulbb r5, r4, r8 @ 40-1
    smultt r6, r4, r8 @ 40-2
    smmulr r9, r5, r10
    mls r5, r9, r11, r5
    smmulr r9, r6, r10
    mls r6, r9, r11, r6
    pkhbt r4, r5, r6, lsl #16 @ 40
    str.w r1, [r0, #3108]
    str.w r2, [r0, #3192]
    str.w r3, [r0, #3276]
    str.w r4, [r0, #3360]
    vmov r1, s15
    add.w lr, lr, #480
    add.w r0, r0, #4
    add.w r12, r12, #160
    cmp.w lr, r1
    bne.w twist_2
    vpop {s16-s31}
    pop {r2-r12, pc}
    
twist_pad:
    .word 458753
    .word 3211265
    .word 22478849
    .word 157351937
    .word 85590017
    .word 4216848385
    .word 130416641
    .word 4192010241
    .word 4251516929
    .word 34471937
    .word 4197646337
    .word 4290969601
    .word 4266983425
    .word 142737409
    .word 4278255617
    .word 4177985537
    .word 4153344001
    .word 24510465
    .word 4127916033
    .word 4141481985
    .word 4236443649
    .word 4223926273
    .word 4136304641
    .word 4200202241
    .word 13893633
    .word 97255425
    .word 3538945
    .word 24772609
    .word 4129751041
    .word 4154327041
    .word 31391745
    .word 4176084993
    .word 4140040193
    .word 4226351105
    .word 4153278465
    .word 24051713
    .word 168361985
    .word 162660353
    .word 122748929
    .word 4138336257
    .word 22478897
    .word 4216850785
    .word 4251581272
    .word 4291033565
    .word 4278256142
    .word 24575939
    .word 4236445826
    .word 4200265991
    .word 3539318
    .word 4154390234
    .word 4140104644
    .word 24115802
    .word 122750412
    .word 113443194
    .word 4264097694
    .word 4182374634
    .word 4257086441
    .word 4147446127
    .word 4150135218
    .word 99612330
    .word 4239263427
    .word 4150921315
    .word 30672711
    .word 22804809
    .word 11860457
    .word 4277666906
    .word 160888629
    .word 4262328576
    .word 4252631071
    .word 39519727
    .word 9766957
    .word 4258135281
    .word 4168546154
    .word 4254728997
    .word 81655965
    .word 4175298907
    .word 4222158302
    .word 84215020
    .word 102301432
    .word 4145023493
    .word 85592417
    .word 34535901
    .word 4278321091
    .word 4141545735
    .word 13956826
    .word 4154391130
    .word 4153278842
    .word 4138399978
    .word 4264034671
    .word 4192859818
    .word 4278192227
    .word 99613001
    .word 4274390106
    .word 4171102464
    .word 11797999
    .word 168164593
    .word 109708069
    .word 39518555
    .word 139855084
    .word 130484741
    .word 81657357
    .word 4187816581
    .word 4207278673
    .word 4145085901
    .word 4189980615
    .word 27722644
    .word 4266784990
    .word 20777469
    .word 42075073
    .word 91682576
    .word 120454201
    .word 107149576
    .word 2162747
    .word 115476582
    .word 121700669
    .word 125765152
    .word 14415945
    .word 119866675
    .word 99617245
    .word 65013346
    .word 130480984
    .word 142802883
    .word 4236444022
    .word 24836698
    .word 4153341854
    .word 113443183
    .word 4183623363
    .word 4177590601
    .word 4239324981
    .word 4171040239
    .word 4195809130
    .word 4262265179
    .word 4233035512
    .word 4180213261
    .word 81592923
    .word 167640525
    .word 4225236378
    .word 4237359326
    .word 27067653
    .word 20838160
    .word 29949072
    .word 4167041083
    .word 72353754
    .word 64554528
    .word 121701750
    .word 67176925
    .word 4215343617
    .word 20055001
    .word 4244831045
    .word 4290054015
    .word 38864381
    .word 130680566
    .word 4282187269
    .word 4130209597
    .word 129367989
    .word 4252370457
    .word 4180344240
    .word 3864409
    .word 114491335
    .word 151782149
    .word 4251580893
    .word 24574215
    .word 3603034
    .word 24115434
    .word 4264097450
    .word 4147509577
    .word 4239325440
    .word 22805745
    .word 160825691
    .word 39520773
    .word 4168483461
    .word 4175363533
    .word 102237076
    .word 4237298173
    .word 4266784528
    .word 102824200
    .word 4228319334
    .word 167839264
    .word 131073331
    .word 125765218
    .word 4215342041
    .word 4261803578
    .word 18807387
    .word 102303478
    .word 4193846240
    .word 4291233746
    .word 106300953
    .word 4252370890
    .word 136968868
    .word 4278518533
    .word 70123382
    .word 4238147368
    .word 127662442
    .word 58325075
    .word 4270786828
    .word 117898396
    .word 98565684
    .word 48692528
    .word 4224187963
    .word 4196072089
    .word 4197646862
    .word 4223989466
    .word 4140103582
    .word 140768938
    .word 4278254057
    .word 4150920687
    .word 4195809437
    .word 42273285
    .word 4168483419
    .word 4187817927
    .word 4261280157
    .word 3929872
    .word 14680487
    .word 4167041341
    .word 2164086
    .word 4130997858
    .word 26019554
    .word 4261742463
    .word 4197517093
    .word 123601888
    .word 4282187701
    .word 111937374
    .word 40501220
    .word 4184474373
    .word 4145281477
    .word 4197120132
    .word 127663877
    .word 145819916
    .word 4136958804
    .word 71369982
    .word 6947334
    .word 4137745049
    .word 4214359105
    .word 4126735661
    .word 15337484
    .word 4209768986
    .word 4263970226
    .word 4274849936
    .word 78578415
    .word 137627934
    .word 4267048899
    .word 97319514
    .word 122749295
    .word 73070921
    .word 4274390511
    .word 4277666139
    .word 4233035277
    .word 60095949
    .word 102299870
    .word 27784976
    .word 14680123
    .word 165479968
    .word 113248733
    .word 67175385
    .word 99616639
    .word 131204854
    .word 4144365373
    .word 4291233305
    .word 4196988761
    .word 4169401093
    .word 114490742
    .word 4197120362
    .word 157154834
    .word 4265344156
    .word 147588350
    .word 4259511867
    .word 4224124678
    .word 113048429
    .word 4135517301
    .word 49281562
    .word 4273863808
    .word 4190959483
    .word 78641899
    .word 4266133312
    .word 122421706
    .word 4169332681
    .word 4126801028
    .word 46265991
    .word 4206622850
    .word 162986189
    .word 4278257794
    .word 4154327418
    .word 4264036035
    .word 99612928
    .word 11860125
    .word 39583245
    .word 81656104
    .word 4145023485
    .word 4266785936
    .word 91619645
    .word 2226272
    .word 125764569
    .word 99615745
    .word 4290052402
    .word 4193910709
    .word 50661322
    .word 4244633133
    .word 4278582646
    .word 131137594
    .word 83757324
    .word 4270785768
    .word 71370929
    .word 86769068
    .word 4196072301
    .word 4132767756
    .word 49219260
    .word 4273666559
    .word 30016118
    .word 134477590
    .word 4220387786
    .word 54919461
    .word 4174247430
    .word 4279765191
    .word 152240945
    .word 120588218
    .word 65403734
    .word 4226087429
    .word 4267243765
    .word 4269670386
    .word 33554942
    .word 4153407751
    .word 4226414826
    .word 4257085769
    .word 52821233
    .word 109709829
    .word 4254793165
    .word 4225174013
    .word 140966152
    .word 4228318752
    .word 115476066
    .word 26080826
    .word 4282189558
    .word 4144302034
    .word 4130146250
    .word 4244570885
    .word 4166254376
    .word 4235458643
    .word 58326172
    .word 65273136
    .word 4247648921
    .word 129104749
    .word 4126733984
    .word 5898797
    .word 121698171
    .word 4214753566
    .word 4266195404
    .word 7403465
    .word 53605894
    .word 103351868
    .word 152303821
    .word 152172968
    .word 96731289
    .word 4190307050
    .word 4266198468
    .word 4160684542
    .word 4279958594
    .word 65470217
    .word 4161341092
    .word 4218223169
    .word 56492931
    .word 4127916406
    .word 162660719
    .word 4150196021
    .word 82575707
    .word 139854427
    .word 84277470
    .word 27131024
    .word 87229984
    .word 131074561
    .word 119867263
    .word 4197580293
    .word 4149806617
    .word 4196990919
    .word 3865974
    .word 131202821
    .word 4247846044
    .word 65209209
    .word 48629510
    .word 4279501542
    .word 143718938
    .word 4171758079
    .word 4274911979
    .word 152501396
    .word 4136105929
    .word 104463246
    .word 46266498
    .word 70189937
    .word 4176870230
    .word 156301166
    .word 4267181029
    .word 57213782
    .word 111475778
    .word 118880535
    .word 4161404698
    .word 4256237339
    .word 4143970614
    .word 37094406
    .word 4220253951
    .word 4254860083
    .word 4265739693
    .word 4236506842
    .word 113505962
    .word 4239263215
    .word 4262267397
    .word 81594311
    .word 4237358864
    .word 29884733
    .word 64554594
    .word 4215342975
    .word 4290053088
    .word 4282124126
    .word 4252369669
    .word 114489476
    .word 82315532
    .word 4270785790
    .word 4218288793
    .word 129105197
    .word 4194302490
    .word 4171696272
    .word 30017822
    .word 4242473418
    .word 147261492
    .word 4178641680
    .word 4216781005
    .word 120588101
    .word 4294052278
    .word 142083045
    .word 104923646
    .word 102694069
    .word 119210496
    .word 4168613528
    .word 130155395
    .word 4215273031
    .word 112132958
    .word 98895317
    .word 68814253
    .word 4136175695
    .word 4214160962
    .word 91161374
    .word 4158457346
    .word 4136369092
    .word 122095715
    .word 30734186
    .word 4199613061
    .word 4207278493
    .word 131727419
    .word 72415328
    .word 4200330810
    .word 18808325
    .word 4293134174
    .word 40437420
    .word 4262656362
    .word 157153834
    .word 4255910065
    .word 86705217
    .word 36566688
    .word 5961208
    .word 4237621995
    .word 152501965
    .word 51382324
    .word 4178643143
    .word 4185651157
    .word 3668347
    .word 77791978
    .word 4237625851
    .word 4288806804
    .word 4129880343
    .word 4209312383
    .word 133955286
    .word 4210882119
    .word 4165862278
    .word 15072075
    .word 4194106361
    .word 4148561404
    .word 4207540191
    .word 4130731905
    .word 4178445836
    .word 27985115
    .word 4270916759
    .word 4280748533
    .word 13957722
    .word 4192860489
    .word 11796827
    .word 130547149
    .word 4190041872
    .word 91620896
    .word 121701337
    .word 65013494
    .word 4193846809
    .word 4190438149
    .word 4145281386
    .word 83819676
    .word 147652155
    .word 135068525
    .word 4132829722
    .word 153024379
    .word 4214753088
    .word 4220450761
    .word 104461959
    .word 122026189
    .word 120650582
    .word 167445226
    .word 4237624483
    .word 33619010
    .word 2425344
    .word 4131846721
    .word 4239587638
    .word 97847234
    .word 87098440
    .word 4135257517
    .word 3671947
    .word 100857858
    .word 35125121
    .word 4278385035
    .word 4152293341
    .word 4172283561
    .word 51380170
    .word 42730051
    .word 4210818892
    .word 93783946
    .word 3540428
    .word 4147446874
    .word 160890616
    .word 4175299476
    .word 4266721703
    .word 167840221
    .word 4215342081
    .word 102303698
    .word 106364871
    .word 4278581380
    .word 127662634
    .word 117898811
    .word 4224187874
    .word 4194240188
    .word 4273603311
    .word 4157209036
    .word 7405128
    .word 57800834
    .word 70189761
    .word 65341878
    .word 142147570
    .word 4179099540
    .word 4129882017
    .word 4181129793
    .word 4239586886
    .word 53738765
    .word 4145742643
    .word 68813951
    .word 4286052207
    .word 4148757278
    .word 4187947997
    .word 4272488696
    .word 140641431
    .word 144836981
    .word 32704163
    .word 72875852
    .word 4163241500
    .word 4292805601
    .word 4178183161
    .word 127467984
    .word 4129751418
    .word 2095360
    .word 4252696077
    .word 62982653
    .word 42074429
    .word 4215604185
    .word 4244767026
    .word 4205053898
    .word 136969590
    .word 4216588556
    .word 4136896689
    .word 4235590509
    .word 4135454396
    .word 4145414774
    .word 134414794
    .word 104658438
    .word 103351089
    .word 4151245654
    .word 156301557
    .word 4239720958
    .word 102630977
    .word 4275438207
    .word 133954277
    .word 71829442
    .word 87098837
    .word 4151247999
    .word 4285989914
    .word 4241816641
    .word 60357844
    .word 43513821
    .word 4132370490
    .word 4287432818
    .word 36897618
    .word 104989618
    .word 127927337
    .word 4163436088
    .word 4197251263
    .word 4278977278
    .word 16449732
    .word 4137879254
    .word 31455134
    .word 137168367
    .word 9765467
    .word 4231657232
    .word 120391030
    .word 100468607
    .word 38928309
    .word 4285924101
    .word 70123269
    .word 33948926
    .word 6947905
    .word 4236311066
    .word 4273799919
    .word 19202506
    .word 54983566
    .word 4188600525
    .word 152111379
    .word 55968741
    .word 57278040
    .word 4271374848
    .word 4168550171
    .word 59176519
    .word 4165925628
    .word 126551469
    .word 3733115
    .word 64815902
    .word 4188010313
    .word 4164614109
    .word 4132307607
    .word 4264360111
    .word 4164550188
    .word 144574346
    .word 4127131754
    .word 4154722237
    .word 4164289727
    .word 50399129
    .word 97911750
    .word 169147347
    .word 59506614
    .word 27916963
    .word 4140103914
    .word 4150983921
    .word 4168547789
    .word 3930376
    .word 2164322
    .word 4261742326
    .word 4282124234
    .word 4184538920
    .word 127663260
    .word 71432857
    .word 4214421152
    .word 4209768315
    .word 78641612
    .word 147322374
    .word 4279826637
    .word 48890009
    .word 4190307780
    .word 4179098690
    .word 118818468
    .word 4131849091
    .word 4215211970
    .word 4227464011
    .word 4194042085
    .word 4152489986
    .word 35063298
    .word 77005048
    .word 140705449
    .word 55707762
    .word 36962189
    .word 141166474
    .word 4127131806
    .word 4195415686
    .word 145226256
    .word 4158126230
    .word 4212655830
    .word 4174379094
    .word 99023901
    .word 49612399
    .word 4179295124
    .word 4287629413
    .word 4153342953
    .word 4171039525
    .word 81657242
    .word 20777062
    .word 121702114
    .word 4290117437
    .word 129365549
    .word 151844947
    .word 4270785401
    .word 135068973
    .word 15398392
    .word 30017344
    .word 122486344
    .word 129631025
    .word 120588563
    .word 33424836
    .word 4160749129
    .word 119275290
    .word 4256299017
    .word 97846110
    .word 98895535
    .word 4158588412
    .word 4207540038
    .word 4158519691
    .word 4152295170
    .word 111348085
    .word 32704674
    .word 69796786
    .word 127927874
    .word 79628221
    .word 4164351908
    .word 114751638
    .word 4212717527
    .word 4139648518
    .word 4182046398
    .word 123274446
    .word 4275829557
    .word 4159043718
    .word 78314682
    .word 135855124
    .word 168362351
    .word 98435419
    .word 4222220510
    .word 4165535264
    .word 14354303
    .word 4256171545
    .word 4180344182
    .word 4264885404
    .word 98502406
    .word 95615514
    .word 4264033003
    .word 4236572617
    .word 4126800002
    .word 4194696022
    .word 4226024421
    .word 4278844482
    .word 65470234
    .word 67565878
    .word 37156607
    .word 139396525
    .word 4136174618
    .word 101513089
    .word 4178507317
    .word 4291493545
    .word 51378351
    .word 102563660
    .word 4163241047
    .word 4173332024
    .word 4197251112
    .word 63309721
    .word 97911553
    .word 4229822550
    .word 99023055
    .word 4214555854
    .word 4275767129
    .word 109180925
    .word 4236576385
    .word 132421
    .word 4293131339
    .word 4153276370
    .word 122751410
    .word 4277667052
    .word 102237445
    .word 165479731
    .word 99616549
    .word 4291295065
    .word 114425914
    .word 4265344304
    .word 4224123622
    .word 49219728
    .word 78642893
    .word 4169332359
    .word 4206559937
    .word 4294113525
    .word 4269669976
    .word 4198565540
    .word 4218222601
    .word 53737215
    .word 4254923659
    .word 52362818
    .word 91224878
    .word 77006043
    .word 4270916011
    .word 4283171395
    .word 4210754188
    .word 66651105
    .word 4178247647
    .word 12845822
    .word 16514828
    .word 4290182099
    .word 59443732
    .word 4220782191
    .word 4179231477
    .word 4240111750
    .word 78313445
    .word 4232774981
    .word 4293066754
    .word 165216053
    .word 163121624
    .word 82774538
    .word 4214486698
    .word 109906437
    .word 39384848
    .word 97060450
    .word 4205511648
    .word 4184212229
    .word 4286843148
    .word 167377561
    .word 4211931674
    .word 4159834398
    .word 155191348
    .word 4213045453
    .word 4145088950
    .word 4286775806
    .word 4204200448
    .word 145621891
    .word 164168542
    .word 58131885
    .word 7536194
    .word 4255843842
    .word 4294965213
    .word 80546293
    .word 4185128743
    .word 4255647626
    .word 4197909911
    .word 89457104
    .word 110757785
    .word 8128214
    .word 4127717027
    .word 83163811
    .word 135135657
    .word 4139780197
    .word 82050960
    .word 149945364
    .word 8194072
    .word 90830802
    .word 4149409677
    .word 4130802186
    .word 4236838127
    .word 4287560686

    @ vmov lr, s14
    @ vmov r0, s0
    @ vmov r1, s2
@ store:
@     ldr.w r2, [lr] @ 34
@     ldr.w r3, [lr, #4] @ 33
@     ldr.w r4, [lr, #8] @ 26
@     ldr.w r5, [lr, #12] @ 18
@     ldr.w r6, [lr, #16] @ 3
@     ldr.w r7, [lr, #20] @ 21
@     ldr.w r8, [lr, #24] @ 24
@     ldr.w r9, [lr, #28] @ 4
@     ldr.w r10, [lr, #32] @ 28
@     ldr.w r11, [lr, #36] @ 32
@     str.w r2, [r0, #2856] @ 34
@     str.w r3, [r0, #2772] @ 33
@     str.w r4, [r0, #2184] @ 26
@     str.w r5, [r0, #1512] @ 18
@     str.w r6, [r0, #252] @ 3
@     str.w r7, [r0, #1764] @ 21
@     str.w r8, [r0, #2016] @ 24
@     str.w r9, [r0, #336] @ 4
@     str.w r10, [r0, #2352] @ 28
@     str.w r11, [r0, #2688] @ 32
@     ldr.w r2, [lr, #40] @ 19
@     ldr.w r3, [lr, #44] @ 10
@     ldr.w r4, [lr, #48] @ 29
@     ldr.w r5, [lr, #52] @ 39
@     ldr.w r6, [lr, #56] @ 27
@     ldr.w r7, [lr, #60] @ 25
@     ldr.w r8, [lr, #64] @ 11
@     ldr.w r9, [lr, #68] @ 36
@     ldr.w r10, [lr, #72] @ 6
@     ldr.w r11, [lr, #76] @ 1
@     str.w r2, [r0, #1596] @ 19
@     str.w r3, [r0, #840] @ 10
@     str.w r4, [r0, #2436] @ 29
@     str.w r5, [r0, #3276] @ 39
@     str.w r6, [r0, #2268] @ 27
@     str.w r7, [r0, #2100] @ 25
@     str.w r8, [r0, #924] @ 11
@     str.w r9, [r0, #3024] @ 36
@     str.w r10, [r0, #504] @ 6
@     str.w r11, [r0, #84] @ 1
@     ldr.w r2, [lr, #80] @ 7
@     ldr.w r3, [lr, #84] @ 8
@     ldr.w r4, [lr, #88] @ 15
@     ldr.w r5, [lr, #92] @ 23
@     ldr.w r6, [lr, #96] @ 38
@     ldr.w r7, [lr, #100] @ 20
@     ldr.w r8, [lr, #104] @ 17
@     ldr.w r9, [lr, #108] @ 37
@     ldr.w r10, [lr, #112] @ 13
@     ldr.w r11, [lr, #116] @ 9
@     str.w r2, [r0, #588] @ 7
@     str.w r3, [r0, #672] @ 8
@     str.w r4, [r0, #1260] @ 15
@     str.w r5, [r0, #1932] @ 23
@     str.w r6, [r0, #3192] @ 38
@     str.w r7, [r0, #1680] @ 20
@     str.w r8, [r0, #1428] @ 17
@     str.w r9, [r0, #3108] @ 37
@     str.w r10, [r0, #1092] @ 13
@     str.w r11, [r0, #756] @ 9
@     ldr.w r2, [lr, #120] @ 22
@     ldr.w r3, [lr, #124] @ 31
@     ldr.w r4, [lr, #128] @ 12
@     ldr.w r5, [lr, #132] @ 2
@     ldr.w r6, [lr, #136] @ 14
@     ldr.w r7, [lr, #140] @ 16
@     ldr.w r8, [lr, #144] @ 30
@     ldr.w r9, [lr, #148] @ 5
@     ldr.w r10, [lr, #152] @ 35
@     ldr.w r11, [lr, #156] @ 40
@     str.w r2, [r0, #1848] @ 22
@     str.w r3, [r0, #2604] @ 31
@     str.w r4, [r0, #1008] @ 12
@     str.w r5, [r0, #168] @ 2
@     str.w r6, [r0, #1176] @ 14
@     str.w r7, [r0, #1344] @ 16
@     str.w r8, [r0, #2520] @ 30
@     str.w r9, [r0, #420] @ 5
@     str.w r10, [r0, #2940] @ 35
@     str.w r11, [r0, #3360] @ 40
@     add.w lr, lr, #480
@     add.w r0, r0, #4
@     cmp.w r0, r1
@     bne.w store