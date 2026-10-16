import asyncio
from asyncua import Client, ua

URL = "opc.tcp://127.0.0.1:4840/openplc/opcua"
NS_URI = "urn:openplc:opcua:namespace"

async def main():
    async with Client(URL) as client:
        idx = await client.get_namespace_index(NS_URI)

        in_node  = client.get_node(ua.NodeId("PLC.main.In",  idx))   # string node ID
        out_node = client.get_node(ua.NodeId("PLC.main.Out", idx))

        print("In: ", await in_node.read_value())
        print("Out:", await out_node.read_value())

        # Write a BOOL (specify the type explicitly)
        await in_node.write_value(ua.DataValue(ua.Variant(True, ua.VariantType.Boolean)))

asyncio.run(main())