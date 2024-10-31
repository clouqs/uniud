;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname manhattan) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
(define manhattan-3d
  (lambda (i j k)
    (/ (fact (sum i j k)) (* (fact i) (fact j) (fact k)))
    ))

(define sum
  (lambda (a b c)
    (+ a (+ b c))
    ))


(define fact
  (lambda (n)
    (if (= n 0) 1
        (* n (fact (- n 1))))))