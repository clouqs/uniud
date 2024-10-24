;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |lezione 24.10.24|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define btr-val
  (lambda (btr)
    (let (
          (k (- (string-length btr) 1))
          )
      (if (= k 0)
          (btd-val btr)
          (+ (* 3 (btr-val (substring btr 0 k))
                (btd-val (substring btr k))
                ))
          )
      )
    ))
(define btd-val     ;vak: intero
  (lambda (btd)     ;btd: "-", ".", "+"
    (cond ((string=? btd "-") -1)
          ((string=? btd ".") 0)
          ((string=? btd "+") +1)
          )
    ))

    
    