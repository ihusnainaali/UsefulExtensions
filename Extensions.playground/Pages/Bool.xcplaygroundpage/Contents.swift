import Foundation

extension Bool {
    mutating func toggle() {
        self = !self
    }
}

var value = true
value.toggle()
