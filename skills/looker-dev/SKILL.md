---
name: looker-dev
description: These skills are built for LookML developers, data engineers, and administrators who manage the backbone of Looker.
---

## Usage

All scripts can be executed using Node.js. Replace `<param_name>` and `<param_value>` with actual values.

**Bash:**
`node <skill_dir>/scripts/<script_name>.js '{"<param_name>": "<param_value>"}'`

**PowerShell:**
`node <skill_dir>/scripts/<script_name>.js '{\"<param_name>\": \"<param_value>\"}'`

Note: The scripts automatically load the environment variables from various .env files. Do not ask the user to set vars unless skill executions fails due to env var absence.


## Scripts


### create_git_branch

This skill is used to create a new git branch of a LookML project. This only works in dev mode.

Parameters:
- project_id (required): The unique ID of the LookML project.
- branch (required): The branch to create.
- ref (optional): The ref to start a newly created branch.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The project_id | Yes |  |
| branch | string | The git branch to create | Yes |  |
| ref | string | The ref to use as the start of a new branch. Defaults to HEAD of current branch if not specified. | No | `` |


---

### create_project_directory

This skill creates a new directory within a specified LookML project.

Prerequisite: The Looker session must be in Development Mode. Use `dev_mode: true` first.

Parameters:
- project_id (required): The unique ID of the LookML project.
- directory_path (required): The path to the new directory within the project.

Output:
A confirmation message upon successful directory creation.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The id of the project | Yes |  |
| directory_path | string | The path to create in the project | Yes |  |


---

### create_project_file

This skill creates a new LookML file within a specified project, populating
it with the provided content.

Prerequisite: The Looker session must be in Development Mode. Use `dev_mode: true` first.

Parameters:
- project_id (required): The unique ID of the LookML project.
- file_path (required): The desired path and filename for the new file within the project.
- content (required): The full LookML content to write into the new file.

Output:
A confirmation message upon successful file creation.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The id of the project containing the files | Yes |  |
| file_path | string | The path of the file within the project | Yes |  |
| file_content | string | The content of the file | Yes |  |


---

### create_view_from_table

This skill generates boilerplate LookML views directly from the database schema.
It does not create model or explore files, only view files in the specified folder.

Prerequisite: The Looker session must be in Development Mode. Use `dev_mode: true` first.

Parameters:
- project_id (required): The unique ID of the LookML project.
- connection (required): The database connection name.
- tables (required): A list of objects to generate views for. Each object must contain `schema` and `table_name` (note: table names are case-sensitive). Optional fields include `primary_key`, `base_view`, and `columns` (array of objects with `column_name`).
- folder_name (optional): The folder to place the view files in (defaults to 'views/').

Output:
A confirmation message upon successful view generation, or an error message if the operation fails.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The id of the project to create the view in. | Yes |  |
| connection | string | The database connection name. | Yes |  |
| tables | array | The tables to generate views for.
		Each item must be a map with:
		- schema (string, required)
		- table_name (string, required)
		- primary_key (string, optional)
		- base_view (boolean, optional)
		- columns (array of objects, optional): Each object must have 'column_name' (string). | Yes |  |
| folder_name | string | The folder to place the view files in (e.g., 'views'). | No | `views` |


---

### delete_git_branch

This skill is used to delete a git branch of a LookML project. This only works in dev mode.

Parameters:
- project_id (required): The unique ID of the LookML project.
- branch (required): The branch to delete.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The project_id | Yes |  |
| branch | string | The git branch to delete | Yes |  |


---

### delete_project_directory

This skill permanently deletes a specified directory within a LookML project.

Prerequisite: The Looker session must be in Development Mode. Use `dev_mode: true` first.

Parameters:
- project_id (required): The unique ID of the LookML project.
- directory_path (required): The path to the directory within the project.

Output:
A confirmation message upon successful directory deletion.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The id of the project | Yes |  |
| directory_path | string | The path to delete in the project | Yes |  |


---

### delete_project_file

This skill permanently deletes a specified LookML file from within a project.
Use with caution, as this action cannot be undone through the API.

