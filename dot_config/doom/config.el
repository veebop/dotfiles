;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Fira Code" :size 11 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Lexend" :size 13))

(setq display-line-numbers-type 'relative)

(setq org-directory "~/Documents/Org/")

;; Automatic dark/light mode
(after! doom-themes
  (setq! auto-dark-dark-theme 'doom-molokai
         auto-dark-light-theme 'doom-tomorrow-day)
  (auto-dark-mode 1))
