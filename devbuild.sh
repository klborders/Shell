BLURPLE='\033[0;35m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "${BLURPLE}Running Kam's awesome (LOL-NOT) \
MacOS developer environment set up script!\n${NC}...\n\n"

# Install homebrew
printf "${BLURPLE}Installing Homebrew if it is not already installed...${NC}\n"
if ! command -v brew | grep -q '/usr/local/bin/brew'; then
    printf "${BLURPLE} Homebrew is not installed! Installing...\n${NC}"
    {
        xcode-select --install
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    } || {
        printf "${RED}Failed to install Homebrew! Exiting...\n\n${NC}"
        exit
    }
    if command -v brew | grep -q '/usr/local/bin/brew'; then
        printf "${GREEN}Successfully installed Homebrew! Yee...\n\n${NC}"
    fi
else
    printf "${GREEN}Homebrew is already isntalled.\n\n${NC}"
fi
sleep 1

# Install and configure Chrome
printf "${BLURPLE}Installing Google Chrome if it is not already installed...${NC}\n"
if ! ls /Applications/Google\ Chrome.app/ | grep -q 'Contents'; then
    {
        brew install chrome
    } || {
        printf "${RED}Failed to install Google Chrome! Exiting...\n\n${NC}"
        exit
    }
    if ls /Applications/Google\ Chrome.app/ | grep -q 'Contents'; then
        printf "${GREEN}Successfully installed Google Chrome! Yee...\n\n${NC}"
    fi
else
    printf "${GREEN}Google Chrome is already isntalled.\n\n${NC}"
fi
sleep 1

# Install Google Cloud
printf "${BLURPLE}Setting up Google Cloud...${NC}\n"
if ! gcloud --version | grep -q 'Google Cloud SDK'; then
    printf "${BLURPLE}Validating Python 2.7.10 is default...${NC}\n"
    if python -c 'import sys; print(sys.version_info[:])' | grep -q '2, 7, 10,'; then
        {
           printf "${GREEN}The correct version of Python is installed.\n${NC}"
           printf "${BLURPLE}Downloading the Google Cloud SDK...\n${NC}"
           curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-244.0.0-darwin-x86_64.tar.gz
        } || {
            printf "${RED}Failed to download the Google Cloud SDK! Exiting...\n\n${NC}"
            exit
        }
        FILE=./google-cloud-sdk-244.0.0-darwin-x86_64.tar.gz
        if test -f "$FILE"; then
            printf "${GREEN}Successfully downloaded the Google Cloud SDK!\n${NC}"
            printf "${BLURPLE}Attempting to extract ./google-cloud-sdk-244.0.0-darwin-x86_64.tar.gz...${NC}\n"
            {
                tar xf ./google-cloud-sdk-244.0.0-darwin-x86_64.tar.gz
            } || {
                printf "${RED}Failed to extract ./google-cloud-sdk-244.0.0-darwin-x86_64.tar.gz! Exiting...\n${NC}"
                exit
            }
            if ls google-cloud-sdk | grep -q 'install.sh'; then
                printf "${GREEN}Successfully extracted ./google-cloud-sdk-244.0.0-darwin-x86_64.tar.gz!\n${NC}"
                printf "${BLURPLE}Attempting to install the Google Cloud SDK...${NC}\n"
                {
                    ./google-cloud-sdk/install.sh
                } || {
                    printf "${RED}Failed to install the Google Cloud SDK! Exiting...\n${NC}"
                    exit
                }
            fi
        fi
    else
        printf "${RED}Failed to set up Google Cloud due to the incorrect\
    version of Python. Please validate python 2.7 is isntalled! Exiting...\n\n${NC}"
    fi
else
    printf "${GREEN}The Google Cloud SDK is already installed.\n\n${NC}"
fi


# Install and configure vscode
printf "${BLURPLE}Installing vscode if it is not already installed...${NC}\n"
if ! command -v code | grep -q '/usr/local/bin/code'; then
    {
        brew cask install visual-studio-code
    } || {
        printf "${RED}Failed to install vscode! Exiting...\n\n${NC}"
        exit
    }
    if command -v code | grep -q '/usr/local/bin/code'; then
        printf "${GREEN}Successfully installed vscode! Yee...\n\n${NC}"
    fi
