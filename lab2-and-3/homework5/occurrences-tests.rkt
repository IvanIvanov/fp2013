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
(load "occurrences.rkt")



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

;;; Dragons no more!
;;; End of the "test framework" code.


;;; The test cases follow:
(framework-check (list 2 1 0) (occurrences (list 1 2 3) (list 1 2 4 1))) ;;; (2 1 0)
(framework-check (list 0 0 0) (occurrences (list 2 2 2) (list 0 5 6))) ;;; (0 0 0)
(framework-check (list 12 12 12) (occurrences (list 2 2 2) (list 2 2 2 2 2 2 2 2 2 2 2 2))) ;;; (12 12 12)
(framework-check (list) (occurrences (list) (list 2 2 2 2 2 2 2 2 2 2 2 2))) ;;; ()
(framework-check (list 0 0 0) (occurrences (list 2 3 4) (list))) ;;; (0 0 0)