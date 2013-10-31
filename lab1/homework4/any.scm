(define (any? predicate items)
  (cond ((null? items) #f)
        ((predicate (car items)) #t)
        (else (any? predicate (cdr items)))))
