;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — claim-forge

(ecosystem
  (version "1.0.0")
  (name "claim-forge")
  (type "project")
  (purpose "*IP Registration & Blockchain Timestamping System*")

  (position-in-ecosystem
    "Part of hyperpolymath ecosystem. Follows RSR guidelines.")

  (related-projects
    (project (name "rhodium-standard-repositories")
             (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
             (relationship "standard")))

  (what-this-is "*IP Registration & Blockchain Timestamping System*")
  (what-this-is-not "- NOT exempt from RSR compliance"))
