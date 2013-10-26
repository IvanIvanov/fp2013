(load "cassie.scm")
(load "solution.scm")

(define-test prepend-test
  (assert (prepend '(1 2 3) "0")      '("0" 1 2 3))
  (assert (prepend '(1 2 3) 0)        '(0 1 2 3))
  (assert (prepend '(4 5 6) '(1 2 3)) '(1 2 3 4 5 6))
  (assert (prepend '(4 5 6) '())      '(4 5 6))
  (assert (prepend '() '(1 2 3))      '(1 2 3))
  (assert (prepend '(4) '(1 2 3))     '(1 2 3 4))
  (assert (prepend '(4) '((0 1) 2 3)) '((0 1) 2 3 4)))

(define-test number->list-test
  (assert (number->list 3)    '(3))
  (assert (number->list 681)  '(6 8 1))
  (assert (number->list 1878) '(1 8 7 8)))

(define-test distinct-test
  (assert (distinct '())                  '())
  (assert (distinct '(1 2 1 3 1 4 1 5))   '(1 2 3 4 5))
  (assert (distinct '(4 8 15 16 23 42))   '(4 8 15 16 23 42))
  (assert (distinct '(1 2 2 3 1 2 3 3 4)) '(1 2 3 4)))

(define-test sequence-order?-test
  (assert (sequence-order? < '())           #t)
  (assert (sequence-order? < '(1))          #t)
  (assert (sequence-order? < '(1 2 3 4 5))  #t)
  (assert (sequence-order? < '(1 1 1 1 1))  #f)
  (assert (sequence-order? < '(1 2 3 3 4))  #f)
  (assert (sequence-order? < '(1 2 4 3 5))  #f)

  (assert (sequence-order? > '())           #t)
  (assert (sequence-order? > '(1))          #t)
  (assert (sequence-order? > '(5 4 3 2 1))  #t)
  (assert (sequence-order? > '(1 1 1 1 1))  #f)
  (assert (sequence-order? > '(4 3 3 2 1))  #f)
  (assert (sequence-order? > '(5 4 3 2 6))  #f)

  (assert (sequence-order? <= '(1 2 3 3 4)) #t)
  (assert (sequence-order? <= '(3 3 3 3 3)) #t)

  (assert (sequence-order? >= '(4 3 3 2 1)) #t)
  (assert (sequence-order? >= '(3 3 3 3 3)) #t)

  (assert (sequence-order? = '())           #t)
  (assert (sequence-order? = '(3))          #t)
  (assert (sequence-order? = '(2 8 9 2 7))  #f)
  (assert (sequence-order? = '(3 3 3 3 3))  #t))

(run-tests
  prepend-test
  number->list-test
  distinct-test
  sequence-order?-test)
