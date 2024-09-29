import * as fs from 'fs';

const input = fs.readFileSync('/dev/stdin', 'utf8').split('\n');
let lineIndex = 0;

const readLine = () => input[lineIndex++];
const readNumbers = () => readLine().split(' ').map(Number);
const readStrings = () => readLine().split(' ').map(String);

function main() {
    // ここにコードを書く
    const [N, M] = readNumbers();
    console.log(N, M);
}

main();
