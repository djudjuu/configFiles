;; Python settings
(require 'python)

;; Use IPython as default interpreter
(setq python-shell-interpreter "ipython")

;; Enable Elpy Python IDE features
(elpy-enable)
;;do autoformatting to pep8 on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

; pymacs
;;(add-to-list 'load-path "~/.emacs.d/pymacs")
;;(autoload 'pymacs-apply "pymacs")
;;(autoload 'pymacs-call "pymacs")
;;(autoload 'pymacs-eval "pymacs" nil t)
;;(autoload 'pymacs-exec "pymacs" nil t)
;;(autoload 'pymacs-load "pymacs" nil t)
;;(autoload 'pymacs-autoload "pymacs")

; ropemacs
;;(require 'pymacs)
;;(pymacs-load "ropemacs" "rope-")


(provide 'python-settings)
