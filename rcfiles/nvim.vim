" This file contains all of the nvim specific stuff

"--- Nvim lsp settings
set completeopt=menuone,noselect
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ' '

call sign_define("LspDiagnosticsSignError", {"text" : "🔥", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsSignWarning", {"text" : "🚧", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsSignInformation", {"text" : "👷", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsSignHint", {"text" : "🙋", "texthl" : "LspDiagnosticsHint"})

"  _    _       _         _                   _          __  __ 
" | |  | |     | |       | |                 | |        / _|/ _|
" | |  | | __ _| |_   _  | |_   _  __ _   ___| |_ _   _| |_| |_ 
" | |  | |/ _` | | | | | | | | | |/ _` | / __| __| | | |  _|  _|
" | |__| | (_| | | |_| | | | |_| | (_| | \__ \ |_| |_| | | | |  
"  \____/ \__, |_|\__, | |_|\__,_|\__,_| |___/\__|\__,_|_| |_|  
"          __/ |   __/ |                                        
"         |___/   |___/                                         

lua << END
--vim.lsp.set_log_level("debug")

local lsp_status = require('lsp-status')
lsp_status.config({
  kind_labels = vim.g.completion_customize_lsp_label,
  current_function = false,
  status_symbol = '💬: ',
  indicator_errors = '🔥 ',
  indicator_warnings = '🚧 ',
  indicator_info = '👷 ',
  indicator_hint = '🙋 ',
  indicator_ok = '✅',
  spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
})
lsp_status.register_progress()

local on_attach_vim = function(client)
    --require'completion'.on_attach(client)
    lsp_status.on_attach(client)
    capabilities = lsp_status.capabilities
end

local lspconfig = require('lspconfig')

lspconfig.tsserver.setup{ on_attach=on_attach_vim }
lspconfig.jsonls.setup{ on_attach=on_attach_vim }
lspconfig.html.setup{ on_attach=on_attach_vim }
lspconfig.jdtls.setup{ on_attach=on_attach_vim }
lspconfig.cssls.setup{ on_attach=on_attach_vim }
lspconfig.clojure_lsp.setup{ on_attach=on_attach_vim }
lspconfig.gopls.setup { on_attach=on_attach_vim }

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.http = {
  install_info = {
    url = "https://github.com/NTBBloodbath/tree-sitter-http",
    files = { "src/parser.c" },
    branch = "main",
  },
}

require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--ignore',
            '--hidden'
        },
        file_ignore_patterns = {
            ".git",
            "node_modules"
        },
        prompt_prefix = "🔎 ",
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<esc>"] = actions.close
            }
        }
    },
    pickers = {
        lsp_code_actions = {
            theme = "cursor"
        },
        lsp_workspace_diagnostics = {
            theme = "dropdown"
        }
    }
}

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = true;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})

require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      -- Jump to request line on run
      jump_to_request = false,
    })

END


"
"             _
"           /(_))
"         _/   /
"        //   /
"       //   /
"       /\__/
"       \O_/=-.
"   _  / || \  ^o
"   \\/ ()_) \.
"    ^^ <__> \()
"      //||\\
"     //_||_\\  ds
"    // \||/ \\
"   //   ||   \\
"  \/    |/    \/
"  /     |      \
" /      |       \
"        |
"
nnoremap <C-F> <cmd>Telescope live_grep<CR>
" God damn tmux taking the C-B bind
nnoremap <C-L> <cmd>Telescope buffers<CR>
nnoremap <C-N> <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>
nnoremap <C-H> <cmd>Telescope oldfiles<CR>
nnoremap <Leader><CR> <cmd>Telescope lsp_code_actions<CR>
nnoremap <silent>gr    <cmd>Telescope lsp_references<CR>
nnoremap <Leader>gs    <cmd>Telescope git_status<CR>
" Show diagnostics
nnoremap <Leader>sd <cmd>Telescope lsp_workspace_diagnostics<CR>

" Telly colors not really working for me
highlight TelescopeSelection guifg=#FF38A2 gui=bold
highlight TelescopeMatching guifg=#d9bcef

" neovim rest
function! DoRest() 
    lua require "rest-nvim".run()
    redraw
    sleep 100m
    vertical resize 50
endfunction
"nmap <leader>rr     <cmd> lua require "rest-nvim".run()<CR>:vertical resize 50<CR>
nmap <leader>rr     :call DoRest()<CR>
