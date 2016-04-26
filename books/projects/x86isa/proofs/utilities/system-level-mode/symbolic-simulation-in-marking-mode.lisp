;; AUTHOR:
;; Shilpi Goel <shigoel@cs.utexas.edu>

(in-package "X86ISA")
(include-book "marking-mode-utils")

(local (include-book "centaur/bitops/ihs-extensions" :dir :system))
(local (include-book "centaur/bitops/signed-byte-p" :dir :system))

(local (in-theory (e/d* () (signed-byte-p unsigned-byte-p))))

;; ======================================================================

(defsection symbolic-simulation-in-marking-mode
  :parents (marking-mode-utils)

  :short "Reasoning in the system-level marking mode"

  :long "<p>WORK IN PROGRESS...</p>

<p>This doc topic will be updated in later commits...</p>"
  )

(local (xdoc::set-default-parents symbolic-simulation-in-marking-mode))

;; ======================================================================

;; Get-prefixes opener lemmas:

;; get-prefixes-opener-lemma-zero-cnt and
;; get-prefixes-opener-lemma-no-prefix-byte are applicable in the
;; marking mode.

(defthm xr-not-mem-and-get-prefixes
  ;; I don't need this lemma in the programmer-level mode because
  ;; (mv-nth 2 (get-prefixes ... x86)) == x86 there.
  (implies (and (not (equal fld :mem))
                (not (equal fld :fault)))
           (equal (xr fld index (mv-nth 2 (get-prefixes start-rip prefixes cnt x86)))
                  (xr fld index (double-rewrite x86))))
  :hints (("Goal"
           :induct (get-prefixes start-rip prefixes cnt x86)
           :in-theory (e/d* (get-prefixes rm08)
                            (rm08-to-rb
                             not force (force))))))

(defthm get-prefixes-opener-lemma-group-1-prefix-in-marking-mode
  (implies
   (and
    (canonical-address-p (1+ start-rip))
    (not (zp cnt))
    (equal (prefixes-slice :group-1-prefix prefixes) 0)
    (let*
        ((flg (mv-nth 0 (rm08 start-rip :x x86)))
         (prefix-byte-group-code
          (get-one-byte-prefix-array-code (mv-nth 1 (rm08 start-rip :x x86)))))
      (and (not flg)
           (equal prefix-byte-group-code 1))))
   (equal (get-prefixes start-rip prefixes cnt x86)
          (get-prefixes (+ 1 start-rip)
                        (!prefixes-slice :group-1-prefix
                                         (mv-nth 1 (rm08 start-rip :x x86))
                                         prefixes)
                        (+ -1 cnt)
                        (mv-nth 2 (rm08 start-rip :x x86)))))
  :hints (("Goal"
           :induct (get-prefixes start-rip prefixes cnt x86)
           :in-theory (e/d* (get-prefixes
                             las-to-pas)
                            (acl2::ash-0
                             acl2::zip-open
                             byte-listp
                             unsigned-byte-p-of-logior
                             negative-logand-to-positive-logand-with-integerp-x
                             force (force))))))

(defthm get-prefixes-opener-lemma-group-2-prefix-in-marking-mode
  (implies (and
            (canonical-address-p (1+ start-rip))
            (not (zp cnt))
            (equal (prefixes-slice :group-2-prefix prefixes) 0)
            (let*
                ((flg (mv-nth 0 (rm08 start-rip :x x86)))
                 (prefix-byte-group-code
                  (get-one-byte-prefix-array-code (mv-nth 1 (rm08 start-rip :x x86)))))
              (and (not flg)
                   (equal prefix-byte-group-code 2))))
           (equal (get-prefixes start-rip prefixes cnt x86)
                  (get-prefixes (1+ start-rip)
                                (!prefixes-slice :group-2-prefix
                                                 (mv-nth 1 (rm08 start-rip :x x86))
                                                 prefixes)
                                (1- cnt)
                                (mv-nth 2 (rm08 start-rip :x x86)))))
  :hints (("Goal"
           :induct (get-prefixes start-rip prefixes cnt x86)
           :in-theory (e/d* (get-prefixes
                             las-to-pas)
                            (acl2::ash-0
                             acl2::zip-open
                             byte-listp
                             unsigned-byte-p-of-logior
                             negative-logand-to-positive-logand-with-integerp-x
                             force (force))))))

