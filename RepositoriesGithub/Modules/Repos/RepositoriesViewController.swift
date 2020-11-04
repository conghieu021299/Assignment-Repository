//
//  RepositoriesViewController.swift
//  RepositoriesGithub
//
//  Created by Hieu on 11/4/20.
//  Copyright © 2020 Hieunc. All rights reserved.
//

import UIKit
import ESPullToRefresh
import Alamofire

class RepositoriesViewController: BaseInputViewController {
    
    var listData: [RepositoriesModel]?
    var currPage = 1
    var searchActive : Bool = false
    var searchStr: String = "stars:>=10000"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var totalCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repositories"
        listData = [RepositoriesModel]()
        
        tableView.do({
            $0.register(RepositoriesTableViewCell.getNib, forCellReuseIdentifier: RepositoriesTableViewCell.className)
            $0.delegate = self
            $0.dataSource = self
        })
        
        tableView.es.addPullToRefresh { [unowned self] in
            self.tableView.es.stopPullToRefresh()
            self.resetDataList()
        }
        
        tableView.es.addInfiniteScrolling { [unowned self] in
            self.currPage += 1
            self.getServerData()
        }
        
        searchBar.delegate = self
        
        getServerData()
    }
    
    func resetDataList() {
        self.tableView.es.resetNoMoreData()
        self.currPage = 1
        self.getServerData()
    }
    
    func getServerData() {
        if currPage == 1 {
            ProgressHUD.showProgress()
        }
        
        var params = MParamater()
        
        params.updateValue(searchStr, forKey: .q)
        params.updateValue("stars", forKey: .sort)
        params.updateValue("desc", forKey: .order)
        params.updateValue(PAGE_SIZE, forKey: .per_page)
        params.updateValue(currPage, forKey: .page)
        
        let router = Router.getAllRepos(path: params.asParamater)
        
        APIRequest.request(router) { [weak self] (responseModel: ResponseModel<[RepositoriesModel]>?) in
            ProgressHUD.hideProgress()
            guard let strongSelf = self, let reseponse = responseModel else {
                return
            }
            strongSelf.tableView.es.stopLoadingMore()
            if let model = reseponse.items {
                
                if strongSelf.currPage == 1 {
                    strongSelf.listData?.removeAll()
                }
                
                strongSelf.listData?.append(contentsOf: model)
                strongSelf.totalCount.text = "Total count: \(reseponse.totalCount ?? 0)"
                strongSelf.tableView.reloadData()
                
                if model.count == 0 || model.count < PAGE_SIZE {
                    strongSelf.tableView.es.noticeNoMoreData()
                }
            }
        }
    }
    
}



extension RepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoriesTableViewCell.className, for: indexPath) as! RepositoriesTableViewCell
        
        if let model = listData?[indexPath.row] {
            cell.title.text = model.author
            cell.name.text = model.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailReposViewController(nibName: DetailReposViewController.className, bundle: nil)
        detailVC.urlString = listData?[indexPath.row].branchesUrl
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension RepositoriesViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchStr = "stars:>=10000"
        searchBar.searchTextField.text = ""
        getServerData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getServerData()
        self.view.endEditing(true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchStr = "\(searchText) in:name"
        
        if searchText.count == 0 {
            searchStr = "stars:>=10000"
        }
        
    }
}
