(define (multiple-3-5? n)
  (or (= (remainder n 3) 0)
      (= (remainder n 5) 0)))

(define (sum-multiples-3-5-iter n i result)
  (cond ((> i n) result)
        ((multiple-3-5? i) 
         (sum-multiples-3-5-iter n (+ i 1) (+ result i)))
        (else (sum-multiples-3-5-iter n (+ i 1) result))))

(define (sum-multiples-3-5 n)
  (sum-multiples-3-5-iter n 1 0))
