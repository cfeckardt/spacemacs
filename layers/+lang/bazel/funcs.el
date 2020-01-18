(when (configuration-layer/package-usedp 'bazel-mode)
  (defun spacemacs/bazel-run-target ()
    (interactive)
    (let ((target (read-string "Run bazel target: ")))
      (setq bazel-recent-target target)
      (bazel-run target)))

  (defun spacemacs/bazel-run-most-recent ()
    (interactive)
    (if (boundp 'bazel-recent-target)
        (bazel-run bazel-recent-target)
        (spacemacs/bazel-run-target)))

  (defun spacemacs/bazel-build-target ()
    (interactive)
    (let ((target (read-string "Build bazel target: ")))
      (setq bazel-recent-target target)
      (bazel-build target)))

  (defun spacemacs/bazel-build-most-recent ()
    (interactive)
    (if (boundp 'bazel-recent-target)
        (bazel-build bazel-recent-target)
      (spacemacs/bazel-build-target)))

  (defun spacemacs/bazel-test-target ()
    (interactive)
    (let ((target (read-string "Test bazel target: ")))
      (setq bazel-recent-target target)
      (bazel-test target)))

  (defun spacemacs/bazel-test-most-recent ()
    (interactive)
    (if (boundp 'bazel-recent-target)
        (bazel-test bazel-recent-target)
      (spacemacs/bazel-test-target))))

(when (configuration-layer/package-usedp 'bazel-build)
  (define-minor-mode bazel-build-mode
    "Enables bazel-run, bazel-build and bazel-test functionality in Emacs"
    :lighter " bazel-build")
  (add-hook 'bazel-mode-hook 'bazel-build-mode)

  (defun spacemacs//bazel-build-mode-enable-in-workspace ()
    (let ((root-path (locate-dominating-file default-directory "WORKSPACE")))
      (when root-path
        (bazel-build-mode))
      )))
