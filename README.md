---

### 📄 `README.md`

```markdown
# Verilog Stack Module

This repository contains a simple and configurable **stack module written in Verilog**, implementing standard LIFO (Last-In-First-Out) behavior with a ready-to-use testbench.

---

## 🔧 Features

- Parameterized data width (`WIDTH`)
- Parameterized stack depth (`DEPTH`)
- Signed data support
- `push`, `pop`, and `reset` control
- `full` and `empty` status flags
- Outputs high-impedance (`Z`) when not popping
- Included testbench for simulation

---

## 📦 Module Interface

```verilog
module stack#(
    parameter WIDTH = 8,
    parameter DEPTH = 256
)(
    input clk,
    input push,
    input pop,
    input rst,
    input signed [WIDTH-1:0] data_in,
    output reg signed [WIDTH-1:0] data_out, 
    output reg full,
    output reg empty
);
```

### 🚦 I/O Description

| Signal     | Direction | Description                             |
|------------|-----------|-----------------------------------------|
| `clk`      | Input     | Clock signal                            |
| `push`     | Input     | Push data into the stack                |
| `pop`      | Input     | Pop data from the stack                 |
| `rst`      | Input     | Reset the stack                         |
| `data_in`  | Input     | Data to be pushed                       |
| `data_out` | Output    | Data from top of the stack (on pop)     |
| `full`     | Output    | Stack is full                           |
| `empty`    | Output    | Stack is empty                          |

---

## 🧪 Testbench

This repository includes a testbench file: `stack_tb.v`. It tests the following:

- Stack reset
- Multiple push operations (`10`, `20`, `5`, `25`)
- Multiple pop operations with output validation
- Popping from an empty stack

### 🏃 Run the Simulation (with Icarus Verilog)

```bash
iverilog -o tb stack_tb.v stack.v
vvp tb
```

Expected output:
```
push 10
push 20
push 5
push 25
pop, data out=25 (expect 25)
pop, data out=5  (expect 5)
pop, data out=20 (expect 20)
pop, data out=10 (expect 10)
pop, data out=X  (pop the empty stack)
```

---

## 📁 Files

| File          | Description                          |
|---------------|--------------------------------------|
| `stack.v`     | Verilog source code for stack module |
| `stack_tb.v`  | Testbench file for simulation        |
| `README.md`   | Project documentation                |

---
