
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/config")
;; general
(require 'package-management)
(require 'general-settings)
;; packages
(require 'ido-settings)
;;(require 'magit-settings)
(require 'org-settings)
;; languages
;;(require 'latex-settings)
;;(require 'python-settings)
;; load theme and maximize window
(load-theme 'material t)
(toggle-frame-maximized)


;; (set-frame-font "Monaco 10")
;; (set-frame-font "Consolas 11")
;;(set-frame-font "Inconsolata 12")
;; (set-frame-font "DejaVu Sans Mono 10")
;; (set-frame-font "Terminus 12")
;; (set-frame-font "Source Code Pro 10")
;; (set-frame-font "Bitstream Vera Sans Mono 11")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Dropbox/blinkist/structures/blockchain.org" "~/Documents/firstorgs.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
