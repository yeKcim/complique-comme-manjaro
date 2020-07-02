Mes notes post installation de Manjaro. C'est en vrac, ça n’engage que moi, c’est pas encore bien mis en forme mais c’est un premier jet :

J’installe Manjaro-Gnome. Une fois l’installation terminée, je lance l’utilitaire de mise à jour.

<p align="center">
  <img src="https://raw.githubusercontent.com/yeKcim/complique-comme-manjaro/master/logo_manjaro.svg">
</p>

<!--
██████╗  █████╗  ██████╗ ██╗   ██╗███████╗████████╗███████╗
██╔══██╗██╔══██╗██╔═══██╗██║   ██║██╔════╝╚══██╔══╝██╔════╝
██████╔╝███████║██║   ██║██║   ██║█████╗     ██║   ███████╗
██╔═══╝ ██╔══██║██║▄▄ ██║██║   ██║██╔══╝     ██║   ╚════██║
██║     ██║  ██║╚██████╔╝╚██████╔╝███████╗   ██║   ███████║
╚═╝     ╚═╝  ╚═╝ ╚══▀▀═╝  ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝
-->
# Paquets
```
sudo pacman -S thunderbird gimp{,-refocus,-plugin-gmic} blender inkscape openscad owncloud-client playonlinux tilix \
celluloid vlc ffmpeg gst-plugins-{bad,good,ugly} kdenlive audacity soundconverter nano-syntax-highlighting \
texlive{-bibtexextra,-latexextra,-pictures,-langextra} img2pdf pstoedit pdf{2svg,arranger,tk} xournalpp chromium \
gnuplot p7zip htop pydf thefuck tldr gparted exfat-utils ntfs-3g sshfs keepassxc unzip trash-cli optipng \
perl-image-exiftool jhead gzip poppler xdg-utils tesseract{,-data-fra,-data-eng} ghostscript cozy-desktop \
yay base-devel pkgfile meld diffpdf system-config-printer lollypop simple-scan shotwell gedit-plugins \
ttf-{roboto,roboto-mono,ubuntu-font-family,caladea,linux-libertine,linux-libertine-g,liberation} {awesome-terminal,powerline}-fonts \
python-nautilus steam-manjaro game-devices-udev arc-gtk-theme grammalecte easytag shotwell mypaint \
linux-steam-integration libxml2 python2-lxml cura{,-resources-materials} calibre openssh pavucontrol \
zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting vim
```

# Memo gestion des paquets
* Pacman
	* Avant de lancer une mise à jour, consulter https://forum.manjaro.org/c/announcements/stable-updates
	* update : `sudo pacman -Sy`
	* upgrade : `sudo pacman -Syu`
	* nettoyer le cache : `sudo pacman -Scc`
	* chercher un paquet `pacman -Ss nomdepaquet`
* Yay
	* informations de maj : `yay -Pua`
	* upgrade : `yay -Sua`
	* supprimer les dépendances non nécessaires : `yay -Yc`
	* quelques stats : `yay -Ps`
	* remove : `yay -R nomdepaquet`
	* installation avec modification `yay --editmenu -S nomdepaquet`

<!--
 █████╗ ██╗   ██╗██████╗ 
