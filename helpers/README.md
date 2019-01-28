#This directory contains small helper scripts

## get_data.sh

#### input:
  * a file named `info` which has data in csv format
  * csv fields:
    * gh (github issue number)
    * tradeid (the short format of the tradeid - usually referenced in the issue)
    * txid (the maker/taker txid)
    * reimb_address (reimbursement address, if not provided will be fetched from the blockchain)

#### output:
  * outputs a csv that can be used in the batch reimbursement to terminal
  * csv fields:
    * gh (github issue number)
    * txid (the maker/taker txid)
    * address (address to send reimbursement to)
    * tradingfee (trading fee lost)
    * miningfee (mining fee lost)
    * tradeid (the short format of the tradeid - usually referenced in the issue)

#### other:
The script creates a log directory where it copies all json data for a given maker/taker txid from the blockchain. The filename is the txid.

#### example:
Using #197 as an example

```
user@host:~/bisq/support/helper$ cat info
#gh,tradeid,txid,reimb_address
197,B34X6,9a8d6ad6fe580e0333a8b7c3d3b4b8238768aae408b955e7f7fc882694a3ee42,
197,B34X6,364d66c49b5447bc3a9a2beeed1e7a9f70e1b25fdc76640208e0eed6ed31d4c7,
user@host:~/bisq/support/helper$ ./get_data.sh
197,9a8d6ad6fe580e0333a8b7c3d3b4b8238768aae408b955e7f7fc882694a3ee42,1ESdzsKaorXV1LRgMtyrDtSLhg1H8snCJB,0.00017660,0.00004080,B34X6
197,364d66c49b5447bc3a9a2beeed1e7a9f70e1b25fdc76640208e0eed6ed31d4c7,17NJfLj2feECgCuAUccQF4tPa71uDP7wBN,0.00052980,0.00003640,B34X6
user@host:~/bisq/support/helpers$ ls log/
364d66c49b5447bc3a9a2beeed1e7a9f70e1b25fdc76640208e0eed6ed31d4c7  9a8d6ad6fe580e0333a8b7c3d3b4b8238768aae408b955e7f7fc882694a3ee42

```
