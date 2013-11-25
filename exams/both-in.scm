(define (both-in f g start end)
  (lambda (x)
    (and (in-interval (f x) start end)
         (in-interval (g x) start end))))

(define (in-interval x a b)
  (and (<= a x) (>= b x)))

(both-in (lambda (x) (* x 2)) (lambda (x) (* x 3)) -10 10) ; #<procedure:...>
((both-in (lambda (x) (* x 2)) (lambda (x) (* x 3)) -10 10) 1) ; #t
((both-in (lambda (x) (* x 2)) (lambda (x) (* x 3)) -10 10) 2) ; #t
((both-in (lambda (x) (* x 2)) (lambda (x) (* x 3)) -10 10) 3) ; #t
((both-in (lambda (x) (* x 2)) (lambda (x) (* x 3)) -10 10) 4) ; #f
