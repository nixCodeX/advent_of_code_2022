#! /usr/local/bin/apl -f

INPUT ← ⎕FIO[49]'./input.txt'

INPUT2 ← ((↑¨⍴¨INPUT) > 0) ⊂ INPUT

STACKS ← ↑(1⌷INPUT2)
STACKS ← ((↑⍴STACKS) - 1) (↑⍴↑STACKS) ⍴ ↑(,/STACKS)
STACKS ← ↑¨(((2⌷⍴STACKS) ⍴ 0 1 0 0) ⊂ STACKS)
STACKS ← (⍳(2⌷⍴STACKS)) ⌷[2]¨ ⊂STACKS

∇ RES ← REMOVE_SPACES LINE
RES ← ∊((' ' ≠ LINE) ⊂ LINE)
∇

STACKS ← REMOVE_SPACES¨STACKS

∇ RES ← PARSE_MOVE LINE
RES ← ⍎¨(1↓('^move (\d*) from (\d*) to (\d*)$' ⎕RE LINE))
∇

MOVES ← PARSE_MOVE¨↑(2⌷INPUT2)

∇ STACKS ← MOVE PERFORM_MOVE STACKS;CRATES
CRATES ← MOVE[1] ↑ ⊃STACKS[MOVE[2]]
STACKS[MOVE[2]] ← ⊂(MOVE[1] ↓ ⊃STACKS[MOVE[2]])
CRATES ← ⌽CRATES
STACKS[MOVE[3]] ← ⊂(CRATES , ⊃STACKS[MOVE[3]])
∇

↑¨⊃(PERFORM_MOVE / (⌽MOVES),⊂STACKS)

∇ STACKS ← MOVE PERFORM_MOVE2 STACKS;CRATES
CRATES ← MOVE[1] ↑ ⊃STACKS[MOVE[2]]
STACKS[MOVE[2]] ← ⊂(MOVE[1] ↓ ⊃STACKS[MOVE[2]])
STACKS[MOVE[3]] ← ⊂(CRATES , ⊃STACKS[MOVE[3]])
∇

↑¨⊃(PERFORM_MOVE2 / (⌽MOVES),⊂STACKS)

