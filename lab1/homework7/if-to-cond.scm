(define (if-to-cond program)
  (cond ((null? program) '())
        ((not (pair? program)) program)
        ((eq? (car program) 'if)
         (list 'cond
               (list (if-to-cond (cadr program)) (if-to-cond (caddr program)))
               (list 'else (if-to-cond (cadddr program)))))
        (else (cons (if-to-cond (car program))
                    (if-to-cond (cdr program))))))

(if-to-cond '(if (= foo bar)
                 42
                 7)) ; (cond ((= foo bar) 42) (else 7))

(if-to-cond '(define (fib n)
               (if (<= n 1)
                   n
                   (+ (fib (- n 1)) (fib (- n 2))))))

; (define (fib n) (cond ((<= n 1) n) (else (+ (fib (- n 1)) (fib (- n 2)))))

(if-to-cond '(define (my-abs x)
               (if (< x 0)
                   (- x)
                   (if (= x 0)
                       0
                       x))))

; (define (my-abs x) (cond ((< x 0) (- x)) (else (cond ((= x 0) 0) (else x)))))