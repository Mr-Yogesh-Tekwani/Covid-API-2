//
//  ThirdViewController.swift
//  Covid 2
//
//  Created by Yogesh Tekwani on 6/1/23.
//

import UIKit

class ThirdViewController: UIViewController {

    var confirmedCases : Int = 0
    var deaths :Int = 0
    var recovered : Int = 0
    
    let l1 = UILabel()
    let l2 = UILabel()
    let l3 = UILabel()
    
    let stack : UIStackView = {
        let sv = UIStackView()
        sv.alignment = .center
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.backgroundColor = .green
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(confirmedCases)
        print(deaths)
        print(recovered)
        
        stack.addArrangedSubview(l1)
        stack.addArrangedSubview(l2)
        stack.addArrangedSubview(l3)
        
        l1.text = "Confirmed Cases = \(confirmedCases)"
        l2.text = "Deaths = \(deaths)"
        l3.text = "Recovered = \(recovered)"
        
        
        self.view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            stack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        ])
        
    }

}
