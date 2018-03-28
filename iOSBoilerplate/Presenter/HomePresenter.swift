//
//  HomePresenter.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/28.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import UIKit

class HomePresenter: NSObject {
  // viper
  // TODO: change interfaces
  weak var view: HomeView?
  var interactor: HomeIntractor?
  var wireFrame: HomeWireFrame?
  
  func viewWillAppear() {
    self.view?.todos = self.interactor?.loadTask() ?? []
    self.view?.table.reloadData()
  }
  
  func toAddPage() {
    let second = AddWireFrame.createModule()
    self.view.navigationController?.pushViewController(second, animated: true)
  }
}
