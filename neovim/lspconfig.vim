" ===================================================
" NVIM lspconfig settings
" ===================================================

" Set mappings for lsp buf methods
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gc    <cmd>lua vim.lsp.buf.declaration()<CR>

" Set filetype omnifunc
autocmd Filetype typescript setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype javascript setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c


lua <<EOF

-- vim
-- yarn global add vim-language-server
require("lspconfig").vimls.setup{}

-- flow
-- npx flow lsp --help
require("lspconfig").flow.setup{
  on_attach=require'completion'.on_attach
}

-- typescript
-- :LspInstall tsserver
require("lspconfig").tsserver.setup{
  on_attach=require'completion'.on_attach
}

-- bash
-- :LspInstall bashls
require("lspconfig").bashls.setup{}

-- css
-- :LspInstall cssls
require("lspconfig").cssls.setup{}

-- Docker
-- :LspInstall dockerls
require("lspconfig").dockerls.setup{}

-- HTML
-- LspInstall html
require("lspconfig").html.setup{}

-- Java
-- :LspInstall jdtls
require("lspconfig").jdtls.setup{}

-- python
-- pip3 install -U jedi-language-server
require("lspconfig").jedi_language_server.setup{}

-- json
-- :LspInstall jsonls
require("lspconfig").jsonls.setup{}

-- yamlls
-- :LspInstall yamlls
require("lspconfig").yamlls.setup{}

EOF
