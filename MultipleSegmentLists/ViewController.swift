//
//  ViewController.swift
//  MultipleSegmentLists
//
//  Created by Saanvi Shingarwad on 03/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet  var myTableView: UITableView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    var bikes = [Bike]()
    var cars = [Car]()
    var animals = [Animal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        bikes = [
            
            Bike(name: "beneli", image: "bike1", description: "make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop "),
            Bike(name: "apache", image: "bike2", description: "make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop "),
            Bike(name: "honda", image: "bike3", description: "make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop ")
        ]
        
        
        cars = [
        
            Car(name: "ford", image: "car1", description: "orem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, a"),
            Car(name: "benz", image: "car2", description: "orem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, a"),
            Car(name: "tata", image: "car3", description: "orem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, a"),
            
        ]
        
        animals = [
        
          
            Animal(name: "fox", image: "animal1", description: "belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock"),
            Animal(name: "mouse", image: "animal2", description: "belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock"),
            Animal(name: "tiger", image: "animal3", description: "belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock"),
            Animal(name: "bird", image: "animal4", description: "belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock"),
        ]
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        segmentController.addTarget(self, action: #selector(didTapSegmentControl), for: .valueChanged)
        
    }

    @objc private func didTapSegmentControl() {
        myTableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var value = 0
        switch segmentController.selectedSegmentIndex {
        case 0:
            value = animals.count
            break
        case 1:
            value =  bikes.count
            break
        case 2:
            value =  cars.count
            break
    
        default:
            break
        }
        return value
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch segmentController.selectedSegmentIndex {
        case 0:
            cell.textLabel?.text = animals[indexPath.row].name
            cell.imageView?.image = UIImage(named: animals[indexPath.row].image)
            break
        case 1:
            cell.textLabel?.text = bikes[indexPath.row].name
            cell.imageView?.image = UIImage(named: bikes[indexPath.row].image)
            break
        case 2:
            cell.textLabel?.text = cars[indexPath.row].name
            cell.imageView?.image = UIImage(named: cars[indexPath.row].image)
            break
        default:
            break
        }
        return cell
    }
}
