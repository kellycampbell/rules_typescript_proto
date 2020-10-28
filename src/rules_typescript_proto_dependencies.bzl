load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@build_bazel_rules_nodejs//:index.bzl", "yarn_install")

def rules_typescript_proto_dependencies():
    """
    Installs rules_typescript_proto dependencies.

    Usage:

    # WORKSPACE
    load("@rules_typescript_proto//:index.bzl", "rules_typescript_proto_dependencies")
    rules_typescript_proto_dependencies()
    """

    yarn_install(
        name = "rules_typescript_proto_deps",
        package_json = "@rules_typescript_proto//:package.json",
        # Don't use managed directories because these are internal to the library and the
        # dependencies shouldn't need to be installed by the user.
        symlink_node_modules = False,
        yarn_lock = "@rules_typescript_proto//:yarn.lock",
    )

    http_archive(
        name = "io_bazel_rules_closure",
        sha256 = "fecda06179906857ac79af6500124bf03fe1630fd1b3d4dcf6c65346b9c0725d",
        strip_prefix = "rules_closure-03110588392d8c6c05b99c08a6f1c2121604ca27",
        urls = [
            "https://github.com/bazelbuild/rules_closure/archive/03110588392d8c6c05b99c08a6f1c2121604ca27.zip",
        ],
    )

    http_archive(
        name = "com_github_grpc_grpc_web",
        sha256 = "23cf98fbcb69743b8ba036728b56dfafb9e16b887a9735c12eafa7669862ec7b",
        strip_prefix = "grpc-web-1.2.1",
        urls = [
            "https://github.com/grpc/grpc-web/archive/1.2.1.tar.gz",
        ],
    )

