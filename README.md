Mes notes post installation de Manjaro. C'est en vrac, ça n’engage que moi, c’est pas encore bien mis en forme mais c’est un premier jet :

J’installe Manjaro-Gnome. Une fois l’installation terminée, je lance l’utilitaire de mise à jour.

# Paquets
Puis j’installe quelques paquets :
```
pacman -S thunderbird gimp{,-refocus,-plugin-gmic} blender inkscape openscad owncloud-client playonlinux tilix \
celluloid vlc ffmpeg gst-plugins-{bad,good,ugly} kdenlive audacity soundconverter \
texlive{-bibtexextra,-latexextra,-pictures,-langextra} img2pdf pstoedit pdf{2svg,arranger,tk} xournalpp chromium \
gnuplot p7zip htop pydf thefuck tldr gparted exfat-utils ntfs-3g sshfs keepassxc unzip trash-cli optipng \
perl-image-exiftool jhead gzip poppler xdg-utils tesseract{,-data-fra,-data-eng} ghostscript cozy-desktop \
yay base-devel pkgfile meld diffpdf system-config-printer lollypop simple-scan shotwell gedit-plugins \
ttf-{roboto,roboto-mono,ubuntu-font-family,caladea,linux-libertine,linux-libertine-g,liberation} \
{awesome-terminal,powerline}-fonts fish python-nautilus steam-manjaro game-devices-udev arc-gtk-theme \
linux-steam-integration digikam libxml2 python2-lxml cura{,-resources-materials} calibre openssh pavucontrol
```

