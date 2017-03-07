//
//  HomeTableViewCell.swift
//  TheChart
//
//  Created by Ariela Cohen on 3/6/17.
//  Copyright © 2017 Ariela Cohen. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {


    var profileImage = UIImageView()
    var nameLabel = UILabel ()
    var ageLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutElements()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layoutElements()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutElements()
        
    }
    
    func layoutElements() {
        

        self.contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.25).isActive = true
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = UIColor.orange
        
        self.contentView.addSubview(ageLabel)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        ageLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor).isActive = true
        ageLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor).isActive = true
        ageLabel.textColor = UIColor.black
        ageLabel.textAlignment = .center
        ageLabel.backgroundColor = UIColor.yellow
        
        self.contentView.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        profileImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        profileImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25).isActive = true
        profileImage.backgroundColor = UIColor.red
        profileImage.layer.cornerRadius = 20
        profileImage.layer.borderWidth = 2
//        profileImage.layer.borderColor = CG
        profileImage.clipsToBounds = true
        
        
    }

}
