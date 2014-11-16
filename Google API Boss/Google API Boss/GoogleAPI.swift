//
//  GoogleAPI.swift
//  Google API Boss
//
//  Created by Kyler Stole on 11/15/14.
//  Copyright (c) 2014 Uphouseworks. All rights reserved.
//

import Foundation

@objc class GoogleAPI: NSObject {
	// MARK: Properties
	
	let kind: String = ""
	let id: String = ""
	let name: String = ""
	let version: String = ""
	let title: String = ""
	let apiDescription: String = ""
	let discoveryRestURL: String = ""
	let icon16: String = ""
	let icon32: String = ""
    let index: Int = 0
	
	// MARK: Initializers
	
	init(title: String) {
		self.title = title
	}
	
	init(title: String, id: String, name: String, version: String, apiDescription: String, discoveryRestURL: String, icon16: String, icon32: String, kind: String) {
		
		self.kind = kind
		self.id = id
		self.name = name
		self.version = version
		self.title = title
		self.apiDescription = apiDescription
		self.discoveryRestURL = discoveryRestURL
		self.icon16 = icon16
		self.icon32 = icon32
	}
}
