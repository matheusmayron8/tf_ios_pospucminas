//
//  ViewController.swift
//  tf_matheus_lima
//
//  Created by user219122 on 15/08/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var viewmodel: MoviesViewModel!
    
    var movies: [Movies] {
        viewmodel.movies
    }
    /*var movies: [Movies] = [Movies(adult: false, backdropPath: "teste", genreIDS: [1], id: 1, originalLanguage: "pt", originalTitle: "Teste", overview: "Teste", popularity: 10, posterPath: "teste", releaseDate: "teste", title: "Teste", video: true, voteAverage: 10, voteCount: 10)]*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel = MoviesViewModel(service: MoviesService())
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewmodel.getMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.movies[indexPath.row].title
        return cell
    }
    	
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }


}

