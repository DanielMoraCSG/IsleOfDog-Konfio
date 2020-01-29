//
//  ISD_TableView_View.swift
//  IsleDog
//
//  Created by Daniel Isaac Mora Osorio on 1/27/20.
//  Copyright © 2020 Daniel Isaac Mora Osorio. All rights reserved.
//

import UIKit

class ISD_TableView_View: UIView {

    internal let tableView : UITableView = {
        let table = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorColor = UIColor.clear
        table.keyboardDismissMode = UIScrollView.KeyboardDismissMode.onDrag
        table.allowsSelection = false
        table.backgroundColor = UIColor.clear
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    var dataSource: [ISD_Dogs_Entity]?
    
    init() {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(ISD_DogCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 21),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -21),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ISD_TableView_View: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 33
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ISD_DogCell
        cell.name_label.text = dataSource?[indexPath.section].dogName ?? ""
        cell.description_label.text = dataSource?[indexPath.section].descriptionDog ?? ""
        cell.edad_label.text = dataSource?[indexPath.section].getAge() ?? ""
        cell.imageDog.imageFromServerURL(urlString: dataSource?[indexPath.section].getURL() ?? "")
        return cell
    }
    
    
}
