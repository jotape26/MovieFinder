//
//  RemoteImage.swift
//  MovieFinder
//
//  Created by João Leite on 07/01/20.
//  Copyright © 2020 João Leite. All rights reserved.
//

import Combine
import SwiftUI

struct ImageViewContainer: View {
    @ObservedObject var remoteImageURL: ImageLoader

    init(imageUrl: String) {
        remoteImageURL = ImageLoader(urlString: imageUrl)
    }

    var body: some View {
        Image(uiImage: UIImage(data: remoteImageURL.data ?? Data()) ?? UIImage())
            .resizable()
            .frame(width: 70.0, height: 100.0)
    }
}

class ImageLoader: ObservableObject {
    @Published var data:Data?

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
