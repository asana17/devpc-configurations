require("lspconfig").dartls.setup({
    cmd = { "dart", "language-server", "--protocol=lsp" },
    filetypes = { "dart" },
    init_options = {
        closingLabels = true,
        flutterOutline = true,
        onlyAnalyzeProjectsWithOpenFiles = true,
        outline = true,
        suggestFromUnimportedLibraries = true,
    },
    -- root_dir = root_pattern("pubspec.yaml"),
    settings = {
        dart = {
            completeFunctionCalls = true,
            showTodos = true,
        },
    },
})
