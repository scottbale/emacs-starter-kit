;; Color Theme
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(setq user-specific-dir (concat dotfiles-dir user-login-name))
(add-to-list 'load-path (concat user-specific-dir "/color-theme"))
(add-to-list 'load-path (concat user-specific-dir "/color-theme-solarized"))
(setq color-theme-is-global t)
(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-initialize)
; (color-theme-solarized-dark)
(color-theme-deep-blue)
; (color-theme-dark-laptop)
; (color-theme-dark-blue2)
; (color-theme-blackboard)

(defun compile-load-withns ()
  "Compiles the clj file, loads it into the repl switches the current namespace of the repl to the one the file is in and then switches to the slime repl buffer"
  (interactive)
  (slime-compile-and-load-file)
  (slime-repl-set-package (slime-current-package))
  (slime-switch-to-output-buffer))

(add-hook 'clojure-mode-hook (lambda ()(define-key clojure-mode-map "\C-cd" 'compile-load-withns)))

(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "C-S-f") 'rgrep)
;; (global-set-key (kbd "C-S-n") 'locate)
(global-set-key (kbd "C-S-n") 'find-name-dired)
;; Duplicate line
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

