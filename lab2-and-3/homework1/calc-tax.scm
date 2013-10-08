(define (between? value start end)
  (and (>= value start) (<= value end)))

(define (tax amount percent)
  (* (/ percent 100) amount))

(define (calc-tax amount)
  (cond ((> amount 48000) (+ (tax (- amount 48000) 40) (calc-tax 48000)))
        ((between? amount 8000 48000) (+ (tax (- amount 8000) 20) (calc-tax 7999)))
        (else 0)))