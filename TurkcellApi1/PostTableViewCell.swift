//
//  PostTableViewCell.swift
//  TurkcellApi1
//
//  Created by Sefa Aycicek on 18.09.2024.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPostTitle: UILabel!
    @IBOutlet weak var lblPostBody: UILabel!
    
    func configure(cellViewModel : PostCellViewModel) {
        lblPostTitle.text = cellViewModel.title
        lblPostBody.text = cellViewModel.body
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
