//
//  MoviesDetailsViewModel.swift
//  tf_matheus_lima
//
//  Created by Marcelo on 8/24/22.
//

import Foundation

protocol MovieDetailsViewModelDelegate: AnyObject {
    //func getDetails(movieId: Movies)
    func showMovieInformation(movieDetail: MovieDetails?)
}

class MovieDetailsViewModel {
    weak var delegate: MovieDetailsViewModelDelegate?
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
        print(movieId)
        model.getDetails( movieID: movieId, completion: { [weak self] data, error in
                let responseData = try? JSONDecoder().decode(MovieDetails.self, from: data!)
                self?.movie = responseData
                self?.delegate?.showMovieInformation(movieDetail: responseData)
        })
    }
}
