.p2align 2,,3
.syntax unified
.text
wpad:
    .word 831230
    .word 58134348
    .word 83163494
    .word 90832296

.global ntt7_rader
.type ntt7_rader, %function
@ f_seq = [1, 3, 2, 6, 4, 5]
@ w_seq = [2, 3, 1, 5, 4, 6]
@ 1722 / 41 = 42
@ 42 / 7 = 6
ntt7_rader:
    push {r1-r12, lr}
    add.w r1, r0, #3444
    vmov s0, r0
    vmov s1, r1 @ loop end
    mov.w r1, #5167
    ldr.w r2, wpad
    ldr.w r3, wpad+4
    ldr.w r4, wpad+8
    ldr.w r5, wpad+12
ntt7_rader_body_1:
    add.w r6, r0, #12
    vmov s9, r6
ntt7_rader_body_2:
    ldr.w r7, [r0, #12]
    ldr.w r10, [r0, #36]
    ldr.w r8, [r0, #24]
    ldr.w r11, [r0, #72]
    ldr.w r9, [r0, #48]
    ldr.w r12, [r0, #60]
    sadd16 r6, r7, r8
    sadd16 r6, r6, r9
    sadd16 r6, r6, r10
    sadd16 r6, r6, r11
    sadd16 r6, r6, r12
    vmov s2, r0
    vmov s3, r6
    pkhbt r6, r7, r10, lsl #16 @ 12
    pkhtb r10, r10, r7, asr #16
    pkhbt r7, r8, r11, lsl #16 @ 34
    pkhtb r11, r11, r8, asr #16
    pkhbt r8, r9, r12, lsl #16 @ 56
    pkhtb r12, r12, r9, asr #16
@ r6r7r8 ; r10r11r12
@ free r9, lr, r0
    smuadx r9, r3, r6
    smladx r9, r4, r8, r9
    smladx r9, r5, r7, r9 @ 1
    smuadx lr, r3, r10
    smladx lr, r4, r12, lr
    smladx lr, r5, r11, lr @ 1'
    smmulr r0, r9, r2
    mls r9, r0, r1, r9
    smmulr r0, lr, r2
    mls lr, r0, r1, lr
    pkhbt r9, r9, lr, lsl #16 @ 1
    vmov s4, r9 @ 1
    smuadx r9, r3, r7
    smladx r9, r4, r6, r9
    smladx r9, r5, r8, r9 @ 3
    smuadx lr, r3, r11
    smladx lr, r4, r10, lr
    smladx lr, r5, r12, lr @ 3'
    smmulr r0, r9, r2
    mls r9, r0, r1, r9
    smmulr r0, lr, r2
    mls lr, r0, r1, lr
    pkhbt r9, r9, lr, lsl #16 @ 3
    vmov s5, r9 @ 3
    smuadx r9, r3, r8
    smladx r9, r4, r7, r9
    smladx r9, r5, r6, r9 @ 5
    smuadx lr, r3, r12
    smladx lr, r4, r11, lr
    smladx lr, r5, r10, lr @ 5'
    smmulr r0, r9, r2
    mls r9, r0, r1, r9
    smmulr r0, lr, r2
    mls lr, r0, r1, lr
    pkhbt r9, r9, lr, lsl #16 @ 5
    vmov s6, r9 @ 5
    pkhbt r9, r6, r8 @ 05
    pkhtb r6, r6, r7 @ 21
    pkhtb r7, r7, r8 @ 43
    pkhbt lr, r10, r12 @ 05
    pkhtb r10, r10, r11 @ 21
    pkhtb r11, r11, r12 @ 43
@ free r0, r8, r12
@ r9 r6 r7 = 05 21 43 = lr r10 r11
    smuad r8, r3, r9
    smlad r8, r4, r7, r8
    smlad r8, r5, r6, r8
    smuad r12, r3, lr
    smlad r12, r4, r11, r12
    smlad r12, r5, r10, r12
    smmulr r0, r8, r2
    mls r8, r0, r1, r8
    smmulr r0, r12, r2
    mls r12, r0, r1, r12
    pkhbt r8, r8, r12, lsl #16
    vmov s7, r8 @ 0
    smuad r8, r3, r6
    smlad r8, r4, r9, r8
    smlad r8, r5, r7, r8
    smuad r12, r3, r10
    smlad r12, r4, lr, r12
    smlad r12, r5, r11, r12
    smmulr r0, r8, r2
    mls r8, r0, r1, r8
    smmulr r0, r12, r2
    mls r12, r0, r1, r12
    pkhbt r8, r8, r12, lsl #16
    vmov s8, r8 @ 2
    smuad r8, r3, r7
    smlad r8, r4, r6, r8
    smlad r8, r5, r9, r8
    smuad r12, r3, r11
    smlad r12, r4, r10, r12
    smlad r12, r5, lr, r12
    smmulr r0, r8, r2
    mls r8, r0, r1, r8
    smmulr r0, r12, r2
    mls r12, r0, r1, r12
    pkhbt r10, r8, r12, lsl #16
    vmov r6, s7 @ 0
    vmov r7, s4 @ 1
    vmov r8, s8 @ 2
    vmov r9, s5 @ 3
    vmov r11, s6 @ 5
    vmov r12, s3
    vmov r0, s2
    ldr.w lr, [r0]
    sadd16 r6, r6, lr
    sadd16 r7, r7, lr
    sadd16 r8, r8, lr
    sadd16 r9, r9, lr
    sadd16 r10, r10, lr
    sadd16 r11, r11, lr
    sadd16 r12, r12, lr
    str.w r6, [r0, #24]
    str.w r7, [r0, #36]
    str.w r8, [r0, #12]
    str.w r9, [r0, #60]
    str.w r10, [r0, #48]
    str.w r11, [r0, #72]
    str.w r12, [r0], #4
    vmov lr, s9
    cmp.w r0, lr
    bne.w ntt7_rader_body_2
    add.w r0, r0, #72
    vmov lr, s1
    cmp.w r0, lr
    bne.w ntt7_rader_body_1
    pop {r1-r12, pc}