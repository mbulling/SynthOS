all: test

test: matrix_multiplication_test.cpp matrix_multiplication.cpp matrix_multiplication.h
    g++ -o matrix_multiplication_test matrix_multiplication_test.cpp matrix_multiplication.cpp
    ./matrix_multiplication_test

clean:
    rm -f matrix_multiplication_test
