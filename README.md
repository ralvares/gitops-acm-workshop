# Network/Node Segmentation using ACM

    - Overview of ACM
    - Deploy Disconnected Cluster using Assited Installer
    - Demonstrate Network Policies and RBAC by deploying a tier 3 application
        - 3 Control-Planes
        - 1 Infra Node for Ingress - 80 and 443
        - 1 Worker to Run Boiuvier Workloads
        - 1 Worker to run Simpson Workloads
    


## Kustomize 
,,,
oc get deployments -n openshift-image-registry image-registry --template '{{ range $x := .spec.template.spec.containers  }} {{- $x.image -}} {{ end }}'
,,,