██╔══██╗██║   ██║██╔══██╗
███████║██║   ██║██████╔╝
██╔══██║██║   ██║██╔══██╗
██║  ██║╚██████╔╝██║  ██║
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝
-->
# AUR
* Quelques paquets supplémentaires :
	* [cht.sh](http://cht.sh/) : `yay cht.sh`
	* [Jdownloader2](https://jdownloader.org) : `yay jdownloader2`
	* livrets à partir de pdf ? **bookletimposer** ne semble pas fonctionner, trouver une alternative…
* Polices
	* Pour avoir la police Sawasdee : `yay ttf-tlwg`
	* Pour des emojis qui s'affichent comme il faut dans **Emoji Selector** : `yay ttf-joypixels`
	* Pour les polices Microsoft (pourrait être mieux, voir source) : `yay ttf-ms-fonts && yay ttf-vista-fonts && yay ttf-tahoma` [Source](https://wiki.archlinux.org/index.php/Microsoft_fonts)
* Audio : Pour envoyer le son de l’ordinateur sur un périphérique upnp-dlna (chrome-key ou freebox par exemple), la solution la plus simple me semble être `yay pulseaudio-dlna` (qu’il faudra lancer au démarrage de la session), **pavucontrol** permet ensuite d’aisément sélectionner la sortie audio.
* `yay marktext` (À l’air sympa mais ne s’installe pas pour l’instant)

Quelques outils utiles pour le boulot :
	* `yay scidavis`
	* `yay alphaplot`
	* [Tixeo (visio conférence boulot)](https://www.tixeo.com/) : `yay tixeo`
	* `yay freecad`
	* `sudo pacman -S octave`
	* `yay teamviewer` (obligé de faire `systemctl restart teamviewerd.service` pour le rendre opérationnel)
	* `yay zoom`

<!--
███████╗███████╗██╗  ██╗
██╔════╝██╔════╝██║  ██║
███████╗███████╗███████║
╚════██║╚════██║██╔══██║
███████║███████║██║  ██║
╚══════╝╚══════╝╚═╝  ╚═╝
-->
# ssh
[source](https://wiki.archlinux.fr/ssh)
* Configurer ssh : `sudo nano /etc/ssh/sshd_config`
* Lancer ssh : `sudo systemctl start sshd.service`
* Lancer au démarrage : `sudo systemctl enable sshd.service`
* Génération de ma clé ssh : `ssh-keygen -t ed25519 -f $HOME/.ssh/id_ed25519`
* **ssh-copy** permettra d’envoyer ma clé sur les pc du réseau…

<!--
██████╗  █████╗ ██████╗ ████████╗██╗████████╗██╗ ██████╗ ███╗   ██╗    ██████╗  █████╗ ████████╗ █████╗ 
██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██║╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗
██████╔╝███████║██████╔╝   ██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║    ██║  ██║███████║   ██║   ███████║
██╔═══╝ ██╔══██║██╔══██╗   ██║   ██║   ██║   ██║██║   ██║██║╚██╗██║    ██║  ██║██╔══██║   ██║   ██╔══██║
██║     ██║  ██║██║  ██║   ██║   ██║   ██║   ██║╚██████╔╝██║ ╚████║    ██████╔╝██║  ██║   ██║   ██║  ██║
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═
-->
# Partition data séparée
Comme j’ai ajouté le disque après l’installation je dois ajouter manuellement les informations dans fstab, le fichier permettant de configurer les partitions qui seront montées au démarrage. Pour savoir quoi écrire, il est nécessaire, dans un premier temps,de relever l’UUID du disque
`blkid`
On pourra alors renseigner fstab :
`nano /etc/fstab`
En ajoutant une ligne ressemblant à :
**/dev/sdb: LABEL="newhome" UUID="3c10ccb9-e438-4c73-aebc-7d5456a4d5ef" TYPE="ext4"**
```
UUID="3c10ccb9-e438-4c73-aebc-7d5456a4d5ef" /mnt/data/ ext4 defaults 0 2
```
Par défaut, les dossiers Téléchargement, Bureau, Musique,… sont dans ~. Dans mon cas, il est nécessaire de les déplacer dans /mnt/data. Pour cela, il suffit de remplacer $HOME dans le fichier de configuration :
`gedit $HOME/.config/user-dirs.dirs`
Un chmod et chown récursifs sont ensuite nécessaires pour que le dossier soit accessible pour l’utilisateur.

<!--
 ██████╗ ███████╗███████╗████████╗    ██████╗  █████╗ ██████╗  █████╗ ███╗   ███╗
██╔════╝ ██╔════╝██╔════╝╚══██╔══╝    ██╔══██╗██╔══██╗██╔══██╗██╔══██╗████╗ ████║
██║  ███╗█████╗  ███████╗   ██║       ██████╔╝███████║██████╔╝███████║██╔████╔██║
██║   ██║██╔══╝  ╚════██║   ██║       ██╔═══╝ ██╔══██║██╔══██╗██╔══██║██║╚██╔╝██║
╚██████╔╝███████╗███████║   ██║██╗    ██║     ██║  ██║██║  ██║██║  ██║██║ ╚═╝ ██║
 ╚═════╝ ╚══════╝╚══════╝   ╚═╝╚═╝    ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝
-->
# Gestionaire de paramètres Manjaro
Dans le **Gestionnaire de paramètres Manjaro** : je peux
* mettre à jour le noyau
* installer les paquets linguistiques**
* installer les pilotes de ma carte graphique
ce que je fais.

<!--
██████╗ ███████╗██████╗ ███████╗ ██████╗         ██████╗ ███╗   ██╗ ██████╗ ███╗   ███╗███████╗
██╔══██╗██╔════╝██╔══██╗██╔════╝██╔═══██╗       ██╔════╝ ████╗  ██║██╔═══██╗████╗ ████║██╔════╝
██████╔╝█████╗  ██████╔╝███████╗██║   ██║       ██║  ███╗██╔██╗ ██║██║   ██║██╔████╔██║█████╗  
██╔═══╝ ██╔══╝  ██╔══██╗╚════██║██║   ██║       ██║   ██║██║╚██╗██║██║   ██║██║╚██╔╝██║██╔══╝  
██║     ███████╗██║  ██║███████║╚██████╔╝██╗    ╚██████╔╝██║ ╚████║╚██████╔╝██║ ╚═╝ ██║███████╗
╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝
-->
# Personnalisations de Gnome

## Ajustements (Gnome-tweaks),
* __Apparence__ je change
	* le thème d’applications pour **Arc-Darker**
	* le set d’icônes pour **Adwaita**, qui ne pose pas de problème dans Inkscape (entre autres) et me semble plus lisible
	* le thème shell pour **Arc-Dark**
* __Barre de titre des fenêtres__ Le clic milieu sur la barre de titre fait l’action Lower
* __Fenêtres__ je désactive les dialogues modaux
* __Polices__ je modifie le Facteur de mise à l’échelle pour 0,8
* __Applications au démarrage__ j’ajoute ici pavucontrol (mais comment ?)

## Paramètres
* Je configure mes **comptes en ligne** (Google, Nextcloud,…).
* Dans **Partage** j’active le **Partage de médias** pour activer le partage upnp

## Layouts
Je choisi la disposition Modern et dans les paramètres je coche l’option **Desktop icons**.


<!--
███████╗██╗  ██╗████████╗███████╗███╗   ██╗███████╗██╗ ██████╗ ███╗   ██╗███████╗
██╔════╝╚██╗██╔╝╚══██╔══╝██╔════╝████╗  ██║██╔════╝██║██╔═══██╗████╗  ██║██╔════╝
█████╗   ╚███╔╝    ██║   █████╗  ██╔██╗ ██║███████╗██║██║   ██║██╔██╗ ██║███████╗
██╔══╝   ██╔██╗    ██║   ██╔══╝  ██║╚██╗██║╚════██║██║██║   ██║██║╚██╗██║╚════██║
███████╗██╔╝ ██╗   ██║   ███████╗██║ ╚████║███████║██║╚██████╔╝██║ ╚████║███████║
╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
-->
# Extensions

## Gnome-shell
* [Voir le nom complet des applications dans le menu](https://extensions.gnome.org/extension/1071/applications-overview-tooltip/)
* [Calendar Improved](https://extensions.gnome.org/extension/2386/calendar-improved/)
* [Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)
* [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)
* [Desktop Icons NG (DING)](https://extensions.gnome.org/extension/2087/desktop-icons-ng-ding/)
* [Emoji Selector](https://extensions.gnome.org/extension/1162/emoji-selector/)
* [GSConnect](https://extensions.gnome.org/extension/1319/gsconnect/) et l’[extension Firefox](https://addons.mozilla.org/en-US/firefox/addon/gsconnect/). Sur mon téléphone j’installe [KDE Connect](https://f-droid.org/fr/packages/org.kde.kdeconnect_tp/)
* [Impatience](https://extensions.gnome.org/extension/277/impatience/)
* [KStatusNotifierItem/AppIndicator Support](https://extensions.gnome.org/extension/615/appindicator-support/)
* [ShellTile ](https://extensions.gnome.org/extension/657/shelltile/)
* [Top Panel Workspace Scroll](https://extensions.gnome.org/extension/701/top-panel-workspace-scroll/)
* [Unite](https://extensions.gnome.org/extension/1287/unite/)
* [User Themes](https://extensions.gnome.org/extension/19/user-themes/)
* [Workspace Indicator](https://extensions.gnome.org/extension/21/workspace-indicator/)

## Inkscape
* Extensions Inkscape : `yay textext` (j'installe **libxml2** et **python2-lxml** pour cette extension, il serait plus malin que le paquet aur soit mieux configuré)

## Gimp
* `yay python2-gimp` et `yay gimp-plugin-resynthesizer` pour avoir **heal selection** (Filtre → Amélioration → Corriger la sélection)

## Thunderbird
* [Thunderbird Conversations](https://addons.thunderbird.net/fr/thunderbird/addon/gmail-conversation-view/)
* [gContactSync](https://addons.thunderbird.net/fr/thunderbird/addon/gcontactsync/?src=userprofile)

## Firefox
* [Cozy - Cloud personnel](https://addons.mozilla.org/fr/firefox/addon/cozy-personal-cloud/)
* [Dark Reader](https://addons.mozilla.org/fr/firefox/addon/darkreader/)
* [GSConnect](https://addons.mozilla.org/fr/firefox/addon/gsconnect/)
* [I don't care about cookies](https://addons.mozilla.org/fr/firefox/addon/i-dont-care-about-cookies/) est-ce que ça valide tout ???
* [Simple Tab Groups](https://addons.mozilla.org/fr/firefox/addon/simple-tab-groups/)
* [Tab Suspender](https://addons.mozilla.org/fr/firefox/addon/ff-tab-suspender/)
* [Textarea Cache](https://addons.mozilla.org/fr/firefox/addon/textarea-cache/?src=search)
* [uBlock Origin](https://addons.mozilla.org/fr/firefox/addon/ublock-origin/?src=search)


## Correcteur grammatical grammalecte
* `yay libreoffice-extension-grammalecte-fr`
* [Extension Firefox](https://addons.mozilla.org/fr/firefox/addon/grammalecte-fr/)
* [Extension Thunderbird](https://grammalecte.net/#download) <!-- incompatible avec la dernière version de thunderbird ? -->
	
## Blender
* `yay blender-plugin-animation-nodes-git` (peut-être d’autres à prévoir ainsi…)

<!--
██████╗ ███████╗██████╗ ███████╗ ██████╗        ██╗██████╗ ███████╗██████╗ ██╗   ██╗ ██████╗ 
██╔══██╗██╔════╝██╔══██╗██╔════╝██╔═══██╗      ██╔╝██╔══██╗██╔════╝██╔══██╗██║   ██║██╔════╝ 
██████╔╝█████╗  ██████╔╝███████╗██║   ██║     ██╔╝ ██║  ██║█████╗  ██████╔╝██║   ██║██║  ███╗
██╔═══╝ ██╔══╝  ██╔══██╗╚════██║██║   ██║    ██╔╝  ██║  ██║██╔══╝  ██╔══██╗██║   ██║██║   ██║
██║     ███████╗██║  ██║███████║╚██████╔╝██╗██╔╝   ██████╔╝███████╗██████╔╝╚██████╔╝╚██████╔╝
╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝╚═╝    ╚═════╝ ╚══════╝╚═════╝  ╚═════╝  ╚═════╝ 
-->
# Personnalisations/Debug

* Remettre les icônes dans les menus (gimp, inkscape,…) : C'est faisable avec **dconf-editor** mais comme la clé est vide par défaut (sous Manjaro) il suffit de taper : `dconf write /org/gnome/settings-daemon/plugins/xsettings/overrides "{'Gtk/ButtonImages': <1>, 'Gtk/MenuImages': <1>}"` ([Source](https://forum.ubuntu-fr.org/viewtopic.php?id=2009199))
* Problème des ligatures grasses disgracieuses : `printf "<match target=\"font\">\n<edit name=\"embeddedbitmap\" mode=\"assign\">\n<bool>false</bool>\n</edit>\n</match>" | sudo tee /etc/fonts/local.conf`


<!--
███████╗███████╗██╗  ██╗
╚══███╔╝██╔════╝██║  ██║
  ███╔╝ ███████╗███████║
 ███╔╝  ╚════██║██╔══██║
███████╗███████║██║  ██║
╚══════╝╚══════╝╚═╝  ╚═╝
-->
# zsh

<p align="center">
  <img src="https://raw.githubusercontent.com/yeKcim/complique-comme-manjaro/master/zsh.jpg">
</p>

* Installation de Oh-My-ZSH : `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

## Personnalisation
* Je choisis parmi les [thèmes disponibles](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes), le thème [agnoster](https://github.com/agnoster/agnoster-zsh-theme), je l’indiquerai donc dans mon fichier de configuration personnel
* J’active mes [plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) préférés. Pour cela j'ajoute dans mon zshrc, via `nano $HOME/.zshrc` : `plugins=(archlinux common-aliases colored-man-pages colorize copydir copyfile cp extract git extract git rsync taskwarrior thefuck)`
* Mon fichier de configuration : `curl https://raw.githubusercontent.com/yeKcim/complique-comme-manjaro/master/zsh/yekcim.zsh -o $HOME/.oh-my-zsh/custom/yekcim.zsh`

## Bug de démarrage de Tilix
`nano  ~/.zshrc` pour ajouter :
```
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
```

## Pour root… (il faudra trouver mieux)
Comme mon poste est mono-utilisateur je me permettre [un truc crade](https://askubuntu.com/questions/521469/oh-my-zsh-for-the-root-and-for-all-user) pour avoir ohmyzsh après un `sudo -s` :
```
sudo ln -s $HOME/.oh-my-zsh /root/.oh-my-zsh
sudo ln -s $HOME/.zshrc /root/.zshrc
```
j’ajoute **ZSH_DISABLE_COMPFIX="true"** avant **source $ZSH/oh-my-zsh.sh** dans ~/.zshrc pour éviter le message d’erreur « Insecure completion-dependent directories detected »

<!--      ███╗
██████╗ ███████╗██████╗  ██████╗ 
██╔══██╗██╔════╝██╔══██╗██╔═══██╗
██████╔╝█████╗  ██████╔╝██║   ██║
██╔══██╗██╔══╝  ██╔═══╝ ██║   ██║
██████╔╝███████╗██║     ╚██████╔╝
╚═════╝ ╚══════╝╚═╝      ╚═════╝ 
-->
# Bépo

<p align="center">
  <img src="https://raw.githubusercontent.com/yeKcim/complique-comme-manjaro/master/bepo.jpg">
</p>

* Pour que les applications GTK prennent en compte toutes les fonctionnalités du bépo : `printf "\n\nGTK_IM_MODULE=xim" >> $HOME/.zshenv` [pour bug](https://bugs.launchpad.net/inkscape/+bug/1741283). Reste le [problème du tampon + Maj](https://bugs.launchpad.net/inkscape/+bug/1323080)
* Dans **Ajustements → Clavier et souris** : J'active **Compose** (**Super droit** pour mon Ergodox et **Menu** sur mon TypeMatrix)
* Pour que bépo soit pris en compte dans tty :
`nano /etc/default/keyboard`
```
XKBMODEL="pc105"
XKBLAYOUT="fr"
XKBVARIANT="bepo_afnor"
XKBOPTIONS="lv3:ralt_switch"

BACKSPACE="guess" 
```
ne semble pas suffire mais mettre la valeur fr-bepo dans la variable KEYMAP `sudo nano /etc/vconsole.conf` résout le problème [source](https://wiki.archlinux.fr/dvorak)
* Comment faire pour que GDM soit en bépo par défaut ?

<!--
██╗███╗   ███╗██████╗ ██████╗ ██╗███╗   ███╗ █████╗ ███╗   ██╗████████╗███████╗
██║████╗ ████║██╔══██╗██╔══██╗██║████╗ ████║██╔══██╗████╗  ██║╚══██╔══╝██╔════╝
██║██╔████╔██║██████╔╝██████╔╝██║██╔████╔██║███████║██╔██╗ ██║   ██║   █████╗  
██║██║╚██╔╝██║██╔═══╝ ██╔══██╗██║██║╚██╔╝██║██╔══██║██║╚██╗██║   ██║   ██╔══╝  
██║██║ ╚═╝ ██║██║     ██║  ██║██║██║ ╚═╝ ██║██║  ██║██║ ╚████║   ██║   ███████╗
╚═╝╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝
-->
# Imprimante
Pour mon imprimante Brother MFC-J4620DW :
## Impression
* `yay MFC-J4620DW` l’imprimante pourra alors être installée :
	* Dans l’[administration de cups](http://localhost:631/admin)
	* J’ajoute l’imprimante, *AppSocket/HP JetDirect* : **socket://192.168.0.5** en lui indiquant le ppd : **/opt/brother/Printers/mfcj4620dw/cupswrapper/brother_mfcj4620dw_printer_en.ppd**
## Scanner
```
yay brscan4
sudo brsaneconfig4 -a name="MFC-J4620DW" model="MFC-J4620DW" ip=192.168.0.5
```
le scanner sera alors utilisable via **simplescan**

<!--
███╗   ██╗ █████╗ ██╗   ██╗████████╗██╗██╗     ██╗   ██╗███████╗
████╗  ██║██╔══██╗██║   ██║╚══██╔══╝██║██║     ██║   ██║██╔════╝
██╔██╗ ██║███████║██║   ██║   ██║   ██║██║     ██║   ██║███████╗
██║╚██╗██║██╔══██║██║   ██║   ██║   ██║██║     ██║   ██║╚════██║
██║ ╚████║██║  ██║╚██████╔╝   ██║   ██║███████╗╚██████╔╝███████║
╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝╚══════╝ ╚═════╝ ╚══════╝
-->
# Nautilus

<p align="center">
  <img src="https://raw.githubusercontent.com/yeKcim/my_nautilus_scripts/master/screenshot2.png">
</p>

* Dans les préférences de Nautilus :
	* Onglet __Vue__, je choisi d’afficher la taille en première information libellé de la vue en icônes.
	* Onglet __Comportement__, l'action d'ouverture sur Simple clic
* Pour intégrer meld : `yay nautilus-compare`
* Pour intégrer git : `yay rabbitvcs-nautilus`
* [Mes scripts Nautilus](https://github.com/yeKcim/my_nautilus_scripts) :
	* Pour ma machine `git clone git@github.com:yeKcim/my_nautilus_scripts.git $HOME/.local/share/nautilus/scripts`
	* Sur les machines qui n’ont pas ma clé `git clone https://github.com/yeKcim/my_nautilus_scripts.git $HOME/.local/share/nautilus/scripts`)
	* `yay pdfposter`
	* manque **lptools libav-tools(ffmpeg) cups-client**
* J’ajoute un marque-page vers **ftp://freebox@mafreebox.free.fr**

<!--
     ██╗███████╗██╗   ██╗██╗  ██╗
     ██║██╔════╝██║   ██║╚██╗██╔╝
     ██║█████╗  ██║   ██║ ╚███╔╝ 
██   ██║██╔══╝  ██║   ██║ ██╔██╗ 
╚█████╔╝███████╗╚██████╔╝██╔╝ ██╗
 ╚════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝
-->
# Jeux

<p align="center">
  <img src="https://raw.githubusercontent.com/yeKcim/complique-comme-manjaro/master/vitetris.png">
  <img src="https://raw.githubusercontent.com/yeKcim/complique-comme-manjaro/master/steam.jpg">
</p>

* `pacman -S wesnoth warzone2100 teeworlds supertuxkart blobby2 frogatto sauerbraten chromium-bsu vitetris`
* [Shattered Pixel Dungeon](https://pixeldungeon.fandom.com/wiki/Mod-Shattered_Pixel_Dungeon) : `yay shattered-pixel-dungeon`
* [torus-trooper](http://www.emhsoft.com/ttrooper/) (j’ai tenté d’utiliser aur mais rien n’y fait…) : je télécharge le [pkg.tar](https://drive.google.com/file/d/1dvgE4VjyKtXiYrDh2sitE55mRwkZobmL/edit) et `sudo pacman -U torus-trooper-0.22-10-x86_64.pkg.tar`
* [mrboom](http://mrboom.mumblecore.org/) : `yay mrboom` (reste à l’ajouter dans steam pour l’utiliser à la manette…)
* OpenSC2K ? lincity ? openttd ? ou autre ? en tout cas il serait intéressant d’avoir une jeu de gestion
* Steam
	* J’ajoute */mnt/data/SteamGames* dans la liste des dossiers et le défini par défaut (steam → paramètres →  Téléchargements)
	* Je dois également modifier */usr/share/applications/steam.desktop* pour supprimer **%U** afin d’avoir un raccourci Steam fonctionnel
* Juste pour le délire `pacman -S rogue nethack` et `yay brogue-ce`
* Le client gog : `yay minigalaxy` ? ou le client officiel (je ne retrouve pas le mail de la beta fermé de gog 2) ?
* `yay lutris` pour installer :
    * [Uplay](https://lutris.net/games/uplay/) pour installer **Trackmania 2020 Starter**
    * [Magic the gathering arena](https://lutris.net/games/magic-the-gathering-arena/)
<!--
  ███╗
███████╗██████╗ ██╗████████╗███████╗██╗   ██╗██████╗ ███████╗    ██████╗ ███████╗    ████████╗███████╗██╗  ██╗████████╗███████╗
██╔════╝██╔══██╗██║╚══██╔══╝██╔════╝██║   ██║██╔══██╗██╔════╝    ██╔══██╗██╔════╝    ╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝██╔════╝
█████╗  ██║  ██║██║   ██║   █████╗  ██║   ██║██████╔╝███████╗    ██║  ██║█████╗         ██║   █████╗   ╚███╔╝    ██║   █████╗  
██╔══╝  ██║  ██║██║   ██║   ██╔══╝  ██║   ██║██╔══██╗╚════██║    ██║  ██║██╔══╝         ██║   ██╔══╝   ██╔██╗    ██║   ██╔══╝  
███████╗██████╔╝██║   ██║   ███████╗╚██████╔╝██║  ██║███████║    ██████╔╝███████╗       ██║   ███████╗██╔╝ ██╗   ██║   ███████╗
╚══════╝╚═════╝ ╚═╝   ╚═╝   ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝    ╚═════╝ ╚══════╝       ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝
-->
# Éditeurs de texte
J’utilise régulièrement gedit et nano lorsque je suis en console. J’essaye de passer à vi. J’ai donc 3 éditeurs de texte à configurer.

## nano
<p align="center">
  <img src="https://raw.githubusercontent.com/yeKcim/complique-comme-manjaro/master/nano.jpg">
</p>

Mes fichiers de configuration de nano permettent d’ajouter la coloration syntaxique et d’avoir une interface rouge pour root et bleu pour l’utilisateur
```
mkdir $HOME/.config/nano/
curl https://raw.githubusercontent.com/yeKcim/complique-comme-manjaro/master/nano/nanorc -o $HOME/.config/nano/nanorc
sudo curl https://raw.githubusercontent.com/yeKcim/complique-comme-manjaro/master/nano/root.nanorc -o /root/.nanorc
```

## gedit
Dans les préférences de Gedit :
* Affichage : je coche 
	* **Afficher les numéros de ligne**
	* **Afficher la carte de la vue d’ensemble**
	* **surligner la ligne actuelle**
	* **Surligner les parenthèses correspondantes**
* Police et couleurs : Je coche **Utiliser la police système à chasse fixe (Hack 11)** et choisi le jeu de couleur **Solarisé foncé** 

## vim
* Téléchargement de mon fichier de config : `curl -fLo ~/.vimrc --create-dirs https://raw.githubusercontent.com/yeKcim/complique-comme-manjaro/master/vim/vimrc`
Ce fichier de configuration vérifie que le gestionnaire de plugin est installé. S’il ne l’est pas, il est téléchargé automatiquement, l’active et installe les plugins de la liste.
* Au premier lancement, un message d’erreur m’indique que le thème n’a pas été trouvé, il suffit alors de lancer `:PlugInstall`

* ???????? `pacman -S vim-grammalecte vim-spell-fr` ?????????

# Reste à voir :
* aur dans pacman ?
* parefeu ?
* xorg-xkill ?
* `yay losslesscut`
* dvd ?
* cura/impression3D ? `yay meshlab`
* Émulateurs ?
* bta-3100
* [rezonator2](https://github.com/orion-project/rezonator2)
* [GpxTrackPoster](https://github.com/flopp/GpxTrackPoster) (pour ce soft `sudo pacman -S python-virtualenv`)
* Un éditeur d’équation genre [CodeCogs Equation Editor](https://www.codecogs.com/latex/eqneditor.php) ? et [latex ocr](https://webdemo.myscript.com/views/math/index.html) ?
* il y a d’autres softs sympas dans mes articles LP, à voir.
* dictionnaire ? traduction ? ascii ?
# À tester ?
* `yay openpose`
* `yay untrunc` pour réparer les mp4 ?
* gitqlient
* tmux
* autojump ?
* nano en couleur ?
* shotwell ou digikam ?
* easytag pour les vidéos car ce sont les titres metadata qui sont pris en compte par le partage upnp… mais je finis par supprimer ce paquet car les dossiers du bureau s’ouvre avec easytag…
* yay torbrowser-launcher
