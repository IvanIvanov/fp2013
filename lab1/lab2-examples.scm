;;; (if <predicate> <consequent> <alternative>)
;;;
;;; (cond (<p1> <e1>)
;;;       (<p2> <e2>)
;;;       ...
;;;       (<pn> <en>))

(define (abs1 x)
  (if (< x 0)
      (- x)
      (if (> x 0)
          x
          0)))

(define (abs2 x)
  (cond ((< x 0) (- x))
        ((= x 0) 0)
        ((> x 0) x)))

;;; Non tail recursive implementation of factorial.
(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))

;;; Tail recursive implementation of factorial.
(define (fact2 n)
  (fact-iter n 1 1))

(define (fact-iter n i result)
  (if (> i n)
      result
      (fact-iter n (+ i 1) (* result i))))

;;; The "shape" of the processes that the 2 implementations generate.
;;;
;;; (fact 3)
;;; (* 3 (fact 2))
;;; (* 3 (* 2 (fact 1)))
;;; (* 3 (* 2 (* 1 (fact 0))))
;;; (* 3 (* 2 (* 1 1)))
;;; (* 3 (* 2 1))
;;; (* 3 2)
;;; 6
;;;
;;; (fact1 3)
;;; (fact-iter 3 1 1)
;;; (fact-iter 3 2 1)
;;; (fact-iter 3 3 2)
;;; (fact-iter 3 4 6)
;;; 6

;;; Sum of integers in the range [a, b] - without tail recursion.
(define (sum a b)
  (if (> a b)
      0
      (+ a (sum (+ a 1) b))))

;;; Sum of integers in the range [a, b] - with tail recursion.
(define (sum2 a b)
  (sum-iter a b 0))

(define (sum-iter a b result)
  (if (> a b)
      result
      (sum-iter (+ a 1) b (+ a result))))

;;; Built-in division operators.
(quotient 10 3)  ; 3
(remainder 10 3) ; 1

;;; Finds the sum of all base-10 digits of a non-negative integer x.
(define (sum-of-digits x)
  (if (= x 0)
      0
      (+ (remainder x 10)
         (sum-of-digits (quotient x 10)))))

;;; Checks if a is divisible by b. 
(define (divisible? a b)
  (= (remainder a b) 0))

;;; Finds the sum of all divisors of a non-negative integer n.
(define (sum-of-divisors n)
  (sum-of-divisors-iter n 1 0))

(define (sum-of-divisors-iter n i result)
  (cond ((> i n) result)
        ((divisible? n i) (sum-of-divisors-iter n (+ i 1) (+ result i)))
        (else (sum-of-divisors-iter n (+ i 1) result))))

;;; Checks if a non-negative integer is prime.
(define (is-prime? n)
  (is-prime-iter? n 2))

(define (is-prime-iter? n i)
  (cond ((>= i n) (>= n 2))
        ((divisible? n i) #f)
        (else (is-prime-iter? n (+ i 1)))))

;;; Finds the sum of all prime numbers in the range [a, b].
(define (sum-of-primes a b)
  (cond ((> a b) 0)
        ((is-prime? a) (+ a (sum-of-primes (+ a 1) b)))
        (else (sum-of-primes (+ a 1) b))))

;;; Finds the sum of all prime numbers in the range [a, b] - tail recursive.
(define (sum-of-primes2 a b)
  (sum-of-primes-iter a b 0))

(define (sum-of-primes-iter a b result)
  (cond ((> a b) result)
        ((is-prime? a) (sum-of-primes-iter (+ a 1) b (+ result a)))
        (else (sum-of-primes-iter (+ a 1) b result))))
