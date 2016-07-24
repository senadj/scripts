SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))


info:
	bash -i -c yinfo
	
all: checkenv boost openssl berkeleydb miniupnpc qrencode qt

checkenv:
	@[ ! -z `type -t buildboost` ] || ( echo -e "\n\nfbuilddeps environment is not set!  Try this first:\nsource $(SELF_DIR)fbuilddeps\n\n" )

boost:
	@echo "";  echo "############################## Boost"
	bash -i -c buildboost
openssl:
	@echo "";  echo "############################## OpenSSL"
	bash -i -c buildopenssl
berkeleydb:
	@echo "";  echo "############################## Berkeley DB"
	bash -i -c buildberkeleydb	
miniupnpc:
	@echo "";  echo "############################## MiniUPnP Client"
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
pcre:
	@echo "";  echo "############################## PCRE"
	bash -i -c buildpcre
jansson:
	@echo "";  echo "############################## Jansson"
	bash -i -c buildjansson
curl: openssl
	@echo "";  echo "############################## cURL"
	bash -i -c buildcurl
leveldb:
	@echo "";  echo "############################## LevelDB"
	bash -i -c buildleveldb
vanitygen: openssl pcre
	@echo "";  echo "############################## Vanitygen"
	bash -i -c buildvanitygen
wxwidgets:
	@echo "";  echo "############################## wxWidgets"
	bash -i -c buildwxwidgets
wxfolder:
	@echo "";  echo "############################## wxfolder"
	bash -i -c buildwxfolder


.PHONY: info


