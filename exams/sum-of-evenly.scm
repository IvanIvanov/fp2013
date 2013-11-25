(define (divisible? a b)
  (= 0 (remainder a b)))

(define (count-divisors x)
  (count-divisors-iter x 1 0))

(define (count-divisors-iter x i result)
  (cond ((> i x) result)
        ((divisible? x i) (count-divisors-iter x (+ i 1) (+ result 1)))
        (else (count-divisors-iter x (+ i 1) result))))

(define (evenly? x)
  (even? (count-divisors x)))

(define (sum-of-evenly a b)
  (cond ((> a b) 0)
        ((evenly? a) (+ a (sum-of-evenly (+ a 1) b)))
        (else (sum-of-evenly (+ a 1) b))))

(sum-of-evenly 1 10) ; 41
(sum-of-evenly 100 200) ; 14420
(sum-of-evenly 1 42) ; 812
