
//  ViewController.swift
//  SwiftStudy-2
//
//  Created by 윤강록 on 2023/09/25.


import UIKit
//import Foundation

class ViewController: UIViewController{

    @IBOutlet weak var myTable: UITableView!
    
    var candys = ["Chocolate Bar", "Chocolate Chip", "Dark Chocolate", "Lollipop", "Candy Cane", "Jaw Breaker", "Caramel", "Sour Chew", "Gummi Bear"]
    

//class CandysData{
//    var candyName:String
//    var gender:String
//    init(fName:String,fgender:String)
//    {
//        candyName=fName
//        gender=fgender
//    }
//
//    }
    
    var searching = false // 초기화
    var searchedCandys = [String]() // 빈 문자열 선언
//    var candyList = [CandysData]()
//    var searchedCandys = [CandysData]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let customTitleLabel = UILabel()
        customTitleLabel.text = "Candy Search"
        customTitleLabel.textColor = UIColor.white
        customTitleLabel.font = UIFont(name: "SnellRoundhand-Bold", size: 50)
        customTitleLabel.sizeToFit()

        let titleView = UIView(frame: customTitleLabel.bounds)
        titleView.addSubview(customTitleLabel)

        self.navigationItem.titleView = titleView

        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.setValue("Cancel", forKey: "cancelButtonText")
        searchController.searchBar.tintColor = .white
        searchController.searchBar.searchTextField.backgroundColor = .white
        view.backgroundColor = UIColor(named:"First")
        
    }
//    private func fillData()
//    {
//        let candy1 = CandysData(fName: "Chocolate Bar", fgender: "Chocolate")
//        candyList.append(candy1)
//        let candy2 = CandysData(fName: "Chocolate Chip", fgender: "Chocolate")
//        candyList.append(candy2)
//        let candy3 = CandysData(fName: "Dark Chocolate", fgender: "Chocolate")
//        candyList.append(candy3)
//        let candy4 = CandysData(fName: "Lollipop", fgender: "Hard")
//        candyList.append(candy4)
//        let candy5 = CandysData(fName: "Candy Cane", fgender: "Hard")
//        candyList.append(candy5)
//        let candy6 = CandysData(fName: "Jaw Breaker", fgender: "Hard")
//        candyList.append(candy6)
//        let candy7 = CandysData(fName: "Caramel", fgender: "Other")
//        candyList.append(candy7)
//        let candy8 = CandysData(fName: "Sour Chew", fgender: "Other")
//        candyList.append(candy8)
//        let candy9 = CandysData(fName: "Gummi Bear", fgender: "Other")
//        candyList.append(candy9)
//    }
}
  
extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty
        {
            searching = true
            searchedCandys.removeAll()
            for candy in candys
            {
                if candy.lowercased().contains(searchText.lowercased())
                {
                    searchedCandys.append(candy)
                }
            }
        }
        else
        {
            searching = false
            searchedCandys.removeAll()
            searchedCandys = candys
        }
        myTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching
        {
            return searchedCandys.count
        }
        else
        {
            return candys.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching
        {
            cell.textLabel?.text = searchedCandys[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = candys[indexPath.row]
        }
        return cell
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedCandys.removeAll()
        myTable.reloadData()
    }
         
}
    
    
