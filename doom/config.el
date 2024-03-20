;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept.
(if (find-font (font-spec :name "Liga SFMono Nerd Font"))
    (cond
     ((eq system-type 'windows-nt)
      (setq doom-font (font-spec :family "Liga SFMono Nerd Font" :size 16)))
     ((eq system-type 'gnu/linux) ; Linux/WSL
      (setq doom-font (font-spec :family "Liga SFMono Nerd Font" :size 16)
            doom-big-font (font-spec :family "Liga SFMono Nerd Font" :size 24)))
     ((eq system-type 'darwin) ; MacOS
      (setq doom-font (font-spec :family "Liga SFMono Nerd Font" :size 20)
            doom-big-font (font-spec :family "Liga SFMono Nerd Font" :size 22)))
     (t ; Any other OS
      (setq doom-font (font-spec :family "Liga SFMono Nerd Font" :size 12)))))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-acario-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; CUSTOM
;;; Editor
;;;; Wrap Text
(global-visual-line-mode t)

;;; Splashscreen
(defun splashscreen-lambda ()
  (let* ((banner '("⠀⠀⠀⠀⠀⠀⢀⣤⣶⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⢸⣿⡿⠋⠻⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⡿⠀⠘⣿⣿⣷⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⠀⣾⣿⣿⣿⡿⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀"
                   "⠀⠀⠀⠀⣾⣿⣿⣿⡟⠀⠀⠀⠀⢹⣿⣿⣷⠀⠀⠀⠀⠀"
                   "⠀⠀⢀⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⣿⣿⣿⣷⡀⠀⠀⠀"
                   "⠀⣠⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿"
                   "⠈⢿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⠿⠁"))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'splashscreen-lambda)


;;; Line numbers
(setq display-line-numbers-type 'relative)

;; LSP-Mode
;;; LSP Mode Which Key
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;;; Setup C++ LSP
(require 'lsp-mode)

;;;; Local clangd setup
(setq lsp-clients-clangd-executable
      (if (executable-find "clangd")
          "clangd"
          "/usr/bin/clangd-12"))

;;;; Remote clangd setup
(lsp-register-client
 (make-lsp-client :new-connection (lsp-tramp-connection "/opt/bb/bin/clangd")
                  :major-modes '(c-mode c++-mode)
                  :remote? t
                  :server-id 'clangd-remote))


;; KEYBINDINGS
;;; Emacs
;;;; SPC-f-z opens `.zshrc'
(map! :leader
      "f z" #'(lambda () (interactive) (find-file "~/.config/.zshrc")))

;; ORG-MODE
;;; Keybindings
;;;; Allows you to insert source code blocks
(map! :map org-mode-map
      :localleader
      "j" #'org-insert-structure-template)

;;;; Displays images inside the editor
(map! :map org-mode-map
      :localleader
      "v" #'org-display-inline-images)

;;; Behaviors
;;;; Disable spelling autocorrect popup in org-mode
(setq company-global-modes '(not text-mode org-mode))

;;BLOOMBERG DEV ENVIRONMENT
;; Give TRAMP access to BB path directories
 (after! tramp
   (add-to-list 'tramp-remote-process-environment "PATH=/opt/bb/bin/:/opt/bb/bin:/bb/tpgit/pint/ticker_bb_git/tp-dev-tools:/bbsrc/bin:/bbsrc/abin:/opt/ssh/bin:/bin:/usr/bin:/sbin:/usr/sbin:/opt/quest/bin:/opt/swt/common/releases/PurifyPlus.7.5/i386_linux2/bin:/opt/swt/common/totalview.2020.1.13/bin:/usr/bin/X11:/bb/util/bin:/opt/bb/bin/php-7.3/bin:/home/phab/bin:/bb/shared/bin:/bb/shared/abin:/bbsrc/training/bin:/bb/bin:/usr/local/bin:/usr/local/sbin"))

;;;;Connect to Dev-X Spaces SSH and map to `SPC-o-x'
(defun bb-open-devx-space-ssh ()
  (interactive)
  (setq ssh-string (read-string "Spaces ssh string: " nil nil ""))
  (save-match-data
    (and (string-match "ssh -t\s\\([-a-z0-9]+\\).* -it \\([a-z0-9]+\\) bash\"" ssh-string)
         (setq spaces-host (match-string 1 ssh-string)
               docker-id (match-string 2 ssh-string)
               )
         )
    )
  (setq space (format "/ssh:%s.dev.bloomberg.com|docker:%s:.."
                      spaces-host
                      docker-id
                      )
        )
  (message space)
  (dired space)
)

(map! :leader
      (:prefix "o"
       :desc "Open DevX Space SSH" "x" #'bb-open-devx-space-ssh))

;; Use the ellama package
(use-package! ellama
  ;; The code in :init block is run before the package is loaded
  :init
  ;; Set the language to English
  (setopt ellama-language "English")
  ;; Require the llm-ollama feature provided by the ellama package
  (require 'llm-ollama)
  ;; Set the provider for ellama
  (setopt ellama-provider
    (make-llm-ollama
      :chat-model "codellama:34b" :embedding-model "codellama:34b")))
