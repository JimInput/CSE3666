#include <stdio.h>

int main() {
    int i, a = 5, r = 155;
    for (i = 0; i < a; i += 1) 
 	    if ((i & 0xA5) != 0) 
		    r ^= i << 8;  // r = r xor (i <<8)#
        else  		
            r += i >> 4;  // r = r += (i >>4)

    printf("%d\n", r);
    return 0;
}