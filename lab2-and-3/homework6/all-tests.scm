;;; This file contains unit tests for the problem listed in the name
;;; of this file.
;;;
;;; To run the tests specify the relative or absolute path to the
;;; ".scm" file with the proposed solution in the (load ...) command
;;; below. Then you can either open the tests and run them in Racket
;;; (with R5RS set as the language), or you can run the following
;;; directly from the command line:
;;;
;;;   plt-r5rs <the-name-of-this-file>
;;;
;;; assuming Racket's bin directory is included in the PATH environment
;;; variable.
;;;
;;; To inspect the actual test cases that are run - look at the
;;; bottom of the file.
;;;
(load "mult-matrices.scm")
(load "match-lengths.scm")
(load "lower-than-harmonic.scm")



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

(define (range a b)
  (cond
    ( (> a b) (list))
    (else (cons a (range (+ a 1) b)))))

(announce "mult-matrices")

(framework-check 
    (list (list -7 -6 11) (list -17 -20 25)) 
    (mult-matrices (list (list 1 2) (list 3 4)) (list (list -3 -8 3) (list -2 1 4))))

(framework-check 
  (list) 
  (mult-matrices (list (list 1 2 3) (list 4 5 6)) (list (list 1 2 3) (list 4 5 6))))

(framework-check
  (list (list 64 89))
  (mult-matrices (list (list 1 4 6)) (list (list 2 3) (list 5 8) (list 7 9))))

(announce "match-lengths?")

(framework-check #t 
  (match-lengths? 
    (list (list) (list 1 2) (list 3 4 5)) 
    (list (list 1) (list 2 3 4) (list 5 6 7 8))))

(framework-check #f 
  (match-lengths? 
    (list (list) (list 1 2) (list 3 4 5)) 
    (list (list) (list 2 3 4) (list 5 6 7))))


(framework-check #t 
  (match-lengths? (list (range 1 9) (range 10 19))
                (list (list 1 2 3) (list 1 2 3 4))))

(announce "lower-than-harmonic")

(framework-check (list 1 2 3) (lower-than-harmonic (list 1 2 3 4 5 6 7 8 9 10)))
(framework-check (list 1) (lower-than-harmonic (list 1 2 4)))
(framework-check (list 1 1 2 3) (lower-than-harmonic (list 1 1 2 3 5 8 13 21 34 55)))
