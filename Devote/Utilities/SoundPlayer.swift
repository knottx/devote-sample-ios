//
//  SoundPlayer.swift
//  Devote
//
//  Created by Visarut Tippun on 27/3/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(_ sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}
