;;; packages.el --- Clojure Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2020 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq bazel-packages
      '((bazel-mode :location (recipe
                                     :fetcher github
                                     :repo "bazelbuild/emacs-bazel-mode"
                                     :files ("lisp/bazel-mode.el")))
        (bazel-build :location (recipe
                                :fetcher github
                                :repo "bazelbuild/emacs-bazel-mode"
                                :files ("lisp/bazel-build.el")))))

(defun bazel/init-bazel-mode ()
  (use-package bazel-mode
    :defer t
    :config
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'bazel-mode
        "=" 'bazel-mode-buildifier)
      )))

(defun bazel/init-bazel-build ()
  (use-package bazel-build
    :defer t
    :init
    (progn
      (add-hook 'projectile-after-switch-project-hook 'spacemacs//bazel-build-mode-enable-in-workspace))
    :config
    (progn
      (spacemacs/declare-prefix-for-mode 'bazel-build-mode "mb" "build")
      (spacemacs/declare-prefix-for-mode 'bazel-build-mode "me" "run")
      (spacemacs/declare-prefix-for-mode 'bazel-build-mode "mt" "test")
      (spacemacs/set-leader-keys-for-minor-mode 'bazel-build-mode
        "tt" 'spacemacs/bazel-test-most-recent
        "tT" 'spacemacs/bazel-test-target
        "ee" 'spacemacs/bazel-run-most-recent
        "eT" 'spacemacs/bazel-run-target
        "bb" 'spacemacs/bazel-build-most-recent
        "bT" 'spacemacs/bazel-build-target))))
