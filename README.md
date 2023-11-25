# underlay-graph-processor

A series of processors which mine Jalapeno's ArangoDB for link state or IPv4/IPv6 prefixes, links, and nodes. The processors then correlate the data and create graph/edge collections in the DB.

### Linkstate-node-extended

Linkstate-node-extended is a collection of link-state nodes where ISIS-level-1-2 node entries have been de-duplicated, and relevant segment routing and SRv6 SID data have been added to the ls_node_extended entries.

### Linkstate-edge-v4 and Linkstate-edge-v6

A pair of processors which create IPv4 and IPv6 graphs of the entire link-state topology (currently ISIS is supported). The processors create their graphs by correlating ls_link, ls_prefix, ls_srv6_sid and ls_node_extended data.

### eBGP-processor

Mines the Peer and Unicast-Prefix collections and filters out iBGP nodes and prefixes to create new document collections made up of Internet peers and prefixes. Also works for eBGP-based data center topologies or for linking multi-domain topologies (work in progress)