(defthm get-prefixes-opener-lemma-group-3-prefix-in-marking-mode
  (implies (and
            (canonical-address-p (1+ start-rip))
            (not (zp cnt))
            (equal (prefixes-slice :group-3-prefix prefixes) 0)
            (let*
                ((flg (mv-nth 0 (rm08 start-rip :x x86)))
                 (prefix-byte-group-code
                  (get-one-byte-prefix-array-code (mv-nth 1 (rm08 start-rip :x x86)))))
              (and (not flg)
                   (equal prefix-byte-group-code 3))))
           (equal (get-prefixes start-rip prefixes cnt x86)
                  (get-prefixes (1+ start-rip)
                                (!prefixes-slice :group-3-prefix
                                                 (mv-nth 1 (rm08 start-rip :x x86))
                                                 prefixes)
                                (1- cnt)
                                (mv-nth 2 (rm08 start-rip :x x86)))))
  :hints (("Goal"
           :induct (get-prefixes start-rip prefixes cnt x86)
           :in-theory (e/d* (get-prefixes
                             las-to-pas)
                            (acl2::ash-0
                             acl2::zip-open
                             byte-listp
                             unsigned-byte-p-of-logior
                             negative-logand-to-positive-logand-with-integerp-x
                             force (force))))))

(defthm get-prefixes-opener-lemma-group-4-prefix-in-marking-mode
  (implies (and
            (canonical-address-p (1+ start-rip))
            (not (zp cnt))
            (equal (prefixes-slice :group-4-prefix prefixes) 0)
            (let*
                ((flg (mv-nth 0 (rm08 start-rip :x x86)))
                 (prefix-byte-group-code
                  (get-one-byte-prefix-array-code (mv-nth 1 (rm08 start-rip :x x86)))))
              (and (not flg)
                   (equal prefix-byte-group-code 4))))
           (equal (get-prefixes start-rip prefixes cnt x86)
                  (get-prefixes (1+ start-rip)
                                (!prefixes-slice :group-4-prefix
                                                 (mv-nth 1 (rm08 start-rip :x x86))
                                                 prefixes)
                                (1- cnt)
                                (mv-nth 2 (rm08 start-rip :x x86)))))
  :hints (("Goal"
           :induct (get-prefixes start-rip prefixes cnt x86)
           :in-theory (e/d* (get-prefixes
                             las-to-pas)
                            (acl2::ash-0
                             acl2::zip-open
                             byte-listp
                             unsigned-byte-p-of-logior
                             negative-logand-to-positive-logand-with-integerp-x
                             force (force))))))

(local
 (defthm xlate-equiv-memory-and-two-mv-nth-2-rm08
   (implies (xlate-equiv-memory x86-1 x86-2)
            (xlate-equiv-memory (mv-nth 2 (rm08 lin-addr r-w-x x86-1))
                                (mv-nth 2 (rm08 lin-addr r-w-x x86-2))))
   :hints (("Goal" :in-theory (e/d* (rm08) (force (force)))))
   :rule-classes :congruence))

(local
 (defthm xlate-equiv-memory-and-mv-nth-2-rm08
   (xlate-equiv-memory (mv-nth 2 (rm08 lin-addr r-w-x x86)) x86)
   :hints (("Goal" :in-theory (e/d* (rm08) (force (force)))))))

(defthm xlate-equiv-memory-and-mv-nth-2-get-prefixes
  (implies (and (not (programmer-level-mode (double-rewrite x86)))
                (page-structure-marking-mode (double-rewrite x86))
                (canonical-address-p start-rip)
                (not (mv-nth 0 (las-to-pas (create-canonical-address-list cnt start-rip) :x (cpl x86) (double-rewrite x86)))))
           (xlate-equiv-memory (mv-nth 2 (get-prefixes start-rip prefixes cnt x86))
                               (double-rewrite x86)))
  :hints (("Goal"
           :induct (get-prefixes start-rip prefixes cnt x86)
           :in-theory (e/d* (get-prefixes las-to-pas-subset-p subset-p)
                            (acl2::ash-0
                             acl2::zip-open
                             cdr-create-canonical-address-list
                             force (force))))
          (if
              ;; Apply to all subgoals under a top-level induction.
              (and (consp (car id))
                   (< 1 (len (car id))))
              '(:in-theory (e/d* (subset-p get-prefixes las-to-pas-subset-p)
                                 (acl2::ash-0
                                  acl2::zip-open
                                  cdr-create-canonical-address-list
                                  force (force)))
                           :use ((:instance xlate-equiv-memory-and-las-to-pas
                                            (l-addrs (create-canonical-address-list (+ -1 cnt) (+ 1 start-rip)))
                                            (r-w-x :x)
                                            (cpl (cpl x86))
                                            (x86-1 (mv-nth 2 (las-to-pas (list start-rip) :x (cpl x86) x86)))
                                            (x86-2 x86))))
            nil)))

