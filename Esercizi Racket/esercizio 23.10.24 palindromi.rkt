;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |esercizio 23.10.24 palindromi|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;-----check stringa palindroma-----;

(define rev-str
  (lambda (s)
    (list->string (reverse (string->list s))))
)


;---check stringa palindroma con ricorsione---;
(define reverse-str
  (lambda (str)
    (if (< (string-length str) 1)
        ""
        (string-append ;else
         (reverse-str (substring str 1))
         (substring str 0 1))
        )
    )
  )

        