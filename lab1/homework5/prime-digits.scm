(define (digits num)
  (cond ((= num 0) '(0))
        ((< num 10) (list num))
        (else (append (digits (quotient num 10))
                      (list (remainder num 10))))))

(define (divisible? a b)
  (= (remainder a b) 0))

(define (is-prime-iter? n i)
  (cond ((>= i n) (>= n 2))
        ((divisible? n i) #f)
        (else (is-prime-iter? n (+ i 1)))))

(define (is-prime? n)
  (is-prime-iter? n 2))

(define (filter pred items)
  (cond ((null? items) '())
        ((pred (car items)) 
         (cons (car items) (filter pred (cdr items))))
        (else (filter pred (cdr items)))))

(define (prime-digits num)
  (filter is-prime? (digits num)))
