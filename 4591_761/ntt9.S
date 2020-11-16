.p2align 2,,3
.syntax unified

.text
.global ntt9
.type ntt9, %function
ntt9:
    push {r1-r12, lr}
    adr lr, wpad
    movw.w r11, #18015
    movt.w r11, #14
    mov.w r12, #4591
    add.w r2, r0, #3060
    vmov s0, r0
    vmov s1, lr
    vmov s2, r2 @ loop end
ntt3_1:
    vmov lr, s1
    ldr.w r2, [lr, #4]
    ldr.w r3, [lr, #8]
    ldr.w r1, [lr], #12
    vmov s1, lr
    add.w lr, r0, #60
ntt3_1_body:
    ldr.w r7, [r0]
    ldr.w r8, [r0, #60]
    ldr.w r9, [r0, #120]
    sbfx r4, r7, #0, #16
    pkhbt r5, r8, r9, lsl #16
    sbfx r6, r7, #16, #16
    pkhtb r7, r9, r8, asr #16
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
    str.w r9, [r0, #60]
    str.w r10, [r0, #120]
    str.w r8, [r0], #4
    cmp.w r0, lr
    bne.w ntt3_1_body
    add.w r0, r0, #120
    vmov r1, s2
    cmp.w r0, r1
    bne.w ntt3_1
    vmov r0, s0
    vmov lr, s1
ntt3_2:
    ldr.w r2, [lr, #4]
    ldr.w r3, [lr, #8]
    ldr.w r1, [lr], #12
    ldr.w r7, [r0]
    ldr.w r8, [r0, #20]
    ldr.w r9, [r0, #40]
    sbfx r4, r7, #0, #16
    pkhbt r5, r8, r9, lsl #16
    sbfx r6, r7, #16, #16
    pkhtb r7, r9, r8, asr #16
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
    str.w r9, [r0, #20]
    str.w r10, [r0, #40]
    str.w r8, [r0], #4
    ldr.w r7, [r0]
    ldr.w r8, [r0, #20]
    ldr.w r9, [r0, #40]
    sbfx r4, r7, #0, #16
    pkhbt r5, r8, r9, lsl #16
    sbfx r6, r7, #16, #16
    pkhtb r7, r9, r8, asr #16
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
    str.w r9, [r0, #20]
    str.w r10, [r0, #40]
    str.w r8, [r0], #4
    ldr.w r7, [r0]
    ldr.w r8, [r0, #20]
    ldr.w r9, [r0, #40]
    sbfx r4, r7, #0, #16
    pkhbt r5, r8, r9, lsl #16
    sbfx r6, r7, #16, #16
    pkhtb r7, r9, r8, asr #16
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
    str.w r9, [r0, #20]
    str.w r10, [r0, #40]
    str.w r8, [r0], #4
    ldr.w r7, [r0]
    ldr.w r8, [r0, #20]
    ldr.w r9, [r0, #40]
    sbfx r4, r7, #0, #16
    pkhbt r5, r8, r9, lsl #16
    sbfx r6, r7, #16, #16
    pkhtb r7, r9, r8, asr #16
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
    str.w r9, [r0, #20]
    str.w r10, [r0, #40]
    str.w r8, [r0], #4
    ldr.w r7, [r0]
    ldr.w r8, [r0, #20]
    ldr.w r9, [r0, #40]
    sbfx r4, r7, #0, #16
    pkhbt r5, r8, r9, lsl #16
    sbfx r6, r7, #16, #16
    pkhtb r7, r9, r8, asr #16
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
    str.w r9, [r0, #20]
    str.w r10, [r0, #40]
    str.w r8, [r0], #44
    vmov r4, s2
    cmp.w r0, r4
    bne.w ntt3_2
    pop {r1-r12, pc}

wpad:
    .word 65537
    .word 20381385
    .word 4274585910
    .word 99416052
    .word 110032864
    .word 91618877
    .word 4174710252
    .word 28444021
    .word 91817614
    .word 18807752
    .word 93782753
    .word 4182442327
    .word 132577493
    .word 4154262905
    .word 8192434
    .word 4200859307
    .word 10946191
    .word 83166389
    .word 4239786270
    .word 43776331
    .word 11470231
    .word 4283628056
    .word 75499422
    .word 4230938186
    .word 4157540326
    .word 121372797
    .word 16119709
    .word 4158716669
    .word 4160028268
    .word 4265412247
    .word 48364132
    .word 4224189685
    .word 22479015
    .word 110036500
    .word 111933627
    .word 78971185
    .word 127859894
    .word 4195877039
    .word 4266263195
    .word 4268555410
    .word 4210886797
    .word 110623457
    .word 4173070162
    .word 102038574
    .word 19989632
    .word 143458646
    .word 4237491455
    .word 4209050027
    .word 4244633551
    .word 22413557
    .word 27985724
    .word 65537
    .word 20381385
    .word 4274585910
    .word 112457744
    .word 4235655610
    .word 4242013255
    .word 4189718195
    .word 4161862871
    .word 4232576118
    .word 4229560348
    .word 4157865237
    .word 4196792544
    .word 4239786270
    .word 43776331
    .word 11470231
    .word 139921265
    .word 48955176
    .word 112130407
    .word 115014681
    .word 131267109
    .word 54786003
    .word 65864426
    .word 4253157463
    .word 4270917294
    .word 127859894
    .word 4195877039
    .word 4266263195
    .word 99416052
    .word 110032864
    .word 91618877
    .word 94043088
    .word 4243454249
    .word 4252629272
    .word 4198893690
    .word 3211271
    .word 92927871
    .word 35784410
    .word 4255187779
    .word 3999698
    .word 4283628056
    .word 75499422
    .word 4230938186
    .word 328685
    .word 101645969
    .word 4193123714
    .word 57345172
    .word 25032949
    .word 4212654711
    .word 4253549769
    .word 97845326
    .word 4238605033
    .word 4268555410
    .word 4210886797
    .word 110623457
    .word 4174710252
    .word 28444021
    .word 91817614
    .word 4151443505
    .word 37288518
    .word 106300809
    .word 4267967898
    .word 54328697
    .word 4267769069
    .word 88932229
    .word 4163110389
    .word 43055750
    .word 4157540326
    .word 121372797
    .word 16119709
    .word 4189978865
    .word 4243126825
    .word 4150985958
    .word 4275372578
    .word 4237951037
    .word 76676513
    .word 92210702
    .word 1638405
    .word 4201183725
    .word 4173070162
    .word 102038574
    .word 19989632
    .word 18807752
    .word 93782753
    .word 4182442327
    .word 4246011966
    .word 4162649194
    .word 4175430488
    .word 4280875029
    .word 124847510
    .word 4184277589
    .word 4224713579
    .word 4179163928
    .word 4180214141
    .word 4158716669
    .word 4160028268
    .word 4265412247
    .word 523656
    .word 142277795
    .word 4152296917
    .word 80281635
    .word 4209637721
    .word 5113476
    .word 4176869169
    .word 76872610
    .word 41417534
    .word 143458646
    .word 4237491455
    .word 4209050027
    .word 132577493
    .word 4154262905
    .word 8192434
    .word 99943228
    .word 4286971492
    .word 4203150944
    .word 4197054322
    .word 15795798
    .word 82182712
    .word 4064995
    .word 56162388
    .word 4234805449
    .word 48364132
    .word 4224189685
    .word 22479015
    .word 93780092
    .word 4162127358
    .word 39125382
    .word 4147184972
    .word 4215145104
    .word 4221761572
    .word 4183424232
    .word 2357694
    .word 109377387
    .word 4244633551
    .word 22413557
    .word 27985724
    .word 4200859307
    .word 10946191
    .word 83166389
    .word 4166256764
    .word 115604889
    .word 13236715
    .word 100596207
    .word 4168876960
    .word 25559665
    .word 142409429
    .word 4192928913
    .word 4254727322
    .word 110036500
    .word 111933627
    .word 78971185
    .word 60818815
    .word 4193253992
    .word 40960025