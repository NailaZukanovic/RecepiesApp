//
//  Categories.swift
//  Recepti
//
//  Created by MacLab6 on 22.10.22..
//

import Foundation

struct CategoriesResponse: Codable {
    let categories: [Category]
}
struct Category: Codable {
    let idCategory, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
