#include <stdio.h>
#include "../includes/alloc.h"

int main() {
    printf("➡️  Probando xmalloc...\n");

    int *nums = (int *)xmalloc(5 * sizeof(int));
    for (int i = 0; i < 5; i++) {
        nums[i] = i * 10;
        printf("nums[%d] = %d\n", i, nums[i]);
    }

    xfree(nums);

    printf("✅ xmalloc y xfree funcionan correctamente.\n");
    return 0;
}
