//
//  MovieTableViewCell.swift
//  tf_matheus_lima
//
//  Created by user219122 on 31/08/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieView: UIView!
    @IBOutlet weak var movieImgView: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImgView.layer.cornerRadius = movieImgView.bounds.width / 50
        movieImgView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
