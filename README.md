# OCP Lab GitOps -- IEC 62443 OT/IT Platform

GitOps repository for OpenShift 4.22.8 OT/IT lab cluster.

## Zone architecture
- zone-ot  -- ISA-99 Level 1-2 -- OT Control Zone (SL2)
- zone-dmz -- ISA-99 Level 3   -- Industrial DMZ  (SL2)
- zone-it  -- ISA-99 Level 4   -- Enterprise Zone  (SL1)

## Workflow
1. Create branch -- modify YAML -- open PR
2. Tekton validates: yaml-lint + kustomize-build + conftest IEC 62443
3. PR approved + merged -- ArgoCD syncs cluster automatically
# Test webhook Tue Aug 18 11:51:02 CEST 2026
# Branch protection validée le Wed Aug 19 08:26:42 CEST 2026
