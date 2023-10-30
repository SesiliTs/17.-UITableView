//
//  TVShows.swift
//  17. UITableView
//
//  Created by Sesili Tsikaridze on 30.10.23.
//

import UIKit

class TVShow {
    let name: String
    let image: UIImage
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
    static var tvShows = [
        TVShow(name: "Homeland", image: .homeland),
        TVShow(name: "Fleabag", image: .fleabag),
        TVShow(name: "Shameless", image: .shameless),
//        TVShow(name: "Outlander", image: <#UIImage#>),
        TVShow(name: "Good Omens", image: .goodOmens),
        TVShow(name: "The Bear", image: .theBear),
        TVShow(name: "Attack on Titan", image: .attackOnTitan),
        TVShow(name: "Leftovers", image: .leftovers),
        TVShow(name: "Arcane", image: .arcane),
        TVShow(name: "True Detective", image: .trueDetective),
//        TVShow(name: "Brooklyn 99", image: .),
//        TVShow(name: "The Newsroom", image: <#UIImage#>),
        TVShow(name: "Gravity Falls", image: .gravityFalls),

    ]
}
