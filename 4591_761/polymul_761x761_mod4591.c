#include <stdint.h>

extern void ntt17_rader(int16_t* f, int16_t* fpad);
extern void ntt9(int16_t* fpad);
extern void byteToShort_761(int16_t* gg, int8_t* g);
extern void polymul_10x10_153_mr(int16_t* fpad, int16_t* gpad);
extern void intt9(int16_t* fpad);
extern void intt17_rader_mr(int16_t* fpad, int16_t* h);
extern void mod_reduce_761(int16_t* h, int16_t* hpad);
// input  : int16_t f[761], int8_t g[761]
// output  : int16_t h[761]
// h = f * g mod x^761 -x -1 mod 4591
void polymul_761x761_mod4591(int16_t* h, int16_t* f, int8_t* g){
    int16_t fpad[1530], gpad[1530];
    int16_t gg[761];
    ntt17_rader(fpad, f);
    ntt9(fpad);
    byteToShort_761(gg, g);
    ntt17_rader(gpad, gg);
    ntt9(gpad);
    polymul_10x10_153_mr(fpad, gpad);
    intt9(fpad);
    intt17_rader_mr(gpad, fpad);
    mod_reduce_761(h, gpad);
}
