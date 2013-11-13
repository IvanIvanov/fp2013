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
(load "steam-ironing.scm")
(load "queue.scm")
(load "zip.scm")



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

(announce "Testing steam-ironing")

(framework-check
 (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14)
 (steam-ironing (list 
                  (list 1 (list (list 2 3) 4 5) (list 6 (list 7 (list 8 (list 9) 10)))) 
                  (list (list 11 12) (list 13) (list (list 14))))))

(framework-check
 (list)
 (steam-ironing (list (list) (list) (list))))

(announce "Testing queue")

(framework-check #t (queue-empty? (queue-make)))
(framework-check #f (queue-empty? (queue-add (queue-make) 5)))
(framework-check 5 (queue-length (queue-add (queue-make) 1 2 3 4 5)))

( (lambda (Q)
    (set! Q (queue-add Q 1 2 3))
    (let* (
          (first-pop (queue-pop Q))
          (second-pop (queue-pop (cadr first-pop)))
          (third-pop (queue-pop (cadr second-pop)))
          )
      (framework-check 1 (car first-pop))
      (framework-check 2 (car second-pop))
      (framework-check 3 (car third-pop))
      (framework-check #t (queue-empty? (cadr third-pop)))
      )
 ) (queue-make))

(announce "Testing zip")

(framework-check (list) (zip (list) (list)))
(framework-check (list (list 1 'a) (list 2 'b)) (zip (list 1 2) (list 'a 'b)))
(framework-check (list (list 1 10) (list 2 20) (list 3 30)) (zip (list 1 2 3) (list 10 20 30)))
