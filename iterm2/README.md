![](./iterm2.png)
## 字体
https://github.com/Karmenzind/monaco-nerd-fonts/blob/master/fonts/Monaco%20Nerd%20Font%20Complete%20Windows%20Compatible.otf

## 配色
https://github.com/mhartington/oceanic-next-iterm

## oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### 自动提示
https://github.com/zsh-users/zsh-autosuggestions

### 主题
https://github.com/romkatv/powerlevel10k 

#### 配色调整

`vi ~/.p10k.zsh`

修改文档中已有的值即可

```
# 时间的前景色
typeset -g POWERLEVEL9K_TIME_FOREGROUND=7
# 时间的背景色
typeset -g POWERLEVEL9K_TIME_BACKGROUND=8

# 系统图标的背景色
typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=10
```