;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:
;;; (setq my-emacs-start-directory (concat user-emacs-directory "my-emacs/"))
;;; (load-file (concat my-emacs-start-directory "init.el"))


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq spacemacs-start-directory (concat user-emacs-directory "spacemacs/"))
(load-file (concat spacemacs-start-directory "init.el"))
