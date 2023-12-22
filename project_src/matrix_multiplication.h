#ifndef __MATRIX_MULTIPLICATION_H__
#define __MATRIX_MULTIPLICATION_H__

#define N 256 // matrix size (N x N)

typedef int matrix_type;

void matrix_multiplication(matrix_type a[N][N], matrix_type b[N][N], matrix_type c[N][N]);

#endif // __MATRIX_MULTIPLICATION_H__
