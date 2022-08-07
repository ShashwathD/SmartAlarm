//
//  MusicListView.swift
//  SmartAlarm
//
//  Created by Shashwath Dinesh on 8/6/22.
//

import Foundation

class MusicListView {
    func playMusic(name: String) {
        Audio.shared.playSoundEffect(for: name)
    }
    
    func stopMusic() {
        Audio.shared.player.stop()
    }
}
