(define diff
  (lambda (lista1 lista2)
    (if (equal? lista1 lista2)
        "I file sono uguali"
        (alpha (xlcs-rec lista1 lista2 1 1) lista1 lista2 1 1 '())
        )
    ))


(define alpha
  (lambda (xlcs list1 list2 index1 index2 diff)
    (cond
      [(null? xlcs) diff]
      [(and (= (list-ref (car xlcs) 1) index1) (= (list-ref (car xlcs) 2) index2)) (alpha (cdr xlcs) (cdr list1) (cdr list2) (+ index1 1) (+ index2 1) diff)]
      [else (take-diff xlcs list1 list2 index1 index2 diff)]
      )
    ))

(define take-diff
  (lambda (xlcs list1 list2 index1 index2 diff)
    (alpha (cdr xlcs) (formatta-lista index1 (list-ref (car(cdr xlcs)) 1) list1) (formatta-lista index2 (list-ref (car(cdr xlcs)) 2) list2) (list-ref (car(cdr xlcs)) 1) (list-ref (car(cdr xlcs)) 2) (append diff (create-diff list1 list2 index1 index2 (list-ref (car xlcs) 1) (list-ref (car xlcs) 2) '() '() index1 index2)))
    ))

(define formatta-lista
  (lambda (inizio fine lista)
    (if (= inizio fine)
        lista
        (formatta-lista (+ inizio 1) fine (cdr lista))
        )
    ))

(define create-diff
  (lambda (list1 list2 inizio1 inizio2 fine1 fine2 diff1 diff2 saveinizio1 saveinizio2)
    (cond
      [(and (not (= inizio1 fine1)) (not (= inizio2 fine2)))
       (create-diff (cdr list1) (cdr list2) (+ inizio1 1) (+ inizio2 1) fine1 fine2 (append diff1 (list (string-append "<" (car list1)))) (append diff2 (list (string-append ">" (car list2)))) saveinizio1 saveinizio2)]
      [(not (= inizio2 fine2))
            (create-diff list1 (cdr list2) inizio1 (+ inizio2 1) fine1 fine2 diff1 (append diff2 (list (string-append ">" (car list2)))) saveinizio1 saveinizio2)]
      [else (formatta diff1 diff2 (- fine1 1) (- fine2 1) saveinizio1 saveinizio2)]
      )
  ))

(define formatta
  (lambda (diff1 diff2 fine1 fine2 inizio1 inizio2)
    (cond
      [(and (= inizio1 fine1) (= inizio2 fine2))
       (append
        (list (string-append (number->string inizio1) "c" (number->string inizio2)))
              diff1
              (list "---")
              diff2
             )]
       [(= (- inizio1 1) fine1)
        (append
        (list (string-append (number->string (- inizio1 1)) "a" (number->string inizio2) "," (number->string fine2)))
              diff2
             )]
       [else
        (append
         (list (string-append (number->string inizio1) "," (number->string fine1) "c" (number->string inizio2) "," (number->string fine2)))
              diff1
              (list "---")
              diff2
             )]
       )
    ))



    ;; Riorganizzazione: lcs --> xlcs-rec con parametri aggiuntivi

    (define xlcs-rec     ; val:  lista
      (lambda (u v i j)  ; u, v: stringhe, i, j: indici
        (cond
          ((or (equal? u '()) (equal? v '()))
           null
           )
          ((string=? (list-ref u 0) (list-ref v 0))
           (cons
            (list (car u) i j)
            (xlcs-rec (cdr u) (cdr v) (+ i 1) (+ j 1))
            ))
          (else
           (xlonger
            (xlcs-rec (cdr u) v (+ i 1) j)
            (xlcs-rec u (cdr v) i (+ j 1))
            ))
          )))

    ;; Confronto di potenziali soluzioni: longer --> xlonger

    (define xlonger      ; val:  lista
      (lambda (s t)      ; s, t: liste
        (if (< (length s) (length t))
            t
            s)
        ))





    
