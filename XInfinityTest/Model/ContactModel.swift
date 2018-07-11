//
//  ContactModel.swift
//  XInfinityTest
//
//  Created by Victor Martin on 7/11/18.
//  Copyright © 2018 Victor Martin. All rights reserved.
//

import Foundation

struct ContactResponseJSON: Codable{
    var RelatedTopics: [ContactJson]
}

struct ContactJson: Codable{
    var Text: String
    var Icon: ContactIcon
}

struct ContactIcon: Codable{
    var URL: String
}


struct Contact{
    var title: String
    var icon: String
    var description: String
}
