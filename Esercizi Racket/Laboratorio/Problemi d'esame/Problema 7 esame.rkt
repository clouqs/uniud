;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Problema 7 laboratorio|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; esercizio a ;
(define (belong? number list)
  (if (null? list)  
      #f            
      (if (= number (car list))  
          #t           
          (belong? number (cdr list)))))

; esercizio b ;
(define (lst-pos number lst1 index)
  (cond
    [(null? lst1) "niente da fare, tuona..."]
    [(= (car lst1) number) index]
    [else (lst-pos number (cdr lst1) (+ index 1))]))

(define (position number lst1)
  (lst-pos number lst1 0))
; esercizio c ;

(define (sorted-ins number lst)
  (cond
    [(null? lst) (number)]                     
    [(= (car lst) number) lst]                       
    [(< (car lst) number) (cons (car lst) (sorted-ins number (cdr lst)))]  
    [(> (car lst) number) (cons number lst)]         
    ))
; esercizio d ;

(define (less-than? a b)
  (< a b)
  )
(define (sorted-list lst2)
  (sort lst2 less-than?)
  )

;ciao madracco!
; vedi documentazione: https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Fprivate%2Flist..rkt%29._sort%29%29
