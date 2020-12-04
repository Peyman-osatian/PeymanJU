//
//  ResultView.swift
//  JU Quize
//
//  Created by Peyman Osatian on 2020-12-02.
//  Copyright © 2020 Peyman Osatian. All rights reserved.
//

import UIKit

class ResultView: UIView {
    private let titleLabel = UILabel()
    let resultLabel = UILabel()
    let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = NSLocalizedString("Your Result", comment: "Result Title")
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 20).isActive=true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        resultLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        resultLabel.adjustsFontForContentSizeCategory = true
        addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        
        button.setTitleColor(.blue, for: .normal)
        button.setTitle(NSLocalizedString("back", comment: "result button title"), for: .normal)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:-20 ).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
    }
       
}
