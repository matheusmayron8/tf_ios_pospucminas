//
//  MoviesDetailsViewModel.swift
//  tf_matheus_lima
//
//  Created by Marcelo on 8/24/22.
//

import Foundation

class MovieDetailsViewModel {
    var movie: MovieDetails?
    // var model: MovieDetailModel
    var model: MovieDetailsModelType
    
    /*init(model: MovieDetailModel) {
        self.model = model
    }*/
    
    init(movie: MovieDetailsModelType) {
        self.model = movie
    }
    
    
    
    func fetchMovie(movieId: String) {
        model.getDetails( movieID: movieId, completion: { [weak self] data, error in
                let responseData = try? JSONDecoder().decode(MovieDetails.self, from: data!)
                self?.movie = responseData
        })
    }
}
