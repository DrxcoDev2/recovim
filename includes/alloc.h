#ifndef ALLOC_H
#define ALLOC_H

#include <stddef.h>

void *xmalloc(size_t size);
void *xcalloc(size_t n, size_t size);
void xfree(void *p);

#endif
