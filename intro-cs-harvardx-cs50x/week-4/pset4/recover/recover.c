/**
 * Recovers JPEGs.
 */

#include <cs50.h>
#include <stdio.h>
#include <stdlib.h>

#define BLOCK 512

// int main(int argc, char *argv[])
int main(void)
{

    // open memory card file and check it is not null
     FILE *input = fopen("card.raw", "r");
    if (input == NULL)
    {
        printf("Could not open.\n");
        return 1;
    }

    // create buffer
    unsigned char buffer[BLOCK];

    // counter
    int filecount = 0;

    FILE *picture = NULL;

    // check if we've found a jpeg yet or not
    int jpg_found = 0; //false

    // go through cardfile until there aren't any blocks left
    while (fread(buffer, BLOCK, 1, input) == 1)
    {
        // find beginning of jpeg
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xe0) == 0xe0)
        {
            if (jpg_found == 1)
            {
                // beginning of a new pic so close out current jpeg
                fclose(picture);
            }
            else
            {
                // start a new jpeg
                jpg_found = 1;
            }

            char filename[8];
            sprintf(filename, "%03d.jpg", filecount);
            picture = fopen(filename, "a");
            filecount++;
        }

        if (jpg_found == 1)
        {
            // write 512 bytes until new jpeg is found
            fwrite(&buffer, BLOCK, 1, picture);
        }

    }

    // end of file
    fclose(input);
    fclose(picture);

    return 0;
}