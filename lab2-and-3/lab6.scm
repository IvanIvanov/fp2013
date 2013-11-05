(define matr (list 
    (list 1 2 3)
    (list 4 5 6) 
    (list 7 8 9)))
 
(define E (list (list 1 0 0) (list 0 1 0) (list 0 0 1)))


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
    
;;; предикат, който казва дали две матрици могат да бъдат умножени
;;; MxP * PxN = MxN
(define (can-multiply? M1 M2)
    (= (last (dimension M1)) (first (dimension M2))))


;;; фунция, която връща даден ред (от индекс 1) на матрица
(define (get-row M index)
    (nth M index)) 
      
;;; връща колоната с даден index
(define (get-column M index)
    (map (lambda (row) (nth row index)) M))

;;; връща главния диагонал на квадратната матрица M
(define (diagonal M)
    (map (lambda (elem index) (nth elem index)) M (range 1 (length M))))

;;; транспониране на матрица
(define (transpose M)
    (map (lambda (index) (get-column M index)) (range 1 (length M))))


;;; функция, която събира две матрици с еднакви размери
(define (add-matrices M1 M2)
    (map (lambda (row1 row2) (map + row1 row2)) M1 M2))

;;; функция, която умножава матрица със скалар
(define (scalar-mult M scalar)
    (map (lambda (row) (map (lambda (x) (* x scalar)) row)) M))

;;; проверява дали матрицата е коректна (не е jagged)
(define (correct? M)
    (= (* (length M) (length (car M))) (apply + 0 (map (lambda (row) (length row)) M))))