Prerequisite: The Looker session must be in Development Mode. Use `dev_mode: true` first.

Parameters:
- project_id (required): The unique ID of the LookML project.
- file_path (required): The exact path to the LookML file to delete within the project.

Output:
A confirmation message upon successful file deletion.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The id of the project containing the files | Yes |  |
| file_path | string | The path of the file within the project | Yes |  |


---

### dev_mode

This skill allows toggling the Looker IDE session between Development Mode and Production Mode.
Development Mode enables making and testing changes to LookML projects.

Parameters:
- enable (required): A boolean value.
  - `true`: Switches the current session to Development Mode.
  - `false`: Switches the current session to Production Mode.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| devMode | boolean | Whether to set Dev Mode. | No | `true` |


---

### get_connection_databases

This skill retrieves a list of databases available through a specified Looker connection.
This is only applicable for connections that support multiple databases.
Use `get_connections` to check if a connection supports multiple databases.

Parameters:
- connection_name (required): The name of the database connection, obtained from `get_connections`.

Output:
A JSON array of strings, where each string is the name of an available database.
If the connection does not support multiple databases, an empty list or an error will be returned.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| conn | string | The connection containing the databases. | Yes |  |


---

### get_connection_schemas

This skill retrieves a list of database schemas available through a specified
Looker connection.

Parameters:
- connection_name (required): The name of the database connection, obtained from `get_connections`.
- database (optional): An optional database name to filter the schemas.
  Only applicable for connections that support multiple databases.

Output:
A JSON array of strings, where each string is the name of an available schema.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| conn | string | The connection containing the schemas. | Yes |  |
| db | string | The optional database to search | No |  |


---

### get_connection_table_columns

This skill retrieves a list of columns for one or more specified tables within a
given database schema and connection.

Parameters:
- connection_name (required): The name of the database connection, obtained from `get_connections`.
- schema (required): The name of the schema where the tables reside, obtained from `get_connection_schemas`.
- tables (required): A comma-separated string of table names for which to retrieve columns
  (e.g., "users,orders,products"), obtained from `get_connection_tables`.
- database (optional): The name of the database to filter by. Only applicable for connections
  that support multiple databases (check with `get_connections`).

Output:
A JSON array of objects, where each object represents a column and contains details
such as `table_name`, `column_name`, `data_type`, and `is_nullable`.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| conn | string | The connection containing the tables. | Yes |  |
| db | string | The optional database to search | No |  |
| schema | string | The schema containing the tables. | Yes |  |
| tables | string | A comma separated list of tables containing the columns. | Yes |  |


---

### get_connection_tables

This skill retrieves a list of tables available within a specified database schema
through a Looker connection.

Parameters:
- connection_name (required): The name of the database connection, obtained from `get_connections`.
- schema (required): The name of the schema to list tables from, obtained from `get_connection_schemas`.
- database (optional): The name of the database to filter by. Only applicable for connections
  that support multiple databases (check with `get_connections`).

Output:
A JSON array of strings, where each string is the name of an available table.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| conn | string | The connection containing the tables. | Yes |  |
| db | string | The optional database to search | No |  |
| schema | string | The schema containing the tables. | Yes |  |


---

### get_connections

This skill retrieves a list of all database connections configured in the Looker system.

Parameters:
This skill takes no parameters.

Output:
A JSON array of objects, each representing a database connection and including details such as:
- `name`: The connection's unique identifier.
- `dialect`: The database dialect (e.g., "mysql", "postgresql", "bigquery").
- `default_schema`: The default schema for the connection.
- `database`: The associated database name (if applicable).
- `supports_multiple_databases`: A boolean indicating if the connection can access multiple databases.




---

### get_git_branch

This skill is used to retrieve the current git branch of a LookML project.

Parameters:
- project_id (required): The unique ID of the LookML project.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The project_id | Yes |  |


---

### get_lookml_tests

Returns a list of tests which can be run to validate a project's LookML code and/or the underlying data, optionally filtered by the file id.

Prerequisite: The Looker session must be in Development Mode. Use `dev_mode: true` first.

