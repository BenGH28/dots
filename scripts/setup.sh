#!/bin/sh

# link the appropriate scripts in the appropriate places
echo "linking your scripts to your PATH (~/.local/bin)"
dir=$HOME/.local/bin
check_if_in_path(){
	result=$(echo $PATH | grep $dir)
	case $result in
		"") echo "$dir is not in your \$PATH please add it to \$PATH"
			exit
			;;
		$PATH) echo "$dir is in \$PATH"
			;;
		*) echo "uh-oh";;
	esac
}

linking_to_path(){
	echo "placing themile in your PATH"
	if [ -d $dir ]; then
		ln -s ~/scripts/themile ~/.local/bin/
	else
		echo "$dir does not exist! Making it now!"
		mkdir -p $HOME/.local/bin/
		ln -s ~/scripts/themile ~/.local/bin/
	fi
	echo "linking complete!"
}

check_if_in_path

has_click=$(pip list | grep click | awk '{print $1}')
case $has_click in
	click)linking_to_path ;;
	*)echo "pip module 'click' is not on this computer. run 'pip install click' and rerun this script";;
esac
