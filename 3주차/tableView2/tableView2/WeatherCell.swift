//
//  WeatherCell.swift
//  tableView2
//
//  Created by 김태훈 on 2020/05/11.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    static let identifier:String = "weatherCell"

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setDateInformation(weatherImageName: String, date: String, subTitle: String) {
        weatherImage.image = UIImage(named: weatherImageName)
        dateLabel.text = date
        subtitleLabel.text = subTitle
    }
}
