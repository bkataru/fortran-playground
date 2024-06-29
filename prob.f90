program prob
    implicit none

    integer, parameter :: xs = 1
    integer, parameter :: xe = 5
    integer, parameter :: ys = 1
    integer, parameter :: ye = 3

    integer :: x(xs:xe), y(xs:ye)

    ! x = cols, y = rows
    integer :: n(ys:ye,xs:xe)
    integer :: c(xs:xe)

    n = random_integer_matrix(ys, ye, xs, xe, 10)

    c = col_sum(n, ys, ye, xs, xe)

    print *, c

    call print_random_matrix(n, ys, ye, xs, xe)

contains

    subroutine print_random_matrix(n, rs, re, cs, ce)
        implicit none

        integer, intent(in) :: rs, re, cs, ce
        integer, intent(in) :: n(rs:re,cs:ce)

        integer :: i, j

        do i = rs,re
            print "(5i2)", ( n(i,j), j = cs, ce)
        end do

    end subroutine print_random_matrix

    function random_integer_matrix(rs, re, cs, ce, maximum) result(matrix)
        implicit none

        ! input(s)
        integer, intent(in) :: rs, re, cs, ce, maximum

        ! output(s)
        integer :: matrix(rs:re,cs:ce)

        ! locals
        integer :: i, j
        real :: rand(rs:re,cs:ce)

        call random_number(rand)

        do i = rs,re
            do j = cs,ce
                matrix(i,j) = maximum * rand(i,j)
            end do
        end do
    end function random_integer_matrix

    function col_sum(n, rs, re, cs, ce) result(c)
        implicit none

        ! input(s)
        integer, intent(in) :: rs, re, cs, ce
        integer, intent(in) :: n(rs:re,cs:ce)

        ! output(s)
        integer :: c(cs:ce)

        ! locals
        integer :: i, j, sum

        do j = cs,ce
            sum = 0
            do i = rs,re
                sum = sum + n(i,j)
            end do
            c(j) = sum
        end do
    end function col_sum
end program prob