Windows Setup for nvim!

# Intro

Minimalist config for a vim setup :).

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
## Coc and Coc-clangd
1. Coc-cland Needs nodejs as a dependency
2. You need to run
```
:CocInstall coc-clangd
```
3. Or alternatively, just run:
```
:CocConfig
```
and paste:
```
"languageserver": {
  "clangd": {
    "command": "clangd",
    "rootPatterns": ["compile_flags.txt", "compile_commands.json"],
    "filetypes": ["c", "cc", "cpp", "c++", "objc", "objcpp"]
  }
}
```

(Although do note, I actually haven't tried this method yet)

4. Install clangd if you haven't:
```
:CocCommand clangd.install
```

5. coc-clangd requires a json compilation database (https://clang.llvm.org/docs/JSONCompilationDatabase.html)

You can generate that in CMake by adding:
```
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```

Note: Only works in cmake >= 2.8.5
