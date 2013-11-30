(define (filter pred l)
  (let loop ((sequence l) (filtered '()))
    (cond ((null? sequence)
           filtered)
          ((pred (car sequence))
           (loop (cdr sequence) (append filtered (list (car sequence)))))
          (else (loop (cdr sequence) filtered)))))

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

(define (range a b)
  (if (> a b)
      '()
      (cons a (range (inc a) b))))

(define (replicate l n)
  (letrec ((repeat (lambda (element n)
                     (if (zero? n)
                         '()
                         (cons element (repeat element (dec n)))))))
    (apply append (map (lambda (element) (repeat element n)) l))))

(define (each-with-index l)
  (map list (range 0 (dec length)) l))

(define (slice l start end)
  (map cadr (filter (lambda (pair) (and (>= (car pair) start)
                                        (<= (car pair) end)))
                    (each-with-index l))))
