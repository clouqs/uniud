;; conversione verbi -ere al participio passato
;; verbi regolari, NON irregolari
(define radice-verb
  (lambda (s)
    (substring s 0 (- (string-length s) 3))
    ))

(define part-pass-terza
  (lambda(s)
    (string-append (radice-verb s) "uto")
    ))
   

