//
//  TableViewController.swift
//  GitGists
//
//  Created by Miska  on 20/12/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let fetchingGists = Fetching()
    var displayGists:[GistModel] = []
    var currentPage = 1
    var allReposFetched = false
    var showLoadingCell = false
    let formatter = Formatter()
    
    var descrToEdit:String? = nil
    var createdAtToEdit:String? = nil
    var updatedAtToEdit:String? = nil
    var urlToEdit:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getGists(currentPage:currentPage)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = displayGists.count
        return showLoadingCell ? count+1 : count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLoadingIndexPath(indexPath){
            return LoadingCell(style: .default, reuseIdentifier: "loadingCell")
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "gitCell") as! CustomTableViewCell
            cell.cellDelegate = self
            cell.index = indexPath
            let gist = displayGists[indexPath.row]
            cell.descriptionGist.text = formatter.nilOrNah(description: gist.description)
            cell.createdAt.text = formatter.formatDate(date: gist.created_at!)
            return cell
        }
    }
    //MARK:- Получение объектов
    func getGists(currentPage: Int){
        guard !fetchingGists.isFetchinNow && !allReposFetched else{
            return
        }
        let urlString = "https://api.github.com/gists?page=\(currentPage)"
        print("Current Page: ",self.currentPage)
        self.fetchingGists.fetch(urlString: urlString, response: { (gistModel) in
            guard let gistModel = gistModel else {
                return}
            self.allReposFetched = gistModel.isEmpty
            self.displayGists.append(contentsOf: gistModel)
            self.showLoadingCell = true
            self.showLoadingCell = !gistModel.isEmpty
            self.tableView.reloadData()
            
        })
    }
    //MARK:- Бесконечный скролл
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.height
        if bottomEdge >= scrollView.contentSize.height {
            print("Reched Bottom")
            currentPage += 1
            getGists(currentPage: currentPage)
        }
    }
    
    private func isLoadingIndexPath(_ indexPath: IndexPath) -> Bool {
        guard showLoadingCell else { return false }
        return indexPath.row == self.displayGists.count
    }
    //MARK:- Передача данных на ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTheDetails"{
            let detailsVC = segue.destination as! ViewController
            detailsVC.descrToEdit = descrToEdit
            detailsVC.createdAtToEdit = createdAtToEdit
            detailsVC.updatedAtToEdit = updatedAtToEdit
            detailsVC.urlToEdit = urlToEdit
        }
    }
}

extension TableViewController:cellNew{
    func onClickCell(index: IndexPath) {
        let gists = displayGists[index.row]
        descrToEdit = formatter.nilOrNah(description: gists.description)
        createdAtToEdit = formatter.formatDate(date: gists.created_at!)
        updatedAtToEdit = formatter.formatDate(date: gists.updated_at!)
        urlToEdit = gists.html_url
        
        performSegue(withIdentifier: "toTheDetails", sender: self)
    }
}


