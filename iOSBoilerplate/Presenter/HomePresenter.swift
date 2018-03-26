//
//  HomeController.swift
//  iOSBoilerplate
//
//  Created by yk13475 on 2018/03/26.
//  Copyright © 2018年 tronperidot. All rights reserved.
//

import UIKit

class HomePresenter: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let mainView = MainView(frame: self.view.bounds)
    
    mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.view.addSubview(mainView)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
