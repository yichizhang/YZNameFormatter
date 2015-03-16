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

class YZNameFormatter : NSObject {
	
	func nameFrom(#string:String, error:AutoreleasingUnsafeMutablePointer<NSError?> = nil) -> YZName {
		let name = YZName()
		
		let fullName = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()) as NSString
		var nameWithOutPrefix = fullName
		
		var regexPatternString:String
		var a:[String]
		var addtionalPatternString:String
		
		a = [ "mr", "mrs", "ms", "miss", "dr" ]
		addtionalPatternString = "|".join(a)
		
		// ((.*)Prof(\S)*\s|(Miss|Mrs|Mr|Dr)\s)
		regexPatternString = "((.*)Prof(\\S)*\\s|(\(addtionalPatternString))\\s)"
		if let regex = NSRegularExpression(pattern: regexPatternString, options: NSRegularExpressionOptions.CaseInsensitive, error: error) {
			
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
		
		a = ["vere","von","van","de","del","della","di","da","pietro","vanden","du","st.","st","la","ter"]
		addtionalPatternString = "|".join(a)
		
		regexPatternString = "\\s(\(addtionalPatternString))\\s"
		if let regex = NSRegularExpression(pattern: regexPatternString, options: NSRegularExpressionOptions.CaseInsensitive, error: error) {
			
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
			// No "Van Den Acker" style last name is found
			// Look for "Hall-Van Den Acker" style last name
			
			// \s\w*-\w*\s
			regexPatternString = "\\s\\w*-\\w*\\s"
			if let regex = NSRegularExpression(pattern: regexPatternString, options: NSRegularExpressionOptions.CaseInsensitive, error: error) {
				
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
		}
		
		if name.lastName.isEmpty == true {
			// No "Van Den Acker" or "Hall-Van Den Acker" style last name is found
			
			let lastWhiteSpaceRange = nameWithOutPrefix.rangeOfString(" ", options: NSStringCompareOptions.BackwardsSearch)
			
			if lastWhiteSpaceRange.location == NSNotFound {
				if name.prefix.isEmpty == true {
					// If no prefix is found, and no space is found, the string is probably first name only
					name.firstName = nameWithOutPrefix
				} else {
					// If a prefix is found, and no space is found in the rest of the name, the string is probably
					// a combination of prefix and last name, e.g. something like "Mr McLean"
					name.lastName = nameWithOutPrefix
				}
			} else {
				// A space is found. Take the portion behind the space as the last name and the rest as the first name.
				name.firstName = nameWithOutPrefix.substringToIndex(lastWhiteSpaceRange.location)
				name.lastName = nameWithOutPrefix.substringFromIndex(NSMaxRange(lastWhiteSpaceRange))
			}
		}
		
		return name
	}
}

class YZName : NSObject {
	var prefix = ""
	var firstName = ""
	var lastName = ""
}