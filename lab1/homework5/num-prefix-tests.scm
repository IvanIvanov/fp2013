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
(load "num-prefix.scm")



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

(define (framework-check-aprox expected-value return-value)
  (let ((epsilon 1e-6))
    (if (< (abs (- expected-value return-value)) epsilon)
        (__test-passed)
        (__test-failed))))

;;; Dragons no more!
;;; End of the "test framework" code.


;;; The test cases follow:

;;; Test1
(framework-check #t (num-prefix 123 1234))

;;; Test2
(framework-check #t (num-prefix 345 345))

;;; Test3
(framework-check #f (num-prefix 345 346))

;;; Test4
(framework-check #f (num-prefix 3 4))

