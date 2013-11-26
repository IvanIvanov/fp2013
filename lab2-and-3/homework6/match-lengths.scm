(define (filter l pred?)
  (define (filter-iter l pred? result)
    (cond
      ( (null? l) result)
      ( (pred? (car l)) (filter-iter (cdr l) pred? (cons (car l) result)))
      (else (filter-iter (cdr l) pred? result))))

  (reverse (filter-iter l pred? '())))

(define (all? pred? l)
  (= (length (filter l pred?)) (length l)))

(define (match-lengths? l1 l2)
	(let* ( (diff-list (map (lambda (sublist1 sublist2) 
							(- (length sublist1) (length sublist2))) 
						l1 l2))
			(first-item (car diff-list)))
		(all? (lambda (x) (= x first-item)) diff-list)))