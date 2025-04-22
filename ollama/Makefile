PORT := 11434
OLLAMA_HOST := localhost:$(PORT)
MODEL := gemma3:12b
USER := s_01jsdh5qsdrnyp7a16df8ftzsr
HOST := ssh.lightning.ai

# ----------------- Server -----------------
install:
	curl -fsSL https://ollama.com/install.sh | sh
	pip install -qq pyngrok ollama

serve:
	OLLAMA_HOST=${OLLAMA_HOST} ollama serve

serve-docker:
	docker run -d -v ollama:/root/.ollama -p ${PORT}:${PORT} --name ollama ollama/ollama

pull-docker:
	docker exec ollama ollama pull ${MODEL}

logs-docker:
	docker logs --tail 1000 -f  ollama
# ----------------- Client -----------------

ssh-tunnel:
	ssh -N -L ${PORT}:localhost:${PORT} ${USER}@${HOST}

run:
	export OLLAMA_HOST=${OLLAMA_HOST}