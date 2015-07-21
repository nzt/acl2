;; Proof of the uniqueness of Fourier sums.

;; Cuong Chau                             March, 2015

;; === OVERVIEW ===

;; The uniqueness of Fourier sums:
;; Let
;; f(x,n,L) = a_0 + sum{i = 1..n}[a_i*cos(i*pi/L*x) + b_i*sin(i*pi/L*x)]
;; and
;; g(x,n,L) = r_0 + sum{i = 1..n}[r_i*cos(i*pi/L*x) + s_i*sin(i*pi/L*x)]

;; Then f(x,n,L) = g(x,n,L) <=> (a_0 = r_0) ^ (a_i = r_i) ^ (b_i = s_i) for all
;; positive integer i <= n.

;; ================

(in-package "ACL2")

(include-book "fourier-coefficients")
(include-book "fourier-coefficients-2")

;; ======================================================================

(defun-sk uniqueness-of-fourier-sums-necc-cond (n)
  (forall i
          (implies (and (posp i)
                        (<= i n))
                   (and (equal (a i) (r i))
                        (equal (b i) (s i)))))
  :rewrite :direct)

(in-theory (disable uniqueness-of-fourier-sums-necc-cond))

(encapsulate
 ()

 (local
  (defthmd uniqueness-of-fourier-sums-necc-lemma
    (implies (and (equal (a 0) (r 0))
                  (<= i n)
                  (uniqueness-of-fourier-sums-necc-cond n))
             (equal (fourier-sum x i c)
                    (fourier-sum-2 x i c)))
    :hints (("Goal" :in-theory (enable fourier-sum
                                       fourier-sum-2)))))

 (defthm uniqueness-of-fourier-sums-necc
   (implies (and (equal (a 0) (r 0))
                 (uniqueness-of-fourier-sums-necc-cond i))
            (equal (fourier-sum x i c)
                   (fourier-sum-2 x i c)))
   :hints (("Goal" :use (:instance uniqueness-of-fourier-sums-necc-lemma
                                   (n i))))))

(defun-sk uniqueness-of-fourier-sums-suff-cond (i c)
  (forall x
          (equal (fourier-sum x i c)
                 (fourier-sum-2 x i c)))
  :rewrite :direct)

(in-theory (disable uniqueness-of-fourier-sums-suff-cond))

(local
 (defthm lemma-1
   (implies (equal (fourier-sum x i c)
                   (fourier-sum-2 x i c))
            (and (equal (fourier-sum-*-fixed-cos x i k c)
                        (fourier-sum-2-*-fixed-cos x i k c))
                 (equal (fourier-sum-*-fixed-sin x i k c)
                        (fourier-sum-2-*-fixed-sin x i k c))))
   :hints (("Goal" :in-theory (enable fourier-sum-*-fixed-cos
                                      fourier-sum-2-*-fixed-cos
                                      fourier-sum-*-fixed-sin
                                      fourier-sum-2-*-fixed-sin)))))

(local
 (defthm lemma-2
   (implies (uniqueness-of-fourier-sums-suff-cond i c)
            (and (equal (map-fourier-sum-*-fixed-cos p i k c)
                        (map-fourier-sum-2-*-fixed-cos p i k c))
                 (equal (map-fourier-sum-*-fixed-sin p i k c)
                        (map-fourier-sum-2-*-fixed-sin p i k c))))))

(local
 (defthm-std lemma-3
   (implies (uniqueness-of-fourier-sums-suff-cond i c)
            (and (equal (int-fourier-sum-*-fixed-cos a b i k c)
                        (int-fourier-sum-2-*-fixed-cos a b i k c))
                 (equal (int-fourier-sum-*-fixed-sin a b i k c)
                        (int-fourier-sum-2-*-fixed-sin a b i k c))))
   :hints (("Goal" :in-theory (enable riemann-fourier-sum-*-fixed-cos
                                      int-fourier-sum-*-fixed-cos
                                      riemann-fourier-sum-2-*-fixed-cos
                                      int-fourier-sum-2-*-fixed-cos
                                      riemann-fourier-sum-*-fixed-sin
                                      int-fourier-sum-*-fixed-sin
                                      riemann-fourier-sum-2-*-fixed-sin
                                      int-fourier-sum-2-*-fixed-sin)))))

(defthm uniqueness-of-fourier-sums-suff
  (implies (and (uniqueness-of-fourier-sums-suff-cond i (/ (acl2-pi) L))
                (natp i)
                (posp k)
                (<= k i)
                (realp L)
                (not (equal L 0)))
           (and (equal (a 0) (r 0))
                (equal (a k) (r k))
                (equal (b k) (s k))))
  :hints (("Goal"
           :in-theory (disable int-fourier-sum-*-fixed-cos-thm-2
                               int-fourier-sum-2-*-fixed-cos-thm-2
                               int-fourier-sum-*-fixed-sin-thm-2
                               int-fourier-sum-2-*-fixed-sin-thm-2
                               int-fourier-sum-*-fixed-cos-thm-3
                               int-fourier-sum-2-*-fixed-cos-thm-3
                               int-fourier-sum-*-fixed-sin-thm-3
                               int-fourier-sum-2-*-fixed-sin-thm-3)
           :use ((:instance int-fourier-sum-*-fixed-cos-thm-2)
                 (:instance int-fourier-sum-2-*-fixed-cos-thm-2)
                 (:instance int-fourier-sum-*-fixed-sin-thm-2)
                 (:instance int-fourier-sum-2-*-fixed-sin-thm-2)
                 (:instance int-fourier-sum-*-fixed-cos-thm-3)
                 (:instance int-fourier-sum-2-*-fixed-cos-thm-3)
                 (:instance int-fourier-sum-*-fixed-sin-thm-3)
                 (:instance int-fourier-sum-2-*-fixed-sin-thm-3)))))


