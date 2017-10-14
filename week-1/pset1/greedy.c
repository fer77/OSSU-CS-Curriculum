#include <cs50.h>
#include <stdio.h>
#include <math.h>

int main(void) {
    float amount;
    int cents;
    int coins = 0;
    int amount_left;

    do
    {
        printf("Change due: ");

        amount = get_float();
    }
    while (amount < 0);

    cents = (int)round(amount * 100);

    amount_left = cents;

    coins += amount_left / 25;
    amount_left %= 25;

    coins += amount_left / 10;
    amount_left %= 10;

    coins += amount_left / 5;
    amount_left %= 5;

    coins += amount_left;

    printf("%d\n", coins);
}