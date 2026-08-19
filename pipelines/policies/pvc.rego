package main

deny contains msg if {
  input.kind == "PersistentVolumeClaim"
  not input.metadata.labels["iec62443.zone"]
  msg := sprintf("PVC %v missing iec62443.zone label", [input.metadata.name])
}

deny contains msg if {
  input.kind == "PersistentVolumeClaim"
  input.metadata.labels["iec62443.zone"] == "zone-ot"
  input.spec.storageClassName != "local-path-retain"
  msg := sprintf("PVC %v in zone-ot must use local-path-retain", [input.metadata.name])
}
