PORT := 11434
OLLAMA_HOST := localhost:$(PORT)
SSH_HOST := ssh.lightning.ai


# ----------------- Server -----------------
install:
	curl -fsSL https://ollama.com/install.sh | sh
	pip install -qq pyngrok ollama

serve:
	OLLAMA_HOST=${OLLAMA_HOST} ollama serve

serve-docker:
	docker run \
	-d \
	-v \
	--gpus=all \
	ollama:/root/.ollama \
	-p ${PORT}:${PORT} \
	--name ollama \
	ollama/ollama	

# ----------------- Client -----------------

ssh-tunnel:
	ssh -N -L ${PORT}:localhost:${PORT} ${SSH_USER}@${SSH_HOST} -p ${PORT}

run:
	export OLLAMA_HOST=${OLLAMA_HOST}