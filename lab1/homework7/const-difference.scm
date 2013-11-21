(define (const-difference list1 list2)
  (cond ((null? list1) #t)
        ((null? (cdr list1)) #t)
        ((= (- (car list1) (car list2))
            (- (cadr list1) (cadr list2)))
         (const-difference (cdr list1) (cdr list2)))
        (else #f)))

(const-difference '(1 2 3) '(1 2 3)) ; #t
(const-difference '(1 2 3) '(11 12 13)) ; #t
(const-difference '(1 2 3) '(11 12 14)) ; #f
