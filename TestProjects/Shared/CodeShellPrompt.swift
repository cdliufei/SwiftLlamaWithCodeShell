//
//  CodeShellPrompt.swift
//  TestApp
//
//  Created by Liu Fei on 2024/5/30.
//

import Foundation
import SwiftLlama

extension Prompt {
    func encodeCodeshellPrompt() -> String {
        var prompt = ""
        prompt.append("|<end>|## human:")
        prompt.append(userMessage.replacingOccurrences(of: "\n", with: ""))
        prompt.append("|end|## assistant:")
        prompt.append("".replacingOccurrences(of: "\n", with: ""))
        return prompt;
    }
    public enum `Type` {
        case chatML
        case alpaca
        case llama
        case llama3
        case mistral
        case phi
        case codeshell
    }
    var prompt: String {
        switch type {
        case .codeshell:encodeCodeshellPrompt()
        }
    }
}

public struct CodeShellPrompt {
    
    public enum `Type` {
      
        case codeshell
    }

    public let type: `Type`
    public let systemPrompt: String
    public let userMessage: String
    public let history: [Chat]

    public init(type: `Type`,
                systemPrompt: String = "",
                userMessage: String,
                history: [Chat] = []) {
        self.type = type
        self.systemPrompt = systemPrompt
        self.userMessage = userMessage
        self.history = history
    }

    var prompt: String {
        switch type {
        case .codeshell:encodeCodeshellPrompt()
        }
    }

    private func encodeCodeshellPrompt() -> String {
        var prompt = ""
        prompt.append("|<end>|## human:")
        prompt.append(userMessage.replacingOccurrences(of: "\n", with: ""))
        prompt.append("|end|## assistant:")
        prompt.append("".replacingOccurrences(of: "\n", with: ""))
        return prompt;
    }
}

