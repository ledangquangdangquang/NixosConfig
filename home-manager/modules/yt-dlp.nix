{
  programs.yt-dlp = {
    enable = true;
    extraConfig = 
   ''

    # Create link to C:\Users\LENOVO LEGION\yt-dlp.conf
    -x
    -f bestaudio
    --audio-format aac
    --audio-quality 320K
#--audio-quality 0
    --embed-thumbnail
    --embed-metadata
# --embed-chapters
    --parse-metadata "playlist_index:%(track_number)s" 
# Where and how to save
    -o "~/Downloads/%(title)s.%(ext)s"

#Download a portion of the vid
#--downloader ffmpeg --downloader-args "ffmpeg_i:-ss 00:02:00 -to 00:05:00"
   ''; 
  };
}
