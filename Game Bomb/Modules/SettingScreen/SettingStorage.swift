import Foundation

final class SettingStorage {
    static let shared = SettingStorage()
    
    private let defaults = UserDefaults.standard
    
    init() {
        registerDefaults()
    }
    
    private func registerDefaults() {
        let defaultValues: [String: String] = [
            SoundType.music.rawValue: SoundType.music.defaultFileName,
            SoundType.bomb.rawValue: SoundType.bomb.defaultFileName,
            SoundType.boom.rawValue: SoundType.boom.defaultFileName
        ]
        defaults.register(defaults: defaultValues)
    }
    func save<T>(value: T, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func get<T>(key: String) -> T? {
        return UserDefaults.standard.object(forKey: key) as? T
    }
    
    func remove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
