;;; Count the number of pairs (i, j), where 1 <= i < j <= n such
;;; that (i + j) is divisible by k ((i + j) mod k = 0).
(define (count-pairs n k)
  (count-pairs-iter n 1 2 k 0))

(define (count-pairs-iter n i j k result)
  (cond ((> i n) result)
        ((> j n) (count-pairs-iter n (+ i 1) (+ i 2) k result))
        ((divisible? (+ i j) k) (count-pairs-iter n i (+ j 1) k (+ result 1)))
        (else (count-pairs-iter n i (+ j 1) result))))

(define (divisible? a b)
  (= (remainder a b) 0))

;;; Sum of all integers from [a, b].
(define (int-sum a b)
  (if (> a b)
      0
      (+ a (int-sum (+ a 1) b))))

;;; Sum of all squares of integers from [a, b].
(define (sq-sum a b)
  (if (> a b)
      0
      (+ (square a) (sq-sum (+ a 1) b))))

(define (square x)
  (* x x))

;;; Generic higher-order sum function.
(define (sum f a b)
  (if (> a b)
      0
      (+ (f a) (sum f (+ a 1) b))))

;;; Sum of all integers from [a, b] - alternative implementation.
(define (int-sum2 a b)
  (sum (lambda (x) x) a b))

;;; Sum of all squares of integers from [a, b] - alternative implementation.
(define (sq-sum2 a b)
  (sum square a b))

;;; Even more general higher-order sum function.
(define (sum2 f a next b)
  (if (> a b)
      0
      (+ (f a) (sum2 f (next a) next b))))

;;; Sum of all integers from [a, b] - alternative implementation.
(define (int-sum3 a b)
  (sum2 (lambda (x) x)
        a
        (lambda (x) (+ x 1))
        b))

;;; Sum of all squares of integers from [a, b] - alternative implementation.
(define (sq-sum3 a b)
  (sum2 square
        a
        (lambda (x) (+ x 1))
        b))

;;; Tail recursive implementation of general higher-order sum function.
(define (sum4 f a next b)
  (sum-iter f a next b 0))

(define (sum-iter f a next b result)
  (if (> a b)
      result
      (sum-iter f (next a) next b (+ result (f a)))))

;;; General higher-order product function.
(define (product f a next b)
  (if (> a b)
      1
      (* (f a) (product f (next a) next b))))

;;; Factorial implemented with the help of product.
(define (fact n)
  (product (lambda (x) x)
           1
           (lambda (x) (+ x 1))
           10))

;;; Function for finding the definite integral of a function f in [a, b].
;;; The implementation uses the rectangles method:
;;;
;;;    integral_a_b(f(x)dx) = 
;;;        [f(a + dx/2) + f(a + dx + dx/2) + f(a + 2dx + dx/2) + ...] * dx
;;;
(define (integrate f a b dx)
  (* (sum2 f
           (+ a (/ dx 2.0))
           (lambda (x) (+ x dx))
           b)
     dx))

;;; integral(x^2 dx) = (x^3) / 3.
(integrate square 0 3 0.001) ; ~ 9

;;; Derivatives as higher-order functions:
;;;    f    ::  Num -> Num
;;;    d/dx :: (Num -> Num) -> (Num -> Num)
;;;
;;;    df/dx = lim_dx->0 (f(x + dx) - f(x)) / dx
;;;

;;; Higher-order function that takes a function f and returns
;;; a new function that is it's derivative.
(define (derivative f)
  (lambda (x)
    (/ (- (f (+ x 0.0000001)) (f x))
       0.0000001)))

;;; d(x^2)/dx = 2x
((derivative square) 5) ; ~ 10

;;; Function composition as a higher-order function.
(define (compose f g)
  (lambda (x)
    (f (g x))))

;;; 2^4 = 16
((compose square square) 2) ; 16
