program fortrantut
  implicit none
  
  ! print *, "A number ", 10
  ! print "(3i5)", 7, 6, 8
  ! print "(i5)", 7, 6, 8

  ! print "(f8.5)", 3.1415, 1.234

  ! print "(/, a8)", "Name", "Age"

  ! print "(e10.3)", 123.456

  ! print "(/, e10.3)", 100.0, 200.0, 300.0, 400.0, 500.0

  ! print "(a5,i2)", "I am ", 22
  
  character (len=5) :: i_char
  write (i_char, "(i5)") 10
  print "(a,a)", "A number ", adjustl(i_char)

end program fortrantut
