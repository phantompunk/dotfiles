function gi --description 'Generate .gitignore file for a specified language'
	curl -sL https://www.toptal.com/developers/gitignore/api/$argv
end
