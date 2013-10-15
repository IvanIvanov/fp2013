(define (is-devisible? a n)
  (= (remainder a n) 0))

(define (is-prime? n)
  (define (is-prime-iter? n i)
    (cond
      ( (= n 1) #f )
      ( (= i n)  #t )
      ( (is-devisible? n i) #f)
      ( else (is-prime-iter? n (+ i 1)) )))
  (is-prime-iter? n 2))


(define (sum-of-primes-in-range start end)
  (define (sum-of-primes-in-range-iter start end result)
    (cond
      ( (> start end) result  )
      ( (is-prime? start) (sum-of-primes-in-range-iter (+ start 1) end (+ start result))   )
      (else (sum-of-primes-in-range-iter (+ start 1) end result) )))
  (sum-of-primes-in-range-iter start end 0))

(sum-of-primes-in-range 0 10) ; 17
(sum-of-primes-in-range 8 10) ; 0
(sum-of-primes-in-range 100 200) ; 3167
(sum-of-primes-in-range 0 10000) ; 5736396