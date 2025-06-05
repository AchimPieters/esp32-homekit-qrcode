import Foundation
import AppKit

struct QRCodeLabelGenerator {
    static func generate(category: String, password: String, setupID: String, macAddress: String, outputURL: URL, completion: @escaping (NSImage?) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let scriptPath = Bundle.main.path(forResource: "gen_qrcode", ofType: nil) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }

            let process = Process()
            process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
            process.currentDirectoryURL = URL(fileURLWithPath: (scriptPath as NSString).deletingLastPathComponent)
            process.arguments = ["python3", scriptPath, category, password, setupID, macAddress, outputURL.path]

            let pipe = Pipe()
            process.standardOutput = pipe
            process.standardError = pipe

            do {
                try process.run()
                process.waitUntilExit()
            } catch {
                DispatchQueue.main.async { completion(nil) }
                return
            }

            let img = NSImage(contentsOf: outputURL)
            DispatchQueue.main.async { completion(img) }
        }
    }
}
