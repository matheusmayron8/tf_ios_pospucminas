//
//  ImageService.swift
//  tf_matheus_lima
//
//  Created by user219549 on 8/23/22.
//

import Foundation

import UIKit

final class ImageService {

    // MARK: - Public API

    func image(for posterPath: String, completion: @escaping (UIImage?) -> Void) {
        let url = URL(string: "https://image.tmdb.org/t/p/original" + posterPath)!
        print(url)
        URLSession.shared.dataTask(with: url) { data, _, _ in
            // Helper
            var image: UIImage?

            defer {
                // Execute Handler on Main Thread
                DispatchQueue.main.async {
                    // Execute Handler
                    completion(image)
                }
            }

            if let data = data {
                // Create Image from Data
                image = UIImage(data: data)
            }
        }.resume()
    }

}
