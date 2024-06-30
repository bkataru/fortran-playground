program calc
  implicit none
  double precision :: a = 123.456d+0
  double precision :: b = 0.123456d+0

  ! print *, a
  ! print *, b

  ! print *, b * 1000 

  print "(2d10.6)", a, b
  ! print "(/)",
  print "(d10.6)", b * 1000

end program calc
