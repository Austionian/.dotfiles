-- always set leader first!
vim.g.mapleader = " "

-------------------------------------------------------------------------------
--
-- preferences
--
-------------------------------------------------------------------------------
-- keep more context on screen while scrolling
vim.o.scrolloff = 20
-- always draw sign column. prevents buffer moving when adding/deleting sign
vim.o.signcolumn = "yes"
-- sweet sweet relative line numbers
vim.o.relativenumber = true
-- and show the absolute line number for the current line
vim.o.number = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.smartindent = true
-- vim.o.colorcolumn = "80"
vim.opt.swapfile = false
vim.opt.backup = false
-- NOTE: ends up in ~/.local/state/nvim/undo/
vim.opt.undofile = true
-- never show me line breaks if they're not there
vim.o.wrap = false
vim.o.mouse = 'a'
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.updatetime = 50
vim.g.termguicolors = true
vim.g.rustfmt_autosave = 1
-- never ever folding
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99

-- very basic "continue indent" mode (autoindent) is always on in neovim
-- could try smartindent/cindent, but meh.
-- vim.opt.cindent = true
-- XXX
-- vim.opt.cmdheight = 2
-- vim.opt.completeopt = 'menuone,noinsert,noselect'
-- not setting updatedtime because I use K to manually trigger hover effects
-- and lowering it also changes how frequently files are written to swap.
-- vim.opt.updatetime = 300
-- if key combos seem to be "lagging"
-- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
-- vim.opt.timeoutlen = 300
-- keep current content top + left when splitting
vim.opt.splitright = true
vim.opt.splitbelow = true
-- infinite undo!
--" Decent wildmenu
-- in completion, when there is more than one match,
-- list all matches, and only complete to longest common match
vim.opt.wildmode = 'list:longest'
-- when opening a file with a command (like :e),
-- don't suggest files like there:
vim.opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'
-- case-insensitive search/replace
vim.opt.ignorecase = true
-- unless uppercase in search term
vim.opt.smartcase = true
-- never ever make my terminal beep
vim.opt.vb = true
-- more useful diffs (nvim -d)
--- by ignoring whitespace
vim.opt.diffopt:append('iwhite')
--- and using a smarter algorithm
--- https://vimways.org/2018/the-power-of-diff/
--- https://stackoverflow.com/questions/32365271/whats-the-difference-between-git-diff-patience-and-git-diff-histogram
--- https://luppeng.wordpress.com/2020/10/10/when-to-use-each-of-the-git-diff-algorithms/
vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')
-- show a column at 80 characters as a guide for long lines
vim.opt.colorcolumn = '80'
--- except in Rust where the rule is 100 characters
vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })
-- show more hidden characters
-- also, show tabs nicer
vim.opt.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'

-------------------------------------------------------------------------------
--
-- hotkeys
--
-------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>pv', ':Vex<CR>')
vim.keymap.set('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<C-j>', ':cnext<CR>')
vim.keymap.set('n', '<C-k>', ':cprev<CR>')

vim.keymap.set('n', 'J', 'mzJ`z')

-- Toggle between buffers
vim.keymap.set('n', '<leader><leader>', '<c-^>')

-- Toggle to the file tree
vim.keymap.set('n', '<leader>pe', ":Ex<CR>")

