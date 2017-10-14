#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

 int main(int argc, string argv[])
 {
     int key;
     int ciphertext;

    // Enter two arguments in the command line when initializing program.
     if (argc != 2)
    {
        printf("Enter a key as your second argument.\n");
        return 1;
    }

    // Ask for text to be ciphered.
    printf("Plaintext: ");
    string plaintext = get_string();

    // Convert second argument from a string to an integer.
     key = atoi(argv[1]);

     printf("ciphertext: ");

    for (int i = 0, str = strlen(plaintext); i < str; i++)
    {
        ciphertext = (plaintext[i] + key);

        // Encript uppercase letters.
        if (isupper(plaintext[i]))
        {
            ciphertext = ((ciphertext - 65) % 26 + 65);
        }
        // Encript lowercase letters.
        else
        {
            ciphertext = ((ciphertext - 97) % 26 + 97);
        }

        printf("%c", ciphertext);
    }

    printf("\n");
    return 0;
}