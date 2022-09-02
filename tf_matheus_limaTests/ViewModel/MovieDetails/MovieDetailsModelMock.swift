//
//  MovieDetailsModelMock.swift
//  tf_matheus_limaTests
//
//  Created by Marcelo on 9/2/22.
//

import Foundation
@testable import tf_matheus_lima

class MovieDetailsModelMock: MovieDetailsModelType {
    var didCalledGetMoviesTimes = 0
    
    func getDetails(movieID: String, completion: @escaping(Data?, Error?) -> Void ) {
        didCalledGetMoviesTimes += 1
    }
}
