//
//  MovieDetailsModel.swift
//  tf_matheus_limaTests
//
//  Created by Marcelo on 9/2/22.
//

import XCTest
@testable import tf_matheus_lima

class tf_matheus_limaTests: XCTestCase {
    
    func testExample() throws {
        // Arranje
        let model = MovieDetailsModelMock()
        let viewModel = MovieDetailsModel(movie: model)
        
        
        // Act
        viewModel.getDetails()
        
        // Assert
        XCTAssert(model.didCalledGetMoviesTimes == 1)
    }

    
}