(defthmd xlate-equiv-memory-and-two-mv-nth-2-get-prefixes
  (implies (and (xlate-equiv-memory x86-1 x86-2)
                (not (programmer-level-mode x86-2))
                (page-structure-marking-mode (double-rewrite x86-2))
                (canonical-address-p start-rip)
                (not (mv-nth 0
                             (las-to-pas (create-canonical-address-list cnt start-rip)
                                         :x (cpl x86-2) (double-rewrite x86-2)))))
           (xlate-equiv-memory (mv-nth 2 (get-prefixes start-rip prefixes cnt x86-1))
                               (mv-nth 2 (get-prefixes start-rip prefixes cnt x86-2))))
  :hints (("Goal"
           :use ((:instance xlate-equiv-memory-and-mv-nth-2-get-prefixes (x86 x86-1))
                 (:instance xlate-equiv-memory-and-mv-nth-2-get-prefixes (x86 x86-2)))
           :in-theory (e/d* ()
                            (xlate-equiv-memory-and-mv-nth-2-get-prefixes
                             acl2::ash-0
                             acl2::zip-open
                             cdr-create-canonical-address-list)))))

;; ----------------------------------------------------------------------

;; Rewriting get-prefixes to get-prefixes-alt:

;; The biggest drawback of this approach is that all the nice theorems
;; I had about get-prefixes now have to be re-proved in terms of
;; get-prefixes-alt.

