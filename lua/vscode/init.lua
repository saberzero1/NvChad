local opt = vim.opt
local g = vim.g
local vscode = require("vscode-neovim")

g.mapleader = " "

vim.notify = vscode.notify

vscode.notify("Neovim config loaded successfully!")
