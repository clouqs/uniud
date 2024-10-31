;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname bin-rep_con_base_b) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss" "installed-teachpacks")) #f)))
(define rep->number
  (lambda (base number)
    (string->number
     (string-append
      (segno number)
      (number->string (exact->inexact (numero  base number)))
      )
     )
    ))

(define segno
  (lambda (num)
    (if (string=? (substring num 0 1) "+")
        "+"
        (if (string=? (substring num 0 1) "-")
            "-"
            ""
            )
        )
    ))

(define numero
  (lambda (bas num)
    (if (string=? (substring num 0 1) "+")
        (punto bas (substring num 1 (string-length num)) (substring num 1 (string-length num)))
        (if (string=? (substring num 0 1) "-")
            (punto bas (substring num 1 (string-length num)) (substring num 1 (string-length num)))
            (punto bas num num)
            )
        )
    ))

(define punto
  (lambda (base numero numeroorig)
    (if (> (string-length numero) 1)
        (if (char=? (string-ref numero (- (string-length numero) 1)) #\.)
            (numeri  base (substring numero 0 (- (string-length numero) 1)) (substring numeroorig (string-length numero) (string-length numeroorig)))
            (punto base (substring numero 0 (- (string-length numero) 1)) numeroorig)
            )
        (numeri base numeroorig "")
        )
    )
  )


(define numeri
  (lambda (bas intero decimale)
    (+
     (parte-intera bas intero)
     (if (> (string-length decimale) 0)
         (parte-decimale bas decimale)
         0
         )
               
     )
    ))

(define parte-intera
  (lambda (base num)
    (if (= (string-length num) 0)
        0
        (+ (* (valore base (substring num 0 1)) (expt (string-length base) (- (string-length num) 1))) (parte-intera base (substring  num 1 (string-length num))))
        )
    )
  )

(define parte-decimale
  (lambda (base num)
    (if (= (string-length num) 0)
        0
        (+ (* (valore base (substring num (- (string-length num) 1) (string-length num))) (expt (string-length base) (* (string-length num) -1))) (parte-decimale base (substring  num 0 (- (string-length num) 1))))
        )
    )
  )

(define valore
  (lambda (base numero)
    (if (string=? numero (substring base (- (string-length base) 1) (string-length base)))
        (- (string-length base) 1)
        (valore (substring base 0 (- (string-length base) 1)) numero)
        )
    ))


    
    
