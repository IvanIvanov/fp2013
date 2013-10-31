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
(load "exponential-to-n.scm")



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
; Ако ви го покаже като смесена дроб, натиснете на нея и изберете по какъв начин искате да се визуализира
(framework-check-aprox 1 (exponential-to-n 0 10))
(framework-check-aprox 2.7182818284590452353602874 (exponential-to-n 1 200))
(framework-check-aprox 7.3890560989306502272304274 (exponential-to-n 2 200))
(framework-check-aprox 22026.4657948067165169579006452 (exponential-to-n 10 1000))
