(load "cassie.scm")
(load "solution.scm")

(define-test accumulate-test
  (assert (accumulate 1 10 0 + (lambda (x) x) (lambda (x) (+ x 1))) 55)
  (assert (accumulate 1 10 1 * (lambda (x) x) (lambda (x) (+ x 1))) 3628800))

(define-test filter-and-accumulate-test
  (assert (filter-and-accumulate even? 1 10 0 + (lambda (x) x) (lambda (x) (+ x 1))) 30)
  (assert (filter-and-accumulate odd? 1 10 1 * (lambda (x) x) (lambda (x) (+ x 1)))  945))

(define-test divisor-count-test
  (assert (divisor-count 10 1 10) 4)
  (assert (divisor-count 4 1 10)  2)
  (assert (divisor-count 42 1 10) 5))

(run-tests
  accumulate-test)
