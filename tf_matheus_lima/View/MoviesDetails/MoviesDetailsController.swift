//
//  MoviesDetailsController.swift
//  tf_matheus_lima
//
//  Created by Marcelo on 8/24/22.
//

import Foundation
import UIKit

class MovieDetailsController: UIViewController {
    
    var viewModel: MovieDetailsViewModel?
    var movieId: String
    var movie: MovieDetails? {
        DispatchQueue.main.async { [weak self] in
            self?.mainTitle.text = "Título: \(self?.viewModel?.movie?.title ?? "Carregando Informações...")"
            self?.voteAverage.text = "Pontuação Média: \(String(self?.viewModel?.movie?.voteAverage ?? 0.0))"
            self?.voteCount.text = "Total de votos: \(String(self?.viewModel?.movie?.voteCount ?? 0))"
        }
        
        return viewModel?.movie
    }
    
    init(movieId: String) {
        self.movieId = movieId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        self.view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // viewModel = MovieDetailsViewModel (model: MovieDetailModel())
        
        viewModel = MovieDetailsViewModel(movie: MovieDetailsModel())
             
        viewModel?.fetchMovie(movieId: movieId)
        view.addSubview(mainTitle)
        view.addSubview(voteAverage)
        view.addSubview(voteCount)
        
        view.layoutIfNeeded()
        setupConstraints()
    }
    
    func setupConstraints() {
        mainTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        mainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mainTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        
        voteAverage.topAnchor.constraint(equalTo: mainTitle.topAnchor, constant: 40).isActive = true
        voteAverage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        voteAverage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        
        voteCount.topAnchor.constraint(equalTo: voteAverage.topAnchor, constant: 40).isActive = true
        voteCount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        voteCount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
    }
    
    lazy var mainTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.text = movie?.title
        print(view.text)
        return view
    }()
    
    lazy var voteAverage: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.text = String(movie?.voteAverage ?? 0.0)
        
        return view
    }()
    
    
    lazy var voteCount: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.text = String(movie?.voteCount ?? 0)
        
        return view
    }()
}
