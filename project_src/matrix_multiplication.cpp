#include "matrix_multiplication.h"

void matrix_multiplication(matrix_type a[N][N], matrix_type b[N][N], matrix_type c[N][N]) {
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            matrix_type sum = 0;
            for (int k = 0; k < N; ++k) {
                sum += a[i][k] * b[k][j];
            }
            c[i][j] = sum;
        }
    }
}
