# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias icat="kitty +kitten icat"
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

