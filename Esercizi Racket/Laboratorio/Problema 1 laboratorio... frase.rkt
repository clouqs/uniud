;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname frase) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define frase
  (lambda (soggetto predicato complemento)
    (string-append
     (articolo soggetto)
     " "
     soggetto
     " "
     (coniug-verbo predicato soggetto)
     " "
     (articolo complemento)
     " "
     complemento
     )
    ))

(define articolo
  (lambda (sogg)
    (if (string=? (substring sogg (- (string-length sogg) 1) (string-length sogg)) "o")
        "il"
         (if (string=? (substring sogg (- (string-length sogg) 1) (string-length sogg)) "i")
             "i"
              (if (string=? (substring sogg (- (string-length sogg) 1) (string-length sogg)) "a")
                  "la"
                  (if (string=? (substring sogg (- (string-length sogg) 1) (string-length sogg)) "e")
                      "le"
                      ""
                      )
                  )
              )
         )
     )
    )

(define coniug-verbo
  (lambda (pred sogg)
    (if (string=? (substring sogg (- (string-length sogg) 1) (string-length sogg)) "o")
         (predicato-singolare pred)
         (if (string=? (substring sogg (- (string-length sogg) 1) (string-length sogg)) "i")
             (predicato-plurale pred)
              (if (string=? (substring sogg (- (string-length sogg) 1) (string-length sogg)) "a")
                  (predicato-singolare pred)
                  (if (string=? (substring sogg (- (string-length sogg) 1) (string-length sogg)) "e")
                      (predicato-plurale pred)
                      ""
                      )
                  )
              )
         )
   )
  )
    
 (define predicato-singolare
   (lambda (verbo)
     (if (string=? (substring verbo (- (string-length verbo) 3) (string-length verbo)) "are")
         (string-append
          (substring verbo 0 (-(string-length verbo) 3))
          "a"
          )
         (string-append
          (substring verbo 0 (-(string-length verbo) 3))
          "e"
          )
       )
     ))
    
 (define predicato-plurale
   (lambda (verbo)
     (if (string=? (substring verbo (- (string-length verbo) 3) (string-length)) "are")
         (string-append
          (substring verbo 0 (-(string-length verbo) 3))
          "ano"
          )
         (string-append
          (substring verbo 0 (-(string-length verbo) 3))
          "ono"
          )
       )
     ))
