//
//  ContentView.swift
//  SwiftStudy-7
//
//  Created by 윤강록 on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var stopWatchManager = StopWatchManager()

    var body: some View {
        ZStack {
            Color.black
            VStack(spacing: 0) {
                ZStack{
                    
                    Button(action: {
                        stopWatchManager.reset()
                        print("reset")
                    }) {
                        Text("Reset")
                            .foregroundColor(.white)
                            .position(x: 350, y: 100)
                    }
                    
                    Text(String(format: "%.1f",stopWatchManager.secondsElpsed))
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .frame(width: 400)
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        ZStack {
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: geometry.size.width / 2, height: 350)

                            Button(action: {
                                stopWatchManager.start()
                                print("play")
                            }) {
                                Image(systemName: "play.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 50))
                            }
                        }

                        ZStack {
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: geometry.size.width / 2, height: 350)

                            Button(action: {
                                stopWatchManager.pause()
                                print("pause")
                            }) {
                                Image(systemName: "pause.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 50))
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

