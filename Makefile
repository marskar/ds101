slides: index.ipynb
	jupyter nbconvert index.ipynb --to slides --reveal-prefix="https://revealjs.com"
	mv index.slides.html index.html

init: .git/

.git/:
	curl --user 'marskar' https://api.github.com/user/repos --data '{"name":"ds101","description":"A presentation about data science basics."}'
	git init
	git add --all
	git commit --message "First commit"
	git remote add origin https://github.com/marskar/ds101.git
	git push --set-upstream origin master


