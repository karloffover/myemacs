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
 '(default-frame-alist (quote ((vertical-scroll-bars) (font . "Source Code Pro"))))
 '(epa-global-mail-mode t)
 '(epa-pinentry-mode (quote ask))
 '(epg-gpg-home-directory "C:\\Users\\giancarlorosso\\AppData\\Roaming\\gnupg")
 '(epg-gpg-program
   "C:\\Users\\giancarlorosso\\AppData\\Local\\GnuPG\\bin\\gpg.exe")
 '(epg-gpgconf-program
   "C:\\Users\\giancarlorosso\\AppData\\Local\\GnuPG\\bin\\gpgconf.exe")
 '(exec-path
   (quote
    ("c:/Program Files (x86)/Common Files/Oracle/Java/javapath" "C:/Windows/system32" "C:/Windows" "C:/Windows/System32/Wbem" "C:/Windows/System32/WindowsPowerShell/v1.0/" "C:/Windows/System32/OpenSSH/" "C:/Program Files (x86)/CheckPoint/Endpoint Security/Endpoint Common/bin" "C:/Program Files/TortoiseSVN/bin" "C:/Program Files/Git/cmd" "C:/Users/giancarlorosso/AppData/Local/Microsoft/WindowsApps" "C:/Users/giancarlorosso/AppData/Local/Programs/Microsoft VS Code/bin" "C:/Users/giancarlorosso/AppData/Local/Gpg4win/../GnuPG/bin" "c:/Users/giancarlorosso/Applications/emacs-26.3-x86_64/libexec/emacs/26.3/x86_64-w64-mingw32" "c:/msys64/usr/bin")))
 '(flx-ido-mode t)
 '(global-company-mode t)
 '(global-undo-tree-mode t)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-faces nil)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(mouse-yank-at-point t)
 '(org-capture-templates
   (quote
    (("n" "Note" entry
      (file+headline
       (concat org-directory "/notes.org")
       "Notes")))))
 '(org-crypt-key "237BFD753F23A07FEDFCA79FA418FD130C08336D")
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-crypt org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-tags-exclude-from-inheritance (quote ("crypt")))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/"))))
 '(package-enable-at-startup t)
 '(package-selected-packages
   (quote
    (projectile password-store ace-window jinja2-mode yaml-mode undo-tree smex json-mode groovy-mode flycheck flx-ido company org-crypt)))
 '(save-interprogram-paste-before-kill t)
 '(save-place-file (concat user-emacs-directory "places"))
 '(scroll-bar-mode nil)
 '(select-enable-clipboard t)
 '(select-enable-primary t)
 '(setq inhibit-startup-screen t)
 '(smex-save-file (concat user-emacs-directory ".smex-items"))
 '(tool-bar-mode nil)
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