(define get-prefixes-alt
  ((start-rip :type (signed-byte   #.*max-linear-address-size*))
   (prefixes  :type (unsigned-byte 43))
   (cnt       :type (integer 0 5))
   x86)
  :non-executable t
  :guard (canonical-address-p (+ cnt start-rip))
  (if (and (page-structure-marking-mode x86)
           (not (programmer-level-mode x86))
           (canonical-address-p start-rip)
           (not (mv-nth 0 (las-to-pas
                           (create-canonical-address-list cnt start-rip)
                           :x (cpl x86) x86))))

      (get-prefixes start-rip prefixes cnt x86)

    (mv nil nil x86)))

(defthm xlate-equiv-memory-and-two-mv-nth-2-get-prefixes-alt
  (implies (xlate-equiv-memory x86-1 x86-2)
           (xlate-equiv-memory (mv-nth 2 (get-prefixes-alt start-rip prefixes cnt x86-1))
                               (mv-nth 2 (get-prefixes-alt start-rip prefixes cnt x86-2))))
  :hints (("Goal"
           :use ((:instance xlate-equiv-memory-and-two-mv-nth-2-get-prefixes))
           :in-theory (e/d* (get-prefixes-alt)
                            (xlate-equiv-memory-and-mv-nth-2-get-prefixes))))
  :rule-classes :congruence)

(defthm xr-not-mem-and-get-prefixes-alt
  (implies (and (not (equal fld :mem))
                (not (equal fld :fault)))
           (equal (xr fld index (mv-nth 2 (get-prefixes-alt start-rip prefixes cnt x86)))
                  (xr fld index (double-rewrite x86))))
  :hints (("Goal"
           :in-theory (e/d* (get-prefixes-alt)
                            (not force (force))))))

(defthm xlate-equiv-memory-and-mv-nth-2-get-prefixes-alt
  (xlate-equiv-memory (mv-nth 2 (get-prefixes-alt start-rip prefixes cnt x86))
                      (double-rewrite x86))
  :hints (("Goal"
           :in-theory (e/d* (get-prefixes-alt)
                            (force (force))))))

(defthm rewrite-get-prefixes-to-get-prefixes-alt
  (implies (and (page-structure-marking-mode x86)
                (not (programmer-level-mode x86))
                (canonical-address-p start-rip)
                (not (mv-nth 0 (las-to-pas
                                (create-canonical-address-list cnt start-rip)
                                :x (cpl x86) x86))))
           (equal (get-prefixes start-rip prefixes cnt x86)
                  (get-prefixes-alt start-rip prefixes cnt x86)))
  :hints (("Goal" :in-theory (e/d* (get-prefixes-alt) ()))))

(defthm get-prefixes-alt-opener-lemma-no-prefix-byte
  (implies (and (let*
                    ((flg (mv-nth 0 (rm08 start-rip :x x86)))
                     (prefix-byte-group-code
                      (get-one-byte-prefix-array-code (mv-nth 1 (rm08 start-rip :x x86)))))
                  (and (not flg)
                       (zp prefix-byte-group-code)))
                (not (zp cnt))
                (page-structure-marking-mode x86)
                (not (programmer-level-mode x86))
                (canonical-address-p start-rip)
                (not
                 (mv-nth
                  0
                  (las-to-pas (create-canonical-address-list cnt start-rip)
                              :x (cpl x86)
                              x86))))
           (and
            (equal (mv-nth 0 (get-prefixes-alt start-rip prefixes cnt x86))
                   nil)
            (equal (mv-nth 1 (get-prefixes-alt start-rip prefixes cnt x86))
                   (let ((prefixes
                          (!prefixes-slice :next-byte
                                           (mv-nth 1 (rm08 start-rip :x x86))
                                           prefixes)))
                     (!prefixes-slice :num-prefixes (- 5 cnt) prefixes)))))
  :hints (("Goal"
           :use ((:instance get-prefixes-opener-lemma-no-prefix-byte))
           :in-theory (e/d* ()
                            (get-prefixes-opener-lemma-no-prefix-byte)))))

(defthm get-prefixes-alt-opener-lemma-zero-cnt
  (implies (and (zp cnt)
                (page-structure-marking-mode x86)
                (not (programmer-level-mode x86))
                (canonical-address-p start-rip)
                (not
                 (mv-nth
                  0
                  (las-to-pas (create-canonical-address-list cnt start-rip)
                              :x (cpl x86)
                              x86))))
           (equal (get-prefixes-alt start-rip prefixes cnt x86)
                  (mv nil prefixes x86)))
  :hints (("Goal"
           :use ((:instance get-prefixes-opener-lemma-zero-cnt))
           :in-theory (e/d () (get-prefixes-opener-lemma-zero-cnt
                               force (force))))))

(defthm get-prefixes-alt-opener-lemma-group-1-prefix-in-marking-mode
  (implies
   (and
    (canonical-address-p (1+ start-rip))
    (not (zp cnt))
    (equal (prefixes-slice :group-1-prefix prefixes) 0)
    (let*
        ((flg (mv-nth 0 (rm08 start-rip :x x86)))
         (prefix-byte-group-code
          (get-one-byte-prefix-array-code (mv-nth 1 (rm08 start-rip :x x86)))))
      (and (not flg)
           (equal prefix-byte-group-code 1)))
    (page-structure-marking-mode x86)
    (not (programmer-level-mode x86))
    (canonical-address-p start-rip)
    (not
     (mv-nth
      0
      (las-to-pas (create-canonical-address-list cnt start-rip)
                  :x (cpl x86)
                  x86))))
   (equal (get-prefixes-alt start-rip prefixes cnt x86)
          (get-prefixes-alt (+ 1 start-rip)
                            (!prefixes-slice :group-1-prefix
                                             (mv-nth 1 (rm08 start-rip :x x86))
                                             prefixes)
                            (+ -1 cnt)
                            (mv-nth 2 (rm08 start-rip :x x86)))))
  :hints (("Goal"
           :do-not-induct t
           :use ((:instance get-prefixes-opener-lemma-group-1-prefix-in-marking-mode)
                 (:instance rewrite-get-prefixes-to-get-prefixes-alt)
                 (:instance rewrite-get-prefixes-to-get-prefixes-alt
                            (start-rip (1+ start-rip))
                            (prefixes (!prefixes-slice :group-1-prefix
                                                       (mv-nth 1 (rm08 start-rip :x x86))
                                                       prefixes))
                            (cnt (1- cnt))
                            (x86 (mv-nth 2 (rm08 start-rip :x x86)))))
           :in-theory (e/d* (las-to-pas)
                            (get-prefixes-opener-lemma-group-1-prefix-in-marking-mode
                             rewrite-get-prefixes-to-get-prefixes-alt
                             acl2::ash-0
                             acl2::zip-open
                             byte-listp
                             unsigned-byte-p-of-logior
                             negative-logand-to-positive-logand-with-integerp-x
                             force (force))))))

(defthm get-prefixes-alt-opener-lemma-group-2-prefix-in-marking-mode
  (implies
   (and
    (canonical-address-p (1+ start-rip))
    (not (zp cnt))
    (equal (prefixes-slice :group-2-prefix prefixes) 0)
    (let*
        ((flg (mv-nth 0 (rm08 start-rip :x x86)))
         (prefix-byte-group-code
          (get-one-byte-prefix-array-code (mv-nth 1 (rm08 start-rip :x x86)))))
      (and (not flg)
           (equal prefix-byte-group-code 2)))
    (page-structure-marking-mode x86)
    (not (programmer-level-mode x86))
    (canonical-address-p start-rip)
    (not
     (mv-nth
      0
      (las-to-pas (create-canonical-address-list cnt start-rip)
                  :x (cpl x86)
                  x86))))
   (equal (get-prefixes-alt start-rip prefixes cnt x86)
          (get-prefixes-alt (+ 1 start-rip)
                            (!prefixes-slice :group-2-prefix
                                             (mv-nth 1 (rm08 start-rip :x x86))
                                             prefixes)
                            (+ -1 cnt)
                            (mv-nth 2 (rm08 start-rip :x x86)))))
  :hints (("Goal"
           :do-not-induct t
           :use ((:instance get-prefixes-opener-lemma-group-2-prefix-in-marking-mode)
                 (:instance rewrite-get-prefixes-to-get-prefixes-alt)
                 (:instance rewrite-get-prefixes-to-get-prefixes-alt
                            (start-rip (1+ start-rip))
                            (prefixes (!prefixes-slice :group-2-prefix
                                                       (mv-nth 1 (rm08 start-rip :x x86))
                                                       prefixes))
                            (cnt (1- cnt))
                            (x86 (mv-nth 2 (rm08 start-rip :x x86)))))
           :in-theory (e/d* (las-to-pas)
                            (get-prefixes-opener-lemma-group-2-prefix-in-marking-mode
                             rewrite-get-prefixes-to-get-prefixes-alt
                             acl2::ash-0
                             acl2::zip-open
                             byte-listp
                             unsigned-byte-p-of-logior
                             negative-logand-to-positive-logand-with-integerp-x
                             force (force))))))

(defthm get-prefixes-alt-opener-lemma-group-3-prefix-in-marking-mode
  (implies
   (and
    (canonical-address-p (1+ start-rip))
    (not (zp cnt))
    (equal (prefixes-slice :group-3-prefix prefixes) 0)
    (let*
        ((flg (mv-nth 0 (rm08 start-rip :x x86)))
         (prefix-byte-group-code
          (get-one-byte-prefix-array-code (mv-nth 1 (rm08 start-rip :x x86)))))
      (and (not flg)
           (equal prefix-byte-group-code 3)))
    (page-structure-marking-mode x86)
    (not (programmer-level-mode x86))
    (canonical-address-p start-rip)
    (not
     (mv-nth
      0
      (las-to-pas (create-canonical-address-list cnt start-rip)
                  :x (cpl x86)
                  x86))))
   (equal (get-prefixes-alt start-rip prefixes cnt x86)
          (get-prefixes-alt (+ 1 start-rip)
                            (!prefixes-slice :group-3-prefix
                                             (mv-nth 1 (rm08 start-rip :x x86))
                                             prefixes)
                            (+ -1 cnt)
                            (mv-nth 2 (rm08 start-rip :x x86)))))
  :hints (("Goal"
           :do-not-induct t
           :use ((:instance get-prefixes-opener-lemma-group-3-prefix-in-marking-mode)
                 (:instance rewrite-get-prefixes-to-get-prefixes-alt)
                 (:instance rewrite-get-prefixes-to-get-prefixes-alt
                            (start-rip (1+ start-rip))
                            (prefixes (!prefixes-slice :group-3-prefix
                                                       (mv-nth 1 (rm08 start-rip :x x86))
                                                       prefixes))
                            (cnt (1- cnt))
                            (x86 (mv-nth 2 (rm08 start-rip :x x86)))))
           :in-theory (e/d* (las-to-pas)
                            (get-prefixes-opener-lemma-group-3-prefix-in-marking-mode
                             rewrite-get-prefixes-to-get-prefixes-alt
                             acl2::ash-0
                             acl2::zip-open
                             byte-listp
                             unsigned-byte-p-of-logior
                             negative-logand-to-positive-logand-with-integerp-x
                             force (force))))))

(defthm get-prefixes-alt-opener-lemma-group-4-prefix-in-marking-mode
  (implies
   (and
    (canonical-address-p (1+ start-rip))
    (not (zp cnt))
    (equal (prefixes-slice :group-4-prefix prefixes) 0)
    (let*
        ((flg (mv-nth 0 (rm08 start-rip :x x86)))
         (prefix-byte-group-code
          (get-one-byte-prefix-array-code (mv-nth 1 (rm08 start-rip :x x86)))))
      (and (not flg)
           (equal prefix-byte-group-code 4)))
    (page-structure-marking-mode x86)
    (not (programmer-level-mode x86))
    (canonical-address-p start-rip)
    (not
     (mv-nth
      0
      (las-to-pas (create-canonical-address-list cnt start-rip)
                  :x (cpl x86)
                  x86))))
   (equal (get-prefixes-alt start-rip prefixes cnt x86)
          (get-prefixes-alt (+ 1 start-rip)
                            (!prefixes-slice :group-4-prefix
                                             (mv-nth 1 (rm08 start-rip :x x86))
                                             prefixes)
                            (+ -1 cnt)
                            (mv-nth 2 (rm08 start-rip :x x86)))))
  :hints (("Goal"
           :do-not-induct t
           :use ((:instance get-prefixes-opener-lemma-group-4-prefix-in-marking-mode)
                 (:instance rewrite-get-prefixes-to-get-prefixes-alt)
                 (:instance rewrite-get-prefixes-to-get-prefixes-alt
                            (start-rip (1+ start-rip))
                            (prefixes (!prefixes-slice :group-4-prefix
                                                       (mv-nth 1 (rm08 start-rip :x x86))
                                                       prefixes))
                            (cnt (1- cnt))
                            (x86 (mv-nth 2 (rm08 start-rip :x x86)))))
           :in-theory (e/d* (las-to-pas)
                            (get-prefixes-opener-lemma-group-4-prefix-in-marking-mode
                             rewrite-get-prefixes-to-get-prefixes-alt
                             acl2::ash-0
                             acl2::zip-open
                             byte-listp
                             unsigned-byte-p-of-logior
                             negative-logand-to-positive-logand-with-integerp-x
                             force (force))))))

;; ======================================================================

;; Step function opener lemma:

(defthm x86-fetch-decode-execute-opener-in-marking-mode
  (b* ((start-rip (rip x86))

       ((mv flg-get-prefixes prefixes x86-1)
        (get-prefixes start-rip 0 5 x86))

       (opcode/rex/escape-byte (prefixes-slice :next-byte prefixes))
       (prefix-length (prefixes-slice :num-prefixes prefixes))
       (temp-rip0 (if (equal prefix-length 0)
                      (+ 1 start-rip)
                    (+ prefix-length start-rip 1)))
       (rex-byte (if (equal (ash opcode/rex/escape-byte -4) 4)
                     opcode/rex/escape-byte
                   0))

       ((mv flg-opcode/escape-byte opcode/escape-byte x86-2)
        (if (equal rex-byte 0)
            (mv nil opcode/rex/escape-byte x86-1)
          (rm08 temp-rip0 :x x86-1)))

       (temp-rip1 (if (equal rex-byte 0) temp-rip0 (1+ temp-rip0)))
       (modr/m? (x86-one-byte-opcode-modr/m-p opcode/escape-byte))

       ((mv flg-modr/m modr/m x86-3)
        (if modr/m?
            (rm08 temp-rip1 :x x86-2)
          (mv nil 0 x86-2)))

       (temp-rip2 (if modr/m? (1+ temp-rip1) temp-rip1))
       (sib? (and modr/m? (x86-decode-sib-p modr/m)))

       ((mv flg-sib sib x86-4)
        (if sib?
            (rm08 temp-rip2 :x x86-3)
          (mv nil 0 x86-3)))

       (temp-rip3 (if sib? (1+ temp-rip2) temp-rip2)))

    (implies (and (page-structure-marking-mode x86)
                  (not (programmer-level-mode x86))
                  (not (ms x86))
                  (not (fault x86))
                  (x86p x86)

                  (not flg-get-prefixes)

                  (canonical-address-p temp-rip0)
                  (if (and (equal prefix-length 0)
                           (equal rex-byte 0)
                           (not modr/m?))
                      ;; One byte instruction --- all we need to know is that
                      ;; the new RIP is canonical, not that there's no error
                      ;; in reading a value from that address.
                      t
                    (not flg-opcode/escape-byte))
                  (if (equal rex-byte 0)
                      t
                    (canonical-address-p temp-rip1))
                  (if modr/m?
                      (and (canonical-address-p temp-rip2)
                           (not flg-modr/m))
                    t)
                  (if sib?
                      (and (canonical-address-p temp-rip3)
                           (not flg-sib))
                    t))

             (equal (x86-fetch-decode-execute x86)
                    (top-level-opcode-execute
                     start-rip temp-rip3 prefixes rex-byte opcode/escape-byte modr/m sib x86-4))))
  :hints (("Goal"
           :in-theory (e/d (x86-fetch-decode-execute)
                           (top-level-opcode-execute
                            signed-byte-p
                            not
                            member-equal)))))

;; ======================================================================

;; rb and xlate-equiv-memory:

(defthm mv-nth-0-rb-and-xlate-equiv-memory
  (implies (xlate-equiv-memory x86-1 x86-2)
           (equal (mv-nth 0 (rb l-addrs r-w-x x86-1))
                  (mv-nth 0 (rb l-addrs r-w-x x86-2))))
  :hints (("Goal" :in-theory (e/d* (rb) (force (force)))))
  :rule-classes :congruence)

(defthm read-from-physical-memory-and-xlate-equiv-memory-disjoint-from-paging-structures
  (implies (and (bind-free
                 (find-an-xlate-equiv-x86
                  'read-from-physical-memory-and-xlate-equiv-memory
                  x86-1 'x86-2 mfc state)
                 (x86-2))
                (syntaxp (and (not (eq x86-2 x86-1))
                              ;; x86-2 must be smaller than x86-1.
                              (term-order x86-2 x86-1)))
                (xlate-equiv-memory (double-rewrite x86-1) x86-2)
                (disjoint-p (all-translation-governing-addresses l-addrs (double-rewrite x86-1))
                            (mv-nth 1 (las-to-pas l-addrs r-w-x cpl (double-rewrite x86-1))))
                (disjoint-p (mv-nth 1 (las-to-pas l-addrs r-w-x cpl (double-rewrite x86-1)))
                            (open-qword-paddr-list
                             (gather-all-paging-structure-qword-addresses (double-rewrite x86-1))))
                (canonical-address-listp l-addrs))
           (equal (read-from-physical-memory (mv-nth 1 (las-to-pas l-addrs r-w-x cpl x86-1)) x86-1)
                  (read-from-physical-memory (mv-nth 1 (las-to-pas l-addrs r-w-x cpl x86-1)) x86-2)))
  :hints (("Goal"
           :induct (las-to-pas l-addrs r-w-x cpl x86-1)
           :in-theory (e/d* (las-to-pas
                             disjoint-p
                             xlate-equiv-memory)
                            (disjoint-p-of-open-qword-paddr-list-and-remove-duplicates-equal
                             not-disjoint-p-of-open-qword-paddr-list-and-remove-duplicates-equal
                             member-p-of-open-qword-paddr-list-and-remove-duplicates-equal
                             not-member-p-of-open-qword-paddr-list-and-remove-duplicates-equal)))))

(local
 (defthm xlate-equiv-memory-in-programmer-level-mode-implies-equal-states
   (implies (and (xlate-equiv-memory x86-1 x86-2)
                 (programmer-level-mode x86-1))
            (equal x86-1 x86-2))
   :hints (("Goal" :in-theory (e/d* (xlate-equiv-memory) ())))
   :rule-classes nil))

(defthm mv-nth-1-rb-and-xlate-equiv-memory-disjoint-from-paging-structures
  (implies (and (bind-free
                 (find-an-xlate-equiv-x86
                  'mv-nth-1-rb-and-xlate-equiv-memory
                  x86-1 'x86-2 mfc state)
                 (x86-2))
                (syntaxp (and
                          (not (eq x86-2 x86-1))
                          ;; x86-2 must be smaller than x86-1.
                          (term-order x86-2 x86-1)))
                (xlate-equiv-memory (double-rewrite x86-1) x86-2)
                (disjoint-p (all-translation-governing-addresses l-addrs (double-rewrite x86-1))
                            (mv-nth 1 (las-to-pas l-addrs r-w-x (cpl x86-1) (double-rewrite x86-1))))
                (disjoint-p (mv-nth 1 (las-to-pas l-addrs r-w-x (cpl x86-1) (double-rewrite x86-1)))
                            (open-qword-paddr-list
                             (gather-all-paging-structure-qword-addresses (double-rewrite x86-1))))
                (canonical-address-listp l-addrs))
           (equal (mv-nth 1 (rb l-addrs r-w-x x86-1))
                  (mv-nth 1 (rb l-addrs r-w-x x86-2))))
  :hints (("Goal"
           :do-not-induct t
           :use ((:instance xlate-equiv-memory-in-programmer-level-mode-implies-equal-states)
                 (:instance read-from-physical-memory-and-xlate-equiv-memory-disjoint-from-paging-structures
                            (cpl (cpl x86-1))))
           :in-theory (e/d* (rb)
                            (read-from-physical-memory-and-xlate-equiv-memory-disjoint-from-paging-structures
                             disjoint-p-of-open-qword-paddr-list-and-remove-duplicates-equal
                             not-disjoint-p-of-open-qword-paddr-list-and-remove-duplicates-equal
                             member-p-of-open-qword-paddr-list-and-remove-duplicates-equal
                             not-member-p-of-open-qword-paddr-list-and-remove-duplicates-equal
                             force (force))))))

(defthm mv-nth-2-rb-and-xlate-equiv-memory
  (implies (and (page-structure-marking-mode (double-rewrite x86))
                (not (mv-nth 0 (las-to-pas l-addrs r-w-x (cpl x86) (double-rewrite x86))))
                (not (programmer-level-mode (double-rewrite x86))))
           (xlate-equiv-memory (mv-nth 2 (rb l-addrs r-w-x x86))
                               (double-rewrite x86)))
  :hints (("Goal" :in-theory (e/d* () (force (force))))))

(defthmd xlate-equiv-memory-and-two-mv-nth-2-rb
  (implies (and (xlate-equiv-memory x86-1 x86-2)
                (page-structure-marking-mode x86-1)
                (not (programmer-level-mode x86-1))
                (not (mv-nth 0 (las-to-pas l-addrs r-w-x (cpl x86-1) (double-rewrite x86-1)))))
           (xlate-equiv-memory (mv-nth 2 (rb l-addrs r-w-x x86-1))
                               (mv-nth 2 (rb l-addrs r-w-x x86-2))))
  :hints (("Goal" :in-theory (e/d* () (mv-nth-2-rb-and-xlate-equiv-memory))
           :use ((:instance mv-nth-2-rb-and-xlate-equiv-memory (x86 x86-1))
                 (:instance mv-nth-2-rb-and-xlate-equiv-memory (x86 x86-2))))))

(define rb-alt ((l-addrs canonical-address-listp)
                (r-w-x :type (member :r :w :x))
                (x86))
  :non-executable t
  (if (and (page-structure-marking-mode x86)
           (not (programmer-level-mode x86))
           (not (mv-nth 0 (las-to-pas l-addrs r-w-x (cpl x86) x86))))

      (rb l-addrs r-w-x x86)

    (mv nil nil x86)))

(defthm xlate-equiv-memory-and-mv-nth-2-rb-alt
  (implies (xlate-equiv-memory x86-1 x86-2)
           (xlate-equiv-memory (mv-nth 2 (rb-alt l-addrs r-w-x x86-1))
                               (mv-nth 2 (rb-alt l-addrs r-w-x x86-2))))
  :hints (("Goal" :in-theory (e/d* (rb-alt) ())
           :use ((:instance xlate-equiv-memory-and-two-mv-nth-2-rb)))))

(defthm rewrite-rb-to-rb-alt
  (implies (and (page-structure-marking-mode x86)
                (not (programmer-level-mode x86))
                (not (mv-nth 0 (las-to-pas l-addrs r-w-x (cpl x86) x86))))
           (equal (rb l-addrs r-w-x x86)
                  (rb-alt l-addrs r-w-x x86)))
  :hints (("Goal" :in-theory (e/d* (rb-alt) ()))))

;; ======================================================================

;; program-at and xlate-equiv-memory:

(defthm program-at-and-xlate-equiv-memory-disjoint-from-paging-structures
  (implies (and (bind-free
                 (find-an-xlate-equiv-x86
                  'mv-nth-1-rb-and-xlate-equiv-memory
                  x86-1 'x86-2 mfc state)
                 (x86-2))
                (syntaxp (and
                          (not (eq x86-2 x86-1))
                          ;; x86-2 must be smaller than x86-1.
                          (term-order x86-2 x86-1)))
                (xlate-equiv-memory (double-rewrite x86-1) x86-2)
                (disjoint-p (all-translation-governing-addresses l-addrs (double-rewrite x86-1))
                            (mv-nth 1 (las-to-pas l-addrs :x (cpl x86-1) (double-rewrite x86-1))))
                (disjoint-p (mv-nth 1 (las-to-pas l-addrs :x (cpl x86-1) (double-rewrite x86-1)))
                            (open-qword-paddr-list
                             (gather-all-paging-structure-qword-addresses (double-rewrite x86-1))))
                (canonical-address-listp l-addrs))
           (equal (program-at l-addrs bytes x86-1)
                  (program-at l-addrs bytes x86-2)))
  :hints (("Goal"
           :do-not-induct t
           :use ((:instance mv-nth-1-rb-and-xlate-equiv-memory-disjoint-from-paging-structures
                            (r-w-x :x)))
           :in-theory (e/d* (program-at)
                            (mv-nth-1-rb-and-xlate-equiv-memory-disjoint-from-paging-structures
                             disjoint-p-of-open-qword-paddr-list-and-remove-duplicates-equal
                             not-disjoint-p-of-open-qword-paddr-list-and-remove-duplicates-equal
                             member-p-of-open-qword-paddr-list-and-remove-duplicates-equal
                             not-member-p-of-open-qword-paddr-list-and-remove-duplicates-equal
                             force (force))))))

;; ======================================================================
