parser = require('sqlite-parser')


module.exports = do ->
  sql = """
insert into efforts (
	title, summary, description, created_by,
	updated_by, owned_by, state, record_status
) values (
	$Title, $Summary, $Description, $CreatedBy,
	$UpdatedBy, $Title, $State, $RecordStatus
);
"""

  parser(sql, (err, res) ->
    if err?
      console.log(err)
    else
      console.log(JSON.stringify(res, null, '  '))
  )
