//
//  ISD_ListOfDogs_Router.swift
//  IsleDog
//
//  Created by Daniel Isaac Mora Osorio on 1/27/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import UIKit

/**
 Use this class for instantiate a Master Router View
 
 Some methods in this class maybe can do instantiate a view as many diferent types of same view
 */
class ISD_ListOfDogs_Router: UINavigationController {
    
    /**
     Use this function for initialize a new ListOfDogs ViewController
     
     Some parameters can be sender into this function (Plese added if necesary)
     - Returns: A new ViewController as `Master ContentView`.
     */
    public static func createModule() -> UIViewController{
        let view = ISD_ListOfDogs_VC()
        
        let presenter : ISD_ListOfDogs_ViewToPresenterProtocol & ISD_ListOfDogs_InteractorToPresenterProtocol = ISD_ListOfDogs_Presenter()
        let interactor : ISD_ListOfDogs_PresenterToInteractorProtocol = ISD_ListOfDogs_Interactor()
        let route : ISD_ListOfDogs_PresenterToRouterProtocol = ISD_ListOfDogs_Router()
        
        view._presenter = presenter
        presenter._view = view
        presenter._router = route
        presenter._interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
/// Use this method when can push another view in workflow ios app
extension ISD_ListOfDogs_Router: ISD_ListOfDogs_PresenterToRouterProtocol{
    // Some methods for push another view as VIPER Pattern
}