Parameters:
- project_id (required): The unique ID of the LookML project.
- file_id (optional): The ID of the file to filter tests by. This must be the complete file path from the project root (e.g., `models/my_model.model.lkml` or `views/my_view.view.lkml`).

Output:
A JSON array of LookML test objects, each containing:
- model_name: The name of the model.
- name: The name of the test.
- explore_name: The name of the explore being tested.
- query_url_params: The query parameters used for the test.
- file: The file path where the test is defined.
- line: The line number where the test is defined.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The unique ID of the LookML project. | Yes |  |
| file_id | string | Optional ID of the file to filter tests by. This must be the complete file path from the project root (e.g., 'models/my_model.model.lkml'). | No |  |


---

### get_project_directories

This skill retrieves the list of directories within a specified LookML project.

Parameters:
- project_id (required): The unique ID of the LookML project.

Output:
A JSON array of strings, where each string is the name of a directory within the project.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The id of the project | Yes |  |


---

### get_project_file

This skill retrieves the raw content of a specific LookML file from within a project.

Parameters:
- project_id (required): The unique ID of the LookML project, obtained from `get_projects`.
- file_path (required): The path to the LookML file within the project,
  typically obtained from `get_project_files`.

Output:
The raw text content of the specified LookML file.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The id of the project containing the files | Yes |  |
| file_path | string | The path of the file within the project | Yes |  |


---

### get_project_files

This skill retrieves a list of all LookML files within a specified project,
providing details about each file.

Parameters:
- project_id (required): The unique ID of the LookML project, obtained from `get_projects`.

Output:
A JSON array of objects, each representing a LookML file and containing
details such as `path`, `id`, `type`, and `git_status`.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The id of the project containing the files | Yes |  |


---

### get_projects

This skill retrieves a list of all LookML projects available on the Looker instance.
It is useful for identifying projects before performing actions like retrieving
project files or making modifications.

Parameters:
This skill takes no parameters.

Output:
A JSON array of objects, each containing the `project_id` and `project_name`
for a LookML project.




---

### health_analyze

This skill calculates the usage statistics for Looker projects, models, and explores.

Parameters:
- action (required): The type of resource to analyze. Can be `"projects"`, `"models"`, or `"explores"`.
- project (optional): The specific project ID to analyze.
- model (optional): The specific model name to analyze. Requires `project` if used without `explore`.
- explore (optional): The specific explore name to analyze. Requires `model` if used.
- timeframe (optional): The lookback period in days for usage data. Defaults to `90` days.
- min_queries (optional): The minimum number of queries for a resource to be considered active. Defaults to `1`.

Output:
The result is a JSON object containing usage metrics for the specified resources.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| action | string | The analysis to run. Can be 'projects', 'models', or 'explores'. | Yes |  |
| project | string | The Looker project to analyze (optional). | No |  |
| model | string | The Looker model to analyze (optional). | No |  |
| explore | string | The Looker explore to analyze (optional). | No |  |
| timeframe | integer | The timeframe in days to analyze. | No | `90` |
| min_queries | integer | The minimum number of queries for a model or explore to be considered used. | No | `0` |


---

### health_pulse

This skill performs various health checks on a Looker instance.

Parameters:
- action (required): Specifies the type of health check to perform.
  Choose one of the following:
  - `check_db_connections`: Verifies database connectivity.
  - `check_dashboard_performance`: Assesses dashboard loading performance.
  - `check_dashboard_errors`: Identifies errors within dashboards.
  - `check_explore_performance`: Evaluates explore query performance.
  - `check_schedule_failures`: Reports on failed scheduled deliveries.
  - `check_legacy_features`: Checks for the usage of legacy features.

Note on `check_legacy_features`:
This action is exclusively available in Looker Core instances. If invoked
on a non-Looker Core instance, it will return a notice rather than an error.
This notice should be considered normal behavior and not an indication of an issue.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| action | string | The health check to run. Can be either: `check_db_connections`, `check_dashboard_performance`,`check_dashboard_errors`,`check_explore_performance`,`check_schedule_failures`, or `check_legacy_features` | Yes |  |


