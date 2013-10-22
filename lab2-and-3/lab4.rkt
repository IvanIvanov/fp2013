(define (empty? list) (null? list))

(define (first list)
  (car list))

; първа възможна имплементация
(define (last1 list)
  (first (reverse list)))

(define (last list)
  (define (last-iter list result)
    (cond
      ( (null? list) result )
      (else (last-iter (cdr list) (car list))))
      )
  (last-iter list (car list)))

; Каква рекурсия е това ?
(define (length-list list)
  (cond
    ( (null? list) 0 )
    (else (+ 1 (length (cdr list))))))

(define (range a b)
  (define (range-iter a b result)
    (cond 
      ( (> a b) result )
      (else (range-iter (+ a 1) b (cons a result)))))
  (reverse (range-iter a b '())))

(define (range-rec a b)
  (cond 
    ( (> a b) '())
    (else (cons a (range-rec (+ a 1) b)))))

(define (nth list n)
  (define (nth-iter list n counter result)
    (cond
      ( (= n counter ) result )
      (else (nth-iter (cdr list) n (+ counter 1) (car list)))))
  
  (nth-iter list n 0 (car list)))

(define (reverse2 l)
  (define (reverse-iter list result)
    (cond
      ( (null? list) result)
      (else (reverse-iter (cdr list) (cons (first list) result)))))
    (reverse-iter l '()))


(define (add-last elem l)
  (append l (list elem)))


(define (equal-lists? l1 l2)
  (define (equal-lists-iter l1 l2 result)
    (cond
      ( (not (= (length l1) (length l2))) #f )
      ( (null? l1) result )
      (else (equal-lists-iter (cdr l1) (cdr l2)  (and result (= (car l1) (car l2))) ))))
  (equal-lists-iter l1 l2 #t))

(define (take l n)
  (define (take-iter l n result)
    (cond
      ( (= n 0) result )
      (else (take-iter (cdr l) (- n 1) (cons (car l) result)))
      ))
  
  (reverse (take-iter l n '())))

(define (identity x) x)

(define (map2 l f)
  (define (map2-iter l f result)
    (cond
      ( (null? l) result )
      (else (map2-iter (cdr l) f (add-last (f (car l)) result))) ; ако ползваме cons, ще трябва да го reverse-нем. За това може да ползваме написаното add-last
      ))
  (map2-iter l f '()))