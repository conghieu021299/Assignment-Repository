//
//  DetailReposViewController.swift
//  RepositoriesGithub
//
//  Created by Hieu on 11/4/20.
//  Copyright © 2020 Hieunc. All rights reserved.
//

import UIKit
import Alamofire

class DetailReposViewController: BaseViewController {
    
    var urlString: String!
    var model = [DetailReposModel]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        creatNaviButton(types: .back)
        
        tableView.do({
            $0.register(RepositoriesTableViewCell.getNib, forCellReuseIdentifier: RepositoriesTableViewCell.className)
            $0.delegate = self
            $0.dataSource = self
        })
        
        getDataServer()
    }
    
    func getDataServer() {
        ProgressHUD.showProgress()
        let urlReplace = urlString.replacingOccurrences(of: "{/branch}", with: "")
        Alamofire.request(urlReplace).responseJSON { response in
            ProgressHUD.hideProgress()
            let result = response.data
            do {
                self.model = try JSONDecoder().decode([DetailReposModel].self, from: result!)
                self.tableView.reloadData()
            } catch {
                print("Error")
            }
        }
    }
}

extension DetailReposViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoriesTableViewCell.className, for: indexPath) as! RepositoriesTableViewCell
        
        cell.title.text = model[indexPath.row].name
        cell.name.text = model[indexPath.row].isType
        
        return cell
    }
}
