### The pins

SCL - D1 (pin 5)
SDA - D2 (pin 4)

### To find out the port

```bash
mode
```

### To setup esp
```bash
esptool.py --port <your port> write_flash -fm dio 0x00000 <your path>\nodemcu-master-15-modules-2018-02-03-17-33-50-float.bin
```
