//
//  ViewController.swift
//  GeoIp
//
//  Created by Sufiyan Yasa on 19/05/2022.
//

import UIKit
import MapKit

class ViewController: UIViewController {
  
  @IBOutlet weak var ipTextfield: UITextField!
  @IBOutlet weak var ispLabel: UILabel!
  @IBOutlet weak var mapView: MKMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.centerCoordinate = .init(latitude: 0, longitude: 0)
  }
  
  @IBAction func searchButtonTap(_ sender: Any) {
    
  }
}

private extension ViewController {
  
  /// API documentation - https://ip-api.com/docs/api:json
  func downloadAPI() {
    guard let url = URL(string: "http://ip-api.com/json/24.48.0.1") else {
      return
    }
    let task = URLSession.shared.dataTask(with: url ) { data, response, error in
      DispatchQueue.main.async {
      guard let data = data, error == nil else {
        print("Error")
        return
      }
      print(String(data: data, encoding: .utf8))
      // Check if data was received successfully
      do {
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
        print(json)
      } catch {
        print(error)
      }
      }
    }
    task.resume()
  }
  
  func showAlert() {
    let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
      // do something
      
    }))
    present(alert, animated: true, completion: nil)
  }
}



