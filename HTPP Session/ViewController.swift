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
    @IBOutlet var searchButton: UIButton!
    
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    let query = [
        "api_key": "DEMO_KEY",
        "date": "2019-08-22"
    ]
    
    var touchCounter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadRequest() {
//        guard var searchContent = searchTextField.text else { return }
//        var textArray = ""
//        for symbol in searchContent {
//            if symbol != " " {
//                textArray.append(symbol)
//            }
//        }
//        searchContent = textArray
        let url = baseURL.withQueries(query)!
        let task = URLSession.shared.dataTask(with: url) { data, reponse, error in
            guard let data = data else {
                print(#function, #line, error?.localizedDescription ?? "no description")
                return
            }
            let decoder = JSONDecoder()
            guard let songInfo = try? decoder.decode(PhotoInfo.self, from: data) else {
                guard let stringData = String(data: data, encoding: .utf8) else {
                    print(#function, #line, "ERROR: can't decode \(data) as UTF8")
                    return
                }
                
                print(#function, #line, "ERROR: can't decode data from \(stringData)")
                return
            }
            
            DispatchQueue.main.async {
                self.textView.text = "\(songInfo)"
            }
        }
        task.resume()
    }
    

    @IBAction func searchButton(_ sender: UIButton) {
        touchCounter += 1
        switch touchCounter {
        case  1:
            UIView.animate(withDuration: 1) {
                self.searchButton.backgroundColor = .green
            }
        case 2:
            UIView.animate(withDuration: 1) {
                self.searchButton.backgroundColor = .blue
            }
        default:
            touchCounter = 0
        }
    
        loadRequest()
    }
    
}

