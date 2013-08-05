;; ====================
;; Theme
;; ====================

(add-to-list 'custom-theme-load-path (concat vendor-dir "themes/"))
(load-theme 'super-wombat t)
(defvar color-theme-is-global t)

;; ====================
;; Font
;; ====================

(defconst win32-p (eq system-type 'windows-nt) "Windows OS.")
(defconst cygwin-p (eq system-type 'cygwin))
(defconst linux-p  (or (eq system-type 'gnu/linux)  (eq system-type 'linux)))

(defvar vsc-little-font "")

(when linux-p
  (setq vsc-little-font "Bitstream Vera Sans Mono-11"))

(when cygwin-p
  (setq vsc-little-font "Bitstream Vera Sans Mono-11"))

(when win32-p
  (setq vsc-little-font "Bitstream Vera Sans Mono-10.5"))

;; basic deffault appearance
(add-to-list 'default-frame-alist (cons 'font vsc-little-font))
;; new frame appearance; overides default-frame-alist
(add-to-list 'initial-frame-alist (cons 'font vsc-little-font))

;; ====================
;; Gui
;; ====================

(tool-bar-mode -1) ;; Hide tool bar
(menu-bar-mode 1)  ;; Show menu bar
(blink-cursor-mode -1)                             ;; Cursor, stop blinking!
(setq inhibit-startup-screen (user-login-name))    ;; Start up screen? No thanks
(setq initial-scratch-message ";; Scratch Buffer") ;; New scratch buffer text

;; ====================
;; Editor behavior
;; ====================

(fset 'yes-or-no-p 'y-or-n-p)                   ;; use 'y' and 'n' instoad 'Yes' and 'No'
(setq visible-bell t)                           ;; No bells and whistles
;;(setq-default default-justification 'none)    ;; Deactivate justification. Stops  split the lines
(setq-default mode-require-final-newline nil)   ;; Prevent adding a new line  at the end of a file
(defvar whitespace-style '(face trailing tabs)) ;; Something about  margins (white-space-line-column)
(delete-selection-mode t)                       ;; Delete selection with a keypress
(electric-pair-mode t)                          ;; Close autematically parenthesis and double quotes
(electric-indent-mode t)                        ;; Indent a line after pressing return
(show-paren-mode t)                             ;; Highlight matching parents
(setq show-paren-style 'parenthesis)            ;; Set parenthesis as a parent
(global-hl-line-mode +1)                        ;; Highlight the current line
(setq next-line-add-newlines t)                 ;; Don't let next-line add new lines at end of file
;; ====================
;; Buffer
;; ====================

(require 'uniquify)                        ;; Meaningful names for buffers with the same name
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)      ;; Rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*")   ;; Don't muck with special buffers

;; ====================
;; Windows
;; ====================

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)  ;; Smooth scrolling
(windmove-default-keybindings)            ;; Switch between buffers using shift + arrows
(setq truncate-partial-width-windows nil) ;; Truncate lines that are too long

;; ====================
;; Mode line
;; ====================

(line-number-mode t)     ;; Show line number
(column-number-mode t)   ;; Show column number
(size-indication-mode t) ;; Show buffer size in the mode line

;; ====================
;; Line numbers
;; ====================

;;(if (fboundp 'fringe-mode)
;;    (fringe-mode 1))  ;; Make the sides fringe thinner
(global-linum-mode t) ;; show line numbers please!

;; ====================
;; Indent
;; ====================

(setq-default indent-tabs-mode nil)  ;; Don't use tabs to indent
(setq-default tab-width 8)           ;; Width of a TAB character

;; ====================
;; Search
;; ====================

;; Center screen when perform a search
(defadvice
  isearch-forward
  (after isearch-forward-recenter activate)
  (recenter))
(ad-activate 'isearch-forward)

(defadvice
  isearch-repeat-forward
  (after isearch-repeat-forward-recenter activate)
  (recenter))
(ad-activate 'isearch-repeat-forward)

(defadvice
  isearch-repeat-backward
  (after isearch-repeat-backward-recenter activate)
  (recenter))
(ad-activate 'isearch-repeat-backward)

(provide 'set_appearance)
