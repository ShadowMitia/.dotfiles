alias icat="kitty +kitten icat"
alias ssh="kitty +kitten ssh"

# alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1"
alias cat="bat"
# Banish all evil!
alias vim="emacs"
alias vi="emacs"
alias ls="exa"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

FORMATS="(bestvideo[vcodec^=av01][height>=4320][fps>30]/bestvideo[vcodec^=vp9.2][height>=4320][fps>30]/bestvideo[vcodec^=vp9][height>=4320][fps>30]/bestvideo[vcodec^=avc1][height>=4320][fps>30]/bestvideo[height>=4320][fps>30]/bestvideo[vcodec^=av01][height>=4320]/bestvideo[vcodec^=vp9.2][height>=4320]/bestvideo[vcodec^=vp9][height>=4320]/bestvideo[vcodec^=avc1][height>=4320]/bestvideo[height>=4320]/bestvideo[vcodec^=av01][height>=2880][fps>30]/bestvideo[vcodec^=vp9.2][height>=2880][fps>30]/bestvideo[vcodec^=vp9][height>=2880][fps>30]/bestvideo[vcodec^=avc1][height>=2880][fps>30]/bestvideo[height>=2880][fps>30]/bestvideo[vcodec^=av01][height>=2880]/bestvideo[vcodec^=vp9.2][height>=2880]/bestvideo[vcodec^=vp9][height>=2880]/bestvideo[vcodec^=avc1][height>=2880]/bestvideo[height>=2880]/bestvideo[vcodec^=av01][height>=2160][fps>30]/bestvideo[vcodec^=vp9.2][height>=2160][fps>30]/bestvideo[vcodec^=vp9][height>=2160][fps>30]/bestvideo[vcodec^=avc1][height>=2160][fps>30]/bestvideo[height>=2160][fps>30]/bestvideo[vcodec^=av01][height>=2160]/bestvideo[vcodec^=vp9.2][height>=2160]/bestvideo[vcodec^=vp9][height>=2160]/bestvideo[vcodec^=avc1][height>=2160]/bestvideo[height>=2160]/bestvideo[vcodec^=av01][height>=1440][fps>30]/bestvideo[vcodec^=vp9.2][height>=1440][fps>30]/bestvideo[vcodec^=vp9][height>=1440][fps>30]/bestvideo[vcodec^=avc1][height>=1440][fps>30]/bestvideo[height>=1440][fps>30]/bestvideo[vcodec^=av01][height>=1440]/bestvideo[vcodec^=vp9.2][height>=1440]/bestvideo[vcodec^=vp9][height>=1440]/bestvideo[vcodec^=avc1][height>=1440]/bestvideo[height>=1440]/bestvideo[vcodec^=av01][height>=1080][fps>30]/bestvideo[vcodec^=vp9.2][height>=1080][fps>30]/bestvideo[vcodec^=vp9][height>=1080][fps>30]/bestvideo[vcodec^=avc1][height>=1080][fps>30]/bestvideo[height>=1080][fps>30]/bestvideo[vcodec^=av01][height>=1080]/bestvideo[vcodec^=vp9.2][height>=1080]/bestvideo[vcodec^=vp9][height>=1080]/bestvideo[vcodec^=avc1][height>=1080]/bestvideo[height>=1080]/bestvideo[vcodec^=av01][height>=720][fps>30]/bestvideo[vcodec^=vp9.2][height>=720][fps>30]/bestvideo[vcodec^=vp9][height>=720][fps>30]/bestvideo[vcodec^=avc1][height>=720][fps>30]/bestvideo[height>=720][fps>30]/bestvideo[vcodec^=av01][height>=720]/bestvideo[vcodec^=vp9.2][height>=720]/bestvideo[vcodec^=vp9][height>=720]/bestvideo[vcodec^=avc1][height>=720]/bestvideo[height>=720]/bestvideo[vcodec^=av01][height>=480][fps>30]/bestvideo[vcodec^=vp9.2][height>=480][fps>30]/bestvideo[vcodec^=vp9][height>=480][fps>30]/bestvideo[vcodec^=avc1][height>=480][fps>30]/bestvideo[height>=480][fps>30]/bestvideo[vcodec^=av01][height>=480]/bestvideo[vcodec^=vp9.2][height>=480]/bestvideo[vcodec^=vp9][height>=480]/bestvideo[vcodec^=avc1][height>=480]/bestvideo[height>=480]/bestvideo[vcodec^=av01][height>=360][fps>30]/bestvideo[vcodec^=vp9.2][height>=360][fps>30]/bestvideo[vcodec^=vp9][height>=360][fps>30]/bestvideo[vcodec^=avc1][height>=360][fps>30]/bestvideo[height>=360][fps>30]/bestvideo[vcodec^=av01][height>=360]/bestvideo[vcodec^=vp9.2][height>=360]/bestvideo[vcodec^=vp9][height>=360]/bestvideo[vcodec^=avc1][height>=360]/bestvideo[height>=360]/bestvideo[vcodec^=avc1][height>=240][fps>30]/bestvideo[vcodec^=av01][height>=240][fps>30]/bestvideo[vcodec^=vp9.2][height>=240][fps>30]/bestvideo[vcodec^=vp9][height>=240][fps>30]/bestvideo[height>=240][fps>30]/bestvideo[vcodec^=avc1][height>=240]/bestvideo[vcodec^=av01][height>=240]/bestvideo[vcodec^=vp9.2][height>=240]/bestvideo[vcodec^=vp9][height>=240]/bestvideo[height>=240]/bestvideo[vcodec^=avc1][height>=144][fps>30]/bestvideo[vcodec^=av01][height>=144][fps>30]/bestvideo[vcodec^=vp9.2][height>=144][fps>30]/bestvideo[vcodec^=vp9][height>=144][fps>30]/bestvideo[height>=144][fps>30]/bestvideo[vcodec^=avc1][height>=144]/bestvideo[vcodec^=av01][height>=144]/bestvideo[vcodec^=vp9.2][height>=144]/bestvideo[vcodec^=vp9][height>=144]/bestvideo[height>=144]/bestvideo)+(bestaudio[acodec^=opus]/bestaudio)/best"

