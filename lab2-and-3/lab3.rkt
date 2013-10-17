; Записки от 3тото занятие
; Функции от по-висок ред !
; high-order functions
; Функция, която или:
; 1 приема функция като аргумент
; 2 връща функция като резултат
; Викат им Functors

(define (twice f x)
  (f (f x)))

(define (identity x) x)
(define (TRUTH n) #t)

(define (aggregate oper N term_function pred? start_value)
  (define (calculate-result result N oper term_function)
    (oper (term_function N) result))
  
  (define (aggregate-iter oper N term_function pred? result)
    (cond
      ( (= N 0) result )
      ( (not (pred? N)) (aggregate-iter oper (- N 1) term_function pred? result) )
      (else (aggregate-iter oper (- N 1) term_function pred? (calculate-result result N oper term_function)))))
  
  (aggregate-iter oper N term_function pred? start_value)
  )

(define (sum-1-to-N N)
  (aggregate + N identity TRUTH 0))

(define (is-devisible? a n)
  (= (remainder a n) 0))

(define (is-prime? n)
  (define (is-prime-iter? n i)
    (cond
      ( (= n 1) #f )
      ( (= i n)  #t )
      ( (is-devisible? n i) #f)
      ( else (is-prime-iter? n (+ i 1)) )))
  (is-prime-iter? n 2))


(define (sum-of-primes N)
  (aggregate + N identity is-prime? 0))
  
  
; Задачи - sum-of-primes с aggregate

; Да се напише функция (min-sum-digit a b k), която намира най-малкото от целите числа от a до b, чиято сума на цифрите се дели на k.

; Да се напише функция, която приема цяло число N, и връща функция с 1 аргумент K, която функция проверява дали К e делител на N при извикване

; Направи функция, която по зададено естествено число K да връща функция, която приема един параметър - число N и го повдига на степен K.

; Дадена е функция f, която приема естествено число и връща естествено число. Да се напише процедура, която връща функция със следната характеристика: 
; Приема две числа, a и b. Връща едно число x, за което се достига минимумът на F в интервала [a,b].
  









