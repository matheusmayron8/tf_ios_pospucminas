//
//  MoviesDetailsController.swift
//  tf_matheus_lima
//
//  Created by Marcelo on 8/24/22.
//

import Foundation
import UIKit

class MovieDetailsController: UIViewController, MovieDetailsViewModelDelegate {
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    var viewModel: MovieDetailsViewModel?
    var movieId: String = ""
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }

    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.title = "Detalhes do filme"
        
        viewModel = MovieDetailsViewModel(movie: MovieDetailsModel())
        
        print(movieId)
        viewModel?.delegate = self
        viewModel?.fetchMovie(movieId: movieId)
    }
    
    func showMovieInformation(movieDetail: MovieDetails?) {
        DispatchQueue.main.async {
            if let safeMovieDetail = movieDetail {
                self.mainTitle.text = "Título: \(safeMovieDetail.title ?? "Filme")"
                self.voteAverage.text = "Pontuação Média: \(String(safeMovieDetail.voteAverage ?? 0.0))"
                self.voteCount.text = "Total de votos: \(String(safeMovieDetail.voteCount ?? 0))"
                self.view.layoutIfNeeded()
            }
        }
    }
}
