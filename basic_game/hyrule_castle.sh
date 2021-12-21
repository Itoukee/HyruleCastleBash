#!/bin/bash

data_player=players.csv
data_enemy=enemies.csv
data_boss=bosses.csv
rounds=10

RED='\033[0;31m'
NB='\033[0m'
BLU='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
LCYAN='\033[0;36m'
PURPLE='\033[0;35m'
function gameLoop(){
    count=0
    special_count=0
    god_mod='FALSE'
    link_char $data_player
    ganon_char $data_ganon
    start_display
    while [[ $rounds -ge $count ]] || [[ $before10 != 'LOST' ]]; do
	boko_char $data_enemy
	while true ; do
	    	
	    if [[ $count -lt $rounds ]];then
		if [[ $link_hp -le 0 ]]; then
		    before10='LOST'
                    lost
                    echo "Losing here...you should sleep more"
                    break
		fi
		
		echo -e "${NB}############### $count ###############"
		echo -e "${NB}               "
		echo "________________|__________________"
		echo -e "${YELLOW}   Bokoblin     |       Link           "
		echo -e "${GREEN}HP:    $Boko_hp               $link_hp "   
		echo -e "${RED}ATK:   $Boko_str               $link_str"
		echo -e "${NB}                |"
		echo "________________|__________________"
		echo "Choose your action :"
		echo "Attack (1) ? ~~~~~ Heal (2) ?"

		
		
	        read roundChoice
		
	 
		if [[ $roundChoice -eq 1 ]]; then
		    Boko_hp=$(( $Boko_hp - $link_str ))
		    echo "You deal $link_str dmg to the enemy, GO ON BABY !!!"
		    if [[ $Boko_hp -le 0 ]];then
			echo -e "${YELLOW}Vous avez tué l'ennemi !"
			break
		    fi
		    
		elif [[ $roundChoice -eq 2 ]]; then
		    link_hp=$(( $link_hp/2 + $link_hp ))
		    if [[ $link_hp -ge 60 ]]; then
			link_hp=60
			echo -e "${GREEN}You're already a young and healthy young man Link !"
		    else
			echo -e"${GREEN}You have now $link_hp"
		    fi
		    
		fi
		echo -e "$NB               "
		echo "Boko attacks you for $Boko_str dmg"
		link_hp=$(($link_hp - $Boko_str))
		
	       
		
	    elif [[ $count -eq $rounds ]]; then
		if [[ $link_hp -le 0 ]]; then
		    lost
		    break
		fi
		
		special_count=$(($special_count + 1 ))
		if [[ $special_count -le 3 ]] && [[ $god_mod == 'FALSE' ]]; then
		    echo -e "${PURPLE} YOU CAN DO IT LINK, A KEY FOR THE SUCCESS MAY BE CLOSE NOW"
		    
		elif [[ $special_count -ge 5 ]] && [[ $god_mod == 'FALSE' ]]; then
		    god_mod='TRUE'
		    echo -e "${PURPLE}You fall behind a rock, there is three swords, choose :"
		    
		    echo "(1) (2) (3)"
		    read sword
		    if [[ $sword -eq 1 ]]; then
			echo -e "${PURPLE}THE MASTER SWORD, YOU FIND IT WHEN GANON PUSHES YOU DOWN, YOUR ATK DMG GOES UP TO 30 AND YOU ARE BLESSED"
			link_str=50
			link_hp=150
		    elif [[ $sword -eq 2 ]]; then
			echo -e "${YELLOW} YOU TAKE A BRONZE SWORD..It seems like it's going to break"
			link_str=5
		    elif [[ $sword -eq 3 ]]; then
			echo -e "${RED}YOU TAKE THE GREAT FAIRY'S SWORD, YOU ATK GOES BRR AND BUT YOU FEEL A SUDDEN PAIN"
			link_str=305
			link_hp=15
		    fi
		    
			
		    
		fi
		
		
		
		echo -e "${NB}############### $count ##############"
		echo -e "               "
                echo "~~~~~~~~~~~~~~~|~~~~~~~~~~~~~~~~~~"
                echo -e "${LCYAN}Ganon          |  Link         "
                echo -e "${GREEN}HP:  $Ganon_hp             $link_hp "
                echo -e "${RED}ATK: $Ganon_str              $link_str"
                echo -e "$NB               |                    "
                echo "~~~~~~~~~~~~~~~|~~~~~~~~~~~~~~~~~~"
                echo -e "${RED}Choose your action :"
                echo "Attack (1) ? ~~~~~ Heal (2) ?"
		read roundChoice
                if [[ $roundChoice -eq 1 ]]; then
		    Ganon_hp=$(( $Ganon_hp - $link_str ))
		    echo -e "${NB}You deal $link_str damage to Ganon "
		    if [[ $Ganon_hp -le 0 ]];then
			success
			break
		    fi

		elif [[ $roundChoice -eq 2 ]]; then
                    link_hp=$(( $link_hp/2 + $link_hp ))
                    if [[ $link_hp -ge 60 ]]; then
                        link_hp=60
                        echo -e "${GREEN}You're already a young and healthy young man Link !"
                    else
                        echo -e "${GREEN}You have now $link_hp"
                    fi
		fi
		
		link_hp=$(($link_hp - $Ganon_str))	       
		echo -e "${RED} Ganon hits you for Ganon_str dmg /!\ "
            fi
		   
  	
	    
	done
	count=$(($count+1))
	
    done
    
}


