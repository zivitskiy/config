vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.cmd('syntax on')
vim.cmd('colorscheme xcodedark')
vim.api.nvim_command('command! Q quit')
vim.api.nvim_command('command! W write')
vim.api.nvim_command('command! WQ wq')
vim.api.nvim_command('command! Wq wq')

vim.g.mapleader = " "  -- space

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.o.mouse = 'a'

vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not vim.loop.fs_stat(vim.fn.stdpath("data") .. "/lazy/lazy.nvim") then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
  })
end

require('lazy').setup({
  'nvim-treesitter/nvim-treesitter',
  'luckasRanarison/nvim-devdocs',
  'akinsho/toggleterm.nvim',
  'RRethy/vim-illuminate',
  's1n7ax/nvim-window-picker',
  'airblade/vim-gitgutter',
  'romgrk/barbar.nvim',
  'kyazdani42/nvim-web-devicons',
  'mattn/emmet-vim',
  'tpope/vim-fugitive',
  'ctrlpvim/ctrlp.vim',
  'nvim-telescope/telescope.nvim',
  'nvim-lua/plenary.nvim',
  'lewis6991/gitsigns.nvim',
  'mhinz/vim-signify',
  'junegunn/fzf',
  'junegunn/fzf.vim',
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'tpope/vim-obsession',
  'jiangmiao/auto-pairs',
  'sheerun/vim-polyglot',
  'lewis6991/impatient.nvim',
  'ryanoasis/vim-devicons',
  'lukas-reineke/indent-blankline.nvim',
  'sindrets/diffview.nvim',
  'stevearc/dressing.nvim',
  { "folke/which-key.nvim", config = function() require("which-key").setup() end },
  {
    'mikesmithgh/borderline.nvim',
    enabled = true,
    lazy = true,
    event = 'VeryLazy',
    config = function()
      require('borderline').setup({
        border = {
          [1] = "┌",
          [2] = "─",
          [3] = "┐",
          [4] = "│",
          [5] = "┘",
          [6] = "─",
          [7] = "└",
          [8] = "│"
        }
      })
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  'folke/lsp-colors.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  "muniftanjim/nui.nvim",
  "nvimdev/lspsaga.nvim",
})
    vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
    vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
    vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
    vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
    vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })
    vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show All Xcodebuild Actions" })
    vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
    vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
    vim.keymap.set("n", "<leader>xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
    vim.keymap.set("n", "<leader>xC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report" })
    vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })

vim.api.nvim_set_keymap('n', '<C-L>', ':Neotree toggle<CR>', { noremap = true, silent = true })

vim.cmd([[ 
  augroup NeoTreeAutoOpen
    autocmd!
    autocmd VimEnter * Neotree show
  augroup END
]])

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Prevent yanking when deleting
local delete_keymaps = {
  'dd', 'd$', 'd^', 'd0', 'dG', 'dgg', 'd%', 'd_', 'd}', 'd{', 'd(', 'd)', 'd<CR>'
}
for _, key in ipairs(delete_keymaps) do
  vim.api.nvim_set_keymap('n', key, '"_d' .. key:sub(2), { noremap = true, silent = true })
end

require('telescope').setup{
  defaults = {
    file_sorter = require'telescope.sorters'.get_fzy_sorter,
    prompt_prefix = "🔍 ",
    color_devicons = true,
  }
}

vim.api.nvim_set_keymap('n', '<C-d>', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, silent = true })

vim.g.user_emmet_leader_key = '<C-y>'
vim.api.nvim_set_keymap('i', '<S-Tab>', '<Plug>(emmet-expand-abbr)', { noremap = true, silent = true })

vim.cmd [[
  highlight BufferCurrent guifg=#ffffff guibg=#282c34 gui=bold
  highlight BufferVisible guifg=#ffffff guibg=#44475a
  highlight BufferInactive guifg=#6272a4 guibg=#282c34
  highlight BufferTabpages guifg=#ff5555 guibg=#282c34
]]

vim.cmd [[
  augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight BufferCurrent guifg=#ffffff guibg=#282c34 gui=bold
    autocmd ColorScheme * highlight BufferVisible guifg=#ffffff guibg=#44475a
    autocmd ColorScheme * highlight BufferInactive guifg=#6272a4 guibg=#282c34
    autocmd ColorScheme * highlight BufferTabpages guifg=#ff5555 guibg=#282c34
  augroup END
]]

require("toggleterm").setup {
  size = 10,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1',
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'shadow',
    winblend = 3,
  }
}

vim.cmd [[
  highlight Todo guifg=#ff0000
]]

vim.o.scrolloff = 10

require('window-picker').setup({
  selection_chars = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  border = 'rounded',
  show_prompt = false
})

vim.api.nvim_exec([[
  augroup AutoResizeWindows
    autocmd!
    autocmd VimResized * wincmd =
  augroup END
]], false)

local function customfile()
  local icon = {
    unix = '',
    mac = '',
    dos = ''
  }
  local fmt = vim.bo.fileformat
  return icon[fmt] or fmt
end

local function apple()
  local icon = ' '
  return icon
end



require("neo-tree").setup {
  close_if_last_window = true,
  enable_git_status = true,
  enable_diagnostics = true,

  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    
    window = {
      position = "right",
      width = 30,
    },
  },
}

local lspconfig = require('lspconfig')

lspconfig.sourcekit.setup {
  cmd = { "sourcekit-lsp" },
  filetypes = { "swift", "objective-c", "objective-cpp" },
  root_dir = lspconfig.util.root_pattern("*.xcodeproj", "*.xcworkspace"),
}

local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lspconfig.pyright.setup {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = lspconfig.util.root_pattern("setup.py", "setup.cfg", "pyproject.toml", ".git"),
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic", -- or "strict", "off"
            },
        },
    },
}

local cmp = require'cmp'

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'cmdline' },
  },
})


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'horizon',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {apple, 'mode'},
    lualine_b = {'branch', 'diff', {'diagnostics', sources = {'nvim_lsp'}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', customfile, 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
}

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float(nil, { scope = "line" })<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
