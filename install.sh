#!/bin/bash
echo -e -n "\033[0;97mDo you want to install simple-bash-prompt? (Y/n)? \033[m"
read response
if [[ "$response" == "y" || "$response" == "Y" || -z $response ]]; then
    if [ -f .bash_prompt ]; then
        if [ -f ~/.bash_prompt ]; then 
            echo -e "\033[0;33m There already exists a .bash_prompt in your home directory.\033[m"
            echo -e -n "\033[0;33m Do you want to overwrite it? (y/N)? \033[m"
            read response
            if [[ "$response" == "y" || "$response" == "Y" ]]; then
                echo -e  "\033[0;97m Copy .bash_prompt to home directory and add \"source ~/.bash_prompt\" to your .bashrc.\033[m"
                if [ "$(pwd)" != "$(eval echo ~$USER)" ]; then
                    cp .bash_prompt ~/.bash_prompt
                fi
                if [[ -f ~/.bashrc && -n "$(tail -n1 ~/.bashrc)" ]]; then
                    echo "" >> ~/.bashrc
                    echo "" >> ~/.bashrc
                elif [[ -f ~/.bashrc && -z "$(tail -n1 ~/.bashrc)" && -n $(cat ~/.bashrc) ]]; then
                    echo "" >> ~/.bashrc
                fi
                echo "# execute github.com/koljah-de/simple-bash-pompt" >> ~/.bashrc
                echo -n "source ~/.bash_prompt" >> ~/.bashrc
                echo -e "\033[0;32m Simple-bash-prompt installed.\033[m"
            else
                echo -e "\033[0;31m Did not install simple-bash-prompt.\033[m"
            fi
        else
            echo -e "\033[0;97m Copy .bash_prompt to home directory and add \"source ~/.bash_prompt\" to your .bashrc.\033[m"
            if [ "$(pwd)" != "$(eval echo ~$USER)" ]; then
                cp .bash_prompt ~/.bash_prompt
            fi
            if [[ -f ~/.bashrc && -n "$(tail -n1 ~/.bashrc)" ]]; then
                echo "" >> ~/.bashrc
                echo "" >> ~/.bashrc
            elif [[ -f ~/.bashrc && -z "$(tail -n1 ~/.bashrc)" && -n $(cat ~/.bashrc) ]]; then
                echo "" >> ~/.bashrc
            fi
            echo "# execute github.com/koljah-de/simple-bash-pompt" >> ~/.bashrc
            echo -n "source ~/.bash_prompt" >> ~/.bashrc
            echo -e "\033[0;32m Simple-bash-prompt installed.\033[m"
        fi
    else
        echo -e "\033[0;31m FATAL ERROR: Can't find .bash_prompt.\033[m"
    fi
else
    echo -e "\033[0;31m Did not install simple-bash-prompt.\033[m"
fi

echo -e -n "\033[0;97mDo you want to add better tab completion to ~/.inputrc? (Y/n)? \033[m"
read response
if [[ "$response" == "y" || "$response" == "Y" || -z $response ]]; then
    if [[ -f ~/.inputrc && -n "$(tail -n1 ~/.inputrc)" ]]; then
        echo "" >> ~/.inputrc
        echo "" >> ~/.inputrc
    elif [[ -f ~/.inputrc && -z "$(tail -n1 ~/.inputrc)" && -n $(cat ~/.inputrc) ]]; then
        echo "" >> ~/.inputrc
    fi
    echo "# Faster tab completion" >> ~/.inputrc
    echo "set show-all-if-ambiguous on" >> ~/.inputrc
    echo "set completion-ignore-case on" >> ~/.inputrc
    echo "" >> ~/.inputrc
    echo "# TAB through the suggestions" >> ~/.inputrc
    echo "TAB:menu-complete" >> ~/.inputrc
    echo "" >> ~/.inputrc
    echo "# Move between words with Ctrl+Left and Ctrl+Right" >> ~/.inputrc
    echo "\"\e[1;5D\":backward-word" >> ~/.inputrc
    echo "\"\e[1;5C\":forward-word" >> ~/.inputrc
    echo "" >> ~/.inputrc
    echo "# Enable the history search mode" >> ~/.inputrc
    echo "\"\e[A\":history-search-backward" >> ~/.inputrc
    echo "\"\e[B\":history-search-forward" >> ~/.inputrc
    echo "\"\e[C\":forward-char" >> ~/.inputrc
    echo "\"\e[D\":backward-char" >> ~/.inputrc
    echo "" >> ~/.inputrc
    echo "# Enable colors" >> ~/.inputrc
    echo "set colored-stats On" >> ~/.inputrc
    echo "set visible-stats On" >> ~/.inputrc
    echo "set mark-symlinked-directories On" >> ~/.inputrc
    echo "set colored-completion-prefix On" >> ~/.inputrc
    echo "set menu-complete-display-prefix On" >> ~/.inputrc
    echo "" >> ~/.inputrc
    echo "# Disables the control echo after pressing Ctrl+C" >> ~/.inputrc
    echo -n "set echo-control-characters off" >> ~/.inputrc
    echo -e "\033[0;32m Added better tab completion.\033[m"
else
    echo -e "\033[0;31m Did not add better tab completion.\033[m"
fi

echo -e -n "\033[0;97mDo you want to add some more useful options to ~/.bashrc? (Y/n)? \033[m"
read response
if [[ "$response" == "y" || "$response" == "Y" || -z $response ]]; then
    if [[ -f ~/.bashrc && -n "$(tail -n1 ~/.bashrc)" ]]; then
        echo "" >> ~/.bashrc
        echo "" >> ~/.bashrc
    elif [[ -f ~/.bashrc && -z "$(tail -n1 ~/.bashrc)" && -n $(cat ~/.bashrc) ]]; then
        echo "" >> ~/.bashrc
    fi
    echo "# Stop logging of repeated identical commands or lines starting with space" >> ~/.bashrc
    echo "export HISTCONTROL=ignoreboth" >> ~/.bashrc
    echo "" >> ~/.bashrc
    echo "# Append to the history file, don't overwrite it" >> ~/.bashrc
    echo "shopt -s histappend" >> ~/.bashrc
    echo "" >> ~/.bashrc
    echo "# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS" >> ~/.bashrc
    echo -n "shopt -s checkwinsize" >> ~/.bashrc
    echo -e "\033[0;32m Added some more useful options.\033[m"
else
    echo -e "\033[0;31m Did not add some more useful options.\033[m"
fi