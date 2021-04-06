# Mediation Summary notes:

- BANK_PROBLEMS
- BUG
  + Failed trade
    - `The Maker fee and Deposit transactions weren't properly broadcast.`
    - `The Taker fee and Deposit transactions weren't properly broadcast.`
  + Fake failed trade
    - `The BTC buyer's Bisq client showed the Deposit tx as unconfirmed despite the contrary.`
  + The BTC seller is unable to confirm payment receipt
    - `BTC Seller wasn't able to confirm the receipt of funds despite the BTC buyer having clicked "Payment Started".`
  + Bisq client unaware that the Deposit transaction has been unconfirmed
    - `Trader's Bisq client showed the Deposit tx as unconfirmed despite the opposite being true.`
  + Trade data lost
    - `BTC seller lost access to trade data. So we had to use the Multisig Emergency tool.`
  + Both traders accepted the resolution but the payout transaction wasn't broadcast
    - `I made a resolution that both parties accepted but the payout transaction wasn't properly created and broadcast. I had to use the Emergency Multisig Tool with the help of both traders.`

- OPTION_TRADE
- OTHER
- PEER_WAS_LATE
  + `The BTC buyer opened the ticket because the BTC seller hadn't released the funds in a timely manner.`
- SELLER_NOT_RESPONDING
  + `BTC seller opened the ticket because the other trader did not send the payment. BTC buyer did not respond 48 hours after my first contact.`
  + `BTC seller didn't respond.`
- TRADE_ALREADY_SETTLED
  + `The traders settled it on their own.`
- USABILITY
  + `The trader took offer by mistake.`
