//
//  SecondViewController.swift
//  Covid 2
//
//  Created by Yogesh Tekwani on 6/1/23.
//

import UIKit

class SecondViewController: UIViewController {

    var index : Int = 0
    var alldata : [String: [Details]] = [:]
    var dateArray : [String] = [""]
    var confirmedCases : [Int] = []
    var deathsArray : [Int] = []
    var recoveredArray : [Int] = []
    
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let arrData = Array(alldata.keys.sorted())
        let values = alldata[arrData[index]]
        // print(values)
        print(values![0])
        
        
        for i in 0...values!.count-1 {
            dateArray.append(values![i].date!)
            confirmedCases.append(values![i].confirmed!)
            recoveredArray.append(values![i].recovered!)
            deathsArray.append(values![i].deaths!)
        }
        
        dateArray.remove(at: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.frame = self.view.bounds
        
        self.view.addSubview(tableView)
    }
    

}



extension SecondViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        //print(type(of: alldata))
        
        let tvc = ThirdViewController()
        tvc.deaths = deathsArray[indexPath.row]
        tvc.recovered = recoveredArray[indexPath.row]
        tvc.confirmedCases = confirmedCases[indexPath.row]
        navigationController?.pushViewController(tvc, animated: true)
        
        
    }
}


extension SecondViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
            cell.textLabel?.text = dateArray[indexPath.row]
        return cell
        
    }
    
    
}
