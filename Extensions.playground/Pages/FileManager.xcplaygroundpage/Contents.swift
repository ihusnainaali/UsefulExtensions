import UIKit
import Foundation

class FileManagerHelper {
    private static let _fileManager = FileManagerHelper()
    
    private let fileManager = FileManager.default
    private let formatter = DateFormatter()
    
    private init() {
        formatter.dateFormat = "dd-MM-yyyy"
    }
    
    class var shared: FileManagerHelper {
        return _fileManager
    }
    
    var documentDirectoryURL: URL {
        return try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    }
    
    func createDirectiry(atUrl url: URL) throws {
        try fileManager.createDirectory(at: url, withIntermediateDirectories: false, attributes: nil)
    }
    
    private func fileExsists(atUrl url: URL) -> Bool {
        return fileManager.fileExists(atPath: url.path)
    }
    
    func contentOfDirectory(atUrl url: URL) throws -> [URL] {
        let content = try fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles)
        return content
    }
    
    func creationDate(atUrl url: URL) throws -> String? {
        let attrs = try fileManager.attributesOfItem(atPath: url.path)
        guard let date = attrs[.creationDate] as? Date else { return nil }
        return formatter.string(from: date)
    }
    
    func createFile(witText text: String, name: String? = nil) throws -> URL {
        guard let data = text.data(using: .utf8) else { throw "i so sorry :(" }
        return try createFile(witData: data)
    }
    
    func createFile(witData data: Data, name: String? = nil) throws -> URL {
        let fileName = name ?? "\(UUID().uuidString).txt"
        let url = documentDirectoryURL.appendingPathComponent(fileName)
        try data.write(to: url, options: .atomic)
        return url
    }
    
    func readFileData(atUrl url: URL) throws -> Data {
        return try Data(contentsOf: url)
    }
    
    func readFileString(atUrl url: URL) throws -> String {
        return try String(contentsOf: url, encoding: .utf8)
    }
}

extension String: Error { }

let fileManager = FileManagerHelper.shared
print(fileManager.documentDirectoryURL)


let url = try? fileManager.createFile(witText: "დონალდი !!!!", name: "example.txt")
print(url?.absoluteString)
print(url?.pathExtension) // გაფართოება
print(url?.lastPathComponent) // სახელი ფაილის

try? fileManager.createFile(witText: "შმუპერ ტექსტი !!!!")

let urls = try fileManager.contentOfDirectory(atUrl: fileManager.documentDirectoryURL)
urls.forEach {
    print($0.lastPathComponent)
    print(try? fileManager.readFileData(atUrl: $0))
    print(try? fileManager.readFileString(atUrl: $0))
}




