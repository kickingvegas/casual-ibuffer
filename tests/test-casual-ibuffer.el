;;; test-casual-ibuffer.el --- Casual IBuffer Tests -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Charles Choi

;; Author: Charles Choi <kickingvegas@gmail.com>
;; Keywords: tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'ert)
(require 'casual-ibuffer-test-utils)
(require 'casual-lib-test-utils)
(require 'casual-ibuffer)

(ert-deftest test-casual-ibuffer-tmenu-bindings ()
  (casualt-setup)
  (let ((test-vectors (list)))
    (casualt-add-testcase "o" #'ibuffer-visit-buffer-other-window test-vectors)
    (casualt-add-testcase "S" #'ibuffer-do-save test-vectors)
    (casualt-add-testcase "D" #'ibuffer-do-delete test-vectors)
    (casualt-add-testcase "=" #'ibuffer-diff-with-file test-vectors)
    (casualt-add-testcase "w" #'ibuffer-copy-filename-as-kill test-vectors)
    (casualt-add-testcase "M" #'casual-ibuffer-operations-tmenu test-vectors)

    (casualt-add-testcase "m" #'ibuffer-mark-forward test-vectors)
    (casualt-add-testcase "t" #'casual-ibuffer-mark-tmenu test-vectors)
    (casualt-add-testcase "r" #'casual-ibuffer-mark-regexp-tmenu test-vectors)
    (casualt-add-testcase "u" #'ibuffer-unmark-forward test-vectors)
    (casualt-add-testcase "d" #'ibuffer-mark-for-delete test-vectors)
    (casualt-add-testcase "x" #'ibuffer-do-kill-on-deletion-marks test-vectors)
    (casualt-add-testcase "U" #'ibuffer-unmark-all-marks test-vectors)

    (casualt-add-testcase "s" #'casual-ibuffer-sortby-tmenu test-vectors)
    (casualt-add-testcase "`" #'ibuffer-switch-format test-vectors)
    (casualt-add-testcase "b" #'ibuffer-bury-buffer test-vectors)
    (casualt-add-testcase "g" #'ibuffer-update test-vectors)

    (casualt-add-testcase "p" #'ibuffer-backward-line test-vectors)
    (casualt-add-testcase "n" #'ibuffer-forward-line test-vectors)
    (casualt-add-testcase "{" #'ibuffer-backwards-next-marked test-vectors)
    (casualt-add-testcase "}" #'ibuffer-forward-next-marked test-vectors)
    (casualt-add-testcase "[" #'ibuffer-backward-filter-group test-vectors)
    (casualt-add-testcase "]" #'ibuffer-forward-filter-group test-vectors)
    (casualt-add-testcase "j" #'ibuffer-jump-to-buffer test-vectors)
    (casualt-add-testcase "M-j" #'ibuffer-jump-to-filter-group test-vectors)

    (casualt-add-testcase "SPC" #'ibuffer-filter-chosen-by-completion test-vectors)
    (casualt-add-testcase "/" #'ibuffer-filter-disable test-vectors)
    (casualt-add-testcase "F" #'casual-ibuffer-filter-tmenu test-vectors)
    (casualt-add-testcase "O" #'ibuffer-do-occur test-vectors)
    (casualt-add-testcase "M-r" #'ibuffer-do-query-replace test-vectors)
    (casualt-add-testcase "C-M-r" #'ibuffer-do-query-replace-regexp test-vectors)

    (casualt-add-testcase "J" #'bookmark-jump test-vectors)

    (casualt-add-testcase "RET" #'casual-ibuffer-return-dwim test-vectors)
    (casualt-add-testcase "," #'casual-ibuffer-settings-tmenu test-vectors)
    (casualt-add-testcase "q" #'quit-window test-vectors)

    (casualt-suffix-testbench-runner test-vectors
                                     #'casual-ibuffer-tmenu
                                     '(lambda () (random 5000))))
  (casualt-breakdown t))


(ert-deftest test-casual-ibuffer-operations-tmenu ()
  (casualt-setup)
  (let ((test-vectors (list)))
    (casualt-add-testcase "R" #'ibuffer-do-rename-uniquely test-vectors)
    (casualt-add-testcase "!" #'ibuffer-do-shell-command-file test-vectors)
    (casualt-add-testcase "|" #'ibuffer-do-shell-command-pipe test-vectors)

    (casualt-add-testcase "E" #'ibuffer-do-eval test-vectors)
    (casualt-add-testcase "B" #'ibuffer-copy-buffername-as-kill test-vectors)

    (casualt-add-testcase "T" #'ibuffer-do-toggle-read-only test-vectors)
    (casualt-add-testcase "L" #'ibuffer-do-toggle-lock test-vectors)

    (casualt-suffix-testbench-runner test-vectors
                                     #'casual-ibuffer-operations-tmenu
                                     '(lambda () (random 5000))))
  (casualt-breakdown t))

(ert-deftest test-casual-ibuffer-sortby-tmenu ()
  (casualt-setup)
  (let ((test-vectors (list)))
    (casualt-add-testcase "v" #'ibuffer-do-sort-by-recency test-vectors)
    (casualt-add-testcase "a" #'ibuffer-do-sort-by-alphabetic test-vectors)
    (casualt-add-testcase "f" #'ibuffer-do-sort-by-filename/process test-vectors)

    (casualt-add-testcase "m" #'ibuffer-do-sort-by-major-mode test-vectors)
    (casualt-add-testcase "s" #'ibuffer-do-sort-by-size test-vectors)

    (casualt-add-testcase "i" #'ibuffer-invert-sorting test-vectors)
    (casualt-add-testcase "," #'ibuffer-toggle-sorting-mode test-vectors)
    (casualt-suffix-testbench-runner test-vectors
                                     #'casual-ibuffer-sortby-tmenu
                                     '(lambda () (random 5000))))
  (casualt-breakdown t))

(ert-deftest test-casual-ibuffer-mark-tmenu ()
  (casualt-setup)
  (let ((test-vectors (list)))
    (casualt-add-testcase "m" #'ibuffer-mark-by-mode test-vectors)
    (casualt-add-testcase "d" #'ibuffer-mark-dired-buffers test-vectors)
    (casualt-add-testcase "h" #'ibuffer-mark-help-buffers test-vectors)

    (casualt-add-testcase "*" #'ibuffer-mark-modified-buffers test-vectors)
    (casualt-add-testcase "r" #'ibuffer-mark-read-only-buffers test-vectors)
    (casualt-add-testcase "u" #'ibuffer-mark-unsaved-buffers test-vectors)

    (casualt-add-testcase "D" #'ibuffer-mark-dissociated-buffers test-vectors)
    (casualt-add-testcase "s" #'ibuffer-mark-special-buffers test-vectors)
    (casualt-add-testcase "z" #'ibuffer-mark-compressed-file-buffers test-vectors)

    (casualt-suffix-testbench-runner test-vectors
                                     #'casual-ibuffer-mark-tmenu
                                     '(lambda () (random 5000))))
  (casualt-breakdown t))

(ert-deftest test-casual-ibuffer-mark-regexp-tmenu ()
  (casualt-setup)
  (let ((test-vectors (list)))
    (casualt-add-testcase "f" #'ibuffer-mark-by-file-name-regexp test-vectors)
    (casualt-add-testcase "n" #'ibuffer-mark-by-name-regexp test-vectors)
    (casualt-add-testcase "m" #'ibuffer-mark-by-mode-regexp test-vectors)
    (casualt-add-testcase "c" #'ibuffer-mark-by-content-regexp test-vectors)

    (casualt-suffix-testbench-runner test-vectors
                                     #'casual-ibuffer-mark-regexp-tmenu
                                     '(lambda () (random 5000))))
  (casualt-breakdown t))

(provide 'test-casual-ibuffer)
;;; test-casual-ibuffer.el ends here
