program fortrantut
  implicit none

  character (len=30) :: str = "I'm a string"
  character (len=30) :: str2 = " that is longer"
  character (len=30) :: str3
  
  ! concatenation
  str3 = trim(str) // trim(str2)
  ! adjustl = ltrim, adjustr = rtrim
  print *, str3
  
  ! substring
  print *, str3(1:3)
  print "(a9,i1)", "Index at ", index(str, "string")
  print *, len(str) 

  ! array operations also apply to strings

end program fortrantut
