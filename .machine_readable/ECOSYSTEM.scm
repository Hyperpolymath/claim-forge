;; SPDX-License-Identifier: AGPL-3.0-or-later
;; ECOSYSTEM.scm - Ecosystem position for claim-forge
;; Media-Type: application/vnd.ecosystem+scm

(ecosystem
  (version "1.0")
  (name "claim-forge")
  (type "utility")
  (purpose "IP registration and blockchain timestamping")

  (position-in-ecosystem
    (category "intellectual-property")
    (subcategory "provenance-tools")
    (unique-value
      ("Type-safe Ada implementation for legal reliability"
       "Triple-layer verification: GPG + OpenTimestamps + Git"
       "Multi-platform publishing to GitLab and GitHub"
       "RSR Silver compliant repository structure")))

  (related-projects
    ((name "opentimestamps")
     (relationship "dependency")
     (description "Bitcoin blockchain timestamping protocol")
     (integration "CLI client for timestamp creation and verification"))
    ((name "gnupg")
     (relationship "dependency")
     (description "Cryptographic signing infrastructure")
     (integration "GPG signatures for claim files and Git commits"))
    ((name "git")
     (relationship "dependency")
     (description "Version control with cryptographic verification")
     (integration "Signed commits and tags for provenance chain"))
    ((name "januskey")
     (relationship "sibling-standard")
     (description "Key management and identity verification")
     (integration "Potential GPG key lifecycle management"))
    ((name "palimpsest-licence")
     (relationship "sibling-standard")
     (description "Attribution-preserving copyleft license")
     (integration "Dual licensing option for claim-forge users"))
    ((name "rhodium-standard-repositories")
     (relationship "governance")
     (description "Repository quality standards framework")
     (integration "RSR Silver compliance for project structure")))

  (what-this-is
    ("A CLI tool for creating legally defensible IP claims"
     "A type-safe Ada application with strong compile-time guarantees"
     "A triple-verification system combining cryptography and blockchain"
     "A multi-platform publisher for GitLab and GitHub"
     "An RSR-compliant open source project"
     "A building block for IP management workflows"))

  (what-this-is-not
    ("Not a patent filing system"
     "Not a copyright registration service"
     "Not a legal advice platform"
     "Not a replacement for formal IP registration"
     "Not a smart contract platform"
     "Not a general-purpose blockchain application")))
