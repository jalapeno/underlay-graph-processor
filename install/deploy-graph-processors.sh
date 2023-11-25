#!/bin/bash
BASEDIR=$(dirname $0)
KUBE=$1
if [ -z "$1" ]
  then
    KUBE=kubectl
fi

echo "Creating ls_node_extended"
${KUBE} create -f ${PWD}/${BASEDIR}/linkstate-node-ext.yaml

sleep 5

echo "Creating ls_topology_v4"
${KUBE} create -f ${PWD}/${BASEDIR}/linkstate-edge-v4.yaml

echo "Creating ls_topology_v6"
${KUBE} create -f ${PWD}/${BASEDIR}/linkstate-edge-v6.yaml

echo "Creating inet prefix and node collections"
${KUBE} create -f ${PWD}/${BASEDIR}/ebgp-processor.yaml

sleep 10

echo "Creating ipv4_topology"
${KUBE} create -f ${PWD}/${BASEDIR}/ipv4-topology.yaml

sleep 10

echo "Creating ipv6_topology"
${KUBE} create -f ${PWD}/${BASEDIR}/ipv6-topology.yaml