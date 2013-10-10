(load "cassie.scm")
(load "solution.scm")

(define-test square-test
  (assert (square 2) 4)
  (assert (square 4) 16))

(run-tests
  square-test)
