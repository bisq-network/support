
# Support Script


1. [Greetings](#greetings)
2. [Request Information](#request-information)
3. [Explain options](#explain-options)
3. [Confirm Intent](#confirm-intent)
4. [Suggestion](#suggestion)
5. [Closure](#closure)

Who opened the ticket
- BTC buyer
  - they made the payment and the BTC seller hasn't released the funds in multisig
  - they wish to cancel the offer
- BTC seller
  + the BTC buyer didn't make the payment
  + the BTC buyer made the payment late
  + the BTC buyer's details don't match

Case
  - BTC buyer issues
    + BTC buyer didn't make the payment
      - unaware of payment method's limits
      - took offer by mistake
    + BTC buyer made the payment late
      - their fault
      - encountered a bug that delayed them
    + BTC buyer's details don't match
  - BTC seller issues
    + [BTC seller's details don't match and the BTC buyer can't make the payment](#sellersdetailsdontmatch)
    + [BTC seller didn't release the funds](#didntreleasefunds)
      - their fault
      - encountered a bug

## <a name="didntreleasefunds"></a> BTC seller didn't release the funds


Ask the BTC buyer for proof of payment and the BTC seller why they didn't release the funds

`The BTC buyer has made the payment. Why haven't you released the BTC?`

## <a name="sellersdetailsdontmatch"></a> BTC seller's details don't match

``

## <a name="greetings"></a> Greetings
Greet the traders and inquire about the issue.

`Hello. What's wrong? Why did you open this mediation ticket?`


`Hello. The BTC buyer has made the payment. Why haven't you released the BTC?`

If the trader already wrote down the issue, acknowledge it, ask for any relevant proof (PageSigner, tx id, tx key, etc) and write down the steps the trader needs to follow.

`Hello. Please provide proof of your payment. I'll reach out to the other trader about this. Tell them on the Trader Chat to respond to me under Support > Mediation. They have 48 hours to respond. If they don't I'll close the ticket with a resolution suggestion in your favor.`

Incentivize the traders to come to a solution between the two of them whenever possible:

`Please talk with the other trader. The mediator is not here to pass messages but rather to help solve issues. When you encounter a problem, discuss it with the other trader and try to come to a solution together.`

## Request information
Request relevant information to help solve the issue:
1. PageSigner of bank statements
2. Bug report
  Through the Bisq software

  `Please fill in this form and share the files requested. You can open the document on notepad, edit and resend. Put all files (logs, screenshots) in a folder compress it. **And send the compressed file back**. This is important to help diagnose the problem. If you can't send it through Bisq reach out to me on Keybase (https://keybase.io/team/bisq) and identify yourself by the trade ID and your role in the trade (BTC seller or buyer, taker or maker).`

  On Keybase

  `Please fill in this form and share the requested files. You can open the document on notepad, edit and resend. Put all files (logs, screenshots) in a folder compress it. **And send the compressed file back**. This is important to help diagnose the problem.`


- screenshots:
  + Bisq error messages or particular views
  + other trader's messages if necessary

`Please reach out to me on Keybase (https://keybase.io/team/bisq). Identify yourself by trade ID and role (BTC buyer/seller, offer maker/taker).`


## <a name="request-information"></a> Explain options
Explain the options available to the trader and request a confirmation on how to proceed

  - Fake failed trade - the trader's client shows the trade as failed despite the opposite being true. Verify that the Deposit transaction is confirmed and relay the information to the trader and let them know that it's safe to proceed with the trade:

  `You can start the payment. The Deposit transaction (<deposit_transaction_id) is already confirmed despite your User Interface showing otherwise. Please do a SPV resync: https://bisq.wiki/Resyncing_SPV_file#From_the_Bisq_interface. It should fix this issue and you can move forward with the trade.`





## <a name="closure"></a> Closure

Let both parties know the resolution before closing the ticket:
### Resolved dispute

`I'll closed the ticket with the agreed upon resolution. You should be able to see the proposed resolution by selecting the trade under Portfolio > Open Trades. On the lower left there should be a SHOW PROPOSED RESOLUTION green button.`

### Unresolved dispute
For the party in the right:

`It's been 48 hours and the other trader hasn't responded so I'll close the ticket with a payout awarding you some of their security deposit. You should be able to see the proposed resolution by selecting the trade under Portfolio > Open Trades. On the lower left there should be a SHOW PROPOSED RESOLUTION green button. If they don't accept it you'll need to wait till the end of Mediation to open Arbitration and get the funds from the Arbitrator: https://bisq.wiki/Dispute_resolution#Level_3:_Arbitration.`

For the party in the wrong:

`It's been 48 hours with no response. I'll close the ticket in favor of the other trader. You should be able to see the proposed resolution by selecting the trade under Portfolio > Open Trades. On the lower left there should be a SHOW PROPOSED RESOLUTION green button.`

### In case of a failed trade:

This trade failed and no funds were sent to multisig. When a trade fails if your Taker or Maker transaction was broadcast we recommend you to request reimbursement (https://github.com/bisq-network/support/issues/new/choose) and move said trades to Failed trades. And do a SPV resync if the UI still shows funds as locked for this trade: https://bisq.wiki/Resyncing_SPV_file#From_the_Bisq_interface.

To the party that deserves a reimbursement:
Only the Taker fee transaction was successfully broadcast - `This trade failed and no funds were sent to multisig. However your Maker fee transaction was published. When a trade fails we recommend the traders to request reimbursement (https://github.com/bisq-network/support/issues/new/choose) and move said trades to Failed trades. And do a SPV resync if the UI still shows funds as locked for this trade: https://bisq.wiki/Resyncing_SPV_file#From_the_Bisq_interface.`

Only the Maker fee transaction was successfully broadcast - `This trade failed and no funds were sent to multisig. However your Taker fee transaction was published. When a trade fails we recommend the traders to request reimbursement (https://github.com/bisq-network/support/issues/new/choose) and move said trades to Failed trades. Please refer to https://bisq.community/t/failed-trades-and-deposit-tx-not-confirmed-troubleshoot-v1-5-4/10223.`

To the party that had no transaction of their own published:
`This trade failed and no funds were sent to the multisig. Do a SPV resync if the UI still shows funds as locked for this trade: https://bisq.wiki/Resyncing_SPV_file#From_the_Bisq_interface.`


### Emergency Multisig Payout Tool

Let the traders know that the payout transaction will need to be created and broadcast manually and explain them the steps to follow:
````
We'll have to do a manual broadcast of this payout. These are the public keys for this trade. Please press Ctrl+J and check the include private keys, clickl COPY TO CLIPBOARD and paste on a notepad. Search on that file for your public key. In the same line there's also a `priv HEX=`.

```
BuyerMultiSigPubKeyHex: <hex_string>
SellerMultiSigPubKeyHex: <hex_string>
```

I'll need you to use the Emergy multisig payout tool (Ctrl+g) to release the funds.
1. Open the tool with Ctrl+G.
2. Click import and paste the following text in the first field and click IMPORT FROM STRING. It should populate the view with the info about the payout transaction.

```
<unsigned_raw_transaction>
```
3. Verify the details and that the right amounts go to the right addresses.
4. Go to SIGN and paste your private key for this trade (priv HEX=) and click GENERATE SIGNATURE.
5. Copy the signature hex that you get and share it with me.
````

Let the trader know that you are waiting for the other signature:

`Thanks, as soon as I get the signature from the other trader I'll publish the transaction and let you know.`

Let the traders know that the payout transaction has been successfully created and broadcast:

`The funds were released from the multisig: <payout_transaction_id>. I'll close the ticket as formality.`


#########################################

1. Go to Account > Wallet Seed and write down the seed and the Wallet date
2. Go to Account > Backup and make a backup
3. Go to Account Wallet Seed and type the Wallet Seed and date in the fields bellow Restore wallets from seed words



I'm re-opening this ticket because I made a mistake on the resolution suggestion. I'll close it again with the correct suggestion.



Failed trades that leave the BTC client showing Locked funds. The trader should move the trade to Portfolio > Failed and follow the following steps:
`Please make a backup, close Bisq. Go to your Bisq folder: https://bisq.wiki/Data_directory. And delete the `Bisq/btc_mainnet/db/FailedTrades` file. This will delete the data related to the failed trades and should fix the issue.`

If the trade can't be move to Portfolio > Failed, the trader needs to make sure that only the failed trade is open under Portfolio > Open Trades and follow the following steps:

Please make a backup, close Bisq. Go to your Bisq folder: https://bisq.wiki/Data_directory. And delete the `Bisq/btc_mainnet/db/PendingTrades` file. This will delete the data related to the failed trades and should fix the issue.


The party that wishes to cancel a trade must reimburse the other trader for the mining and trading fees they spent with this trade. Ok?




The funds already left the multisig - <payout transaction id>. Restart Bisq and do a SPV resync if the UI still shows funds as locked for this trade: https://bisq.wiki/Resyncing_SPV_file#From_the_Bisq_interface.


The default mempool is dropping transactions with low fee rate so to play it safe and refer to mempool.space for fee rates that won't be dropped. A SPV resync should fix this issue: https://bisq.wiki/Resyncing_SPV_file#From_the_Bisq_interface.





BuyerMultiSigPubKeyHex: 03792f6307d1ca75dcacba404e36059819573b1cf8dd24c0678beb3fd3febae493
SellerMultiSigPubKeyHex: 02b993b06297b7d21d5a26bf71982539244a84de39fb293a5c9832c6c4f9f1a862


depositTxHex		114ace0994fbe5c96f6c7d027fcf841afd972c07f87f6aa3366b7bbcbce31402
amountInMultisig	0.20035872
buyerPayoutAmount	0.10
sellerPayoutAmount	0.05
txFee			0.
buyerAddressString	bc1q7fkvrcesz8ngr298ghfvlddnyh7ht98xy2024j
sellerAddressString	bc1qz2rvvemmsas0tum8zuhc2adv6jrfx5epkhushm
buyerPrivateKeyAsHex
sellerPrivateKeyAsHex
buyerPubKeyAsHes	03792f6307d1ca75dcacba404e36059819573b1cf8dd24c0678beb3fd3febae493
sellererPubKeyAsHes	02b993b06297b7d21d5a26bf71982539244a84de39fb293a5c9832c6c4f9f1a862




"xxxREDACTEDxxx"

How to organize a bug report
yyyymmdd-tradeID/
  summary_report.md
	btcBuyer/
    btcBuyer-summary-report.md
		logs/
		screenshots/
			btcBuyerMaker-openTradeDetails
			btcBuyerMaker-openTradeSummary
			btcBuyerMaker-disputeTradeDetails
			btcBuyerMaker-disputeTradeSummary
			btcBuyerMaker-historyTradeDetails
			btcBuyerMaker-historyTradeSummary
			btcBuyerMaker-errorMessage001

	btcSeller/
  btcSeller-summary-report.md
		logs/
		screenshots/
			btcSellerTaker-openTradeDetails
			btcSellerTaker-openTradeSummary
			btcSellerTaker-disputeTradeDetails
			btcSellerTaker-disputeTradeSummary
			btcSellerTaker-historyTradeDetails
			btcSellerTaker-historyTradeSummary
			btcSellerTaker-errorMessage001
