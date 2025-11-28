import { FacingDirection, FacingDirections, Point } from "./lib"

function directionAutoComplete(this: void, partial: string): string[] {
    let possible: string[] = []
    for (let facing of FacingDirections) {
        if (facing.startsWith(partial))
            possible.push(facing.slice(partial.length))
    }

    return possible
}

function isFacingDirection(x: string): x is FacingDirection {
    return (FacingDirections as ReadonlyArray<string>).includes(x)
}

export function readDirection(prompt: string): FacingDirection {
    while (true) {
        print(prompt)
        let answer = read(undefined, undefined, directionAutoComplete);
        if (isFacingDirection(answer)) {
            return answer
        }
    }
}

const LOCATION_REGEX = "^(-?%d+) (-?%d+) (-?%d+)"
const PARTIAL_LOCATION_REGEX = "^-?(%d+( (-?(%d+( (-?(%d+)?)?)?)?)?)?)?";
const LOCATION_CHARS = " -0123456789"
function locationAutoComplete(this: void, partial: string): string[] {
    let possible: string[] = []

    for (let char of LOCATION_CHARS) {
        let match = string.match(partial + char, PARTIAL_LOCATION_REGEX)
        print(partial + char, match[0])
        if (match.length != 0) {
            possible.push(char)
        }
    }

    return possible


}

export function readLocation(prompt: string): Point {
    while (true) {
        print(prompt)
        let answer = read(undefined, undefined, locationAutoComplete);
        let match = string.match(answer, LOCATION_REGEX)
        if (match.length != 0) {
            return {
                x: parseInt(match[0]),
                y: parseInt(match[1]),
                z: parseInt(match[2])
            }
        }
    }
}

export function readTurtleLocation(): [Point, FacingDirection] {
    let location = readLocation("Enter Starting Location:")
    print(location)
    let direction = readDirection("Enter Starting Facing Direction:")
    print(direction)
    return [location, direction]
}