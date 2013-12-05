(define (occur-k items k)
  (filter (lambda (x) (= (count-occurrences items x) k)) items))

(define (filter pred items)
  (cond ((null? items) '())
        ((pred (car items)) (cons (car items) (filter pred (cdr items))))
        (else (filter pred (cdr items)))))

(define (count-occurrences items x)
  (length (filter (lambda (y) (= x y)) items)))

(occur-k '(1 2 3 5 2 5) 1) ; (1 3)
(occur-k '(1 2 3 5 2 5) 2) ; (2 5 2 5)
(occur-k '(1 2 3 5 2 5) 3) ; ()
