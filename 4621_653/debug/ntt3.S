.p2align 2,,3
.syntax unified

.text
.global ntt3
.type ntt3, %function
@ ntt3(int16_t* fpad)
ntt3:
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