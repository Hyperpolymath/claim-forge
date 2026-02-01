;; SPDX-License-Identifier: MPL-2.0-or-later
;; META.scm - Meta-level information for claim-forge
;; Media-Type: application/meta+scheme

(meta
  (architecture-decisions
    ((id "adr-001")
     (status "accepted")
     (date "2025-11-22")
     (title "Use Ada 2012 for type-safe implementation")
     (context "IP claims require legally defensible, reliable software")
     (decision "Implement in Ada 2012 for compile-time type safety and memory safety")
     (consequences
       ("Strong type checking prevents runtime errors"
        "No garbage collector simplifies deployment"
        "Bounded strings prevent buffer overflows"
        "Smaller developer pool but higher reliability")))
    ((id "adr-002")
     (status "accepted")
     (date "2025-11-22")
     (title "Triple-layer verification strategy")
     (context "IP claims need multiple independent verification methods")
     (decision "Use GPG signing, OpenTimestamps, and Git signatures together")
     (consequences
       ("Three independent proof mechanisms"
        "Requires GPG key infrastructure"
        "Depends on Bitcoin blockchain for timestamps"
        "Git history provides version provenance")))
    ((id "adr-003")
     (status "accepted")
     (date "2025-11-22")
     (title "7-step workflow architecture")
     (context "Claim registration involves multiple discrete steps")
     (decision "Implement as explicit 7-step orchestrated workflow")
     (consequences
       ("Clear step-by-step execution"
        "Easy to debug and monitor"
        "Can resume from failure point"
        "Verbose but transparent")))
    ((id "adr-004")
     (status "accepted")
     (date "2025-11-22")
     (title "Dual CLI and interactive modes")
     (context "Users have different preferences for automation vs guidance")
     (decision "Support both command-line arguments and interactive prompts")
     (consequences
       ("Scriptable for automation"
        "User-friendly for manual use"
        "More code to maintain"
        "Consistent behavior across modes"))))

  (development-practices
    (code-style
      ((indentation . "3 spaces (Ada convention)")
       (naming . "Ada_Case for identifiers")
       (comments . "Use -- for documentation")
       (type-safety . "Strong typing, avoid conversions")))
    (security
      (principle "Defense in depth")
      (practices
        ("GPG key verification before signing"
         "Validate all external inputs"
         "No dynamic memory allocation"
         "Bounded strings for all text"
         "Signed Git commits required")))
    (testing
      ((integration . "docs/examples/test-workflow.sh")
       (unit . "Planned: AUnit framework")
       (formal . "Planned: SPARK proofs for crypto modules")))
    (versioning "SemVer")
    (documentation "AsciiDoc")
    (branching "main for stable"))

  (design-rationale
    ((why-ada
      "Ada provides compile-time guarantees for type safety and memory safety,
       essential for software that creates legally defensible claims. Unlike
       dynamic languages, Ada catches errors before deployment.")
     (why-opentimestamps
      "OpenTimestamps anchors to Bitcoin blockchain, providing decentralized,
       censorship-resistant timestamp proofs without relying on a single
       trusted authority.")
     (why-gpg
      "GPG is the de facto standard for cryptographic signing with wide
       adoption, established key infrastructure, and legal precedent for
       signature validity.")
     (why-git
      "Git provides immutable history, distributed replication, and built-in
       cryptographic verification through signed commits and tags."))))
