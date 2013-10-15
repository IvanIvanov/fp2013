(define (calc-tax amount)
  (if (<= amount 8000)
      0
      (if (<= amount 48000)
          (* 0.2 (- amount 8000))
          (+ (* 0.2 40000)
             (* 0.4 (- amount 48000))))))

