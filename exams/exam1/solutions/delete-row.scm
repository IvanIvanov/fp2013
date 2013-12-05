(define (delete-row matrix i)
  (delete-i matrix i))

(define (delete-i items i)
  (cond ((null? items) '())
        ((= i 1) (delete-i (cdr items) (- i 1)))
        (else (cons (car items) (delete-i (cdr items) (- i 1))))))

(delete-row '((1 2 3) (4 5 6)) 1) ; ((4 5 6))
(delete-row '((1 2) (3 4) (5 6)) 2) ; ((1 2) (5 6))
