; APT Domain Restriction Transformation -- Tests
;
; Copyright (C) 2017 Kestrel Institute (http://www.kestrel.edu)
;
; License: A 3-clause BSD license. See the LICENSE file distributed with ACL2.
;
; Author: Alessandro Coglio (coglio@kestrel.edu)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package "ACL2")

(include-book "kestrel/utilities/testing" :dir :system)
(include-book "restrict")

(set-verify-guards-eagerness 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro test-title (str)
  `(cw-event (concatenate 'string "~%~%~%********** " ,str "~%~%")))

(defmacro restrict (&rest args)
  `(apt::restrict ,@args))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test error checking on the OLD input.")

 ;; not a symbol:
 (must-fail (restrict 78 t))

 ;; not existing:
 (must-fail (restrict fffffffff t))

 ;; not a function:
 (must-fail (restrict car-cdr-elim t))

 ;; not resolving to a function:
 (must-fail (restrict gggggg{*} t))

 ;; in program mode:
 (must-succeed*
  (defun f (x) (declare (xargs :mode :program)) x)
  (must-fail (restrict f t)))

 ;; resolving to a function in program mode:
 (must-succeed*
  (defun f{1} (x) (declare (xargs :mode :program)) x)
  (add-numbered-name-in-use f{1})
  (must-fail (restrict f{*} t)))

 ;; not defined:
 (must-fail (restrict cons t))

 ;; no arguments:
 (must-succeed*
  (defun f () nil)
  (must-fail (restrict f t)))

 ;; multiple results:
 (must-succeed*
  (defun f (x) (mv x x))
  (must-fail (restrict f t)))

 ;; stobjs:
 (must-succeed*
  (defun f (state) (declare (xargs :stobjs state)) state)
  (must-fail (restrict f t)))

 ;; mutually recursive:
 (must-fail (restrict pseudo-termp t))

 ;; unknown measure:
 (must-succeed*
  (encapsulate
    ()
    (local (defun m (x) (acl2-count x)))
    (local (defun f (x)
             (declare (xargs :measure (m x)))
             (if (atom x) nil (f (car x)))))
    (defun f (x)
      (declare (xargs :measure (:? x)))
      (if (atom x) nil (f (car x)))))
  (must-fail (restrict f t)))

 ;; in its own termination theorem:
 (must-succeed*
  (defun f (x)
    (declare (xargs :guard (natp x)))
    (if (zp x)
        nil
      (and (f (1- x))
           (f (1- x)))))
  (must-fail (restrict f t)))

 ;; not guard-verified (and VERIFY-GUARDS is T):
 (must-succeed*
  (defun f (x) (declare (xargs :verify-guards nil)) x)
  (must-fail (restrict f t :verify-guards t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test error checking on the RESTRICTION input.")

 ;; not a valid term:
 (must-fail (restrict nfix (cons x)))

 ;; free variables that are not formal arguments of OLD:
 (must-fail (restrict nfix (natp y)))

 ;; program-mode functions:
 (must-succeed*
  (defun r (x) (declare (xargs :mode :program)) x)
  (must-fail (restrict nfix (natp (r x)))))

 ;; multiple values:
 (must-fail (restrict nfix (mv x x)))

 ;; output stobjs:
 (must-succeed*
  (defstobj x)
  (must-fail (restrict nfix x)))

 ;; non-guard-verified functions:
 (must-succeed*
  (defun r (x) (declare (xargs :verify-guards nil)) x)
  (must-fail (restrict nfix (natp (r x)))))

 ;; call to target function:
 (must-fail (restrict nfix (> (nfix x) 10))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test successful applications with default options.")

 ;; non-recursive, with guard verification:
 (must-succeed*
  (restrict nfix (natp x))
  (must-be-redundant
   (defun nfix{1} (x)
     (declare (xargs :guard (natp x)))
     (if (natp x) (if (and (integerp x) (<= 0 x)) x 0) :undefined))
   (defthm nfix-~>-nfix{1} (implies (natp x) (equal (nfix x) (nfix{1} x))))))

 ;; recursive, with guard verification:
 (must-succeed*
  (restrict len (true-listp x))
  (must-be-redundant
   (defun len{1} (x)
     (declare (xargs :measure (acl2-count x)
                     :ruler-extenders :all
                     :guard (true-listp x)))
     (if (true-listp x) (if (consp x) (+ 1 (len{1} (cdr x))) 0) :undefined))
   (defthm len-~>-len{1} (implies (true-listp x) (equal (len x) (len{1} x))))))

 ;; non-recursive, without guard verification:
 (must-succeed*
  (defun f (x) (declare (xargs :verify-guards nil)) x)
  (restrict f (natp x))
  (must-be-redundant
   (defun f{1} (x)
     (declare (xargs :guard (natp x) :verify-guards nil))
     (if (natp x) x :undefined))
   (defthm f-~>-f{1} (implies (natp x) (equal (f x) (f{1} x))))))

 ;; recursive, without guard verification:
 (must-succeed*
  (defun f (x) (declare (xargs :verify-guards nil)) (if (zp x) nil (f (1- x))))
  (restrict f (natp x))
  (must-be-redundant
   (defun f{1} (x)
     (declare (xargs :measure (acl2-count x) :ruler-extenders :all
                     :guard (natp x) :verify-guards nil))
     (if (natp x) (and (not (zp x)) (f{1} (+ -1 x))) :undefined))
   (defthm f-~>-f{1} (implies (natp x) (equal (f x) (f{1} x)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test the :UNDEFINED option.")

 ;; not a valid term:
 (must-fail (restrict nfix (natp x) :undefined (cons x)))

 ;; free variables that are not formal arguments of OLD:
 (must-fail (restrict nfix (natp x) :undefined (ifix y)))

 ;; program-mode functions:
 (must-succeed*
  (defun p (x) (declare (xargs :mode :program)) x)
  (must-fail (restrict nfix (natp x) :undefined (p x))))

 ;; multiple values:
 (must-fail (restrict nfix (natp x) :undefined (mv x x)))

 ;; output stobjs:
 (must-succeed*
  (defstobj x)
  (must-fail (restrict nfix t :undefined x)))

 ;; call to target function:
 (must-fail (restrict nfix (natp x) :undefined (nfix x)))

 ;; default:
 (must-succeed*
  (restrict nfix (natp x))
  (defthm undefined (implies (not (natp x))
                             (equal (nfix{1} x) :undefined))))

 ;; constant:
 (must-succeed*
  (restrict nfix (natp x) :undefined 50)
  (defthm undefined (implies (not (natp x))
                             (equal (nfix{1} x) 50))))

 ;; non-constant:
 (must-succeed*
  (restrict nfix (natp x) :undefined (ifix x))
  (defthm undefined (implies (not (natp x))
                             (equal (nfix{1} x) (ifix x)))))

 ;; non-guard-verifiable in itself:
 (must-succeed*
  (restrict nfix (natp x) :undefined (+ x "abc"))
  (defthm undefined (implies (not (natp x))
                             (equal (nfix{1} x) (+ x "abc"))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test the :NEW-NAME option.")

 ;; not a symbol:
 (must-fail (restrict nfix (natp x) :new-name 33))

 ;; in the main Lisp package:
 (must-fail (restrict nfix (natp x) :new-name cons))

 ;; keyword (other than :AUTO):
 (must-fail (restrict nfix (natp x) :new-name :f))

 ;; name that already exists:
 (must-fail (restrict nfix (natp x) :new-name car-cdr-elim))

 ;; determining a name in the main Lisp package:
 (must-fail (restrict atom (natp x) :new-name :auto))

 ;; determining, by default, a name in the main Lisp package:
 (must-fail (restrict atom (natp x)))

 ;; default:
 (must-succeed*
  (restrict nfix (natp x))
  (assert! (function-namep 'nfix{1} (w state))))

 ;; automatic:
 (must-succeed*
  (restrict nfix (natp x) :new-name :auto)
  (assert! (function-namep 'nfix{1} (w state))))

 ;; specified:
 (must-succeed*
  (restrict nfix (natp x) :new-name f)
  (assert! (function-namep 'f (w state)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test the :NEW-ENABLE option.")

 ;; not T, NIL, or :AUTO:
 (must-fail (restrict nfix (natp x) :new-enable 4))

 ;; default, with target function enabled:
 (must-succeed*
  (restrict nfix (natp x))
  (assert! (fundef-enabledp 'nfix{1} state)))

 ;; default, with target function disabled:
 (must-succeed*
  (in-theory (disable nfix))
  (restrict nfix (natp x))
  (assert! (fundef-disabledp 'nfix{1} state)))

 ;; automatic, with target function enabled:
 (must-succeed*
  (restrict nfix (natp x) :new-enable :auto)
  (assert! (fundef-enabledp 'nfix{1} state)))

 ;; automatic, with target function disabled:
 (must-succeed*
  (in-theory (disable nfix))
  (restrict nfix (natp x) :new-enable :auto)
  (assert! (fundef-disabledp 'nfix{1} state)))

 ;; enable, with target function enabled:
 (must-succeed*
  (restrict nfix (natp x) :new-enable t)
  (assert! (fundef-enabledp 'nfix{1} state)))

 ;; enable, with target function disabled:
 (must-succeed*
  (in-theory (disable nfix))
  (restrict nfix (natp x) :new-enable t)
  (assert! (fundef-enabledp 'nfix{1} state)))

 ;; disable, with target function enabled:
 (must-succeed*
  (restrict nfix (natp x) :new-enable nil)
  (assert! (fundef-disabledp 'nfix{1} state)))

 ;; disable, with target function disabled:
 (must-succeed*
  (in-theory (disable nfix))
  (restrict nfix (natp x) :new-enable nil)
  (assert! (fundef-disabledp 'nfix{1} state))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test the :THM-NAME option.")

 ;; not a symbol:
 (must-fail (restrict nfix (natp x) :thm-name 33))

 ;; in the main Lisp package:
 (must-fail (restrict nfix (natp x) :thm-name cons))

 ;; keyword (other than :AUTO):
 (must-fail (restrict nfix (natp x) :thm-name :f))

 ;; name that already exists:
 (must-fail (restrict nfix (natp x) :thm-name car-cdr-elim))

 ;; determining a name that already exists:
 (must-succeed*
  (defun nfix-becomes-nfix{1} () nil)
  (must-fail (restrict nfix (natp x) :thm-name :becomes)))

 ;; determining, by default, a name that already exists:
 (must-succeed*
  (defun nfix-~>-nfix{1} () nil)
  (must-fail (restrict nfix (natp x))))

 ;; default:
 (must-succeed*
  (restrict nfix (natp x))
  (assert! (theorem-namep 'nfix-~>-nfix{1} (w state))))

 ;; automatic:
 (must-succeed*
  (restrict nfix (natp x) :thm-name :auto)
  (assert! (theorem-namep 'nfix-~>-nfix{1} (w state))))

 ;; specified:
 (must-succeed*
  (restrict nfix (natp x) :thm-name nfix-thm)
  (assert! (theorem-namep 'nfix-thm (w state)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test the :THM-ENABLE option.")

 ;; not T or NIL:
 (must-fail (restrict nfix (natp x) :thm-enable 7))

 ;; default:
 (must-succeed*
  (restrict nfix (natp x))
  (assert! (rune-enabledp '(:rewrite nfix-~>-nfix{1}) state)))

 ;; enable:
 (must-succeed*
  (restrict nfix (natp x) :thm-enable t)
  (assert! (rune-enabledp '(:rewrite nfix-~>-nfix{1}) state)))

 ;; disable:
 (must-succeed*
  (restrict nfix (natp x) :thm-enable nil)
  (assert! (rune-disabledp '(:rewrite nfix-~>-nfix{1}) state))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test the :NON-EXECUTABLE option.")

 ;; not T, NIL, or :AUTO:
 (must-fail (restrict nfix (natp x) :non-executable "t"))

 ;; default, with target function not non-executable:
 (must-succeed*
  (restrict nfix (natp x))
  (assert! (not (non-executablep 'nfix{1} (w state)))))

 ;; default, with target function non-executable:
 (must-succeed*
  (defun-nx f (x) x)
  (restrict f (natp x))
  (assert! (non-executablep 'f{1} (w state))))

 ;; automatic, with target function not non-executable:
 (must-succeed*
  (restrict nfix (natp x) :non-executable :auto)
  (assert! (not (non-executablep 'nfix{1} (w state)))))

 ;; automatic, with target function non-executable:
 (must-succeed*
  (defun-nx f (x) x)
  (restrict f (natp x) :non-executable :auto)
  (assert! (non-executablep 'f{1} (w state))))

 ;; make non-executable, with target function not non-executable:
 (must-succeed*
  (restrict nfix (natp x) :non-executable t)
  (assert! (non-executablep 'nfix{1} (w state))))

 ;; make non-executable, with target function non-executable:
 (must-succeed*
  (defun-nx f (x) x)
  (restrict f (natp x) :non-executable t)
  (assert! (non-executablep 'f{1} (w state))))

 ;; do not make non-executable, with target function not non-executable:
 (must-succeed*
  (restrict nfix (natp x) :non-executable nil)
  (assert! (not (non-executablep 'nfix{1} (w state)))))

 ;; do not make non-executable, with target function non-executable:
 (must-succeed*
  (defun-nx f (x) x)
  (restrict f (natp x) :non-executable nil)
  (assert! (not (non-executablep 'f{1} (w state))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test the :VERIFY-GUARDS option.")

 ;; not T, NIL, or :AUTO:
 (must-fail (restrict nfix (natp x) :verify-guards (1 2 3)))

 ;; default, with target function guard-verified:
 (must-succeed*
  (restrict nfix (natp x))
  (assert! (guard-verified-p 'nfix{1} (w state))))

 ;; default, with target function not guard-verified:
 (must-succeed*
  (defun f (x) (declare (xargs :verify-guards nil)) x)
  (restrict f (natp x))
  (assert! (not (guard-verified-p 'f{1} (w state)))))

 ;; automatic, with target function guard-verified:
 (must-succeed*
  (restrict nfix (natp x) :verify-guards :auto)
  (assert! (guard-verified-p 'nfix{1} (w state))))

 ;; automatic, with target function not guard-verified:
 (must-succeed*
  (defun f (x) (declare (xargs :verify-guards nil)) x)
  (restrict f (natp x) :verify-guards :auto)
  (assert! (not (guard-verified-p 'f{1} (w state)))))

 ;; verify guards, with target function guard-verified:
 (must-succeed*
  (restrict nfix (natp x) :verify-guards t)
  (assert! (guard-verified-p 'nfix{1} (w state))))

 ;; verify guards, with target function not guard-verified:
 (must-succeed*
  (defun f (x) (declare (xargs :verify-guards nil)) x)
  (must-fail (restrict f (natp x) :verify-guards t)))

 ;; do not verify guards, with target function guard-verified:
 (must-succeed*
  (restrict nfix (natp x) :verify-guards nil)
  (assert! (not (guard-verified-p 'nfix{1} (w state)))))

 ;; do not verify guards, with target function not guard-verified:
 (must-succeed*
  (defun f (x) (declare (xargs :verify-guards nil)) x)
  (restrict f (natp x) :verify-guards nil)
  (assert! (not (guard-verified-p 'f{1} (w state))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test the :HINTS option.")

 ;; not a list of doublets:
 (must-fail (restrict nfix (natp x) :hints 8))

 ;; not all symbols as keys:
 (must-fail
  (restrict nfix (natp x)
            :hints ((33 (("Goal" :in-theory (enable len))))
                    (symbol (("Goal" :in-theory (enable len)))))))

 ;; not an applicability condition name:
 (must-fail
  (restrict nfix (natp x)
            :hints ((not-an-app-cond (("Goal" :in-theory (enable len)))))))

 ;; duplicate applicability condition names:
 (must-fail
  (restrict nfix (natp x)
            :hints ((restriction-of-rec-calls
                     (("Goal" :in-theory (enable atom))))
                    (restriction-of-rec-calls
                     (("Goal" :in-theory (enable len)))))))

 ;; valid but unnecessary hints:
 (must-succeed
  (restrict nfix (natp x)
            :hints ((restriction-guard
                     (("Goal" :in-theory (enable natp))))
                    (restriction-of-rec-calls
                     (("Goal" :in-theory (enable natp)))))))

 ;; necessary hints:
 (must-succeed*
  (encapsulate
    (((p *) => *)
     ((q *) => *))
    (local (defun p (x) x))
    (local (defun q (x) x))
    (defthmd p=>q (implies (p x) (q x))))
  (defun f (x) (declare (xargs :guard (p x) :verify-guards t)) x)
  (defun r (x) (declare (xargs :guard (q x) :verify-guards t)) x)
  (must-fail (restrict f (r x)))
  (restrict f (r x)
            :hints ((restriction-guard (("Goal" :in-theory (enable p=>q))))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test the :VERBOSE option.")

 ;; not a boolean:
 (must-fail (restrict nfix (natp x) :verbose 1) :with-output-off nil)

 ;; default:
 (must-succeed (restrict nfix (natp x)))

 ;; verbose:
 (must-succeed (restrict nfix (natp x) :verbose t))

 ;; not verbose:
 (must-succeed (restrict nfix (natp x) :verbose nil))

 :with-output-off nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test the :SHOW-ONLY option.")

 ;; not a boolean:
 (must-fail (restrict nfix (natp x) :show-only #\T))

 ;; default:
 (must-succeed*
  (restrict nfix (natp x))
  (assert! (function-namep 'nfix{1} (w state))))

 ;; show only:
 (must-succeed*
  (restrict nfix (natp x) :show-only t)
  (assert! (not (function-namep 'nfix{1} (w state))))
  :with-output-off nil)

 ;; submit events:
 (must-succeed*
  (restrict nfix (natp x) :show-only nil)
  (assert! (function-namep 'nfix{1} (w state))))

 :with-output-off nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(must-succeed*

 (test-title "Test handling of redundancy.")

 ;; initial call without :VERBOSE and without :SHOW-ONLY:
 (must-succeed*
  (restrict nfix (natp x))
  (must-be-redundant (restrict nfix (natp x)))
  (must-be-redundant (restrict nfix (natp x) :verbose t))
  (must-be-redundant (restrict nfix (natp x) :verbose nil))
  (must-be-redundant (restrict nfix (natp x) :show-only t))
  (must-be-redundant (restrict nfix (natp x) :show-only nil))
  (must-be-redundant (restrict nfix (natp x) :verbose t :show-only t))
  (must-be-redundant (restrict nfix (natp x) :verbose nil :show-only t))
  (must-be-redundant (restrict nfix (natp x) :verbose t :show-only nil))
  (must-be-redundant (restrict nfix (natp x) :verbose nil :show-only nil)))

 ;; initial call with :VERBOSE T and without :SHOW-ONLY:
 (must-succeed*
  (restrict nfix (natp x) :verbose t)
  (must-be-redundant (restrict nfix (natp x)))
  (must-be-redundant (restrict nfix (natp x) :verbose t))
  (must-be-redundant (restrict nfix (natp x) :verbose nil))
  (must-be-redundant (restrict nfix (natp x) :show-only t))
  (must-be-redundant (restrict nfix (natp x) :show-only nil))
  (must-be-redundant (restrict nfix (natp x) :verbose t :show-only t))
  (must-be-redundant (restrict nfix (natp x) :verbose nil :show-only t))
  (must-be-redundant (restrict nfix (natp x) :verbose t :show-only nil))
  (must-be-redundant (restrict nfix (natp x) :verbose nil :show-only nil)))

 ;; initial call with :VERBOSE NIL and without :SHOW-ONLY:
 (must-succeed*
  (restrict nfix (natp x) :verbose nil)
  (must-be-redundant (restrict nfix (natp x)))
  (must-be-redundant (restrict nfix (natp x) :verbose t))
  (must-be-redundant (restrict nfix (natp x) :verbose nil))
  (must-be-redundant (restrict nfix (natp x) :show-only t))
  (must-be-redundant (restrict nfix (natp x) :show-only nil))
  (must-be-redundant (restrict nfix (natp x) :verbose t :show-only t))
  (must-be-redundant (restrict nfix (natp x) :verbose nil :show-only t))
  (must-be-redundant (restrict nfix (natp x) :verbose t :show-only nil))
  (must-be-redundant (restrict nfix (natp x) :verbose nil :show-only nil)))

 ;; initial call without :VERBOSE and with :SHOW-ONLY T:
 (must-succeed*
  (restrict nfix (natp x) :show-only t)
  (must-fail-local (must-be-redundant (restrict nfix (natp x)))))

 ;; initial call without :VERBOSE and with :SHOW-ONLY NIL:
 (must-succeed*
  (restrict nfix (natp x) :show-only nil)
  (must-be-redundant (restrict nfix (natp x)))
  (must-be-redundant (restrict nfix (natp x) :verbose t))
  (must-be-redundant (restrict nfix (natp x) :verbose nil))
  (must-be-redundant (restrict nfix (natp x) :show-only t))
  (must-be-redundant (restrict nfix (natp x) :show-only nil))
  (must-be-redundant (restrict nfix (natp x) :verbose t :show-only t))
  (must-be-redundant (restrict nfix (natp x) :verbose nil :show-only t))
  (must-be-redundant (restrict nfix (natp x) :verbose t :show-only nil))
  (must-be-redundant (restrict nfix (natp x) :verbose nil :show-only nil)))

 ;; initial call with :VERBOSE T and with :SHOW-ONLY T:
 (must-succeed*
  (restrict nfix (natp x) :verbose t :show-only t)
  (must-fail-local (must-be-redundant (restrict nfix (natp x)))))

 ;; initial call with :VERBOSE T and with :SHOW-ONLY NIL:
 (must-succeed*
  (restrict nfix (natp x) :verbose t :show-only nil)
  (must-be-redundant (restrict nfix (natp x)))
  (must-be-redundant (restrict nfix (natp x) :verbose t))
  (must-be-redundant (restrict nfix (natp x) :verbose nil))
  (must-be-redundant (restrict nfix (natp x) :show-only t))
  (must-be-redundant (restrict nfix (natp x) :show-only nil))
  (must-be-redundant (restrict nfix (natp x) :verbose t :show-only t))
  (must-be-redundant (restrict nfix (natp x) :verbose nil :show-only t))
  (must-be-redundant (restrict nfix (natp x) :verbose t :show-only nil))
  (must-be-redundant (restrict nfix (natp x) :verbose nil :show-only nil)))

 ;; initial call with :VERBOSE NIL and with :SHOW-ONLY T:
 (must-succeed*
  (restrict nfix (natp x) :verbose nil :show-only t)
  (must-fail-local (must-be-redundant (restrict nfix (natp x)))))

 ;; initial call with :VERBOSE NIL and with :SHOW-ONLY NIL:
 (must-succeed*
  (restrict nfix (natp x) :verbose nil :show-only nil)
  (must-be-redundant (restrict nfix (natp x)))
  (must-be-redundant (restrict nfix (natp x) :verbose t))
  (must-be-redundant (restrict nfix (natp x) :verbose nil))
  (must-be-redundant (restrict nfix (natp x) :show-only t))
  (must-be-redundant (restrict nfix (natp x) :show-only nil))
  (must-be-redundant (restrict nfix (natp x) :verbose t :show-only t))
  (must-be-redundant (restrict nfix (natp x) :verbose nil :show-only t))
  (must-be-redundant (restrict nfix (natp x) :verbose t :show-only nil))
  (must-be-redundant (restrict nfix (natp x) :verbose nil :show-only nil)))

 ;; non-redundant calls:
 (must-succeed*
  (restrict nfix (natp x))
  ;; different target:
  (must-fail-local (must-be-redundant (restrict len (true-listp x))))
  ;; different restriction:
  (must-fail-local (must-be-redundant (restrict nfix (integerp x))))
  ;; different options:
  (must-fail-local
   (must-be-redundant (restrict nfix (natp x) :verify-guards nil)))
  (must-fail-local
   (must-be-redundant (restrict nfix (natp x) :new-name nfix-new)))))
