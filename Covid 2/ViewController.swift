//
//  ViewController.swift
//  Covid 2
//
//  Created by Yogesh Tekwani on 6/1/23.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    var alldata : [String: [Details]] = [:]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Inside ViewDidLoad")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
        
        reqData(completionHandler: { all in
            print("Entered reqData")
            if let all = all {
                self.alldata = all
            }
            //print(self.alldata)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })
    }

}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
//        let arrData = Array(alldata.keys.sorted())
//        let values = alldata[arrData[indexPath.row]]
//        print(values)
//        let dateVal = values?[0].date
//        print(dateVal)
        tableView.deselectRow(at: indexPath, animated: true)
        print(type(of: alldata))
        
        let svc = SecondViewController()
        svc.alldata = alldata
        svc.index = indexPath.row
        navigationController?.pushViewController(svc, animated: true)
        
        
    }
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alldata.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }

        let arrData = Array(alldata.keys.sorted())
            cell.textLabel?.text = arrData[indexPath.row]
//        }
        //cell.textLabel?.text = ""  //"\(self.alldata?.count ?? 0)"
        return cell
        
    }
    
    
}
