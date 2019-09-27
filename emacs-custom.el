(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(apropos-do-all t)
 '(async-bytecomp-package-mode t)
 '(backup-directory-alist (\` (("." \, (concat user-emacs-directory "backups")))))
 '(company-dabbrev-downcase nil)
 '(compilation-read-command nil)
 '(custom-enabled-themes (quote (wombat)))
 '(global-company-mode t)
 '(global-undo-tree-mode t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(mouse-yank-at-point t)
 '(org-capture-templates
   (quote
    (("n" "Note" entry
      (file+headline
       (concat org-directory "/notes.org")
       "Notes")))))
 '(org-directory "~/Documents/Agenda")
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/"))))
 '(package-enable-at-startup t)
 '(package-selected-packages
   (quote
    (password-store ace-window jinja2-mode yaml-mode undo-tree smex projectile json-mode groovy-mode flycheck flx-ido company)))
 '(save-interprogram-paste-before-kill t)
 '(save-place-file (concat user-emacs-directory "places"))
 '(save-place-mode t nil (saveplace))
 '(select-enable-clipboard t)
 '(select-enable-primary t)
 '(setq inhibit-startup-screen t)
 '(show-paren-mode 1)
 '(smex-save-file (concat user-emacs-directory ".smex-items"))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(url-proxy-services
   (quote
    (("http" . "proxy-v1.fineco.it:3128")
     ("https" . "proxy-v1.fineco.it:3128")
     ("no_proxy" . "*.fineco.it"))))
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
