//
//  SearchableRecord.swift
//  Continuum
//
//  Created by James Lea on 5/12/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    func matches(searchTerm: String) -> Bool
}
