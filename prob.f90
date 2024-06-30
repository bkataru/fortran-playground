program prob
    implicit none

    integer, parameter :: xs = 1
    integer, parameter :: xe = 5
    integer, parameter :: ys = 1
    integer, parameter :: ye = 3

    integer :: x(xs:xe), y(xs:ye)

    ! x = cols, y = rows
    integer :: n(ys:ye,xs:xe)

    ! sums
    integer :: c(xs:xe)
    integer :: r(ys:ye)
    integer :: nsum

    integer :: i, j

    n = random_integer_matrix(ys, ye, xs, xe, 10)

    call print_random_matrix(n, ys, ye, xs, xe)

    c = col_sum(n, ys, ye, xs, xe)
    print "(5i3)", ( c(i), i = xs,xe )

    r = row_sum(n, ys, ye, xs, xe)
    print "(3i3)", ( r(j), j = ys,ye )

    nsum = matrix_sum(n, ys, ye, xs, xe)
    print "(i5)", nsum

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

    function row_sum(n, rs, re, cs, ce) result(r)
        implicit none

        ! input(s)
        integer, intent(in) :: rs, re, cs, ce
        integer, intent(in) :: n(rs:re,cs:ce)

        ! output(s)
        integer :: r(rs:re)

        ! locals
        integer :: i, j, sum
        
        do i = rs,re
            sum = 0
            do j = cs,ce
                sum = sum + n(i, j)
            end do
            r(i) = sum
        end do
    end function row_sum

    function matrix_sum(n, rs, re, cs, ce) result(sum)
        implicit none

        ! input(s)
        integer, intent(in) :: rs, re, cs, ce
        integer, intent(in) :: n(rs:re,cs:ce)

        ! output(s)
        integer :: sum

        ! locals
        integer :: i, j

        sum = 0
        do i = rs,re
            do j = cs,ce
                sum = sum + n(i, j)
            end do
        end do
    end function matrix_sum

    function joint_probability(n, rs, re, cs, ce, i, j) result(prob)
        implicit none

        integer, intent(in) :: rs, re, cs, ce, i, j
        integer, intent(in) :: n(rs:re,cs:ce)

        integer :: msum
        real :: prob

        msum = matrix_sum(n, rs, re, cs, ce)

        prob = n(i, j) / msum
    end function joint_probability

    function marginal_probability(n, rs, re, cs, ce, axis) result (prob)
        implicit none

        integer, intent(in) :: rs, re, cs, ce, axis
        integer, intent(in) :: n(rs:re,cs:ce)

        integer :: msum, asum
        real :: prob

        if (axis == 1) then
            asum = row_sum(n, rs, re, cs, ce)
        else if (axis == 2) then
            asum = col_sum(n, rs, re, cs, ce)
        else
            print *, "Invalid axis selection, specify 1 or 2 for variable 1 or 2 respectively"
            asum = 0
        end if

    end function marginal_probability


end program prob