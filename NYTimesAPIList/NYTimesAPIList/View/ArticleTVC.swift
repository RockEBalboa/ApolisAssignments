//
//  ArticleTVC.swift
//  NYTimesAPIList
//
//  Created by Ethan Rockel on 10/15/21.
//

import UIKit
import Kingfisher

class ArticleTVC: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bylineLbl: UILabel!
    @IBOutlet weak var publishDateLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    var article: Article?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        populateCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell() {
        titleLbl.numberOfLines = 0
        bylineLbl.numberOfLines = 0
        
        titleLbl.text = article?.title
        bylineLbl.text = article?.byline
        publishDateLbl.text = article?.published_date
        
        if let url = URL(string: article?.multimedia?[0].url ?? "") {
            self.imgView.kf.setImage(with: url)
        }
    }
}
