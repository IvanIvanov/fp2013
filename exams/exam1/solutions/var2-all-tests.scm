(load "sum-of-oddly.scm")
(load "occur-k.scm")
(load "deepest-atom.scm")
(load "both-in.scm")
(load "delete-row.scm")

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


(announce "Testing sum-of-oddly")

(framework-check 14 (sum-of-oddly 1 10))
(framework-check 730 (sum-of-oddly 100 200))
(framework-check 91 (sum-of-oddly 1 42))

(announce "Testing occur-k")

(framework-check '(1 3) (occur-k '(1 2 3 5 2 5) 1))  
(framework-check '(2 5 2 5) (occur-k '(1 2 3 5 2 5) 2))
(framework-check '() (occur-k '(1 2 3 5 2 5) 3))


(announce "Testing deepest-atom")

(framework-check 1 (deepest-atom '(1 2 3)))
(framework-check 3 (deepest-atom '(1 (2 (3 4)) 5)))
(framework-check 3 (deepest-atom '(1 (2 3 (4 5)))))

(announce "Testing both-in")

(framework-check #t ( (both-in (lambda (x) (* x 2)) (lambda (x) (* x 3)) -10 10) 1))
(framework-check #t ( (both-in (lambda (x) (* x 2)) (lambda (x) (* x 3)) -10 10) 2))
(framework-check #t ( (both-in (lambda (x) (* x 2)) (lambda (x) (* x 3)) -10 10) 3))
(framework-check #f ( (both-in (lambda (x) (* x 2)) (lambda (x) (* x 3)) -10 10) 4))

(announce "Testing delete-row")

(framework-check '((4 5 6)) (delete-row '((1 2 3) (4 5 6)) 1))
(framework-check '((1 2) (5 6)) (delete-row '((1 2) (3 4) (5 6)) 2))