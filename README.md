![MammothDB](https://github.com/AMilkov/B-PoC/blob/master/Documentation/logo.jpg "MammothDB")

## MammothDB&copy; PoC for Bajaj finance


* **Fact tables** are located in the [Facts directory](https://github.com/AMilkov/B-PoC/blob/master/Facts)
* **Dimension tables** are located in the [Dimensions directory](https://github.com/AMilkov/B-PoC/blob/master/Dimensions)
* **Queries** are located in the [Queries directory](https://github.com/AMilkov/B-PoC/blob/master/Queries)
* **The Documentation** is located in the [documentation directory](https://github.com/AMilkov/B-PoC/blob/master/Documentation)

The **benchmark** file is: **[benchmark.md](https://github.com/AMilkov/B-PoC/blob/master/benchmark.md)**

As a general rule the database behave exactly as MySQL database with the exception of the tables that are using the MammothDB&copy; engine.  
Those tables are easily distinguishable from the rest, since they are defined using **`ENGINE=MDB`**  

To connect to the local database with CLI use the command:
```
mysql -S /var/lib/mammothdb/mdb-qe.sock
```

The SSH credentials for the cluster and the database credentials will be shared via email

---

For more information: **[www.MammothDB.com](http://www.mammothdb.com/)**
