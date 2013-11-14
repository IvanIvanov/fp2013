;;; Solution to problem.
(define (accumulate op initial items)
  (if (null? items)
      initial
      (op (car items) (accumulate op initial (cdr items)))))

(define (cartesian-product list1 list2)
  (accumulate append
              '()
              (map (lambda (x)
                     (map (lambda (y) (list x y)) list2))
                   list1)))

(cartesian-product '() '()) ; ()
(cartesian-product '(1 2) '(a b)) ; ((1 a) (1 b) (2 a) (2 b)
(cartesian-product '(1) '(a b c d)) ; ((1 a) (1 b) (1 c) (1 d))

;;; End of solution.

;;; Here be dragons!

;;; Solution to the more general problem of finding the cartesian product
;;; of n lists. The lists parameter is the list of lists who's cartesian
;;; product is computed.
(define (cartesian-product2 lists)
  (cond ((null? lists) '())
        ((null? (cdr lists)) (map list (car lists)))
        (else (let ((tmp (cartesian-product2 (cdr lists))))
                (accumulate append
                            '()
                            (map (lambda (x)
                                   (map (lambda (y) (cons x y)) tmp))
                                 (car lists)))))))

(cartesian-product2 '((1 2) (a b) (x y)))
