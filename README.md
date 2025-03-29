# ESP32-Homekit-QRCode

Easily generate HomeKit QR code labels for your ESP32 accessories!  
This Python tool automatically creates a print-ready label including:

- HomeKit Setup Code (with QR code)
- Device Code
- MAC Address
- Serial Number (with barcode)
- CSN (with barcode)
- Neatly aligned and aesthetic layout

Perfect for professionally labeling your DIY HomeKit projects.

![label example](https://raw.githubusercontent.com/AchimPieters/esp32-homekit-qrcode/images/example.png)

---

## 📦 Requirements

- Python 3.10+
- Pillow  
  ```bash
  pip install pillow
  ```
- qrcode  
  ```bash
  pip install qrcode[pil]
  ```
- `LibreBarcode39-Regular.ttf` (included in the repo)
- High-resolution label template (`qrcode_ext.png` is provided)

---

## ⚙️ Installation

Clone the repository:

```bash
git clone https://github.com/AchimPieters/esp32-homekit-qrcode.git
cd esp32-homekit-qrcode
```

Install dependencies:

```bash
pip install -r requirements.txt
```

---

## 🚀 Usage

To generate a label, run:

```bash
python main.py
```

Each run creates a unique label inside the `/output/` directory, containing:

- A valid HomeKit setup code
- A unique serial number and CSN
- Auto-generated barcodes
- A QR code following Apple HomeKit standards

---

## 🖨️ Printing

The generated PNG file is ready for printing on white label stickers.  
For best results, use a laser printer or a high-resolution inkjet printer.

---

## 🧠 How It Works

1. Loads the label template (`qrcode_ext.png`)
2. Generates a random HomeKit setup code
3. Creates a QR code
4. Generates device info (MAC, Serial Number, CSN)
5. Positions all elements aesthetically
6. Exports a finished label to `/output/label_xxxxxx.png`

---

## 🧩 Integration

Use together with your own HomeKit firmware:  
👉 [ESP32-Homekit](https://github.com/AchimPieters/esp32-homekit)

---

## ❤️ Credits

- [Pillow](https://python-pillow.org/)
- [qrcode](https://github.com/lincolnloop/python-qrcode)
- [LibreBarcode39](https://fonts.google.com/specimen/Libre+Barcode+39)

---

## 📫 Contact

Questions or suggestions? Reach out:  
👉 [www.studiopieters.nl](https://www.studiopieters.nl)  
👉 [@AchimPieters on GitHub](https://github.com/AchimPieters)
