from dataclasses import dataclass

from asyncua import ua
from asyncua.client.client import Client
from asyncua.common.node import Node


@dataclass(frozen=True)
class NodeRef[T]:
    node: Node
    node_type: type[T]


@dataclass
class NodeBuilder:
    client: Client
    prefix: str
    idx: int

    def create_node_ref(self, suffix: str, node_type: type):
        node = self.client.get_node(
            ua.NodeId(
                Identifier=ua.String(f"{self.prefix}{suffix}"),
                NamespaceIndex=ua.Int16(self.idx),
            )
        )
        return NodeRef(node=node, node_type=node_type)

    def extend(self, midfix: str):
        return NodeBuilder(
            client=self.client, prefix=self.prefix + midfix, idx=self.idx
        )
