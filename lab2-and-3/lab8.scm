(define (filter pred? l)
  (define (filter-iter l pred? result)
    (cond
      ( (null? l) result)
      ( (pred? (car l)) (filter-iter (cdr l) pred? (cons (car l) result)))
      (else (filter-iter (cdr l) pred? result))))

  (reverse (filter-iter l pred? '())))

;;; връща пъривя елемент от двойка, представена като списък от два елемента
(define (first pair) (car pair))
;;; връща втория елемент от двойка, представена като списък от два елемента
(define (second pair) (car (cdr pair)))

;;; Декартово произведение между два списъка
(define (cart l1 l2)
  (apply append (map (lambda (l1-item) (map  (lambda (l2-item) (list l1-item l2-item) )  l2)) l1)))

;;; l е списък от цели числа, n е цяло число
;;; фунцкията трябва да върне всички двойки, представени като списък от два елемента, чиято сума е равна на n
;;; тук не търсим уникалност
(define (all-pairs-that-sum-to-n l n)
  (filter (lambda (pair) (= (+ (first pair) (second pair)) n ))  (cart l l)) )
  
;;; помощни функции за unique-pairs

;;; (x,y) === (x,y) или (x,y) === (reverse (y, x))
(define (same-pairs? p1 p2)
  (or (equal? p1 p2) (equal? p1 (reverse p2))))

;;; проверяваме дали x е член на l, спрямо предиката check?
(define (member? check? l x)
  (define (member-iter check? l x result)
    (cond
      ( (null? l) result)
      ( (check? (car l) x) #t)
      (else (member-iter check? (cdr l) x #f))))
  (member-iter check? l x #f))

;;; функция, която връща всички уникални двойки
;;; L e списък от двойки, представени като списък от два елемента
;;; двойката (ai, bi) е еднаква с двойката (bi, ai) - нямаме наредба в двойките
(define (unique-pairs L)
  (define (unique-pairs-iter L result)
    (cond
      ( (null? L) result)
      ( (not (member? same-pairs? result (car L))) (unique-pairs-iter (cdr L) (cons (car L) result)))
      (else (unique-pairs-iter (cdr L) result))))
  (reverse (unique-pairs-iter L (list))))


;;; функцията групира последователните еднакви елементи в отделни групи (списъци)
;;; връща списък от списъците с отделните групи
;;; (group (list 1 1 1 2 3 2 2 5 6 6 4 4)) -> ( (1 1 1) (2) (3) (2 2) (5) (6 6) (4 4) )
(define (take-while l pred?)
  (define (take-while-iter l pred? result)
    (cond
      ((or (null? l) (not (pred? (car l)))) result)
      (else (take-while-iter (cdr l) pred? (cons (car l) result)))))

(reverse (take-while-iter l pred? '())))

(define (drop-while l pred?)
  (cond
    ( (null? l) (list))
    ( (not (pred? (car l))) l)
    (else (drop-while (cdr l) pred?))))

(define (group l)
  (define (group-iter l result)
    (cond
      ( (null? l) result)
      (else (group-iter 
             (drop-while l (lambda (x) (= x (car l)))) 
             (cons (take-while l (lambda (x) (= x (car l)))) result))))) ;;; Повтарящата се lambda може да се изнесе в letrec блок
  
  (reverse (group-iter l (list))))


;;; l e списък от числа
;;; encode връща модифициран списък от числа в следния формат:
;;; за всяка група от последователни еднакви числа, тя се кодира по следния начин : (Ei, Ci)
;;; където Ei е елемента от групата, Ci е броят на този елемент в тази група
;;; (encode (list 1 1 1 2 3 2 2 5 6 6 4 4)) -> ( (1 3) (2 1) (3 1) (2 2) (5 1) (6 2) (4 2) )
;;; елементът 1 се среща 3 пъти в първата група, елементът 2 се среща 1 път във втората група и т.н.
(define (encode l)
  (map (lambda (group) (list (car group) (length group) )) (group l)))


;;; функцията трябва да размени в дадената матрица M, редовете с индекс i и j
;;; броим индексите от 1

(define (nth list n)
  (define (nth-iter list n counter result)
    (cond
      ( (= n counter ) result )
      (else (nth-iter (cdr list) n (+ counter 1) (car list)))))
  
  (nth-iter list n 0 (car list)))

(define (range a b)
  (define (range-iter a b result)
    (cond 
      ( (> a b) result )
      (else (range-iter (+ a 1) b (cons a result)))))
  (reverse (range-iter a b '())))

(define (swap-rows M i j)
  (let
      ( (ith-row (nth M i))
        (jth-row (nth M j)))
    (map (lambda (row index) 
           (cond
                  ( (= index i) jth-row ) 
                  ( (= index j) ith-row )
                  (else row)))
         M (range 1 (length M)))
  ))