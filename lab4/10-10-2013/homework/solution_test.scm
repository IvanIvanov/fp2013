(load "cassie.scm")
(load "solution.scm")

(define-test balanced?-test
  (assert (balanced? 0)       #t)
  (assert (balanced? 9)       #t)
  (assert (balanced? 11)      #t)
  (assert (balanced? 13)      #f)
  (assert (balanced? 121)     #t)
  (assert (balanced? 4518)    #t)
  (assert (balanced? 9122)    #f)
  (assert (balanced? 28471)   #f)
  (assert (balanced? 1238033) #t))

(define-test even-fibonacci-sum-test
  (assert (even-fibonacci-sum 0)  0)
  (assert (even-fibonacci-sum 1)  0)
  (assert (even-fibonacci-sum 2)  0)
  (assert (even-fibonacci-sum 3)  0)
  (assert (even-fibonacci-sum 4)  2)
  (assert (even-fibonacci-sum 10) 44)
  (assert (even-fibonacci-sum 42) 82790070)
  (assert (even-fibonacci-sum 42) 286573922006908542050))

(define-test sum-of-prime-divisors-test
  (assert (sum-of-prime-divisors 4)  2)
  (assert (sum-of-prime-divisors 10) 7)
  (assert (sum-of-prime-divisors 36) 5)
  (assert (sum-of-prime-divisors 42) 12)
  (assert (sum-of-prime-divisors 17) 17)
  (assert (sum-of-prime-divisors 1878) 318))

(run-tests
  balanced?-test
  even-fibonacci-sum-test
  sum-of-prime-divisors-test)
