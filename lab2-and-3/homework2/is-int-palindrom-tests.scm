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
(load "is-int-palindrom.scm")



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

(define (framework-check-bool expected-value return-value)
  (if (equal? expected-value return-value)
      (__test-passed)
      (__test-failed)))

;;; Dragons no more!
;;; End of the "test framework" code.


;;; The test cases follow:

;;; Test1
(framework-check-bool #t (is-int-palindrom? 0))
(framework-check-bool #t (is-int-palindrom? 1))
(framework-check-bool #t (is-int-palindrom? 2))
(framework-check-bool #t (is-int-palindrom? 5))
(framework-check-bool #f (is-int-palindrom? 10))
(framework-check-bool #t (is-int-palindrom? 101))
(framework-check-bool #t (is-int-palindrom? 10101))
(framework-check-bool #f (is-int-palindrom? 123123))
(framework-check-bool #t (is-int-palindrom? 666))
(framework-check-bool #f (is-int-palindrom? 1230912098312030912309129873821))