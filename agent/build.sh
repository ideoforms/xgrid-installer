echo -n "Enter controller hostname: "
read CONTROLLER
if [ "$CONTROLLER" = "" ]; then
	echo "A controller hostname or IP address is required."
	exit
fi

../bin/xgrid-set-controller.sh "$CONTROLLER"

echo -n "Enter controller password: "
read PASSWORD
if [ "$PASSWORD" = "" ]; then
	echo "A controller password is required."
	exit
fi

../bin/xgrid-encode-password.py "$PASSWORD" > root/private/etc/xgrid/agent/controller-password

PKG_FILE="Xgrid Agent Installer for $CONTROLLER.pkg"
pkgbuild --identifier com.ideoforms.XgridAgentInstaller --root root --scripts scripts "$PKG_FILE"

echo
echo "Package successfully built."
echo "To install, run:"
echo 
echo "    installer -pkg \"$PKG_FILE\" -target /"
