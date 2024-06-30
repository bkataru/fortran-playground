import numpy as np

x = np.zeros(shape=(5))
y = np.zeros(shape=(3))

n = np.zeros(shape=(3, 5))
c = np.zeros(shape=(5))

def random_integer_matrix(rows: int, cols: int, maximum: int) -> np.ndarray:
    matrix = np.random.rand(rows, cols)
    
    matrix = 10 * matrix
    matrix = matrix.astype(np.int32)
    
    return matrix

def col_sum(n: np.ndarray) -> np.ndarray:
    rows, cols = n.shape
    
    c = np.zeros(shape=(cols))
    
    for j in range(cols):
        sum = 0
        for i in range(rows):
            sum += n[i, j]
        c[j] = sum
        
    return c
    
n = random_integer_matrix(3, 5, 10)

c = col_sum(n)

print(n)
print(c)