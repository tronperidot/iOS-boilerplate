//
//  AddIntractor.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/28.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import UIKit

class AddIntractor: NSObject {
  weak var presenter: AddPresenter?
  var localDataManager: LocalDataManager?
  
  func addTask(text: String) -> Bool {
    return self.localDataManager?.writeTask(text: text) ?? false
  }
}
