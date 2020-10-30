.p2align 2,,3
.syntax unified

.text
.global intt4
.type intt4, %function
@ intt4(int16_t* fpad)
intt4:
    push {r1-r12, lr}
    movw.w r11, #11941
    movt.w r11, #14
    mov.w r12, #4621
    add.w r1, r0, #2640
    adr lr, wpad
    vmov s0, r0
    vmov s1, lr
    vmov s2, r1 @ loop end
ibutterfly4:
    vmov lr, s1
    ldr.w r2, [lr, #4]
    ldr.w r3, [lr, #8]
    ldr.w r1, [lr], #12
    vmov s1, lr
    add.w lr, r0, #20
ibutterfly4_body:
    ldr.w r4, [r0]
    ldr.w r5, [r0, #20]
    ldr.w r6, [r0, #40]
    ldr.w r7, [r0, #60]
    sadd16 r8, r4, r5 @ pos1
    pkhbt r9, r4, r5, lsl #16
    pkhtb r10, r5, r4, asr #16
    smuad r9, r9, r1
    smuad r10, r10, r1
    smmulr r4, r9, r11
    mls r9, r4, r12, r9
    smmulr r4, r10, r11
    mls r10, r4, r12, r10
    pkhbt r9, r9, r10, lsl #16 @ pos2
    sadd16 r10, r6, r7 @ pos3
    pkhbt r4, r6, r7, lsl #16
    pkhtb r5, r7, r6, asr #16
    smuad r4, r4, r2
    smuad r5, r5, r2
    smmulr r6, r4, r11
    mls r4, r6, r12, r4
    smmulr r6, r5, r11
    mls r5, r6, r12, r5
    pkhbt r4, r4, r5, lsl #16 @ pos4
    @ r8, r9, r10, r4
    sadd16 r5, r8, r10
    sadd16 r6, r9, r4
    pkhbt r7, r8, r10, lsl #16
    pkhtb r8, r10, r8, asr #16
    pkhtb r10, r4, r9, asr #16
    pkhbt r9, r9, r4, lsl #16
    smuad r7, r7, r3
    smuad r8, r8, r3
    smuad r9, r9, r3
    smuad r10, r10, r3
    smmulr r4, r7, r11
    mls r7, r4, r12, r7
    smmulr r4, r8, r11
    mls r8, r4, r12, r8
    smmulr r4, r9, r11
    mls r9, r4, r12, r9
    smmulr r4, r10, r11
    mls r10, r4, r12, r10
    pkhbt r7, r7, r8 ,lsl #16
    pkhbt r8, r9, r10, lsl #16
    str.w r6, [r0, #20]
    str.w r7, [r0, #40]
    str.w r8, [r0, #60]
    str.w r5, [r0], #4
    cmp.w r0, lr
    bne.w ibutterfly4_body
    add.w r0, r0, #60
    vmov r1, s2
    cmp.w r0, r1
    bne.w ibutterfly4
    pop {r1-r12, pc}

wpad:
    .word 4294901761
    .word 4285005976
    .word 4294901761
    .word 4292214826
    .word 4179429091
    .word 4179363556
    .word 4179363556
    .word 4287758446
    .word 4179429091
    .word 71891896
    .word 15531796
    .word 16056076
    .word 4283302066
    .word 43973986
    .word 43515241
    .word 115800346
    .word 27197026
    .word 27524701
    .word 16056076
    .word 7929736
    .word 35257831
    .word 65993746
    .word 27524701
    .word 4292542501
    .word 43515241
    .word 4236903286
    .word 4257350206
    .word 38993326
    .word 4155246676
    .word 4187489896
    .word 120846541
    .word 4180608721
    .word 4280942806
    .word 4219536511
    .word 42401146
    .word 93518446
    .word 35257831
    .word 4193125906
    .word 4172613451
    .word 4258857511
    .word 4257350206
    .word 90831511
    .word 4292542501
    .word 4229235691
    .word 4205249881
    .word 4184540821
    .word 4166191021
    .word 4168419211
    .word 4199613871
    .word 42532216
    .word 4255187551
    .word 4227007501
    .word 4261544446
    .word 86833876
    .word 4187489896
    .word 16711426
    .word 4283302066
    .word 28573261
    .word 93518446
    .word 15531796
    .word 4280942806
    .word 4283105461
    .word 27197026
    .word 4286513281
    .word 4221305956
    .word 120846541
    .word 4242735901
    .word 4229563366
    .word 4155246676
    .word 4221109351
    .word 4273537351
    .word 42401146
    .word 4172613451
    .word 4170254191
    .word 4199613871
    .word 9437041
    .word 4205249881
    .word 4166191021
    .word 90831511
    .word 4160882686
    .word 4261544446
    .word 4237886311
    .word 106035631
    .word 4242735901
    .word 25362046
    .word 4203152761
    .word 4221305956
    .word 4146071776
    .word 80739121
    .word 4273537351
    .word 4168419211
    .word 146339656
    .word 25362046
    .word 136116196
    .word 86833876
    .word 106035631
    .word 4255187551
    .word 10288996
    .word 80739121