#include <stdint.h>

extern void ntt41_rader(int16_t* fpad, int16_t* f);
extern void ntt7_rader(int16_t* fpad);
extern void byteToShort_857(int16_t* gg, int8_t* g);
extern void polymul_6x6_287(int16_t* fpad, int16_t* gpad);
extern void intt7_rader(int16_t* fpad);
extern void intt41_rader(int16_t* fpad, int16_t* h);
extern void mod_reduce_857(int16_t* h, int16_t* hpad);
void polymul_857x857_mod5167(int16_t* h, int16_t* f, int8_t* g){
    int16_t fpad[1722], gpad[1722];
    int16_t gg[857];
    ntt41_rader(fpad, f);
    ntt7_rader(fpad);
    byteToShort_857(gg, g);
    ntt41_rader(gpad, gg);
    ntt7_rader(gpad);
    polymul_6x6_287(fpad, gpad);
    intt7_rader(fpad);
    intt41_rader(gpad, fpad);
    mod_reduce_857(h, gpad);
}