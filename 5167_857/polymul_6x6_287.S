.p2align 2,,3
.syntax unified
.text
.global polymul_6x6_287
.type polymul_6x6_287, %function
polymul_6x6_287:
    push {r2-r12, lr}
    add.w r2, r0, #3444
    movw.w r11, #44798
    movt.w r11, #12
    adr.w r10, wpad
    vmov s0, r0
    vmov s1, r1
    vmov s2, r2 @ loop end
    vmov s3, r11 @ qinv
    vmov s4, r10 @ wpad
    mov.w r12, #5167
polymul_6x6_287_body:
    ldr.w lr, [r10], #4
    ldr.w r2, [r0]
    ldr.w r3, [r0, #4]
    ldr.w r4, [r0, #8]
    ldr.w r6, [r1, #4]
    ldr.w r7, [r1, #8]
    ldr.w r5, [r1], #12
    vmov s0, r0
    vmov s1, r1
    vmov s4, r10
    smuadx r8, r2, r5 @ 1
    smuadx r9, r3, r7
    smladx r9, r4, r6, r9 @ 7
    smmulr r0, r9, r11
    mls r9, r0, r12, r9
    mla r9, r9, lr, r8
    smmulr r0, r9, r11
    mls r10, r0, r12, r9 @ c1
    smuadx r8, r2, r6
    smladx r8, r3, r5, r8 @ 3
    smuadx r9, r4, r7 @ 9
    smmulr r0, r9, r11
    mls r9, r0, r12, r9
    mla r9, r9, lr, r8
    smmulr r0, r9, r11
    mls r9, r0, r12, r9 @ c3
    smuadx r8, r2, r7
    smladx r8, r3, r6, r8
    smladx r8, r4, r5, r8 @ 5
    smmulr r0, r8, r11
    mls r8, r0, r12, r8 @ c5
    pkhbt r1, r2, r4 @ 05
    pkhtb r2, r2, r3 @ 21
    pkhtb r3, r3, r4 @ 43
    smultt r4, r1, r5
    smlad r4, r2, r7, r4
    smlad r4, r3, r6, r4
    smmulr r0, r4, r11
    mls r4, r0, r12, r4
    smulbb r0, r1, r5
    mla r4, r4, lr, r0
    smmulr r0, r4, r11
    mls r4, r0, r12, r4 @ c0
    pkhbt r10, r4, r10, lsl #16 @ 01
    smultt r4, r1, r6
    smlad r4, r3, r7, r4
    smmulr r0, r4, r11
    mls r4, r0, r12, r4
    smulbb r0, r1, r6
    smlad r0, r2, r5, r0
    mla r4, r4, lr, r0
    smmulr r0, r4, r11
    mls r4, r0, r12, r4 @ c2
    pkhbt r9, r4, r9, lsl #16 @ 23
    smultt r4, r1, r7
    smmulr r0, r4, r11
    mls r4, r0, r12, r4
    smulbb r0, r1, r7
    smlad r0, r2, r6, r0
    smlad r0, r3, r5, r0
    mla r4, r4, lr, r0
    smmulr r0, r4, r11
    mls r4, r0, r12, r4
    pkhbt r8, r4, r8, lsl #16 @ 45
    vmov r0, s0
    vmov r1, s1
    vmov r2, s2
    str.w r9, [r0, #4]
    str.w r8, [r0, #8]
    str.w r10, [r0], #12
    vmov r10, s4
    cmp.w r0, r2
    bne.w polymul_6x6_287_body
    pop {r2-r12, pc}

wpad:
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476
    .word 1     @ x^6 - w^0
    .word -1690 @ x^6 - w^246
    .word -1251 @ x^6 - w^492
    .word 887   @ x^6 - w^738
    .word -600  @ x^6 - w^984
    .word 1268  @ x^6 - w^1230
    .word 1385  @ x^6 - w^1476