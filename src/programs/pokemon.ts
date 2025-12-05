import { readDirection, readTurtleLocation } from "../input";
import { TurtleApi } from "../lib";
import { POKEMON_DATA } from "./pokemon_data";
// @ts-ignore
import { decode } from "../lua/base64"
import { DecompressZlib } from "../lua/libdeflate"

// function drawPixel(terminal: ITerminal, xPos: number, yPos: number) {
//     terminal.setCursorPos(xPos, yPos)
//     terminal.write(" ")
// }

function drawPokemon(terminal: ITerminal, poke_data: string, number: number) {
    let palette_start = (number - 1) * 480;
    for (let index = 0; index < 16; index++) {
        let palette_index = palette_start + index * 3;
        let [b1, b2, b3] = string.byte(poke_data, palette_index + 1, palette_index + 3);
        let color = (b1 << 16) | (b2 << 8) | b3;
        terminal.setPaletteColor(2 ** index, color);
    }
    let pixel_start = palette_start + 16 * 3;
    for (let y = 0; y < 24; y++) {
        terminal.setCursorPos(1, y + 1)
        for (let x = 0; x < 18; x++) {
            let byte = string.byte(poke_data, pixel_start + y * 18 + x + 1)
            let high = byte >>> 4;
            let low = byte & 0xf;
            terminal.setBackgroundColour(2 ** high);
            terminal.write(" ")
            terminal.setBackgroundColour(2 ** low);
            terminal.write(" ")
        }
    }
}

function pickPokemon(): number {
    if (math.random(1, 4) == 1) {
        let better = [428, 134, 282]
        let random = math.random(1, better.length)
        return better[random - 1]
    } else {
        return math.random(1, 1025)
    }
}

export default function Main() {
    print("Loading Pokemon Data")
    const poke_data = DecompressZlib(decode(POKEMON_DATA))!
    print("Finished")

    let monitor = peripheral.wrap("left") as MonitorPeripheral;
    monitor.setTextScale(.5)
    // term.setTextScale(.5)
    // term.redirect(monitor)
    // let image = paintutils.parseImage(image_data)!
    monitor.clear()


    while (true) {
        let last_index = 0;
        let index = 0;
        do {
            index = pickPokemon()
        } while (last_index == index)
        drawPokemon(monitor, poke_data, index);
        sleep(.5)
    }

    // drawPokemon(monitor, poke_data, 428)
    // for (let index = 0; index < pallete.length; index++) {
    //     monitor.setPaletteColor(2 ** index, pallete[index])
    // }

    // for (let y = 0; y < 25; y++) {
    //     for (let x = 0; x < 37; x++) {
    //         monitor.setBackgroundColor(2 ** image_data[y * 37 + x])
    //         drawPixel(monitor, x, y)
    //     }
    // }
    // paintutils(image, 0, 0)
}