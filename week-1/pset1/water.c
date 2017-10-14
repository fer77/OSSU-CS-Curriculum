#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
    printf("Minutes:\n");

    int minutes;

    do
    {
        minutes = get_int();
    }
    while (minutes < 0);

    float gallons = minutes * 1.5;
    int oz = gallons * 128;
    int bottles = oz / 16;

    printf("Bottles:%i\n", bottles);
}
