;; SPDX-License-Identifier: MPL-2.0-or-later
;; STATE.scm - Project state for claim-forge
;; Media-Type: application/vnd.state+scm

(state
  (metadata
    (version "1.0.0")
    (schema-version "1.0")
    (created "2025-11-22")
    (updated "2026-01-04")
    (project "claim-forge")
    (repo "github.com/hyperpolymath/claim-forge"))

  (project-context
    (name "claim-forge")
    (tagline "IP Registration & Blockchain Timestamping System")
    (tech-stack
      ("Ada 2012" "GNAT" "GPG" "OpenTimestamps" "Git" "SaltStack")))

  (current-position
    (phase "stable-release")
    (overall-completion 85)
    (components
      ((name "claim-generator")
       (status "complete")
       (completion 100)
       (description "Structured CLAIM.md file generation with metadata"))
      ((name "gpg-integration")
       (status "complete")
       (completion 100)
       (description "GPG signature creation for claim files"))
      ((name "opentimestamps")
       (status "complete")
       (completion 100)
       (description "Bitcoin blockchain timestamping via OpenTimestamps"))
      ((name "git-ops")
       (status "complete")
       (completion 100)
       (description "Signed commits, tags, and repository management"))
      ((name "publisher")
       (status "complete")
       (completion 100)
       (description "Multi-platform push to GitLab and GitHub"))
      ((name "cli")
       (status "complete")
       (completion 100)
       (description "Command-line argument parsing and help"))
      ((name "interactive-mode")
       (status "complete")
       (completion 100)
       (description "Interactive prompts for claim creation"))
      ((name "config")
       (status "complete")
       (completion 100)
       (description "TOML configuration file support"))
      ((name "workflow")
       (status "complete")
       (completion 100)
       (description "7-step workflow orchestration")))
    (working-features
      ("Cryptographic GPG signing"
       "Blockchain timestamping via OpenTimestamps"
       "Automated CLAIM.md generation"
       "Interactive and CLI modes"
       "Multi-platform publishing (GitLab/GitHub)"
       "Signed Git commits and tags"
       "TOML configuration support"
       "Container build support"
       "SaltStack deployment automation"
       "Monitoring script for health checks")))

  (route-to-mvp
    (milestones
      ((id "v1.0.0")
       (name "Initial Stable Release")
       (status "completed")
       (date "2025-11-22")
       (items
         ("Core claim generation"
          "GPG signing integration"
          "OpenTimestamps integration"
          "Git operations"
          "Multi-platform publishing"
          "Interactive mode"
          "CLI mode"
          "Container support"
          "SaltStack deployment")))
      ((id "v1.1.0")
       (name "RSR Silver Compliance")
       (status "completed")
       (date "2025-11-22")
       (items
         ("SECURITY.md"
          ".well-known/ directory"
          "CODE_OF_CONDUCT.md"
          "TPCF documentation"
          "justfile automation"
          "RSR self-check script")))
      ((id "v1.2.0")
       (name "Enhanced Verification")
       (status "planned")
       (items
         ("Batch claim processing"
          "Verification report generation"
          "Multi-key GPG support"
          "Enhanced timestamp verification")))))

  (blockers-and-issues
    (critical)
    (high
      ((id "unit-tests")
       (description "Add Ada unit testing framework (AUnit)")
       (impact "Testing coverage limited to integration tests")))
    (medium
      ((id "nix-flake")
       (description "Add Nix flake for reproducible builds")
       (impact "Reproducibility depends on system GNAT version"))
      ((id "spark-proofs")
       (description "Add SPARK formal verification for crypto modules")
       (impact "No formal proof of security-critical code")))
    (low
      ((id "gui-mode")
       (description "Add optional GUI mode (GTK/Qt)")
       (impact "CLI-only may limit adoption"))))

  (critical-next-actions
    (immediate
      ("Maintain RSR Silver compliance"
       "Monitor OpenTimestamps service availability"))
    (this-week
      ("Review security advisories for dependencies"
       "Update SHA-pinned GitHub Actions if needed"))
    (this-month
      ("Consider AUnit test framework integration"
       "Evaluate SPARK subset for gpg/opentimestamps modules")))

  (session-history
    ((date "2025-11-22")
     (type "reconstruction")
     (accomplishments
       ("Reconstructed from deployment guide"
        "Created full Ada implementation"
        "Added RSR compliance files"
        "Achieved Silver Level (85%)")))
    ((date "2026-01-04")
     (type "metadata-update")
     (accomplishments
       ("Populated SCM files with comprehensive metadata"
        "Updated STATE.scm with component details"
        "Updated META.scm with architecture decisions"
        "Updated ECOSYSTEM.scm with project relationships")))))
