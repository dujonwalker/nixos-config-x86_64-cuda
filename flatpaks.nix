{ config, pkgs, ... }:

{
  # Systemd service to install Flatpak applications
  systemd.services.install-flatpak-apps = {
    description = "Install Flatpak applications";
    after = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ]; # Add flatpak to the PATH
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.bash}/bin/bash -c "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo \
        # Broswers
        #&& flatpak install -y flathub one.ablaze.floorp \
        #&& flatpak install -y flathub io.gitlab.librewolf-community \
        #&& flatpak install -y flathub net.waterfox.waterfox \
        #&& flatpak install -y flathub com.brave.Browser \
        #&& flatpak install -y flathub com.vivaldi.Vivaldi \
        #&& flatpak install -y flathub com.microsoft.Edge \
        #&& flatpak install -y flathub io.github.ungoogled_software.ungoogled_chromium \
        #&& flatpak install -y flathub io.github.ungoogled_software.ungoogled_chromium.Codecs \
        #&& flatpak install -y flathub com.google.Chrome \
        # Dev
        #&& flatpak install -y flathub com.vscodium.codium \
        #&& flatpak install -y flathub com.notepadqq.Notepadqq \
        #&& flatpak install -y flathub com.github.dail8859.NotepadNext \
        # Productivity
        #&& flatpak install -y flathub md.obsidian.Obsidian \
        #&& flatpak install -y flathub net.cozic.joplin_desktop \
        #&& flatpak install -y flathub com.logseq.Logseq \
        #&& flatpak install -y flathub io.appflowy.AppFlowy \
        #&& flatpak install -y flathub org.onlyoffice.desktopeditors \
        #&& flatpak install -y flathub org.libreoffice.LibreOffice \
        #&& flatpak install -y flathub com.github.johnfactotum.Foliate \
        && flatpak install -y flathub org.kde.ghostwriter \
        # ProAudio
        #&& flatpak install -y flathub org.ardour.Ardour \
        #&& flatpak install -y flathub org.audacityteam.Audacity \
        #&& flatpak install -y flathub org.audacityteam.Audacity.Codecs \
        #&& flatpak install -y flathub studio.kx.carla \
        #&& flatpak install -y flathub org.pipewire.Helvum \
        #&& flatpak install -y flathub com.github.Bleuzen.FFaudioConverter \
        # ProVideo
        #&& flatpak install -y flathub com.obsproject.Studio \
        #&& flatpak install -y flathub com.obsproject.Studio.Plugin.NDI \
        #&& flatpak install -y flathub com.obsproject.Studio.Plugin.WebSocket \
        #&& flatpak install -y flathub no.mifi.losslesscut \
        #&& flatpak install -y flathub org.openshot.OpenShot \
        #&& flatpak install -y flathub com.dec05eba.gpu_screen_recorder \
        #&& flatpak install -y flathub io.github.seadve.Kooha \
        #&& flatpak install -y flathub hu.irl.cameractrls \
        #&& flatpak install -y flathub com.core447.StreamController \
        # Graphics
        #&& flatpak install -y flathub org.gimp.GIMP \
        #&& flatpak install -y flathub org.gimp.GIMP.Manual \
        && flatpak install -y flathub com.github.gijsgoudzwaard.image-optimizer \
        #&& flatpak install -y flathub com.xnview.XnConvert \
        #&& flatpak install -y flathub io.gitlab.adhami3310.Converter \
        #&& flatpak install -y flathub org.darktable.Darktable \
        #&& flatpak install -y flathub org.upscayl.Upscayl \
        #&& flatpak install -y flathub net.fasterland.converseen \
        # AI
        #&& flatpak install -y flathub com.jeffser.Alpaca \
        #&& flatpak install -y flathub io.github.pejuko.follamac \
        #&& flatpak install -y flathub io.gpt4all.gpt4all \
        # VideoPlayers
        #&& flatpak install -y flathub io.mpv.Mpv \
        #&& flatpak install -y flathub org.videolan.VLC \
        # AudioPlayers
        #&& flatpak install -y flathub io.bassi.Amberol \
        && flatpak install -y flathub org.strawberrymusicplayer.strawberry \
        #&& flatpak install -y flathub org.gnome.Decibels \
        #&& flatpak install -y flathub org.kde.juk \  
        #&& flatpak install -y flathub org.kde.kasts \
        #&& flatpak install -y flathub org.gpodder.gpodder \
        && flatpak install -y flathub com.github.neithern.g4music \
        # Comms
        #&& flatpak install -y flathub org.telegram.desktop \
        #&& flatpak install -y flathub com.discordapp.Discord \
        #&& flatpak install -y flathub com.mattermost.Desktop \
        # Utilities
        && flatpak install -y flathub com.github.tchx84.Flatseal"
        #&& flatpak install -y com.github.qarmin.czkawka \
        #&& flatpak install -y flathub net.filebot.FileBot \
        #&& flatpak install -y flathub org.nickvision.tagger \
        #&& flatpak install -y flathub org.filezillaproject.Filezilla \
        #&& flatpak install -y flathub org.remmina.Remmina \
        #&& flatpak install -y flathub org.gnome.Boxes \
        #&& flatpak install -y flathub io.github.aggalex.Wineglass \
        #&& flatpak install -y flathub io.github.jeffshee.Hidamari \
        #&& flatpak install -y flathub io.gitlab.azymohliad.WatchMate \
        #&& flatpak install -y flathub com.nextcloud.desktopclient.nextcloud"
      '';
    };
  };
}
