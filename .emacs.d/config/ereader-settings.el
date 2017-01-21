;; ereader-settings
(load "ereader")
(require 'ereader)
;;link epubs to orgfiles
(setq ereader-annotation-files '(
				 ("Metamorphosis" .
				  ("/home/djuju/Projects/Blinkerface/notes/metamorphosis.org"))
				 )) 

(provide 'ereader-settings)
