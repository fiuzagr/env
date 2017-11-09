;; User
(setq user-full-name "Fiuza")
(setq user-mail-address "fiuzagr@gmail.com")

;; Custom file
(setq custom-file (concat fiuzagr-start-directory "custom.el"))
(load custom-file t)

;; Packages
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))

(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
      (package-install 'use-package))

(require 'use-package)

;; UTF-8
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; please
(prefer-coding-system        'utf-8)   ; with sugar on top
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; Start up
; splash screen
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

; scroll bar, tool bar, menu bar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

; marking text
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

; display
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

; yes and no
(fset 'yes-or-no-p 'y-or-n-p)

; scroolling
(setq scroll-conservatively 10000
      scroll-preserve-screen-position t)

; misc
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

;; Themes
; font
(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline Light" ))
(set-face-attribute 'default t :font "Source Code Pro for Powerline Light" )

;; Extensions
; org-mode
(use-package org)

; mode-line
(use-package smart-mode-line
  :ensure t
  :config
  (progn
    (sml/setup)))
