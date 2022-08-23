//
//  MoviesViewModel.swift
//  tf_matheus_lima
//
//  Created by user219122 on 15/08/22.
//

import Foundation

class MoviesViewModel {
    private let moviesService: MoviesService
    
    var movies:[Movies] = []
    
    init(service: MoviesService) {
        self.moviesService = service
    }
    
    func getMovies() {
            moviesService.getMovies { [weak self] data, error in
                let responseData = try? JSONDecoder().decode(MoviesTopRated.self, from: data!)
                self?.movies = responseData!.results
                
                
        }
    }
}
