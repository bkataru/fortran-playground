program fortrantut
  implicit none

  type Customer
    character (len=40) :: name
    integer :: age
    real :: balance
  end type Customer

  type(Customer) :: customers(5)
  integer :: n

  type(Customer) :: cust1

  cust1%name = "Foo bar"
  cust1%age = 22
  cust1%balance = 320.45

  customers(1) = cust1
  
  customers(2)%name = "kappa"
  customers(2)%age = 42
  customers(2)%balance = 229.78

  do n = 1,2
    print *, customers(n)
  end do

end program fortrantut
 
