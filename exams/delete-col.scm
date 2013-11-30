(define (delete-col matrix i)
  (map (lambda (row) (delete-i row i)) matrix))

(define (delete-i items i)
  (cond ((null? items) '())
        ((= i 1) (delete-i (cdr items) (- i 1)))
        (else (cons (car items) (delete-i (cdr items) (- i 1))))))

(delete-col '((1 2 3) (4 5 6)) 1) ; ((2 3) (5 6))
(delete-col '((1 2) (3 4) (5 6)) 2) ; ((1) (3) (5))
