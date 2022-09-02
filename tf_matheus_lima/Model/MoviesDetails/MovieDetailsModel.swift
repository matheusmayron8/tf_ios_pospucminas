//
//  MovieDetailsModel.swift
//  tf_matheus_lima
//
//  Created by Marcelo on 8/24/22.
//

import Foundation

protocol MovieDetailsModelType {
    func getDetails(movieID: String, completion: @escaping(Data?, Error?) -> Void )-> Void
}

// class MovieDetailModel {
class MovieDetailsModel: MovieDetailsModelType {
    
    
    func getDetails(movieID: String, completion: @escaping(Data?, Error?) -> Void )-> Void {
        URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/movie/\(movieID)?api_key=9c3103928c7fe54f47a6a21da1e9893e")!,
           completionHandler: { (data, response, error) in
                completion(data, error)
            }
        ).resume()
    }
}
