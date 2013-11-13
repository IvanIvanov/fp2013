;;; A function that computes the dot product of two vectors
;;; represented as lists.
(define (dot-product a b)
  (if (null? a)
      0
      (+ (* (car a) (car b))
         (dot-product (cdr a) (cdr b)))))

(dot-product '(1 2 3) '(1 2 3)) ; 14

;;; A matrix can be modeled as a list of it's row vectors
;;; which are lists of numbers.

;;; Finds the number of rows of the matrix m.
(define (matrix-rows m)
  (length m))


;;; Finds the number of columns of the matrix m.
(define (matrix-cols m)
  (if (= (matrix-rows m) 0)
      0
      (length (car m))))

;;; Computes the product of a matrix with a column vector.
(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(matrix-*-vector '((1 2) (3 4)) '(3 4)) ; (11 25)

;;; Finds the first column vector of a matrix.
(define (first-col m)
  (if (null? m)
      '()
      (cons (caar m)
            (first-col (cdr m)))))

(first-col '((1 2) (3 4))) ; (1 3)

;;; Computes a new matrix with the first column removed.
(define (rest-cols m)
  (if (null? m)
      '()
      (cons (cdar m)
            (rest-cols (cdr m)))))

(rest-cols '((1 2) (3 4))) ; ((2) (4))

;;; Transposes a matrix m. To transpose a matrix convert its columns into rows.
(define (transpose m)
  (if (= 0 (matrix-cols m))
      '()
      (cons (first-col m)
            (transpose (rest-cols m)))))

(transpose '((1 2) (3 4))) ; ((1 3) (2 4))

;;; Computes the product of two matrices.
(define (matrix-*-matrix m1 m2)
  (map (lambda (row)
         (map (lambda (col) (dot-product row col))
              (transpose m2)))
       m1))

(matrix-*-matrix '((1 2) (3 4)) '((-1 4) (0 7))) ; ((-1 18) (-3 40))


;;; A system that does symbolic differentiation.

;;; A function that takes an expression and a variable and returns an
;;; expression that is the result of taking the derivative of the input
;;; expression with respect to the variable. For the purposes of this
;;; function an expression is defined as:
;;;
;;; 1. All Scheme numbers are valid expressions.
;;; 2. All variables (Scheme symbols) are valid expressions.
;;; 3. If a and b are valid expressions then (+ a b) is a valid expression.
;;; 4. If a and b are valid expressions then (* a b) is a valid expression.
;;;
;;; To find the derivative the following rules are used:
;;; 
;;; dc/dx     = 0
;;; dx/dx     = 1
;;; d(a+b)/dx = da/dx + db/dx
;;; d(a*b)/dx = a * db/dx + b * da/dx
;;;
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (sum-a exp) var)
                   (deriv (sum-b exp) var)))
        ((product? exp)
         (make-sum (make-product (product-a exp)
                                 (deriv (product-b exp) var))
                   (make-product (product-b exp)
                                 (deriv (product-a exp) var))))
        (else "Error")))

(define (variable? exp)
  (symbol? exp))

(define (same-variable? a b)
  (and (variable? a) (variable? b) (eq? a b)))

;;; Simple make-sum without simplifications:
;;;
;;;(define (make-sum a b)
;;;  (list '+ a b))

;;; Make-sum with simplifications:
(define (make-sum a b)
  (cond ((and (number? a) (= a 0)) b)
        ((and (number? b) (= b 0)) a)
        ((and (number? a) (number? b)) (+ a b))
        (else (list '+ a b))))

(define (sum-a exp)
  (cadr exp))

(define (sum-b exp)
  (caddr exp))

(define (sum? exp)
  (and (pair? exp) (eq? '+ (car exp))))

;;; Simple make-product without simplifications:
;;;
;;;(define (make-product a b)
;;;  (list '* a b))

;;; Make-product with simplifications:
(define (make-product a b)
  (cond ((and (number? a) (= a 0)) 0)
        ((and (number? a) (= a 1)) b)
        ((and (number? b) (= b 0)) 0)
        ((and (number? b) (= b 1)) a)
        ((and (number? a) (number? b)) (* a b))
        (else (list '* a b))))

(define (product-a exp)
  (cadr exp))

(define (product-b exp)
  (caddr exp))

(define (product? exp)
  (and (pair? exp) (eq? '* (car exp))))

(deriv '(* x 3) 'x) ; 3
(deriv '(+ x y) 'x) ; 1
(deriv '(* x y) 'x) ; y
(deriv '(+ (* a x) b) 'x) ; a
(deriv '(* (* x y) (+ x 3)) 'x) ; (+ (* x y) (* (+ x 3) y))
