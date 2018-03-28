//
//  HomeWireFrame.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/26.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import UIKit

class HomeWireFrame {

  class func createModule() -> UIViewController {
    let presenter = HomePresenter()
    let intractor = HomeIntractor()
    let wireFrame = HomeWireFrame()
    let view = HomeView()
    let localDataManager = LocalDataManager()
    
    view.presenter = presenter
    presenter.view = view
    presenter.interactor = intractor
    presenter.wireFrame = wireFrame
    intractor.presenter = presenter
    intractor.localDataManager = localDataManager
    
    return view
  }
}
