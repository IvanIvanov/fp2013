;;; Задачата не беше коректно зададена,
;;; така че не обръщайте особено внимание на решението

(define (queue-make)
  (list))
 
(define (queue-add Q . args)
  (append Q args))
 
(define (queue-empty? Q)
  (null? Q))
 
(define (drop l n)
  (reverse (take (reverse l) (- (length l) n))))
 
(define (take l n)
  (cond
    ((or (null? l) (<= n 0)) '())
    (else (cons (car l) (take (cdr l) (- n 1))))))

(define (queue-pop Q)
  (list (car Q) (drop Q 1)))
 
(define (queue-length Q) (length Q))