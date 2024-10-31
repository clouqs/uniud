
;--------croce--------;

(glue-tiles (glue-tiles (shift-right (shift-down smaller-tile 0) 1.6) (shift-right (shift-down (half-turn smaller-tile) 4) 1.6)) (glue-tiles (shift-down (shift-right (half-turn larger-tile) 1.6) 0.8) larger-tile))




;-------quadrato-------;


(glue-tiles (glue-tiles (half-turn smaller-tile) smaller-tile) (shift-down (glue-tiles (half-turn smaller-tile) smaller-tile) 0.8))
