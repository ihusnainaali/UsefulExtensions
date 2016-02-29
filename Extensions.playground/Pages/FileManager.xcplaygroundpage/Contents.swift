import Foundation

enum Languages: String {
    case Georgian = "GEO"
    case English = "ENG"
    case Russian = "RUS"
}

class IPNFileManager {
    private static let _fileManager = IPNFileManager()
    
    private let fileManager = NSFileManager.defaultManager()
    private let formmater = NSDateFormatter()
    
    private init() {
        formmater.dateFormat = "dd-MM-yyyy"
        createSuperDirectoies()
    }
    
    // return Singleton
    class func sharedManager() -> IPNFileManager {
        return _fileManager
    }
    
    var mainDirectoryPath: NSURL {
        return try! fileManager.URLForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: false)
    }
    
    var mainActiveDirectory: NSURL {
        return mainDirectoryPath.URLByAppendingPathComponent("GEO")
    }
    
    private func createSuperDirectoies() {
        let languages: [Languages] = [.Georgian, .English, .Russian]
        for item in languages {
            let path = mainDirectoryPath.URLByAppendingPathComponent(item.rawValue)
            createDirectiry(path)
        }
    }
    
    private func createDirectiry(path: NSURL) {
        try? fileManager.createDirectoryAtURL(path, withIntermediateDirectories: false, attributes: nil)
    }
    
    private func isFileExsists(path: NSURL) -> Bool {
        guard let pathAsString = path.path else {
            return false
        }
        return fileManager.fileExistsAtPath(pathAsString)
    }
    
    func currentDateInString(date: NSDate) -> String {
        return formmater.stringFromDate(date)
    }
    
    func contentOfDirectory(path: NSURL) -> [NSURL] {
        do {
            let content = try fileManager.contentsOfDirectoryAtURL(path, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles)
            return content
        }
        catch {
            
        }
        
        return []
    }
    
    func fileCreateDate(path: NSURL) -> String? {
        guard let pathAsString = path.path else {
            return nil
        }
        do {
            let attrs = try fileManager.attributesOfItemAtPath(pathAsString)
            guard let date = attrs[NSFileCreationDate] as? NSDate else {
                return nil
            }
            return currentDateInString(date)
        }
        catch {
            
        }
        
        return nil
    }
    
    func createFile(text: String, fileName: String) throws {
        // create current date folder in active main directory
        let currentDateFolder = mainActiveDirectory.URLByAppendingPathComponent(currentDateInString(NSDate()))
        createDirectiry(currentDateFolder)
        // path for txt file
        let filePath = currentDateFolder.URLByAppendingPathComponent(fileName)
        try text.writeToURL(filePath, atomically: true, encoding: NSUTF8StringEncoding)
    }
}

let fileManager = IPNFileManager.sharedManager()
print(fileManager.mainDirectoryPath)
print(fileManager.mainActiveDirectory)

try! fileManager.createFile("ეს არის ძალიან საიტერესო ტექსტი", fileName: "example.txt")

let subDirectoryes = fileManager.contentOfDirectory(fileManager.contentOfDirectory(fileManager.mainActiveDirectory).first!)

print(subDirectoryes)

for item in subDirectoryes {
    
    print(fileManager.fileCreateDate(item)!)
}
