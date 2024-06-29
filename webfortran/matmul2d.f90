subroutine matmul2d(matrix1, rows1, cols1, matrix2, rows2, cols2, matrix3)
    integer, intent(in) :: rows1, cols1, rows2, cols2
    
    double precision, intent(in) :: matrix1(rows1, cols1), matrix2(cols1, cols2)
    double precision, intent(out) :: matrix3(rows1, cols2)

    integer :: i, j, k

    do i = 1, rows1
        do j = 1, cols2
            matrix3(i, j) = 0
            do k = 1, cols1
                matrix3(i, j) = matrix3(i, j) + matrix1(i, k) * matrix2(k, j)
            end do
        end do
    end do

end subroutine