(define (tree-map f tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (f tree))
        (else (cons (tree-map f (car tree))
                    (tree-map f (cdr tree))))))

(tree-map (lambda (x) (* x x)) '((1 2) 3 (4 (5 6)))) ; ((1 4) 9 (16 (25 36)))
(tree-map even? '(1 (2 (3 (3 4))))) ; (#f (#t (#f (#f #t))))
