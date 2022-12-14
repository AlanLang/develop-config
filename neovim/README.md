![](./snapshoot/neovim.jpeg)

## 使用
直接将本目录软链接到 `~/.config/nvim`

```
ln -s ~/xxx/develop-config/neovim ~/.config/nvim
```

## 字体

https://github.com/Karmenzind/monaco-nerd-fonts/blob/master/fonts/Monaco%20Nerd%20Font%20Complete%20Windows%20Compatible.otf

## 替代 vi 和 vim

nvim ~/.zshrc
```
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
```

## 拼写检查

```
npm install -g cspell
```

## lazgit

```
brew install lazygit
```

## 安装 Packer.nvim 插件管理器
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## 主题
https://github.com/mhartington/oceanic-next

## 设置透明
https://github.com/xiyaowong/nvim-transparent

## 文件搜索

`:checkhealth telescope` 检查依赖
* BurntSushi/ripgrep：https://github.com/BurntSushi/ripgrep
* sharkdp/fd：https://github.com/sharkdp/fd
