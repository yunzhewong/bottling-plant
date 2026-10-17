(* Mixing Tank of Fluids and Temperature *)

FUNCTION_BLOCK FB_11_MixingTank
  VAR
    LevelTolerance_m : REAL := 0.1;
    TempTolerance_m : REAL := 1;
    LevelHysteresis : HYSTERESIS;
    TempHysteresis : HYSTERESIS;
  END_VAR
  VAR_OUTPUT
    InletOpen : BOOL := FALSE;
    HeaterOn : BOOL := FALSE;
  END_VAR
  VAR_OUTPUT RETAIN
  END_VAR
  VAR_INPUT
    LevelSetpoint_m : REAL := 2;
    LevelReadback_m : REAL := 2;
    TempSetpoint_degC : REAL := 50;
    TempReadback_degC : REAL := 50;
  END_VAR
  VAR_TEMP
  END_VAR

{
  "name": "FB_11_MixingTank",
  "rungs": [
    {
      "id": "rung_FB_11_MixingTank_53c4e1eb-23c5-432d-b916-9c57c9d8f3b3",
      "comment": "Hysteresis backwards compared to documentation?",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        569,
        254
      ],
      "nodes": [
        {
          "id": "left-rail-rung_FB_11_MixingTank_53c4e1eb-23c5-432d-b916-9c57c9d8f3b3",
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
            "numericId": "4481482",
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
          "id": "BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7",
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
                  "x": 143,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "XIN1",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "XIN2",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "EPS",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 263,
                  "y": 50
                },
                "relPosition": {
                  "x": 120,
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
                  "x": 263,
                  "y": 130
                },
                "relPosition": {
                  "x": 120,
                  "y": 116
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
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
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "XIN1",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "XIN2",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "EPS",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 263,
                  "y": 50
                },
                "relPosition": {
                  "x": 120,
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
                  "x": 263,
                  "y": 130
                },
                "relPosition": {
                  "x": 120,
                  "y": 116
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
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
                "x": 263,
                "y": 50
              },
              "relPosition": {
                "x": 120,
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
            "numericId": "8847692",
            "variant": {
              "name": "HYSTERESIS",
              "type": "function-block",
              "language": "st",
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
                  "name": "XIN1",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                },
                {
                  "name": "XIN2",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                },
                {
                  "name": "EPS",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                },
                {
                  "name": "Q",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                }
              ],
              "body": "",
              "documentation": "The hysteresis function block provides a hysteresis boolean output driven by the difference of two floating point (REAL) inputs XIN1 and XIN2."
            },
            "variable": {
              "id": "965b6a12-de46-4d82-8e44-57ad80d02f81",
              "name": "LevelHysteresis",
              "type": {
                "definition": "derived",
                "value": "HYSTERESIS"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": true,
            "connectedVariables": [
              {
                "handleId": "XIN2",
                "type": "input",
                "variable": {
                  "id": "",
                  "name": "LevelSetpoint_m",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "EPS",
                "type": "input",
                "variable": {
                  "id": "",
                  "name": "LevelTolerance_m",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "Q",
                "type": "output",
                "variable": {
                  "name": "InletOpen",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "location": "",
                  "initialValue": "FALSE",
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "XIN1",
                "type": "input",
                "variable": {
                  "name": "LevelReadback_m",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  },
                  "location": "",
                  "initialValue": "2",
                  "documentation": "",
                  "debug": false
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          },
          "width": 120,
          "height": 220,
          "measured": {
            "width": 120,
            "height": 220
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "COIL_8d8cab19-dfcc-46fc-bf41-37c7c8802bf4",
          "type": "coil",
          "position": {
            "x": 428,
            "y": 118
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 428,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 456,
                  "y": 130
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "negated",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 428,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 456,
                  "y": 130
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 428,
                "y": 130
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 456,
                "y": 130
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "1513827",
            "variable": {
              "id": "",
              "name": "InletOpen",
              "type": {
                "definition": "base-type",
                "value": "BOOL"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "branchContext": {
              "blockId": "BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7",
              "handleId": "Q",
              "direction": "output"
            }
          },
          "width": 28,
          "height": 24,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "right-rail-rung_FB_11_MixingTank_53c4e1eb-23c5-432d-b916-9c57c9d8f3b3",
          "type": "powerRail",
          "position": {
            "x": 566,
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
                "x": 566
              },
              {
                "glbPosition": {
                  "x": 297,
                  "y": 130
                },
                "relPosition": {
                  "x": 3,
                  "y": 100
                },
                "id": "branch_BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7_Q",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 100,
                  "left": -3
                },
                "x": 566
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
                },
                "x": 523
              },
              {
                "glbPosition": {
                  "x": 297,
                  "y": 130
                },
                "relPosition": {
                  "x": 3,
                  "y": 100
                },
                "id": "branch_BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7_Q",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 100,
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
            "numericId": "3983687",
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
          "id": "VARIABLE_7b3fa296-f9dd-4204-a2fa-49ee893510cf",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 114
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
                  "x": 193,
                  "y": 130
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 130
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 130
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "9029824",
            "variable": {
              "name": "LevelReadback_m",
              "class": "input",
              "type": {
                "definition": "base-type",
                "value": "REAL"
              },
              "location": "",
              "initialValue": "2",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7",
              "handleId": "XIN1",
              "variableType": {
                "name": "XIN1",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
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
        },
        {
          "id": "VARIABLE_85c85be1-2063-4c24-a7eb-3f61d463e6cd",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 154
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
                  "x": 193,
                  "y": 170
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 170
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 170
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "4964038",
            "variable": {
              "id": "",
              "name": "LevelSetpoint_m",
              "type": {
                "definition": "base-type",
                "value": "REAL"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7",
              "handleId": "XIN2",
              "variableType": {
                "name": "XIN2",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
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
        },
        {
          "id": "VARIABLE_a2c6b565-2fc8-4fb6-9e1d-5800786ab849",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 194
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
                  "x": 193,
                  "y": 210
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 210
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 210
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "5764303",
            "variable": {
              "id": "",
              "name": "LevelTolerance_m",
              "type": {
                "definition": "base-type",
                "value": "REAL"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7",
              "handleId": "EPS",
              "variableType": {
                "name": "EPS",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
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
          "id": "e_left-rail-rung_FB_11_MixingTank_53c4e1eb-23c5-432d-b916-9c57c9d8f3b3_BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7__left-rail_???",
          "source": "left-rail-rung_FB_11_MixingTank_53c4e1eb-23c5-432d-b916-9c57c9d8f3b3",
          "target": "BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7_right-rail-rung_FB_11_MixingTank_53c4e1eb-23c5-432d-b916-9c57c9d8f3b3__???_right-rail",
          "source": "BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7",
          "target": "right-rail-rung_FB_11_MixingTank_53c4e1eb-23c5-432d-b916-9c57c9d8f3b3",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7_COIL_8d8cab19-dfcc-46fc-bf41-37c7c8802bf4__Q_input",
          "source": "BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7",
          "target": "COIL_8d8cab19-dfcc-46fc-bf41-37c7c8802bf4",
          "sourceHandle": "Q",
          "targetHandle": "input"
        },
        {
          "id": "e_COIL_8d8cab19-dfcc-46fc-bf41-37c7c8802bf4_right-rail-rung_FB_11_MixingTank_53c4e1eb-23c5-432d-b916-9c57c9d8f3b3__output_branch_BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7_Q",
          "source": "COIL_8d8cab19-dfcc-46fc-bf41-37c7c8802bf4",
          "target": "right-rail-rung_FB_11_MixingTank_53c4e1eb-23c5-432d-b916-9c57c9d8f3b3",
          "sourceHandle": "output",
          "targetHandle": "branch_BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7_Q"
        },
        {
          "id": "e_VARIABLE_7b3fa296-f9dd-4204-a2fa-49ee893510cf_BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7__output_XIN1",
          "source": "VARIABLE_7b3fa296-f9dd-4204-a2fa-49ee893510cf",
          "target": "BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7",
          "sourceHandle": "output",
          "targetHandle": "XIN1"
        },
        {
          "id": "e_VARIABLE_85c85be1-2063-4c24-a7eb-3f61d463e6cd_BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7__output_XIN2",
          "source": "VARIABLE_85c85be1-2063-4c24-a7eb-3f61d463e6cd",
          "target": "BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7",
          "sourceHandle": "output",
          "targetHandle": "XIN2"
        },
        {
          "id": "e_VARIABLE_a2c6b565-2fc8-4fb6-9e1d-5800786ab849_BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7__output_EPS",
          "source": "VARIABLE_a2c6b565-2fc8-4fb6-9e1d-5800786ab849",
          "target": "BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7",
          "sourceHandle": "output",
          "targetHandle": "EPS"
        }
      ],
      "selectedNodes": [],
      "handleBranches": [
        {
          "blockId": "BLOCK_33fefb6f-ea1f-4071-9fcb-2ae97bf6c1c7",
          "handleId": "Q",
          "direction": "output",
          "nodeIds": [
            "COIL_8d8cab19-dfcc-46fc-bf41-37c7c8802bf4"
          ]
        }
      ]
    },
    {
      "id": "rung_FB_11_MixingTank_db5abf92-08c1-407b-8f83-6b067f708903",
      "comment": "Hysteresis backwards compared to documentation?",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        569,
        254
      ],
      "nodes": [
        {
          "id": "left-rail-rung_FB_11_MixingTank_db5abf92-08c1-407b-8f83-6b067f708903",
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
            "numericId": "2302953",
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
          "id": "BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc",
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
                  "x": 143,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "XIN1",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "XIN2",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "EPS",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 263,
                  "y": 50
                },
                "relPosition": {
                  "x": 120,
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
                  "x": 263,
                  "y": 130
                },
                "relPosition": {
                  "x": 120,
                  "y": 116
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
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
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "XIN1",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "XIN2",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "EPS",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 263,
                  "y": 50
                },
                "relPosition": {
                  "x": 120,
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
                  "x": 263,
                  "y": 130
                },
                "relPosition": {
                  "x": 120,
                  "y": 116
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
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
                "x": 263,
                "y": 50
              },
              "relPosition": {
                "x": 120,
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
            "numericId": "3748236",
            "variant": {
              "name": "HYSTERESIS",
              "type": "function-block",
              "language": "st",
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
                  "name": "XIN1",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                },
                {
                  "name": "XIN2",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                },
                {
                  "name": "EPS",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                },
                {
                  "name": "Q",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                }
              ],
              "body": "",
              "documentation": "The hysteresis function block provides a hysteresis boolean output driven by the difference of two floating point (REAL) inputs XIN1 and XIN2."
            },
            "variable": {
              "id": "3342bd2a-af91-49d5-9653-407e9abf335d",
              "name": "TempHysteresis",
              "type": {
                "definition": "derived",
                "value": "HYSTERESIS"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": true,
            "connectedVariables": [
              {
                "handleId": "EPS",
                "type": "input",
                "variable": {
                  "id": "965b6a12-de46-4d82-8e44-57ad80d02f81",
                  "name": "TempTolerance_m",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false,
                  "initialValue": "0.1"
                }
              },
              {
                "handleId": "XIN2",
                "type": "input",
                "variable": {
                  "name": "TempSetpoint_degC",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  },
                  "location": "",
                  "initialValue": "50",
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "XIN1",
                "type": "input",
                "variable": {
                  "name": "TempReadback_degC",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  },
                  "location": "",
                  "initialValue": "50",
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "Q",
                "type": "output",
                "variable": {
                  "name": "HeaterOn",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "location": "",
                  "initialValue": "FALSE",
                  "documentation": "",
                  "debug": false
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          },
          "width": 120,
          "height": 220,
          "measured": {
            "width": 120,
            "height": 220
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "COIL_5669d645-7e63-4a89-b8c9-0f26c6c7f804",
          "type": "coil",
          "position": {
            "x": 428,
            "y": 118
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 428,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 456,
                  "y": 130
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "negated",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 428,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 456,
                  "y": 130
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 428,
                "y": 130
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 456,
                "y": 130
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "1909465",
            "variable": {
              "id": "",
              "name": "HeaterOn",
              "type": {
                "definition": "base-type",
                "value": "BOOL"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "branchContext": {
              "blockId": "BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc",
              "handleId": "Q",
              "direction": "output"
            }
          },
          "width": 28,
          "height": 24,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "right-rail-rung_FB_11_MixingTank_db5abf92-08c1-407b-8f83-6b067f708903",
          "type": "powerRail",
          "position": {
            "x": 566,
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
                "x": 566
              },
              {
                "glbPosition": {
                  "x": 297,
                  "y": 130
                },
                "relPosition": {
                  "x": 3,
                  "y": 100
                },
                "id": "branch_BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc_Q",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 100,
                  "left": -3
                },
                "x": 566
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
                },
                "x": 523
              },
              {
                "glbPosition": {
                  "x": 297,
                  "y": 130
                },
                "relPosition": {
                  "x": 3,
                  "y": 100
                },
                "id": "branch_BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc_Q",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 100,
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
            "numericId": "4061839",
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
          "id": "VARIABLE_fea557bb-db1e-4ec7-afa8-c9cf1d0d22df",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 114
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
                  "x": 193,
                  "y": 130
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 130
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 130
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "3211288",
            "variable": {
              "name": "TempReadback_degC",
              "class": "input",
              "type": {
                "definition": "base-type",
                "value": "REAL"
              },
              "location": "",
              "initialValue": "50",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc",
              "handleId": "XIN1",
              "variableType": {
                "name": "XIN1",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
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
        },
        {
          "id": "VARIABLE_ed07da96-4950-4198-92c7-56ea5fd6ed2c",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 154
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
                  "x": 193,
                  "y": 170
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 170
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 170
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "9992747",
            "variable": {
              "name": "TempSetpoint_degC",
              "class": "input",
              "type": {
                "definition": "base-type",
                "value": "REAL"
              },
              "location": "",
              "initialValue": "50",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc",
              "handleId": "XIN2",
              "variableType": {
                "name": "XIN2",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
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
        },
        {
          "id": "VARIABLE_db60bdb1-4596-49d1-bf79-efd10c7ee2ee",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 194
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
                  "x": 193,
                  "y": 210
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 210
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 210
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "3006174",
            "variable": {
              "id": "965b6a12-de46-4d82-8e44-57ad80d02f81",
              "name": "TempTolerance_m",
              "type": {
                "definition": "base-type",
                "value": "REAL"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false,
              "initialValue": "0.1"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc",
              "handleId": "EPS",
              "variableType": {
                "name": "EPS",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
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
          "id": "e_left-rail-rung_FB_11_MixingTank_db5abf92-08c1-407b-8f83-6b067f708903_BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc__left-rail_???",
          "source": "left-rail-rung_FB_11_MixingTank_db5abf92-08c1-407b-8f83-6b067f708903",
          "target": "BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc_right-rail-rung_FB_11_MixingTank_db5abf92-08c1-407b-8f83-6b067f708903__???_right-rail",
          "source": "BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc",
          "target": "right-rail-rung_FB_11_MixingTank_db5abf92-08c1-407b-8f83-6b067f708903",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc_COIL_5669d645-7e63-4a89-b8c9-0f26c6c7f804__Q_input",
          "source": "BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc",
          "target": "COIL_5669d645-7e63-4a89-b8c9-0f26c6c7f804",
          "sourceHandle": "Q",
          "targetHandle": "input"
        },
        {
          "id": "e_COIL_5669d645-7e63-4a89-b8c9-0f26c6c7f804_right-rail-rung_FB_11_MixingTank_db5abf92-08c1-407b-8f83-6b067f708903__output_branch_BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc_Q",
          "source": "COIL_5669d645-7e63-4a89-b8c9-0f26c6c7f804",
          "target": "right-rail-rung_FB_11_MixingTank_db5abf92-08c1-407b-8f83-6b067f708903",
          "sourceHandle": "output",
          "targetHandle": "branch_BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc_Q"
        },
        {
          "id": "e_VARIABLE_fea557bb-db1e-4ec7-afa8-c9cf1d0d22df_BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc__output_XIN1",
          "source": "VARIABLE_fea557bb-db1e-4ec7-afa8-c9cf1d0d22df",
          "target": "BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc",
          "sourceHandle": "output",
          "targetHandle": "XIN1"
        },
        {
          "id": "e_VARIABLE_ed07da96-4950-4198-92c7-56ea5fd6ed2c_BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc__output_XIN2",
          "source": "VARIABLE_ed07da96-4950-4198-92c7-56ea5fd6ed2c",
          "target": "BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc",
          "sourceHandle": "output",
          "targetHandle": "XIN2"
        },
        {
          "id": "e_VARIABLE_db60bdb1-4596-49d1-bf79-efd10c7ee2ee_BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc__output_EPS",
          "source": "VARIABLE_db60bdb1-4596-49d1-bf79-efd10c7ee2ee",
          "target": "BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc",
          "sourceHandle": "output",
          "targetHandle": "EPS"
        }
      ],
      "selectedNodes": [],
      "handleBranches": [
        {
          "blockId": "BLOCK_ee2dbc7c-254b-48ad-8ab8-dc49922c28fc",
          "handleId": "Q",
          "direction": "output",
          "nodeIds": [
            "COIL_5669d645-7e63-4a89-b8c9-0f26c6c7f804"
          ]
        }
      ]
    }
  ]
}
END_FUNCTION_BLOCK