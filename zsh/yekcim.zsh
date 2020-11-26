ZSH_THEME="agnoster"
DEFAULT_USER="yekcim"

##### Sources ######
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

###### Highlighters ######
ZSH_HIGHLIGHT_HIGHLIGHTERS=(regexp main brackets pattern) # l’ordre à un sens, regexp avant main pour prioriser les guillemets
# dangerous command
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('sudo' 'fg=white,bold,bg=red')
# taskwarrior
ZSH_HIGHLIGHT_REGEXP+=('\ \+[^ ]+' 'fg=227') # yellow tags (+txt)
ZSH_HIGHLIGHT_REGEXP+=('[^ ]+\:' 'fg=140')   # purple attributes (txt:)
ZSH_HIGHLIGHT_REGEXP+=('\ \-[^ ]+' 'fg=227') # yellow del tag (-xt), also useful to color args in all command
ZSH_HIGHLIGHT_REGEXP+=('\ \_[^ ]+' 'fg=32')  # blue (_txt)

###### ↑↓ pgup pgdn undo ######
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key
bindkey '^[[Z' undo 

###### Colors ######
alias diff='colordiff -u'
alias dir='dir --color=always'
alias ls='ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable'

###### Divers ######
alias stat_sys="echo ' ' && uname -a && echo ' '&& uptime &&echo ' '&& df && echo ' '" # Affiche quelques statistiques à propos de l'ordinateur
alias SAVE="rsync -avzz --delete --exclude-from=/mnt/data/.rsync_exclude.txt --no-links /mnt/data /run/media/yekcim/yekdisk/yekcim-desktop/; rsync -avzz --delete --exclude-from=/mnt/data/.rsync_exclude.txt --no-links /home/yekcim/ /run/media/yekcim/yekdisk/yekcim-desktop/home ; rsync -e ssh -avzz yekcim@192.168.0.4:/home/yekcim/Livres/ /run/media/yekcim/yekdisk/yeklivres/" # Backupp
alias freetv="vlc http://mafreebox.freebox.fr/freeboxtv/playlist.m3u" # freebox tv
alias youtube-dl='youtube-dl --prefer-ffmpeg -f bestvideo+bestaudio' # youtube-dl

###### Adminsys ######
alias s="sudo systemctl"
alias j="journalctl -f"

##### Depuis manjaro-zsh-config ######
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
