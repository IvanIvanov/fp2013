;;; Solution 1:
(define (deepest-atom tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 0)
        (else (max (+ 1 (deepest-atom (car tree)))
                   (deepest-atom (cdr tree))))))

;;; Solution 2:
;(define (deepest-atom tree)
;  (cond ((null? tree) 0)
;        ((not (pair? tree)) 0)
;        (else (+ 1 (max-element (map deepest-atom tree))))))

;(define (max-element items)
;  (apply max items))


(deepest-atom '(1 2 3)) ; 1
(deepest-atom '(1 (2 (3 4)) 5)) ; 3
(deepest-atom '(1 (2 3 (4 5)))) ; 3
