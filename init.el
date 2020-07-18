
;; Add the org, melpa, melpa-stable and gnu servers to list of package mirrors
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'load-path "~/emacs.d/offline-packages")

(setq package-enable-at-startup nil)
(package-initialize)

;; Instruct Emacs to use use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; require use-package
(eval-when-compile
 (require 'use-package))

; atom-one-dark theme as main theme for emacs
(use-package atom-one-dark-theme
  :ensure t)

   ; org-beautify for a prettier org mode
(use-package org-beautify-theme
  :ensure t)

;; (use-package base16-theme
;;   :ensure t
;;   :config
;;   (load-theme 'base16-atelier-estuary t))

; the smart mode line
(use-package smart-mode-line
  :ensure t)

(use-package shell-pop
  :ensure t)

(use-package openwith
  :ensure t
  :config
  (setq openwith-associations
            (list
             (list (openwith-make-extension-regexp
                    '("mpg" "mpeg"  "mp4"
                      "avi" "wmv" "wav" "mov" "flv"
                      "ogm"  "mkv"))
                   "mpv"
                   '(file))
             ;; (list (openwith-make-extension-regexp
             ;;        '("xbm" "pbm" "pgm" "ppm" "pnm"
             ;;          "png" "gif" "bmp" "tif" "jpeg" "jpg"))
             ;;       "geeqie"
             ;;       '(file))
             (list (openwith-make-extension-regexp
                    '("doc" "xls" "ppt" "odt" "ods" "odg" "odp" "xlsx"))
                   "libreoffice"
                   '(file))
             (list (openwith-make-extension-regexp
                    '("pdf" "ps" "ps.gz" "dvi"))
                   "zathura"
                   '(file))
             ))
      (openwith-mode 1))


;; which key packe pops up a list of possible key combinations after pressing 
;; for example C-x
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package ace-window
  :ensure t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))



;; helm package - extremely useful
;; (use-package helm
;;   :ensure t
;;   :init (require 'helm)
;;   :config
;;   (helm-mode t))
(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d%d)")
  (ivy-mode 1))

(use-package all-the-icons-ivy
  :ensure t
  :init
  (all-the-icons-ivy-setup))

(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode . all-the-icons-dired-mode))



;; The perspeen package provides layouts and vim-style tabs for emacs
(use-package perspeen
  :ensure t
  :init
  (setq perspeen-use-tab t)
  :config
  (perspeen-mode t))

;; watch images and print image-thumbnails in dired
(use-package image-dired
  :ensure t
  :config
  (setq image-dired-thumb-margin 5))

;; yasnippet for snippets
(use-package yasnippet
  :ensure t
  :config
  (add-hook 'org-mode-hook 'yas-minor-mode)
  (add-hook 'web-mode-hook 'yas-minor-mode)
  (add-hook 'elpy-mode-hook 'yas-minor-mode))
;; A snippets pack for multiple modes
(use-package yasnippet-snippets
  :ensure t)

;; makes it possible to use python regular expressions in emacs

(use-package visual-regexp-steroids
  :ensure t
  :config
  (require 'visual-regexp-steroids))

;; install evil leader
;; (use-package evil-leader
;;   :ensure t
;;   :config
;;   (evil-leader/set-leader "<SPC>")
;;   (evil-leader/set-key
;;     "f" 'find-file)) 

 ;; Vim style navigation key bindins
(use-package evil
  :ensure t
  :init
  (setq evil-disable-insert-state-bindings t)
  (setq evil-toggle-key "C-?")
  (require 'evil)
  :config)


;; view mode for modal editing
(use-package view
  :ensure t
  :bind(:map view-mode-map
	     ("n" . forward-line)
	     ("p" . previous-line)))
  


;; vim-key bindings in org mode
;; (use-package evil-org
;;   :ensure t
;;   :after org
;;   :config
;;   (add-hook 'org-mode-hook 'evil-org-mode)
;;   (add-hook 'evil-org-mode-hook
;; 	    (lambda ()
;; 	      (evil-org-set-key-theme)))
;;   (require 'evil-org-agenda)
;;   (evil-org-agenda-set-keys))

;; key chord lets you define keybindings
;; used to press "jk" to enter the evil normal state 
(use-package key-chord
  :ensure t
  :init
  (require 'key-chord)
  (key-chord-mode 1)
  (key-chord-define-global "qq" 'view-mode)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

;; press gcc in normal mode to comment a line
(use-package evil-commentary
  :ensure t
  :init
  (evil-commentary-mode))

;; Git integration
(use-package magit
  :ensure t)
  

;; inserts parantheses automatically
(use-package paredit
   :ensure t)

;; project amangement
(use-package projectile
   :ensure t)

;; make the parens coloured
(use-package rainbow-delimiters
   :ensure t)
   
;; check syntax and style on the fly
(use-package flycheck
  :ensure t)

;; R integration
(use-package ess
  :ensure t
  :init (require 'ess-site))

(use-package expand-region
  :ensure t)

;; enhanced python integration
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; web-mode for better html and css support
(use-package web-mode
  :ensure t
  :init
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq js-indent-level 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t)
  (add-hook 'web-mode-hook 'electric-pair-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
(setq web-mode-engines-alist
      '(("jinja2"    . "\\.jinja2\\'")
        ("django"    . "\\.html\\'")))
  :config
  :mode ("\\.html$" . web-mode)
  :mode ("\\.css$" . web-mode)
)

(use-package dot-mode
  :ensure t
  :config
  (dot-mode-on))

;; sass-mode, makes it possible to use sass
(use-package sass-mode
  :ensure t
  :mode ("\\.scss$" . sass-mode))

;; browse css/scss classes with helm
(use-package helm-css-scss
  :ensure t)


;; for zencoding
(use-package emmet-mode
  :ensure t
  :commands (emmet-mode
             emmet-next-edit-point
             emmet-prev-edit-point)
  :init
  (setq emmet-indentation 2)
  (setq emmet-move-cursor-between-quotes t)
  :config
  ;; Auto-start on any markup modes
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode))

(use-package julia-mode
  :ensure t)

;; pretty bullets
(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda ()
			     (org-bullets-mode 1))))

 ;; group org items im a better way
(use-package org-super-agenda
  :ensure t)
  ;; :config
  ;;   (setq org-super-agenda-groups
  ;;     '((:name "Today"
  ;;              :time-grid t
  ;; 	       :scheduled today
  ;;              )
  ;;       (:name "Important"
  ;;              :priority "#A")
  ;; 	(:name "Habits"
  ;; 	       :habit t)
  ;;       (:name "Quick Picks"
  ;;              :effort< "0:30")
  ;; 	(:name "Sonstiges"
  ;; 	       :tag "Administration")
  ;;       (:name "Future"
  ;;              :scheduled future
  ;; 	       ))))

(with-eval-after-load 'org
    ;; here goes your Org config :)
    ;; ....

    ;; Configure org-super-agenda
    (require 'org-super-agenda)
    (org-super-agenda-mode t)
    (setq org-agenda-custom-commands
          '(("z" "Super view"
             ((agenda "" ((org-agenda-span 'day)
                          (org-super-agenda-groups
                           '((:name "Today"
                                    :time-grid t
                                    :date today
                                    :todo "TODAY"
                                    :scheduled today
                                    :order 1)))))
              (alltodo "" ((org-agenda-overriding-header "")
                           (org-super-agenda-groups
                            '((:name "Important"
                                   :tag "Important"
                                   :priority "A"
                                   :order 2)
                              (:name "Next to do"
                                     :todo "NEXT"
                                     :order 5)
                              (:name "Personal"
                                     :tag "@personal"
                                     :order 10)
                              (:name "Work"
                                     :tag "@work"
                                     :order 15)
                              (:name "To read"
                                     :tag "Read"
                                     :order 30)
                              (:name "Waiting"
                                     :todo "WAITING"
                                     :order 40)
                              (:name "Due Today"
                                     :deadline today
                                     :order 2)
                              ))))))))
 
)

 ;; bibtex citations for Org mode
(use-package org-ref
  :ensure t
  :init
    (setq reftex-default-bibliography '("~/Dokumente/MastersThesis/references.bib"))
    (setq org-ref-default-bibliography '("~/Dokumente/MastersThesis/references.bib")
	org-ref-pdf-directory "~/Dokumente/ResearchPaper"
	))


(use-package counsel
  :ensure t)

(use-package company
  :ensure t
  :config
  (global-company-mode))

 ;; Latex integration !!!! MAY NOT WORK PROPERLY!!!!
(use-package auctex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-PDF-mode t)
    (load "auctex.el" nil t t)
    (load "preview-latex.el" nil t t))

;; use helm to browse and search bibtex entries
  (use-package helm-bibtex
    :ensure t)

;; standard academic phrases used in papers
(use-package academic-phrases
  :ensure t)

;; A thesaurus for emacs
(use-package synosaurus
  :ensure t)

(use-package elfeed
  :ensure t
  :config
  (setq elfeed-feeds
	'("http://tagesschau.de/xml/atom"
	"https://www.economist.com/europe/rss.xml"
	"https://www.economist.com/the-world-this-week/rss.xml")))

(use-package elfeed-goodies
  :ensure t
  :config
  (elfeed-goodies/setup))


;; (setq elfeed-show-entry-switch #'elfeed-display-buffer)

;; (defun elfeed-display-buffer (buf &optional act)
;;   (pop-to-buffer buf)
;;   (set-window-text-height (get-buffer-window) (round (* 0.7 (frame-height)))))

(require 'epa-file)
(epa-file-enable)
(setq epa-pinentry-mode 'loopback)



;(setq org-src-tab-acts-natively t)
(setq org-src-preserve-indentation t)

;; Let org mode show images inline
(setq org-startup-with-inline-images t)

  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "/home/christian/Dokumente/Privat/privat.org" "Inbox")
          "* TODO %?\n  %i\n  %a")
          ("j" "Journal" entry (file+datetree "~/org/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("a" "Scheduled TODO" entry (file+headline "~/Dokumente/Privat/privat.org" "Inbox")
           "* TODO %? %^G \nSCHEDULED: %^t\n  %U" :empty-lines 1)
          ("d" "Deadline" entry (file+headline  "~/Dokumente/Privat/privat.org" "Inbox")
           "* TODO %? %^G \n DEADLINE: %^t" :empty-lines 1)
          ("s" "Shopping Item" entry (file+headline "~/Dokumente/Privat/privat.org" "Inbox")
          "* TODO %? %^G \nSCHEDULED: %^t\n  %U" :empty-lines 1)
          ("p" "Project" entry (file "~/Dokumente/projects.org.gpg")
           "*  %? %i " :empty-lines 1)
          ("i" "Idea" entry (file "~/Dokumente/ideas.org")
           "*  %? %i %^G" :empty-lines 1)
          ("c" "Schedule & Deadline" entry (file+headline  "~/Dokumente/Privat/privat.org" "Inbox")
           "* TODO %? %^G \nSCHEDULED: %^t\n DEADLINE: %^t" :empty-lines 1)
          ("b" "Bookmark" entry (file+headline "~/Dokumente/Privat/privat.org" "Inbox")
  	         "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n" :empty-lines 1)
         ))

  (setq org-todo-keywords
        '((sequence "NEXT(n)" "TODO(t)" "WAITING(w)" "SOMEDAY(s)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-tag-alist '(("Masters Thesis" . ?u) ("Lesen" . ?l) ("Daily" . ?d) ("@personal" . ?p) ("coding" . ?c) ("@work" . ?w) ("Administration" . ?a) ("Buch" . ?b)))

(setq org-directory "~/Dokumente/Privat/")
(setq org-agenda-files '("~/Dokumente/Privat/privat.org"))
;; (setq org-agenda-span 2)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (python . t)
   (emacs-lisp . t)
   (shell . t)
   (sql . t)
   (sqlite . t)))

;;==== HYDRA MENUS =====
;; (defhydra hydra-workspace (evil-normal-state-map "C-ü")
;;   "Perspeen"
;;   ("c" perspeen-create-ws)
;;   ("n" perspeen-next-ws)
;;   ("p" perspeen-previous-ws)
;;   ("d" perspeen-delete-ws)
;;   ("r" perspeen-rename-ws))


;; (defhydra hydra-tab (evil-normal-state-map "C-t")
;;   "Perspeen"
;;   ("c" perspeen-tab-create-tab)
;;   ("n" perspeen-tab-next)
;;   ("d" perspeen-tab-del)
;;   ("p" perspeen-tab-prev))

(defhydra hydra-tab (global-map "C-t")
  "Perspeen"
  ("c" perspeen-tab-create-tab)
  ("n" perspeen-tab-next)
  ("d" perspeen-tab-del)
  ("p" perspeen-tab-prev))

(defhydra hydra-workspace (global-map "C-ü")
  "Perspeen"
  ("c" perspeen-create-ws)
  ("n" perspeen-next-ws)
  ("p" perspeen-previous-ws)
  ("d" perspeen-delete-ws)
  ("r" perspeen-rename-ws))



;;==== KEYBINDINGS=====
;; (global-set-key (kbd "C-s") 'swiper-isearch)
;; (global-set-key (kbd "C-r") 'swiper-isearch)
(global-set-key (kbd "M-s") 'swiper-isearch)
;; (global-set-key (kbd "M-s") 'shell-pop)
(global-set-key (kbd "M-ü") 'er/expand-region)
(global-set-key (kbd "C-ö") 'shell-pop)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key "\C-x\C-m" 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "M-Z") 'zap-to-char)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-x a") 'org-agenda)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)

(all-the-icons-ivy-setup)

;; Evil bindings
(define-key evil-normal-state-map (kbd "C-s") 'swiper-isearch)
(define-key evil-normal-state-map (kbd "C-r") 'swiper-isearch)
(evil-define-key nil normal-state-map
  "/" 'vr/isearch-forward
  "?" 'vr/isearch-backward)
(evil-ex-define-cmd "ls" 'ivy-switch-buffer)

;;==== GENERAL SETUP=====
;; (set-frame-font "MesloLGL Nerd Font Mono 11" nil t)
(set-frame-font "RobotoMono Nerd Font 11" nil t)

;; (set-frame-font "DejaVuSansMono Nerd Font 12" nil t)
;; (set-frame-font "DejaVuSans 12" nil t)
;; (set-frame-font "mononoki Nerd Font 12" nil t)


(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-page 'disabled nil)

(setq delete-old-versions -1) ;; delete excess backup versions silently
(setq version-control t) ; use version control
(setq vc-make-backup-files t) ;; make backup files even when in version controlled dir
(setq backup-directory-alist'(("." . "~/.emacs.d/backups"))) ; which directory to put backup files
(setq vc-follow-symlinks t) ; Follow sym link
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t))) ;; transform backups file name
(setq inhibit-startup-screen t) ;; don't show startup screen
(setq ring-bell-function 'ignore) ; silent bell, loud bell is annoying
(setq coding-system-for-read 'utf-8) ; use utf-8 by default
(setq coding-system-for-write 'utf-8)
(setq sentence-end-double-space nil) ;; sentence should end with only a point.
(setq default-fill-column 80) ;; toggle wrapping after 80 chars
(setq-default cursor-type 'bar) ;; set the cursor to a bar
(defalias 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode +1)

(setq-default major-mode 'text-mode)
(global-display-line-numbers-mode)
(electric-pair-mode)
(global-subword-mode 1)
(show-paren-mode 1)
(setq-default inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(windmove-default-keybindings)
(load-theme 'atom-one-dark t)
(load-theme 'org-beautify t)
;;(set-background-color "black")
;;(sml/setup)
(add-hook 'emacs-startup-hook 'dired)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a37d20710ab581792b7c9f8a075fcbb775d4ffa6c8bce9137c84951b1b453016" "6b2c6e5bc1e89cf7d927d17f436626eac98a04fdab89e080f4e193f6d291c93d" "4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" "669e02142a56f63861288cc585bee81643ded48a19e36bfdf02b66d745bcc626" "6a0edb6b0f4c6d0566325cf91a1a34daa179e1979136ce0a528bf83aff9b7719" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "446cc97923e30dec43f10573ac085e384975d8a0c55159464ea6ef001f4a16ba" "bc4c89a7b91cfbd3e28b2a8e9e6750079a985237b960384f158515d32c7f0490" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "250268d5c0b4877cc2b7c439687f8145a2c85a48981f7070a72c7f47a2d2dc13" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "ecfd522bd04e43c16e58bd8af7991bc9583b8e56286ea0959a428b3d7991bbd8" "59ba50f24540958f33699a5247255d10f34dd812f3975837e3eddccdc4caa32e" "d8e3a2b8c72c3cb52d070a5e1969849197488b92d7211cc86c97e033239fdde2" "4b2679eac1095b60c2065187d713c39fbba27039d75c9c928a1f3b5d824a3b18" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "bbb521edff9940ba05aeeb49f9b247e95e1cb03bd78de18122f13500bda6514f" "a0bfb4d94ef0a0893a9b19628403c5ac4847c981c8942a50fde0f273df47424a" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "08e0ba7881c93bc4ecb393df5de4c696ee820d586872ab5d42bb26834c9770eb" "9c4acf7b5801f25501f0db26ac3eee3dc263ed51afd01f9dcfda706a15234733" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "819d24b9aba8fcb446aecfb59f87d1817a6d3eb07de7fdec67743ef32194438b" "f984e2f9765a69f7394527b44eaa28052ff3664a505f9ec9c60c088ca4e9fc0b" "d9741f492c26b4e1c93874ee10476ca233e496827740b3fdb3aa6b6df871d449" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "a62f0662e6aa7b05d0b4493a8e245ab31492765561b08192df61c9d1c7e1ddee" "c614d2423075491e6b7f38a4b7ea1c68f31764b9b815e35c9741e9490119efc0" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "ed4c48eb91d07c2e447b445e2491ef17e9b326d43a60022297fd56af4749e772" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "f5f3a6fb685fe5e1587bafd07db3bf25a0655f3ddc579ed9d331b6b19827ea46" "04790c9929eacf32d508b84d34e80ad2ee233f13f17767190531b8b350b9ef22" "45a8b89e995faa5c69aa79920acff5d7cb14978fbf140cdd53621b09d782edcf" "41eb3fe4c6b80c7ad156a8c52e9dd6093e8856c7bbf2b92cc3a4108ceb385087" "fc7fd2530b82a722ceb5b211f9e732d15ad41d5306c011253a0ba43aaf93dccc" "b67b2279fa90e4098aa126d8356931c7a76921001ddff0a8d4a0541080dee5f6" "264b639ee1d01cd81f6ab49a63b6354d902c7f7ed17ecf6e8c2bd5eb6d8ca09c" "542e6fee85eea8e47243a5647358c344111aa9c04510394720a3108803c8ddd1" "3e34e9bf818cf6301fcabae2005bba8e61b1caba97d95509c8da78cff5f2ec8e" "cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "aded4ec996e438a5e002439d58f09610b330bbc18f580c83ebaba026bbef6c82" default)))
 '(elfeed-goodies/entry-pane-position (quote bottom))
 '(elfeed-goodies/html-decode-title-tags (quote (nil nil)))
 '(elfeed-goodies/switch-to-entry nil)
 '(inhibit-startup-screen nil)
 '(org-agenda-files (quote ("~/Dokumente/Privat/privat.org")))
 '(org-startup-with-inline-images t)
 '(org-super-agenda-groups
   (quote
    ((:name "Today" :time-grid t :scheduled today)
     (:name "Important" :priority "#A")
     (:name "Habits" :habit t)
     (:name "Quick Picks" :effort< "0:30")
     (:name "Sonstiges" :tag "Administration")
     (:name "Future" :scheduled future))))
 '(org-super-agenda-mode t)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (hc-zenburn-theme zenburn-theme ace-window win-switch openwith elfeed-goodies elfeed base16-theme yasnippet-snippets which-key web-mode visual-regexp-steroids use-package synosaurus smart-mode-line shell-pop sass-mode rainbow-delimiters projectile perspeen paredit org-super-agenda org-ref org-bullets org-beautify-theme magit luarocks lua-mode helm-css-scss flycheck expand-region evil-commentary ess emmet-mode elpy dot-mode counsel auctex atom-one-dark-theme all-the-icons-ivy all-the-icons-dired academic-phrases)))
 '(shell-pop-shell-type (quote ("shell" "*shell*" (lambda nil (shell))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#ABB2BF" :background "#282C34")))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
