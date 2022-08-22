//
//  ViewController.swift
//  GetandPostAPICalling
//
//  Created by Dharmi Patel on 22/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getApiaction(_ sender: UIButton) {
     
        guard let url = URL (string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { resdata, response, error in
            if let apidata = resdata {
                
            do{
      
                let json = try JSONSerialization.jsonObject(with: apidata)
        
                print(json)
            }catch{
                print(error)
            }
            }
        }.resume()
            

    }

    
    @IBAction func btnPostApi(_ sender: UIButton) {
    
    guard let url = URL (string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let parameters = ["username": "@dharmipatel", "tweet": "Helloworld"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
            URLSession.shared.dataTask(with: request) { resdata, response, error in
            if let apidata = resdata {
                
                do {
                    let json = try JSONSerialization.jsonObject(with: apidata, options: [])
                    print(json)
                 }catch {
                    print(error)
                }
            }
        }.resume()
    
    
    }
    
}

