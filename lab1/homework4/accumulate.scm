(define (accumulate op initial items)
  (if (null? items)
      initial
      (op (car items)
          (accumulate op initial (cdr items)))))
