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
  (let ((divisor? (lambda (x) (and (not (zero? x)) (zero? (remainder n x)))))
        (inc (lambda (x) (+ x 1)))
        (map-to-one (lambda (x) 1)))
    (filter-and-accumulate divisor? a b 0 + map-to-one inc)))
