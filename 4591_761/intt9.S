.p2align 2,,3
.syntax unified

.text
.global intt9
.type intt9, %function
intt9:
    push {r1-r12, lr}
    adr lr, wpad
    movw.w r11, #18015
    movt.w r11, #14
    mov.w r12, #4591
    add.w r2, r0, #3060
    vmov s0, r0
    vmov s1, lr
    vmov s2, r2 @ loop end
intt3_1:
    ldr.w r2, [lr, #4]
    ldr.w r3, [lr, #8]
    ldr.w r1, [lr], #12
    ldr.w r4, [r0]
    ldr.w r6, [r0, #20]
    ldr.w r7, [r0, #40]
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
    sbfx r4, r10, #0, #16
    sbfx r5, r10, #16, #16
    smmulr r6, r4, r11
    mls r4, r6, r12, r4
    smmulr r6, r5, r11
    mls r5, r6, r12, r5
    pkhbt r10, r4, r5, lsl #16
    str.w r7, [r0, #20]
    str.w r8, [r0, #40]
    str.w r10, [r0], #4
    ldr.w r4, [r0]
    ldr.w r6, [r0, #20]
    ldr.w r7, [r0, #40]
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
    sbfx r4, r10, #0, #16
    sbfx r5, r10, #16, #16
    smmulr r6, r4, r11
    mls r4, r6, r12, r4
    smmulr r6, r5, r11
    mls r5, r6, r12, r5
    pkhbt r10, r4, r5, lsl #16
    str.w r7, [r0, #20]
    str.w r8, [r0, #40]
    str.w r10, [r0], #4
    ldr.w r4, [r0]
    ldr.w r6, [r0, #20]
    ldr.w r7, [r0, #40]
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
    sbfx r4, r10, #0, #16
    sbfx r5, r10, #16, #16
    smmulr r6, r4, r11
    mls r4, r6, r12, r4
    smmulr r6, r5, r11
    mls r5, r6, r12, r5
    pkhbt r10, r4, r5, lsl #16
    str.w r7, [r0, #20]
    str.w r8, [r0, #40]
    str.w r10, [r0], #4
    ldr.w r4, [r0]
    ldr.w r6, [r0, #20]
    ldr.w r7, [r0, #40]
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
    sbfx r4, r10, #0, #16
    sbfx r5, r10, #16, #16
    smmulr r6, r4, r11
    mls r4, r6, r12, r4
    smmulr r6, r5, r11
    mls r5, r6, r12, r5
    pkhbt r10, r4, r5, lsl #16
    str.w r7, [r0, #20]
    str.w r8, [r0, #40]
    str.w r10, [r0], #4
    ldr.w r4, [r0]
    ldr.w r6, [r0, #20]
    ldr.w r7, [r0, #40]
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
    sbfx r4, r10, #0, #16
    sbfx r5, r10, #16, #16
    smmulr r6, r4, r11
    mls r4, r6, r12, r4
    smmulr r6, r5, r11
    mls r5, r6, r12, r5
    pkhbt r10, r4, r5, lsl #16
    str.w r7, [r0, #20]
    str.w r8, [r0, #40]
    str.w r10, [r0], #44
    vmov r1, s2
    cmp.w r0, r1
    bne.w intt3_1
    vmov s1, lr
    vmov r0, s0
intt3_2:
    vmov lr, s1
    ldr.w r2, [lr, #4]
    ldr.w r3, [lr, #8]
    ldr.w r1, [lr], #12
    vmov s1, lr
    add.w lr, r0, #60
intt3_2_body:
    ldr.w r4, [r0]
    ldr.w r6, [r0, #60]
    ldr.w r7, [r0, #120]
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
    sbfx r4, r10, #0, #16
    sbfx r5, r10, #16, #16
    smmulr r6, r4, r11
    mls r4, r6, r12, r4
    smmulr r6, r5, r11
    mls r5, r6, r12, r5
    pkhbt r10, r4, r5, lsl #16
    str.w r7, [r0, #60]
    str.w r8, [r0, #120]
    str.w r10, [r0], #4
    cmp.w r0, lr
    bne.w intt3_2_body
    add.w r0, r0, #120
    vmov r1, s2
    cmp.w r0, r1
    bne.w intt3_2
    pop {r1-r12, pc}

wpad:
    .word 65537
    .word 4274585910
    .word 20381385
    .word 4232576118
    .word 112458967
    .word 4189779984
    .word 4242013255
    .word 4161862074
    .word 112458870
    .word 40960025
    .word 92273256
    .word 60881391
    .word 78971185
    .word 102037691
    .word 110036651
    .word 4254727322
    .word 4275373201
    .word 142408171
    .word 25559665
    .word 4193190816
    .word 100595836
    .word 13236715
    .word 142409113
    .word 4166256355
    .word 83166389
    .word 111871631
    .word 4200857767
    .word 27985724
    .word 4157538549
    .word 4244570454
    .word 109377387
    .word 4243126718
    .word 4183359523
    .word 4221761572
    .word 88867472
    .word 4147247934
    .word 39125382
    .word 4168877566
    .word 93779989
    .word 22479015
    .word 4200858869
    .word 48364488
    .word 4234805449
    .word 115603540
    .word 4064088
    .word 82182712
    .word 4151445078
    .word 4196991217
    .word 4203150944
    .word 54328932
    .word 100007813
    .word 8192434
    .word 4174710137
    .word 132577181
    .word 4209050027
    .word 22478079
    .word 143522962
    .word 41417534
    .word 4147248034
    .word 4176807060
    .word 5113476
    .word 2357593
    .word 80345833
    .word 4152296917
    .word 4253613219
    .word 460922
    .word 4265412247
    .word 4210949740
    .word 4158715892
    .word 4180214141
    .word 57408280
    .word 4224776472
    .word 4184277589
    .word 4162127254
    .word 4280813425
    .word 4175430488
    .word 4127850
    .word 4246075420
    .word 4182442327
    .word 4224189153
    .word 18744727
    .word 19989632
    .word 4283628590
    .word 4173006356
    .word 4201183725
    .word 101580805
    .word 92209177
    .word 76676513
    .word 35782717
    .word 4275436698
    .word 4150985958
    .word 15858217
    .word 4190043368
    .word 16119709
    .word 132513917
    .word 4157540156
    .word 43055750
    .word 4286907893
    .word 88930340
    .word 4267769069
    .word 94043513
    .word 4267967292
    .word 106300809
    .word 3275334
    .word 4151444024
    .word 91817614
    .word 99353973
    .word 4174709170
    .word 110623457
    .word 4237428877
    .word 4268555005
    .word 4238605033
    .word 80281678
    .word 4253550037
    .word 4212654711
    .word 76871925
    .word 57344381
    .word 4193123714
    .word 65928849
    .word 329230
    .word 4230938186
    .word 4195878814
    .word 4283565184
    .word 3999698
    .word 114950979
    .word 35847585
    .word 92927871
    .word 142213127
    .word 4198891569
    .word 4252629272
    .word 4224776489
    .word 94043373
    .word 91618877
    .word 4160026592
    .word 99354254
    .word 4266263195
    .word 4239786159
    .word 127859224
    .word 4270917294
    .word 48891991
    .word 65928578
    .word 54786003
    .word 4229560869
    .word 114952146
    .word 112130407
    .word 124911400
    .word 139920106
    .word 11470231
    .word 18807115
    .word 4239786651
    .word 4196792544
    .word 4162649365
    .word 4229560275
    .word 65537
    .word 4274585910
    .word 20381385
    .word 27985724
    .word 4157538549
    .word 4244570454
    .word 4209050027
    .word 22478079
    .word 143522962
    .word 19989632
    .word 4283628590
    .word 4173006356
    .word 110623457
    .word 4237428877
    .word 4268555005
    .word 4266263195
    .word 4239786159
    .word 127859224
    .word 78971185
    .word 102037691
    .word 110036651
    .word 22479015
    .word 4200858869
    .word 48364488
    .word 4265412247
    .word 4210949740
    .word 4158715892
    .word 16119709
    .word 132513917
    .word 4157540156
    .word 4230938186
    .word 4195878814
    .word 4283565184
    .word 11470231
    .word 18807115
    .word 4239786651
    .word 83166389
    .word 111871631
    .word 4200857767
    .word 8192434
    .word 4174710137
    .word 132577181
    .word 4182442327
    .word 4224189153
    .word 18744727
    .word 91817614
    .word 99353973
    .word 4174709170
    .word 91618877
    .word 4160026592
    .word 99354254