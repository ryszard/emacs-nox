(require 'cl)

;; use the mouse even if you are working from a terminal.
(require 'mouse)
(require 'mwheel)
(unless window-system
  (xterm-mouse-mode t)
   (mouse-wheel-mode t))


(setq inhibit-splash-screen t)
(setq ns-pop-up-frames nil)
(setq mac-function-modifier  'meta)
(when window-system (scroll-bar-mode -1))
(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)


(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

;; paste at point:
(setq mouse-yank-at-point t)
(setq mouse-wheel-scroll-amount '(0.04))

(global-font-lock-mode t)
(column-number-mode 1)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq make-backup-files nil)
(auto-save-mode -1)
(setq auto-save-default nil)

(require 'undo-tree)
(global-undo-tree-mode)


(which-func-mode)

(iswitchb-mode)
(ido-mode)
(show-paren-mode 1)
(setq ido-enable-flex-matching t)
(require 'uniquify)

(setq uniquify-buffer-name-style 'forward)


(setq savehist-file "~/.emacs.d/.savehist")
(savehist-mode 1)

;; save places in visited files
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/.saveplace")
(require 'saveplace)

(setq ls-lisp-dirs-first t)
(setq comint-prompt-read-only t)
(setq ring-bell-function 'ignore)


;;; cycling windows if there si more than one frame
(global-set-key (kbd "s-`") 'next-multiframe-window)
(global-set-key (kbd "s-~") 'previous-multiframe-window)1

(global-set-key (kbd "M-`") 'next-multiframe-window)
(global-set-key (kbd "M-~") 'previous-multiframe-window)

(setq-default display-buffer-reuse-frames t)
(dolist (el '("/usr/local/bin"))
  (push el exec-path))


(defun split-window-vertically* ()
  "Vertically split window and move to the new buffer."
  (interactive)
  (let ((new-buffer (iswitchb-read-buffer "vsplit ")))
    (split-window-vertically)
    (other-window 1)
    (switch-to-buffer new-buffer)))


(defun split-window-horizontally* ()
  "Horizontaly split window and move to the new buffer."
  (interactive)
  (let ((new-buffer (iswitchb-read-buffer "hsplit ")))
    (split-window-horizontally)
    (other-window 1)
    (switch-to-buffer new-buffer)))

(global-set-key (kbd "C-x 2") 'split-window-vertically*)
(global-set-key (kbd " C-x 3") 'split-window-horizontally*)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))


(global-set-key [(control x) ? ] 'ido-switch-buffer)
