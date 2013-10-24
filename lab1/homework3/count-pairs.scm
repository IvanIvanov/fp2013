(define (count-pairs n predicate)
  (count-pairs-iter n predicate 1 2 0))

(define (count-pairs-iter n predicate i j result)
  (cond ((> i n) result)
        ((> j n)
         (count-pairs-iter n predicate (+ i 1) (+ i 2) result))
        ((predicate i j)
         (count-pairs-iter n predicate i (+ j 1) (+ result 1)))
        (else
         (count-pairs-iter n predicate i (+ j 1) result))))

(count-pairs 10 
             (lambda (x y) #t))

(count-pairs 42
             (lambda (x y) #t))

(count-pairs 10
             (lambda (x y) (even? (+ x y))))

(count-pairs 10
             (lambda (x y) (odd? (+ x y))))
