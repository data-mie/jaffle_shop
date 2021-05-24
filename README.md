## `jaffle_shop`

`jaffle_shop` is a fictional ecommerce store. This dbt project transforms raw data from an app database into a customers and orders model ready for analytics.

This repo is a fork of Fishtown's [jaffle_shop](https://github.com/fishtown-analytics/jaffle_shop) and expands on it by 

1. adding a local PostgreSQL development environment using Docker, and
2. adding SQL linting using SQLFluff.

### What's in this repo?
This repo contains [seeds](https://docs.getdbt.com/docs/building-a-dbt-project/seeds) that includes some (fake) raw data from a fictional app.

The raw data consists of customers, orders, and payments, with the following entity-relationship diagram:

![Jaffle Shop ERD](/etc/jaffle_shop_erd.png)


### Pre-requisites

* OS: Linux
* Python>=3.7,<3.9
* Docker CE and `docker-compose`

### Running this project
To get up and running with this project:

1. Clone this repository.

2. Change into the `jaffle_shop` directory from the command line:
```bash
$ cd jaffle_shop
```

3. Create a Python virtual environment:

```bash
python3 -m pip install virtualenv
python3 -m virtualenv venv
source venv/bin/activate
```

4. Install dbt and [SQLFluff](#linting-sql) dependencies using `pip`:

```bash
pip install -r requirements.txt
```

5. Point dbt to the `jaffle_shop` profile in [profiles.yml](profiles.yml) by setting the following environment variable (you can put this in your `~/.bashrc` so that it gets automatically included in every new terminal session):

```bash
export DBT_PROFILES_DIR=/path/to/jaffle_shop
```

6. Start a local PostgreSQL database using `docker-compose`. If you prefer to use some other database to run this dbt project in, you can modify [profiles.yml](profiles.yml) accordingly and skip this step.

```bash
docker-compose up -d
```

7. Ensure your profile is setup correctly from the command line:
```bash
$ dbt debug
```

8. Load the CSVs with the demo data set. This materializes the CSVs as tables in your target schema. Note that a typical dbt project **does not require this step** since dbt assumes your raw data is already in your warehouse.
```bash
$ dbt seed
```

9. Run the models:
```bash
$ dbt run
```

> **NOTE:** If this steps fails, it might mean that you need to make small changes to the SQL in the models folder to adjust for the flavor of SQL of your target database. Definitely consider this if you are using a community-contributed adapter.

10. Test the output of the models:
```bash
$ dbt test
```

11. Generate documentation for the project:
```bash
$ dbt docs generate
```

12. View the documentation site:
```bash
$ dbt docs serve
```

### Linting SQL

Linters are static code analysis tools used to flag programming errors, stylistic errors and suspicious constructs. [SQLFluff](https://github.com/sqlfluff/sqlfluff) is a SQL linter and it works well with jinja templating and dbt.

Install sqlfluff using pip:

```bash
pip install sqlfluff
```

> **NOTE:** Alternatively, you can use `pip install -r requirements.txt` to install `sqlfluff` as it is included in [requirements.txt](requirements.txt).
