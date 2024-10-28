;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |esercizio frase|) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss.txt" "installed-teachpacks")) #f)))
(define frase
  (lambda (soggetto predicato-verbale oggetto)
    (string-append
      (articolo-sogg soggetto) " " soggetto " "
      (coniugazione predicato-verbale soggetto) " "
      (articolo-ogg oggetto) " " oggetto
    )
  )
)

;-----scelta articolo soggetto------;
(define articolo-sogg
  (lambda (soggetto)
    (cond
      [(string=? (substring soggetto (- (string-length soggetto) 1)) "o") "il"]
      [(string=? (substring soggetto (- (string-length soggetto) 1)) "a") "la"]
      [(string=? (substring soggetto (- (string-length soggetto) 1)) "i") "i"]
      [(string=? (substring soggetto (- (string-length soggetto) 1)) "e") "le"]
      [else (error "not a string")]
    )
  )
)

;-----troncatura del verbo-----;
(define coniugazione
  (lambda (predicato-verbale soggetto)
    (cond
      [(string=? (substring soggetto (- (string-length soggetto) 1)) "i") ; plur masc
       (string-append (substring predicato-verbale 0 (- (string-length predicato-verbale) 3)) "ano")]
      [(string=? (substring soggetto (- (string-length soggetto) 1)) "a") ; sing fem
       (string-append (substring predicato-verbale 0 (- (string-length predicato-verbale) 2)) "")]
      [(string=? (articolo-sogg soggetto) "il") ; sing masch
       (string-append (substring predicato-verbale 0 (- (string-length predicato-verbale) 2)) "")]
      [(string=? (substring soggetto (- (string-length soggetto) 1)) "e") ; plur femm
       (string-append (substring predicato-verbale 0 (- (string-length predicato-verbale) 3)) "ono")]
      [else (error "unknown subject type")]
    )
  )
)

;------scelta articolo oggetto------;
(define articolo-ogg
  (lambda (oggetto)
    (cond
      [(string=? (substring oggetto (- (string-length oggetto) 1)) "o") "il"] 
      [(string=? (substring oggetto (- (string-length oggetto) 1)) "a") "la"]
      [(string=? (substring oggetto (- (string-length oggetto) 1)) "i") "i"]
      [(string=? (substring oggetto (- (string-length oggetto) 1)) "e") "le"]
      [else (error "not a string")]
    )
  )
)


