//
//  YZNameFormatter.swift
//  NameFormatterDemo
//
//  Created by Yichi on 10/03/2015.
//  Copyright (c) 2015 Yichi. All rights reserved.
//

/*

(.*)Prof(\S)*\s

((.*)Prof(\S)*\s|(Miss|Mrs|Mr|Dr)\s)

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
		var nameWithOutPrefix = fullName
		
		let additionalPrefixArray = [ "mr", "mrs", "ms", "miss", "dr" ]
		let additionalPrefixRegexString = "|".join(additionalPrefixArray)
		
		// ((.*)Prof(\S)*\s|(Miss|Mrs|Mr|Dr)\s)
		let prefixRegexString = "((.*)Prof(\\S)*\\s|(\(additionalPrefixRegexString))\\s)"
		
		if let regex = NSRegularExpression(pattern: prefixRegexString, options: NSRegularExpressionOptions.CaseInsensitive, error: error) {
			
			regex.enumerateMatchesInString(
				fullName,
				options: NSMatchingOptions.allZeros,
				range: fullName.rangeOfString(fullName),
				usingBlock: { (result:NSTextCheckingResult!, flags:NSMatchingFlags, stop:UnsafeMutablePointer<ObjCBool>) -> Void in
					name.prefix = fullName.substringWithRange(result.range).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
					nameWithOutPrefix = (fullName as String).stringByReplacingOccurrencesOfString(name.prefix, withString: "", options: NSStringCompareOptions.allZeros).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
					stop.memory = true
					return
			})
		}
		
		let additionalCompoundArray = ["vere","von","van","de","del","della","di","da","pietro","vanden","du","st.","st","la","ter"]
		let additionalCompoundRegexString = "|".join(additionalCompoundArray)
		let compoundRegexString = "\\s(\(additionalCompoundRegexString))\\s"
		if let regex = NSRegularExpression(pattern: compoundRegexString, options: NSRegularExpressionOptions.CaseInsensitive, error: error) {
			
			regex.enumerateMatchesInString(
				nameWithOutPrefix,
				options: NSMatchingOptions.allZeros,
				range: nameWithOutPrefix.rangeOfString(nameWithOutPrefix),
				usingBlock: { (result:NSTextCheckingResult!, flags:NSMatchingFlags, stop:UnsafeMutablePointer<ObjCBool>) -> Void in
					
					name.lastName = nameWithOutPrefix.substringFromIndex(result.range.location).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
					name.firstName = (nameWithOutPrefix as String).stringByReplacingOccurrencesOfString(name.lastName, withString: "", options: .allZeros).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
					stop.memory = true
					return
			})
		}
		
		if name.lastName.isEmpty == true {
			let lastWhiteSpaceRange = nameWithOutPrefix.rangeOfString(" ", options: NSStringCompareOptions.BackwardsSearch)
			
			if lastWhiteSpaceRange.location == NSNotFound {
				if name.prefix.isEmpty == true {
					name.firstName = nameWithOutPrefix
				} else {
					name.lastName = nameWithOutPrefix
				}
			} else {
				name.firstName = nameWithOutPrefix.substringToIndex(lastWhiteSpaceRange.location)
				name.lastName = nameWithOutPrefix.substringFromIndex(NSMaxRange(lastWhiteSpaceRange))
			}
		}
		
		return name
	}
}

class YZName {
	var prefix = ""
	var firstName = ""
	var lastName = ""
}