(define (inc n)
  (+ n 1))

(define (dec n)
  (- n 1))

(define (reciprocal n)
  (/ 1 n))

(define (filter pred l)
  (let loop ((sequence l) (filtered '()))
    (cond ((null? sequence)
           filtered)
          ((pred (car sequence))
           (loop (cdr sequence) (append filtered (list (car sequence)))))
          (else (loop (cdr sequence) filtered)))))

(define (reduce f init-val l)
  (let loop ((sequence l) (reduced init-val))
    (if (null? sequence)
        reduced
        (loop (cdr sequence) (f reduced (car sequence))))))

(define (range a b)
  (let loop ((current a) (sequence '()))
    (if (> current b)
        sequence
        (loop (inc current) (append sequence (list current))))))

(define (sum l)
  (apply + l))

(define (nth l index)
  (let loop ((rest l) (current-index 0))
    (cond ((null? rest) '())
          ((= current-index index) (car rest))
          (else (loop (cdr rest) (inc current-index))))))

(define (each-with-index l)
  (map list l (range 0 (dec (length l)))))

(define (transpose matrix)
  (apply map list matrix))

(define (main-forward-diagonal matrix)
  (map (lambda (row) (apply nth row)) (each-with-index matrix)))

(define (nth-harmonic n)
  (reduce + 0 (map reciprocal (range 1 n))))

(define (magic-square? matrix)
  (let ((rows matrix)
        (columns (transpose matrix))
        (main-forward-diagonal (main-forward-diagonal matrix))
        (main-backward-diagonal (main-forward-diagonal (transpose matrix))))
    (apply = (append (map sum rows)
                     (map sum columns)
                     (list (sum main-forward-diagonal)
                           (sum main-backward-diagonal))))))

(define (histogram numbers)
  (let ((indices (range 0 (apply max numbers)))
        (count-index (lambda (index) (length (filter (lambda (x) (= x index)) numbers)))))
    (map count-index indices)))
