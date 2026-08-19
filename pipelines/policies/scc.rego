package main

deny contains msg if {
  input.kind == "SecurityContextConstraints"
  input.allowPrivilegedContainer == true
  msg := sprintf("SCC %v must not allow privileged containers", [input.metadata.name])
}

deny contains msg if {
  input.kind == "SecurityContextConstraints"
  input.allowHostNetwork == true
  msg := sprintf("SCC %v must not allow host network", [input.metadata.name])
}

deny contains msg if {
  input.kind == "SecurityContextConstraints"
  not input.metadata.annotations["iec62443.rationale"]
  msg := sprintf("SCC %v missing iec62443.rationale annotation", [input.metadata.name])
}

deny contains msg if {
  input.kind == "ClusterRole"
  some rule in input.rules
  "securitycontextconstraints" in rule.resources
  not input.metadata.annotations["iec62443.rationale"]
  msg := sprintf("ClusterRole %v grants SCC access without documented rationale", [input.metadata.name])
}
