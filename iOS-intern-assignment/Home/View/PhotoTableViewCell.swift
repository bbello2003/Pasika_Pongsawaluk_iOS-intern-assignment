//
//  PhotoTableViewCell.swift
//  iOS-intern-assignment
//
//  Created by Pasika Pongsawaluk on 2/2/2568 BE.
//

import UIKit

struct PhotoTableViewCellViewModel {
    let imageUrl: String
    let name: String
    let description: String
    let positiveVotesCount: String
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class PhotoTableViewCell: UITableViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var positiveVotesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupPhotoCell(viewModel: PhotoTableViewCellViewModel){
        if let imageUrl = URL(string: viewModel.imageUrl) {
            photoImageView.load(url: imageUrl)
        }
        descriptionLabel.text = viewModel.description
        nameLabel.text = viewModel.name
        likeImageView.image = UIImage(named: "like")
        positiveVotesLabel.text = String(viewModel.positiveVotesCount)
    }
}
