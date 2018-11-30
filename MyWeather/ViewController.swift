//
//  ViewController.swift
//  MyWeather
//
//  Created by Cyberjaya 6 iTrain on 10/08/2018.
//  Copyright © 2018 Iconnectix. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let myArray : [String] = ["Hello World", "Hello World 1", "Hello World 2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request("https://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&appid=9fd7a449d055dba26a982a3220f32aa2").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
//
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
//
            let responseJSON = JSON(response.result.value)
            print(responseJSON)
            
            let city = responseJSON["city"]["name"].stringValue
            print(city)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = myArray[indexPath.row]
        
        cell.textLabel?.text = item.description
        
        return cell
    }
}

