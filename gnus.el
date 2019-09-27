;;; package -- Summary
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/.elisp")

(defvar gnus-select-method)
(setq gnus-select-method '(nnnil ""))

;; (setq gnus-thread-sort-functions
;;       '((not gnus-thread-sort-by-date)
;;         (not gnus-thread-sort-by-number))
;;       )

;; personal information
(setq user-mail-address "g.rosso@fineco.it"
      user-full-name	"Giancarlo Rosso"
      )

(defvar gnus-use-cache)
(setq gnus-use-cache t)
(gnus-demon-add-handler 'gnus-demon-scan-news 2 t)
(add-hook 'gnus-after-getting-new-news-hook 'gnus-notifications)
(add-hook 'gnus-summary-mode-hook 'my-setup-hl-line)
(add-hook 'gnus-group-mode-hook 'my-setup-hl-line)
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; search
(require 'nnir)
(setq nnir-method-default-engines
      '((nnml . swish++)))
(setq nnir-swish++-program 'search++)
(setq  nnir-swish++-program "search++")

(defvar gnus-secondary-select-methods)
;; (add-to-list 'gnus-secondary-select-methods '(nnml "FinecoBank"))
(setq gnus-secondary-select-methods '(
                                      (nnml "FinecoBank"
                                            (nnir-search-engine swish++)
                                            )))
(defvar mail-sources)
(defvar pop3-leave-mail-on-server)
(setq mail-sources
      '((pop :server "localhost"
             :port 1110
             :stream network))
      pop3-leave-mail-on-server t
      )

;; Setup to send email through SMTP
(defvar message-send-mail-function)
(defvar smtpmail-smtp-server)
(defvar smtpmail-smtp-service)
(setq message-send-mail-function 'smtpmail-send-it
      send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "localhost"
      smtpmail-smtp-service 1025
      )

;; BBDB: Address list
(require 'bbdb)
(bbdb-initialize 'message 'gnus 'sendmail)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
;; auto-complete emacs address using bbdb UI
(add-hook 'message-mode-hook
          '(lambda ()
             (flyspell-mode t)
             (local-set-key "<TAB>" 'bbdb-complete-name)))
(setq bbdb/news-auto-create-p t)

(cond (window-system
       (setq custom-background-mode 'light)
       (defface my-group-face-1
         '((t (:foreground "Red" :bold t))) "First group face")
       (defface my-group-face-2
         '((t (:foreground "DarkSeaGreen4" :bold t)))
         "Second group face")
       (defface my-group-face-3
         '((t (:foreground "Green4" :bold t))) "Third group face")
       (defface my-group-face-4
         '((t (:foreground "SteelBlue" :bold t))) "Fourth group face")
       (defface my-group-face-5
         '((t (:foreground "Blue" :bold t))) "Fifth group face")))

(setq gnus-group-highlight
      '(((> unread 200) . my-group-face-1)
        ((and (< level 3) (zerop unread)) . my-group-face-2)
        ((< level 3) . my-group-face-3)
        ((zerop unread) . my-group-face-4)
        (t . my-group-face-5)))

;; Flyspell and other group parameters
(add-hook 'message-mode-hook 'my-dictionary)

(defvar my-dictionaries
  '(("mail.*" . "italian"))
  "Alist of newsgroup names and dictionaries to use."
  )

(setq gnus-article-date-headers '(user-defined)
      gnus-article-time-format
      (lambda (time)
        (let* ((date (format-time-string "%a, %d %b %Y %T %z" time))
               (local (article-make-date-line date 'local))
               (combined-lapsed (article-make-date-line date
                                                        'combined-lapsed))
               (lapsed (progn
                         (string-match " (.+" combined-lapsed)
                         (match-string 0 combined-lapsed))))
          (concat local lapsed))))

;; Filter mail
(setq nnmail-split-methods
      '(("mail.Mantis" "^From:.*Mantis Bug Tracker <wiki@fineco.it>")
        ("mail.RedHat" "^From:.*Red Hat Errata Notifications <errata@redhat.com>")
        ("mail.NetFirewall" "^From:.*Net Firewall request <net@fineco.it>")
        ("mail.Segreteria" "^From:.*<segreteria.direzione@fineco.it>")
        ("mail.Deploy" "^Subject: [WAR_ANALYZER .*")
        ("expired" "^From: <VCenterAppliance@fineco.it>\\|^Subject: SINCRONIZZAZIONE FLUSSI BUSINESS_OBJECTS PER WEBGERV\\|^From: <sicurezza@fineco.it>\\|^Subject: Tentato Accesso su.*\\|^Subject: Notifica di tentato accesso\\|^Subject: Public. 1# in error  server:*\\|^Subject: [ OWFS.*\\|^Subject: Warning alert from.*\\|^From: <gsadev-sv01@fineco.it>\\|^Subject: REPORT ELEARNING\\|^From: <siebel@siebel01.fineco.it>\\|^Subject: rsync crontab on.*\\|^Subject: ALERT - Unauthorized access")
        ("mail.misc" ""))
      )
;; Expired in a separate folder
(setq nnmail-expiry-target "nnml:expired")
(setq nnmail-expiry-wait 1)

;; Show all mail groups
(setq gnus-permanently-visible-groups "^nn.*")

(defun my-dictionary ()
  "Determine what dictionary to use based on the current message."
  (let ((dictionary (catch 'dictionary
                      (dolist (item my-dictionaries)
                        (when (string-match (car item) gnus-newsgroup-name)
                          (throw 'dictionary (cdr item)))))))
    (when dictionary
      (set (make-local-variable 'ispell-local-dictionary) dictionary))))


(defun my-setup-hl-line ()
  "Function that highlight current line."
  (hl-line-mode t)
  (setq cursor-type nil) ; Comment this out, if you want the cursor to
                                        ; stay visible.
  )

 (setq-default
  gnus-summary-line-format "%U%R%z%I %6N %5&user-date; %(%[%-23,23f]%) %s\n"
  gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M"))
  ;; gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
  ;; gnus-thread-sort-functions '(gnus-thread-sort-by-date)
  ;; gnus-sum-thread-tree-false-root ""
  ;; gnus-sum-thread-tree-indent " "
  ;; gnus-sum-thread-tree-leaf-with-other "├► "
  ;; gnus-sum-thread-tree-root ""
  ;; gnus-sum-thread-tree-single-leaf "╰► "
  ;; gnus-sum-thread-tree-vertical "│"
  gnus-thread-hide-subtree t
  gnus-thread-ignore-subject t
  gnus-treat-date-local t
  )

;; search mail
(setq nnir-search-engine 'swish++)
(setq nnir-swish++-program "search++")
(setq nnir-swish++-index-file "/home/giancarlorosso/Mail/swish++.index.new")

(provide 'gnus)
;;; gnus.el ends here
