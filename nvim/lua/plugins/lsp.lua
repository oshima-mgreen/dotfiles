return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",
          "intelephense",
          "lua_ls",
        },
        automatic_enable = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf, silent = true }
          vim.keymap.set("n", "gd",         vim.lsp.buf.definition,     opts)
          vim.keymap.set("n", "gD",         vim.lsp.buf.declaration,    opts)
          vim.keymap.set("n", "gr",         vim.lsp.buf.references,     opts)
          vim.keymap.set("n", "gi",         vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "K",          vim.lsp.buf.hover,          opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,         opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,    opts)
          vim.keymap.set("n", "[d",         vim.diagnostic.goto_prev,   opts)
          vim.keymap.set("n", "]d",         vim.diagnostic.goto_next,   opts)
        end,
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
      vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>",  { silent = true })
      vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>",    { silent = true })
    end,
  },
}
