main:
	sudo mkdir -p /lib/firmware/ath10k/QCA6174/hw3.0/
	sudo rm /lib/firmware/ath10k/QCA6174/hw3.0/* 2> /dev/null
	sudo cp board.bin /lib/firmware/ath10k/QCA6174/hw3.0/board.bin
	sudo cp firmware-4.bin /lib/firmware/ath10k/QCA6174/hw3.0/firmware-4.bin
	sudo chmod +x /lib/firmware/ath10k/QCA6174/hw3.0/*
