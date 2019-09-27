(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(apropos-do-all t)
 '(backup-directory-alist (\` (("." \, (concat user-emacs-directory "backups")))))
 '(company-dabbrev-downcase nil)
 '(compilation-read-command nil)
 '(custom-enabled-themes (quote (wombat)))
 ;; '(epg-gpg-program "gpg2")
 '(global-company-mode t)
 '(global-undo-tree-mode t)
 '(mouse-yank-at-point t)
 '(org-capture-templates
   (quote
    (("n" "Note" entry
      (file+headline
       (concat org-directory "/notes.org")
       "Notes")))))
 '(org-directory "~/Documents/Agenda")
 '(package-selected-packages
   (quote
    (ace-window exwm-x haskell-mode pass jinja2-mode yaml-mode undo-tree smex projectile magit-gerrit json-mode groovy-mode flycheck flx-ido exwm company cider)))
 '(save-interprogram-paste-before-kill t)
 '(save-place-file (concat user-emacs-directory "places"))
 '(save-place-mode t nil (saveplace))
 '(select-enable-clipboard t)
 '(select-enable-primary t)
 '(setq inhibit-startup-screen t)
 '(show-paren-mode 1)
 '(smex-save-file (concat user-emacs-directory ".smex-items"))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
