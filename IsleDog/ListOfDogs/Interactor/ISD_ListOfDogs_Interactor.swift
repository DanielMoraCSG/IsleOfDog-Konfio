//
//  ISD_ListOfDogs_Interactor.swift
//  IsleDog
//
//  Created by Daniel Isaac Mora Osorio on 1/27/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import Foundation
import RealmSwift

class ISD_ListOfDogs_Interactor: ISD_ListOfDogs_PresenterToInteractorProtocol {
    var presenter: ISD_ListOfDogs_InteractorToPresenterProtocol?
    var realm : Realm!
    var listOfDogs: Results<ISD_Dogs_Entity>?{
        get {
            realm.objects(ISD_Dogs_Entity.self)
        }
    }
    let _url = "https://api.myjson.com/bins/kp2e8"
    
    func getDogsList_Interactor() {
        guard let url = URL(string: _url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{ return }
            do{
                // Uncomment just this line for load storage from Database
//                self.getDogListFromDB()
                // Comment next 3 lines to test Load storage form Database
                let listOfDogs = try JSONDecoder().decode([ISD_Dogs_Entity].self, from: data)
                DispatchQueue.main.async {
                    self.presenter?.setDogsList_Presenter(listOfDogs: listOfDogs)
                }
                self.setElementToDB(dogs: listOfDogs)
                // Uncomment this line for testing offline services
//                self.presenter?.setError_Presenter(error: "Error de conexion")
            }catch _ {
                self.getDogListFromDB()
            }
            
        }.resume()
    }
    
    private func setElementToDB(dogs: [ISD_Dogs_Entity]){
        DispatchQueue.main.async {
            self.realm = try! Realm()
            try! self.realm.write {
                for dog in dogs{
                    if !(self.listOfDogs?.contains(dog) ?? true){
                        self.realm.add(dog)
                    }
                }
            }
        }
    }
    
    private func getDogListFromDB(){
        DispatchQueue.main.async {
            self.realm = try! Realm()
            let dogs = self.realm.objects(ISD_Dogs_Entity.self)
            var list : [ISD_Dogs_Entity] = []
            for dog in dogs{
                list.append(dog)
            }
            self.presenter?.setDogsList_Presenter(listOfDogs: list)
        }
    }
    
}
