import { readDirection, readTurtleLocation } from "../input";
import { TurtleApi } from "../lib";
import { POKEMON_DATA } from "./pokemon_data";
// @ts-ignore
import { decode } from "../base64"

const POKEMON_BYTES = decode(POKEMON_DATA)

function drawPixel(terminal: ITerminal, xPos: number, yPos: number) {
    terminal.setCursorPos(xPos, yPos)
    terminal.write(" ")
}

function drawPokemonPixel(terminal: ITerminal, color: number, index: number) {
    terminal.setBackgroundColour(2 ** color);
    let x = index % 37;
    let y = Math.floor(index / 37);
    drawPixel(terminal, x, y)
}

function drawPokemon(terminal: ITerminal, number: number) {
    let palette_start = (number - 1) * 512;
    for (let index = 0; index < 16; index++) {
        let palette_index = palette_start + index * 3;
        let [b1, b2, b3] = string.byte(POKEMON_BYTES, palette_index + 1, palette_index + 3);
        let color = (b1 << 16) | (b2 << 8) | b3;
        terminal.setPaletteColor(2 ** index, color);
        // if (index < 8)
        //     print(b1, b2, b3)
    }
    let pixel_start = palette_start + 16 * 3;
    for (let index = 0; index < 37 * 25; index += 2) {
        let byte = string.byte(POKEMON_BYTES, pixel_start + index / 2 + 1)
        let high = byte >>> 4;
        let low = byte & 0xf;
        drawPokemonPixel(terminal, high, index);
        drawPokemonPixel(terminal, low, index + 1);
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
    let monitor = peripheral.wrap("left") as MonitorPeripheral
    monitor.setTextScale(.5)
    // term.setTextScale(.5)
    // term.redirect(monitor)
    // let image = paintutils.parseImage(image_data)!
    // monitor.clear()


    while (true) {
        let last_index = 0;
        let index = 0;
        do {
            index = pickPokemon()
        } while (last_index == index)
        drawPokemon(monitor, index);
        sleep(.5)
    }
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