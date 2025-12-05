import test_program from "./programs/test"
import mine_program from "./programs/mine"
import poke_program from "./programs/pokemon"

print("Nate's ComputerCraft OS")

const programs: [string, () => void][] = [
    ["test", test_program],
    ["mine", mine_program],
    ["pokemon", poke_program]
]

for (let [index, value] of programs.entries()) {
    print(`${index}: ${value[0]}`)
}

let value = parseInt(read())

programs[value][1]()
