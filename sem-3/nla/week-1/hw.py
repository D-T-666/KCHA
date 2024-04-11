import numpy

A_array = [[1, 1, 2],
           [1, -1, 1],
           [0, -1, 3]]

B_array = [[1, 2, 3],
           [3, 1, 2],
           [2, 3, 1]]

A = numpy.matrix(A_array)
B = numpy.matrix(B_array)

# 

print("""
1. Find the transpose matrices of A and B using 
   `numpy.matrix.transpose` function.
""")

A_transpose = numpy.matrix.transpose(A)
B_transpose = numpy.matrix.transpose(B)

print("transpose of A = ")
print(A_transpose)
print("transpose of B = ")
print(B_transpose)

# 

print("""
2. Calculate the sum of matrices: A + B.
""")

A_plus_B = numpy.matrix([[A[i, j] + B[i, j] for j in range(3)] for i in range(3)])

print("A + B = ")
print(A_plus_B)

# 

print("""
3. Calculate the product of matrices: AB using 
   Python function numpy.matmul.
""")

AB = numpy.matmul(A, B)

print("AB = ")
print(AB)

# 

print("""
4. Determine if these matrices are invertible. 
   If the matrix is invertible, print ”Matrix 
   (name of matrix) is invertible ”. If - not,
   print ”Matrix (name of matrix) is not invertible".
""")

def determine_invertibility(mat):
    # If the determinant of a matrix is non-zero, it's 
    # invertible, otherwise - not. So we need to find 
    # the determinant of the matrix.

    determinant = mat[0, 0] * mat[1, 1] * mat[2, 2] + \
                  mat[0, 1] * mat[1, 2] * mat[2, 0] + \
                  mat[0, 2] * mat[1, 0] * mat[2, 1] - \
                  mat[0, 2] * mat[1, 1] * mat[2, 0] - \
                  mat[0, 1] * mat[1, 0] * mat[2, 2] - \
                  mat[0, 0] * mat[1, 2] * mat[2, 1]

    return determinant != 0

if determine_invertibility(A):
    print("Matrix A is invertible")
else:
    print("Matrix A is not invertible")

if determine_invertibility(B):
    print("Matrix B is invertible")
else:
    print("Matrix B is not invertible")

# 

print("""
5. If the matrix is invertible, find it's inverse 
   matrix using `numpy.linalg.inv` function.
""")

if determine_invertibility(A):
    print("Inverse of the matrix A:")
    print(numpy.linalg.inv(A))

if determine_invertibility(B):
    print("Inverse of the matrix B:")
    print(numpy.linalg.inv(B))