-- Telescope commands
vim.keymap.set('n', '<C-p>', '<cmd>Telescope git_files<CR>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fp', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>dd', '<cmd>Telescope diagnostics<cr>')

vim.keymap.set('v', '<leader>p', '"_dP')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+y')

-- Easy Dragging
vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv")

-- Center on vert movement
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")

-- Open code actions
vim.keymap.set('n', "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

-- Open Undo Tree
vim.keymap.set('n', "<leader>u", "<cmd>UndotreeToggle<cr>")

-- Paste without losing the current register
vim.keymap.set('x', "<leader>p", "\"_dP")

-- Find and replace all on highlighted word 
vim.keymap.set('n', "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Apply a macro to the visually selected lines
vim.keymap.set('x', '@', '":norm @" . getcharstr() . "<cr>"', { expr = true })
-- quick-save
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
-- Jump to start and end of line using the home row keys
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')
-- Neat X clipboard integration
-- <leader>p will paste clipboard into buffer
-- <leader>c will copy entire buffer into clipboard
vim.keymap.set('n', '<leader>p', '<cmd>read !wl-paste<cr>')
vim.keymap.set('n', '<leader>c', '<cmd>w !wl-copy<cr><cr>')
-- always center search results
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { silent = true })
-- "very magic" (less escaping needed) regexes by default
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('c', '%s/', '%sm/')
-- open new file adjacent to current file
vim.keymap.set('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <cr>')
-- no arrow keys --- force yourself to use the home row
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')
-- let the left and right arrows be useful: they can switch buffers
vim.keymap.set('n', '<left>', ':bp<cr>')
vim.keymap.set('n', '<right>', ':bn<cr>')
-- make j and k move by visual line, not actual line, when text is soft-wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
-- handy keymap for replacing up to next _ (like in variable names)
vim.keymap.set('n', '<leader>m', 'ct_')
-- F1 is pretty close to Esc, so you probably meant Esc
vim.keymap.set('', '<F1>', '<Esc>')
vim.keymap.set('i', '<F1>', '<Esc>')

-------------------------------------------------------------------------------
--
-- autocommands
--
-------------------------------------------------------------------------------
-- highlight yanked text
vim.api.nvim_create_autocmd(
	'TextYankPost',
	{
		pattern = '*',
		command = 'silent! lua vim.highlight.on_yank({ timeout = 250 })'
	}
)
-- jump to last edit position on opening file
vim.api.nvim_create_autocmd(
	'BufReadPost',
	{
		pattern = '*',
		callback = function(ev)
			if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
				-- except for in git commit messages
				-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
				if not vim.fn.expand('%:p'):find('.git', 1, true) then
					vim.cmd('exe "normal! g\'\\""')
				end
			end
		end
	}
)
-- prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.orig', command = 'set readonly' })
vim.api.nvim_create_autocmd('BufRead', { pattern = '*.pacnew', command = 'set readonly' })
-- leave paste mode when leaving insert mode (if it was on)
vim.api.nvim_create_autocmd('InsertLeave', { pattern = '*', command = 'set nopaste' })
-- help filetype detection (add as needed)
--vim.api.nvim_create_autocmd('BufRead', { pattern = '*.ext', command = 'set filetype=someft' })
-- correctly classify mutt buffers
local email = vim.api.nvim_create_augroup('email', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = '/tmp/mutt*',
	group = email,
	command = 'setfiletype mail',
})
-- also, produce "flowed text" wrapping
-- https://brianbuccola.com/line-breaks-in-mutt-and-vim/
vim.api.nvim_create_autocmd('Filetype', {
  pattern = 'mail',
  group = email,
  command = 'setlocal formatoptions+=w',
})
-- shorter columns in text because it reads better that way
local text = vim.api.nvim_create_augroup('text', { clear = true })
for _, pat in ipairs({'text', 'markdown', 'mail', 'gitcommit'}) do
	vim.api.nvim_create_autocmd('Filetype', {
		pattern = pat,
		group = text,
		command = 'setlocal spell tw=72 colorcolumn=73',
	})
end
--- tex has so much syntax that a little wider is ok
vim.api.nvim_create_autocmd('Filetype', {
	pattern = 'tex',
	group = text,
	command = 'setlocal spell tw=80 colorcolumn=81',
})
-- TODO: no autocomplete in text

-------------------------------------------------------------------------------
--
-- plugin configuration
--
-------------------------------------------------------------------------------
-- first, grab the manager
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- then, setup!
require("lazy").setup({
	-- main color scheme
	{
		"rebelot/kanagawa.nvim",
		lazy = false, -- load at start
		priority = 1000, -- load first
		config = function()
			vim.cmd([[colorscheme kanagawa]])
		end
	},
	-- quick navigation
	{
		'ggandor/leap.nvim',
		config = function()
			require('leap').create_default_mappings()
		end
	},
	-- better %
	{
		'andymass/vim-matchup',
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end
	},
	-- auto-cd to root of git project
	-- 'airblade/vim-rooter'
	{
		'notjedi/nvim-rooter.lua',
		config = function()
			require('nvim-rooter').setup()
		end
	},
	-- fzf support for ^p
	{
		'junegunn/fzf.vim',
		dependencies = {
			{ 'junegunn/fzf', dir = '~/.fzf', build = './install --all' },
		},
		config = function()
			-- stop putting a giant window over my editor
			vim.g.fzf_layout = { down = '~20%' }
			-- when using :Files, pass the file list through
			--
			--   https://github.com/jonhoo/proximity-sort
			--
			-- to prefer files closer to the current file.
			function list_cmd()
				local base = vim.fn.fnamemodify(vim.fn.expand('%'), ':h:.:S')
				if base == '.' then
					-- if there is no current file,
					-- proximity-sort can't do its thing
					return 'fd --type file --follow'
				else
					return vim.fn.printf('fd --type file --follow | proximity-sort %s', vim.fn.shellescape(vim.fn.expand('%')))
				end
			end
			vim.api.nvim_create_user_command('Files', function(arg)
				vim.fn['fzf#vim#files'](arg.qargs, { source = list_cmd(), options = '--tiebreak=index' }, arg.bang)
			end, { bang = true, nargs = '?', complete = "dir" })
		end
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- LSP
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		config = function () 
			  local configs = require("nvim-treesitter.configs")

			  configs.setup({
				  ensure_installed = { "bash", "typescript", "javascript", "rust", "python", "lua", "html", "vim" },
				  sync_install = false,
				  highlight = { enable = true },
				  indent = { enable = true },  
				})
			end
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		config = function()
			require'treesitter-context'.setup{
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
			trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
				-- For all filetypes
				-- Note that setting an entry here replaces all other patterns for this entry.
				-- By setting the 'default' entry below, you can control which nodes you want to
				-- appear in the context window.
				default = {
					'class',
					'function',
					'method',
					'for', -- These won't appear in the context
					'while',
					'if',
					'switch',
					'case',
				},
				-- Example for a specific filetype.
				-- If a pattern is missing, *open a PR* so everyone can benefit.
				--   rust = {
				--       'impl_item',
				--   },
			},
			exact_patterns = {
				-- Example for a specific filetype with Lua patterns
				-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
				-- exactly match "impl_item" only)
				-- rust = true,
			},

			-- [!] The options below are exposed but shouldn't require your attention,
			--     you can safely ignore them.

			zindex = 20, -- The Z-index of the context window
			mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
			separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
		}
		end
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ 'j-hui/fidget.nvim', opts = {} },
		},
		config = function()
			-- Setup language servers.
			local lspconfig = require('lspconfig')

		    local mason = require("mason")
			mason.setup()
			
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup {
				ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "tailwindcss" },
			}
			
			-- Rust
			lspconfig.rust_analyzer.setup {
				-- Server-specific settings. See `:help lspconfig-setup`
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						imports = {
							group = {
								enable = false,
							},
						},
						completion = {
							postfix = {
								enable = false,
							},
						},
					},
				},
			}
			lspconfig.ts_ls.setup{}
			lspconfig.tailwindcss.setup{}
			lspconfig.pyright.setup{}

			-- Bash LSP
			local configs = require 'lspconfig.configs'
			if not configs.bash_lsp and vim.fn.executable('bash-language-server') == 1 then
				configs.bash_lsp = {
					default_config = {
						cmd = { 'bash-language-server', 'start' },
						filetypes = { 'sh' },
						root_dir = require('lspconfig').util.find_git_ancestor,
						init_options = {
							settings = {
								args = {}
							}
						}
					}
				}
			end
			if configs.bash_lsp then
				lspconfig.bash_lsp.setup {}
			end

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<leader>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<leader>f', function()
						vim.lsp.buf.format { async = true }
					end, opts)

					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					-- When https://neovim.io/doc/user/lsp.html#lsp-inlay_hint stabilizes
					-- *and* there's some way to make it only apply to the current line.
					-- if client.server_capabilities.inlayHintProvider then
					--     vim.lsp.inlay_hint(ev.buf, true)
					-- end

					-- None of this semantics tokens business.
					-- https://www.reddit.com/r/neovim/comments/143efmd/is_it_possible_to_disable_treesitter_completely/
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})
		end
	},
	-- LSP-based code-completion
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			'neovim/nvim-lspconfig',
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require'cmp'
			cmp.setup({
				snippet = {
					-- REQUIRED by nvim-cmp. get rid of it once we can
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					-- Accept currently selected item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'path' },
				}),
				experimental = {
					ghost_text = true,
				},
			})

			-- Enable completing paths in :
			cmp.setup.cmdline(':', {
				sources = cmp.config.sources({
					{ name = 'path' }
				})
			})
		end
	},
	-- inline function signatures
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			-- Get signatures (and _only_ signatures) when in argument lists.
			require "lsp_signature".setup({
				doc_lines = 0,
				handler_opts = {
					border = "none"
				},
			})
		end
	},
	-- language support
	-- terraform
	{
		'hashivim/vim-terraform',
		ft = { "terraform" },
	},
	-- toml
	'cespare/vim-toml',
	-- yaml
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	-- rust
	{
		'rust-lang/rust.vim',
		ft = { "rust" },
		config = function()
			vim.g.rustfmt_autosave = 1
			vim.g.rustfmt_emit_files = 1
			vim.g.rustfmt_fail_silently = 0
			vim.g.rust_clip_command = 'wl-copy'
		end
	},
	-- fish
	'khaveesh/vim-fish-syntax',
	-- markdown
	{
		'plasticboy/vim-markdown',
		ft = { "markdown" },
		dependencies = {
			'godlygeek/tabular',
		},
		config = function()
			-- never ever fold!
			vim.g.vim_markdown_folding_disabled = 1
			-- support front-matter in .md files
			vim.g.vim_markdown_frontmatter = 1
			-- 'o' on a list item should insert at same level
			vim.g.vim_markdown_new_list_item_indent = 0
			-- don't add bullets when wrapping:
			-- https://github.com/preservim/vim-markdown/issues/232
			vim.g.vim_markdown_auto_insert_bullets = 0
		end
	},
	"folke/which-key.nvim",
	{
		"lewis6991/gitsigns.nvim",
		opts = {
		  signs = {
			add = { text = '+' },
			change = { text = '~' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
		  },
		},
	},
	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
		config = function()
			require('lualine').setup {
			  sections = {
					lualine_c = {
						{
						  'filename',
						  file_status = true, -- displays file status (readonly status, modified status)
						  path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
						}
					  },
					lualine_x = {'buffers'}
				},
			}
		end
	},
	-- Highlight todo, notes, etc in comments
	{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
	{'mbbill/undotree'},
	{'tpope/vim-fugitive'},
	{'MunifTanjim/prettier.nvim'},
	{
      'windwp/nvim-ts-autotag',
      config = function() require('nvim-ts-autotag').setup() end
      },
	 {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },
})

--[[

leftover things from init.vim that i may still end up wanting

" Completion
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Settings needed for .lvimrc
set exrc
set secure

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
\   <bang>0 ? fzf#vim#with_preview('up:60%')
\           : fzf#vim#with_preview('right:50%:hidden', '?'),
\   <bang>0)

" <leader>q shows stats
nnoremap <leader>q g<c-g>

--]]
