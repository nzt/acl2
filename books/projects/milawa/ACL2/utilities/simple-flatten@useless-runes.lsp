(MILAWA::SLOW-SIMPLE-FLATTEN
     (17 2
         (:REWRITE MILAWA::RANK-WHEN-NOT-CONSP))
     (8 2
        (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (7 2
        (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (4 4 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (4 1
        (:REWRITE MILAWA::RANK-WHEN-MEMBERP-WEAK))
     (4 1 (:REWRITE MILAWA::RANK-WHEN-MEMBERP))
     (2 2
        (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (2 2
        (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (2 2 (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (2 2
        (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (2 2
        (:REWRITE MILAWA::MEMBERP-WHEN-MEMBERP-OF-CDR))
     (2 2
        (:REWRITE MILAWA::IN-SUPERSET-WHEN-IN-SUBSET-TWO))
     (2 2
        (:REWRITE MILAWA::IN-SUPERSET-WHEN-IN-SUBSET-ONE))
     (2 2
        (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (2 2
        (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
     (1 1 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
     (1 1
        (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
     (1 1
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
     (1 1
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
     (1 1
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
     (1 1
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
     (1 1
        (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
     (1 1
        (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP)))
(MILAWA::SLOW-SIMPLE-FLATTEN-WHEN-NOT-CONSP
     (4 1
        (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (3 1
        (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (1 1
        (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (1 1
        (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (1 1 (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (1 1
        (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (1 1 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (1 1
        (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (1 1
        (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP)))
(MILAWA::SLOW-SIMPLE-FLATTEN-OF-CONS
     (63 6
         (:REWRITE MILAWA::SLOW-SIMPLE-FLATTEN-WHEN-NOT-CONSP))
     (62 17
         (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (50 5
         (:REWRITE MILAWA::APP-WHEN-NOT-CONSP-TWO))
     (50 5 (:REWRITE MILAWA::APP-WHEN-NOT-CONSP))
     (49 17
         (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (17 17
         (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (17 17
         (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
     (15 15
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (15 15
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (15 15
         (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (15 15
         (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (15 15 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (5 5
        (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP))
     (3 3
        (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
     (3 3
        (:REWRITE MILAWA::CAR-WHEN-MEMBERP-OF-SINGLETON-LIST-CHEAP))
     (3 3
        (:REWRITE MILAWA::CAR-WHEN-MEMBERP-AND-NOT-MEMBERP-OF-CDR-CHEAP))
     (2 2 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
     (2 2
        (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
     (2 2
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
     (2 2
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
     (2 2
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
     (2 2
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
     (2 2 (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
     (2 2
        (:REWRITE MILAWA::CAR-WHEN-NOT-CONSP)))
(MILAWA::FAST-SIMPLE-FLATTEN$
     (29 9
         (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (22 7
         (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (17 2
         (:REWRITE MILAWA::RANK-WHEN-NOT-CONSP))
     (15 1 (:REWRITE MILAWA::APP-WHEN-NOT-CONSP))
     (14 6
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (10 1 (:REWRITE MILAWA::REV-WHEN-NOT-CONSP))
     (9 9
        (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (9 9
        (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
     (8 8
        (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (7 7 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (5 5 (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (5 5
        (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (5 1 (:REWRITE MILAWA::REV-UNDER-IFF))
     (4 1
        (:REWRITE MILAWA::RANK-WHEN-MEMBERP-WEAK))
     (4 1 (:REWRITE MILAWA::RANK-WHEN-MEMBERP))
     (4 1
        (:REWRITE MILAWA::APP-WHEN-NOT-CONSP-TWO))
     (2 2
        (:REWRITE MILAWA::MEMBERP-WHEN-MEMBERP-OF-CDR))
     (2 2
        (:REWRITE MILAWA::IN-SUPERSET-WHEN-IN-SUBSET-TWO))
     (2 2
        (:REWRITE MILAWA::IN-SUPERSET-WHEN-IN-SUBSET-ONE))
     (1 1 (:REWRITE MILAWA::TRUE-LISTP-OF-REV))
     (1 1 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
     (1 1
        (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
     (1 1
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
     (1 1
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
     (1 1
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
     (1 1
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
     (1 1
        (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
     (1 1 (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
     (1 1 (:REWRITE MILAWA::CAR-WHEN-NOT-CONSP))
     (1 1
        (:REWRITE MILAWA::CAR-WHEN-MEMBERP-OF-SINGLETON-LIST-CHEAP))
     (1 1
        (:REWRITE MILAWA::CAR-WHEN-MEMBERP-AND-NOT-MEMBERP-OF-CDR-CHEAP))
     (1 1
        (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP)))
(MILAWA::SIMPLE-FLATTEN)
(MILAWA::LEMMA-FOR-DEFINITION-OF-SIMPLE-FLATTEN
 (1055 297
       (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
 (486 201
      (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
 (452 48
      (:REWRITE MILAWA::APP-WHEN-NOT-CONSP-TWO))
 (425 47
      (:REWRITE MILAWA::REV-WHEN-NOT-CONSP))
 (340 58 (:REWRITE MILAWA::REV-UNDER-IFF))
 (338 16 (:REWRITE MILAWA::CONSP-OF-APP))
 (297 297
      (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
 (297 297
      (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
 (194 106
      (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
 (175 175
      (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
 (96 16
     (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS-TWO))
 (96 16
     (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS))
 (95 95
     (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
 (95 95
     (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
 (95 95 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
 (64 16
     (:REWRITE MILAWA::SAME-LENGTH-PREFIXES-EQUAL-CHEAP))
 (58 58 (:REWRITE MILAWA::TRUE-LISTP-OF-REV))
 (48 48
     (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP))
 (32 32 (:REWRITE MILAWA::TRICHOTOMY-OF-<))
 (32 32
     (:REWRITE MILAWA::TRANSITIVITY-OF-<-TWO))
 (32 32
     (:REWRITE MILAWA::TRANSITIVITY-OF-<-THREE))
 (32 32 (:REWRITE MILAWA::TRANSITIVITY-OF-<))
 (32 32
     (:REWRITE MILAWA::LESS-WHEN-ZP-LEFT-CHEAP))
 (31 31
     (:REWRITE MILAWA::CAR-WHEN-NOT-CONSP))
 (31 31
     (:REWRITE MILAWA::CAR-WHEN-MEMBERP-OF-SINGLETON-LIST-CHEAP))
 (31 31
     (:REWRITE MILAWA::CAR-WHEN-MEMBERP-AND-NOT-MEMBERP-OF-CDR-CHEAP))
 (30 30
     (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
 (30 30
     (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
 (16 16 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
 (16 16
     (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-TWO))
 (16 16
     (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-ONE))
 (16 16
     (:REWRITE MILAWA::FORCING-PREFIXP-WHEN-NOT-PREFIXP-BADGUY))
 (16 16
     (:REWRITE MILAWA::EQUAL-OF-BOOLEANS-REWRITE))
 (16 16
     (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
 (16 16
     (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
 (16 16
     (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
 (16 16
     (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
 (16 16
     (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
 (10 10
     (:REWRITE MILAWA::CDR-OF-CDR-WITH-LEN-FREE-PAST-THE-END))
 (10
   10
   (:REWRITE MILAWA::CDR-OF-CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END)))
(MILAWA::DEFINITION-OF-SIMPLE-FLATTEN
     (115 37
          (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (94 37
         (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (68 32
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (50 5 (:REWRITE MILAWA::APP-WHEN-NOT-CONSP))
     (38 38
         (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (38 38
         (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
     (38 6
         (:REWRITE MILAWA::LIST-FIX-WHEN-NOT-CONSP))
     (34 34
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (30 5
         (:REWRITE MILAWA::SAME-LENGTH-PREFIXES-EQUAL-CHEAP))
     (30 5
         (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS-TWO))
     (30 5
         (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS))
     (26 26
         (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (26 26
         (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (26 26 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (20 5
         (:REWRITE MILAWA::PREFIXP-OF-LIST-FIX-ONE))
     (20 2 (:REWRITE MILAWA::REV-WHEN-NOT-CONSP))
     (10 10 (:REWRITE MILAWA::TRICHOTOMY-OF-<))
     (10 10
         (:REWRITE MILAWA::TRANSITIVITY-OF-<-TWO))
     (10 10
         (:REWRITE MILAWA::TRANSITIVITY-OF-<-THREE))
     (10 10 (:REWRITE MILAWA::TRANSITIVITY-OF-<))
     (10 10
         (:REWRITE MILAWA::LESS-WHEN-ZP-LEFT-CHEAP))
     (10 10
         (:REWRITE MILAWA::FORCING-PREFIXP-WHEN-NOT-PREFIXP-BADGUY))
     (8 8
        (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP))
     (5 5 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
     (5 5
        (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-TWO))
     (5 5
        (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-ONE))
     (5 5
        (:REWRITE MILAWA::EQUAL-OF-BOOLEANS-REWRITE))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
     (5 5
        (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
     (5 5 (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
     (5 5 (:REWRITE MILAWA::CAR-WHEN-NOT-CONSP))
     (5 5
        (:REWRITE MILAWA::CAR-WHEN-MEMBERP-OF-SINGLETON-LIST-CHEAP))
     (5 5
        (:REWRITE MILAWA::CAR-WHEN-MEMBERP-AND-NOT-MEMBERP-OF-CDR-CHEAP))
     (5 1 (:REWRITE MILAWA::CONSP-OF-LIST-FIX)))
(MILAWA::SIMPLE-FLATTEN-WHEN-NOT-CONSP
     (4 1
        (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (3 1
        (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (1 1
        (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (1 1
        (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (1 1 (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (1 1
        (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (1 1 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (1 1
        (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (1 1
        (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP)))
(MILAWA::SIMPLE-FLATTEN-OF-CONS
     (63 6
         (:REWRITE MILAWA::SIMPLE-FLATTEN-WHEN-NOT-CONSP))
     (62 17
         (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (50 5
         (:REWRITE MILAWA::APP-WHEN-NOT-CONSP-TWO))
     (50 5 (:REWRITE MILAWA::APP-WHEN-NOT-CONSP))
     (49 17
         (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (17 17
         (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (17 17
         (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
     (15 15
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (15 15
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (15 15
         (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (15 15
         (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (15 15 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (5 5
        (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP))
     (3 3
        (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
     (3 3
        (:REWRITE MILAWA::CAR-WHEN-MEMBERP-OF-SINGLETON-LIST-CHEAP))
     (3 3
        (:REWRITE MILAWA::CAR-WHEN-MEMBERP-AND-NOT-MEMBERP-OF-CDR-CHEAP))
     (2 2 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
     (2 2
        (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
     (2 2
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
     (2 2
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
     (2 2
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
     (2 2
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
     (2 2 (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
     (2 2
        (:REWRITE MILAWA::CAR-WHEN-NOT-CONSP)))
(MILAWA::TRUE-LISTP-OF-SIMPLE-FLATTEN
     (111 31
          (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (88 25
         (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (72 25
         (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (31 31
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (25 25
         (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (25 25
         (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
     (24 2
         (:REWRITE MILAWA::SAME-LENGTH-PREFIXES-EQUAL-CHEAP))
     (21 21
         (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (21 21
         (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (21 21 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (20 2
         (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-TWO))
     (12 2
         (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS-TWO))
     (12 2
         (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS))
     (5 5 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
     (5 5
        (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
     (5 5 (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
     (4 4 (:REWRITE MILAWA::TRICHOTOMY-OF-<))
     (4 4
        (:REWRITE MILAWA::TRANSITIVITY-OF-<-TWO))
     (4 4
        (:REWRITE MILAWA::TRANSITIVITY-OF-<-THREE))
     (4 4 (:REWRITE MILAWA::TRANSITIVITY-OF-<))
     (4 4
        (:REWRITE MILAWA::LESS-WHEN-ZP-LEFT-CHEAP))
     (2 2
        (:REWRITE MILAWA::FORCING-PREFIXP-WHEN-NOT-PREFIXP-BADGUY)))
(MILAWA::SIMPLE-FLATTEN-OF-LIST-FIX
     (107 11
          (:REWRITE MILAWA::LIST-FIX-WHEN-TRUE-LISTP))
     (89 27
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (66 30
         (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (64 31
         (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (54 10 (:REWRITE MILAWA::CONSP-OF-LIST-FIX))
     (54 9
         (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS-TWO))
     (54 9
         (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS))
     (41 41
         (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (41 41
         (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
     (36 9
         (:REWRITE MILAWA::SAME-LENGTH-PREFIXES-EQUAL-CHEAP))
     (27 27
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (18 18 (:REWRITE MILAWA::TRICHOTOMY-OF-<))
     (18 18
         (:REWRITE MILAWA::TRANSITIVITY-OF-<-TWO))
     (18 18
         (:REWRITE MILAWA::TRANSITIVITY-OF-<-THREE))
     (18 18 (:REWRITE MILAWA::TRANSITIVITY-OF-<))
     (18 18
         (:REWRITE MILAWA::LESS-WHEN-ZP-LEFT-CHEAP))
     (16 16
         (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
     (16 16
         (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
     (16 16
         (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
     (16 16
         (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
     (16 16
         (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
     (16 8 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
     (12 12
         (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (12 12
         (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (12 12 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (11 2
         (:REWRITE MILAWA::APP-WHEN-NOT-CONSP-TWO))
     (11 2 (:REWRITE MILAWA::APP-WHEN-NOT-CONSP))
     (9 9
        (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-TWO))
     (9 9
        (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-ONE))
     (9 9
        (:REWRITE MILAWA::FORCING-PREFIXP-WHEN-NOT-PREFIXP-BADGUY))
     (9 9
        (:REWRITE MILAWA::EQUAL-OF-BOOLEANS-REWRITE))
     (8 8
        (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
     (8 8 (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
     (2 2
        (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP))
     (1 1
        (:REWRITE MILAWA::TRUE-LISTP-OF-SIMPLE-FLATTEN)))
(MILAWA::SIMPLE-FLATTEN-OF-APP
     (183 24
          (:REWRITE MILAWA::APP-WHEN-NOT-CONSP-TWO))
     (182 76
          (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (141 54
          (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (108 10 (:REWRITE MILAWA::CONSP-OF-APP))
     (76 76
         (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (76 76
         (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
     (54 9
         (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS-TWO))
     (54 9
         (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS))
     (36 9
         (:REWRITE MILAWA::SAME-LENGTH-PREFIXES-EQUAL-CHEAP))
     (34 30
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (30 30
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (29 29
         (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (29 29
         (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (29 29 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (24 24
         (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP))
     (18 18 (:REWRITE MILAWA::TRICHOTOMY-OF-<))
     (18 18
         (:REWRITE MILAWA::TRANSITIVITY-OF-<-TWO))
     (18 18
         (:REWRITE MILAWA::TRANSITIVITY-OF-<-THREE))
     (18 18 (:REWRITE MILAWA::TRANSITIVITY-OF-<))
     (18 18
         (:REWRITE MILAWA::LESS-WHEN-ZP-LEFT-CHEAP))
     (12 12
         (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
     (12 12
         (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
     (12 12
         (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
     (12 12
         (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
     (12 12
         (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
     (9 9
        (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-TWO))
     (9 9
        (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-ONE))
     (9 9
        (:REWRITE MILAWA::FORCING-PREFIXP-WHEN-NOT-PREFIXP-BADGUY))
     (9 9
        (:REWRITE MILAWA::EQUAL-OF-BOOLEANS-REWRITE))
     (8 8
        (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
     (8 8 (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
     (5 1
        (:REWRITE MILAWA::LIST-FIX-WHEN-NOT-CONSP))
     (4 4 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR)))
(MILAWA::SIMPLE-FLATTEN-OF-LIST-LIST-FIX
     (60 24
         (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (58 25
         (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (54 10
         (:REWRITE MILAWA::CONSP-OF-LIST-LIST-FIX))
     (54 9
         (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS-TWO))
     (54 9
         (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS))
     (36 9
         (:REWRITE MILAWA::SAME-LENGTH-PREFIXES-EQUAL-CHEAP))
     (25 25
         (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (25 25
         (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
     (18 18 (:REWRITE MILAWA::TRICHOTOMY-OF-<))
     (18 18
         (:REWRITE MILAWA::TRANSITIVITY-OF-<-TWO))
     (18 18
         (:REWRITE MILAWA::TRANSITIVITY-OF-<-THREE))
     (18 18 (:REWRITE MILAWA::TRANSITIVITY-OF-<))
     (18 18
         (:REWRITE MILAWA::LESS-WHEN-ZP-LEFT-CHEAP))
     (12 12
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (12 12
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (12 12
         (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (12 12
         (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (12 12 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (12 12
         (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
     (12 12
         (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
     (12 12
         (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
     (12 12
         (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
     (12 12
         (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
     (11 2
         (:REWRITE MILAWA::APP-WHEN-NOT-CONSP-TWO))
     (11 2 (:REWRITE MILAWA::APP-WHEN-NOT-CONSP))
     (9 9
        (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-TWO))
     (9 9
        (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-ONE))
     (9 9
        (:REWRITE MILAWA::FORCING-PREFIXP-WHEN-NOT-PREFIXP-BADGUY))
     (9 9
        (:REWRITE MILAWA::EQUAL-OF-BOOLEANS-REWRITE))
     (8 8
        (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
     (8 8 (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
     (4 4 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
     (2 2
        (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP))
     (1 1
        (:REWRITE MILAWA::TRUE-LISTP-OF-SIMPLE-FLATTEN)))
(MILAWA::FORCING-FAST-SIMPLE-FLATTEN$-REMOVAL
 (1007 281
       (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
 (452 48
      (:REWRITE MILAWA::APP-WHEN-NOT-CONSP-TWO))
 (390 153
      (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
 (361 47
      (:REWRITE MILAWA::REV-WHEN-NOT-CONSP))
 (356 58 (:REWRITE MILAWA::REV-UNDER-IFF))
 (338 16 (:REWRITE MILAWA::CONSP-OF-APP))
 (281 281
      (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
 (281 281
      (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
 (178 90
      (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
 (159 159
      (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
 (96 16
     (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS-TWO))
 (96 16
     (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS))
 (79 79
     (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
 (79 79
     (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
 (79 79 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
 (64 16
     (:REWRITE MILAWA::SAME-LENGTH-PREFIXES-EQUAL-CHEAP))
 (58 58 (:REWRITE MILAWA::TRUE-LISTP-OF-REV))
 (48 48
     (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP))
 (32 32
     (:REWRITE MILAWA::TRUE-LISTP-OF-SIMPLE-FLATTEN))
 (32 32 (:REWRITE MILAWA::TRICHOTOMY-OF-<))
 (32 32
     (:REWRITE MILAWA::TRANSITIVITY-OF-<-TWO))
 (32 32
     (:REWRITE MILAWA::TRANSITIVITY-OF-<-THREE))
 (32 32 (:REWRITE MILAWA::TRANSITIVITY-OF-<))
 (32 32
     (:REWRITE MILAWA::LESS-WHEN-ZP-LEFT-CHEAP))
 (31 31
     (:REWRITE MILAWA::CAR-WHEN-NOT-CONSP))
 (31 31
     (:REWRITE MILAWA::CAR-WHEN-MEMBERP-OF-SINGLETON-LIST-CHEAP))
 (31 31
     (:REWRITE MILAWA::CAR-WHEN-MEMBERP-AND-NOT-MEMBERP-OF-CDR-CHEAP))
 (30 30
     (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
 (30 30
     (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
 (16 16 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
 (16 16
     (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-TWO))
 (16 16
     (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-ONE))
 (16 16
     (:REWRITE MILAWA::FORCING-PREFIXP-WHEN-NOT-PREFIXP-BADGUY))
 (16 16
     (:REWRITE MILAWA::EQUAL-OF-BOOLEANS-REWRITE))
 (16 16
     (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
 (16 16
     (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
 (16 16
     (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
 (16 16
     (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
 (16 16
     (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
 (10 10
     (:REWRITE MILAWA::CDR-OF-CDR-WITH-LEN-FREE-PAST-THE-END))
 (10
   10
   (:REWRITE MILAWA::CDR-OF-CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END)))
(MILAWA::FAST-SIMPLE-FLATTEN-OF-DOMAIN$
     (71 20
         (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (70 22
         (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (69 9
         (:REWRITE MILAWA::MAPP-WHEN-NOT-CONSP))
     (62 22
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (24 24
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (22 22
         (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (22 22
         (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
     (19 19 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (17 17
         (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (17 17
         (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (17 2
         (:REWRITE MILAWA::RANK-WHEN-NOT-CONSP))
     (15 1 (:REWRITE MILAWA::APP-WHEN-NOT-CONSP))
     (10 1 (:REWRITE MILAWA::REV-WHEN-NOT-CONSP))
     (6 2 (:REWRITE MILAWA::CAR-WHEN-NOT-CONSP))
     (5 5 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
     (5 5
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
     (5 5
        (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
     (5 5 (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
     (5 1 (:REWRITE MILAWA::REV-UNDER-IFF))
     (4 1
        (:REWRITE MILAWA::RANK-WHEN-MEMBERP-WEAK))
     (4 1 (:REWRITE MILAWA::RANK-WHEN-MEMBERP))
     (4 1
        (:REWRITE MILAWA::APP-WHEN-NOT-CONSP-TWO))
     (2 2
        (:REWRITE MILAWA::MEMBERP-WHEN-MEMBERP-OF-CDR))
     (2 2
        (:REWRITE MILAWA::IN-SUPERSET-WHEN-IN-SUBSET-TWO))
     (2 2
        (:REWRITE MILAWA::IN-SUPERSET-WHEN-IN-SUBSET-ONE))
     (2 2
        (:REWRITE MILAWA::CAR-WHEN-MEMBERP-OF-SINGLETON-LIST-CHEAP))
     (2 2
        (:REWRITE MILAWA::CAR-WHEN-MEMBERP-AND-NOT-MEMBERP-OF-CDR-CHEAP))
     (1 1 (:REWRITE MILAWA::TRUE-LISTP-OF-REV))
     (1 1
        (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP)))
(MILAWA::FAST-SIMPLE-FLATTEN-OF-DOMAIN$-REMOVAL
 (1043 317
       (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
 (452 48
      (:REWRITE MILAWA::APP-WHEN-NOT-CONSP-TWO))
 (426 189
      (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
 (361 47
      (:REWRITE MILAWA::REV-WHEN-NOT-CONSP))
 (356 58 (:REWRITE MILAWA::REV-UNDER-IFF))
 (338 16 (:REWRITE MILAWA::CONSP-OF-APP))
 (317 317
      (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
 (317 317
      (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
 (178 90
      (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
 (166 62
      (:REWRITE MILAWA::CAR-WHEN-NOT-CONSP))
 (159 159
      (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
 (134 48
      (:REWRITE MILAWA::SIMPLE-FLATTEN-WHEN-NOT-CONSP))
 (96 16
     (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS-TWO))
 (96 16
     (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS))
 (86 16 (:REWRITE MILAWA::CONSP-OF-DOMAIN))
 (79 79
     (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
 (79 79
     (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
 (79 79 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
 (64 16
     (:REWRITE MILAWA::SAME-LENGTH-PREFIXES-EQUAL-CHEAP))
 (62 62
     (:REWRITE MILAWA::CAR-WHEN-MEMBERP-OF-SINGLETON-LIST-CHEAP))
 (62 62
     (:REWRITE MILAWA::CAR-WHEN-MEMBERP-AND-NOT-MEMBERP-OF-CDR-CHEAP))
 (58 58 (:REWRITE MILAWA::TRUE-LISTP-OF-REV))
 (48 48
     (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP))
 (32 32
     (:REWRITE MILAWA::TRUE-LISTP-OF-SIMPLE-FLATTEN))
 (32 32 (:REWRITE MILAWA::TRICHOTOMY-OF-<))
 (32 32
     (:REWRITE MILAWA::TRANSITIVITY-OF-<-TWO))
 (32 32
     (:REWRITE MILAWA::TRANSITIVITY-OF-<-THREE))
 (32 32 (:REWRITE MILAWA::TRANSITIVITY-OF-<))
 (32 32
     (:REWRITE MILAWA::LESS-WHEN-ZP-LEFT-CHEAP))
 (30 30
     (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
 (30 30
     (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
 (22 22
     (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
 (22 22
     (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
 (22 22
     (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
 (22 22
     (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
 (22 22
     (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
 (16 16 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
 (16 16
     (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-TWO))
 (16 16
     (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-ONE))
 (16 16
     (:REWRITE MILAWA::FORCING-PREFIXP-WHEN-NOT-PREFIXP-BADGUY))
 (16 16
     (:REWRITE MILAWA::EQUAL-OF-BOOLEANS-REWRITE))
 (10 10
     (:REWRITE MILAWA::CDR-OF-CDR-WITH-LEN-FREE-PAST-THE-END))
 (10
   10
   (:REWRITE MILAWA::CDR-OF-CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END)))
(MILAWA::FAST-SIMPLE-FLATTEN-OF-RANGE$
     (81 22
         (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
     (71 20
         (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
     (69 9
         (:REWRITE MILAWA::MAPP-WHEN-NOT-CONSP))
     (62 22
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
     (25 1 (:REWRITE MILAWA::APP-WHEN-NOT-CONSP))
     (24 24
         (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
     (22 22
         (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
     (22 22
         (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
     (19 19 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
     (17 17
         (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
     (17 17
         (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
     (17 2
         (:REWRITE MILAWA::RANK-WHEN-NOT-CONSP))
     (16 1 (:REWRITE MILAWA::REV-WHEN-NOT-CONSP))
     (10 6 (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
     (10 1 (:REWRITE MILAWA::REV-UNDER-IFF))
     (8 8
        (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
     (8 8
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
     (8 8
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
     (8 8
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
     (8 8
        (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
     (6 6 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
     (6 6
        (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
     (4 1
        (:REWRITE MILAWA::RANK-WHEN-MEMBERP-WEAK))
     (4 1 (:REWRITE MILAWA::RANK-WHEN-MEMBERP))
     (4 1
        (:REWRITE MILAWA::APP-WHEN-NOT-CONSP-TWO))
     (2 2
        (:REWRITE MILAWA::MEMBERP-WHEN-MEMBERP-OF-CDR))
     (2 2
        (:REWRITE MILAWA::IN-SUPERSET-WHEN-IN-SUBSET-TWO))
     (2 2
        (:REWRITE MILAWA::IN-SUPERSET-WHEN-IN-SUBSET-ONE))
     (1 1 (:REWRITE MILAWA::TRUE-LISTP-OF-REV))
     (1 1 (:REWRITE MILAWA::CAR-WHEN-NOT-CONSP))
     (1 1
        (:REWRITE MILAWA::CAR-WHEN-MEMBERP-OF-SINGLETON-LIST-CHEAP))
     (1 1
        (:REWRITE MILAWA::CAR-WHEN-MEMBERP-AND-NOT-MEMBERP-OF-CDR-CHEAP))
     (1 1
        (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP)))
(MILAWA::FAST-SIMPLE-FLATTEN-OF-RANGE$-REMOVAL
 (1537 323
       (:REWRITE MILAWA::CONSP-WHEN-TRUE-LISTP-CHEAP))
 (622 48
      (:REWRITE MILAWA::APP-WHEN-NOT-CONSP-TWO))
 (576 58 (:REWRITE MILAWA::REV-UNDER-IFF))
 (517 47
      (:REWRITE MILAWA::REV-WHEN-NOT-CONSP))
 (508 16 (:REWRITE MILAWA::CONSP-OF-APP))
 (416 179
      (:REWRITE MILAWA::CONSP-WHEN-NATP-CHEAP))
 (323 323
      (:REWRITE MILAWA::CONSP-WHEN-NONEMPTY-SUBSET-CHEAP))
 (323 323
      (:REWRITE MILAWA::CONSP-WHEN-MEMBERP-CHEAP))
 (178 90
      (:REWRITE MILAWA::TRUE-LISTP-WHEN-NOT-CONSP))
 (165 61
      (:REWRITE MILAWA::CDR-WHEN-NOT-CONSP))
 (159 159
      (:REWRITE MILAWA::TRUE-LISTP-WHEN-TUPLEP))
 (128 48
      (:REWRITE MILAWA::SIMPLE-FLATTEN-WHEN-NOT-CONSP))
 (126 126
      (:REWRITE MILAWA::CONSP-OF-CDR-WITH-LEN-FREE))
 (126 126
      (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-3-CHEAP))
 (126 126
      (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-TUPLEP-2-CHEAP))
 (126 126
      (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-MEMBERP-NOT-CAR-CHEAP))
 (126 126
      (:REWRITE MILAWA::CONSP-OF-CDR-WHEN-LEN-TWO-CHEAP))
 (96 16
     (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS-TWO))
 (96 16
     (:REWRITE MILAWA::NOT-EQUAL-WHEN-LESS))
 (79 79
     (:REWRITE MILAWA::NATP-WHEN-ZP-CHEAP))
 (79 79
     (:REWRITE MILAWA::NATP-WHEN-NOT-ZP-CHEAP))
 (79 79 (:REWRITE MILAWA::NATP-OF-LEN-FREE))
 (64 16
     (:REWRITE MILAWA::SAME-LENGTH-PREFIXES-EQUAL-CHEAP))
 (61 61
     (:REWRITE MILAWA::CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END))
 (58 58 (:REWRITE MILAWA::TRUE-LISTP-OF-REV))
 (52 52 (:REWRITE MILAWA::TRUE-LISTP-OF-CDR))
 (48 48
     (:REWRITE MILAWA::APP-OF-SINGLETON-LIST-CHEAP))
 (32 32
     (:REWRITE MILAWA::TRUE-LISTP-OF-SIMPLE-FLATTEN))
 (32 32 (:REWRITE MILAWA::TRICHOTOMY-OF-<))
 (32 32
     (:REWRITE MILAWA::TRANSITIVITY-OF-<-TWO))
 (32 32
     (:REWRITE MILAWA::TRANSITIVITY-OF-<-THREE))
 (32 32 (:REWRITE MILAWA::TRANSITIVITY-OF-<))
 (32 32
     (:REWRITE MILAWA::LESS-WHEN-ZP-LEFT-CHEAP))
 (31 31
     (:REWRITE MILAWA::CAR-WHEN-NOT-CONSP))
 (31 31
     (:REWRITE MILAWA::CAR-WHEN-MEMBERP-OF-SINGLETON-LIST-CHEAP))
 (31 31
     (:REWRITE MILAWA::CAR-WHEN-MEMBERP-AND-NOT-MEMBERP-OF-CDR-CHEAP))
 (16 16
     (:REWRITE MILAWA::TRUE-LISTP-OF-RANGE))
 (16 16
     (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-TWO))
 (16 16
     (:REWRITE MILAWA::PREFIXP-WHEN-NOT-CONSP-ONE))
 (16 16
     (:REWRITE MILAWA::FORCING-PREFIXP-WHEN-NOT-PREFIXP-BADGUY))
 (16 16
     (:REWRITE MILAWA::EQUAL-OF-BOOLEANS-REWRITE))
 (10 10
     (:REWRITE MILAWA::CDR-OF-CDR-WITH-LEN-FREE-PAST-THE-END))
 (10
   10
   (:REWRITE MILAWA::CDR-OF-CDR-WHEN-TRUE-LISTP-WITH-LEN-FREE-PAST-THE-END)))