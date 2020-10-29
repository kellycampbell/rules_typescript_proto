load("//src:typescript_proto_library.bzl", _typescript_proto_library = "typescript_proto_library")

def typescript_grpc_web_library(name, proto, mode="grpcweb"):
    _typescript_proto_library(
        name = name,
        proto = proto,
        mode = mode,
        generate = "grpc-web",
    )
