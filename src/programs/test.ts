import { TurtleApi } from "../lib"

export default function main() {
    let api = new TurtleApi()

    while (true) {
        api.digMove("north")
        api.digMove("east")
        api.digMove("south")
        api.digMove("west")

        api.digMove("up")
        api.digMove("down")

    }
}

