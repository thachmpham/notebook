#include <stdio.h>
#include <unistd.h>

int main(int argc, char** argv)
{
    int i = 0;a

    while (1)
    {
        printf("i=%d\n", i);
        i++;
        sleep(3);
    }

    return 0;
}