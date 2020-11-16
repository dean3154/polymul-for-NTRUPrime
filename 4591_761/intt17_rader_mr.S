.p2align 2,,3
.syntax unified
.text
wpad:
    .word 935519
    .word 4254923258
    .word 14808939
    .word 4280221411
    .word 4171694098
    .word 4150000877
    .word 44630214
    .word 87754374
    .word 4185720356

.global intt17_rader_mr
.type intt17_rader_mr, %function
intt17_rader_mr:
@ intt17_rader_mr(int16_t* fpad, int16_t* f)
    push {r2-r12, lr}
    vpush {s16-s24}
    add.w r2, r0, #180
    adr.w r3, wpad
    vmov s0, r0
    vmov s1, r1
    vmov s2, r2 @ loop end
    @ vmov s3, r1 @ r1 tmp
    vldm r3, {s4-s12}
intt17_rader_mr_body1:
    ldr.w r2, [r1, #1800] @ a10
    ldr.w r3, [r1, #1620] @ a9
    ldr.w r4, [r1, #540] @ a3
    ldr.w r5, [r1, #180] @ a1
    ldr.w r6, [r1, #1260] @ a7
    ldr.w r7, [r1, #1440] @ a8
    ldr.w r8, [r1, #2520] @ a14
    ldr.w r9, [r1, #2880] @ a16
    sadd16 lr, r2, r3
    sadd16 lr, lr, r4
    sadd16 lr, lr, r5
    sadd16 lr, lr, r6
    sadd16 lr, lr, r7
    sadd16 lr, lr, r8
    sadd16 lr, lr, r9
    ssub16 r12, r5, r9 @ 16
    sadd16 r5, r5, r9 @ 8
    ssub16 r11, r4, r8 @ 15
    sadd16 r4, r4, r8 @ 7
    ssub16 r10, r3, r7 @ 14
    sadd16 r3, r3, r7 @ 6
    ssub16 r9, r2, r6 @ 13 
    sadd16 r2, r2, r6 @ 5
    pkhbt r6, r9, r10, lsl #16
    pkhtb r7, r10, r9, asr #16
    pkhbt r8, r11, r12, lsl #16
    pkhtb r9, r12, r11, asr #16
    str.w r6, [r0, #1260]
    str.w r7, [r0, #2700]
    str.w r8, [r0, #1440]
    str.w r9, [r0, #2880]
    vmov s13, lr
    ldr.w r6, [r1, #900] @ a5
    ldr.w r7, [r1, #2340] @ a13
    ldr.w r8, [r1, #2160] @ a12
    ldr.w r9, [r1, #720] @ a4
    sadd16 lr, r6, r7
    sadd16 lr, lr, r8
    sadd16 lr, lr, r9
    ssub16 r12, r7, r9 @ 12
    sadd16 r7, r7, r9 @ 4 @ x^8 - 1
    ssub16 r11, r6, r8 @ 11
    sadd16 r6, r6, r8 @ 3 @ x^8 - 1
    ssub16 r10, r7, r5 @ 8, x^4 + 1
    sadd16 r5, r7, r5 @ 4, x^4 - 1
    ssub16 r9, r6, r4 @ 7, x^4 + 1
    sadd16 r4, r6, r4 @ 3, x^4 - 1
    pkhbt r6, r11, r12, lsl #16
    pkhtb r7, r12, r11, asr #16
    pkhbt r8, r9, r10, lsl #16
    pkhtb r9, r10, r9, asr #16
    str.w r6, [r0, #1080]
    str.w r7, [r0, #2520]
    str.w r8, [r0, #720]
    str.w r9, [r0, #2160]
    ldr.w r6, [r1, #1980] @ a11
    ldr.w r7, [r1, #2700] @ a15
    ldr.w r8, [r1, #1080] @ a6
    ldr.w r9, [r1, #360] @ a2
    sadd16 lr, lr, r6
    sadd16 lr, lr, r7
    sadd16 lr, lr, r8
    sadd16 lr, lr, r9
    ssub16 r12, r7, r9 @ 10
    sadd16 r7, r7, r9 @ 2, x^8 - 1
    ssub16 r11, r6, r8 @ 9
    sadd16 r6, r6, r8 @ 1, x^8 - 1
    ssub16 r10, r7, r3 @ 6
    sadd16 r3, r7, r3 @ 2 , x4 - 1
    ssub16 r9, r6, r2 @ 5
    sadd16 r2, r6, r2 @ 1, x4 - 1
    pkhbt r6, r11, r12, lsl #16 @9 10
    pkhtb r7, r12, r11, asr #16
    pkhbt r8, r9, r10, lsl #16
    pkhtb r9, r10, r9, asr #16
    str.w r6, [r0, #900]
    str.w r7, [r0, #2340]
    str.w r8, [r0, #540]
    str.w r9, [r0, #1980]
    ldr.w r10, [r1], #4
    vmov s3, r1
    vmov r8, s4 @ qinv
    mov.w r9, #4591
    vmov r1, s13
    mov.w r6, #3459
    sadd16 lr, lr, r10
    smulbb r7, r6, r1
    smlabb r7, r6, lr, r7
    smulbt r11, r6, r1
    smlabt r11, r6, lr, r11
    smmulr r12, r7, r8
    mls r7, r12, r9, r7
    smmulr r12, r11, r8
    mls r11, r12, r9, r11
    pkhbt lr, r7, r11, lsl #16
    sadd16 r6, r2, r4
    ssub16 r7, r2, r4
    sadd16 r11, r3, r5
    ssub16 r12, r3, r5
    pkhbt r2, r6, r11, lsl #16
    pkhtb r3, r11, r6, asr #16
    pkhbt r4, r7, r12, lsl #16
    pkhtb r5, r12, r7, asr #16
    str.w lr, [r0]
    vmov r6, s5
    vmov r7, s6
    smuad r10, r2, r6 @ a0w0+a1w1
    smuad r11, r3, r6
    smmulr lr, r10, r8
    mls r10, lr, r9, r10
    smmulr lr, r11, r8
    mls r11, lr, r9, r11
    pkhbt r10, r10, r11, lsl #16 @ c0 mod x^2 - 1
    smuadx r11, r2, r6 @ a0w1 + a1w0
    smuadx r12, r3, r6
    smmulr lr, r11, r8
    mls r11, lr, r9, r11
    smmulr lr, r12, r8
    mls r12, lr, r9, r12
    pkhbt r11, r11, r12, lsl #16 @ c1 mod x^2 - 1
    smusd r6, r4, r7 @ a0w0 - a1w1
    smusd r12, r5, r7
    smmulr lr, r6, r8
    mls r6, lr, r9, r6
    smmulr lr, r12, r8
    mls r12, lr, r9, r12
    pkhbt r12, r6, r12, lsl #16 @ c0 mod x^2 + 1
    smuadx r6, r4, r7 @ a0w1 + a1w0
    smuadx r7, r5, r7
    smmulr lr, r6, r8
    mls r6, lr, r9, r6
    smmulr lr, r7, r8
    mls r7, lr, r9, r7
    pkhbt lr, r6, r7, lsl #16 @ c1 mod x^2 + 1
    sadd16 r2, r10, r12 @ c0 mod x^4 - 1
    sadd16 r3, r11, lr @ c1 mod x^4 - 1
    ssub16 r4, r10, r12 @ c2 mod x^4 - 1
    ssub16 r5, r11, lr @ c3 mod x^4 - 1
    str.w r2, [r0, #180]
    str.w r3, [r0, #360]
    str.w r4, [r0, #1620]
    str.w r5, [r0, #1800]
    vmov r1, s7 @ w0w1
    vmov r2, s8 @ w2w3
    ldr.w r3, [r0, #540] @ a0a1
    ldr.w r4, [r0, #720] @ a2a3
    ldr.w r5, [r0, #1980]
    ldr.w r6, [r0, #2160]
    smuadx r7, r1, r3 @ a0w1 + a1w0
    smuadx r10, r2, r4 @ a2w3 + a3w2
    sub.w r7, r7, r10
    smuadx r10, r1, r5
    smuadx r11, r2, r6
    sub.w r10, r10, r11
    smmulr lr, r7, r8
    mls r7, lr, r9, r7
    smmulr lr, r10, r8
    mls r10, lr, r9, r10
    pkhbt r7, r7, r10, lsl #16 @ c1 mod x^4 + 1 
    smuadx r10, r1, r4
    smladx r10, r2, r3, r10
    smuadx r11, r1, r6
    smladx r11, r2, r5, r11
    smmulr lr, r10, r8
    mls r10, lr, r9, r10
    smmulr lr, r11, r8
    mls r11, lr, r9, r11
    pkhbt r10, r10, r11, lsl #16 @ c3 mod x^4 + 1
    pkhbt r11, r3, r4 @ a0a3
    pkhtb r12, r3, r4 @ a2a1
    pkhbt r3, r5, r6
    pkhtb r4, r5, r6
    smusd r5, r1, r11
    smuad r6, r2, r12
    sub.w r5, r5, r6
    smusd r6, r1, r3
    smuad lr, r2, r4
    sub.w r6, r6, lr
    smmulr lr, r5, r8
    mls r5, lr, r9, r5
    smmulr lr, r6, r8
    mls r6, lr, r9, r6
    pkhbt r5, r5, r6, lsl #16 @ c0 mod x^4 + 1
    smuad r6, r1, r12
    smlsd r6, r2, r11, r6
    smuad lr, r1, r4
    smlsd lr, r2, r3, lr
    smmulr r1, r6, r8
    mls r6, r1, r9, r6
    smmulr r1, lr, r8
    mls lr, r1, r9, lr
    pkhbt r6, r6, lr, lsl #16 @ c2 mod x^4 + 1
    str.w r5, [r0, #540]
    str.w r7, [r0, #720]
    str.w r6, [r0, #1980]
    str.w r10, [r0, #2160]
    vmov r1, s3
    vmov r2, s2
    add.w r0, r0, #4
    cmp.w r0, r2
    bne.w intt17_rader_mr_body1
    vmov r0, s0
    vmov r1, s9
    vmov r2, s10
    vmov r3, s11
    vmov r4, s12
intt17_rader_mr_body2:
    ldr.w r5, [r0, #900]
    ldr.w r6, [r0, #1080]
    ldr.w r7, [r0, #1260]
    ldr.w r8, [r0, #1440]
    smuadx r9, r1, r5
    smuadx r10, r2, r8
    smladx r10, r3, r7, r10
    smladx r10, r4, r6, r10
    sub.w r9, r9, r10
    smuadx r10, r1, r6
    smladx r10, r2, r5, r10
    smuadx r11, r3, r8
    smladx r11, r4, r7, r11
    sub.w r10, r10, r11
    smuadx r11, r1, r7
    smladx r11, r2, r6, r11
    smladx r11, r3, r5, r11
    smuadx r12, r4, r8
    sub.w r11, r11, r12
    smuadx r12, r1, r8
    smladx r12, r2, r7, r12
    smladx r12, r3, r6, r12
    smladx r12, r4, r5, r12
    vmov s13, r9 @ 1
    vmov s14, r10 @ 3
    vmov s15, r11 @ 5
    vmov s16, r12 @ 7
    pkhbt r9, r5, r8 @ 07
    pkhtb r10, r5, r6 @ 21
    pkhtb r11, r6, r7 @ 43
    pkhtb r12, r7, r8 @ 65
    smusd r5, r1, r9
    smuad r6, r2, r12
    smlad r6, r3, r11, r6
    smlad r6, r4, r10, r6
    sub.w r5, r5, r6
    smuad r6, r1, r10
    smlsd r6, r2, r9, r6
    smuad r7, r3, r12
    smlad r7, r4, r11, r7
    sub.w r6, r6, r7
    smuad r7, r1, r11
    smlad r7, r2, r10, r7
    smlsd r7, r3, r9, r7
    smuad r8, r4, r12
    sub.w r7, r7, r8
    smuad r8, r1, r12
    smlad r8, r2, r11, r8
    smlad r8, r3, r10, r8
    smlsd r8, r4, r9, r8
    vmov s17, r5 @ 0
    vmov s18, r6 @ 2
    vmov s19, r7 @ 4
    vmov s20, r8 @ 6
    ldr.w r5, [r0, #2340]
    ldr.w r6, [r0, #2520]
    ldr.w r7, [r0, #2700]
    ldr.w r8, [r0, #2880]
    smuadx r9, r1, r5
    smuadx r10, r2, r8
    smladx r10, r3, r7, r10
    smladx r10, r4, r6, r10
    sub.w r9, r9, r10
    smuadx r10, r1, r6
    smladx r10, r2, r5, r10
    smuadx r11, r3, r8
    smladx r11, r4, r7, r11
    sub.w r10, r10, r11
    smuadx r11, r1, r7
    smladx r11, r2, r6, r11
    smladx r11, r3, r5, r11
    smuadx r12, r4, r8
    sub.w r11, r11, r12
    smuadx r12, r1, r8
    smladx r12, r2, r7, r12
    smladx r12, r3, r6, r12
    smladx r12, r4, r5, r12
    vmov s21, r9 @ 1'
    vmov s22, r10 @ 3'
    vmov s23, r11 @ 5'
    vmov s24, r12 @ 7'
    pkhbt r9, r5, r8 @ 07
    pkhtb r10, r5, r6 @ 21
    pkhtb r11, r6, r7 @ 43
    pkhtb r12, r7, r8 @ 65
    smusd r5, r1, r9
    smuad r6, r2, r12
    smlad r6, r3, r11, r6
    smlad r6, r4, r10, r6
    sub.w r5, r5, r6
    smuad r6, r1, r10
    smlsd r6, r2, r9, r6
    smuad r7, r3, r12
    smlad r7, r4, r11, r7
    sub.w r6, r6, r7
    smuad r7, r1, r11
    smlad r7, r2, r10, r7
    smlsd r7, r3, r9, r7
    smuad r8, r4, r12
    sub.w r7, r7, r8
    smuad r8, r1, r12
    smlad r8, r2, r11, r8
    smlad r8, r3, r10, r8
    smlsd r8, r4, r9, r8
    vmov r11, s4
    mov.w r12, #4591
    vmov r9, s17
    vmov r10, s18
    smmulr lr, r5, r11
    mls r5, lr, r12, r5
    smmulr lr, r6, r11
    mls r6, lr, r12, r6
    smmulr lr, r7, r11
    mls r7, lr, r12, r7
    smmulr lr, r8, r11
    mls r8, lr, r12, r8
    smmulr lr, r9, r11
    mls r9, lr, r12, r9
    smmulr lr, r10, r11
    mls r10, lr, r12, r10
    pkhbt r9, r9, r5, lsl #16 @ c0 mod x^8 + 1
    pkhbt r10, r10, r6, lsl #16 @ c2 mod x^8 + 1
    str.w r9, [r0, #900]
    str.w r10, [r0, #1260]
    vmov r5, s19
    vmov r6, s20
    vmov r9, s13
    vmov r10, s21
    smmulr lr, r5, r11
    mls r5, lr, r12, r5
    smmulr lr, r6, r11
    mls r6, lr, r12, r6
    smmulr lr, r9, r11
    mls r9, lr, r12, r9
    smmulr lr, r10, r11
    mls r10, lr, r12, r10
    pkhbt r5, r5, r7, lsl #16 @ c4 mod x^8 + 1
    pkhbt r6, r6, r8, lsl #16 @ c6 mod x^8 + 1
    pkhbt r9, r9, r10, lsl #16 @ c1 mod x^8 + 1
    str.w r5, [r0, #2340]
    str.w r6, [r0, #2700]
    str.w r9, [r0, #1080]
    vmov r5, s14
    vmov r6, s15
    vmov r7, s16
    vmov r8, s22
    vmov r9, s23
    vmov r10, s24
    smmulr lr, r5, r11
    mls r5, lr, r12, r5
    smmulr lr, r6, r11
    mls r6, lr, r12, r6
    smmulr lr, r7, r11
    mls r7, lr, r12, r7
    smmulr lr, r8, r11
    mls r8, lr, r12, r8
    smmulr lr, r9, r11
    mls r9, lr, r12, r9
    smmulr lr, r10, r11
    mls r10, lr, r12, r10
    pkhbt r5, r5, r8, lsl #16 @ c3 mod x^8 + 1
    pkhbt r6, r6, r9, lsl #16 @ c5 mod x^8 + 1
    pkhbt r7, r7, r10, lsl #16 @ c7 mod x^8 + 1
    str.w r5, [r0, #1440]
    str.w r6, [r0, #2520]
    str.w r7, [r0, #2880]
    vmov r5, s2
    add.w r0, r0, #4
    cmp.w r0, r5
    bne.w intt17_rader_mr_body2
    vmov r0, s0
    vmov r1, s1
intt17_rader_mr_body3:
    ldr.w lr, [r1], #4
    mov.w r2, #3459
    vmov r3, s4
    mov.w r4, #4591
    smulbb r5, r2, lr
    smulbt r6, r2, lr
    smmulr r7, r5, r3
    mls r5, r7, r4, r5
    smmulr r7, r6, r3
    mls r6, r7, r4, r6
    pkhbt lr, r5, r6, lsl #16
    ldr.w r2, [r0, #180] @ c0 mod x^4 - 1
    ldr.w r3, [r0, #360] @ c1 mod x^4 - 1
    ldr.w r4, [r0, #1620] @ c2 mod x^4 - 1
    ldr.w r5, [r0, #1800] @ c3 mod x^4 - 1
    ldr.w r6, [r0, #540] @ c0 mod x^4 + 1
    ldr.w r7, [r0, #720] @ c1 mod x^4 + 1
    ldr.w r8, [r0, #1980] @ c2 mod x^4 + 1
    ldr.w r9, [r0, #2160] @ c3 mod x^4 + 1
    ldr.w r11, [r0, #900] @ c0 mod x^8 + 1
    ldr.w r12, [r0, #2520] @ @ c5 mod x^8 + 1
    ssub16 r10, r5, r9 @ c7 mod x^8 - 1
    sadd16 r5, r5, r9 @ c3 mod x^8 - 1
    ssub16 r9, r4, r8 @ c6 mod x^8 - 1
    sadd16 r4, r4, r8 @ c2 mod x^8 - 1
    ssub16 r8, r3, r7 @ c5 mod x^8 - 1
    sadd16 r3, r3, r7 @ c1 mod x^8 - 1
    ssub16 r7, r2, r6 @ c4 mod x^8 - 1
    sadd16 r2, r2, r6 @ c0 mod x^8 - 1
    sadd16 r6, r2, r11 @ c0 mod x^16 - 1
    sadd16 r6, r6, lr @ 14
    ssub16 r11, r2, r11 @ c8 mod x^16 - 1
    sadd16 r11, r11, lr @ 3
    sadd16 r2, r8, r12 @ c5 mod x^16 - 1
    sadd16 r2, r2, lr @ 2
    ssub16 r12, r8, r12 @ c13 mod x^16 - 1
    sadd16 r12, r12, lr @ 15
    str.w r6, [r0, #2520]
    str.w r11, [r0, #540]
    str.w r2, [r0, #360]
    ldr.w r2, [r0, #2700] @ c6 mod x^8 + 1
    str.w r12, [r0, #2700]
    ldr.w r6, [r0, #1080] @ c1 mod x^8 + 1
    ldr.w r8, [r0, #1260] @ c2 mod x^8 + 1
    ldr.w r11, [r0, #1440] @ c3 mod x^8 + 1
    sadd16 r12, r3, r6 @ c1 mod x^16 - 1
    sadd16 r12, r12, lr @ 8
    ssub16 r6, r3, r6 @ c9 mod x^16 - 1
    sadd16 r6, r6, lr @ 9
    sadd16 r3, r4, r8 @ c2 mod x^16 - 1
    sadd16 r3, r3, lr @ 7
    ssub16 r8, r4, r8 @ c10 mod x^16 - 1
    sadd16 r8, r8, lr @ 10
    sadd16 r4, r5, r11 @ c3 mod x^16 - 1
    sadd16 r4, r4, lr @ 4
    ssub16 r11, r5, r11 @ c11 mod x^16 - 1
    sadd16 r11, r11, lr @ 13
    sadd16 r5, r9, r2 @ c6 mod x^16 - 1
    sadd16 r5, r5, lr @ 6
    ssub16 r2, r9, r2 @ c14 mod x^16 - 1
    sadd16 r2, r2, lr @ 11
    str.w r12, [r0, #1440]
    str.w r6, [r0, #1620]
    str.w r3, [r0, #1260]
    str.w r8, [r0, #1800]
    str.w r4, [r0, #720]
    str.w r5, [r0, #1080]
    str.w r2, [r0, #1980]
    ldr.w r2, [r0, #2340] @ c4 mod x^8 + 1
    ldr.w r3, [r0, #2880] @ c7 mod x^8 + 1
    str.w r11, [r0, #2340]
    sadd16 r4, r7, r2 @ c4 mod x^16 - 1
    sadd16 r4, r4, lr @ 12
    ssub16 r5, r7, r2 @ c12 mod x^16 - 1
    sadd16 r5, r5, lr @ 5
    sadd16 r6, r10, r3 @ c7 mod x^16 - 1
    sadd16 r6, r6, lr @ 1
    ssub16 r7, r10, r3 @ c15 mod x^16 - 1
    sadd16 r7, r7, lr @ 16
    str.w r4, [r0, #2160]
    str.w r5, [r0, #900]
    str.w r6, [r0, #180]
    str.w r7, [r0, #2880]
    vmov r2, s2
    add.w r0, r0, #4
    cmp.w r0, r2
    bne.w intt17_rader_mr_body3
    vpop {s16-s24}
    pop {r2-r12, pc}