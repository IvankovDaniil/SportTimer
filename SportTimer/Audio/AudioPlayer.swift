//
//  AudioPlayer.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 11.07.2025.
//

import AVFAudio


final class AudioPlayer {
    var audioPlayer: AVAudioPlayer?
    var isEnable: Bool {
        if UserDefaults.standard.object(forKey: "isMusicEnable") == nil {
            true
        } else {
            UserDefaults.standard.bool(forKey: "isMusicEnable")
        }
    }
    
    func makeSound(name: String) {
        guard isEnable else {
            return
        }
        
        guard let sound = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound)
            audioPlayer?.play()
        } catch {
        }
    }
    
}
