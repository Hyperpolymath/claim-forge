;; claim-forge - Guix Package Definition
;; SPDX-License-Identifier: AGPL-3.0-or-later
;;
;; Run: guix shell -D -f guix.scm
;; Build: guix build -f guix.scm

(use-modules (guix packages)
             (guix gexp)
             (guix git-download)
             (guix build-system gnu)
             ((guix licenses) #:prefix license:)
             (gnu packages base)
             (gnu packages adns)
             (gnu packages gnat))

(define-public claim-forge
  (package
    (name "claim-forge")
    (version "1.0.0")
    (source (local-file "." "claim-forge-checkout"
                        #:recursive? #t
                        #:select? (git-predicate ".")))
    (build-system gnu-build-system)
    (native-inputs
     (list gnat gprbuild))
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)  ; No configure script
          (replace 'build
            (lambda _
              (invoke "make" "release")))
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (invoke "make" "verify"))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (invoke "make" "install"
                        (string-append "PREFIX=" out))))))))
    (synopsis "IP registration and blockchain timestamping system")
    (description
     "Claim Forge is an IP registration and timestamping system written in Ada
that creates legally defensible intellectual property claims.  It integrates
Git, GPG signing, and blockchain timestamping (OpenTimestamps/Bitcoin) to
establish provenance and ownership of creative works.")
    (home-page "https://github.com/hyperpolymath/claim-forge")
    (license license:agpl3+)))

;; Return package for guix shell
claim-forge
