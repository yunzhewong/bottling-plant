from collections.abc import Callable
from dataclasses import dataclass
from typing import Any

from asyncua import ua
from asyncua.client.client import Client
from asyncua.common.node import Node


def get_variant_type(node_type: type):
    if node_type == int:
        return ua.VariantType.Int32
    if node_type == float:
        return ua.VariantType.Float
    return ua.VariantType.Boolean


@dataclass
class Value[T]:
    node: Node
    last_read: Any
    last_write: Any
    has_write: bool
    node_type: type[T]

    def set(self, value: T):
        self.last_write = ua.DataValue(
            Value=ua.Variant(value, get_variant_type(self.node_type))
        )
        self.has_write = True

    def get(self) -> T:
        return self.last_read


@dataclass
class Builder:
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
        return Value(
            node=node,
            node_type=node_type,
            last_read=None,
            last_write=None,
            has_write=False,
        )

    def extend(self, midfix: str):
        return Builder(client=self.client, prefix=self.prefix + midfix, idx=self.idx)


class LookupBranch:
    def __init__(self):
        self._lookup: dict[int, Value] = {}

    def _list_objects(self):
        return [getattr(self, attr) for attr in dir(self) if not attr.startswith("_")]

    def get_caches(self) -> list[Value]:
        caches: list[Value] = []
        for obj in self._list_objects():
            if isinstance(obj, Value):
                caches.append(obj)
            if isinstance(obj, LookupBranch):
                caches += obj.get_caches()
        return caches

    def _branch_recurse(self, fn: Callable[[LookupBranch], Any]):
        for obj in self._list_objects():
            if isinstance(obj, LookupBranch):
                fn(obj)

    def initialise(self):
        return self._branch_recurse(lambda lb: lb.initialise())

    def scan(self):
        return self._branch_recurse(lambda lb: lb.scan())


class ScanVariables:
    def __init__(self, values: list[Value]):
        self.values = values

    async def read(self, client: Client):
        nodes = [item.node for item in self.values]
        read_values = await client.read_values(nodes)
        for i in range(len(read_values)):
            self.values[i].last_read = read_values[i]

    async def write(self, client: Client):
        nodes: list[Node] = []
        write_values: list[Any] = []

        for item in self.values:
            if item.has_write:
                nodes.append(item.node)
                write_values.append(item.last_write)

        await client.write_values(nodes, write_values)
