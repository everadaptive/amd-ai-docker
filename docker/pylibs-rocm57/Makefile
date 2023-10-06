auto-gptq: 
	bash build-auto-gptq.sh

bitsandbytes: 
	bash build-bitsandbytes.sh

docker: auto-gptq bitsandbytes
	docker build -t pylibs-rocm57 . 