# clone
clone directly in .config folder
```bash
git clone <this-repo-url> ~/.config
```
To make nvim use this config, you can run this command:
```bash
NVIM_APPNAME="nvraw" nvim
```
In my .bashrc I add this alias:

```bash
alias nr='NVIM_APPNAME="nvraw" nvim'
```

So now I can have multiple nvim configs each in a different folder.
