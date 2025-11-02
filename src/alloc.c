#include <stdio.h>
#include <stdlib.h>
#include "alloc.h"

void *xmalloc(size_t size) {
    void *p = malloc(size);
    if (!p) {
        fprintf(stderr, "❌ Error: no se pudo asignar %zu bytes\n", size);
        exit(1);
    }
    return p;
}

void *xcalloc(size_t n, size_t size) {
    void *p = calloc(n, size);
    if (!p) {
        fprintf(stderr, "❌ Error: no se pudo reservar memoria\n");
        exit(1);
    }
    return p;
}

void xfree(void *p) {
    if (p) free(p);
}
