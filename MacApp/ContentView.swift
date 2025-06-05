import SwiftUI
import AppKit

struct ContentView: View {
    @State private var category = "7"
    @State private var password = "123-45-678"
    @State private var setupID = "1QJ8"
    @State private var macAddress = "001122334455"
    @State private var image: NSImage?
    @State private var isGenerating = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Form {
                HStack {
                    Text("Category")
                    TextField("Category", text: $category)
                }
                HStack {
                    Text("Password")
                    TextField("123-45-678", text: $password)
                }
                HStack {
                    Text("Setup ID")
                    TextField("1QJ8", text: $setupID)
                }
                HStack {
                    Text("MAC Address")
                    TextField("001122334455", text: $macAddress)
                }
            }
            HStack {
                Button("Generate") { generate() }
                    .disabled(isGenerating)
                if image != nil {
                    Button("Save…") { save() }
                }
            }
            if let img = image {
                ScrollView {
                    Image(nsImage: img)
                        .interpolation(.high)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 400, maxHeight: 400)
                        .padding()
                }
            }
        }
        .padding()
        .frame(minWidth: 480, minHeight: 520)
    }

    private func generate() {
        isGenerating = true
        let temp = FileManager.default.temporaryDirectory.appendingPathComponent("qrcode.png")
        QRCodeLabelGenerator.generate(category: category, password: password, setupID: setupID, macAddress: macAddress, outputURL: temp) { img in
            image = img
            isGenerating = false
        }
    }

    private func save() {
        guard let img = image else { return }
        let panel = NSSavePanel()
        panel.allowedFileTypes = ["png"]
        panel.nameFieldStringValue = "qrcode.png"
        if panel.runModal() == .OK, let url = panel.url {
            img.pngWrite(to: url)
        }
    }
}

private extension NSImage {
    func pngWrite(to url: URL) {
        guard let tiffData = self.tiffRepresentation,
              let bitmap = NSBitmapImageRep(data: tiffData),
              let data = bitmap.representation(using: .png, properties: [:]) else { return }
        try? data.write(to: url)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
