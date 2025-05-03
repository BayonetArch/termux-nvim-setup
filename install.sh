#!/usr/bin/env bash
#this script helps to install the custom neovim  config made by me(BayonetArch) with lsp 
clear
RED_BOLD='\033[1;31m'
NC='\033[0m'
WARN="${RED_BOLD}⚠${NC}"
#check if colors.sh exists on the  working  directory or not 
source ./colors.sh || {
    echo -e "${WARN} ${RED_BOLD}Error: Failed to source colors.sh${NC}"
    exit 1
}
#check if user is connceted to the internett
echo -e "${CYAN} CHECKING INTERNET CONNECTION!!${NC}"
if ping -c 2 1.1.1.1;then
    echo -e "${TICK}${GREEN} You are connceted to internet continuing the installation${NC}"
    echo 
    echo
else 
    echo -e "${CROSS}${RED} Please connect to the internet and try again${NC} "
    exit 1
fi
#check if this script is being running on termux or not 
if ! [[ -f $PREFIX/bin/pkg || -f $PREFIX ]]; then
    echo -e "${CROSS}${RED}THIS SCRIPT IS INTENDED TO RUN ON TERMUX USING OUTSIDE TERMUX ENVIRONMENT IS NOT SUITABEL${NC}"
    exit 1
fi
#install basic tools for stying 

echo -e "${CYAN}Installing Nerd_fonts${NC}"
if cp ./font.ttf "$HOME"/.termux/; then
    echo -e "${TICK}${GREEN}Successfully installed nerd fonts${NC}"
    termux-reload-settings 
sleep 1
else
    
    echo -e "${CROSS}${RED} Failed to install nerd fonts${NC} "
exit 1

fi

echo -e "${CYAN}INSTALLING toilet,bat,sed${NC}"
if apt install toilet bat sed -y;then
    echo -e "${TICK}${GREEN} Success${NC}"
else
    echo -e "${CROSS}${RED} Failed!${NC}"
    exit  1
fi
sleep  2
sleep 0.5
#echo -e "${MAGENTA_BOLD}$(toilet -f ivrit -F border 'neovim config')${NC}"  #colorful ascci using toilet
echo -en "${YELLOW_BOLD}start the installation now? [${GREEN_BOLD}Y${NC}/${RED}n${NC}]:${NC} " 


read -r  option
if [[ $option == n ]]; then

    echo -e "${RED_BOLD} stopping the installation${NC}"
    exit 1
elif [[ -z "$option" ]]; then
    clear 
    echo -e "${BLACK_BACKGROUND} installing required packages  ${NC}"
    sleep 1
    sleep 1.5
elif [[ $option != y && $option != n  ]]; then

    echo -e "${ARROW} ${RED_BOLD}Invlaid option choose y or n ${NC}" 
    exit 1
else
    clear

    echo -e "${BLACK_BACKGROUND} installing required packages ! ${NC}"
    sleep 1
fi
apt_pkgs=(nodejs fzf grep ripgrep neovim lua-language-server clang shellcheck) 
#the animation is very lazy i know but  i  don't care  (:)
for pkg in "${apt_pkgs[@]}"; do
    echo -en  "${ARROW}${MAGENTA_BOLD} installing $pkg${NC}"
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    apt install "$pkg"  -y &>/dev/null 
    if [ $? -eq 0 ]; then
        echo -e "${CHECK}${GREEN} Success${TICK}${NC}"
    else
        echo -e "${CHECK}${RED_BOLD} Fail!${CROSS}${NC}"
        apt install "$pkg" -y>/dev/null 2>error.log


        bat --paging=never --decorations=always --color=always < error.log | sed 's/WARNING: apt does not have a stable CLI interface. Use with caution in scripts.//g'

        exit 1

    fi
done


npm_pkgs=(vscode-langservers-extracted  typescript typescript-language-server bash-language-server)
for pk in "${npm_pkgs[@]}"; do
    echo -en  "${ARROW}${MAGENTA_BOLD} installing $pk${NC}"
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4

    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4

    npm i -g "$pk" -y &>/dev/null
    if [ $? -eq 0 ]; then
        echo -e "${CHECK}${GREEN} Success${TICK}${NC}"
    else
        echo -e "${CHECK}${RED_BOLD} Fail!${CROSS}${NC}"
        npm i -g   "$pk" -y>/dev/null 2>error.log

        bat --paging=never --decorations=always --color=always < error.log | sed 's/WARNING: apt does not have a stable CLI interface. Use with caution in scripts.//g'

        exit 1

    fi
done
pip_pkg="pyright"
for p in $pip_pkg ; do
    echo -en "${ARROW}${MAGENTA_BOLD} installing $p${NC}"
    echo -en "."
    sleep 0.4

    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    echo -en "."
    sleep 0.4
    pip install $pip_pkg>/dev/null 2>error.log

    if [ $? -eq 0 ]; then
        echo -e "${CHECK}${GREEN} Success${TICK}${NC}"
    else
        echo -e "${CHECK}${RED_BOLD} Fail!${CROSS}${NC}"
        bat --paging=never --decorations=always --color=always < error.log | sed 's/WARNING: apt does not have a stable CLI interface. Use with caution in scripts.//g'

        exit 1
    fi
