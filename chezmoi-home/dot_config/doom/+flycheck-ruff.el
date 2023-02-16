;;; flycheck-ruff.el -*- lexical-binding: t; -*-

;; https://github.com/flycheck/flycheck/issues/1974#issuecomment-1343495202

(require 'flycheck)

(flycheck-define-checker python-ruff
  "A Python syntax and style checker using the ruff utility.
To override the path to the ruff executable, set
`flycheck-python-ruff-executable'.
See URL `http://pypi.python.org/pypi/ruff'."
  :command ("ruff"
            "--format=text"
            (eval (when buffer-file-name
                    (concat "--stdin-filename=" buffer-file-name)))
            "-")
  :standard-input t
  :error-filter (lambda (errors)
                  (let ((errors (flycheck-sanitize-errors errors)))
                    (seq-map #'flycheck-flake8-fix-error-level errors)))
  :error-patterns
  ((warning line-start
            (file-name) ":" line ":" (optional column ":") " "
            (id (one-or-more (any alpha)) (one-or-more digit)) " "
            (message (one-or-more not-newline))
            line-end))
  :modes python-mode)

(add-to-list 'flycheck-checkers 'python-ruff)

(provide 'flycheck-ruff)

(defun python-flycheck-setup ()
  (flycheck-add-next-checker 'lsp 'python-ruff))
(add-hook 'python-mode-lsp-hook
          #'python-flycheck-setup)
