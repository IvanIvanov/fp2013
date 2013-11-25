(define (divisible? a b)
  (= 0 (remainder a b)))

(define (count-divisors x)
  (count-divisors-iter x 1 0))

(define (count-divisors-iter x i result)
  (cond ((> i x) result)
        ((divisible? x i) (count-divisors-iter x (+ i 1) (+ result 1)))
        (else (count-divisors-iter x (+ i 1) result))))

(define (oddly? x)
  (odd? (count-divisors x)))

(define (sum-of-oddly a b)
  (cond ((> a b) 0)
        ((oddly? a) (+ a (sum-of-oddly (+ a 1) b)))
        (else (sum-of-oddly (+ a 1) b))))

(sum-of-oddly 1 10)    ; 14
(sum-of-oddly 100 200) ; 730
(sum-of-oddly 1 42)    ; 91
