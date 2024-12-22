//
//  Logger.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-10.
//

import Foundation
import SwiftUI
enum LogLevel: String {
    case info = "ℹ️"
    case success = "✅"
    case warning = "⚠️"
    case error = "❌"
    
    var textColor: Color {
        switch self {
        case .info: return .blue
        case .success: return .green
        case .warning: return .orange
        case .error: return .red
        }
    }
}

class Logger {
    
    private let origin: String
    
    init(origin: String) {
        self.origin = origin
    }
    
    func log(_ message: String, level: LogLevel = .info, function: String = #function) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
        let logMessage = "\(origin) [\(timestamp)] \(level.rawValue) \(function): \(message)"

        print(logMessage)
        
        #if DEBUG
        #endif
    }
    
    func formatOptional<T>(_ value: T?, defaultvalue: String = "nil") -> String {
        if let value = value {
            return "\(value)"
        }
        return defaultvalue
    }
}
