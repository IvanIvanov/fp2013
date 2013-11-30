(define (sublist list1 list2)
  (cond ((prefix list1 list2) #t)
        ((null? list2) #f)
        (else (sublist list1 (cdr list2)))))

(define (prefix list1 list2)
  (cond ((null? list1) #t)
        ((null? list2) #f)
        ((= (car list1) (car list2)) (prefix (cdr list1) (cdr list2)))
        (else #f)))

(sublist '(1 2 3) '(1 2 3 4 5)) ; #t
(sublist '(3 4 5) '(1 2 3 4 5)) ; #t
(sublist '(2 3 4) '(1 2 3 4 5)) ; #t
(sublist '(1 2 4) '(1 2 3 4 5)) ; #f
