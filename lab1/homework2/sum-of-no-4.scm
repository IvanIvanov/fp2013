(define (contains-4? n)
  (cond ((= n 0) #f)
        ((= (remainder n 10) 4) #t)
        (else (contains-4? (quotient n 10)))))

(define (sum-of-no-4-iter n i result)
  (cond ((> i n) result)
        ((contains-4? i) (sum-of-no-4-iter n (+ i 1) result))
        (else (sum-of-no-4-iter n (+ i 1) (+ result i)))))

(define (sum-of-no-4 n)
  (sum-of-no-4-iter n 1 0))
