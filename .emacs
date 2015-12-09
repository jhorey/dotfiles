;; Create a shortcut to delete backwards word.
;; Works by navigating back a word, and then killing the word.

;; ;; Jade is a HTML templating language
;; (add-to-list 'load-path "~/.emacs.d/jade-mode")
;; (require 'sws-mode)
;; (require 'jade-mode)
;; (add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
;; (add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; Match parantheses
;; (defun goto-match-paren (arg)
;;   (interactive "p")
;;   (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;;         ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;;         (T (self-insert-command (or arg 1)))))

;; Package manager
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; Turn on subword mode
(subword-mode 1)

;; Show matching parantheses
(show-paren-mode 1)

;; Alternative shortcut for growing window
(global-set-key (kbd "C-x e") 'enlarge-window)

;; Short for goto-line
(global-set-key (kbd "C-x g") 'goto-line)

;; High light current line
(global-hl-line-mode 1)

;; Turn on line numbers by default
(global-linum-mode 1)

;; Turn on better buffer switching
;; (iswitchb-mode 1)
(ido-mode 1)
;; (icomplete-mode 1)

;; Set cursor and mouse-pointer colours
(set-cursor-color "red")
(set-mouse-color "goldenrod")

;; Set region background colour
(set-face-background 'region "blue")

;; Set emacs background colour
(set-background-color "black")

;; Set emacs background colour
(set-foreground-color "snow")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  ;; '(menu-bar-mode nil)
 '(tool-bar-mode nil))


;;; Indentation for python

;; Ignoring electric indentation
(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for python-mode"
  (if (equal major-mode 'python-mode)
      'no-indent
    nil))
(add-hook 'electric-indent-functions 'electric-indent-ignore-python)

;; Enter key executes newline-and-indent
(defun set-newline-and-indent ()
  "Map the return key with `newline-and-indent'"
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'python-mode-hook 'set-newline-and-indent)

;;; Automatically indent yanked text. 
(defun yank-and-indent ()
  "Yank and then indent the newly formed region according to mode."
  (interactive)
  (yank)
  (call-interactively 'indent-region))
;; (global-set-key "\C-y" 'yank-and-indent)

;;; Create matching parentheses
(electric-pair-mode 1)

(setq mac-option-key-is-meta t)
(setq mac-option-modifier 'meta)

;; Turn on R-mode
(require 'ess)
(add-to-list 'auto-mode-alist '("\\.R\\'" . R-mode))
