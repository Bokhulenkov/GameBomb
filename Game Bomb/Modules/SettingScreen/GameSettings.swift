//
//  GameSettings.swift
//  Game Bomb
//
//  Created by Alexander Bokhulenkov on 15.02.2025.
//

import Foundation

final class GameSettings {
//    MARK: - Properties
    static let shared = GameSettings()
    
    private let key = "gameSettings"
    private var defaultSettings: Settings
    
//    MARK: - Init
    init() {
        self.defaultSettings = Settings(time: 5, bombMusic: SoundFiles.soundBomb, boomMusic: SoundFiles.soundBoom)
    }
    
    func saveGameSettings(_ settings: Settings) {
        let encoder = JSONEncoder()
        
        if let encodedSettings = try? encoder.encode(settings) {
            UserDefaults.standard.set(encodedSettings, forKey: key)
        }
    }
    
    func getGameSettings() {
        
    }
}

struct Settings: Codable {
    var time: Int
//    var music: String
    var bombMusic: String
    var boomMusic: String
    
    init(time: Int, bombMusic: String, boomMusic: String) {
        self.time = time
        self.bombMusic = bombMusic
        self.boomMusic = boomMusic
    }
}
