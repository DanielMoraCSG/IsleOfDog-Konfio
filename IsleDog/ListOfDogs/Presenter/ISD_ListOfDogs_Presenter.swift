//
//  ISD_ListOfDogs_Presenter.swift
//  IsleDog
//
//  Created by Daniel Isaac Mora Osorio on 1/27/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import Foundation

class ISD_ListOfDogs_Presenter: ISD_ListOfDogs_ViewToPresenterProtocol {
    var _view: ISD_ListOfDogs_PresenterToViewProtocol?
    
    var _interactor: ISD_ListOfDogs_PresenterToInteractorProtocol?
    
    var _router: ISD_ListOfDogs_PresenterToRouterProtocol?
    
    func getDogsList_Presenter() {
        _interactor?.getDogsList_Interactor()
    }
    
}

extension ISD_ListOfDogs_Presenter: ISD_ListOfDogs_InteractorToPresenterProtocol {
    func setError_Presenter(error: String) {
        _view?.setError_Presenter(error: error)
    }
    
    func setDogsList_Presenter(listOfDogs: [ISD_Dogs_Entity]?) {
        _view?.setDogList_View(listOfDogs: listOfDogs)
    }
    
    
}
