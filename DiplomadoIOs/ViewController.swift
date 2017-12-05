//
//  ViewController.swift
//  DiplomadoIOs
//
//  Created by Rudy Ernesto Escalera Mejia on 5/12/17.
//  Copyright © 2017 rudycbba. All rights reserved.
//

import UIKit
struct Country: Decodable {
    let name: String
    let capital: String
    let region: String
}
class ViewController: UIViewController {
    @IBOutlet weak var pais: UILabel!
    @IBOutlet weak var namecapital: UILabel!
    @IBOutlet weak var nameregion: UILabel!
    
    
    var countries = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("paso")
        let jsonurl = "https://restcountries.eu/rest/v2/all"
        
        let url = URL(string: jsonurl)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do{
                
                self.countries = try JSONDecoder().decode([Country].self, from: data!)
                
                let randomIndex = Int(arc4random_uniform(UInt32(self.countries.count)))
                
                let random = self.countries[randomIndex]
                
                self.pais.text = random.name
                self.namecapital.text = random.region
                self.nameregion.text = random.capital
            }
                
            catch{
                
                print("error")
                
            }
            
            }.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

