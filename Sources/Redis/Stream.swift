import Sockets

public var defaultHostname = "127.0.0.1"
public var defaultPort: UInt16 = 6379

public typealias TCPClient = Client<TCPInternetSocket>

extension Client where StreamType == TCPInternetSocket {
    public convenience init(
        hostname: String = defaultHostname,
        port: UInt16 = defaultPort,
        password: String? = nil
    ) throws {
        let socket = try TCPInternetSocket(
            hostname: hostname,
            port: port
        )
        try socket.connect()
        try self.init(socket, password: password)
    }
}
