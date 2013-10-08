;; Utils

(define (cassie/filter predicate? list)
  (cond ((null? list) '())
        ((predicate? (car list)) (cons (car list) (cassie/filter predicate? (cdr list))))
        (else (cassie/filter predicate? (cdr list)))))

(define (cassie/true? expr)
  (equal? expr #t))

(define (cassie/false? expr)
  (equal? expr #f))

;; Reports and statistics

(define (cassie/success-report assertion)
  (display " Passed Assertion!") (newline)

  (newline))

(define (cassie/failure-report expression expected actual)
  (display " Failed Assertion!") (newline)

  (display "   Expression: ")
  (write expression) (newline)

  (display "   Expected: ")
  (write expected) (newline)

  (display "   Actual: ")
  (write actual) (newline)

  (newline))

(define (cassie/report success? data)
  (let ((expression (car data))
        (actual     (cadr data))
        (expected   (caddr data)))
    (if (not success?) (cassie/failure-report expression expected actual))))

(define (cassie/stats passed failed)
  (display " Final Results:")
  (newline)

  (display (string-append "   Assertions: " (number->string (+ passed failed))))
  (newline)

  (display (string-append "   Passed: " (number->string passed)))
  (newline)

  (display (string-append "   Failed: " (number->string failed)))
  (newline))

;; Core

(define-syntax assert
  (syntax-rules ()
    ((assert expression expected)
     (let* ((actual expression)
            (passed? (equal? actual expected)))
       (cassie/report passed? (list 'expression actual expected))
       passed?))))

(define-syntax define-test
  (syntax-rules ()
    ((define-test name assertion ...)
     (define (name)
       (list assertion ...)))))

(define-syntax run-tests
  (syntax-rules ()
    ((run-tests tests ...)
     (let* ((results (append (tests) ...))
            (passed (length (cassie/filter cassie/true? results)))
            (failed (length (cassie/filter cassie/false? results))))
       (cassie/stats passed failed)))))
