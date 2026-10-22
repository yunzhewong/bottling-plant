from dataclasses import dataclass
from typing import Any

from asyncua import ua
from asyncua.client.client import Client
from asyncua.common.node import Node


def get_variant_type(node_type: type):
    if node_type == float:
        return ua.VariantType.Float
    return ua.VariantType.Boolean


@dataclass
class CachedOPCUA[T]:
    node: Node
    last_read: Any
    last_write: Any
    has_write: bool
    node_type: type[T]

    def set(self, value: T):
        self.last_read = value
        self.last_write = ua.DataValue(
            Value=ua.Variant(value, get_variant_type(self.node_type))
        )
        self.has_write = True

    def get(self) -> T:
        return self.last_read


@dataclass
class NodeBuilder:
    client: Client
    prefix: str
    idx: int

    def create_opcua_cache(self, suffix: str, node_type: type):
        node = self.client.get_node(
            ua.NodeId(
                Identifier=ua.String(f"{self.prefix}{suffix}"),
                NamespaceIndex=ua.Int16(self.idx),
            )
        )
        return CachedOPCUA(
            node=node,
            node_type=node_type,
            last_read=None,
            last_write=None,
            has_write=False,
        )

    def extend(self, midfix: str):
        return NodeBuilder(
            client=self.client, prefix=self.prefix + midfix, idx=self.idx
        )


class OPCUALookupBranch:
    def __init__(self):
        self._lookup: dict[int, CachedOPCUA] = {}

    def _list_objects(self):
        return [getattr(self, attr) for attr in dir(self) if not attr.startswith("_")]

    def get_caches(self) -> list[CachedOPCUA]:
        caches: list[CachedOPCUA] = []
        for obj in self._list_objects():
            if isinstance(obj, CachedOPCUA):
                caches.append(obj)
            if isinstance(obj, OPCUALookupBranch):
                caches += obj.get_caches()
        return caches

    def scan(self):
        for obj in self._list_objects():
            if isinstance(obj, OPCUALookupBranch):
                obj.scan()


class Caches:
    def __init__(self, as_list: list[CachedOPCUA]):
        self.items = as_list

    async def read(self, client: Client):
        nodes = [item.node for item in self.items]
        values = await client.read_values(nodes)
        for i in range(len(values)):
            self.items[i].last_read = values[i]

    async def write(self, client: Client):
        nodes: list[Node] = []
        values: list[Any] = []

        for item in self.items:
            if item.has_write:
                nodes.append(item.node)
                values.append(item.last_write)

        await client.write_values(nodes, values)
