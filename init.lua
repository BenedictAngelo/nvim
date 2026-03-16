-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.lsp.config('rust_analyzer', {
  -- Other Configs ...
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        features = "all",
      },
      procMacro = {
        ignored = {
          leptos_macro = {
            -- optional: --
            -- "component",
            "server",
          },
        },
      },
    },
  }
})
