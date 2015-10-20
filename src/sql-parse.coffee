parser = require('sqlite-parser')
glob   = require('glob')
fs     = require('fs')
path   = require('path')
YAML   = require('yamljs')
_      = require('lodash')


module.exports = do ->

	isVar = (v) ->
		_.isPlainObject(v) and v.type == "variable" and v.name?

	toVars = (root, vars=[]) ->
		if isVar(root)
			vars.push(root.name)

		for k,v of root
			if _.isPlainObject(v)
				toVars(v, vars)
			else if _.isArray(v)
				for a in v
					toVars(a, vars)

	yamls = _.slice(process.argv, 2)

	for f in yamls
		yaml = YAML.load(f)
		for scr in yaml.scripts
			parser(scr.sql, (err, res) ->
				if err?
					console.log(err)
				else
					scr.vars = []
					toVars(res, scr.vars)
			)

		console.log(YAML.stringify(yaml))



