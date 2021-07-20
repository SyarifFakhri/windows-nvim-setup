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
