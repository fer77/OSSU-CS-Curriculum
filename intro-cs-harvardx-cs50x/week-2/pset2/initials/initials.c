#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main(void) {

    string name = get_string();

    if (name != NULL)
    {
        // Print the first letter of the person's name.
        printf("%c", toupper(name[0]));

        // Loop through the name given.
        for (int i = 0, n = strlen(name); i < n; i++)
        {
            if (name[i] == ' ')
            {
                i++;
                // Print the first letter after a spance.
                printf("%c", toupper((name + i)[0]));
            }
        }
        // Print a new line, required.
        printf("\n");
    }
}