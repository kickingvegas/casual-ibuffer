;;; test-casual-ibuffer-settings.el --- Casual IBuffer Settings Tests  -*- lexical-binding: t; -*-

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
(require 'casual-ibuffer-settings)

(ert-deftest test-casual-ibuffer-settings-tmenu-bindings ()
  (casualt-setup)
  (let ((test-vectors (list)))
    (casualt-add-testcase "f" #'casual-ibuffer--customize-ibuffer-saved-filters test-vectors)
    (casualt-add-testcase "g" #'casual-ibuffer--customize-ibuffer-saved-filter-groups test-vectors)
    (casualt-add-testcase "G" #'casual-ibuffer--customize-group test-vectors)

    (casualt-add-testcase "u" #'casual-lib-customize-casual-lib-use-unicode test-vectors)
    (casualt-add-testcase "n" #'casual-lib-customize-casual-lib-hide-navigation test-vectors)
    (casualt-add-testcase "a" #'casual-ibuffer-about test-vectors)
    (casualt-add-testcase "v" #'casual-ibuffer-version test-vectors)

    (casualt-suffix-testbench-runner test-vectors
                                     #'casual-ibuffer-settings-tmenu
                                     '(lambda () (random 5000))))
  (casualt-breakdown t))

(ert-deftest test-casual-ibuffer-about ()
  (should (stringp (casual-ibuffer-about))))

(provide 'test-casual-ibuffer-settings)
;;; test-casual-ibuffer-setttings.el ends here
