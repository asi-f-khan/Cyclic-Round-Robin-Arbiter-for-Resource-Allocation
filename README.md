# Round_Robin_Arbiter

## AIM:
Design Arbiter implemented with 3 User Requests using Verilog.
## What is an Arbiter?
At its most basic, an arbiter is a device that takes as input N
requests, and outputs a single grant, in the form of a one-hot. A
one-hot is a group of bits of arbitrary size consisting of all zeros
except for one; i.e., one bit is logic high, or “hot.” In this way, the
arbiter looks at its set of inputs and allows a single device access
to the resource. The arbiter is a mediator between different
system components and system resources. This could be two CPU
cores that need to access shared memory, or two microcontrollers
trying to take control of a communication bus. Whatever the
application, the arbiter is a low-cost and relatively simple solution
to an often-complex problem.

## Example of arbiter in action

Let's say we have three devices each with a request signal tied to
an arbiter. “Device” here is used as a general term for any
requester. The requester could be a FIFO (first-in, first-out) queue,
a CPU, a state machine, etc. When the device needs access to a
resource, it simply sets its request signal high. The arbiter checks
its inputs and grants access
