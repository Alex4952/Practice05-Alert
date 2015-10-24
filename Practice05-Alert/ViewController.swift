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
				message: "입력하시겠습니까?",
				delegate: self,
				cancelButtonTitle: "Cancel",
				otherButtonTitles: "OK", "Fail"
		)
		
//		alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
//		alert.alertViewStyle = UIAlertViewStyle.SecureTextInput
		alert.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
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
		let alert = UIAlertController(title: "Login", message: "아이디와 패스워드를 입력해주세요", preferredStyle: UIAlertControllerStyle.Alert)
//		let alert = UIAlertController(title: "", message: "UIAlertController Sample View", preferredStyle: UIAlertControllerStyle.ActionSheet) // 알러트창이 아래쪽에 나옴

		// 텍스트필드 추가
		alert.addTextFieldWithConfigurationHandler({
			tf in
			tf.placeholder = "Login ID"
			tf.secureTextEntry = false
		})
		
		alert.addTextFieldWithConfigurationHandler({
			$0.placeholder = "Login Password"
			$0.secureTextEntry = true
		})
		
		let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
		
//		let okAction = UIAlertAction(title: "Login", style: UIAlertActionStyle.Default, handler: {
//			(action) in
//			let id = (alert.textFields?[0].text)!
//			let pwd : String = (alert.textFields?[1].text)!
//			NSLog("ID = \(id) , PWD = \(pwd)")
//			
//			if id == "sqlpro" && pwd == "1234" {
//				NSLog("로그인 성공")
//			}
//			else {
//				NSLog("로그인 실패")
//			}
//		})

		// Trailing Closures로 변경 ( ()와 {} 순서변경)
//		let okAction = UIAlertAction(title: "Login", style: UIAlertActionStyle.Default) { // 마지막 handler 는 생략가능
//			(_) in
//			let id = (alert.textFields?[0].text)!
//			let pwd : String = (alert.textFields?[1].text)!
//			NSLog("ID = \(id) , PWD = \(pwd)")
//			
//			if id == "sqlpro" && pwd == "1234" {
//				NSLog("로그인 성공")
//			}
//			else {
//				NSLog("로그인 실패")
//			}
//		}
		
		// Trailing Closures로 변경, 매개변수를 $0; 로 변경
		let okAction = UIAlertAction(title: "Login", style: UIAlertActionStyle.Default) { // 마지막 handler 는 생략가능
			$0;
			let id = (alert.textFields?[0].text)!
			let pwd : String = (alert.textFields?[1].text)!
			NSLog("ID = \(id) , PWD = \(pwd)")
			
			if id == "sqlpro" && pwd == "1234" {
				NSLog("로그인 성공")
			}
			else {
				NSLog("로그인 실패")
			}
		}

		alert.addAction(cancelAction)
		alert.addAction(okAction)
		
//		alert.addAction(UIAlertAction(title: "Fail", style: UIAlertActionStyle.Default, handler: {$0; NSLog("Fail Button Clicked")})) // 위와 똑같은 표현. 변수하나를 받는 클로저이므로 받는 방법($0) 표현
	
		self.presentViewController(alert, animated: false, completion: nil)
	}
	
	
}

