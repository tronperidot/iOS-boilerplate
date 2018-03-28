//
//  AddWireFrame.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/28.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import UIKit

class AddWireFrame: NSObject {

  class func createModule() -> UIViewController {
    let presenter = AddPresenter()
    let intractor = AddIntractor()
    let wireFrame = AddWireFrame()
    let view = AddView()
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
