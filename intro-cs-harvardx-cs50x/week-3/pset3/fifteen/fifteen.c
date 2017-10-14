/**
 * fifteen.c
 *
 * Implements Game of Fifteen (generalized to d x d).
 *
 * Usage: fifteen d
 *
 * whereby the board's dimensions are to be d x d,
 * where d must be in [DIM_MIN,DIM_MAX]
 *
 * Note that usleep is obsolete, but it offers more granularity than
 * sleep and is simpler to use than nanosleep; `man usleep` for more.
 */

#define _XOPEN_SOURCE 500

#include <cs50.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

// Legal board dimentions
#define DIM_MIN 3
#define DIM_MAX 9

int board[DIM_MAX][DIM_MAX];

int d;

int tile_i;
int tile_j;
int blank_i;
int blank_j;

void clear(void);
void greet(void);
void init(void);
void draw(void);
void switchTile(int tile);

bool move(int tile);
bool won(void);


int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Usage: fifteen d\n");
        return 1;
    }

    d = atoi(argv[1]);
    if (d < DIM_MIN || d > DIM_MAX)
    {
        printf("Board must be between %i x %i and %i x %i, inclusive.\n",
            DIM_MIN, DIM_MIN, DIM_MAX, DIM_MAX);
        return 2;
    }

    FILE *file = fopen("log.txt", "w");
    if (file == NULL)
    {
        return 3;
    }

    greet();

    init();

    while (true)
    {
        clear();

        draw();

        // for (int i = 0; i < d; i++)
        // {
        //     for (int j = 0; j < d; j++)
        //     {
        //         fprintf(file, "%i", board[i][j]);
        //         if (j < d - 1)
        //         {
        //             fprintf(file, "|");
        //         }
        //     }
        //     fprintf(file, "\n");
        // }
        // fflush(file);

        if (won())
        {
            printf("ftw!\n");
            break;
        }

        printf("Tile to move: ");
        int tile = get_int();

        if (tile == 0)
        {
            break;
        }

        // fprintf(file, "%i\n", tile);
        // fflush(file);

        if (!move(tile))
        {
            printf("\nIllegal move.\n");
            usleep(500000);
        }

        usleep(500000);
    }

    // fclose(file);

    return 0;
}

/**
 * Clears screen using ANSI escape sequences.
 */
void clear(void)
{
    printf("\033[2J");
    printf("\033[%d;%dH", 0, 0);
}

/**
 * Greets player.
 */
void greet(void)
{
    clear();
    printf("WELCOME TO GAME OF FIFTEEN\n");
    usleep(2000000);
}

/**
 * Initializes the game's board with tiles numbered 1 through d*d - 1
 * (i.e., fills 2D array with values but does not actually print them).
 */
void init(void)
{
    int n = (d * d) - 1;

    for (int i = 0; i < d; i++) // rows
    {
        for (int j = 0; j < d; j++) // columns
        {
            board[i][j] = n;
            n--;
        }
        printf("\n");
    }

    if (((d * d) - 1) % 2 != 0)
    {
        int temp = board[d - 1][d - 2];
        board[d - 1][d - 2] = board[d - 1][d - 3];
        board[d - 1][d - 3] = temp;
    }

    // Blank tile
    blank_i = d - 1;
    blank_j = d - 1;
}

/**
 * Prints the board in its current state.
 */
void draw(void)
{
    for (int i = 0; i < d; i++) // row
    {
        for (int j = 0; j < d; j++) // column
        {
            if (board[i][j] < 10)
            {
                if (board[i][j] == 0)
                {
                    printf(" _ ");
                }
                else
                {
                printf(" %d ", board[i][j]);
                }
            }
            else
            {
                printf("%d ", board[i][j]);
            }
        }
        printf("\n");
    }
}

/**
 * If tile borders empty space, moves tile and returns true, else
 * returns false.
 */
bool move(int tile)
{
    if (tile > (d * d) - 1 || tile < 1)
        return false;

    for (int i = 0; i < d; i++)
    {
        for (int j = 0; j < d; j++)
        {
            if (board[i][j] == tile)
            {
                tile_i = i;
                tile_j = j;
            }
        }
    }

    // top
    if (tile_i > 0 && board[tile_i - 1][tile_j] == 0)
    {
        switchTile(tile);
        return true;
    }
    // right
    if (tile_j < d - 1 && board[tile_i][tile_j + 1] == 0)
    {
        switchTile(tile);
        return true;
    }
    // bottom
    if (tile_i < d - 1 && board[tile_i + 1][tile_j] == 0)
    {
        switchTile(tile);
        return true;
    }
    // left
    if (tile_j > 0 && board[tile_i][tile_j - 1] == 0)
    {
        switchTile(tile);
        return true;
    } else {
        return false;
    }

    return false;
}

/**
 * Returns true if game is won (i.e., board is in winning configuration),
 * else false.
 */
bool won(void)
{
    int counter = 1;

    for (int i = 0; i < d; i++)
    {
        for (int j = 0; j < d; j++)
        {
            if (board[i][j] == counter)
                counter++;
        }
    }

    if (counter == d * d && board[d - 1][d - 1] == 0)
        return true;
    else
        return false;
}

// Move legal tiles
void switchTile(tile)
{
    int temp = board[tile_i][tile_j];
    board[tile_i][tile_j] = board[blank_i][blank_j];
    board[blank_i][blank_j] = temp;

    blank_i = tile_i;
    blank_j = tile_j;
}