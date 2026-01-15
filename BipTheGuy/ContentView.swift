//
//  ContentView.swift
//  BipTheGuy
//
//  Created by Kiran Shrestha on 1/15/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var audioPlayer : AVAudioPlayer!
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("clown")
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    playSound("punchSound")
                }
            
            Spacer()
            
            Button {
                //TODO: Button action here
            } label: {
                Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
            }

        }
        .padding()
    }
    
    func playSound(_ name: String) {
        if audioPlayer != nil, audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: name) else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        }
        catch {
            print("Issue occured during sound play: \n\(error)")
        }
    }
}

#Preview {
    ContentView()
}
