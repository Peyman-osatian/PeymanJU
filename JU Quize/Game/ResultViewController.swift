//
//  ResultViewController.swift
//  JuQuize
//
//  Created by Mahsa  on 2020-12-02.
//  Copyright © 2020 com.mahsa. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
     let resultView = ResultView()
    
    override func loadView() {
        view = resultView
    }
    // resultview loaded here ..
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        // button action
        resultView.button.addTarget(self, action: #selector(backButtonHandler), for:
            .touchUpInside)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        resultView.startAnimation()
    }
    // backward function
    @objc private func backButtonHandler () {
        navigationController?.popToRootViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
