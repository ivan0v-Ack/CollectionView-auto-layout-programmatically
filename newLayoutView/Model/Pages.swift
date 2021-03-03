//
//  Pages.swift
//  newLayoutView
//
//  Created by Ivan Ivanov on 3/3/21.
//

import UIKit

struct Pages {
    let image: UIImage
    let title: String
    let text: String
    
}

 func fetchData() -> [Pages]{
    let firstPage = Pages(image: Images.image1, title: Text.Labels.firstTopic, text: Text.firstBody)
    let secondPage = Pages(image: Images.image2, title: Text.Labels.secondTopic, text: Text.secondBody)
    let thirdPage = Pages(image: Images.image3, title: Text.Labels.thirdTopic, text: Text.thirdBody)
    let fourthPage = Pages(image: Images.image4, title: Text.Labels.fourthTopic, text: Text.fourthBody)
    
    return[firstPage,secondPage,thirdPage,fourthPage]
}


//func fetchData() -> [Screens] {
//
//
//    let screen1 = Screens(image: Images.hero, textt: newText.firstTopic,   bodyText: bodyText.firstBody)
//    let screen2 = Screens(image: Images.mickyMouse, textt: newText.secondTopic, bodyText: bodyText.secondBody)
//    let screen3 = Screens(image: Images.spondJBob, textt: newText.thirdTopic, bodyText: bodyText.thirdBody)
//    let screen4 = Screens(image: Images.superMario, textt: newText.fourthTopic, bodyText: bodyText.fourthBody)
//
//
//    return [screen1,screen2,screen3,screen4]
//}

