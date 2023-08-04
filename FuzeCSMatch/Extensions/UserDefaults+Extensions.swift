import Foundation

extension UserDefaults {

    var userId: UUID? {
        get {
            guard let id = string(forKey: "userId") else { return nil }
            return UUID(uuidString: id)
        }
        set {
            set(newValue?.uuidString, forKey: "userId")
        }
    }
}