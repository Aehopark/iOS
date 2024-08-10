//
//  KeyChainManger.swift
//  Aehopark
//
//  Created by wodnd on 8/10/24.
//

import Foundation

class KeyChainManager {
    
    static let service = Bundle.main.bundleIdentifier
    
    // MARK: 키체인에 아이템 저장
    static func addItem(key: String, value: String) {
        
        let valueData = value.data(using: .utf8)!
        
        let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                kSecAttrService: service ?? "", // TODO: default 값으로 번들ID
                                kSecAttrAccount: key,
                                  kSecValueData: valueData]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecSuccess {
            print("KeyChainManager - add success")
            print("\(key): \(valueData)")
        } else if status == errSecDuplicateItem {   // key가 중복될 경우 업데이트
            updateItem(key: key, value: value)
        } else {
            print("KeyChainManager - add failed")
        }
    }
    
    // MARK: 키체인 아이템 조회
    static func readItem(key: String) -> String? {
        
        let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                kSecAttrService: service ?? "", // TODO: default 값으로 번들ID
                                kSecAttrAccount: key,
                           kSecReturnAttributes: true,
                                 kSecReturnData: true]
        
        var item: CFTypeRef?
        if SecItemCopyMatching(query as CFDictionary, &item) != errSecSuccess {
            print("KeyChainManager - read failed")
            return nil
        }
        
        guard let existItem = item as? [String:Any],
              let data = existItem[kSecValueData as String] as? Foundation.Data,
              let returnValue = String(data: data, encoding: .utf8) else {
            return nil
        }

        return returnValue
    }
    
    // MARK: 키체인 값 업데이트
    static func updateItem(key: String, value: String) {
        
        let valueData = value.data(using: .utf8)!
        
        let previousQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                        kSecAttrService: service ?? "", // TODO: default 값으로 번들ID
                                        kSecAttrAccount: key]
        
        let updateQuery: [CFString: Any] = [kSecValueData: valueData]
        
        let status = SecItemUpdate(previousQuery as CFDictionary, updateQuery as CFDictionary)
        
        if status == errSecSuccess {
            print("KeyChainManager - update complete")
        } else {
            print("KeyChainManager - not finished update")
        }
    }
    
    // MARK: 키체인 아이템 삭제
    static func deleteItem(key: String) {
        
        let deleteQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                      kSecAttrService: service ?? "",  // TODO: default 값으로 번들ID
                                      kSecAttrAccount: key]
        
        let status = SecItemDelete(deleteQuery as CFDictionary)
        if status == errSecSuccess {
            print("KeyChainManager - remove data complete")
        } else {
            print("KeyChainManager - remove data failed")
        }
    }
    
    // MARK: 키체인 아이템 존재 여부 확인
    static func itemExists(key: String) -> Bool {
        
        let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                kSecAttrService: service ?? "",  // TODO: default 값으로 번들ID
                                kSecAttrAccount: key,
                                 kSecMatchLimit: kSecMatchLimitOne,
                           kSecReturnAttributes: false]
        
        let status = SecItemCopyMatching(query as CFDictionary, nil)
        
        return status == errSecSuccess
        
    }
}
