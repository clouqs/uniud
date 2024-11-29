(define hanoi-disks
  (lambda (n-dischi mosse)
    (cond
      [(= n-dischi 0) (list '(1 0) '(2 0) '(3 0))]
      [else (hanoi-helper mosse n-dischi '(1 0) '(2 0) '(3 0))]
      )
    )) 

(define hanoi-helper
  (lambda (mosse n-dischi partenza intermedio destinazione)
    (if (= n-dischi 0)
        (list partenza intermedio destinazione)
        (cond
          [(>= mosse (expt 2 (- n-dischi 1))) (hanoi-helper (- mosse (expt 2 (- n-dischi 1))) (- n-dischi 1) intermedio partenza (list (car destinazione) (+ (cadr destinazione) 1)))]
          [else (hanoi-helper mosse (- n-dischi 1) (list (car partenza) (+ (cadr partenza) 1)) destinazione intermedio)]
          )
        )
      )
  )


(define hanoi-picture
  (lambda (n-dischi mosse)
    (cond
      [(= n-dischi 0) (towers-background 0)]
      [else (hanoi-drawing-helper mosse n-dischi '(1 0) '(2 0) '(3 0) '() n-dischi)]
      )
    )) 

(define hanoi-drawing-helper
  (lambda (mosse n-dischi partenza intermedio destinazione disegno n)
    (if (= n-dischi 0)
        (drawing (disk-image (fourth (reverse disegno)) (third (reverse disegno)) (second (reverse disegno)) (car (reverse disegno)))  (reverse disegno) n)
        (cond
          [(>= mosse (expt 2 (- n-dischi 1))) (hanoi-drawing-helper (- mosse (expt 2 (- n-dischi 1))) (- n-dischi 1) intermedio partenza (list (car destinazione) (+ (cadr destinazione) 1)) (append disegno (list n-dischi n (car destinazione) (car (cdr destinazione)))) n)]
          [else (hanoi-drawing-helper mosse (- n-dischi 1) (list (car partenza) (+ (cadr partenza) 1)) destinazione intermedio (append disegno (list n-dischi n (car partenza) (car(cdr partenza)))) n)]
          )
        )
      )
  )

(define drawing
  (lambda (immagine valori n-dischi)
    (if (null? valori)
        (above immagine (towers-background n-dischi))
        (above
         (disk-image (fourth valori) (third valori) (second valori) (car valori))
         (drawing immagine (cdr(cdr (cdr (cdr valori)))) n-dischi)
         )
        )
    ))




;SPIEGAZIONE;
