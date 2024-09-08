import AppKit
import SwiftSoup

let pasteboard = NSPasteboard.general
if let types = pasteboard.types {
    if types.contains(.html) {
        if let htmlData = pasteboard.string(forType: .html) {
            do {
                let doc = try SwiftSoup.parse(htmlData)
                if let murallyElement = try doc.select("murally").first() {
                    let hiddenContent = try murallyElement.attr("hiddenContent")
                    let cleanedContent = hiddenContent.replacingOccurrences(of: "mly://", with: "")

                    if let decoded = Data(base64Encoded: cleanedContent) {
                        let jsonObject = try JSONSerialization.jsonObject(with: decoded, options: [])
                        let ppData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
                        if let ppString = String(data: ppData, encoding: .utf8) {
                            print(ppString)
                        }
                    }
                } else {
                    print("\nNo <murally> element found on pasteboard. Is this from Mural?")
                }

            } catch {
                print("\nFailed to parse HTML content on pasteboard.")
            }

        } else {
            print("\nFailed to retrieve HTML content on pasteboard.")
        }
    } else {
        print("\nNo HTML content found on the pasteboard.")
    }
} else {
    print("No data available on the pasteboard.")
}
