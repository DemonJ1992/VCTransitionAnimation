//
//  BTManager.swift
//  VCTransitionAnimation
//
//  Created by DuJian on 16/1/22.
//  Copyright © 2016年 du. All rights reserved.
//

import Foundation
import CoreBluetooth

class BTManager : NSObject, CBCentralManagerDelegate, CBPeripheralDelegate, CBPeripheralManagerDelegate {
    
    static let manager : BTManager! = BTManager()
    
    let centralManager : CBCentralManager! = CBCentralManager(delegate: manager, queue: nil)
    
    let peripheralManager : CBPeripheralManager! = CBPeripheralManager(delegate: manager, queue: nil)
    
    static func sharedManager() -> BTManager {
        return manager
    }
    
    override init() {
        
    }
    
    //MARK:- central manager delegate
    func centralManagerDidUpdateState(central: CBCentralManager) {
        print("central manager did update state : \(central.state)")
        switch central.state {
        case .Unknown:
            
            break;
        case .Resetting:
            
            break;
        case .Unsupported:
            
            break;
        case .Unauthorized:
            
            break;
        case .PoweredOff:
            
            break;
        case .PoweredOn:
            
            break;
        }
    }
    
    func centralManager(central: CBCentralManager, willRestoreState dict: [String : AnyObject]) {
        print("central manager will restore state : \(dict)")
    }
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        print("central manager did discover peripheral : \(peripheral), advertisement data : \(advertisementData) RSSI : \(RSSI)")
    }
    
    func centralManager(central: CBCentralManager, didFailToConnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        print("central manager fail to connect peripheral : \(peripheral)")
        if let connectFailError = error {
            print("with error : \(connectFailError)")
        }
    }
    
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        print("central manager did connect peripheral : \(peripheral)")
    }
    
    func centralManager(central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        print("cental manager did disconnect peripheral: \(peripheral)")
        if let disconnectError = error {
            print("with error : \(disconnectError)")
        }
    }
    
    //MARK:- peripheral delegate
    func peripheral(peripheral: CBPeripheral, didDiscoverCharacteristicsForService service: CBService, error: NSError?) {
        print("peripheral did discover characteristic for service : \(service)")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didDiscoverDescriptorsForCharacteristic characteristic: CBCharacteristic, error: NSError?) {
        print("peripheral did discover descriptors for characteristic : \(characteristic)")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didDiscoverIncludedServicesForService service: CBService, error: NSError?) {
        print("peripheral did discover included services for service : \(service)")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?) {
        print("peripheral did discover service")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]) {
        print("peripheral did modify services : \(invalidatedServices)")
    }
    
    func peripheral(peripheral: CBPeripheral, didReadRSSI RSSI: NSNumber, error: NSError?) {
        print("peripheral did read RSSI : \(RSSI)")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didUpdateNotificationStateForCharacteristic characteristic: CBCharacteristic, error: NSError?) {
        print("peripheral did update notification state for characteristic : \(characteristic)")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didUpdateValueForCharacteristic characteristic: CBCharacteristic, error: NSError?) {
        print("peripheral did update value for characteristic : \(characteristic)")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didUpdateValueForDescriptor descriptor: CBDescriptor, error: NSError?) {
        print("peripheral did update value for descriptor : \(descriptor)")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didWriteValueForCharacteristic characteristic: CBCharacteristic, error: NSError?) {
        print("peripheral did write value characteristic : \(characteristic)")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    func peripheral(peripheral: CBPeripheral, didWriteValueForDescriptor descriptor: CBDescriptor, error: NSError?) {
        print("peripheral did write value for descriptor : \(descriptor)")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    func peripheralDidUpdateName(peripheral: CBPeripheral) {
        print("peripheral did update name")
    }
    
    func peripheralDidUpdateRSSI(peripheral: CBPeripheral, error: NSError?) {
        print("peripheral did update RSSI")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    //MARK:- peripheral manager delegate
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager) {
        print("peripheral manager did update state : \(peripheral.state)")
        switch peripheral.state {
        case .Unknown:
            break;
        case .Resetting:
            break;
        case .Unsupported:
            break;
        case .Unauthorized:
            break;
        case .PoweredOff:
            break;
        case .PoweredOn:
            break;
        }
    }
    
    func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager, error: NSError?) {
        print("peripheral manager did start advertising")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    func peripheralManager(peripheral: CBPeripheralManager, willRestoreState dict: [String : AnyObject]) {
        print("peripheral manager will restore state \(dict)")
    }
    
    func peripheralManager(peripheral: CBPeripheralManager, didAddService service: CBService, error: NSError?) {
        print("peripheral manager did add service \(service)")
        if let discoverError = error {
            print("with error : \(discoverError)")
        }
    }
    
    func peripheralManager(peripheral: CBPeripheralManager, didReceiveWriteRequests requests: [CBATTRequest]) {
        print("peripheral manager did receive wirte requests : \(requests)")
    }
    
    func peripheralManager(peripheral: CBPeripheralManager, didReceiveReadRequest request: CBATTRequest) {
        print("peripheral manager did receive read request : \(request)")
    }
    
    func peripheralManagerIsReadyToUpdateSubscribers(peripheral: CBPeripheralManager) {
        print("peripheral manager is ready to update subscribers")
    }
    
    func peripheralManager(peripheral: CBPeripheralManager, central: CBCentral, didSubscribeToCharacteristic characteristic: CBCharacteristic) {
        print("peripheral manager central : \(central) did subscribe to characteristic : \(characteristic)")
    }
    
    func peripheralManager(peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFromCharacteristic characteristic: CBCharacteristic) {
        print("peripheral manager central : \(central) did unsubscribe from characteristic : \(characteristic)")
    }
    
    
}
