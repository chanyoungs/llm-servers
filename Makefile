PORT := 11434
OLLAMA_HOST := localhost:$(PORT)
SSH_HOST := ssh.lightning.ai
Model := gemma3:12b

# ----------------- Server -----------------
install:
	curl -fsSL https://ollama.com/install.sh | sh
	pip install -qq pyngrok ollama

serve:
	OLLAMA_HOST=${OLLAMA_HOST} ollama serve

serve-docker:
	docker run -d -v ollama:/root/.ollama -p ${PORT}:${PORT} --name ollama ollama/ollama

pull-docker:
	docker exec -it ollama ollama pull ${MODEL}

# ----------------- Client -----------------

ssh-tunnel:
	ssh -N -L ${PORT}:localhost:${PORT} ${SSH_USER}@${SSH_HOST} -p ${PORT}

run:
	export OLLAMA_HOST=${OLLAMA_HOST}