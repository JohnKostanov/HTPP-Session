//
//  ViewController.swift
//  HTPP Session
//
//  Created by  Джон Костанов on 21/08/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var textView: UITextView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //loadRequest()
    }
    
    func loadRequest() {
        guard let searchContent = searchTextField.text else { return }
        let url = URL(string: "https://itunes.apple.com/search?term=\(searchContent)?")!
        let task = URLSession.shared.dataTask(with: url) { data, reponse, error in
            guard let data = data else {
                print(#function, #line, error?.localizedDescription ?? "no description")
                return
            }
            guard let stringData = String(data: data, encoding: .utf8) else {
                print(#function, #line, "ERROR: can't decode \(data)")
                return
            }
            
            //print(stringData)
            DispatchQueue.main.async {
                self.textView.text = "\(stringData)"
            }
        }
        task.resume()
    }
    

    @IBAction func searchButton(_ sender: UIButton) {
        loadRequest()
        
    }
    
}

