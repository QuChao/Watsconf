Watsconf
=========
A dotfiles project of mine. Use at your own risk.

# Contents
## `ZSH`

> Since OS X *10.7*, `/etc/zshenv` has been moved to `/etc/zprofile` by Apple,
> try to solve this by executing `sudo mv /etc/zprofile /etc/zshenv`.

To expose `$ZDOTDIR` in the system-wide `zshenv` file:

``` bash
sudo echo "\n[[ -d \"\${HOME}/.zsh\" ]] && export ZDOTDIR=\"\${HOME}/.zsh\"\n" >> /etc/zshenv
```

# Thanks to
- [uwabami](https://twitter.com/uwabami) & his [*zsh へ移行中*](http://uwabami.junkhub.org/log/)
- [daxanya1](http://qiita.com/daxanya1) & his [*OS X Mavericks にまっさらな状態から環境設定してみる*](http://qiita.com/daxanya1/items/d237eb3dc4f5d8cdad9c)
