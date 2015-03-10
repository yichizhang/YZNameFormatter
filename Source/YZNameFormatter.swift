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
import AddressBook

class YZNameFormatter {
	
	func nameFrom(#string:String, error:AutoreleasingUnsafeMutablePointer<NSError?> = nil) -> YZName {
		let name = YZName()
		
		let fullName = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) as NSString
		
		var additionalPrefixArray = [ "mr", "mrs", "ms", "miss", "dr" ]
		let additionalPrefixRegexString = "|".join(additionalPrefixArray)
		let prefixRegexString = "((.*)Prof(\\S)*\\s|\(additionalPrefixRegexString))"
		
		if let prefixRegex = NSRegularExpression(pattern: prefixRegexString, options: NSRegularExpressionOptions.CaseInsensitive, error: error) {
			prefixRegex.enumerateMatchesInString(
				fullName,
				options: NSMatchingOptions.allZeros,
				range: fullName.rangeOfString(fullName),
				usingBlock: { (result:NSTextCheckingResult!, flags:NSMatchingFlags, stop:UnsafeMutablePointer<ObjCBool>) -> Void in
					name.prefix = fullName.substringWithRange(result.range).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
					stop.memory = true
					return
			})
		}
		
		let compoundArray = ["vere","von","van","de","del","della","di","da","pietro","vanden","du","st.","st","la","ter"]
		
		return name
	}
}

class YZName : NSObject {
	var prefix = ""
	var firstName = ""
	var lastName = ""
}