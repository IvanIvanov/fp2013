(define (zip list1 list2)
  (if (null? list1)
      '()
      (cons (list (car list1) (car list2))
            (zip (cdr list1) (cdr list2)))))

(zip '() '()) ; ()
(zip '(1 2) '(a b)) ; ((1 a) (2 b))
(zip '(1 2 3) '(10 20 30)) ; ((1 10) (2 20) (3 30))
