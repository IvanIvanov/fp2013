Домашно 4
===========

##Задачи##
Решенията на задачите се предават по e-mail на адрес:

> ivan.vladimirov.ivanov@gmail.com

Решението на всяка задача трябва да бъде под формата на файл с окончание *.scm*, който да съдържа дефиницията на функцията (със точната сигнатура дефинирана в условието на задачата) и евентуално други помощни дефиниции, необходими за реализацията. Файловете се изпращат като attachment-и в mail-a. Освен решения на задачите самият mail трябва да съдържа име и факултен номер. Успех!


### Задача 1 ###
Да се дефинира функция от по-висок ред *all?*, която получава като аргумент функция *predicate* и списък *items* и връща като резултат стойност #t (true), ако функцията *predicate* се оценява като #t (true) за всички елементи от списъка или #f (false) в противен случай.

**Сигнатура:**
```scheme
(define (all? predicate items) ...)
```

**Примери:**
```scheme
(all? even? '(1 2 3 4)) -> #f
(all? odd?  '(1 3 5 7)) -> #t
(all? (lambda (x) #f) '()) -> #t
(all? (lambda (x) (< x 10)) '(1 2 3 4 5)) -> #t
```

### Задача 2 ###
Да се дефинира функция от по-висок ред *any?*, която получава като арумент функция *predicate* и списък *items* и връща като резултат стойност #t (true), ако функцията *predicate* се оценята като #t (true) за поне един елемент от списъка или #f (false) ако *predicate* има стойност #f (false) за всички елементи от списъка.

**Сигнатура:**
```scheme
(define (any? predicate items) ...)
```

**Примери:**
```scheme
(any? even? '(1 2 3 4)) -> #t
(any? (lambda (x) (> x 10)) '(1 2 3 4)) -> #f
(any? odd? '(2 4 6)) -> #f
```

### Задача 3 ###
Да се напише функция от по-висок ред *accumulate*, която да акумулира елементите на един списък, като използва бинарен (двуаргументен) оператор, подаден като аргумент. По-конкретно *accumulate* получава функция *op*, чрез която да се извърши акумулацията, първоначална стойност *initial*, от която акумулацията да започне и списък *items* от елементите, които да се акумулират. Забележка - може да предположите, че функцията *op* е асоциативна и комутативна т.е. няма значение дали извършвате акумулацията от ляво на дясно или от дясно на ляво или в какъвто и да е било друг ред, тъй като резултата винаги ще е един и същ.

**Сигнатура:**
```scheme
(define (accumulate op initial items) ...)
```

**Примери:**
```scheme
(accumulate + 0 '(1 2 3 4 5 6 7 8 9 10)) -> 55
(accumulate * 1 '(1 2 3 4 5 6 7 8 9 10)) -> 3628800
(accumulate * 1 '()) -> 1
(accumulate + 0 '()) -> 0
```

##Препоръчани материали:##

* [Structure and Intrepretation of Computer Programs](http://mitpress.mit.edu/sicp/full-text/book/book.html):
    * От секция [2.1](http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-14.html#%_sec_2.1) - [2.1.1](http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-14.html#%_sec_2.1.1) и [2.1.2](http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-14.html#%_sec_2.1.2)
    * От секция [2.2](http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-15.html#%_sec_2.2) - [2.2.1](http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-15.html#%_sec_2.2.1) и [2.2.3](http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-15.html#%_sec_2.2.3)
* Видео лекции на Abelson and Sussman: [Лекция4](http://www.youtube.com/watch?v=ymsbTVLbyN4) и [Лекция5](http://www.youtube.com/watch?v=2QgZVYI3tDs)


