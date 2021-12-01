#include <stdio.h>
#include <stdint.h>
#include <errno.h>

#define SUM_OFFSET 12

int main(int argc, char const *argv[])
{
    const size_t wlen = sizeof(uint32_t);
    uint32_t word, sum = 0;
    FILE *fp;

    if (argc != 2)
    {
        fputs("invalid number of arguments", stderr);
        return 1;
    }

    fp = fopen(argv[1], "rw+");
    if (!fp)
    {
        perror("Failed to open file");
        return 2;
    }

    while (fread(&word, wlen, 1, fp))
        sum += word;

    fseek(fp, SUM_OFFSET, SEEK_SET);
    fwrite(&sum, wlen, 1, fp);

    fclose(fp);

    return 0;
}
