# Bootsector Example
A very basic bootsector example for x86 (NASM)

### How to get started
Install Requirements (debian based)
```bash
sudo apt-get update
sudo apt-get install nasm qemu
```

Get Repository

```bash
git clone https://github.com/rainerzufalldererste/bootsector.git
cd bootsector
```

Assemble & Run
```
nasm bootsector.asm -o bootsector.bin
qemu-system-x86_64 -drive format=raw,file=bootsector.bin --nographic --curses
```

To close the VM press <kbd>Ctrl</kbd>+<kbd>A</kbd> then <kbd>X</kbd>.