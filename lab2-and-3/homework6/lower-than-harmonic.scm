; пресмята средно хармонично
(define (harmonic l)
    (/ (length l) (apply + 0 (map (lambda (x) (/ 1 x) ) l))))

(define (filter l pred?)
  (define (filter-iter l pred? result)
      (cond
            ( (null? l) result)
                  ( (pred? (car l)) (filter-iter (cdr l) pred? (cons (car l) result)))
                        (else (filter-iter (cdr l) pred? result))))

    (reverse (filter-iter l pred? '())))


(define (lower-than-harmonic l)
    (filter l (lambda (elem) (< elem (harmonic l))  )))
