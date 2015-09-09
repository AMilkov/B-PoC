
Task | Original Time Required | MammothDB&copy; timing | Improvement *  
--- |:---:|:---:|:---:|:---:|
BUCKET STRING | 25 min 17 sec | 7.54 sec | **201.19** times faster
BALIC LOAN Taken | 5 Sec | 2.03 sec | **2.46** times faster
PARENT LAN Customerkey Recon | 11 sec | 5.71 sec  | **1.92** times faster
PARENT LAN CustomerID Recon | 33 sec | 13.86 sec  | **2.38** times faster
PARENT_PRODUCT_RECON BETWEEN FM and FD | 32 Sec | 0.01 sec  | **3,200** times faster
RANK Customer AMTFIN | 3 min 23 sec | 36.84 sec | **5.51** times faster (ordered without RANK)
List of the top 1M clients ranked by AMTFIN | - | 3.73 sec | The computing time is virtually zero with this approach
List of the top 1M clients ranked by AMTFIN total| - | 3.73 sec | The computing time is virtually zero with this approach

---

\* *The hardware used is 6 x m4.large (CPU:2, RAM:8GB) AWS EC2 instances.*  
*Those instances have approximately 1/8 of the computing power of the current Bajaj Finance MapR cluster hardware.*

\* *The timing is done after database warm-up.*
