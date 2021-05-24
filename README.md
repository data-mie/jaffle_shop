## Testing dbt project: `jaffle_shop`

`jaffle_shop` is a fictional ecommerce store. This dbt project transforms raw data from an app database into a customers and orders model ready for analytics.

### What is this repo?
What this repo _is_:
- A self-contained playground dbt project, useful for testing out scripts, and communicating some of the core dbt concepts.

What this repo _is not_:
- A tutorial — check out the [Getting Started Tutorial](https://docs.getdbt.com/tutorial/setting-up) for that. Notably, this repo contains some anti-patterns to make it self-contained, namely the use of seeds instead of sources.
- A demonstration of best practices — check out the [dbt Learn Demo](https://github.com/fishtown-analytics/dbt-learn-demo-v2-archive) repo instead. We want to keep this project as simple as possible. As such, we chose not to implement:
    - our standard file naming patterns (which make more sense on larger projects, rather than this five-model project)
    - a pull request flow
    - CI/CD integrations
- A demonstration of using dbt for a high-complex project, or a demo of advanced features (e.g. macros, packages, hooks, operations) — we're just trying to keep things simple here!

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

Alternatively, you can run 

```bash
pip install -r requirements.txt
``` 

to install `sqlfluff` as it is included in [requirements.txt](requirements.txt).


### What is a jaffle?
A jaffle is a toasted sandwich with crimped, sealed edges. Invented in Bondi in 1949, the humble jaffle is an Australian classic. The sealed edges allow jaffle-eaters to enjoy liquid fillings inside the sandwich, which reach temperatures close to the core of the earth during cooking. Often consumed at home after a night out, the most classic filling is tinned spaghetti, while my personal favourite is leftover beef stew with melted cheese.

---
For more information on dbt:
- Read the [introduction to dbt](https://docs.getdbt.com/docs/introduction).
- Read the [dbt viewpoint](https://docs.getdbt.com/docs/about/viewpoint).
- Join the [dbt community](http://community.getdbt.com/).
---
