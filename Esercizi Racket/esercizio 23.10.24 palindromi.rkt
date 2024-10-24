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

        
