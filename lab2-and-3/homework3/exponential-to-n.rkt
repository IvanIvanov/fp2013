(define (TRUTH x) #t)
(define (identity x) x)

; тук term_function е функция на два аргумента
; x и n
; също така, aggregate Приема x стойност, за която да сметне директно
(define (aggregate oper N term_function pred? start_value x-value)
  (define (calculate-result result N x-value oper term_function)
    (oper (term_function x-value N) result))
  
  (define (aggregate-iter oper N term_function pred? x-value result)
    (cond
      ( (= N 0) result )
      ( (not (pred? N)) (aggregate-iter oper (- N 1) term_function pred? x-value result) )
      (else (aggregate-iter oper (- N 1) term_function pred? x-value (calculate-result result N x-value oper term_function)))))
  
  (aggregate-iter oper N term_function pred? x-value start_value)
  )


(define (exponential-to-n x n)
  (define (fact n)
    (aggregate * n (lambda (x n) n) TRUTH 1 1))
  (define (e-to-x-term x n)
    (/ (expt x n) (fact n)))

  (+ 1 (aggregate + n e-to-x-term TRUTH 0 x)))


; Ако ви го покаже като смесена дроб, натиснете на нея и изберете по какъв начин искате да се визуализира
(exponential-to-n 0 10) ; 1
(exponential-to-n 1 200) ; #e2.7182818284590452353602874...
(exponential-to-n 2 200) ; #e7.3890560989306502272304274...
(exponential-to-n 10 1000) ; #e22026.4657948067165169579006452...