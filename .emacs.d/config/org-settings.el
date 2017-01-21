;;update to orgmode 9 (for drawers)
(add-to-list 'load-path "~/emacs-25.1/org-9.0.2/lisp/")
(add-to-list 'load-path "~/.emacs-25.1/org-9.0.2/contrib/lisp/" t) 

(require 'org)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-log-done t)


;; agenda
;;(setq org-agenda-files (list 
 ;;                       "~/org/ma.org"
;;                            "~/org/stuff.org"))

(provide 'org-settings)
