// Copyright 2022-2023 Buf Technologies, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import SwiftProtobuf

/// Represents a client-only stream (a stream where the client streams data to the server and
/// eventually receives a response) that can send request messages and initiate closes.
public protocol ClientOnlyStreamInterface<Input> {
    /// The input (request) message type.
    associatedtype Input: SwiftProtobuf.Message

    /// Send a request to the server over the stream.
    ///
    /// - parameter input: The request message to send.
    ///
    /// - returns: An instance of this stream, for syntactic sugar.
    @discardableResult
    func send(_ input: Input) throws -> Self

    /// Close the stream. No calls to `send()` are valid after calling `close()`.
    func close()
}