else
    printf "${GREEN}vscode is already isntalled.\n\n${NC}"
fi
sleep 1

# Install vscode extensions
echo "FIX ME"

# Install and configure iTerm
printf "${BLURPLE}Installing iTerm2 if it is not already installed...${NC}\n"
if ! ls /Applications/iTerm.app/ | grep -q 'Cont'; then
    {
        brew cask install iterm2
    } || {
        printf "${RED}Failed to install iTerm2! Exiting...\n\n${NC}"
        exit
    }
    if ls /Applications/iTerm.app/ | grep -q 'Cont'; then
        printf "${GREEN}Successfully installed iTerm2! Yee...\n\n${NC}"
    fi
else
    printf "${GREEN}iTerm2 is already isntalled.\n\n${NC}"
fi
sleep 1

# set login shell to /bin/bash
printf "${BLURPLE}Validating login shell is set to /bin/bash...${NC}\n"
if ! echo $SHELL | grep -q '/bin/bash'; then
    {
        chsh -s /bin/bash
    } || {
        printf "${RED}Failed to set login shell to /bin/bash! Exiting...\n\n${NC}"
        exit
    }
    if echo $SHELL | grep -q '/bin/bash'; then
        printf "${GREEN}Successfully set login shell to /bin/bash! Yee...\n\n${NC}"
    fi
else
    printf "${GREEN}Login shell has already been set to /bin/bash.\n\n${NC}"
fi
sleep 1

# Set the bash profile
printf "${BLURPLE}Validating ~/.bash_profile has been set up...${NC}\n"
if ! cat ~/.bash_profile | grep -q 'export EDITOR='; then
    {
cat > ~/.bash_profile <<- EOM
export VISUAL=vim
export EDITOR="vim"
alias cls='clear'
EOM
source ~/.bash_profile
    } || {
        printf "${RED}Failed to configure ~/.bash_profile...\n\n${NC}"
        exit
    }
    if cat ~/.bash_profile | grep -q 'export EDITOR='; then
        printf "${GREEN}Successfully set up ~/.bash_profile! Yee...\n\n${NC}"
    fi
else
    printf "${GREEN}~/.bash_profile has already been set up.\n\n${NC}"
fi
sleep 1

# Install and configure Discord
printf "${BLURPLE}Installing Discord if it is not already installed...${NC}\n"
if ! ls /Applications/Discord.app/ | grep -q 'Cont'; then
    {
        brew cask install discord
    } || {
        printf "${RED}Failed to install Discord! Exiting...\n\n${NC}"
        exit
    }
    if ls /Applications/Google\ Chrome.app/ | grep -q 'Contents'; then
        printf "${GREEN}Successfully installed Discord! Yee...\n\n${NC}"
    fi
else
    printf "${GREEN}Discord is already isntalled.\n\n${NC}"
fi
sleep 1

# Install and configure Spotify
printf "${BLURPLE}Installing Spotify if it is not already installed...${NC}\n"
if ! ls /Applications/Spotify.app/ | grep -q 'Cont'; then
    {
        brew cask install spotify
    } || {
        printf "${RED}Failed to install Spotify! Exiting...\n\n${NC}"
        exit
    }
    if ls /Applications/Google\ Chrome.app/ | grep -q 'Contents'; then
        printf "${GREEN}Successfully installed Spotify! Yee...\n\n${NC}"
    fi
else
    printf "${GREEN}Spotify is already isntalled.\n\n${NC}"
fi

# Install and configure Slack
printf "${BLURPLE}Installing Slack if it is not already installed...${NC}\n"
if ! ls /Applications/Slack.app/ | grep -q 'Cont'; then
    {
        brew cask install slack
    } || {
        printf "${RED}Failed to install Slack! Exiting...\n\n${NC}"
        exit
    }
    if ls /Applications/Google\ Chrome.app/ | grep -q 'Contents'; then
        printf "${GREEN}Successfully installed Slack! Yee...\n\n${NC}"
    fi
else
    printf "${GREEN}Slack is already isntalled.\n\n${NC}"
fi
sleep 1

# Set up darkmode for Slack
echo "FIX ME"

#
