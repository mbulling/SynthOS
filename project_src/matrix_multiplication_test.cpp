#include "matrix_multiplication.h"
#include <iostream>
#include <chrono>

int main() {
    matrix_type a[N][N], b[N][N], c[N][N];

    // initialize matrices with fixed values
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            a[i][j] = (i + 1) * 99;
            b[i][j] = (j + 1) * 88;
        }
    }

    auto start = std::chrono::high_resolution_clock::now();
    matrix_multiplication(a, b, c);
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> diff = end - start;

    std::cout << "Matrix multiplication (" << N << "x" << N << ") took " << diff.count() << " seconds." << std::endl;

    return 0;
}
