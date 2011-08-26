(defun compile-load-withns ()
  "Compiles the clj file, loads it into the repl switches the current namespace of the repl to the one the file is in and then switches to the slime repl buffer"
  (interactive)
  (slime-compile-and-load-file)
  (slime-repl-set-package (slime-current-package))
  (slime-switch-to-output-buffer))

(add-hook 'clojure-mode-hook (lambda ()(define-key clojure-mode-map "\C-cd" 'compile-load-withns)))
