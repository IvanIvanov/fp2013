(define (divides? a b)
  (= (remainder a b) 0))

(define (count-divisors n)
  (count-divisors-iter n 1 0))

(define (count-divisors-iter n i result)
  (cond ((> i n) result)
        ((divides? n i) (count-divisors-iter n (+ i 1) (+ result 1)))
        (else (count-divisors-iter n (+ i 1) result))))

(define (equal-divisors? i j k)
  (and (= (count-divisors i)
          (count-divisors j))
       (= (count-divisors j)
          (count-divisors k))))

(define (count-triples n)
  (count-triples-iter n 1 2 3 0))

(define (count-triples-iter n i j k result)
  (cond ((> i n) result)
        ((> j n) 
         (count-triples-iter n (+ i 1) (+ i 2) (+ i 3) result))
        ((> k n) 
         (count-triples-iter n i (+ j 1) (+ j 2) result))
        ((equal-divisors? i j k)
         (count-triples-iter n i j (+ k 1) (+ result 1)))
        (else
         (count-triples-iter n i j (+ k 1) result))))

(count-triples 10)
(count-triples 42)
(count-triples 64)
