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
	
	let kind: String
	let id: String
	let name: String
	let version: String
	let title: String
	let description: String
	let discoveryRestURL: String
	let icon16: String
	let icon32: String
	
	// MARK: Initializers
	
	init(title: String, data1: String, data2: String, data3: String) {
		self.title = title
		self.data1 = data1
		self.data2 = data2
		self.data3 = data3
	}
}
