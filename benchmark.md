
Task | Original Time Required | MammothDB&copy; timing | Improvement *  
--- |:---:|:---:|:---:|:---:|
BUCKET STRING | 25 min 17 sec | 2 min 6 sec | **12.04** times faster
BALIC LOAN Taken | 5 Sec | 2.12 sec | **2.36** times faster
PARENT LAN Customerkey Recon | 11 sec | 2.29 sec  | **4.85** times faster
PARENT LAN CustomerID Recon | 33 sec | 14.38 sec  | **2.29** times faster
PARENT_PRODUCT_RECON BETWEEN FM and FD | 32 Sec | 0.01 sec  | **3,200** times faster
RANK Customer AMTFIN | 3 min 23 sec | 39 sec | **5.21** times faster (ordered without RANK)
List of the top 1M clients ranked by AMTFIN | - | 4 sec | The computing time is virtually zero with this approach
List of the top 1M clients ranked by AMTFIN total| - | 4 sec | The computing time is virtually zero with this approach

---

\* *The hardware used is 6 x m4.large (CPU:2, RAM:8GB) AWS EC2 instances.*  
*Those instances have approximately 1/8 of the computing power of the current Bajaj Finance MapR cluster hardware.*

\* *The timing is done after database warm-up.*

\* *Since some of the result sets can be big in order to ignore the terminal time needed to output millions of rows we recommend the output to be redirected.*  
*For example `pager > /dev/null` or `pager > output_file.txt`*
