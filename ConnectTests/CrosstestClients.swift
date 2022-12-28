//
// Copyright 2022 Buf Technologies, Inc.
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
//

import Connect
import Foundation

final class CrosstestClients {
    let connectJSONClient: ProtocolClient
    let connectProtoClient: ProtocolClient
    let grpcWebJSONClient: ProtocolClient
    let grpcWebProtoClient: ProtocolClient

    init(timeout: TimeInterval, responseDelay: TimeInterval?) {
        let httpClient = CrosstestHTTPClient(
            timeout: timeout, delayAfterChallenge: responseDelay
        )
        let target = "https://localhost:8081"

        self.connectJSONClient = ProtocolClient(
            target: target,
            httpClient: httpClient,
            ConnectClientOption(),
            JSONClientOption(),
            GzipRequestOption(compressionMinBytes: 10),
            GzipCompressionOption()
        )
        self.connectProtoClient = ProtocolClient(
            target: target,
            httpClient: httpClient,
            ConnectClientOption(),
            ProtoClientOption(),
            GzipRequestOption(compressionMinBytes: 10),
            GzipCompressionOption()
        )
        self.grpcWebJSONClient = ProtocolClient(
            target: target,
            httpClient: httpClient,
            GRPCWebClientOption(),
            JSONClientOption(),
            GzipRequestOption(compressionMinBytes: 10),
            GzipCompressionOption()
        )
        self.grpcWebProtoClient = ProtocolClient(
            target: target,
            httpClient: httpClient,
            GRPCWebClientOption(),
            ProtoClientOption(),
            GzipRequestOption(compressionMinBytes: 10),
            GzipCompressionOption()
        )
    }
}
