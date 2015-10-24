//
//  ViewController.swift
//  Practice05-Alert
//
//  Created by Mac on 2015. 10. 24..
//  Copyright © 2015년 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {

	@IBAction func oldWays(sender: AnyObject) {
		let alert = UIAlertView(
				title: "",
				message: "UIAlertView Sample View",
				delegate: self,
				cancelButtonTitle: "Cancel",
				otherButtonTitles: "OK", "Fail"
		)
		
		alert.show()
	}
	
	func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
		NSLog("buttonIndex : \(buttonIndex)")
	}


	// 1. UIAlertController 객체생성
	// 2. 버튼 생성
	// 3. 알러트객체에 버튼 추가
	// 4. presentViewController 로 커트롤로 추가
	@IBAction func newWays(sender: AnyObject) {
		let alert = UIAlertController(title: "", message: "UIAlertController Sample View", preferredStyle: UIAlertControllerStyle.Alert)
		
		let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {
			(_) in NSLog("Cancel Button Clicked")
		})
		
		let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {$0; NSLog("OK Button Clicked")}) // 위와 똑같은 표현. 변수하나를 받는 클로저이므로 받는 방법($0) 표현

		alert.addAction(cancelAction)
		alert.addAction(okAction)
		
		alert.addAction(UIAlertAction(title: "Fail", style: UIAlertActionStyle.Default, handler: {$0; NSLog("Fail Button Clicked")}))
	
		self.presentViewController(alert, animated: false, completion: nil)
	}
	
	
}

