#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

 int main(int argc, string argv[])
 {
    string key;
    int cipherkey;
    char* ciphertext;

    // Enter two arguments in the command line when initializing program.
    if (argc != 2)
    {
        printf("Enter a key as your second argument.\n");
        return 1;
    }

    key = argv[1];

    // Check key given only contains alphabetical charachters.
    for (int i = 0, k = strlen(key); i < k; i++)
    {
        if (!isalpha(key[i])) {
            printf("Non alphabetical key given.\n");
            return 1;
        }
    }

    // Ask for text to be ciphered.
    printf("Plaintext: ");
    string plaintext = get_string();

    printf("ciphertext: ");

    cipherkey = strlen(key);
    ciphertext = plaintext;

    for (int i = 0, j = 0, str = strlen(plaintext); i < str; i++)
    {
        // Start to encript.
        if (isalpha(plaintext[i]))
        {
            // Wraps around to the beginning at the end of the keyword.
            char referenceKey = (isupper(key[j % cipherkey])) ? 'A' : 'a';
            // Is first letter upper- or lowercase.
            char referenceValue = (isupper(plaintext[i])) ? 'A' : 'a';
            // Cipher using the formula c_i = (p_i + k_j) % 26 formula and convert to ASCII
            ciphertext[i] = ((plaintext[i] - referenceValue + (key[(j % cipherkey)] - referenceKey)) % 26) + referenceValue;
            j++;
        }
        else
        {
            ciphertext[i] = plaintext[i];
        }
    }

    printf("%s\n", ciphertext);
}