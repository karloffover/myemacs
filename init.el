;; pre-init.el contiene informazioni relative al proxy.
;; il file deve essere escluso dal repo
(setq pre-init-file (concat user-emacs-directory "pre-init.el"))
(load pre-init-file 'noerror)
(package-initialize)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
