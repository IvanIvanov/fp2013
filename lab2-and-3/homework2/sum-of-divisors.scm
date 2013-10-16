(define (is-devisible? a n)
  (= (remainder a n) 0))

(define (sum-of-divisors n)
  (define (sum-of-divisors-iter n current-divisor result)
    (cond
      ( (< n current-divisor) result )
      ( (is-devisible? n current-divisor) (sum-of-divisors-iter n (+ current-divisor 1) (+ result current-divisor) ) )
      (else (sum-of-divisors-iter n (+ current-divisor 1) result ))))
  (sum-of-divisors-iter n 1 0))