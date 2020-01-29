//
//  ISD_Dogs_Entity.swift
//  IsleDog
//
//  Created by Daniel Isaac Mora Osorio on 1/27/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import Foundation
import RealmSwift

class ISD_Dogs_Entity: Object, Decodable {
    @objc dynamic var dogName: String = ""
    @objc dynamic var descriptionDog: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var url: String = ""
    
    enum CodingKeys: String, CodingKey {
        case dogName        = "dogName"
        case descriptionDog = "description"
        case age            = "age"
        case url            = "url"
    }
    
    convenience init(name: String, description: String, age: Int, url: String) {
        self.init()
        self.dogName = name
        self.descriptionDog = description
        self.age = age
        self.url = url
    }
    
    public func getURL() -> String {
        return self.url.replacingOccurrences(of: " ", with: "")
    }
    
    public func getAge() -> String {
        return (age > 1 ? "Almost \(age) years" : "Almost \(age) year")
    }
    
    public func haveInfo() -> Bool {
        return (self.descriptionDog.count > 3 ? true : false)
    }
}
