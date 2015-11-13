SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

all: checkenv boost openssl berkleydb miniupnpc qrencode qt

checkenv:
	@[ ! -z `type -t buildboost` ] || ( echo -e "\n\nfbuilddeps environment is not set!  Try this first:\nsource $(SELF_DIR)fbuilddeps\n\n" )

boost:
	@echo "";  echo "############################## Boost"
	bash -i -c buildboost
openssl:
	@echo "";  echo "############################## OpenSSL"
	bash -i -c buildopenssl
berkleydb:
	@echo "";  echo "############################## Berkley DB"
	bash -i -c buildberkleydb	
miniupnpc:
	@echo "";  echo "############################## MiniUPnP"
	bash -i -c buildminiupnpc
qt: qrencode
	@echo "";  echo "############################## QT"
	bash -i -c buildqt	
qrencode: libpng
	@echo "";  echo "############################## QRencode"
	bash -i -c buildqrencode
libpng: zlib
	@echo "";  echo "############################## libPNG"
	bash -i -c buildlibpng
zlib:
	@echo "";  echo "############################## Zlib"
	bash -i -c buildzlib
wxwidgets:
	@echo "";  echo "############################## wxWidgets"
	bash -i -c buildwxwidgets
wxfolder:
	@echo "";  echo "############################## wxfolder"
	bash -i -c buildwxfolder
info:
	bash -i -c yinfo

.PHONY: info init


