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
    downloadAPI()
  }
  
  @IBAction func searchButtonTap(_ sender: Any) {
    
  }
}

extension ViewController {
  
  /*
   {
      "status":"success",
      "country":"Canada",
      "countryCode":"CA",
      "region":"QC",
      "regionName":"Quebec",
      "city":"Montreal",
      "zip":"H1K",
      "lat":45.6085,
      "lon":-73.5493,
      "timezone":"America/Toronto",
      "isp":"Le Groupe Videotron Ltee",
      "org":"Videotron Ltee",
      "as":"AS5769 Videotron Telecom Ltee",
      "query":"24.48.0.1"
   }
   */
  
  func downloadAPI() {
    guard let url = URL(string: "http://ip-api.com/json/a24.48.0.1") else {
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
    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
      // do something
      
    }))
    present(alert, animated: true, completion: nil)
  }
}



