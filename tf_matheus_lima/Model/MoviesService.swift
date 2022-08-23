//
//  MoviesService.swift
//  tf_matheus_lima
//
//  Created by user219122 on 15/08/22.
//

import Foundation


class MoviesService {
    func getMovies(completion: @escaping (Data?, Error?) -> Void) -> Void {
        URLSession.shared.dataTask(with: URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=9c3103928c7fe54f47a6a21da1e9893e")!, completionHandler: { (data, response, error) in
            completion(data, error)
        }).resume()
    }
    
    func getImage(movieId:Int, completion: @escaping (Data?, Error?) -> Void) -> Void {
        let url = URL(string: "https://api.themoviedb.org/3/movie/$movieId/images??api_key=9c3103928c7fe54f47a6a21da1e9893e")
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            completion(data, error)
        }).resume()
        
    }
}
