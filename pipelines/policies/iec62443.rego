package main

deny contains msg if {
  input.kind == "NetworkPolicy"
  not input.metadata.annotations["iec62443.sr"]
  msg := sprintf("NetworkPolicy %v missing IEC 62443 annotation", [input.metadata.name])
}

deny contains msg if {
  input.kind == "Namespace"
  not input.metadata.labels["security-level"]
  msg := sprintf("Namespace %v missing security-level label", [input.metadata.name])
}
