//
//  ISD_ListOfDogs_Protocols.swift
//  IsleDog
//
//  Created by Daniel Isaac Mora Osorio on 1/27/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import Foundation

protocol ISD_ListOfDogs_ViewToPresenterProtocol: class {
    var _view: ISD_ListOfDogs_PresenterToViewProtocol? {set get}
    var _interactor: ISD_ListOfDogs_PresenterToInteractorProtocol? {set get}
    var _router: ISD_ListOfDogs_PresenterToRouterProtocol? {set get}
    
    func getDogsList_Presenter()
}

protocol ISD_ListOfDogs_PresenterToViewProtocol: class {
    func setError_Presenter(error: String)
    func setDogList_View(listOfDogs: [ISD_Dogs_Entity]?)
}

protocol ISD_ListOfDogs_PresenterToRouterProtocol: class {
    // Methods to push to another view
}

protocol ISD_ListOfDogs_InteractorToPresenterProtocol: class {
    func setError_Presenter(error: String)
    func setDogsList_Presenter(listOfDogs: [ISD_Dogs_Entity]?)
}

protocol ISD_ListOfDogs_PresenterToInteractorProtocol: class {
    var presenter : ISD_ListOfDogs_InteractorToPresenterProtocol? {set get}
    
    func getDogsList_Interactor()
}
