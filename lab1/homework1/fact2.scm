(define (fact2 n)
  (if (<= n 1)
      1
      (* n (fact2 (- n 2)))))
