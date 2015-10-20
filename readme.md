# Introduction

**Parses [Sqlite][Sqlite] Only**

Based on the [Sqlite][Sqlite] spec and [Yamljs][Yamljs] this, library
parses a YAML file in the format below traversing a top level `scripts`
array, where that scripts array contains objects with a `sql` property.
The sql is parsed for variables using [sqlite-parser][sqlite-parser]
library.

```YAML
---
namespace: ""
scripts:
  - name: "read x from y"
    sql: |
	  select id, title from products where $Price > 10
```

After this library processes the YAML it then outputs to Stdout the
resulting new yaml file which contains a list of variables.  These
variables can then be used to properly pass named variables to sql scripts.

Resulting Yaml with `vars` produced from parsing the sql:
```YAML
---
namespace: ""
scripts:
  - name: "read x from y"
    vars: [
	  "$Price"
	]
    sql: |
	  select id, title from products where $Price > 10
```

## Usage

```
%> sql-parse src/gen-sql.yaml > gen-sql.with-vars.yaml
```

## License

See license file.

The use and distribution terms for this software are covered by the
[Eclipse Public License 1.0][EPL-1], which can be found in the file 'license' at the
root of this distribution. By using this software in any fashion, you are
agreeing to be bound by the terms of this license. You must not remove this
notice, or any other, from this software.




[EPL-1]: http://opensource.org/licenses/eclipse-1.0.txt
[Sqlite]: https://www.sqlite.org/lang.html
[sqlite-parser]: https://github.com/codeschool/sqlite-parser
[Yamljs]: https://www.npmjs.com/package/yamljs