# AUR
## Quelques paquets supplémentaires :
* [cht.sh](http://cht.sh/) : `yay cht.sh`
* [Jdownloader2](https://jdownloader.org) : `yay jdownloader2`
* [Tixeo (visio conférence boulot)](https://www.tixeo.com/) : `yay tixeo`
* livrets à partir de pdf ? **bookletimposer** ne semble pas fonctionner, trouver une alternative…

## Correcteur grammatical
* `yay libreoffice-extension-grammalecte-fr`
* [Extension Firefox](https://addons.mozilla.org/fr/firefox/addon/grammalecte-fr/)
* [Extension Thunderbird](https://grammalecte.net/#download) <!-- incompatible avec la dernière version de thunderbird ? -->

## Pour mes scripts
`yay pdfposter`
* manque **lptools libav-tools(ffmpeg) cups-client**

## Polices
* Pour avoir la police Sawasdee : `yay ttf-tlwg`
* Pour des emojis qui s'affichent comme il faut dans **Emoji Selector** : `yay ttf-joypixels`
* Pour les polices Microsoft (pourrait être mieux, voir source) : `yay ttf-ms-fonts && yay ttf-vista-fonts && yay ttf-tahoma` [Source](https://wiki.archlinux.org/index.php/Microsoft_fonts)

## Audio
Pour envoyer le son de l’ordinateur sur un périphérique upnp-dlna (chrome-key ou freebox par exemple), la solution la plus simple me semble être `yay pulseaudio-dlna` (qu’il faudra lancer au démarrage de la session), **pavucontrol** permet ensuite d’aisément sélectionner la sortie audio.

# ssh
* Configurer ssh : `sudo nano /etc/ssh/sshd_config`
* Lancer ssh : `sudo systemctl start sshd.service`



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


# Gestionaire de paramètres Manjaro
Dans le **Gestionnaire de paramètres Manjaro** : je peux mettre à jour le **noyau** ou installer les **paquets linguistiques**, ce que je fais.

## Carte graphique ?


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

## Extensions Gnome-shell
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

# Personnalisations/Debug

## gedit
Dans les préférences de Gedit :
* Affichage : je coche 
	* **Afficher les numéros de ligne**
	* **Afficher la carte de la vue d’ensemble**
	* **surligner la ligne actuelle**
	* **Surligner les parenthèses correspondantes**
* Police et couleurs : Je coche **Utiliser la police système à chasse fixe (Hack 11)** et choisi le jeu de couleur **Solarisé foncé** 

## Remettre les icônes dans les menus (gimp, inkscape,…)
[Source](https://forum.ubuntu-fr.org/viewtopic.php?id=2009199)
C'est faisable avec **dconf-editor** mais comme la clé est vide par défaut (sous Manjaro) : `dconf write /org/gnome/settings-daemon/plugins/xsettings/overrides "{'Gtk/ButtonImages': <1>, 'Gtk/MenuImages': <1>}"`

## Problème des ligatures grasses disgracieuses
`printf "<match target=\"font\">\n<edit name=\"embeddedbitmap\" mode=\"assign\">\n<bool>false</bool>\n</edit>\n</match>" | sudo tee /etc/fonts/local.conf`

## Extensions Inkscape
`yay textext` (j'installe **libxml2** et **python2-lxml** pour cette extension, il serait plus malin que le paquet aur soit mieux configuré)



# fish
Je souhaite tenter quelques temps fish au lieu de zsh, au moins quelques temps…
`chsh -s /usr/bin/fish $USERNAME`
* Trouver l’équivalent à : 
	* !!
	* !$
	* raccourci |grep : G
	* activer pgup/pgdown


# Bépo
* Pour que les applications GTK prennent en compte toutes les fonctionnalités du bépo : `printf "\n\nGTK_IM_MODULE=xim" >> $HOME/.zshenv` [pour bug](https://bugs.launchpad.net/inkscape/+bug/1741283). Reste le [problème du tampon + Maj](https://bugs.launchpad.net/inkscape/+bug/1323080)
* Reste le problème de gdm !
* Dans **Ajustements → Clavier et souris** : J'active **Compose** (Super droit)
* Pour que bépo soit pris en compte dans tty :
`nano /etc/default/keyboard`
```
XKBMODEL="pc105"
XKBLAYOUT="fr"
XKBVARIANT="bepo_afnor"
XKBOPTIONS="lv3:ralt_switch"

BACKSPACE="guess" 
```


# Clé ssh
* Génération de ma clé ssh : `ssh-keygen -t ed25519 -f $HOME/.ssh/id_ed25519`
* **ssh-copy** permettra d’envoyer ma clé sur les pc du réseau…


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


# Nautilus
* Dans les préférences de Nautilus :
	* Onglet __Vue__, je choisi d’afficher la taille en première information libellé de la vue en icônes.
	* Onglet __Comportement__, l'action d'ouverture sur Simple clic
* Pour intégrer meld : `yay nautilus-compare`
* Pour intégrer git : `yay rabbitvcs-nautilus`
* [Mes scripts Nautilus](https://github.com/yeKcim/my_nautilus_scripts) :
	* Pour ma machine `git clone git@github.com:yeKcim/my_nautilus_scripts.git $HOME/.local/share/nautilus/scripts`
	* Sur les machines qui n’ont pas ma clé `git clone https://github.com/yeKcim/my_nautilus_scripts.git $HOME/.local/share/nautilus/scripts`)
* J’ajoute un marque-page vers **ftp://freebox@mafreebox.free.fr**


# Jeux
* `pacman -S wesnoth warzone2100 teeworlds supertuxkart blobby2 frogatto sauerbraten chromium-bsu`
* [Shattered Pixel Dungeon](https://pixeldungeon.fandom.com/wiki/Mod-Shattered_Pixel_Dungeon) : `yay shattered-pixel-dungeon`
* [torus-trooper](http://www.emhsoft.com/ttrooper/) (j’ai tenté d’utiliser aur mais rien n’y fait…) : je télécharge le [pkg.tar](https://drive.google.com/file/d/1dvgE4VjyKtXiYrDh2sitE55mRwkZobmL/edit) et `sudo pacman -U torus-trooper-0.22-10-x86_64.pkg.tar`
* [mrboom](http://mrboom.mumblecore.org/) : `yay mrboom` (reste à l’ajouter dans steam pour l’utiliser à la manette…)
* OpenSC2K ? lincity ? openttd ? ou autre ? en tout cas il serait intéressant d’avoir une jeu de gestion
## Steam
* J’ajoute */mnt/data/SteamGames* dans la liste des dossiers et le défini par défaut (steam → paramètres →  Téléchargements)
* Je dois également modifier */usr/share/applications/steam.desktop* pour supprimer **%U** afin d’avoir un raccourci Steam fonctionnel


# Reste à voir :
* aur dans pacman ? ou yay upgrade ?
* yay/pacman nettoyage ?
 ==> yay -Yc
* vi ?
 ==> https://github.com/michamos/vim-bepo
* Drivers (nvidia,…)
* D’autres extensions inkscape ?
* parefeu ?
* xorg-xkill ?
* dvd ?
* cura/impression3D ? 
* Émulateurs ?
* https://forum.manjaro.org/c/announcements/stable-updates

