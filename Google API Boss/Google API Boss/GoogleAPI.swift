//
//  GoogleAPI.swift
//  Google API Boss
//
//  Created by Kyler Stole on 11/15/14.
//  Copyright (c) 2014 Uphouseworks. All rights reserved.
//

import Foundation

class GoogleAPI: NSObject, NSCoding {
	// MARK: Properties
	
	let title: String
	let data1: String
	let data2: String
	let data3: String
	
	// MARK: Initializers
	
	init(title: String, data1: String, data2: String, data3: String) {
		self.title = title
		self.data1 = data1
		self.data2 = data2
		self.data3 = data3
	}
}
