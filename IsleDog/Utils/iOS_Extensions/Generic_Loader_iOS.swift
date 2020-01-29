//
//  Generic_Loader_iOS.swift
//  IsleDog
//
//  Created by Daniel Isaac Mora Osorio on 1/28/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import UIKit

/// Generic loader help to show when wait for data and indicate to user that stay in app
class Generic_Loader_iOS: UIView {
    
    private var indicator: UIActivityIndicatorView?

    public init(superviewForIndicatorActivity: UIView) {
        super.init(frame: superviewForIndicatorActivity.frame)
        backgroundColor = .white
        
        let percentage = UIScreen.main.bounds.width*0.5
        indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator?.color = .black
        indicator?.center = superviewForIndicatorActivity.center
        addSubview(indicator!)
        
        NSLayoutConstraint.activate([
            indicator!.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicator!.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indicator!.heightAnchor.constraint(equalToConstant: percentage),
            indicator!.widthAnchor.constraint(equalToConstant: percentage)
        ])
        
        indicator!.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// This function remove from superview Indicator Loader
    public func removeIndicator(){
        indicator?.stopAnimating()
        self.removeFromSuperview()
    }

}
