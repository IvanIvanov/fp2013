; contains? със стандартна рекурсия
; накрая изразът, който се оценява изглежда така:
; ако елементът се среща някъде из списъка - (or #f (or #f (or #t (or #f #f))))
; ако елементът не се среща, ще бъде само (or) от #f
(define (contains? l elem)
  (cond
    ( (null? l) #f)
    (else (or (= (car l) elem) (contains? (cdr l) elem)))))

; Връща списък от само-уникалните елементи в l
(define (unique l)
  (define (unique-iter l result)
    (cond
      ( (null? l) result )
      ( (contains? result (car l)) (unique-iter (cdr l) result))
      (else (unique-iter (cdr l) (cons (car l) result)))))
  (reverse (unique-iter l (list))))

; selection sort от http://cs.gmu.edu/~white/CS363/Scheme/SchemeSamples.html
(define (selection L) 
   (cond ( (null? L) '() )
         ( else (cons (smallest L (car L))     ; put the smallest element
                                               ; at the front of the 
                                               ; current list 
                      (selection (remove L (smallest L (car L)))))
                                               ; call selection on the list
                                               ; minus the smallest
                                               ; element
         )
   )
)

(define (remove L A)                ; remove the first occurance of atom A from L
  (cond ( (null? L) '() )           
        ( (= (car L) A) (cdr L))    ; Match found! 
        (else (cons (car L)(remove (cdr L) A)))   ; keep searching
  )
)

(define (smallest L A)             ; looks for the smallest element in the list
                                   ; atom A is the current smallest
  (cond ( (null? L) A)
        ( (< (car L) A) (smallest (cdr L)(car L)))
        (else (smallest (cdr L) A ))
  )
)


(define (set-intersect l1 l2)
  (define (set-intersect-iter l1 l2 result)
    (cond
      ( (null? l1) result )
      ( (contains? l2 (car l1)) (set-intersect-iter (cdr l1) l2 (cons (car l1) result)) )
      (else (set-intersect-iter (cdr l1) l2 result))))
  
  (selection (unique (set-intersect-iter l1 l2 (list)))))
