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
 '(org-agenda-custom-commands
   '(("n" "Agenda and all TODOs"
      ((agenda ""
               ((org-agenda-skip-function
                 '(org-agenda-skip-if-scheduled-later))))
       (alltodo "" nil))
      nil)))
 '(org-agenda-files '("~/org" "~/org/roam"))
 '(org-agenda-todo-ignore-scheduled 'future))
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
