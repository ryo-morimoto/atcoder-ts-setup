.PHONY: setup login

check_setup_sh = $(shell if [ ! -x "./setup.sh" ]; then echo "setup.shに実行権限を付与してください"; echo "chmod +x ./setup.sh"; exit 1; fi)
get_acc_config_dir = $(shell acc config-dir)

setup:
	@$(check_setup_sh)
	@./setup.sh

login:
	@acc login
	@oj login https://atcoder.jp

template-update:
	@echo "template.jsonを更新しています..."
	@cp ./template.json $(get_acc_config_dir)/typescript/
	@echo "./template.json > $(get_acc_config_dir)/typescript/"
	@echo "main.tsを更新しています..."
	@cp -v ./main.ts $(get_acc_config_dir)/typescript/
	@echo "./main.ts > $(get_acc_config_dir)/typescript/"
	@echo "template.json, main.tsを更新しました"
