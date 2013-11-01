; слепя две числа заедно
(define (glue-ints a b)
  (+ (* a 10) b))

; Премахва всички 0-ли в началото на даден списък
; Ако списъкът е само с 0ли, връща празен списък
; Може да бъде написано и с drop-while
(define (remove-leading-zeroes l)
  (define (zero? n)
    (= n 0))
   (cond
      ( (null? l) (list) )
      ( (not (zero? (car l))) l )
      (else (remove-leading-zeroes (cdr l)))))

(define (list-to-number l)
  (define (list-to-number-iter l result)
    (cond
      ( (null? l)  result )
      (else (list-to-number-iter (cdr l) (glue-ints result (car l))))))
  (list-to-number-iter (remove-leading-zeroes l) 0))