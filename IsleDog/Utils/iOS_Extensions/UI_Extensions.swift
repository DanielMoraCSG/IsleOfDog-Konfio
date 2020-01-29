//
//  UI_Extensions.swift
//  IsleDog
//
//  Created by Daniel Isaac Mora Osorio on 1/27/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// Helper to generate color with HEX code
    /// - Parameter hex: HEX Code Color
    /// ```
    /// YourElement.color = UIColor(hex: #F8F8F8)
    /// ```
    convenience init(hex: String) {
        var hexString : String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        if hexString.count != 6 {
            // Returns default PDF color to Background
            self.init(red: (97/255), green: (97/255), blue: (97/255), alpha: 1.0)
        }

        var rgb : UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)

        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )

    }
}

public extension UINavigationItem {
    /// Set navigationBar custom to set same style all app (Use for all views)
    /// - Parameter title: Title of view
    /// - Parameter target: Target to activate interaction
    /// - Parameter action: Sender action (@obcj function)
    /// ```
    /// How to use
    /// YourBar = UINavigationItem.setupNavigationBarCustom(
    ///     withBackTitle: "Dogs We Love",
    ///     withTarget: self,
    ///     withAction: #selector(backFlow)
    /// )
    /// ```
    static func setupNavigationBarCustom(withBackTitle title: String, withTarget target: Any, withAction action: Selector) -> [UIBarButtonItem] {
        
        // Setup to navigationBar
        let referenceToController = (target as? UIViewController)
        referenceToController?.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        referenceToController?.navigationController?.navigationBar.barTintColor = UIColor(hex:"#F8F8F8")
        referenceToController?.navigationController?.navigationBar.shadowImage = UIImage()
        referenceToController?.navigationController?.navigationBar.isTranslucent = false
        referenceToController?.title = title
        referenceToController?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.medium)]
        
        
        // Setup to leftBarButtonItem
        let backB = UIButton(type: .system)
        backB.setImage(UIImage(named: "back_icon", in: Bundle(for: ISD_ListOfDogs_VC.self), compatibleWith: nil)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), for: .normal)
        backB.widthAnchor.constraint(equalToConstant: 22).isActive = true
        backB.heightAnchor.constraint(equalToConstant: 22).isActive = true
        backB.addTarget(target, action: action, for: .touchUpInside)
        
        let negativeB = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeB.width = -8
        
        return [UIBarButtonItem(customView: backB), negativeB]
    }
}

// Storage Cache Image = Only for Image Objects
let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    /// This function get image async to return to image into table cell (Load Cache)
    /// - Parameter urlString: URL  as String (Validation here)
    public func imageFromServerURL(urlString: String) {
        
        let spinnerIndicator : UIActivityIndicatorView = {
            let spiner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
            spiner.translatesAutoresizingMaskIntoConstraints = false
            return spiner
        }()
        
        self.image = nil
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.addSubview(spinnerIndicator)
        NSLayoutConstraint.activate([
            spinnerIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            spinnerIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        spinnerIndicator.startAnimating()
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            DispatchQueue.main.async {
                spinnerIndicator.stopAnimating()
                spinnerIndicator.removeFromSuperview()
            }
            self.image = imageFromCache
            return
        }
        guard let urlImage = URL(string: urlString) else{
            DispatchQueue.main.async {
                self.image = UIImage(named: "not_available")
                spinnerIndicator.stopAnimating()
                spinnerIndicator.removeFromSuperview()
            }
            return
        }
        URLSession.shared.dataTask(with: urlImage, completionHandler: { (data, response, error) -> Void in
            if error != nil { // If it's not available, show another storage picture
                print(error.debugDescription)
                DispatchQueue.main.async {
                    self.image = UIImage(named: "not_available")
                    spinnerIndicator.stopAnimating()
                    spinnerIndicator.removeFromSuperview()
                }
                return
            }
            
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            imageCache.setObject(image, forKey: urlString as AnyObject)
            
            DispatchQueue.main.async(execute: { () -> Void in
                spinnerIndicator.stopAnimating()
                spinnerIndicator.removeFromSuperview()
                let image = UIImage(data: data)
                self.image = image
            })

        }).resume()
    }
}

