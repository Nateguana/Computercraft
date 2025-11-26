export type Direction = "up" | "down" | "north" | "south" | "east" | "west";

export interface Point {
    x: number,
    y: number,
    z: number
}

export interface Location {
    point: Point,
    direction: Direction
}

function dir_to_number(dir: Direction) {

}

export function turn_to(dir: Direction) {
    turtle.turnLeft()
}