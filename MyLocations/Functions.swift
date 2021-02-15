//
//  Functions.swift
//  MyLocations
//
//  Created by Melanie Kramer on 2/12/21.
//  Copyright © 2021 Melanie Kramer. All rights reserved.
//

import Foundation

// free function used anywhere
func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds,
                                  execute: run)
}

// contains path to apps documents directory
let applicationDocumentsDirectory: URL = {
    let paths = FileManager.default.urls(for: .documentDirectory,
                                         in: .userDomainMask)
    return paths[0]
}()

let CoreDataSaveFailedNotification =
    Notification.Name("CoreDataSaveFailedNotification")

// defines new global function for handling fatal core data errors
func fatalCoreDataError(_ error: Error) {
    print("*** Fatal error: \(error)")
    NotificationCenter.default.post(
        name: CoreDataSaveFailedNotification, object: nil)
}
