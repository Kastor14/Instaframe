////
////  CloudManagement.swift
////  BlueBulk
////
////  Created by Jean-Baptiste Waring on 2020-11-21.
////
//
//import Foundation
//import CloudKit
//
//extension ContentView {
//
////FETCH RECORDS AND STORE THEM TO localDatabase array of CKRecords?
//    func fetchPostDatabase(){
//        localDatabase.removeAll();
////        let pred = NSPredicate(value: true)
//        let sort = NSSortDescriptor(key: "userID", ascending: true)
//        let query = CKQuery(recordType: "InstaframePost", predicate: pred)
//            query.sortDescriptors = [sort]
//
//        let operation = CKQueryOperation(query: query)
//            operation.desiredKeys = nil; // Will Return All Keys
//        operation.resultsLimit = 256;
//        operation.recordFetchedBlock = { record in
//            self.localDatabase.append(record);
//            }
//
//            operation.queryCompletionBlock = {(cursor, error) in
//                DispatchQueue.main.async {
//                    if error == nil {
//                        print("Number of record fetched from iCloud: \(self.localDatabase.count)");
//                       // self.printDBContent();
//                        
//                    } else {
//                        print(error!.localizedDescription)
//                    }
//                    
//                }
//            }
//
//            CKContainer.default().publicCloudDatabase.add(operation)
//        
//    }
//    func saveRecordtoDB(withRecord: CKRecord){
//        
//     publicDatabase.save(withRecord, completionHandler: { (newRecord, error) in
//                      
//                      if error == nil {
//                          
//                          print("Record Saved")
//                        DispatchQueue.main.async {
//                            //Show User Record is Saved.
//                           // self.recordSaveSuccess.stringValue = "Success creating record with serial:\n\(withRecord.object(forKey: "deviceSerial") as? String ?? "nil") to iCloud."
//                        }
//                        self.fetchPostDatabase();
//                          
//                      } else {
//                          
//                          print("Record Not Saved")
//                        print(error as Any);
//                        DispatchQueue.main.async {
//                            //Show User Record is Saved.
//                            //self.recordSaveSuccess.stringValue = "Failure to Create Record."
//                        }
//                          
//                      }
//                      
//                  })
//                  
//              
//        
//    }
//    func fetchDataBaseRepairs(lookingForSerial: String){
//        localDatabase.removeAll();
//        let pred = NSPredicate(value: true)
//        let sort = NSSortDescriptor(key: "userID", ascending: true)
//        let query = CKQuery(recordType: "InstaframePost", predicate: pred)
//            query.sortDescriptors = [sort]
//
//        let operation = CKQueryOperation(query: query)
//            operation.desiredKeys = nil; // Will Return All Keys
//        operation.resultsLimit = 256;
//        operation.recordFetchedBlock = { record in
//            self.localDatabase.append(record);
//            }
//
//            operation.queryCompletionBlock = {(cursor, error) in
//                DispatchQueue.main.async {
//                    if error == nil {
//                        print("Number of record fetched from iCloud: \(self.localDatabase.count)");
//                        //self.printDBContent();
//                        if self.recordWithSerialExists(searchSerial: lookingForSerial) == true{
//                            // Record Exists, Update View
//                            print("Found Record After Update")
////                            self.updateViewWithRecordWithSerial(searchSerial: self.searchFieldTextField.stringValue)
//                        }
//                        if self.recordWithSerialExists(searchSerial: lookingForSerial) == false{
//                            print("Did not Find Record After Update")
//                          //  self.createNewRecord(withSerial: lookingForSerial);
//                            
//                            
//                            
//                        }
//                        
//                    } else {
//                        print(error!.localizedDescription)
//                    }
//                    
//                }
//            }
//
//            CKContainer.default().publicCloudDatabase.add(operation)
//        
//    }
//    func recordWithSerialExists(searchSerial: String) -> Bool {
//        
//        for record in localDatabase {
//            if (record?.object(forKey: "deviceSerial") as? String ?? "") == searchSerial {
//                return true
//            }
//        }
//        
//        return false
//    }
//}
//    
////Does a record with given serial exist?
//    
//    
//
////Display Existing Record.
////
////    func updateViewWithRecordWithSerial(searchSerial: String) {
////
////        for results in localDatabase{
////            if (results?.object(forKey: "deviceSerial") as? String ?? "") == searchSerial {
////                //UPDATE VIEW HERE
////                DispatchQueue.main.async {
////                    self.currentRecordShown.removeAll();
////                    self.currentRecordShown.append(results);
////                    print("Current Record Shown ID: \(String(describing: self.currentRecordShown[0]?.recordID))"); // show its ID
////                    self.deviceTypeTextField.stringValue = results?.object(forKey: "deviceType") as? String ?? ""
////                    self.returnTracking.stringValue = results?.object(forKey: "returnTracking") as? String ?? ""
////                    self.problemType.stringValue = results?.object(forKey: "problemField") as? String ?? ""
////                    self.purchaseOrder.stringValue = results?.object(forKey: "poField") as? String ?? ""
////                    self.serialKGB.stringValue = results?.object(forKey: "serialKGB") as? String ?? ""
////                    self.repairStateSegment.selectedSegment = results?.object(forKey: "repairProgress") as? Int ?? 0
////                    self.repairStateProgressBar.floatValue = Float(results?.object(forKey: "repairProgress") as? Int ?? 0)*0.25;
////                    self.valueVMI.floatValue = results?.object(forKey: "vmiStatus") as? Float ?? 2
////                    self.repairNotes.stringValue = results?.object(forKey: "noteField") as? String ?? ""
////                    self.repairNo.stringValue = results?.object(forKey: "repairNo") as? String ?? ""
////                    self.vmiValueTextField.stringValue = self.vmiTable[Int(self.valueVMI.floatValue)-1];
////                    self.currentRecordValueField.stringValue = "Record: \(results?.object(forKey: "deviceSerial") as? String ?? "")"
////                    let formatter = DateFormatter()
////                    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
////                    let createdDate = formatter.string(from: results?.creationDate as! Date)
////                    let modifiedDate = formatter.string(from: results?.modificationDate as! Date)
////                    self.createdDateValue.stringValue = "Created: \(createdDate).";
////                    self.modifiedDateValue.stringValue = "Modified: \(modifiedDate).";
////                    let warranty = results?.object(forKey: "warrantyStatus") as? String ?? ""
////                    if warranty == "ALW" {
////                        self.warrantyStatusBar.setSelected(true, forSegment: 0)
////                    }
////                    if warranty == "OOW" {
////                        self.warrantyStatusBar.setSelected(true, forSegment: 1)
////                    }
////
////                }
////
////
////                return
////            }
////
////        }
////
////        print("Record Not Found in Local Database");
////    }
//    
////    func saveChangesToRecordShown(){
////        if currentRecordShown.isEmpty == true { print("No Record is Shown"); return;}
////        let currentRecordID = (currentRecordShown[0]?.recordID)!
////        publicDatabase.fetch(withRecordID: currentRecordID) { (record, error) in
////
////              if error == nil {
////                DispatchQueue.main.async {
////                    record?.setValue(self.returnTracking.stringValue, forKey: "returnTracking")
////                    record?.setValue(self.deviceTypeTextField.stringValue, forKey: "deviceType")
////                    record?.setValue(self.purchaseOrder.stringValue, forKey: "poField")
////                    record?.setValue(self.problemType.stringValue, forKey: "problemField")
////                    record?.setValue(Int(self.repairStateSegment.floatValue), forKey: "repairProgress")
////                    record?.setValue(self.serialKGB.stringValue, forKey: "serialKGB")
////                    record?.setValue(Int(self.valueVMI.floatValue), forKey: "vmiStatus")
////                    record?.setValue(self.repairNo.stringValue, forKey: "repairNo")
////                    record?.setValue(self.repairNotes.stringValue, forKey: "noteField")
////                    if self.warrantyStatusBar.selectedSegment == 0 {
////                        record?.setValue("ALW", forKey: "warrantyStatus")
////                    } else if self.warrantyStatusBar.selectedSegment == 1 {
////                        record?.setValue("OOW", forKey: "warrantyStatus")
////                    }
////
////                }
////                  self.publicDatabase.save(record!, completionHandler: { (newRecord, error) in
////
////                      if error == nil {
////
////                          print("Record Saved")
////                        DispatchQueue.main.async {
////                            //Show User Record is Saved.
////                            self.recordSaveSuccess.stringValue = "Success saving record with serial:\n\(record?.object(forKey: "deviceSerial") as? String ?? "nil") to iCloud."
////                        }
////                        self.fetchDataBaseRepairs();
////
////                      } else {
////
////                          print("Record Not Saved")
////                        print(error as Any);
////                        DispatchQueue.main.async {
////                            //Show User Record is Saved.
////                            self.recordSaveSuccess.stringValue = "Failure to Save Record."
////                        }
////
////                      }
////
////                  })
////
////              } else {
////
////                  print("Could not fetch record")
////
////              }
////
////          }
//        
//        
//
//   
////    func createNewRecord(withSerial: String){
////
////        print("Lets create new record");
//////        let alert = NSAlert();
////        alert.messageText = "Unknown Serial No."
////        alert.informativeText = "Could Not Find Record with Serial\n\(withSerial)\nin iCloud Database.\nWould you like to create the entry?"
////        alert.addButton(withTitle: "No.")
////        alert.addButton(withTitle: "Create New Entry")
////        alert.beginSheetModal(for: self.view.window!) { (response) in
////            if response == NSApplication.ModalResponse.alertFirstButtonReturn {
////                print("NO")
////                DispatchQueue.main.async {
////                    //Clear Current View
////                }
////            } else if response == NSApplication.ModalResponse.alertSecondButtonReturn{
////                print("OK")
////                let newRecord = CKRecord(recordType: "iPodDataBase")
////                newRecord.setValue(withSerial, forKey: "deviceSerial");
////                self.saveRecordtoDB(withRecord: newRecord)
////                DispatchQueue.main.async {
////                    self.recordSaveSuccess.stringValue = "Success Creating Record with Serial:\n\(withSerial)\n to iCloud."
////                }
////            }
////                }
////    }
////
//    
//    
//    
//    
//    
//   
//
//
