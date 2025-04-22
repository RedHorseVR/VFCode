(defun threat (i j a b)
   (or (= i a)                       
   (= j b)                       
   (= (- i j) (- a b))           
   (= (+ i j) (+ a b)))
)
(defun conflict (n m board)
   (cond ((null board) nil)
   
      ((threat n m (caar board) (cadar board)) t)
   (t (conflict n m (cdr board)))
   )
)
(defun queens (size)
   (prog (n m board soln)
   (setq soln 0)                   
   (setq board ())
   (setq n 1)                      
   loop-n     
      (setq m 1)                      
      loop-m     
         (cond ((conflict n m board)
         
            (go un-do-m))
         ) 
         (setq board (cons (list n m) board))       
         (cond ((> (setq n (1+ n)) size)            
         
            (print-board (reverse board) (setq soln (1+ soln))))
         ) 
         (go loop-n)
         un-do-n     
         (cond ((null board) (return 'Done))
         
         )
         (setq m (cadar board))                     
         (setq n (caar board))
         (setq board (cdr board))  
         un-do-m
         (cond ((> (setq m (1+ m)) size)  (go un-do-n))
      (t (go loop-m))))
)

(defun print-board  (board soln)
   (prog (size)
   (setq size (length board))            
   (princ "\f\n\t\tSolution: ")
   (princ soln)
   (princ "\n\n\t")
   (print-header size 1)
   (princ "\n")
   (print-board-aux board size 1)
   (princ "\n")
   )
   )
   
(defun print-header (size n)
   (cond ((> n size) (princ "\n"))
   (t 
      (prog () (patom n)
      (princ " ") 
      (print-header size (1+ n))))
   )
   )
(defun print-board-aux (board size row)
   (princ "\n")
   (cond ((null board) ())
   (t 
      (prog () 
      (princ row)                  
      (princ "\t")
      (print-board-row (cadar board) size 1) 
      (print-board-aux (cdr board) size (1+ row))))
   )  
   )
(defun print-board-row (column size n)
   (cond ((> n size)())
   (t (prog () 
      (cond ((equal column n) (princ "Q"))
      (t 
         (princ "."))
      )
      (princ " ") 
      (print-board-row column size (1+ n))))
   )
)

















; ----------------------------------------------------------------------------------------------;

;  Exported By Insecta Version 2.0 - October 1996 Beta 3;
;  Insecta File: Queens.ins;
;  Export  File: Queens.lsp;
;  Export  Date: 10:46:25 PM - 10:Aug:1997;

