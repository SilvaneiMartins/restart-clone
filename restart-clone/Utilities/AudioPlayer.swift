//
//  AudioPlayer.swift
//  restart-clone
//
//  Created by Silvanei  Martins on 16/09/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Não foi possível reproduzir o arquivo de som")
        }
    }
}
