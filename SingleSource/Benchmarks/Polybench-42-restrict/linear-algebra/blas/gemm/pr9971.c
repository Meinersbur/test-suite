
typedef union {
    unsigned long long dword[2];
    unsigned short half[8];
} vector_t;

void vrlh(vector_t *va, vector_t *vb, vector_t *vd)
{
    vector_t t;
    for (int i = 0; i < 8; i++) {
        int sh = vb->half[7 - i] & 0xf;
        t.half[7 - i] = va->half[7 - i] << sh | va->half[7 - i] >> (16 - sh);
    }
    vd->dword[1] = t.dword[1];        // These lines will be
    vd->dword[0] = t.dword[0];        // ignored by the compiler.
}

