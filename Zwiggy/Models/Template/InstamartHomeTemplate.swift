//
//  InstamartHomeTemplate.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 08/04/24.
//

import Foundation

struct InstamartHomeTemplate: Decodable {
    var data: TemplateData?
}

struct TemplateData: Decodable {
    var sections: [TemplateSection]?
}


