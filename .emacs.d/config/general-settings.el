; don't show the startup screen
;;(setq inhibit-startup-screen t)

;; Turn on mouse wheel support for scrolling
(require 'mwheel)
(mouse-wheel-mode 1)

;; Show the current line and column number
(line-number-mode 1)
(column-number-mode 1) 

;; Remove scrollbars, menu bars, and toolbars
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)

;; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode 1)

;; evil mode makes vim available inside emacs
;;(require 'evil)
;;(evil-mode t)
;; remapping ESC to jk and df
;;(require 'key-chord) ;;//do Mx package-install key-chord
;;(key-chord-mode 1)
;;(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
;;(key-chord-define evil-insert-state-map  "jj" 'evil-normal-state)
;;(key-chord-define evil-insert-state-map  "ff" 'evil-normal-state)

;; open windows and frames from last session
;;(desktop-save-mode 1);;so i dont have to open everything again
;;read more at https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Emacs-Sessions.html


;;shows a vertical line  -> TODO its a very thin line barely visible
(require 'fill-column-indicator) 
(define-globalized-minor-mode
global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)


;; custom variable for the ereader 
(setq ereader-annotation-files '(
				 ("Metamorphosis" .
				  ("/home/djuju/Projects/Blinkerface/notes/metamorphosis.org"))
				 ))
;; show brackets in matching colors
;;(rainbow-delimiters-mode t)


(provide 'general-settings)
