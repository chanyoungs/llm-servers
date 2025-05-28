qwen-docker:
	docker run --rm --runtime nvidia --gpus all \
		-v ~/.cache/huggingface:/root/.cache/huggingface \
		--ipc=host -p 8000:8000 \
		vllm/vllm-openai \
		--model Qwen/Qwen2.5-Coder-14B-Instruct-AWQ \
		# --tensor-parallel-size 2 \
		--quantization awq_marlin \
		--enable-auto-tool-choice --tool-call-parser hermes \
		--kv-cache-dtype fp8_e5m2 \
		--rope-scaling '{ "factor": 4.0, "original_max_position_embeddings": 32768, "rope_type": "yarn" }'