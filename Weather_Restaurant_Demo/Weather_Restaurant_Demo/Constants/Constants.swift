//
//  Constants.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 23/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import UIKit

//struct Global{
//    static var APP_MANAGER                   = AppStateManager.sharedInstance
//    //    static var APP_REALM                     = APP_MANAGER.realm
//    static var APP_COLOR                     = UIColor(red:0.80, green:0.25, blue:0.25, alpha:1.0)
//}

struct ColorConstant {
    
    static var LOADER_COLOR = UIColor(red: 53/255, green: 155/255, blue: 206/255, alpha: 1)
    static let THEME_COLOR = "167AAC"
    static let TABLE_VIEW_SECTION_COLOR = "F2F4F8"
    
    static let DEFAULT_SHADE_COLOR = "B4C5D7"
}

struct Constants {
    
    static let kWINDOW_FRAME                                    = UIScreen.main.bounds
    static let kSCREEN_SIZE                                     = UIScreen.main.bounds.size
    static let kWINDOW_WIDTH                                    = UIScreen.main.bounds.size.width
    static let kWINDOW_HIEGHT                                   = UIScreen.main.bounds.size.height
    
    static let APP_DELEGATE                                     = UIApplication.shared.delegate as! AppDelegate
    static let UIWINDOW                                         = UIApplication.shared.delegate!.window!
    static let USER_DEFAULTS                                    = UserDefaults.standard
    
    static let APP_ID = "dc4801451a2a6f2a725721299c7c4e99"
    static let RESTAURANT_ID = "AIzaSyASsrdsiQ9XYq0Pd6lU-o4lxBRrFE_hUno"
    
    // USER DEFAULTS
    static let USER_LOGGED_IN = "user_logged_in";
    static let IS_TUTORIAL_SHOWN = "is_tutorial_shown";
    static let DEVICE_TOKEN = "device_token";
    static let DEVICE_ID = "device_id";
    static let USER_NAME = "fullName";
    static let USER_EMAIL = "email";
    static let SOURCE = "7"
    static let ACCESS_TOKEN = "access_token";
    
    static let DEFAULTS_USER_KEY           = "User"
    static let USER_DATA_KEY = "user_data"
    static let LOCATION_KEY = "location_data"
    
    // String Constants
    static let IMPLEMENTED_LATER = "Implemented Later"
    static let Store_Closed = "Store is Closed"
    
    // Keyboard Constants
    static let FINISH_KEYBOARD = "Done"
    
    // Storybaord and Cell Navigation Constants
    static let MAIN_STORYBOARD = "Main"
    
    
    //MARK:- HELPER ATTRIBUTES
    static var DeviceToken                     = "123456789"
    static let serverDateFormat = "yyyy-MM-dd HH:mm:ss"
    static let PAGINATION_PAGE_SIZE        = 100
    
    //MARK: - Base URLs
    static let BaseURL                = ""
    static let BaseURLFORLISTING      = ""
    static let LANGUIGEID = 1;
    static let STATUSID = 1;
    static let VENDOR_TYPE_ID = 1;
    static let PAYMENT_METHOD_ID = 1;
    static let CURRENCY_ID = 1;
    
    static let NO_INTERNET            = NSLocalizedString("No internet connection!", comment: "")
}

struct ViewControllerTitleConstants {
    static let HOME = "Home"
}

struct SideMenuConstant {
    static let HOME = "Home"
}

struct ValidationConstant {
    
    static let ALERT = "Alert"
    static let OK = "Ok"
    static let EMPTY_MESSAGE = "Empty message can't be sent."
    static let EMPTY_COMPANY_NAME = "Company name field is empty."
    static let EMPTY_USERNAME = "User name field is empty."
    static let EMPTY_PASSWORD = "Password field is empty."
    static let PASSWORD_LENGTH = "Password must be greater than or equal to 6 digits."
    static let EMPTY_EMAIL = "Email field is empty."
    static let INVALID_EMAIL = "Invalid email."
    static let EMPTY_NEW_PASSWORD = "New password field is empty."
    static let EMPTY_CONFIRM_PASSWORD = "Confirm password field is empty."
    static let PASSWORD_NOT_MATCH = "New and confirm password field does not match."
    
}

struct UserDefaultConstant {
    static let Login_status_userDefault = "Login_status"
    static let User_data_userDefault = "User_data_userDefault"
    static let auth_token_userDefault = "auth_token"
    static let FcmPushToken = "FcmPushToken"
    static let Localization = "Localization"
}

struct ApiErrorMessage {
    static let NoNetwork = NSLocalizedString("No internet connection!", comment: "")
    static let TimeOut = NSLocalizedString("Connection Timeout.", comment: "")
    static let ErrorOccured = NSLocalizedString("An error occurred. Please try again.", comment: "")
    static let BadRequest = NSLocalizedString("Bad Request.", comment: "")
}
struct ApiResultFailureMessage {
    static let InvalidEmailPassword = NSLocalizedString("Invalid email or password.", comment: "")
    static let WrongEmailInForgotPassword = NSLocalizedString("User with entered email doesn’t exist.", comment: "")
}
struct FieldsErrorMessage {
    static let EmailExist = NSLocalizedString("User with entered email address already exists", comment: "")
    static let UsernameExist = NSLocalizedString("This username is already taken, please try another", comment: "")
    static let UsernameValidity = NSLocalizedString("Please enter a valid username", comment: "")
    static let EmailValidity = NSLocalizedString("Please enter a valid email address", comment: "")
    static let ShortPassword = NSLocalizedString("This password is too short", comment: "")
    static let NewOldPasswordMatch = NSLocalizedString("New password cannot be same as old password.", comment: "")
    static let PasswordMisMatch = NSLocalizedString("Passwords do not match.", comment: "")
}
struct PopupMessage {
    static let PasswordChanged = NSLocalizedString("An email has been sent to your account with new password.", comment: "")
    static let PasswordChangedSuccess = NSLocalizedString("Password changed successfully.", comment: "")
    static let InternetOffline = NSLocalizedString("Internet connection seems to be offline, Pleas try again.", comment: "")
}
