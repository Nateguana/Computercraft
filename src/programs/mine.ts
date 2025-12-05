import { readDirection, readTurtleLocation } from "../input";
import { Point, TurtleApi, RectanglePrism } from "../lib";

function minePlus(api: TurtleApi, start: Point, end: Point) {
    let rect = new RectanglePrism(start, end);
    let loc = api.getLocation();
    if (rect.isInside({ ...loc, y: loc.y + 1 }))
        api.dig("up")
    if (rect.isInside({ ...loc, y: loc.y - 1 }))
        api.dig("down")
    if (rect.isInside({ ...loc, x: loc.x - 1 }))
        api.dig("east")
    if (rect.isInside({ ...loc, x: loc.x + 1 }))
        api.dig("west")
}

export default function Main() {
    let starting_location = readTurtleLocation()
    let api = new TurtleApi(...starting_location)

    while (true) {
        api.digMove("north")
        api.digMove("north")
        api.digMove("east")
        api.digMove("east")
        api.digMove("south")
        api.digMove("south")
        api.digMove("west")
        api.digMove("west")

        api.digMove("up")
        api.digMove("up")
        api.digMove("down")
        api.digMove("down")

    }
}