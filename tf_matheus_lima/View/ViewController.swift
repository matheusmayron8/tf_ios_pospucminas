//
//  ViewController.swift
//  tf_matheus_lima
//
//  Created by user219122 on 15/08/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MoviesViewModelDelegate {

    @IBOutlet weak var tableView: UITableView!
    private var viewmodel: MoviesViewModel!
    
    
    private lazy var imageService = ImageService()
    var movies: [Movies] {
        viewmodel.movies
    }
    /*var movies: [Movies] = [Movies(adult: false, backdropPath: "teste", genreIDS: [1], id: 1, originalLanguage: "pt", originalTitle: "Teste", overview: "Teste", popularity: 10, posterPath: "teste", releaseDate: "teste", title: "Teste", video: true, voteAverage: 10, voteCount: 10)]*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel = MoviesViewModel(service: MoviesService())
        
        tableView.delegate = self
        tableView.dataSource = self
        viewmodel.delegate = self
        
        viewmodel.getMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let path = self.movies[indexPath.row].posterPath
        
        imageService.image(for: path) { [weak self] image in
                // Update Thumbnail Image View
                //cell.imageView?.image = image
                self?.tableView.cellForRow(at: indexPath)?.setNeedsLayout()
                self?.tableView.cellForRow(at: indexPath)?.imageView?.image = image
        }
        
        cell.textLabel?.text = self.movies[indexPath.row].title
        return cell
    }
    	
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           didTapCell(position: indexPath)
    }
    
    func didTapCell(position: IndexPath) {
            let id = String(movies[position.row].id)
            self.present(MovieDetailsController(movieId: id), animated: true)
    }
    
    func reloadMoviesList() {
        tableView.reloadData()
    }

}

