; (x-2)^2
(define (test-f1 x)
  (expt (- x 2) 2))

; (x^3 - 2) / x
(define (test-f2 x)
  (/ (- (expt x 3) 2) x))

; x^2 + 5x - 6
(define (test-f3 x)
  (- (+ (expt x 2) (* 5 x)) 6))


(define (min-value-of func)
  (define (min-value-in-interval-iter a b result)

    ; тази функция проверява дали f(a+1) < f(a) и връща a или a+1
    (define (calc-next-result next-val prev-result)
      (cond
        ( (< (func next-val) (func prev-result) ) next-val)
        (else prev-result)))

    (cond
      ( (> a b) result )
      (else (min-value-in-interval-iter (+ a 1) b (calc-next-result a result)))))

  ; връщаме ламбда функция като резултат
  (lambda (a b)
    (min-value-in-interval-iter a b a)))

( (min-value-of test-f1) 0 2) ;2
( (min-value-of test-f2) -5 -1) ;-1
( (min-value-of test-f3) -100 100) ;-3
