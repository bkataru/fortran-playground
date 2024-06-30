program fortrantut
  implicit none
  ! integer arrays
  integer, dimension(1:5) :: a1, a2, a3
  ! real arrays
  real, dimension(1:50) :: aR1

  ! multidimensional arrays
  integer, dimension(5,5) :: a4
  integer :: n, m, x, y

  ! dynamic arrays
  integer, dimension(:), allocatable :: a5
  integer :: num_vals = 0
  
  ! initialization at declaration
  integer, dimension(1:9) :: a6 = (/ 1,2,3,4,5,6,7,8,9 /)
  
  integer, dimension(1:3,1:3) :: a7
  
  ! fortran is 1-indexed by default
  ! array assignment
  a1(1) = 5

  ! array retrieval
  print "(i1)", a1(1)
  
  ! assigning via do
  do n = 1,5
    a1(n) = n
  end do

  ! printing via do
  do n = 1,5
    print "(i1)", a1(n)
  end do

  ! printing ranges
  print "(3i2)", a1(1:3)
  ! range with a step
  print "(2i2)", a1(1:3:2)

  ! assigning ndarrays via do
  do n = 1,5
    do m = 1,5
      a4(n,m) = n
    end do
  end do

  ! printing ndarrays via do
  do n = 1,5
    do m = 1,5
      print "(i1, a1, i1, a3, i1)", n, " ", m, " : ", a4(n,m)
    end do
  end do

  ! implied do loop for array comprehension
  do n = 1,5
    print "(5i1)", ( a4(n,m), m = 1,5 )
  end do
  
  ! size = total no. of array elements
  print "(i2)", size(a1)
  print "(i2)", size(a4)

  ! rank = tensor rank
  ! shape = dimensions
  print "(i2)", rank(a4)
  print "(i2)", shape(a4)
  
  ! allocating array at runtime (dynamic array)
  print *, "Size of array? "
  read *, num_vals
  allocate(a5(1:num_vals))
  
  ! assign dynamic array
  do n = 1,num_vals
    a5(n) = n
  end do
  
  ! print dynamic array
  do n = 1,num_vals
    print "(i1)", a5(n)
  end do

  ! assigning arrays directly using list notation
  a2 = (/ 1,2,3,6,7 /)
  print "(5i1)", ( a2(m), m = 1,5 )

  ! reshaping arrays
  a7 = reshape(a6, (/ 3, 3 /))

  print "(l1)", all(a1 == a2, 1)

  print "(l1)", any(a1 == a2, 1)

  print "(i1)", count(a1 == a2, 1)

  print "(i1)", maxval(a1)
  print "(i2)", minval(a1)

  print "(i3)", product(a1)
  print "(i2)", sum(a1)
end program fortrantut
