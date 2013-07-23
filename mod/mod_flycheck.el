;; ====================
;; mod_flycheck.el
;; ====================

(require 'flycheck)
(eval-after-load 'flycheck '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))
(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'text-mode-hook 'flycheck-mode)

(provide 'mod_flycheck)