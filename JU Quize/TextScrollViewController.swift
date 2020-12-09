//
//  TextScrollViewController.swift
//  JU Quize
//
//  Created by Mahsa  on 2020-12-04.
//  Copyright © 2020 com.mahsa. All rights reserved.
//

import UIKit

class TextScrollViewController: UIViewController {
    let scrollView = UIScrollView()
    
    override func loadView() {
        view = scrollView
        scrollView.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.numberOfLines = 0
        label.text = Array(repeating: "🦆", count: 100).joined(separator: "\n")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        scrollView.addSubview(label)
        
        label.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor).isActive = true    }
    


}
