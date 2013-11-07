(define (accumulate op initial items)
  (if (null? items)
      initial
      (accumulate op (op initial (car items)) (cdr items))))

(define (filter pred items)
  (cond ((null? items) '())
        ((pred (car items))
         (cons (car items) (filter pred (cdr items))))
        (else (filter pred (cdr items)))))

(define (sum items)
  (accumulate + 0 items))

(define (mean items)
  (/ (sum items) (length items)))

(define (close-to-mean epsilon items)
  (let ((m (mean items)))
    (filter (lambda (x) (< (abs (- x m)) epsilon)) items)))
