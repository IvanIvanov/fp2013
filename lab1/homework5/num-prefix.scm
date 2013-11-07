(define (digits num)
  (cond ((= num 0) '(0))
        ((< num 10) (list num))
        (else (append (digits (quotient num 10))
                      (list (remainder num 10))))))

(define (prefix list1 list2)
  (cond ((null? list1) #t)
        ((null? list2) #f)
        ((equal? (car list1) (car list2)) (prefix (cdr list1) (cdr list2)))
        (else #f)))

(define (num-prefix num1 num2)
  (prefix (digits num1) (digits num2)))
