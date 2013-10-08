(define (square n) (* n n))

(define (triangle? a b c)
  (and (> (+ a b) c) (> (+ b c) a) (> (+ a c) b)))

(define (pythagoraean? a b c)
  (= (square c) (+ (square a) (square b))))

(define (right-angle-area a b)
  (/ (* a b) 2))

(define (half-p a b c)
  (/ (+ a b c) 2))

(define (heron-area a b c)
  (define p (half-p a b c))
  (sqrt (* p (- p a) (- p b) (- p c))))

(define (area-of-triangle a b c)
  (cond
    ( (not (triangle? a b c)) 0 )
    ( (pythagoraean? a b c) (right-angle-area a b) )
    (else (heron-area a b c) )))