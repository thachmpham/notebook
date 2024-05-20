#include <stdio.h>
#include <unistd.h>

int main(int argc, char** argv)
{
    int i = 0;
    while (1){
        printf("%d\n", i);
        sleep(3);
        i++;
    }

    return 0;
}