//
//  ExampleScrollViewController.swift
//  JU Quize
//
//  Created by Mahsa  on 2020-12-04.
//  Copyright © 2020 com.mahsa. All rights reserved.
//

import UIKit

class ExampleScrollViewController: UIViewController {
    let scrollView = UIScrollView()
    
    override func loadView() {
        view = scrollView
        scrollView.backgroundColor = .systemBackground
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let redView = UIView()
        redView.backgroundColor = .systemRed
        redView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(redView)
        
        let blueView = UIView()
        blueView.backgroundColor = .systemBlue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(blueView)
        
        let label = UILabel()
        label.text = "Hello :)"
        label.translatesAutoresizingMaskIntoConstraints = false
        blueView.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: blueView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: blueView.centerYAnchor).isActive = true
        
        setFullScreenSize(forView: redView)
        setFullScreenSize(forView: blueView)
        
        redView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        blueView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor).isActive = true
        blueView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        redView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: blueView.leadingAnchor).isActive = true
        blueView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true

    }
    
    private func setFullScreenSize(forView view: UIView) {
        view.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }


}
