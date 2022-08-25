//
//  OnboardingCollectionViewCell.swift
//  NRC
//
//  Created by Kay on 2022/08/25.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var onboardingImageView: UIImageView!
    @IBOutlet weak var onboardingTitleLabel: UILabel!
    @IBOutlet weak var onboardingDescriptionLabel: UILabel!
    
    func configure(_ message: OnboardingMessage) {
        onboardingImageView.image = UIImage(named: message.imageName)
        onboardingTitleLabel.text = message.title
        onboardingDescriptionLabel.text = message.description
    }
}
