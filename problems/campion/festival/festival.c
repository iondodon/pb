#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdint.h>

#define MAX_BANDS 20
#define MAX_MUSICIANS 128
#define MAX_NAME_LEN 32
#define MAX_LINE 512

static void trim(char *s) {
    char *p = s;
    while (*p && isspace((unsigned char)*p)) p++;
    if (p != s) memmove(s, p, strlen(p) + 1);
    int n = (int)strlen(s);
    while (n > 0 && isspace((unsigned char)s[n - 1])) s[--n] = 0;
}

int main(void) {
    FILE *fin = fopen("festival.in", "r");
    FILE *fout = fopen("festival.out", "w");
    if (!fin || !fout) return 0;

    int n;
    if (fscanf(fin, "%d", &n) != 1) return 0;
    fgetc(fin); // consume endline

    char names[MAX_MUSICIANS][MAX_NAME_LEN];
    int m = 0;

    uint64_t band_lo[MAX_BANDS] = {0};
    uint64_t band_hi[MAX_BANDS] = {0};

    char line[MAX_LINE];
    for (int i = 0; i < n; i++) {
        if (!fgets(line, sizeof(line), fin)) return 0;
        line[strcspn(line, "\r\n")] = 0;

        char *token = strtok(line, ",");
        while (token) {
            trim(token);
            int id = -1;
            for (int k = 0; k < m; k++) {
                if (strcmp(names[k], token) == 0) {
                    id = k;
                    break;
                }
            }
            if (id == -1) {
                id = m++;
                strncpy(names[id], token, MAX_NAME_LEN - 1);
                names[id][MAX_NAME_LEN - 1] = 0;
            }

            if (id < 64) band_lo[i] |= (1ULL << id);
            else band_hi[i] |= (1ULL << (id - 64));

            token = strtok(NULL, ",");
        }
    }

    int conf[MAX_BANDS] = {0};
    for (int i = 0; i < n; i++) {
        for (int j = i + 1; j < n; j++) {
            if ((band_lo[i] & band_lo[j]) || (band_hi[i] & band_hi[j])) {
                conf[i] |= (1 << j);
                conf[j] |= (1 << i);
            }
        }
    }

    int total = 1 << n;
    unsigned char indep[1 << MAX_BANDS] = {0};
    indep[0] = 1;
    int best = 0;

    for (int mask = 1; mask < total; mask++) {
        int lsb = mask & -mask;
        int i = __builtin_ctz(lsb);
        int prev = mask ^ lsb;
        if (indep[prev] && ((conf[i] & prev) == 0)) {
            indep[mask] = 1;
            int cnt = __builtin_popcount((unsigned)mask);
            if (cnt > best) best = cnt;
        }
    }

    fprintf(fout, "%d\n", best);
    fclose(fin);
    fclose(fout);
    return 0;
}
