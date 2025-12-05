
import { readFileSync, writeFileSync } from "fs"
import clipboard from "clipboardy"
import luamin from "luamin"

let code = readFileSync("./dist/build.lua", { encoding: "utf8" })

let code2 = luamin.minify(code)

writeFileSync("./dist/build2.lua",code2)


let url = "https://gamestream.stream/file/set"
let headers = { "Content-Type": "application/octet-stream" }
const RUN_COMMAND = "wget run https://gamestream.stream/file/get"

// # print(data)

fetch(url, { method: "POST", body: code, headers })
    .then(async res => {
        if (res.ok) {
            console.log(RUN_COMMAND)
            clipboard.writeSync(RUN_COMMAND)
        } else {
            console.log("Error sending new file")
            console.log(await res.text())
        }
    }).catch(err => {
        console.log("Error sending new file")
        console.log(err)
    })