function success(){
    clear
    echo -e "${YELLOW}   ______________________________
 / \                             \.
|   |                            |.
 \_ |                            |.
    |                            |.
    |      YOU WON               |.
    |                            |.
    |                            |.
    |                            |.
    |                            |.
    |                            |.
    |                            |.
    |                            |.
    |                            |.
    |                            |.
    |   _________________________|___
    |  /                            /.
    \______________________________/."
}

function lost(){
    clear
    echo -e "${RED}   ______________________________
 / \                             \.
|   |                            |.
 \_ |                            |.
    |                            |.
    |                            |.
    |                            |.
    |          YOU LOST          |.
    |                            |.
    |                            |.
    |                            |.
    |                            |.
    |                            |.
    |                            |.
    |                            |.
    |   _________________________|___
    |  /                            /.
    \_/dc__________________________/."
}
function start_display(){
    clear
    echo "                                         /@"
    echo "                                   __   /\/"
    echo "                        /==\      /  \_/\/ "  
    echo "                      /======\    \/\__ \__"
    echo "                    /==/\  /\==\    /\_|__ \ "
    echo "                 /==/    ||    \=\ / / / /_/ "
    echo "               /=/    /\ || /\   \=\/ /  "   
    echo "            /===/   /   \||/   \   \===\ "
    echo "          /===/   /_________________ \===\ "
    echo "        /====/   / |                /  \====\ "
    echo "      /====/   /   |  _________    /  \   \===\    THE LEGEND OF" 
    echo "      /==/   /     | /   /  \ / / /  __________\_____      ______       ___ "
    echo "     |===| /       |/   /____/ / /   \   _____ |\   /      \   _ \      \  \ "
    echo "       \==\            /\   / / /     | |  /= \| | |        | | \ \     / _ \ "
    echo "      \===\__    \    /  \ / / /   /  | | /===/  | |        | |  \ \   / / \ \ "
    echo "        \==\ \      \\/____/   /_\ //  | |_____/| | |        | |   | | / /___\ \ "
    echo "          \===\      \\\\\\\////////    /|  _____ | | |        | |   | | |  ___  | "
    echo "          \==\/       \\\\/ / //////   \| |/==/ \| | |        | |   | | | /   \ | "
    echo "          \==\        \\/ / /////   _  | |==/     | |        | |  / /  | |   | | "
    echo "            \==\  / \ / / ///      /|\| |_____/| | |_____/| | |_/ /   | |   | | "
    echo "            \==\ /   / / /________/ |/_________|/_________|/_____/   /___\ /___\ "
    echo "              \==\  /               | /==/ "
    echo "              \=\  /________________|/=/    OCARINA OF TIME "
    echo "                \==\     _____     /==/ " 
    echo "               / \===\   \   /   /===/ "
    echo "              / / /\===\  \_/  /===/ "
    echo "             / / /   \====\ /====/ "
    echo "            / / /      \===|===/ " 
    echo "            |/_/         \===/ "
    echo "                           = "
    

    echo "                                 
						
							
							"
    echo -e "${RED}Press enter to start..."
    read -s key
   
}

function link_char(){
    while IFS="," read -r id name hp mp str int def res spd luck race class rarity
    do

        if [[ $id -eq 1 ]]; then
            link_str=$str
	    link_name=$name
	    link_hp=$hp
        fi

    done < <(tail -n +2 $data_player)
}
function boko_char(){
    while IFS="," read -r id name hp mp str int def res spd luck race class rarity
    do

        if [[ $id -eq 12 ]]; then
            Boko_str=$str
	    Boko_name=$name
            Boko_hp=$hp            
        fi

    done   < <(tail -n +2 $data_enemy)

}

function ganon_char(){
    while IFS="," read -r id name hp mp str int def res spd luck race class rarity
    do

        if [[ $id -eq 1 ]]; then
            Ganon_str=$str
            Ganon_hp=$hp
	    Ganon_name=$name
        fi
    done   < <(tail -n +2 $data_boss)

}



gameLoop

