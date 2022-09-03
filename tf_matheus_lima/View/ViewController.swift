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
        
        title = "Lista de filmes"
        
        tableView.delegate = self
        tableView.dataSource = self
        viewmodel.delegate = self
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        viewmodel.getMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableViewCell
        let path = self.movies[indexPath.row].posterPath
        
        imageService.image(for: path) { [weak self] image in
                // Update Thumbnail Image View
            self?.tableView.cellForRow(at: indexPath)?.setNeedsLayout()
            (self?.tableView.cellForRow(at: indexPath) as! MovieTableViewCell).movieImgView.image = image
        }
        
        cell.movieLabel?.text = self.movies[indexPath.row].title
        cell.averageLabel.text = String(self.movies[indexPath.row].voteAverage)
        return cell
    }
    	
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           didTapCell(position: indexPath)
    }
    
    func didTapCell(position: IndexPath) {
            performSegue(withIdentifier: "MovieDetailsControllerSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovieDetailsControllerSegue" {
            let backItem = UIBarButtonItem()
            backItem.title = "Voltar"
            navigationItem.backBarButtonItem = backItem
            if let destinationVC = segue.destination as? MovieDetailsController {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    destinationVC.movieId = String(movies[indexPath.row].id)
                    self.tableView.deselectRow(at: indexPath, animated: false)
                }
            }
        }
    }
    
    func reloadMoviesList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

