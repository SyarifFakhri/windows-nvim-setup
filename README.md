Windows Setup for nvim!

# Intro

Minimalist config for a vim setup :).

# Dependencies
1. You need to install Ripgrep and add it to your path

# Known things that don't work over ssh
1. fzf vim - ripgrep
2. vim fugitive

# Installation

Installation with windows is a little bit of a pain. Here's the general steps.

1. Install nvim.
2. Add it to your windows path.
3. Add init.vim to C:/users/user/AppData/Local/nvim/ (create it if it doesn't exist)
4. Install vim-plug by running the following commands in powershell:

```
$destination_dir = "$env:USERPROFILE\AppData\Local\nvim\autoload\"
md $destination_dir -Force
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("$destination_dir\plug.vim"))
```

5. Verify that it works by adding to your init.vim:
```
call plug#begin('~\AppData\Local\nvim\plugged')
call plug#end()
```

And then typing:
```
:PlugStatus
```

if you don't get an error then all is good.

6. Note, your tree should look like the following at this point:

```
C:/users/user/AppData/Local/:
└── nvim
    ├── autoload
    │   └── plug.vim
    └── init.vim
```

# Installing Plugins and first time install

1. run:
```
:PlugInstall
```
While inside vim

# Plugin specific install
## FZF
Currently FZF needs to be installed ~/.fzf. 

Vim should be able to find it automatically after that.

If it still can't find the bin, navigate to the folder and run install.ps1 manually.

## Coc and Coc-clangd
1. Coc-cland Needs nodejs as a dependency
2. Install clangd if you haven't:
```
:CocCommand clangd.install
```
Note: This has to be done in a cpp file.

If this doesn't work, install clangd manually and add it to your path:
https://github.com/llvm/llvm-project

5. coc-clangd requires a json compilation database (https://clang.llvm.org/docs/JSONCompilationDatabase.html)

You can generate that in CMake by adding:
```
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```
Note: Only works in cmake >= 2.8.5 AND on unix makefile and ninja generators

In order to get this in MSVC, you need to install Clang Power Tools (https://clangpowertools.com/blog/generate-json-compilation-database.html), and use it to export a compilation database.
