//
//  ISD_DogCell.swift
//  IsleDog
//
//  Created by Daniel Isaac Mora Osorio on 1/28/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import UIKit

class ISD_DogCell: UITableViewCell {
    
    var imageDog : UIImageView = {
        let image = UIImageView(frame: CGRect.zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = false
        return image
    }()
    
    var contentDogInfo : UIView = {
        let view = UIView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    var name_label: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorCompatibility.label
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    
    var description_label : UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorCompatibility.label
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.light)
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    
    var edad_label : UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorCompatibility.label
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
        label.text = ""
        return label
    }()
    
    lazy var stackVertical : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [name_label,description_label,edad_label])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = UIStackView.Distribution.fillProportionally
        stack.axis = NSLayoutConstraint.Axis.vertical
        stack.spacing = 10
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        [contentDogInfo,imageDog].forEach({ self.addSubview($0) })
        contentDogInfo.addSubview(stackVertical)
        
        NSLayoutConstraint.activate([
            imageDog.topAnchor.constraint(equalTo: self.topAnchor),
            imageDog.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageDog.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageDog.heightAnchor.constraint(equalToConstant: 180),
            imageDog.widthAnchor.constraint(equalToConstant: 120),
            contentDogInfo.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentDogInfo.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentDogInfo.leftAnchor.constraint(equalTo: imageDog.rightAnchor, constant: -8),
            stackVertical.topAnchor.constraint(equalTo: contentDogInfo.topAnchor, constant: 14),
            stackVertical.rightAnchor.constraint(equalTo: contentDogInfo.rightAnchor),
            stackVertical.leftAnchor.constraint(equalTo: contentDogInfo.leftAnchor, constant: 20),
            stackVertical.bottomAnchor.constraint(equalTo: contentDogInfo.bottomAnchor, constant: -33)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
