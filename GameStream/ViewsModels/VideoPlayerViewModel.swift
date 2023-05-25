//
//  VideoPlayerViewModel.swift
//  GameStream
//
//  Created by user239477 on 5/25/23.
//

import Foundation
import AVKit

class VideoPlayerViewModel: ObservableObject {
    @Published var player: AVPlayer

    init(url: URL) {
        self.player = AVPlayer(url: url)
    }
}
