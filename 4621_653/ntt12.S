.p2align 2,,3
.syntax unified

.text
.global ntt12
.type ntt12, %function
@ ntt12(int16_t* fpad)
ntt12:
    push {r1-r12, lr}
    movw.w r11, #11941
    movt.w r11, #14
    mov.w r12, #4621
    add.w r1, r0, #2640
    adr lr, wpad
    vmov s0, r0
    vmov s1, lr
    vmov s2, r1 @ loop end
butterfly3:
    vmov lr, s1
    ldr.w r2, [lr, #4]
    ldr.w r3, [lr, #8]
    ldr.w r1, [lr], #12
    vmov s1, lr
    add.w lr, r0, #80
butterfly3_body:
    ldr.w r7, [r0]
    ldr.w r8, [r0, #80]
    ldr.w r9, [r0, #160]
    sbfx r4, r7, #0, #16
    pkhbt r5, r8, r9, lsl #16
    sbfx r6, r7, #16, #16
    pkhtb r7, r9, r8, asr #16
@ r4 = a0, r5 = a1a2 , r6 = b0, r7 = b1b2
    smlad r8, r5, r1, r4 @ c0
    smlad r9, r5, r2, r4 @ c1
    smlad r10, r5, r3, r4 @ c2
    smlad r4, r7, r1, r6 @ d0
    smlad r5, r7, r2, r6 @ d1
    smlad r6, r7, r3, r6 @ d2
    smmulr r7, r8, r11
    mls r8, r7, r12, r8
    smmulr r7, r9, r11
    mls r9, r7, r12, r9
    smmulr r7, r10, r11
    mls r10, r7, r12, r10
    smmulr r7, r4, r11
    mls r4, r7, r12, r4
    smmulr r7, r5, r11
    mls r5, r7, r12, r5
    smmulr r7, r6, r11
    mls r6, r7, r12, r6
    pkhbt r8, r8, r4, lsl #16
    pkhbt r9, r9, r5, lsl #16
    pkhbt r10, r10, r6, lsl #16
    str.w r9, [r0, #80]
    str.w r10, [r0, #160]
    str.w r8, [r0], #4
    cmp.w r0, lr
    bne.w butterfly3_body
    add.w r0, r0, #160
    vmov r1, s2
    cmp.w r0, r1
    bne.w butterfly3
    vmov r0, s0
butterfly4:
    vmov lr, s1
    ldr.w r2, [lr, #4]
    ldr.w r3, [lr, #8]
    ldr.w r1, [lr], #12
    vmov s1, lr
    add.w lr, r0, #20
butterfly4_body:
    ldr.w r4, [r0]
    ldr.w r5, [r0, #20]
    ldr.w r6, [r0, #40]
    ldr.w r7, [r0, #60]
    smulbb r8, r6, r1
    smultb r9, r6, r1
    smmulr r10, r8, r11
    mls r8, r10, r12, r8
    smmulr r10, r9, r11
    mls r9, r10, r12, r9
    pkhbt r8, r8, r9, lsl #16
    sadd16 r8, r8, r4 @ pos 1
    smulbt r9, r6, r1
    smultt r10, r6, r1
    smmulr r6, r9, r11
    mls r9, r6, r12, r9
    smmulr r6, r10, r11
    mls r10, r6, r12, r10
    pkhbt r9, r9, r10, lsl #16
    sadd16 r9, r9, r4 @ pos 3
@ free r4, r6, r10
    smulbb r4, r7, r1
    smultb r6, r7, r1
    smmulr r10, r4, r11
    mls r4, r10, r12, r4
    smmulr r10, r6, r11
    mls r6, r10, r12, r6
    pkhbt r4, r4, r6, lsl #16
    sadd16 r4, r4, r5 @ pos 2
    smulbt r6, r7, r1
    smultt r10, r7, r1
    smmulr r7, r6, r11
    mls r6, r7, r12, r6
    smmulr r7, r10, r11
    mls r10, r7, r12, r10
    pkhbt r6, r6, r10, lsl #16
    sadd16 r6, r6, r5 @ pos 4
@ 1 2 = r8, r4; 3 4 = r9, r6
@ free r5, r7, r10
    smulbb r5, r4, r2
    smultb r7, r4, r2
    smmulr r10, r5, r11
    mls r5, r10, r12, r5
    smmulr r10, r7, r11
    mls r7, r10, r12, r7
    pkhbt r5, r5, r7, lsl #16
    sadd16 r5, r5, r8 @ pos 1
    smulbt r7, r4, r2
    smultt r10, r4, r2
    smmulr r4, r7, r11
    mls r7, r4, r12, r7
    smmulr r4, r10, r11
    mls r10, r4, r12, r10
    pkhbt r7, r7, r10, lsl #16
    sadd16 r7, r7, r8 @ pos 2
@ free r4, r8, r10
    smulbb r4, r6, r3
    smultb r8, r6, r3
    smmulr r10, r4, r11
    mls r4, r10, r12, r4
    smmulr r10, r8, r11
    mls r8, r10, r12, r8
    pkhbt r4, r4, r8, lsl #16
    sadd16 r4, r4, r9 @ pos 3
    smulbt r8, r6, r3
    smultt r10, r6, r3
    smmulr r6, r8, r11
    mls r8, r6, r12, r8
    smmulr r6, r10, r11
    mls r10, r6, r12, r10
    pkhbt r8, r8, r10, lsl #16
    sadd16 r8, r8, r9 @ pos 4
    str.w r7, [r0, #20]
    str.w r4, [r0, #40]
    str.w r8, [r0, #60]
    str.w r5, [r0], #4
    cmp.w r0, lr
    bne.w butterfly4_body
    add.w r0, #60
    vmov r1, s2
    cmp.w r0, r1
    bne.w butterfly4
    pop {r1-r12, pc}

wpad:
    .word 65537
    .word 115603740
    .word 4179363555
    .word 42401465
    .word 139787491
    .word 120783972
    .word 93454982
    .word 14026547
    .word 4187490388
    .word 105973036
    .word 4269734005
    .word 4214293087
    .word 15467922
    .word 11729304
    .word 4267835606
    .word 4292542883
    .word 4259774708
    .word 37682537
    .word 4242736721
    .word 4273601329
    .word 73727614
    .word 4168480851
    .word 86770174
    .word 39781807
    .word 15991020
    .word 27524706
    .word 4251517106
    .word 33424745
    .word 4166190425
    .word 95356747
    .word 89784283
    .word 90767934
    .word 122420711
    .word 4294901761
    .word 4294901761
    .word 10026856
    .word 115603741
    .word 7274386
    .word 115669276
    .word 115669276
    .word 115603741
    .word 2818006
    .word 4214293711
    .word 4284743836
    .word 39845281
    .word 4188997201
    .word 4208198956
    .word 4158916636
    .word 4269670786
    .word 4148693176
    .word 126613621
    .word 21495481
    .word 4214293711
    .word 148961056
    .word 73726876
    .word 91880071
    .word 4269670786
    .word 52296931
    .word 4188997201
    .word 57146521
    .word 33488386
    .word 134150146
    .word 4204201321
    .word 128841811
    .word 89782951
    .word 4285595791
    .word 95418961
    .word 124778641
    .word 122419381
    .word 4252631686
    .word 21495481
    .word 73923481
    .word 139786156
    .word 65469466
    .word 52296931
    .word 4174186291
    .word 73726876
    .word 8519551
    .word 4267835806
    .word 11927371
    .word 14090026
    .word 4279501036
    .word 4201514386
    .word 4266459571
    .word 11730766
    .word 4278321406
    .word 107542936
    .word 4208198956
    .word 33488386
    .word 68025331
    .word 39845281
    .word 4252500616
    .word 95418961
    .word 126613621
    .word 128841811
    .word 110492011
    .word 89782951
    .word 65797141
    .word 2490331
    .word 4204201321
    .word 37682626
    .word 36175321
    .word 122419381
    .word 101906926
    .word 4259775001
    .word 4201514386
    .word 4252631686
    .word 75496321
    .word 14090026
    .word 114424111
    .word 4174186291
    .word 107542936
    .word 139786156
    .word 4256039506
    .word 37682626
    .word 58129546
    .word 4251517591
    .word 2490331
    .word 4267508131
    .word 4229039086
    .word 4259775001
    .word 4287103096
    .word 4278976756
    .word 4267508131
    .word 4267835806
    .word 4179232486
    .word 4251517591
    .word 4251058846
    .word 11730766
    .word 4278976756
    .word 4279501036
    .word 4223140936