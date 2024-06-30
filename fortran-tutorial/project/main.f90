program fortrantut
  ! use shape
  
  use shape_mod
  use triangle_mod

  implicit none

  ! call set_shape(10.5, 20.5)
  ! call get_area()

  type(triangle_m) :: tri
  
  tri%x = 10
  tri%y = 20

  print "(a3,f5.2)", "X: ", tri%x
  print "(a3,f5.2)", "Y: ", tri%y
  print "(a6,f6.2)", "Area: ", tri%get_area()

end program fortrantut
