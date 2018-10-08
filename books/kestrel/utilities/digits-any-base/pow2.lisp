; Representation of Natural Numbers as Digits in Power-of-Two Bases
;
; Copyright (C) 2018 Kestrel Institute (http://www.kestrel.edu)
;
; License: A 3-clause BSD license. See the LICENSE file distributed with ACL2.
;
; Author: Alessandro Coglio (coglio@kestrel.edu)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package "ACL2")

(include-book "kestrel/utilities/event-forms" :dir :system)
(include-book "std/typed-lists/unsigned-byte-listp" :dir :system)
(include-book "core")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defxdoc digits-any-base-pow2
  :parents (digits-any-base)
  :short "Conversions between natural numbers
          and their representations as digits in power-of-two bases."
  :long
  (xdoc::topapp
   (xdoc::p
    "When the base is a (positive) power of 2,
     digits are <see topic='@(url unsigned-byte-p)'>unsigned bytes</see>
     of positive size (the exponent of the base).
     Thus, here we provide theorems about this connection.")))

(local (xdoc::set-default-parents digits-any-base-pow2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defsection digit-byte-equivalence
  :short "Equivalences between digits and bytes."
  :long
  (xdoc::topapp
   (xdoc::p
    "These rules are disabled by default.
     They can be selectively enabled for specific proofs as needed.")
   (xdoc::p
    "Note that the converse equalities
     would include @('(expt 2 n)') in their left-hand sides,
     which may rarely match,
     in particular when the base is a constant power of 2.
     We may add converse theorems with a generic base,
     a hypothesis that the base is a power of 2,
     and a logarithm in base 2 in the right hand side."))

  (defruled unsigned-byte-p-rewrite-dab-digitp
    (implies (posp n)
             (equal (unsigned-byte-p n x)
                    (dab-digitp (expt 2 n) x)))
    :enable dab-digitp)

  (defruled unsigned-byte-listp-rewrite-dab-digit-listp
    (implies (posp n)
             (equal (unsigned-byte-listp n x)
                    (dab-digit-listp (expt 2 n) x)))
    :enable (dab-digit-listp
             unsigned-byte-listp
             unsigned-byte-p-rewrite-dab-digitp)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define defthm-digit-byte-return-types-fn ((n posp))
  :returns (event pseudo-event-formp)
  :verify-guards nil
  :parents (defthm-digit-byte-return-types)
  :short "Event form to introduce return type theorems for
          the conversions from natural numbers
          to digits in a specified power-of-2 base."
  :long
  (xdoc::topapp
   (xdoc::p
    "The event form is a @(tsee defsection)
     with six theorems asserting that
     the conversions from natural numbers to digits in base @('(expt 2 n)')
     return true lists of unsigned bytes of size @('n').
     These are expressed using the fixtypes for true lists of unsigned bytes
     introduced via @(tsee fty::defbytelist)."))
  (b* ((ubyte<n> (packn (list 'ubyte n)))
       (ubyte<n>-listp (packn (list ubyte<n> '-listp)))
       (ubyte<n>-listp-of-nat=>bendian* (packn (list ubyte<n>-listp
                                                     '-of-nat=>bendian*)))
       (ubyte<n>-listp-of-nat=>bendian+ (packn (list ubyte<n>-listp
                                                     '-of-nat=>bendian+)))
       (ubyte<n>-listp-of-nat=>bendian (packn (list ubyte<n>-listp
                                                    '-of-nat=>bendian)))
       (ubyte<n>-listp-of-nat=>lendian* (packn (list ubyte<n>-listp
                                                     '-of-nat=>lendian*)))
       (ubyte<n>-listp-of-nat=>lendian+ (packn (list ubyte<n>-listp
                                                     '-of-nat=>lendian+)))
       (ubyte<n>-listp-of-nat=>lendian (packn (list ubyte<n>-listp
                                                    '-of-nat=>lendian)))
       (ubyte<n>-listp-rewrite-unsigned-byte-listp
        (packn (list ubyte<n>-listp '-rewrite-unsigned-byte-listp)))
       (digit-byte<n>-return-types (packn (list 'digit-byte
                                                n
                                                '-return-types)))
       (base (expt 2 n))
       (<n>-string (coerce (explode-nonnegative-integer n 10 nil) 'string)))
    `(defsection ,digit-byte<n>-return-types
       :parents (digits-any-base-pow2)
       :short ,(concatenate 'string
                            "Return type theorems for "
                            "conversions from natural numbers "
                            "to digits in base @($2^{"
                            <n>-string
                            "}$).")
       (defthm ,ubyte<n>-listp-of-nat=>bendian*
         (,ubyte<n>-listp (nat=>bendian* ,base x))
         :hints (("Goal"
                  :in-theory
                  (enable ,ubyte<n>-listp-rewrite-unsigned-byte-listp
                          unsigned-byte-listp-rewrite-dab-digit-listp))))
       (defthm ,ubyte<n>-listp-of-nat=>bendian+
         (,ubyte<n>-listp (nat=>bendian+ ,base x))
         :hints (("Goal"
                  :in-theory
                  (enable ,ubyte<n>-listp-rewrite-unsigned-byte-listp
                          unsigned-byte-listp-rewrite-dab-digit-listp))))
       (defthm ,ubyte<n>-listp-of-nat=>bendian
         (,ubyte<n>-listp (nat=>bendian ,base width x))
         :hints (("Goal"
                  :in-theory
                  (enable ,ubyte<n>-listp-rewrite-unsigned-byte-listp
                          unsigned-byte-listp-rewrite-dab-digit-listp))))
       (defthm ,ubyte<n>-listp-of-nat=>lendian*
         (,ubyte<n>-listp (nat=>lendian* ,base x))
         :hints (("Goal"
                  :in-theory
                  (enable ,ubyte<n>-listp-rewrite-unsigned-byte-listp
                          unsigned-byte-listp-rewrite-dab-digit-listp))))
       (defthm ,ubyte<n>-listp-of-nat=>lendian+
         (,ubyte<n>-listp (nat=>lendian+ ,base x))
         :hints (("Goal"
                  :in-theory
                  (enable ,ubyte<n>-listp-rewrite-unsigned-byte-listp
                          unsigned-byte-listp-rewrite-dab-digit-listp))))
       (defthm ,ubyte<n>-listp-of-nat=>lendian
         (,ubyte<n>-listp (nat=>lendian ,base width x))
         :hints (("Goal"
                  :in-theory
                  (enable ,ubyte<n>-listp-rewrite-unsigned-byte-listp
                          unsigned-byte-listp-rewrite-dab-digit-listp)))))))

(defsection defthm-digit-byte-return-types
  :short "Introduce return type theorems for
          the conversions from natural numbers
          to digits in the specified power-of-2 base."
  :long
  (xdoc::topapp
   (xdoc::p
    "This requires the presence, in the ACL2 world,
     of the fixtype for (lists of) unsigned bytes of size equal to
     the exponent of the power-of-2 base.
     For instance, the call @('(defthm-digit-byte-return-types 8)') for base 256
     requires the presence of the fixtype of unsigned bytes of size 8.")
   (xdoc::p
    "This requirement can be often satisfied by including the appropriate file
     @('[books]/kestrel/utilities/fixbytes/ubyte<n>.lisp'),
     e.g. @('ubyte8.lisp') for the example just above.
     See the files @('pow2-<n>.lisp') in this directory for examples.")
   (xdoc::def "defthm-digit-byte-return-types"))
  (defmacro defthm-digit-byte-return-types (size)
    (declare (xargs :guard (posp size)))
    `(make-event (defthm-digit-byte-return-types-fn ,size))))