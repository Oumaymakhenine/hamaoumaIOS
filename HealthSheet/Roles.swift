//
//  Roles.swift
//  HealthSheet
//
//  Created by Hama on 11/28/20.
//

import Foundation
import Alamofire

extension MainTableViewController {
  func fetchFilms() {
    // 1
    let request = AF.request("https://swapi.dev/api/films")
    // 2
    request.responseJSON { (data) in
      print(data)
    }
  }
}
