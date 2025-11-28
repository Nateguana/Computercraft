import { readDirection, readTurtleLocation } from "../input";
import { TurtleApi } from "../lib";

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