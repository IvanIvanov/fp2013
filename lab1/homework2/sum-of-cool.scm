(define (divisible? a b)
  (= (remainder a b) 0))

(define (is-prime-iter? n i)
  (cond ((>= i n) (>= n 2))
        ((divisible? n i) #f)
        (else (is-prime-iter? n (+ i 1)))))

(define (is-prime? n)
  (is-prime-iter? n 2))

(define (sum-of-divisors-iter n i result)
  (cond ((> i n) result)
        ((divisible? n i) (sum-of-divisors-iter n (+ i 1) (+ result i)))
        (else (sum-of-divisors-iter n (+ i 1) result))))

(define (sum-of-divisors n)
  (sum-of-divisors-iter n 1 0))

(define (is-cool? n)
  (is-prime? (sum-of-divisors n)))

(define (sum-of-cool a b)
  (cond ((> a b) 0)
        ((is-cool? a) (+ a (sum-of-cool (+ a 1) b)))
        (else (sum-of-cool (+ a 1) b))))
