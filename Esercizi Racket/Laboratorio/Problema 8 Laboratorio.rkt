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



1. Funzione cesare
La funzione principale, cesare, prende due argomenti:

cif: la stringa da cifrare o decifrare.
shift: il numero di posizioni da spostare ogni lettera nell'alfabeto.
scheme
Copia codice
(define (cesare cif shift)
  (let* ((a (string->list cif))
         (shifted (map (lambda (ch) ...)
                       a)))
    (list->string shifted)))
a: trasforma la stringa cif in una lista di caratteri utilizzando string->list, così da poter operare sui singoli caratteri.
shifted: applica una funzione a ciascun carattere nella lista a usando map.
2. Funzione map con lambda
La funzione map applica a ciascun carattere ch della lista a la funzione definita tramite lambda. Il codice della lambda funziona così:

scheme
Copia codice
(lambda (ch)
  (if (char-alphabetic? ch)
      (let* ((base (if (char-lower-case? ch) #\a #\A))
             (offset (modulo (+ (- (char->integer ch) (char->integer base)) shift) 26)))
        (integer->char (+ (char->integer base) offset)))
      ch))
Controllo se ch è alfabetico:

char-alphabetic?: verifica se ch è una lettera dell'alfabeto.
Se ch non è una lettera (ad esempio, uno spazio o un numero), lambda restituisce direttamente ch (quindi resta invariato).
Conversione e spostamento delle lettere:

base: determina il punto di partenza per il calcolo dello spostamento.
Se ch è minuscolo (char-lower-case? ch), base è impostato su #\a (ASCII della 'a').
Se ch è maiuscolo, base è #\A (ASCII della 'A').
Calcolo dell'offset:

char->integer ch: converte ch in un valore intero corrispondente al suo codice ASCII.
Sottraendo base, si ottiene l'indice di ch rispetto a a o A.
Aggiunge shift all'indice e applica modulo 26 per mantenere lo spostamento nell'intervallo dell'alfabeto (0-25).
integer->char: converte l'indice spostato in un carattere.
3. Conversione finale
Infine, list->string converte shifted da lista di caratteri a stringa per restituire il testo cifrato.

4. Funzioni cifra e decifra
Queste due funzioni servono rispettivamente per cifrare e decifrare un testo:

Cifratura: cifra richiama cesare con il shift positivo.
Decifratura: decifra richiama cesare con -shift (spostamento negativo), annullando l'effetto della cifratura.