---

### health_vacuum

This skill identifies and suggests LookML models or explores that can be
safely removed due to inactivity or low usage.

Parameters:
- action (required): The type of resource to analyze for removal candidates. Can be `"models"` or `"explores"`.
- project (optional): The specific project ID to consider.
- model (optional): The specific model name to consider. Requires `project` if used without `explore`.
- explore (optional): The specific explore name to consider. Requires `model` if used.
- timeframe (optional): The lookback period in days to assess usage. Defaults to `90` days.
- min_queries (optional): The minimum number of queries for a resource to be considered active. Defaults to `1`.

Output:
A JSON array of objects, each representing a model or explore that is a candidate for deletion due to low usage.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| action | string | The vacuum action to run. Can be 'models', or 'explores'. | Yes |  |
| project | string | The Looker project to vacuum (optional). | No | `` |
| model | string | The Looker model to vacuum (optional). | No | `` |
| explore | string | The Looker explore to vacuum (optional). | No | `` |
| timeframe | integer | The timeframe in days to analyze. | No | `90` |
| min_queries | integer | The minimum number of queries for a model or explore to be considered used. | No | `1` |


---

### list_git_branches

This skill is used to retrieve the list of available git branches of a LookML project.

Parameters:
- project_id (required): The unique ID of the LookML project.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The project_id | Yes |  |


---

### run_lookml_tests

This skill runs LookML tests in the project, filtered by file, test, and/or model. These filters work in conjunction (logical AND).

Prerequisite: The Looker session must be in Development Mode. Use `dev_mode: true` first.

Parameters:
- project_id (required): The unique ID of the project to run LookML tests for.
- file_id (optional): The ID of the file to run tests for. This must be the complete file path from the project root (e.g., `models/my_model.model.lkml` or `views/my_view.view.lkml`).
- test (optional): The name of the test to run.
- model (optional): The name of the model to run tests for.

Output:
A JSON array containing the results of the executed tests, where each object includes:
- model_name: Name of the model tested.
- test_name: Name of the test.
- assertions_count: Total number of assertions in the test.
- assertions_failed: Number of assertions that failed.
- success: Boolean indicating if the test passed.
- errors: Array of error objects (if any), containing details like `message`, `file_path`, `line_number`, and `severity`.
- warnings: Array of warning messages (if any).


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The id of the project to run LookML tests for. | Yes |  |
| file_id | string | Optional id of the file to run tests for. | No |  |
| test | string | Optional name of the test to run. | No |  |
| model | string | Optional name of the model to run tests for. | No |  |


---

### switch_git_branch

This skill is used to switch the git branch of a LookML project. This only works in dev mode.

Parameters:
- project_id (required): The unique ID of the LookML project.
- branch (required): The branch to switch to.
- ref (optional): The ref to change a branch with `reset --hard` on a switch operation.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The project_id | Yes |  |
| branch | string | The git branch to switch to | Yes |  |
| ref | string | The ref to switch the branch to using `reset --hard`. | No | `` |


---

### update_project_file

This skill modifies the content of an existing LookML file within a specified project.

Prerequisite: The Looker session must be in Development Mode. Use `dev_mode: true` first.

Parameters:
- project_id (required): The unique ID of the LookML project.
- file_path (required): The exact path to the LookML file to modify within the project.
- content (required): The new, complete LookML content to overwrite the existing file.

Output:
A confirmation message upon successful file modification.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The id of the project containing the files | Yes |  |
| file_path | string | The path of the file within the project | Yes |  |
| file_content | string | The content of the file | Yes |  |


---

### validate_project

This skill checks a LookML project for syntax errors.

Prerequisite: The Looker session must be in Development Mode. Use `dev_mode: true` first.

Parameters:
- project_id (required): The unique ID of the LookML project.

Output:
A list of error details including the file path and line number, and also a list of models
that are not currently valid due to LookML errors.


#### Parameters

| Name | Type | Description | Required | Default |
| :--- | :--- | :--- | :--- | :--- |
| project_id | string | The id of the project to validate | Yes |  |


---

