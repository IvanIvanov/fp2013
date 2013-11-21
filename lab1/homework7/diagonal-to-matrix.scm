(define (zeros n)
  (if (= n 0)
      '()
      (cons 0 (zeros (- n 1)))))

(define (add-zero items)
  (cons 0 items))

(define (diagonal-to-matrix diagonal)
  (if (null? diagonal)
      '()
      (cons (cons (car diagonal)
                  (zeros (- (length diagonal) 1)))
            (map (lambda (row) (add-zero row))
                 (diagonal-to-matrix (cdr diagonal))))))

(diagonal-to-matrix '(1)) ; ((1))
(diagonal-to-matrix '(1 2 3)) ; ((1 0 0) (0 2 0) (0 0 3))
(diagonal-to-matrix '(1 1 1 1 1)) ; ((1 0 0 0 0) (0 1 0 0 0) (0 0 1 0 0) (0 0 0 1 0) (0 0 0 0 1))
