(define (accumulate a b null-value operator f next)
  (let loop ((current a) (accumulated null-value))
    (if (> current b)
        accumulated
        (loop (next current) (operator accumulated (f current))))))

(define (filter-and-accumulate pred? a b null-value operator f next)
  (let loop ((current a) (accumulated null-value))
    (cond ((> current b) accumulated)
          ((pred? current) (loop (next current) (operator accumulated (f current))))
          (else (loop (next current) accumulated)))))

(define (divisor-count n a b)
  (let ((divisor-of-n? (lambda (x) (and (not (zero? x)) (zero? (remainder n x)))))
        (number->1     (lambda (_) 1))
        (inc           (lambda (x) (+ x 1))))
    (filter-and-accumulate divisor-of-n? a b 0 + number->1 inc)))
