(define (inc n)
  (+ n 1))

(define (dec n)
  (- n 1))

(define (divisor? k n)
  (and (not (zero? k))
       (zero? (remainder n k))))

(define (sum-of-digits n)
  (if (< n 10)
      n
      (+ (remainder n 10) (sum-of-digits (quotient n 10)))))

(define (count-digits n)
  (if (< n 10)
      1
      (inc (count-digits (quotient n 10)))))

(define (prime? n)
  (and (not (= n 1))
       (let loop ((number 2))
         (cond ((> number (sqrt n)) #t)
               ((divisor? number n) #f)
               (else (loop (inc number)))))))

(define (balanced? n)
  (let* ((pivot (/ (count-digits n) 2))
         (sum-of-digits-to-the-left (sum-of-digits (quotient n (expt 10 (ceiling pivot)))))
         (sum-of-digits-to-the-rigth (sum-of-digits (remainder n (expt 10 (floor pivot))))))
    (= sum-of-digits-to-the-left
       sum-of-digits-to-the-rigth)))

(define (even-fibonacci-sum n)
  (let loop ((a 0) (b 1) (counter n) (sum-of-evens 0))
    (cond ((zero? counter) sum-of-evens)
          ((even? a) (loop b (+ a b) (dec counter) (+ sum-of-evens a)))
          (else (loop b (+ a b) (dec counter) sum-of-evens)))))

(define (sum-of-prime-divisors n)
  (let loop ((number 2) (sum-of-primes 0))
    (cond ((> number n) sum-of-primes)
          ((and (prime? number) (divisor? number n))
           (loop (inc number) (+ sum-of-primes number)))
          (else (loop (inc number) sum-of-primes)))))
