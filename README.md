# Round Robin Arbiter Project

## Introduction

This project is a Verilog implementation of a round-robin arbiter designed to allocate resources among three users. The arbiter follows a fixed-time slot allocation scheme and uses a priority order for resource allocation, where User0 has the highest priority, followed by User1 and User2.

## Key Features

### Round-Robin Allocation

The arbiter allocates resources in a round-robin fashion, ensuring fair access to resources among the three users.

### Fixed-Time Slots

Each user is granted access to resources for fixed-time slots. This fixed-time approach ensures predictable and deterministic allocation of resources.

### Priority-Based Allocation

Users are assigned priority levels for resource allocation. The priority order is defined as follows:

- User0: Highest priority
- User1: Medium priority
- User2: Lowest priority

## How It Works

### State Machine

The arbiter operates using a state machine that transitions between different states based on user requests and the current state. The states correspond to the different users and the idle state.

### State Transitions

The state transitions are determined by the presence of user requests. Users with higher priority are given preference in resource allocation. The state transitions follow the round-robin order and prioritize User0 over User1 and User2.

### Fixed-Time Allocation

Users are granted access to resources for fixed-time slots within their respective states. The fixed-time approach ensures a consistent and predictable allocation pattern.

## How to Use EDA Playground

1. Open [EDA Playground](https://www.edaplayground.com/).
2. Create a new project.
3. Add the Verilog files (`round_robin_arbiter.v` and `round_robin_arbiter_tb.v`) to the project.
4. Run the simulation to observe waveforms and results.

## Priority for Resource Allocation

The priority order for resource allocation is as follows:

1. User0: Highest priority
2. User1: Medium priority
3. User2: Lowest priority

The arbiter follows this priority order when deciding which user gets access to resources.

## Contributor

- **Asif Khan**
  - Email: asi.f.khan@hotmail.com

Feel free to explore the project, make modifications, and use it as needed. If you have any questions or suggestions, please reach out to the contributor.
