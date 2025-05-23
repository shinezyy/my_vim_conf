local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins.colorscheme" },
    -- { import = "plugins.copilot_related" ,lazy = true },
    {
      "scalameta/nvim-metals",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      ft = { "scala", "sbt", "java" },
      opts = function()
        local metals_config = require("metals").bare_config()
        metals_config.on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
        end

        return metals_config
      end,
      lazy = false,
      config = function(self, metals_config)
        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
          pattern = self.ft,
          callback = function()
            require("metals").initialize_or_attach(metals_config)
          end,
          group = nvim_metals_group,
        })
      end,
    }, -- import/override with your plugins

    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v4.x",
      config = function()
        local lsp_zero = require("lsp-zero")
        local map = vim.keymap.set

        lsp_zero.on_attach = function(client, bufnr)
          require("metals").setup_dap()
          map("n", "gD", vim.lsp.buf.definition)
        end
        ---
        -- Create the configuration for metals
        ---
        local metals_config = require("metals").bare_config()
        metals_config.capabilities = lsp_zero.get_capabilities()

        ---
        -- Autocmd that will actually be in charging of starting metals
        ---
        local metals_augroup = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
          group = metals_augroup,
          pattern = { "scala", "sbt", "java" },
          callback = function()
            require("metals").initialize_or_attach(metals_config)
          end,
        })

        vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
          pattern = "*.inc",
          callback = function(args)
            -- Set filetype to 'cpp' or 'c' based on your project
            vim.bo[args.buf].filetype = "c"
          end,
        })

        require'lspconfig'.jedi_language_server.setup{}

        local use_copilot = false
        -- Conditionally import copilot_related.lua if use_copilot is true
        if use_copilot then
          require("plugins.copilot_related")
        end
        
        local cmp = require("cmp")

        cmp.setup({
          sources = {
            use_copilot and { name = "copilot" } or {},
            { name = "nvim_lsp" },
            { name = "path" },
          },
          mapping = cmp.mapping.preset.insert({
            ["<CR>"] = cmp.mapping.confirm({
              -- documentation says this is important.
              -- I don't know why.
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            }),
            ['<Tab>'] = function(fallback)
              if cmp.visible() then
                cmp.select_next_item() -- Select the next completion item
              else
                fallback() -- Use default behavior (e.g., inserting a tab character)
              end
            end,
            ['<S-Tab>'] = function(fallback)
              if cmp.visible() then
                cmp.select_prev_item() -- Select the previous completion item
              else
                fallback() -- Use default behavior
              end
            end,
          }),
        })

        -- lsp_zero.extend_lspconfig({
        --   capabilities = require("cmp_nvim_lsp").default_capabilities(),
        -- })
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local lspconfig = require("lspconfig")
        lspconfig.clangd.setup({
          on_attach = function(client, bufnr)
            -- Disable automatic formatting
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
          capabilities = cmp_nvim_lsp.default_capabilities(),
          cmd = { "clangd", "--offset-encoding=utf-16" },
        })
      end,
    },
    {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
    },
    {
      'cameron-wags/rainbow_csv.nvim',
      config = true,
      ft = {
        'csv',
        'tsv',
        'csv_semicolon',
        'csv_whitespace',
        'csv_pipe',
        'rfc_csv',
        'rfc_semicolon'
      },
      cmd = {
        'RainbowDelim',
        'RainbowDelimSimple',
        'RainbowDelimQuoted',
        'RainbowMultiDelim'
      }
    },

  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.opt.mouse = ""
vim.g.autoformat = false

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

