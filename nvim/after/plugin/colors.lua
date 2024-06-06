-- -- TOKYO NIGHT THEME --
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
--
-- -- Load the colorscheme
-- vim.cmd[[colorscheme tokyonight-night]]

-- MATERIAL DEEP OCEAN THEME --
-- vim.g.material_style = "deep ocean"
-- vim.cmd('colorscheme material')

-- -- ROSE PINE THEME --
-- require('rose-pine').setup({
-- 	--- @usage 'main' | 'moon'
-- 	dark_variant = 'moon',
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = false,
-- 	disable_float_background = false,
-- 	disable_italics = true,
--
--      enable = {
--         terminal = true,
--         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--         migrations = true, -- Handle deprecated options automatically
--     },
--
--     styles = {
--         bold = true,
--         italic = true,
--         transparency = false,
--     },
--
--
-- 	--- @usage string hex value or named color from rosepinetheme.com/palette
-- 	groups = {
-- 		panel = 'surface',
-- 		border = 'highlight_med',
-- 		comment = 'muted',
-- 		link = 'iris',
-- 		punctuation = 'subtle',
--
-- 		error = 'love',
-- 		hint = 'iris',
-- 		info = 'foam',
-- 		warn = 'gold',
--
-- 		headings = {
-- 			h1 = 'iris',
-- 			h2 = 'foam',
-- 			h3 = 'rose',
-- 			h4 = 'gold',
-- 			h5 = 'pine',
-- 			h6 = 'foam',
-- 		}
-- 		-- or set all headings at once
-- 		-- headings = 'subtle'
-- 	},
--
-- 	-- Change specific vim highlight groups
-- 	highlight_groups = {
-- 		ColorColumn = { bg = 'rose' }
-- 	}
-- })
--
-- -- set colorscheme after options
-- vim.cmd('colorscheme rose-pine')

-- GRUVBOX THEME --
-- require("gruvbox").setup({
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = false,
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "hard", -- can be "hard", "soft" or empty string
--   overrides = {},
-- })
-- vim.o.background = "dark"
-- vim.cmd("colorscheme gruvbox")

-- OXOCARBON THEME 
-- vim.o.background = "dark"
-- vim.cmd("colorscheme oxocarbon")

-- CARBON FOX THEME --
-- require('nightfox').setup({
--   options = {
--     -- Compiled file's destination location
--     compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--     compile_file_suffix = "_compiled", -- Compiled file suffix
--     transparent = false,    -- Disable setting background
--     terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--     dim_inactive = false,   -- Non focused panes set to alternative background
--     styles = {              -- Style to be applied to different syntax groups
--       comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
--       conditionals = "NONE",
--       constants = "NONE",
--       functions = "NONE",
--       keywords = "NONE",
--       numbers = "NONE",
--       operators = "NONE",
--       strings = "NONE",
--       types = "NONE",
--       variables = "NONE",
--     },
--     inverse = {             -- Inverse highlight for different types
--       match_paren = false,
--       visual = false,
--       search = false,
--     },
--     modules = {             -- List of various plugins and additional options
--       -- ...
--     },
--   },
--   palettes = {},
--   specs = {},
--   groups = {},
-- })
--
-- -- setup must be called before loading
-- vim.cmd("colorscheme carbonfox")

-- AYU DARK THEME --
-- vim.cmd("colorscheme ayu-dark")

  -- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")

-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd("colorscheme base16-gruvbox-dark-hard")

-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd("colorscheme oxocarbon")

-- CATTPUCCINO --
-- vim.g.catppuccin_flavour = "mocha"
-- require("catppuccin").setup()
--
-- vim.cmd [[colorscheme catppuccin]]
--
--
-- REMOVE NVIM BACKGROUND
-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
-- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
