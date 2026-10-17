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
        622,
        254
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
          "id": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
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
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "LevelSetpoint_m",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
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
                "id": "LevelReadback_m",
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
                "id": "TempSetpoint_degC",
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
                "id": "TempReadback_degC",
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
                  "x": 359,
                  "y": 50
                },
                "relPosition": {
                  "x": 216,
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
                  "x": 359,
                  "y": 90
                },
                "relPosition": {
                  "x": 216,
                  "y": 76
                },
                "id": "InletOpen",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 359,
                  "y": 130
                },
                "relPosition": {
                  "x": 216,
                  "y": 116
                },
                "id": "HeaterOn",
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
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "LevelSetpoint_m",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
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
                "id": "LevelReadback_m",
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
                "id": "TempSetpoint_degC",
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
                "id": "TempReadback_degC",
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
                  "x": 359,
                  "y": 50
                },
                "relPosition": {
                  "x": 216,
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
                  "x": 359,
                  "y": 90
                },
                "relPosition": {
                  "x": 216,
                  "y": 76
                },
                "id": "InletOpen",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 359,
                  "y": 130
                },
                "relPosition": {
                  "x": 216,
                  "y": 116
                },
                "id": "HeaterOn",
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
                "x": 359,
                "y": 50
              },
              "relPosition": {
                "x": 216,
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
            "numericId": "488359",
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
                  "name": "LevelSetpoint_m",
                  "class": "input",
                  "type": {
                    "value": "REAL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": "2",
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "LevelReadback_m",
                  "class": "input",
                  "type": {
                    "value": "REAL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": "2",
                  "documentation": "",
                  "debug": false
                },
                {
                  "id": "965b6a12-de46-4d82-8e44-57ad80d02f81",
                  "name": "LevelTolerance_m",
                  "type": {
                    "value": "REAL",
                    "definition": "base-type"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false,
                  "initialValue": "0.02"
                },
                {
                  "name": "InletOpen",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": "FALSE",
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "TempSetpoint_degC",
                  "class": "input",
                  "type": {
                    "value": "REAL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": "50",
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "TempReadback_degC",
                  "class": "input",
                  "type": {
                    "value": "REAL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": "50",
                  "documentation": "",
                  "debug": false
                },
                {
                  "id": "965b6a12-de46-4d82-8e44-57ad80d02f81",
                  "name": "TempTolerance_m",
                  "type": {
                    "value": "REAL",
                    "definition": "base-type"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false,
                  "initialValue": "0.02"
                },
                {
                  "name": "HeaterOn",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": "FALSE",
                  "documentation": "",
                  "debug": false
                },
                {
                  "id": "965b6a12-de46-4d82-8e44-57ad80d02f81",
                  "name": "LevelHysteresis",
                  "type": {
                    "definition": "user-data-type",
                    "value": "HYSTERESIS"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                },
                {
                  "id": "3342bd2a-af91-49d5-9653-407e9abf335d",
                  "name": "TempHysteresis",
                  "type": {
                    "definition": "user-data-type",
                    "value": "HYSTERESIS"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              ]
            },
            "variable": {
              "id": "06c51ae2-39bb-4205-82ae-129defea7476",
              "name": "FB_11_MIXINGTANK0",
              "type": {
                "definition": "derived",
                "value": "FB_11_MixingTank"
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
                "handleId": "InletOpen",
                "type": "output",
                "variable": {
                  "id": "7f069b54-bfc9-4932-9a55-7ca1962c45c8",
                  "name": "MixInletOpen",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false,
                  "initialValue": "False"
                }
              },
              {
                "handleId": "TempReadback_degC",
                "type": "input",
                "variable": {
                  "id": "ba429951-dffb-4c51-8b9b-1f2f566d9e10",
                  "name": "MixTempReadback_degC",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": true,
                  "initialValue": "50"
                }
              },
              {
                "handleId": "LevelSetpoint_m",
                "type": "input",
                "variable": {
                  "id": "",
                  "name": ""
                }
              },
              {
                "handleId": "LevelReadback_m",
                "type": "input",
                "variable": {
                  "id": "",
                  "name": ""
                }
              },
              {
                "handleId": "TempSetpoint_degC",
                "type": "input",
                "variable": {
                  "id": "",
                  "name": ""
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          },
          "width": 216,
          "height": 220,
          "measured": {
            "width": 216,
            "height": 220
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
            "x": 619,
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
                "x": 619
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
        },
        {
          "id": "VARIABLE_893f9014-0cc9-4a21-a1cd-a611233fd2b9",
          "type": "variable",
          "position": {
            "x": 33,
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
                  "x": 193,
                  "y": 90
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
                  "y": 90
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
                "y": 90
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
            "numericId": "1829999",
            "variable": {
              "id": "",
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
              "handleId": "LevelSetpoint_m",
              "variableType": {
                "name": "LevelSetpoint_m",
                "class": "input",
                "type": {
                  "value": "REAL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": "2",
                "documentation": "",
                "debug": false
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
          "id": "VARIABLE_de81b101-441d-42c5-8894-7370fa65687b",
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
            "numericId": "1842545",
            "variable": {
              "id": "",
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
              "handleId": "LevelReadback_m",
              "variableType": {
                "name": "LevelReadback_m",
                "class": "input",
                "type": {
                  "value": "REAL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": "2",
                "documentation": "",
                "debug": false
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
          "id": "VARIABLE_ceb6ddd7-f213-485f-897a-b755db6c8b9e",
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
            "numericId": "3905688",
            "variable": {
              "id": "",
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
              "handleId": "TempSetpoint_degC",
              "variableType": {
                "name": "TempSetpoint_degC",
                "class": "input",
                "type": {
                  "value": "REAL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": "50",
                "documentation": "",
                "debug": false
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
          "id": "VARIABLE_0dde9618-e795-41a2-9c7e-c94ff457e616",
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
            "numericId": "9297852",
            "variable": {
              "id": "",
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
              "handleId": "TempReadback_degC",
              "variableType": {
                "name": "TempReadback_degC",
                "class": "input",
                "type": {
                  "value": "REAL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": "50",
                "documentation": "",
                "debug": false
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
          "id": "VARIABLE_e0cb108a-367b-49aa-9358-0a0a28292148",
          "type": "variable",
          "position": {
            "x": 389,
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
                  "x": 389,
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
                  "x": 389,
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
                "x": 389,
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
            "numericId": "9046339",
            "variable": {
              "id": "",
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
              "handleId": "InletOpen",
              "variableType": {
                "name": "InletOpen",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": "FALSE",
                "documentation": "",
                "debug": false
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
          "id": "VARIABLE_1503aa40-8319-4b4b-9b0e-6a3421bbb843",
          "type": "variable",
          "position": {
            "x": 389,
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
                  "x": 389,
                  "y": 130
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
                  "x": 389,
                  "y": 130
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
                "x": 389,
                "y": 130
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
            "numericId": "9977029",
            "variable": {
              "id": "",
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
              "handleId": "HeaterOn",
              "variableType": {
                "name": "HeaterOn",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": "FALSE",
                "documentation": "",
                "debug": false
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
          "id": "e_left-rail-rung_main_07573b87-95c5-4e7b-bf30-252cc82d1d3c_BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9__left-rail_???",
          "source": "left-rail-rung_main_07573b87-95c5-4e7b-bf30-252cc82d1d3c",
          "target": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9_right-rail-rung_main_07573b87-95c5-4e7b-bf30-252cc82d1d3c__???_right-rail",
          "source": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
          "target": "right-rail-rung_main_07573b87-95c5-4e7b-bf30-252cc82d1d3c",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_VARIABLE_893f9014-0cc9-4a21-a1cd-a611233fd2b9_BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9__output_LevelSetpoint_m",
          "source": "VARIABLE_893f9014-0cc9-4a21-a1cd-a611233fd2b9",
          "target": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
          "sourceHandle": "output",
          "targetHandle": "LevelSetpoint_m"
        },
        {
          "id": "e_VARIABLE_de81b101-441d-42c5-8894-7370fa65687b_BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9__output_LevelReadback_m",
          "source": "VARIABLE_de81b101-441d-42c5-8894-7370fa65687b",
          "target": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
          "sourceHandle": "output",
          "targetHandle": "LevelReadback_m"
        },
        {
          "id": "e_VARIABLE_ceb6ddd7-f213-485f-897a-b755db6c8b9e_BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9__output_TempSetpoint_degC",
          "source": "VARIABLE_ceb6ddd7-f213-485f-897a-b755db6c8b9e",
          "target": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
          "sourceHandle": "output",
          "targetHandle": "TempSetpoint_degC"
        },
        {
          "id": "e_VARIABLE_0dde9618-e795-41a2-9c7e-c94ff457e616_BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9__output_TempReadback_degC",
          "source": "VARIABLE_0dde9618-e795-41a2-9c7e-c94ff457e616",
          "target": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
          "sourceHandle": "output",
          "targetHandle": "TempReadback_degC"
        },
        {
          "id": "e_BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9_VARIABLE_e0cb108a-367b-49aa-9358-0a0a28292148__InletOpen_input",
          "source": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
          "target": "VARIABLE_e0cb108a-367b-49aa-9358-0a0a28292148",
          "sourceHandle": "InletOpen",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9_VARIABLE_1503aa40-8319-4b4b-9b0e-6a3421bbb843__HeaterOn_input",
          "source": "BLOCK_bcdeecac-6e25-4144-837a-47f48f62c8e9",
          "target": "VARIABLE_1503aa40-8319-4b4b-9b0e-6a3421bbb843",
          "sourceHandle": "HeaterOn",
          "targetHandle": "input"
        }
      ],
      "selectedNodes": [],
      "handleBranches": []
    }
  ]
}
END_PROGRAM