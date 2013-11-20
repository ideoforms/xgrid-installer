echo -n "Enter controller password: "
read PASSWORD
if [ "$PASSWORD" = "" ]; then
	echo "A controller password is required."
	exit
fi

../bin/xgrid-encode-password.py "$PASSWORD" > root/private/etc/xgrid/controller/agent-password

PKG_FILE="Xgrid Controller Installer.pkg"
pkgbuild --identifier com.ideoforms.XgridControllerInstaller --root root --scripts scripts "$PKG_FILE"

echo
echo "Package successfully built."
echo "To install, run:"
echo 
echo "    installer -pkg \"$PKG_FILE\" -target /"
