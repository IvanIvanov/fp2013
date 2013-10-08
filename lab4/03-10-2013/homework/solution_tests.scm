(load "cassie.scm")
(load "solution.scm")

(define-test fizzbuzz-test
  (assert (fizzbuzz 42) "fizz")
  (assert (fizzbuzz 25) "buzz")
  (assert (fizzbuzz 27) "fizz")
  (assert (fizzbuzz 35) "buzz")
  (assert (fizzbuzz 45) "fizzbuzz")
  (assert (fizzbuzz 15) "fizzbuzz")
  (assert (fizzbuzz 13) 13)
  (assert (fizzbuzz 17) 17))

(define-test contains-digit?-test
  (assert (contains-digit? 9122 1) #t)
  (assert (contains-digit? 4286 3) #f)
  (assert (contains-digit? 837 7)  #t)
  (assert (contains-digit? 245 2)  #t)
  (assert (contains-digit? 3 3)    #t)
  (assert (contains-digit? 0 7)    #f)
  (assert (contains-digit? 0 0)    #t))

(define-test mis?-test
  (assert (mis? 73689) #f)
  (assert (mis? 12248) #t)
  (assert (mis? 3689)  #t)
  (assert (mis? 9752)  #f)
  (assert (mis? 333)   #t)
  (assert (mis? 8)     #t)
  (assert (mis? 0)     #t))

(run-tests
 fizzbuzz-test
 contains-digit?-test
 mis?-test)
