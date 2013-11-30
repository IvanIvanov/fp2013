(define (nth l index)
    (define (nth-iter l index elem-so-far)
        (cond
         ( (= index 0) elem-so-far)
         (else (nth-iter (cdr l) (- index 1) (car l)))))
 
   (nth-iter l index (car l)))

(define (range a b)
    (cond
        ( (> a b) (list))
        (else (cons a (range (+ a 1) b)))))

(define (first l) (nth l 1))
(define (last l) (nth l (length l)))
    
;;; функцията взима матрица и връща списък с 2 елемента с размерностите на матрицата
(define (dimension M)
    (cons (length M) (cons (length (car M)) (list) )))

;;; връща колоната с даден index
(define (get-column M index)
    (map (lambda (row) (nth row index)) M))

;;; връща главния диагонал на квадратната матрица M
(define (diagonal M)
    (map (lambda (elem index) (nth elem index)) M (range 1 (length M))))

;;; транспониране на матрица
(define (transpose M)
    (map (lambda (index) (get-column M index)) (range 1 (length (car M)))))
    
;;; предикат, който казва дали две матрици могат да бъдат умножени
;;; MxP * PxN = MxN
(define (can-multiply? M1 M2)
    (= (last (dimension M1)) (first (dimension M2))))

(define (mult-matrices M1 M2)
	(cond
		( (not (can-multiply? M1 M2)) (list))
		(else (map (lambda (row) 
                  (map (lambda (col) 
                          (apply + (map * row col)))
                  (transpose M2)))
          M1))))