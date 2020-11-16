# link the appropriate scripts in the appropriate places
echo "linking your scripts to your PATH (~/.local/bin)"

echo "are you on a bilingual laptop? Y/n"
read answer
case $answer in
	"") echo "linking a script to change keyboard" && \
		ln -s ~/scripts/lshift ~/.local/bin/;;
	y) echo "linking a script to change keyboard" && \
		ln -s ~/scripts/lshift ~/.local/bin/;;
	n) echo "lets not change the keyboard then";;
	*) echo "I didn't quite get that...";;
esac

echo "placing themile in your PATH"
ln -s ~/scripts/themile ~/.local/bin/

echo "linking complete!"
