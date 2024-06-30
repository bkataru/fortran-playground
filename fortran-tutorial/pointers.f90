program fortrantut
  implicit none
  integer, pointer :: ptr1, ptr2

  integer, pointer, dimension(:) :: a_ptr1

  integer, target :: target1
  
  allocate(ptr1)
  ptr1 = 5
  print "(a5,i1)", "ptr1 ", ptr1

  ptr2 => target1
  ptr2 = 1
  ptr2 = ptr2 + 1
  print "(a5,i1)", "ptr1 ", ptr1
  print "(a5,i1)", "tar1 ", target1
  
  nullify(ptr2)
  deallocate(ptr1)
end program fortrantut
