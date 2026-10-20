from dataclasses import dataclass

from asyncua import ua
from asyncua.client.client import Client
from asyncua.common.node import Node


def get_variant_type(node_type: type):
    if node_type == float:
        return ua.VariantType.Float
    return ua.VariantType.Boolean


@dataclass(frozen=True)
class NodeRef[T]:
    node: Node
    node_type: type[T]

    async def get(self) -> T:
        return await self.node.get_value()

    async def set(self, value: T):
        await self.node.write_value(
            ua.DataValue(Value=ua.Variant(value, get_variant_type(self.node_type)))
        )


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
