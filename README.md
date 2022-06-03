# Apply basic openshift hardening policies using ACM

- Overview of ACM
    - Import at least two cluster 
      - Cluster01 labels:
        - env=dev and location=usa
      - Cluster02 labels ( Running on SNO on my laptop and connecting to the HUB via VPN )
        - env=prod and location=netherlands

    - Applying the policies ( list of policies available )
        - openshift-hardening-checkfips.yaml
        - openshift-hardening-certs.yaml
        - openshift-hardening-compliance-operator-cis-scan.yaml
        - openshift-hardening-compliance-operator-install.yaml
        - openshift-hardening-config-audit.yaml
        - openshift-hardening-etcdencryption.yaml
        - openshift-hardening-file-integrity-node-status.yaml
        - openshift-hardening-file-integrity-operator.yaml
        - openshift-hardening-image-policy.yaml
        - openshift-hardening-remove-kubeadmin.yaml
        - openshift-hardening-scc-restricted.yaml
        - policy-netpol.yaml ( namespaces simpsons, bouvier and flanders )

```
oc apply -k policies
```

# Preparing the workloads

First, use the image to use the openshift-image-registry, it will be useful when demo in a airgap env.

## Kustomize

```
oc get deployments -n openshift-image-registry image-registry --template '{{ range $x := .spec.template.spec.containers  }} {{- $x.image -}} {{ end }}'
```

Edit the file workloads/kustmization.yaml and change the image accordingly. 