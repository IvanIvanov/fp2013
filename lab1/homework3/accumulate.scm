(define (accumulate op null-value f a next b)
  (if (> a b)
      null-value
      (op (f a)
          (accumulate op null-value f (next a) next b))))

(accumulate +
            0
            (lambda (x) x)
            1
            (lambda (x) (+ x 1))
            10)

(accumulate *
            1
            (lambda (x) x)
            1
            (lambda (x) (+ x 1))
            10)

