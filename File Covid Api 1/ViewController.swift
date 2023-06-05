//
//  ViewController.swift
//  File Covid Api 1
//
//  Created by Yogesh on 6/5/23.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    var allData : [Details] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeAPIData(api: "https://pomber.github.io/covid19/timeseries.json", completionHandler: { ans in
            if ans{
                readFromFile(completionHandler: { data in
                    print(data?.count)
                    self.allData = data!
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            }
        })
        
        
        tableView.frame = self.view.bounds
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView)
        tableView.reloadData()
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {return UITableViewCell()}
        cell.textLabel?.text = allData[indexPath.row].state
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    
}