function dla
{
    if [ -z $1 ]
    then
  echo 'Usage: dla "URL"'
    else
  youtube-dl --add-metadata --write-all-thumbnails --embed-thumbnail --write-info-json --embed-subs --all-subs -i --prefer-free-formats -o '~/Music/Downloads/%(title)s.%(ext)s'  --download-archive ~/Music/Downloads/archive.txt  --extract-audio $1
    fi
}

function dllist
{
    if [ -z $1 ]
    then
  echo 'Usage: dllist "URL" [range] where range can be any of x-y x,y x,z,w\nNote: URL _NEEDS_ to be in quotes'
    else
  if [ -z $2 ]
  then
    #   youtube-dl -c --add-metadata --embed-thumbnail --embed-subs -i --prefer-free-formats -o "~/Videos/Downloads/%(playlist)s/[%(playlist_index)s]-%(title)s.%(ext)s"  --download-archive ~/Videos/Downloads/archive.txt "${1}"
    	yt-dlp --external-downloader aria2c --external-downloader-args '-j 16 -x 16 -s 16 -k 1M' --prefer-free-formats  --format ${FORMATS} --sleep-interval 5 --max-sleep-interval 30 --ignore-errors --no-continue --no-overwrites --download-archive ~/Videos/Downloads/archive.txt --add-metadata --write-description --write-annotations --write-thumbnail --embed-thumbnail --all-subs --sub-format "srt" --embed-subs --match-filter "!is_live & !live" --output "~/Videos/Downloads/%(playlist)s/[%(playlist_index)s]-%(title)s.%(ext)s"  --extractor-retries 20 "$1"

  else
      youtube-dl -c --add-metadata --embed-thumbnail --embed-subs --prefer-free-formats -o "~/Videos/Downloads/%(playlist)s/[%(playlist_index)s]-%(title)s.%(ext)s"  --download-archive ~/Videos/Downloads/archive.txt "${1}" --playlist-items $2
  fi
    fi
}



