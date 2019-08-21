//
//  ViewController.swift
//  HTPP Session
//
//  Created by  Джон Костанов on 21/08/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadRequest()
    }
    
    func loadRequest() {
        let task = URLSession.shared.dataTask(with: url) { data, reponse, error in
            guard let data = data else {
                print(#function, #line, error?.localizedDescription ?? "no description")
                return
            }
            guard let stringData = String(data: data, encoding: .utf8) else {
                print(#function, #line, "ERROR: can't decode \(data)")
                return
            }
            
            print(stringData)
        }
        task.resume()
    }
    


}

