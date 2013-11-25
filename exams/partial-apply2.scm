(define (partial-apply2 f a1)
  (lambda (x) (f a1 x)))

((partial-apply2 + 0) 10) ; 10
((partial-apply2 + 1) 10) ; 11
((partial-apply2 min 5) 3) ; 3
((partial-apply2 min 5) 8) ; 5