function dl
{
    if [ -z $1 ]
    then
  echo 'Usage: dl "URL"'
    else
      # youtube-dl -c --add-metadata --embed-thumbnail --embed-subs --all-subs -i --prefer-free-formats -o '~/Videos/Downloads/%(title)s.%(ext)s'  --download-archive ~/Videos/Downloads/archive.txt $1
	yt-dlp --external-downloader aria2c --external-downloader-args '-j 16 -x 16 -s 16 -k 1M' --no-playlist --prefer-free-formats --format ${FORMATS} --sleep-interval 5 --max-sleep-interval 30 --ignore-errors --no-continue --no-overwrites --download-archive ~/Videos/Downloads/archive.txt --add-metadata --write-description --write-annotations --write-thumbnail --embed-thumbnail --all-subs --sub-format "srt" --embed-subs --match-filter "!is_live & !live" --output "~/Videos/Downloads/%(title)s.%(ext)s"  --extractor-retries 20 $1
    fi
}

# the fuck : https://github.com/nvbn/thefuck
if command -v thefuck &> /dev/null
then
    eval $(thefuck --alias)
fi


# Extract archive
function extract {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ] ; then
            case $1 in
                *.tar.bz2)   tar xvjf ./$1    ;;
                .tar.gz)    tar xvzf ./$1    ;;
                *.tar.xz)    tar xvJf ./$1    ;;
                *.lzma)      unlzma ./$1      ;;
                *.bz2)       bunzip2 ./$1     ;;
                *.rar)       unrar x -ad ./$1 ;;
                *.gz)        gunzip ./$1      ;;
                *.tar)       tar xvf ./$1     ;;
                *.tbz2)      tar xvjf ./$1    ;;
                *.tgz)       tar xvzf ./$1    ;;
                *.zip)       unzip ./$1       ;;
                *.Z)         uncompress ./$1  ;;
                *.7z)        7z x ./$1        ;;
                *.xz)        unxz ./$1        ;;
                *.exe)       cabextract ./$1  ;;
                *)           echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}

function sl
{
    # sl - prints a mirror image of ls. (C) 2017 Tobias Girstmair, https://gir.st/, GPLv3

    LEN=$(ls "$@" |wc -L) # get the length of the longest line

    ls "$@" | rev | while read -r line
    do
	printf "%${LEN}.${LEN}s\\n" "$line" | sed 's/^\(\s\+\)\(\S\+\)/\2\1/'
    done
}

function cleanup
{
    echo "=== Cleaning up logs ===";
    sudo journalctl --vacuum-size=128M; #http://www.commitstrip.com/en/2017/01/16/nice-try/
    echo "=== Checking logs integrity ===";
    journalctl --verify;
    echo "=== Done cleaning ===";
}

function update_rust_analyzer {
    curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
    chmod +x ~/.local/bin/rust-analyzer
}

# ZSH only
function merge_all_ts_files {

    IFS=$'\n' array=($(ls *.ts | cut -d'.' -f1 | uniq))
    for element in "${array[@]}";
    do
        echo $element.*.ts;
        cat $element.*.ts > "$element.ts";
        ffmpeg -i "$element.ts" -acodec copy -vcodec "$element.mp4"
    done

}



# EMSDK
source "$HOME/gits/emsdk/emsdk_env.sh" > /dev/null 2>&1
export CPM_SOURCE_CACHE=$HOME/.cache/CPM


# oh my posh
eval "$(oh-my-posh --init --shell zsh --config ~/.powerlevel10K_rainbow.omp.json)"
