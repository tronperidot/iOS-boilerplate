//
//  AddPresenter.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/28.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import UIKit

class AddPresenter: NSObject {
  // viper
  // TODO: change interfaces
  weak var view: AddView?
  var interactor: AddIntractor?
  var wireFrame: AddWireFrame?
  
  func addAction() {
    let text = self.view?.textField.text ?? "unknown"
    if self.interactor?.addTask(text: text) ?? false {
      self.view?.navigationController?.popViewController(animated: true)
    }
  }
}
