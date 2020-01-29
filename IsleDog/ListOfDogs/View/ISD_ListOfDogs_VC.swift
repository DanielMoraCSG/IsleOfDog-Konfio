//
//  ISD_ListOfDogs_VC.swift
//  IsleDog
//
//  Created by Daniel Isaac Mora Osorio on 1/27/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import UIKit

class ISD_ListOfDogs_VC: UIViewController {
    
    var _presenter : ISD_ListOfDogs_ViewToPresenterProtocol?
    var isd_View: ISD_TableView_View = ISD_TableView_View()
    private var loader : Generic_Loader_iOS?
    
    lazy var safeArea = { () -> UILayoutGuide in
        if #available(iOS 11.0, *) {
            return self.view.safeAreaLayoutGuide
        }else{
            return self.view.layoutMarginsGuide
        }
    }()
    
    func addLoaderIndicator(){
        loader = Generic_Loader_iOS(superviewForIndicatorActivity: view)
        view.addSubview(loader!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addLoaderIndicator()
        self.view.backgroundColor = UIColor(hex: "F8F8F8")
        initAppearance()
        self.view.addSubview(isd_View)
        NSLayoutConstraint.activate([
            isd_View.topAnchor.constraint(equalTo: safeArea.topAnchor),
            isd_View.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            isd_View.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            isd_View.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
        _presenter?.getDogsList_Presenter()
    }
    
    private func initAppearance(){
        self.navigationItem.leftBarButtonItems = UINavigationItem.setupNavigationBarCustom(withBackTitle: "Dogs We Love", withTarget: self, withAction: #selector(backFlow))
    }
    
    @objc func backFlow(){
        // Dismiss
    }

}

extension ISD_ListOfDogs_VC: ISD_ListOfDogs_PresenterToViewProtocol{
    func setError_Presenter(error: String) {
        self.loader!.removeIndicator()
        self.isd_View.dataSource = nil
        self.isd_View.tableView.reloadData()
        
        let alertController = UIAlertController(title: "",
                                                message: "Parece que hay intermitencia en nuestros servicios, por favor intente nuevamente",
                                                preferredStyle: .alert)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        let actionSave = UIAlertAction(title: "Intentar de nuevo", style: .default) { (action) in
            self.addLoaderIndicator()
            self._presenter?.getDogsList_Presenter()
        }
        
        alertController.addAction(actionCancel)
        alertController.addAction(actionSave)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    func setDogList_View(listOfDogs: [ISD_Dogs_Entity]?) {
        self.loader!.removeIndicator()
        self.isd_View.dataSource = listOfDogs
        self.isd_View.tableView.reloadData()
        
    }
    
}
