//
//  HomeIntractor.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/28.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import UIKit

class HomeIntractor: NSObject {
  weak var presenter: HomePresenter?
  var localDataManager: LocalDataManager?
  
  func loadTask() -> [String] {
    return localDataManager?.loadTasks() ?? []
  }
  
}
