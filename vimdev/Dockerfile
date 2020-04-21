FROM golang:1.14.2-alpine

RUN apk upgrade && apk add git git-perl git-email gcc the_silver_searcher vim && \
	mkdir -p /vimconfig/pack/plugins/start/ && \
	cd /vimconfig/pack/plugins/start/ && \
	git clone https://tpope.io/vim/fugitive.git && \
	vim -u NONE -c "helptags fugitive/doc" -c q && \
	git clone https://github.com/itchyny/lightline.vim.git && \
	vim -u NONE -c "helptags lightline.vim/doc" -c q && \
	git clone https://github.com/ctrlpvim/ctrlp.vim.git && \
	vim -u NONE -c "helptags ctrlp.vim/doc" -c q && \
	git clone https://github.com/fatih/vim-go.git && \
	vim -u NONE -c "helptags vim-go/doc" -c q && \
	git clone https://github.com/dyng/ctrlsf.vim.git && \
	vim -u NONE -c "helptags ctrlsf.vim/doc" -c q && \
	git clone https://github.com/tomtom/tcomment_vim.git && \
	vim -u NONE -c "helptags tcomment_vim/doc" -c q && \
	git clone https://github.com/aserebryakov/filestyle.git && \
	vim -u NONE -c "helptags filestyle/doc" -c q && \
	vim -u NONE -c ":GoInstallBinaries" -c q


ENV TERM=xterm-256color
ENV GOPATH=/go

COPY vimrc /.vimrc
COPY lightline.vim /vimconfig/lightline.vim

WORKDIR "/go/"

ENTRYPOINT ["vim", "-u", "/.vimrc"]
