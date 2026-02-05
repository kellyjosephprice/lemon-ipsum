.PHONY:sentences
sentences: public/sentences.json

public/sentences.json:
	wget https://raw.githubusercontent.com/summitxd/lemon-ipsum/refs/heads/master/sentences.json \
		-O public/sentences.json
