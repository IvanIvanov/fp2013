;;; ползване на let
;;; let се използва за дефиниране на локални стойности
;;; този израз ще върне 30
(let (
      (x 5)
      (y 6)
      )
  (* x y))

(define (filter l pred?)
  (define (filter-iter l pred? result)
    (cond
      ( (null? l) result)
      ( (pred? (car l)) (filter-iter (cdr l) pred? (cons (car l) result)))
      (else (filter-iter (cdr l) pred? result))))

  (reverse (filter-iter l pred? '())))

(define (all? l pred?)
  (= (length (filter l pred?)) (length l)))

;;; let* ни позволява да използваме една локална дефиниция в дефинирането на друга
(define (correct? M)
  (let*
      ( 
       (list-of-lengths (map length M))
       (first-length (car list-of-lengths))
      )
      (all? list-of-lengths (lambda (x) (= x first-length)))))

(correct? (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(correct? (list (list 1 2 3) (list 4 5 6) (list 7 8 9 10)))

;;; създаване на closure и използване на мутираща функция (set!)
;;; Повече информация за closures - http://en.wikipedia.org/wiki/Closure_%28computer_science%29
;;; Closures в JavaScript - https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Closures
;;; Closures в Python - http://www.shutupandship.com/2012/01/python-closures-explained.html
(define (make-counter x)
  (lambda () (set! x (+ x 1)) x))

(define counter (make-counter 0))
(counter) ;;; 1
(counter) ;;; 2
(counter) ;;; 3

;;; Задачите за двоични дървета са подробно описани тук - http://fmi.wikidot.com/fpptreesandgraphs

;;; Функция, която проверява дали даден аргумент е атом:
(define (atom? x) (not (pair? x)))