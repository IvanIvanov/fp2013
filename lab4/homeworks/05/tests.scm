(load "cassie.scm")
(load "solution.scm")

(define-test replicate-test
  (assert (replicate '(a b c) 1) '(a b c))
  (assert (replicate '(a b c) 2) '(a a b b c c))
  (assert (replicate '(a b a) 3) '(a a a b b b a a a))
  (assert (replicate '(a b c) 3) '(a a a b b b c c c))
  (assert (replicate '(a b c) 4) '(a a a a b b b b c c c c)))

(define-test each-with-index-test
  (assert (each-with-index '(1 2 3)) '((0 1) (1 2) (2 3)))
  (assert (each-with-index '(a b c)) '((0 a) (1 b) (2 c))))

(define-test slice-test
  (assert (slice '(a b c d e f g h i k) 3 7)  '(d e f g h))
  (assert (slice '(a b c d e f g h i k) 0 3)  '(a b c d))
  (assert (slice '(a b c d e f g h i k) 3 33) '(d e f g h i k))
  (assert (slice '(a b c d e f g h i k) 3 0)  '())
  (assert (slice '(a b c d e f g h i k) 3 3)  '(d)))

(run-tests
  replicate-test
  each-with-index-test
  slice-test)
