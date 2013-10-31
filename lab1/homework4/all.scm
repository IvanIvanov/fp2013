(define (all? predicate items)
  (cond ((null? items) #t)
        ((not (predicate (car items))) #f)
        (else (all? predicate (cdr items)))))
