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
