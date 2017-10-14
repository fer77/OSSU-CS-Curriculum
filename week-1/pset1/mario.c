#include <cs50.h>
#include <stdio.h>

int main(void)
{

    int height;
    int row;
    int space;
    int hash;

    do
    {
        printf("Height:\n");

        height = get_int();
    }
    while (height < 0 || height > 23);


    for (row = 1; row <= height; row++)
    {
        // print spaces
        for(space = height - row; space > 0; space --)
        {
            printf(" ");
        }

        // print hashes
        for (hash = 1; hash <= (row + 1); hash++)
        {
            printf("#");
        }
        // print new line
        printf("\n");

    }
    return 0;

}
