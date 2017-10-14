/**
 * helpers.c
 *
 * Helper functions for Problem Set 3.
 */

#include <cs50.h>

#include "helpers.h"

/**
 * Returns true if value is in array of n values, else false.
 */
bool search(int value, int values[], int n)
{
    // Start counting array elements from 0.
    int start = n - 1;
    int count = 0;

    while (start >= count)
    {
        // Binary search (an attempt).
        int middle = (count + start) / 2;

        if (values[middle] == value)
        {
            return true;
        }
        else if (values[middle] > value)
        {
            start = middle - 1;
        }
        else
        {
            count = middle + 1;
        }
    }

    return false;
}

/**
 * Sorts array of n values.
 */
void sort(int values[], int n)
{
    bool bubble;

    do
    {
        bubble = false;
        for (int i = 0; i < n - 1; i++)
        {
            if (values[i] > values[i + 1])
            {
                int move = values[i];
                values[i] = values[i + 1];
                values[i + 1] = move;
                bubble = true;
            }
        }
    }
    while (bubble);

    return;
}
