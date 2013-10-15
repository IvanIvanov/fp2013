(define (glue-ints a b)
  (+ (* a 10) b))

(define (reverse-int n)
  (define (reverse-int-iter n result)
    (cond
      ( (= n 0) result )
      (else (reverse-int-iter (quotient n 10) (glue-ints result (remainder n 10) )))))
  (reverse-int-iter n 0))

(define (is-int-palindrom? n)
  (= (reverse-int n) n))