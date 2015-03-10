//
//  YZNameFormatter.swift
//  NameFormatterDemo
//
//  Created by Yichi on 10/03/2015.
//  Copyright (c) 2015 Yichi. All rights reserved.
//
/*
(.*)Prof(\S)*\s
((.*)Prof(\S)*\s|Miss|Mrs|Mr|Dr)

Assoc Professsor Eve Fallshaw
Emeritus Prof Helen Praetz
Assoc Professor Philip Wilksch
Adjunct Profess John Izard
Professor Harry McLean
Josh Hall
Mr Harry Hall
Dr Harry Hamilton
Dr Aaron Johnston

*/

import Foundation
import UIKit

class YZNameFormatter {
	
	let prefixDict = [
		"prefix" : [
			"Mr." : ["mr", "mister", "master"],
			"Mrs." : ["mrs", "missus", "missis"],
			"Ms." : ["ms", "miss"],
			"Dr." : ["dr"],
			"Rev." : ["rev", "rev'd", "reverend"],
			"Fr." : ["fr", "father"],
			"Sr." : ["sr", "sister"],
			"Prof." : ["prof", "professor"],
			"Sir" : ["sir"],
			"" : "the"
		]
	]
	
	let compoundDict = [
		"compound" : [
			"vere","von","van","de","del","della","di","da","pietro","vanden","du","st.","st","la","ter"
		]
	]
	
	let suffixDict = [
		"suffixes" : [
			"line" : [ "I","II","III","IV","V","Senior","Junior","Jr","Sr" ],
			"prof" : [ "PhD","APR","RPh","PE","MD","MA","DMD","CME" ]
		]
	]
	
	func nameFrom(#string:String) -> YZName {
		let name = YZName()
		
		var fullName = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
		
		var prefixArray = [
			"mr", "mrs", "miss", "prof", "dr", "assoc professor"
		]
		
		return name
	}
}

class YZName : NSObject {
	var prefix = ""
	var firstName = ""
	var lastName = ""
}