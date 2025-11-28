import { dir } from "cc.shell.completion";

export const FacingDirections = ["north", "south", "east", "west"] as const;
export type FacingDirection = (typeof FacingDirections)[number];

type Direction = "up" | "down" | FacingDirection;

// class Direction {
//     dir: DirectionEnum;
//     constructor(dir: DirectionEnum | Direction) {
//         if (dir instanceof Direction)
//             this.dir = dir.dir;
//         else
//             this.dir = dir;
//     }
//     clockwise(): Direction {
//         let map: Record<DirectionEnum, DirectionEnum> = {
//             "up": "up",
//             "down": "down",
//             "north": "east",
//             "south": "west",
//             "east": "south",
//             "west": "north"
//         };
//         return new Direction(map[this.dir])
//     }
//     counter_clockwise(): Direction {
//         let map: Record<DirectionEnum, DirectionEnum> = {
//             "up": "up",
//             "down": "down",
//             "north": "west",
//             "south": "east",
//             "east": "north",
//             "west": "south"
//         };
//         return new Direction(map[this.dir])
//     }
//     reverse(): Direction {
//         let map: Record<DirectionEnum, DirectionEnum> = {
//             "up": "up",
//             "down": "down",
//             "north": "south",
//             "south": "north",
//             "east": "west",
//             "west": "east"
//         };
//         return new Direction(map[this.dir])
//     }
// }


function clockwise(dir: FacingDirection): FacingDirection {
    let map: Record<Direction, FacingDirection> = {
        "up": dir,
        "down": dir,
        "north": "east",
        "south": "west",
        "east": "south",
        "west": "north"
    };
    return map[dir]
}

function counter_clockwise(dir: FacingDirection): FacingDirection {
    let map: Record<Direction, FacingDirection> = {
        "up": dir,
        "down": dir,
        "north": "west",
        "south": "east",
        "east": "north",
        "west": "south"
    };
    return map[dir]
}
function reverse(dir: Direction): Direction {
    let map: Record<Direction, Direction> = {
        "up": "down",
        "down": "up",
        "north": "south",
        "south": "north",
        "east": "west",
        "west": "east"
    };
    return map[dir]
}

export interface Point {
    x: number,
    y: number,
    z: number
}

export function move_point(point: Point, dir: Direction): Point {
    let pnt = Object.assign({}, point);

    let map = {
        "up": () => pnt.y + 1,
        "down": () => pnt.y - 1,
        "north": () => pnt.z - 1,
        "south": () => pnt.z + 1,
        "east": () => pnt.x - 1,
        "west": () => pnt.x + 1,
    }

    map[dir]()

    return pnt
}

export class TurtleApi {
    point: Point;
    direction: FacingDirection;

    constructor(point: Point = { x: 0, y: 0, z: 0 }, direction: FacingDirection = "north") {
        this.point = point;
        this.direction = direction;
    }


    // movement
    turnLeft() {
        this.direction = counter_clockwise(this.direction)
        turtle.turnLeft()
    }

    turnRight() {
        this.direction = clockwise(this.direction)
        turtle.turnRight()
    }

    forward() {
        this.ensureFuel()
        this.point = move_point(this.point, this.direction)
        turtle.forward()
    }

    back() {
        this.ensureFuel()
        this.point = move_point(this.point, reverse(this.direction))
        turtle.back()
    }

    up() {
        this.ensureFuel()
        this.point = move_point(this.point, "up")
        turtle.up()
    }

    down() {
        this.ensureFuel()
        this.point = move_point(this.point, "down")
        turtle.down()
    }

    //inventory

    getItemDetail(index: number): { name: string, damage: number, count: number } | null {
        return turtle.getItemDetail(index) as any;
    }

    select(index: number) {
        turtle.select(index)
    }

    // movement API
    turnTo(dir: Direction) {
        if (dir != this.direction) {
            if (dir == counter_clockwise(this.direction)) {
                this.turnLeft()
            } else {
                this.turnRight()
            }
        }
    }

    turnToAxis(dir: Direction) {
        if (dir != reverse(dir))
            this.turnTo(dir)
    }

    move(dir: Direction) {
        if (dir == "up") {
            this.up()
        } else if (dir == "down") {
            this.down()
        } else {
            this.turnTo(dir)
            this.forward()
        }
    }
    dig(dir: Direction) {
        if (dir == "up") {
            if (turtle.detectUp()) {
                turtle.digUp()
            }
        } else if (dir == "down") {
            if (turtle.detectDown()) {
                turtle.digDown()
            }
        } else {
            this.turnTo(dir)
            if (turtle.detect())
                turtle.dig()
        }
    }

    digMove(dir: Direction) {
        this.dig(dir);
        this.move(dir);
    }

    //inventory API

    ensureFuel() {
        let need_fuel = turtle.getFuelLevel() == 0;
        while (need_fuel) {
            let found_item = this.selectItem(["minecraft:coal", "minecraft:coal_block", "minecaft:charcoal"])
            if (found_item) {
                turtle.refuel(1)
                need_fuel = turtle.getFuelLevel() == 0;
            } else {
                print("ERROR: could not find fuel")
                sleep(5)
            }
        }
    }

    selectItem(item: string | string[]): boolean {
        let items = Array.isArray(item) ? item : [item];
        for (let j = 1; j <= 16; j++) {
            let detail = this.getItemDetail(j)
            if (detail && items.includes(detail.name)) {
                this.select(j)
                return true
            }
        }
        return false
    }

}
