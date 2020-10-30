.p2align 2,,3
.syntax unified

.text
.global intt3
.type intt3, %function
@ intt3(int16_t* fpad)
intt3:
    push {r1-r12, lr}
    movw.w r11, #11941
    movt.w r11, #14
    mov.w r12, #4621
    add.w r1, r0, #2640
    adr lr, wpad
    vmov s0, r0
    vmov s1, lr
    vmov s2, r1 @ loop end
ibutterfly3:
    vmov lr, s1
    ldr.w r2, [lr, #4]
    ldr.w r3, [lr, #8]
    ldr.w r1, [lr], #12
    vmov s1, lr
    add.w lr, r0, #80
ibutterfly3_body:
    ldr.w r4, [r0]
    ldr.w r6, [r0, #80]
    ldr.w r7, [r0, #160]
    sadd16 r10, r4, r6
    sadd16 r10, r10, r7
    pkhbt r5, r6, r7, lsl #16
    pkhtb r6, r7, r6, asr #16
    smuad r7, r2, r5
    smlabb r7, r1, r4, r7
    smuad r8, r2, r6
    smlabt r8, r1, r4, r8
    smmulr r9, r7, r11
    mls r7, r9, r12, r7
    smmulr r9, r8, r11
    mls r8, r9, r12, r8
    pkhbt r7, r7, r8, lsl #16
    smuad r8, r3, r5
    smlatb r8, r1, r4, r8
    smuad r9, r3, r6
    smlatt r9, r1, r4, r9
    smmulr r4, r8, r11
    mls r8, r4, r12, r8
    smmulr r4, r9, r11
    mls r9, r4, r12, r9
    pkhbt r8, r8, r9, lsl #16
    str.w r7, [r0, #80]
    str.w r8, [r0, #160]
    str.w r10, [r0], #4
    cmp.w r0, lr
    bne.w ibutterfly3_body
    add.w r0, r0, #160
    vmov r1, s2
    cmp.w r0, r1
    bne.w ibutterfly3
    pop {r1-r12, pc}

wpad:
    .word 65537
    .word 4179363555
    .word 115603740
    .word 122420711
    .word 4292543038
    .word 89720169
    .word 95356747
    .word 90768729
    .word 33486931
    .word 4251517106
    .word 15531618
    .word 15991203
    .word 39781807
    .word 4166189566
    .word 4168418604
    .word 73727614
    .word 106036017
    .word 4242800313
    .word 37682537
    .word 27459828
    .word 4292607463
    .word 4267835606
    .word 93518232
    .word 15466674
    .word 4214293087
    .word 86833269
    .word 106036862
    .word 4187490388
    .word 42338099
    .word 93454550
    .word 120783972
    .word 4273601763
    .word 42338388