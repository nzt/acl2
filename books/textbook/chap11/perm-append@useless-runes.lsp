(IN-APPEND (54 45 (:REWRITE DEFAULT-CAR))
           (48 24
               (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
           (37 31 (:REWRITE DEFAULT-CDR))
           (24 24 (:TYPE-PRESCRIPTION TRUE-LISTP))
           (24 24 (:TYPE-PRESCRIPTION BINARY-APPEND)))
(DEL-APPEND (602 301
                 (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
            (301 301 (:TYPE-PRESCRIPTION TRUE-LISTP))
            (301 301 (:TYPE-PRESCRIPTION BINARY-APPEND))
            (87 72 (:REWRITE DEFAULT-CAR))
            (63 54 (:REWRITE DEFAULT-CDR)))
(PERM-IMPLIES-PERM-APPEND-1 (74 68 (:REWRITE DEFAULT-CAR))
                            (59 56 (:REWRITE DEFAULT-CDR))
                            (32 16
                                (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
                            (16 16 (:TYPE-PRESCRIPTION TRUE-LISTP))
                            (16 16 (:TYPE-PRESCRIPTION BINARY-APPEND)))
(PERM-IMPLIES-PERM-APPEND-2 (79 67 (:REWRITE DEFAULT-CAR))
                            (63 3 (:REWRITE DEL-APPEND))
                            (60 54 (:REWRITE DEFAULT-CDR))
                            (42 21
                                (:TYPE-PRESCRIPTION TRUE-LISTP-APPEND))
                            (24 3 (:REWRITE IN-APPEND))
                            (21 21 (:TYPE-PRESCRIPTION TRUE-LISTP))
                            (21 21 (:TYPE-PRESCRIPTION BINARY-APPEND))
                            (16 16 (:TYPE-PRESCRIPTION IN)))