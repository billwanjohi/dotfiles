(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-at-remote-remote-type-domains
   '(("bitbucket.org" . "bitbucket")
     ("github.com" . "github")
     ("gitlab.com" . "gitlab")
     ("git.savannah.gnu.org" . "gnu")
     ("gist.github.com" . "gist")
     ("git.sr.ht" . "sourcehut")
     ("pagure.io" . "pagure")
     ("src.fedoraproject.org" . "pagure")
     ("git.civicactions.net" . "gitlab")))
 '(jiralib-url "https://lincsportal.atlassian.net")
 '(lsp-file-watch-ignored-directories
   '("[/\\\\]\\.git\\'" "[/\\\\]\\.hg\\'" "[/\\\\]\\.bzr\\'" "[/\\\\]_darcs\\'" "[/\\\\]\\.svn\\'" "[/\\\\]_FOSSIL_\\'" "[/\\\\]\\.idea\\'" "[/\\\\]\\.ensime_cache\\'" "[/\\\\]\\.eunit\\'" "[/\\\\]node_modules" "[/\\\\]\\.fslckout\\'" "[/\\\\]\\.tox\\'" "[/\\\\]dist\\'" "[/\\\\]dist-newstyle\\'" "[/\\\\]\\.stack-work\\'" "[/\\\\]\\.bloop\\'" "[/\\\\]\\.metals\\'" "[/\\\\]target\\'" "[/\\\\]\\.ccls-cache\\'" "[/\\\\]\\.vscode\\'" "[/\\\\]\\.deps\\'" "[/\\\\]build-aux\\'" "[/\\\\]autom4te.cache\\'" "[/\\\\]\\.reference\\'" "[/\\\\]bin/Debug\\'" "[/\\\\]obj\\'" "[/\\\\]\\.scrapy\\'"))
 '(lsp-pyright-venv-path "~/.cache/pypoetry/virtualenvs")
 '(org-agenda-custom-commands
   '(("n" "Agenda and all TODOs"
      ((agenda ""
               ((org-agenda-skip-function
                 '(org-agenda-skip-if-scheduled-later))))
       (alltodo "" nil))
      nil)))
 '(org-agenda-files '("~/org" "~/org/roam"))
 '(org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled)
 '(org-agenda-skip-scheduled-if-deadline-is-shown 'not-today)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-todo-ignore-scheduled 'future)
 '(org-jira-working-dir "~/org/jira"))
 '(org-priority-faces
   '((65 . error)
     (66 . warning)
     (67 . success)
     (68 . success)))
 '(org-priority-lowest 68)
 '(org-scheduled-past-days 4)
 '(todoist-backing-buffer "~/org/todoist.org")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; https://emacs.stackexchange.com/a/29838/18070
;;; Entry in `org-agenda-custom-commands':
;;  (org-agenda-skip-function '(org-agenda-skip-if-scheduled-later))
(defun org-agenda-skip-if-scheduled-later ()
"If this function returns nil, the current match should not be skipped.
Otherwise, the function must return a position from where the search
should be continued."
  (ignore-errors
    (let ((subtree-end (save-excursion (org-end-of-subtree t)))
          (scheduled-seconds
           (time-to-seconds
            (org-time-string-to-time
             (org-entry-get nil "SCHEDULED"))))
          (now (time-to-seconds (current-time))))
      (and scheduled-seconds
           (>= scheduled-seconds now)
           subtree-end))))
