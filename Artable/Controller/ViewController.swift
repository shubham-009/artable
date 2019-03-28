//
//  ViewController.swift
//  Artable
//
//  Created by Lokesh Dwivedi on 27/03/19.
//  Copyright © 2019 Shubhamkumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }

    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryboardID.LoginVC)
        present(controller,animated: true, completion: nil)
    }
    
}

