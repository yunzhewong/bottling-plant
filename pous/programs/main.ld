PROGRAM main
  VAR
    Process : FB_1_Process;
  END_VAR
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR

{
  "name": "main",
  "rungs": [
    {
      "id": "rung_main_8335eb45-697a-44e1-8a30-26bf1dd719e0",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        580,
        134
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_8335eb45-697a-44e1-8a30-26bf1dd719e0",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "2675838",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false
          },
          "width": 3,
          "height": 40,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "selected": false,
          "dragging": false
        },
        {
          "id": "BLOCK_c905aa87-b172-405c-a716-b9724413937c",
          "type": "block",
          "position": {
            "x": 143,
            "y": 14
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 143,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 317,
                  "y": 50
                },
                "relPosition": {
                  "x": 174,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 317,
                  "y": 90
                },
                "relPosition": {
                  "x": 174,
                  "y": 76
                },
                "id": "BufferLevel",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 143,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 317,
                  "y": 50
                },
                "relPosition": {
                  "x": 174,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 317,
                  "y": 90
                },
                "relPosition": {
                  "x": 174,
                  "y": 76
                },
                "id": "BufferLevel",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 143,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "EN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 317,
                "y": 50
              },
              "relPosition": {
                "x": 174,
                "y": 36
              },
              "id": "ENO",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "2300947",
            "variant": {
              "name": "FB_1_Process",
              "documentation": "",
              "type": "function-block",
              "variables": [
                {
                  "name": "EN",
                  "class": "input",
                  "type": {
                    "definition": "generic-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ENO",
                  "class": "output",
                  "type": {
                    "definition": "generic-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "MixingTank",
                  "class": "local",
                  "type": {
                    "value": "FB_11_MIXINGTANK",
                    "definition": "derived"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false,
                  "initialValue": ""
                },
                {
                  "name": "TransferPump",
                  "class": "local",
                  "type": {
                    "value": "FB_12_TRANSFERPUMP",
                    "definition": "derived"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false,
                  "initialValue": ""
                },
                {
                  "name": "BufferLevel",
                  "class": "output",
                  "type": {
                    "value": "REAL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false,
                  "initialValue": ""
                }
              ]
            },
            "variable": {
              "id": "357ef9c7-096e-47f4-b7e6-d3981bcd6356",
              "name": "Process",
              "type": {
                "definition": "derived",
                "value": "FB_1_Process"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": true,
            "connectedVariables": [],
            "draggable": true,
            "selectable": true,
            "deletable": true
          },
          "width": 174,
          "height": 100,
          "measured": {
            "width": 174,
            "height": 100
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "right-rail-rung_main_8335eb45-697a-44e1-8a30-26bf1dd719e0",
          "type": "powerRail",
          "position": {
            "x": 577,
            "y": 30
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 577
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "2003881",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false
          },
          "width": 3,
          "height": 40,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "selected": false,
          "dragging": false
        },
        {
          "id": "VARIABLE_67177e0d-9700-4b77-99c8-d9ced6acf7d8",
          "type": "variable",
          "position": {
            "x": 347,
            "y": 74
          },
          "width": 80,
          "height": 32,
          "measured": {
            "width": 80,
            "height": 32
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 347,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 347,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 347,
                "y": 90
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "2155062",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_c905aa87-b172-405c-a716-b9724413937c",
              "handleId": "BufferLevel",
              "variableType": {
                "name": "BufferLevel",
                "class": "output",
                "type": {
                  "value": "REAL",
                  "definition": "base-type"
                },
                "location": "",
                "documentation": "",
                "debug": false,
                "initialValue": ""
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          },
          "deletable": false,
          "selectable": true,
          "draggable": false,
          "selected": false,
          "dragging": false
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_8335eb45-697a-44e1-8a30-26bf1dd719e0_BLOCK_c905aa87-b172-405c-a716-b9724413937c__left-rail_???",
          "source": "left-rail-rung_main_8335eb45-697a-44e1-8a30-26bf1dd719e0",
          "target": "BLOCK_c905aa87-b172-405c-a716-b9724413937c",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_c905aa87-b172-405c-a716-b9724413937c_right-rail-rung_main_8335eb45-697a-44e1-8a30-26bf1dd719e0__???_right-rail",
          "source": "BLOCK_c905aa87-b172-405c-a716-b9724413937c",
          "target": "right-rail-rung_main_8335eb45-697a-44e1-8a30-26bf1dd719e0",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_BLOCK_c905aa87-b172-405c-a716-b9724413937c_VARIABLE_67177e0d-9700-4b77-99c8-d9ced6acf7d8__BufferLevel_input",
          "source": "BLOCK_c905aa87-b172-405c-a716-b9724413937c",
          "target": "VARIABLE_67177e0d-9700-4b77-99c8-d9ced6acf7d8",
          "sourceHandle": "BufferLevel",
          "targetHandle": "input"
        }
      ],
      "selectedNodes": []
    }
  ]
}
END_PROGRAM