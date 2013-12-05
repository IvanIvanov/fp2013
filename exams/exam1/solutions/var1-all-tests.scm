(load "sum-of-evenly.scm")
(load "unpack.scm")
(load "sublist.scm")
(load "partial-apply2.scm")
(load "delete-col.scm")

;;; Here be dragons!
;;;
;;; The following definitions create the infrastructure for a very simple
;;; "test framework". As a student you should be just fine in skipping them.
(define (__make-counter x)
  (lambda ()
    (set! x (+ x 1))
    x))

(define __test-counter (__make-counter 0))

(define (__test-passed)
  (display (string-append "Test" (number->string (__test-counter)) " passed!"))
  (newline))

(define (__test-failed)
  (display (string-append "Test" (number->string (__test-counter)) " failed!"))
  (newline))

(define (framework-check expected-value return-value)
  (if (equal? expected-value return-value)
      (__test-passed)
      (__test-failed)))

;;; dont do this at home
(define (announce test-name)
  (display (string-append "Testing " test-name))
  (newline)
  (set! __test-counter (__make-counter 0)))

;;; Dragons no more!
;;; End of the "test framework" code.


(announce "Testing sum-of-evenly")

(framework-check 41 (sum-of-evenly 1 10))
(framework-check 14420 (sum-of-evenly 100 200))
(framework-check 812 (sum-of-evenly 1 42))

(announce "Testing unpack")

(framework-check '(1 1 5 5 5 10 10 10) (unpack '((1 2) (5 3) (10 3))))  
(framework-check '(1 1 5 5 5) (unpack '((1 2) (5 3) (10 0))))
(framework-check '(9 0 0 0 0 0 0 0 0 0 0) (unpack '((9 1) (0 10))))

(announce "Testing sublist")

(framework-check #t (sublist '(1 2 3) '(1 2 3 4 5)))
(framework-check #t (sublist '(3 4 5) '(1 2 3 4 5)))
(framework-check #t (sublist '(2 3 4) '(1 2 3 4 5)))
(framework-check #f (sublist '(1 2 4) '(1 2 3 4 5)))

(announce "Testing partial-apply2")

(framework-check 10 ((partial-apply2 + 0) 10))
(framework-check 11 ((partial-apply2 + 1) 10))
(framework-check 3 ((partial-apply2 min 5) 3))
(framework-check 5 ((partial-apply2 min 5) 8))

(announce "Testing delete-col")

(framework-check '((2 3) (5 6)) (delete-col '((1 2 3) (4 5 6)) 1))
(framework-check '((1) (3) (5)) (delete-col '((1 2) (3 4) (5 6)) 2))