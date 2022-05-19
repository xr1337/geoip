//
//  GeoReverseViewController.swift
//  GeoIp
//
//  Created by Sufiyan Yasa on 20/05/2022.
//

import Foundation
import UIKit

class GeoReverseViewController: UIViewController {
  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var tableView: UITableView!

  
  override func viewDidLoad() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
  }
}

extension GeoReverseViewController: UITableViewDelegate {
  
}

extension GeoReverseViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
    cell.textLabel?.text = "test"
    return cell
  }
  
  
}

private extension GeoReverseViewController {
  func geoparsing() {
    let url = URL(string: "https://geocode.xyz")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = "scantext=\"this is subang jaya petaling jaya malaysia\"&json=1".data(using: .utf8)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
}