done
echo -e "${BLACK_BACKGROUND}PACKAGES INSTALLED SUCCESFULLY!${TICK} ${NC}"
sleep 0.8
clear
echo -e  "${CYAN_BACKGROUND}Copying the neovim config file${NC}"
config_dir="$HOME/.config"
backup_file="$HOME/.config/nvim.bak"
if ! [[ -d $config_dir ]]; then
    mkdir -p "$config_dir"
fi
if ! [[ -d $config_dir/nvim ]]; then
    echo  -e "${YELLOW_BOLD}WARNNING:${NC} ${WHITE_BOLD} $config_dir/nvim doesnot exist..${NC} "
    echo -e "${GREEN_BOLD}Directyly copying files....${NC}"
    sleep 1.5
    if  cp -r ./nvim "$config_dir/"; then
        echo -e "${TICK}${GREEN}Copy success${NC}"
    else 
        echo -e "${CROSS}${RED}Copy failed${NC}"
    fi

else
    echo -e "${RED}WARNING:${NC}${WHITE_BOLD}nvim config exists at $config_dir/nvim${NC}"
    echo
    echo -en "${ARROW}${CYAN_BOLD}Do you want to  create a backup file at $backup_file?${NC}[${GREEN_BOLD}Y${NC}/${RED_BOLD}n${NC}](${RED}the script will exit if you choose no${NC}):"
    read -r choice_backup
    if ! [[ -z  $choice_backup ]]; then
        if [[ $choice_backup == 'y' || $choice_backup == 'Y' ]]; then
            echo -ne ""
        elif [[ $choice_backup == 'n' || $choice_backup == 'N' ]]; then
            echo -e "${RED}EXITING...........${NC}" 
            exit 1
        else
            echo -e  "${RED}ERROR:${NC}${WHITE_BOLD}invalid choice please choose y or n or just hit enter${NC}"
            exit 1
        fi
    fi
fi
if ! [[ -f $config_dir/nvim/check.txt ]]; then
    echo -e "${MAGENTA_BOLD}Backing up files....to $backup_file ${NC}"
    if cp  -r "$config_dir"/nvim/ "$config_dir"/nvim.bak; then
        echo -e "${TICK} ${GREEN}Backup created succesfully successfully${NC}"
sleep 1
    else 
        echo -e "${RED}CREATING BACKUP FAILED${NC}"
        exit 1
    fi 
    echo -e "${MAGENTA_BOLD}Copying neovim files....${NC}"
    if  cp -r ./nvim "$config_dir";then
        sleep 0.8
        echo -e "${TICK}${GREEN}Copy success${NC}"
        rm "$config_dir"/nvim/check.txt
        sleep 2
    else 
        echo -e "${RED}COPY FAILED${NC}"
        exit 1
    fi

fi
clear
echo -e "${BLUE}$(toilet -f mono12  'Bayonet')${NC}"  
echo -en "${RED_BOLD}setting up neovim  config finished${TICK}${NC} do you want to start neovim now(${YELLOW}Recommended${NC})? [${GREEN_BOLD}Y${NC}/${RED}n${NC}]:${NC} " 
read -r  final_option
if [[ $final_option == n ]]; then
    clear
    echo -e "${RED_BOLD} installation of config finished ! (you can manually start neovim with command${NC} ${WHITE_BOLD}nvim${NC}"
    echo -e "${RED_BOLD}$(toilet -f mono12  'Bay0net')${NC}"  
    echo -e "${WHITE_BOLD}If you encounter any errors, check out my GitHub:${NC} ${RED}https://github.com/BayonetArch/${NC}"
    echo -e "${WHITE_BOLD} Or  visit my YouTube channel ${NC} ${RED}https://www.youtube.com/@Bayonet7${NC}"
    exit 0
elif [[ -z "$final_option" ]]; then
    echo -e "${GREEN} starting neovim.. ${NC}"
    sleep 1
    nvim
elif [[ $final_option == 'y' || $final_option == 'Y' ]]; then
    echo -e "${GREEN} starting neovim.. ${NC}"
    sleep 1
    nvim
elif [[ $final_option != y && $option != n  ]]; then
    clear
    echo -e "${RED_BOLD} installation of config finished ! (you can manually start neovim with command${NC} ${WHITE_BOLD}nvim${NC}"
    echo -e "${RED_BOLD}$(toilet -f mono12  'Bay0net')${NC}"  
    echo -e "${WHITE_BOLD}If you encounter any errors, check out my GitHub:${NC} ${RED}https://github.com/BayonetArch/${NC}"
    echo -e "${WHITE_BOLD} Or  visit my YouTube channel ${NC} ${RED}https://www.youtube.com/@Bayonet7${NC}"
    sleep 2
    exit 0
else
    echo ""
fi
clear
echo -e "${GREEN}installation finished !! ${NC}"
echo -e "${RED_BOLD}$(toilet -f mono12  'Bay0net')${NC}"  
echo -e "${WHITE_BOLD}If you encounter any errors, check out my GitHub:${NC} ${RED}https://github.com/BayonetArch/${NC}"
echo -e "${WHITE_BOLD} Or  visit my YouTube channel ${NC} ${RED}https://www.youtube.com/@Bayonet7${NC}"
