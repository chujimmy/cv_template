define check_lang
    @t=$(LANG); \
    if [ $${#t} -ne 2 ]; then \
        echo "Invalid lang: $$t length is not 2 characters"; \
        false; \
    fi
endef

.PHONY: start
start:
	docker image prune -f
	docker-compose up --force-recreate


.PHONY: stop
stop:
	docker-compose down


.PHONY: clean
clean: 
	find . -name '*.aux' -delete -o -name '*.fdb_latexmk' -delete -o -name '*.fls' -delete -o -name '*.log' -delete  -o -name '*.out' -delete -o -name '.DS_Store' -delete


.PHONY: clean-pdf
clean-pdf: 
	find src -name '*.pdf' -delete


.PHONY: clean-all
clean-all: clean clean-pdf

LANG_LOWER = $(shell echo $(LANG) | tr A-Z a-z)
.PHONY: add-cv
add-cv: 
	$(call check_lang)
	mkdir ./src/cv/lang/$(LANG_LOWER)/
	cp -a ./src/template/cv/. ./src/cv/lang/$(LANG_LOWER)/
	docker exec cv bash -c -i "latexmk -pdf -pvc -file-line-error -view=none -interaction=nonstopmode -recorder -cd /data/cv/src/cv/lang/$(LANG_LOWER)/cv.tex > /proc/1/fd/1 2>/proc/1/fd/2 &"

.PHONY: remove-cv
remove-cv: 
	$(call check_lang)
	rm -rf ./src/cv/lang/$(LANG_LOWER)/

.PHONY: add-letter
add-letter:
	$(call check_lang)
	mkdir ./src/letter/lang/$(LANG_LOWER)/
	cp -a ./src/template/letter/. ./src/letter/lang/$(LANG_LOWER)/
	docker exec cv bash -c -i "latexmk -pdf -pvc -file-line-error -view=none -interaction=nonstopmode -recorder -cd /data/cv/src/letter/lang/$(LANG_LOWER)/letter.tex > /proc/1/fd/1 2>/proc/1/fd/2 &"

.PHONY: remove-letter
remove-letter:
	$(call check_lang)
	rm -rf ./src/letter/lang/$(LANG_LOWER)/

.PHONY: add-lang
add-lang: add-cv add-letter

.PHONY: remove-lang
remove-lang: remove-cv remove-letter
