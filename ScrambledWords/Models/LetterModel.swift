//
//  LetterModel.swift
//  ScrambledWords
//
//  Created by Ajay kumar on 05/06/25.
//

import Foundation

    // use Hashable for Store unique Letter objects
//struct Letter : Hashable{
//    let index: Int;
//    var text: String;
//}


// use Hashable for key in Listview builder
struct Letter : Identifiable , Hashable{
    let id: Int;
    var text: String;
}

