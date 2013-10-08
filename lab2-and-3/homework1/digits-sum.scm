(define (digits-sum n)
  (cond
    ( (= n 0) 0)
    (else (+ (remainder n 10) (digits-sum (quotient n 10))))))