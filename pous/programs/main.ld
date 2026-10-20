PROGRAM main
  VAR
    FB_11_MIXINGTANK0 : FB_11_MixingTank;
  END_VAR
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR

{
  "name": "main",
  "rungs": [
    {
      "id": "rung_main_07573b87-95c5-4e7b-bf30-252cc82d1d3c",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        598,
        120
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_07573b87-95c5-4e7b-bf30-252cc82d1d3c",
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
            "numericId": "2506730",
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
          "id": "BLOCK_843de292-dfa9-4d85-87b1-62faebbaedbf",
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
                  "x": 335,
                  "y": 50
                },
                "relPosition": {
                  "x": 192,
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
                  "x": 335,
                  "y": 50
                },
                "relPosition": {
                  "x": 192,
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
                "x": 335,
                "y": 50
              },
              "relPosition": {
                "x": 192,
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
            "numericId": "1015970",
            "variant": {
              "name": "FB_11_MixingTank",
              "documentation": "Mixing Tank of Fluids and Temperature",
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
                  "name": "TempControl",
                  "class": "local",
                  "type": {
                    "value": "BANGBANGCONTROL",
                    "definition": "derived"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false,
                  "initialValue": ""
                },
                {
                  "name": "LevelControl",
                  "class": "local",
                  "type": {
                    "value": "BANGBANGCONTROL",
                    "definition": "derived"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false,
                  "initialValue": ""
                },
                {
                  "id": "2dcd7e69-eba9-4754-a121-fc3cbb7a1007",
                  "name": "FaultActive",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                },
                {
                  "id": "2dcd7e69-eba9-4754-a121-fc3cbb7a1007",
                  "name": "Reset",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                },
                {
                  "id": "2dcd7e69-eba9-4754-a121-fc3cbb7a1007",
                  "name": "LatchedFault",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              ]
            },
            "variable": {
              "name": "FB_11_MIXINGTANK0",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "FB_11_MixingTank"
              },
              "location": "",
              "initialValue": null,
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
          "width": 192,
          "height": 60,
          "measured": {
            "width": 192,
            "height": 60
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "right-rail-rung_main_07573b87-95c5-4e7b-bf30-252cc82d1d3c",
          "type": "powerRail",
          "position": {
            "x": 595,
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
                "x": 595
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
            "numericId": "8661298",
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
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_07573b87-95c5-4e7b-bf30-252cc82d1d3c_BLOCK_843de292-dfa9-4d85-87b1-62faebbaedbf__left-rail_???",
          "source": "left-rail-rung_main_07573b87-95c5-4e7b-bf30-252cc82d1d3c",
          "target": "BLOCK_843de292-dfa9-4d85-87b1-62faebbaedbf",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_843de292-dfa9-4d85-87b1-62faebbaedbf_right-rail-rung_main_07573b87-95c5-4e7b-bf30-252cc82d1d3c__???_right-rail",
          "source": "BLOCK_843de292-dfa9-4d85-87b1-62faebbaedbf",
          "target": "right-rail-rung_main_07573b87-95c5-4e7b-bf30-252cc82d1d3c",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        }
      ],
      "selectedNodes": [],
      "handleBranches": []
    }
  ]
}
END_PROGRAM