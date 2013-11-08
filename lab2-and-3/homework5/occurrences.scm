(define (count-n l n) 
	(apply + 0 (map (lambda (x) 
						(cond
							( (= x n) 1)
							(else 0)) 
					) 
				l)
	)
)

; заменяме всеки елемент от l1 с броя срещания в l2
(define (occurrences l1 l2)
	(map (lambda (x) (count-n l2 x) ) l1))