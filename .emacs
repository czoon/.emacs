;;;; CZOON .emacs


;; Instala package, de Melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; comment the line below if it's not the first time you are running this
  ;; configuration file to save some time at startup
  (package-refresh-contents)

  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)


;; Evil
(unless (package-installed-p 'evil)
	(package-install 'evil))
	(require 'evil)
	(evil-mode 1)

;; Dashboard (pantalla de inicio)
(unless (package-installed-p 'dashboard)
	(package-install 'dashboard))
	(require 'dashboard)
	(dashboard-setup-startup-hook)
	(setq dashboard-banner-logo-title "Welcome to GNU Emacs, one component of the GNU/Linux operating system.")

;; Tema Cyberpunk
(unless (package-installed-p 'cyberpunk-theme)
	(package-install 'cyberpunk-theme))
	(require 'cyberpunk-theme)
	(add-hook 'after-init-hook 
	    (lambda () (load-theme 'cyberpunk t)))


;; https://github.com/Malabarba/smart-mode-line
(unless (package-installed-p 'smart-mode-line)
	(package-install 'smart-mode-line)
	(unless (package-installed-p 'smart-mode-line-powerline-theme) 
	(package-install 'smart-mode-line-powerline-theme)   
	))

(add-hook 'after-init-hook
    (lambda () (sml-setup))
    (lambda () (setq sml/theme 'dark)))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nil nil t)
 '(package-selected-packages (quote (dashboard evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
