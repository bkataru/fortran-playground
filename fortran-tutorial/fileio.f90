program fortrantut
  implicit none
  character (len=100) :: str = "I'm a string"
  character (len=100) :: str2

  integer :: err_status
  character(256) :: err_iomsg

  open(10, file='data.dat', status='new', iostat=err_status, iomsg=err_iomsg)

  if (err_status /= 0) then
    write (*,*) 'Error ', trim(err_iomsg)
    stop
  end if

  write (10, '(A)') str
  close(10)

  open(11, file='data.dat', status='old')
  read(11, '(A)') str2
  write(*, '(A)') trim(str2)
  close(11, status="delete")
end program fortrantut
