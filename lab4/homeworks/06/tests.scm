(load "cassie.scm")
(load "solution.scm")

(define-test nth-harmonic-test
  (assert (nth-harmonic 1)  1/1)
  (assert (nth-harmonic 2)  3/2)
  (assert (nth-harmonic 10) 7381/2520)
  (assert (nth-harmonic 42) 12309312989335019/2844937529085600))

(define-test magic-square?-test
  (assert (magic-square? '((1 1)
                           (1 1)))      #t)

  (assert (magic-square? '((1 2)
                           (1 1)))      #f)

  (assert (magic-square? '((2 7 6)
                           (9 5 1)
                           (4 3 8)))    #t)

  (assert (magic-square? '((1 2 3)
                           (4 5 6)
                           (7 8 9)))    #f)

  (assert (magic-square? '((7 12 1 14)
                           (2 13 8 11)
                           (16 3 10 5)
                           (9 6 15 4))) #t))

(define-test histogram-test
  (assert (histogram '(0 0 0 0 2 2)) '(4 0 2))
  (assert (histogram '(1 1 1 4))     '(0 3 0 0 1))
  (assert (histogram '(0))           '(1))
  (assert (histogram '(0 1 2 3))     '(1 1 1 1))
  (assert (histogram '(3 3 6 9 3 1)) '(0 1 0 3 0 0 1 0 0 1)))

(run-tests
  nth-harmonic-test
  magic-square?-test
  histogram-test)
