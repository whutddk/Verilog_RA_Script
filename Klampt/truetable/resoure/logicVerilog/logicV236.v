module prm_oblgc_chk236
(
input A,
input B,
input C,
input D,
input E,
input F,
input G,
input H,
input I,
input J,
input K,
input L,
input M,
input N,
input O,
output edge_mask
);
assign edge_mask = (O&!N&M&!L&!J&!I&H&G&F&E&!D&B&!A)|(O&N&!L&!K&!J&I&H&F&E&!D&!C&B&A)|(O&!N&!M&L&K&!J&!I&H&G&F&E&!D&B&!A)|(O&!M&K&J&!I&H&G&F&E&!D&!C&!B&!A)|(O&N&!M&!L&!J&I&F&E&!D&!C&B&A)|(O&!M&!K&!J&I&H&!G&E&!D&!C&!B)|(O&!N&M&J&!H&E&!D&!C&!B&!A)|(O&!M&!K&J&I&!H&!F&E&!D&!C&!B&!A)|(O&!M&!L&!K&!J&I&!H&G&E&!D&!C)|(O&!M&!K&!J&I&!H&G&E&!D&!C&B&A)|(O&!M&L&!J&I&!H&G&F&E&!D&C&!B&!A)|(O&!N&L&K&!J&I&!H&!G&!F&E&!D&B&!A)|(O&!N&M&L&K&!J&I&!F&E&!D&C&!B&!A)|(O&!N&L&!J&I&G&E&!D&!C&!B&!A)|(O&!N&M&!J&I&!H&E&!D&C&!B&!A)|(O&!N&M&L&K&!J&I&!H&E&!D&C&!B)|(!O&N&!L&!J&!I&H&!F&!E&!D&C&B)|(O&N&!L&!K&J&!I&G&!F&E&!D&!C&!B&A)|(!O&N&!L&!K&!J&!I&H&!G&F&!E&!D&C&A)|(O&N&!L&!K&J&!I&!H&F&E&!D&!C&A)|(O&N&!L&!K&J&!I&H&!G&E&!D&!C&!B&A)|(!O&N&M&K&J&!I&!H&!E&!D&C&B&A)|(!O&N&M&J&!I&!H&!F&!E&!D&C&B&A)|(O&N&!M&!L&K&!J&I&G&!F&E&!D&C&!B&!A)|(O&!M&L&J&!I&H&F&E&!D&!C&!B&!A)|(O&!M&J&!I&H&!G&!F&!E&D&C&B&A)|(!O&N&!M&!L&!J&!H&!G&F&!E&!D&C&B&A)|(!O&L&!K&!J&!I&H&G&F&!E&!D&C&B&A)|(O&N&!M&!K&!J&I&G&F&E&!D&!C&A)|(!O&M&!L&K&!J&!I&G&F&!E&!D&C&B&A)|(!O&N&!M&!L&!K&!J&!H&G&!F&!E&!D&C&B&A)|(O&!M&!K&J&!I&G&!F&!E&D&C&B&A)|(O&!N&K&I&H&!G&!F&E&!D&!C&!B&!A)|(O&!N&M&L&!J&I&!H&!G&E&!D&B&!A)|(O&!N&M&L&!J&I&E&!D&!C&B&!A)|(!O&N&L&J&!I&!G&!F&!E&D&!C&A)|(O&!M&!J&I&!H&G&F&E&!D&!C&B&A)|(!O&N&K&J&!H&G&!E&D&C&!A)|(!O&N&K&J&!I&!H&!G&!E&D&!B)|(!O&N&!M&L&K&!J&H&G&!E&D&!C)|(!N&!L&!K&J&!I&!G&!F&!E&D&!C&B)|(!N&!M&!L&K&J&!I&!F&!E&D&!C&B)|(!O&N&L&J&!I&!H&!F&!E&D&!C)|(!N&!L&!K&J&!I&!G&!E&D&!C&B&A)|(O&!N&!J&I&H&!G&!F&E&!D&!C&!A)|(O&!N&K&!J&I&!H&E&!D&!C&B)|(O&!N&!L&!K&J&!I&!E&D&C&!A)|(O&!M&!L&!K&J&!H&!G&!E&D&C&B&!A)|(O&!N&M&L&!J&I&!G&E&!D&C&!B&!A)|(O&!N&!J&I&G&!F&E&!D&!C&!B&!A)|(!O&M&L&K&J&!I&H&F&!E&D&C&!A)|(O&!N&M&L&!J&I&!F&E&!D&!C&B)|(!N&!L&!K&J&!I&!H&!G&!E&D&!C&A)|(!O&N&M&!L&!K&I&!G&!F&!E&D&!C&B&A)|(!O&M&L&K&J&!I&H&G&!E&D&C&!A)|(!O&!M&L&K&J&!I&!G&!E&D&!C&A)|(!O&N&M&!L&!K&!J&I&H&!E&D&!B)|(!O&!N&M&L&K&!J&H&!E&D&!C&!B&A)|(!O&N&L&K&J&I&!H&!E&D&C)|(!O&N&!M&!K&I&!H&!G&!F&!E&D&!C&B)|(O&!N&M&L&J&!H&E&!D&!C&!B)|(!O&!N&M&L&K&!I&H&G&F&!E&D&!C&B)|(!O&N&!M&!L&!K&I&!H&!F&!E&D&!C&B)|(!O&M&!L&!K&J&!I&!H&!G&!E&D&!C)|(!O&N&M&L&K&!J&I&G&F&!E&D&!A)|(O&N&M&!L&!K&J&!I&!G&E&!D&!C&B)|(O&!N&!M&!L&J&H&!G&!F&!E&D&C)|(!O&N&!L&!K&!J&!I&H&G&!F&!E&!D&C&A)|(!O&N&M&L&!K&!J&I&!G&F&!E&D&!B)|(O&!N&!L&!K&J&H&!G&!F&!E&D&C&A)|(O&!N&!M&J&H&!G&!F&!E&D&C&A)|(!O&N&M&!K&!J&I&G&!F&!E&D&!B)|(!O&N&!M&L&!J&!I&H&!F&!E&!D&C&A)|(O&!N&!K&J&!H&!E&D&C&B&!A)|(O&!N&!L&I&!H&G&!E&D&C&B&A)|(O&!N&!M&!L&!K&!J&I&F&!E&D&!B&!A)|(O&!N&!M&L&I&!G&F&!E&D&C&B&A)|(!O&N&M&!L&!J&!I&H&!G&!F&!E&!D&C&A)|(O&!N&!K&J&!H&!F&!E&D&C&!B&A)|(!O&L&K&!J&I&H&F&!E&D&C&!B&!A)|(O&!N&!L&!K&I&!H&G&F&!E&D&C&A)|(O&!N&!M&!K&I&!H&G&!E&D&C&A)|(!O&!N&M&L&I&!H&!G&!E&D&!C&B)|(!O&L&K&!J&I&!E&D&!C&B&!A)|(O&N&!M&!L&!K&I&!H&F&E&!D&!C&!B&A)|(!O&M&L&K&!J&I&H&G&!E&D&!B&A)|(!O&!M&L&K&!J&!I&H&F&!E&!D&C&B&A)|(!O&M&L&K&I&!H&G&!E&D&C&!B&!A)|(!O&M&L&I&!H&G&F&!E&D&C&!B&!A)|(O&N&!M&!L&!J&I&!H&F&E&!D&C&!B)|(O&!M&!L&I&!H&G&F&E&!D&!C&!B&!A)|(O&!M&L&K&!J&I&H&G&E&!D&!C&!B)|(!O&N&!M&!K&!J&!H&!G&F&!E&!D&C&B&A)|(!O&N&!M&!L&K&!I&!H&!G&F&!E&D&!C&!B&!A)|(O&!N&!M&L&J&H&G&!F&E&!D&!C&!B&!A)|(O&!N&L&K&I&!H&!G&F&E&!D&!C&!B&A)|(O&!N&M&K&!J&I&!H&!G&E&!D&B&!A)|(O&N&!M&!K&!J&I&!H&G&E&!D&C&!B)|(!O&N&M&K&J&H&G&!F&!E&D&C&A)|(!O&N&!L&K&!I&!H&G&F&!E&D&!C&!B&A)|(O&N&!M&!L&J&!H&!F&E&!D&!C&!B)|(O&!M&!K&J&!I&!H&G&F&!E&D&C&B)|(O&!N&M&K&!J&I&E&!D&!C&B&!A)|(O&!N&M&L&K&!J&I&E&!D&!C&B)|(O&!N&K&!J&I&!H&!F&E&!D&C&!B&!A)|(!O&N&M&L&!J&I&G&!E&!D&C&B&A)|(!O&!N&M&!K&!J&I&!G&!F&!E&!D&C&B&A)|(!O&N&!M&!I&H&F&!E&D&!C&B&!A)|(O&!N&!M&!K&J&!I&!F&!E&D&B&!A)|(!O&M&!L&K&!J&G&F&!E&D&!C&!B&!A)|(!N&!M&L&K&J&!I&H&!G&!F&!E&D&!B&A)|(O&!N&M&L&J&!G&!F&E&!D&!C&!B)|(!O&N&!M&L&!K&J&!F&!E&D&C&!A)|(!O&N&L&K&J&!I&!H&!E&D&!B)|(O&!N&M&!J&I&!G&!F&E&!D&C&!B&!A)|(O&!N&M&!J&I&!F&E&!D&!C&B&!A)|(!O&L&J&!I&!H&!E&D&!C&A)|(!O&N&!L&!K&!J&!H&G&!E&D&!C&!B&!A)|(O&!N&M&!J&I&!H&!G&!F&E&!D&B&!A)|(!N&!L&!K&J&!I&!H&!F&!E&D&!C&A)|(O&!N&L&!J&I&!H&!G&E&!D&C&!B)|(!N&!L&J&!I&!G&!F&!E&D&!C&B&A)|(!O&!N&M&L&!J&I&!H&!G&!F&!E&!D&C&B)|(O&!N&!M&L&I&H&!G&E&!D&!C&!B&!A)|(!O&!N&!M&L&K&!J&I&!H&!E&!D&C&B&A)|(O&!N&!M&!L&J&!I&!G&!F&!E&D&!A)|(!O&N&M&L&!J&I&H&!G&F&!E)|(O&!N&M&J&I&!H&!G&E&!D&!C&!B)|(!O&N&!M&!L&K&J&!F&!E&D&C&!B)|(O&!N&!L&J&H&!G&!F&!E&D&C&B)|(!O&N&M&!L&!J&G&F&!E&D&!C&!B)|(!N&!M&J&!I&!H&!E&D&!C&B)|(O&!N&!M&!L&J&!I&!E&D&!C&B&A)|(!O&N&M&K&J&I&!G&!E&D&C&A)|(!O&N&M&L&!J&I&H&G&!F&!E)|(O&!N&M&I&!H&G&!F&E&!D&!C&!B)|(!O&!M&L&K&!J&H&F&!E&D&!C&!B)|(!O&N&!M&L&!J&G&F&!E&D&!C&!B)|(O&!N&!M&!L&J&!E&D&C&B&!A)|(!O&N&K&J&I&!H&G&!F&!E&D&C)|(O&!N&!L&J&!I&!H&!E&D&C&!A)|(!O&N&!L&!K&!J&!I&G&!F&!E&!D&C&B)|(!O&N&!M&L&I&!G&!F&!E&D&!C&B&A)|(!O&!N&M&L&!I&H&F&!E&D&!C&B&!A)|(!O&M&L&J&!I&H&G&F&!E&D&C&!A)|(!O&!M&L&K&J&!H&!F&!E&D&!C&B&A)|(O&!N&!M&!L&!K&I&G&!E&D&C&B)|(!O&!N&M&L&K&!J&!H&G&!E&D&!C&!B&!A)|(!O&M&!L&!J&H&G&F&!E&D&!C&!A)|(!O&N&!M&K&!J&!I&H&!F&!E&!D&C&A)|(!O&!N&M&!L&J&!I&!F&!E&D&!C&A)|(!N&!M&L&K&J&!H&!F&!E&D&C&!B&!A)|(!O&M&!L&J&!I&!H&!G&!F&!E&D&!C)|(!O&!N&M&L&K&J&I&!H&!G&!E&D&B&!A)|(O&!N&!M&!K&!J&I&H&!E&D)|(!O&!M&L&K&!J&H&G&!F&!E&!D&C&B&A)|(O&!N&!M&!L&!K&J&!H&!G&!E&D&!C&B&A)|(!O&M&L&J&H&!G&!F&!E&D&C&!B)|(O&!N&!L&!K&J&!H&!G&!E&D&C&!A)|(!O&!N&M&L&!J&!H&G&F&!E&D&!C&!B&!A)|(O&!N&!L&!K&!J&I&H&G&!E&D&A)|(!O&N&!M&!J&!I&H&!G&F&!E&!D&C&A)|(O&!N&M&!L&!K&J&!F&E&!D&!C&!B&!A)|(O&!N&!M&J&!H&G&!E&D&C&B)|(!O&N&L&K&!J&I&G&F&!E&!D&C&B&A)|(O&!M&L&K&J&!I&E&!D&!C&!B&!A)|(!O&M&K&I&!H&G&F&!E&D&C&!B&!A)|(O&!M&L&!J&I&H&!G&F&E&!D&!C&!A)|(O&!N&M&!L&J&!G&E&!D&!C&!B&!A)|(O&!N&M&!K&I&!G&F&E&!D&!C&!B&!A)|(!O&!M&L&K&!J&I&H&!G&!E&!D&C&B&A)|(O&!M&!K&J&!I&H&!G&!E&D&C&B)|(O&N&!M&L&!J&I&H&G&E&!D&!B&!A)|(O&!N&!L&K&!J&I&!H&!G&F&E&!D&!B)|(!O&M&!K&!J&I&!H&G&F&!E&!D&C&B&A)|(!O&M&!L&K&!J&I&!H&G&!E&!D&C&B&A)|(O&N&!M&!J&I&H&!G&E&!D&C&!B&!A)|(O&N&!M&!L&!J&I&!H&G&E&!D&!B&A)|(O&!M&L&!J&I&H&G&!F&E&!D&!C&!B)|(O&!N&!L&K&!J&I&!H&E&!D&!C&A)|(!O&N&L&K&J&!I&!G&!E&D&!B&A)|(!O&!M&L&!J&I&!H&!G&!F&!E&!D&C&B&A)|(!O&!N&M&L&!J&!H&G&!F&!E&!D&C&B&A)|(!O&N&!L&!J&H&F&!E&D&!C&B&!A)|(O&!M&!L&!J&I&!H&G&E&!D&!C&B)|(!O&L&K&J&!I&!H&G&!E&D&!B&A)|(!O&N&M&!L&!J&H&G&!E&D&!C)|(!N&!L&!K&J&!I&!H&!E&D&!C&B)|(!O&N&M&J&!I&!G&!F&!E&D&!C)|(!O&!N&M&!K&!J&I&!H&!G&F&!E&!D&C&B)|(O&!N&!M&L&!J&I&!H&F&E&!D&!C)|(!O&!N&L&K&!J&I&!H&!G&!E&!D&C&B&A)|(!O&N&!M&!I&H&G&!E&D&!C&B&!A)|(!O&!N&M&!L&K&!J&I&!H&!G&!E&!D&C&B)|(O&!N&!M&L&!J&I&!H&!F&E&!D&!B&A)|(O&!N&M&!L&!K&!J&I&!H&E&!D&C&!B)|(!O&N&L&!K&J&I&!H&G&!F&!E&D&B&A)|(O&!M&!L&!K&J&I&!H&!E&D&C&B&A)|(O&!N&!L&J&!I&!F&!E&D&C&!A)|(!O&J&!I&!H&!G&!E&D&!C&A)|(!O&N&M&L&J&!I&!H&!E&!D)|(O&!N&!L&!K&I&G&!F&!E&D&C&B&A)|(O&!N&!M&!L&J&!I&!G&!E&D&!B&A)|(O&!N&M&!J&I&!H&!F&E&!D&C&!B)|(!N&!L&!K&!J&I&H&F&!E&D&!C&B&!A)|(!O&K&J&!I&H&!E&D&C&!B&!A)|(!N&!L&!K&!J&I&H&G&!E&D&!C&B&!A)|(O&!N&!M&J&!I&!F&!E&D&!C&B&A)|(!N&!L&K&!J&I&H&G&!E&D&!C&B&A)|(!O&N&M&K&!J&I&G&F&!E&D&!B)|(!N&M&!L&!K&!J&I&H&!E&D&!C&B&A)|(O&!N&!M&!K&J&!H&!E&D&C&!A)|(O&!N&!L&!K&I&H&!G&!E&D&C&B)|(!O&N&L&J&G&!F&!E&D&C&!B&A)|(O&!N&!M&!K&J&!I&!H&!F&!E&!D)|(O&!N&!L&J&I&!G&!E&D&C&B&A)|(O&!N&!M&!K&I&H&!G&!F&!E&D&C)|(!O&!N&M&!J&H&F&!E&D&!C&!B&A)|(!O&M&!L&!J&!I&H&!E&!D&C&B&A)|(!N&M&!L&!J&I&H&F&!E&D&!C&B&A)|(!O&N&!M&!L&I&!H&!G&!E&D&!C&B)|(!O&!N&M&L&!I&H&G&!E&D&!C&B&!A)|(!O&M&!L&!K&!J&H&!G&!E&!D&C&B&A)|(!O&N&I&!H&F&!E&D&C&!B&!A)|(!O&M&!K&!J&!I&H&G&!E&!D&C&B&A)|(!N&!M&!L&!J&I&G&F&!E&D&!C&B&!A)|(!N&M&L&!J&I&H&G&F&!E&D&C&!B&A)|(O&!N&!M&J&H&!G&!E&D&C&B)|(!O&!N&M&L&J&I&!H&!G&!F&!E&D&B&!A)|(!O&N&M&!L&I&!H&G&!E&D&C&!B)|(O&!N&!M&!L&I&H&!G&!E&D&C&A)|(!O&!N&M&J&!H&!G&!F&!E&D&!C&B)|(!O&N&M&!L&!K&J&!G&F&!E&D&C&!A)|(!O&M&!L&!J&I&!G&!F&!E&!D&C&B&A)|(!O&L&J&!H&!G&!E&D&C&!B&!A)|(!O&N&K&J&G&!F&!E&D&C&B&!A)|(O&N&!M&!L&!J&I&H&E&!D&!C)|(!O&M&!L&J&!I&H&!G&!E&D&!B&A)|(O&!N&M&!K&!J&I&!G&E&!D&!C&A)|(O&!N&!K&J&!I&!H&!G&!E&D&C&!A)|(!O&N&M&J&!I&H&G&F&!E&D&B&A)|(!N&!M&L&K&J&!I&!H&G&!F&!E&D&!B)|(O&!N&L&!J&I&!G&!F&E&!D&!C&B)|(!O&J&!I&!G&!E&D&!C&B)|(O&!N&!M&J&!I&!H&!G&!E&!A)|(!N&!L&J&!I&!H&!G&!E&D&!C&B)|(!O&N&!M&!J&H&G&F&!E&D&!C&B)|(O&!N&M&!J&I&!G&E&!D&!C&B)|(!O&N&!M&L&K&!J&I&G&!E&D&!B)|(O&!N&I&H&!G&!F&!E&D&C&B&A)|(!O&N&L&K&!J&I&!E&D&!B&!A)|(!O&N&M&K&J&!I&!H&!F&!E&!D)|(O&!N&!M&K&I&!G&F&!E&D&C&B&A)|(!O&N&!K&!J&I&H&F&!E&D&C&!B)|(!O&N&J&!I&G&!E&D&C&!B)|(O&!N&L&!J&I&!H&E&!D&C&!B&!A)|(!O&N&!M&L&!J&I&H&!E&D&!B)|(O&!N&!M&J&!I&!G&!F&!E&D&!B&A)|(O&!N&M&!J&I&G&E&!D&!C&!B)|(O&!M&!L&J&I&!H&!G&!F&!E&D&C&B)|(!O&N&M&!K&J&I&!E&D&C&!B&A)|(!O&N&!M&L&J&I&!H&F&!E&D&B&A)|(!O&N&!M&!J&!H&G&!E&D&!C&!B&!A)|(!O&N&!K&!J&I&H&G&!E&D&!B&A)|(O&!N&!L&I&!H&G&F&!E&D&C&B)|(!O&N&!J&I&!H&!E&D&!C)|(!O&K&!J&I&F&!E&D&!C&B&!A)|(!O&L&!J&I&F&!E&D&!C&B&!A)|(!O&L&K&!J&I&G&!E&D&!C&A)|(!O&M&K&!J&I&!E&D&!C&A)|(!O&M&L&!J&I&!E&D&!C&A)|(O&!N&J&!H&G&!F&!E&D&C&B)|(O&!N&!M&J&!H&!G&!E&D&C&!A)|(!N&!M&L&!J&I&H&G&!E&D&!B&!A)|(!O&!N&M&J&!H&!E&D&!C&B&A)|(!O&N&!M&J&!I&!E&D&!C&B)|(O&!N&!K&J&!I&!H&!F&!E&D&C&!A)|(!O&N&M&!K&!J&H&G&!E&D&!C)|(!O&M&!K&J&!I&H&!G&!E&D&!B&A)|(!O&N&!M&L&J&!I&!E&D&B&!A)|(!N&!L&J&!I&!H&!F&!E&D&!C&B)|(O&!N&!M&!K&J&!I&!H&!E&D&!A)|(O&!M&L&J&!I&!H&!E&D&C&B&A)|(!O&L&!K&!J&I&G&!F&!E&D&!C&!A)|(!O&N&M&L&J&H&!E&D&C&B)|(!O&N&I&H&!G&!F&!E&D&C&!B&!A)|(O&!N&!J&I&H&!G&E&!D&!C&!B)|(!O&N&M&L&K&!J&I&H&!E)|(!N&M&!L&J&!I&!G&!E&D&C&!B&!A)|(!O&N&!M&!J&!I&H&!E&D&!C&!B)|(O&!N&J&I&!H&E&!D&!C&!B&!A)|(O&!N&!M&J&!I&!H&!E&D&!C&A)|(!O&!M&L&J&!I&!H&!G&!E&D&!C)|(!O&N&!M&L&!J&I&G&F&!E&D&!B)|(!O&N&!M&K&!J&I&H&!E&D&!B)|(!O&M&I&!H&!G&F&!E&D&!C&B&A)|(O&!N&!K&J&I&!G&!E&D&C&B&A)|(!N&!L&!J&I&H&G&F&!E&D&!C&B)|(!O&N&!L&I&!H&!E&D&!C&B&A)|(O&!N&I&!H&G&F&!E&D&C&B&A)|(!O&N&M&L&J&!I&!H&G&F&!E)|(!O&!N&L&!J&!I&H&G&!E&D&!C&!B)|(!O&!N&M&!J&H&!G&!E&D&!C&!B&!A)|(!O&N&M&J&I&!H&!E&D&C)|(!O&N&!J&I&G&!E&D&C&!B&!A)|(O&!N&J&I&!H&!G&!E&D&C&A)|(!N&!M&!J&I&H&!G&F&!E&D&!C&!B)|(!O&M&!L&!J&H&G&!E&D&!C&!B)|(!O&K&!J&I&G&!E&D&!C&B&!A)|(O&!N&!M&!L&I&!H&G&!E&D&C)|(O&!N&J&!H&!G&!E&D&C&B&!A)|(!N&M&!L&J&I&!H&!E&D&C&!B&A)|(!O&M&!J&I&!G&!E&D&!C&!A)|(!O&M&!J&I&!H&G&!E&D&!C)|(!O&M&!J&I&H&!E&D&C&!B&!A)|(!O&!J&I&!H&G&F&!E&D&!C&!B)|(!O&N&J&!I&H&!E&D&C&!A)|(O&N&!M&!L&J&!I&!E&D&C&B)|(!O&N&J&H&!G&!E&D&C&B&!A)|(O&!N&!M&K&J&!I&!E&D&C)|(!O&M&J&!I&!H&F&!E&D&!B&A)|(!O&N&!L&!J&!I&H&!E&D&!C&!B)|(!O&N&M&!L&J&!E&D&C&!B&A)|(!O&N&M&J&G&!E&D&C&B&!A)|(O&!N&!J&I&!H&G&E&!D&!C)|(!O&J&!I&!H&!F&!E&D&!C&A)|(!N&!M&J&!I&!G&!E&D&!C&B)|(!N&!L&J&!I&!H&!E&D&!C&B&A)|(!O&!J&I&H&!G&!F&!E&D&!C&!A)|(!O&M&J&!H&!E&D&C&!B&!A)|(O&!N&J&!I&!E&D&C&!B&A)|(!O&!N&M&J&!I&!E&D&!C&B)|(!O&!L&K&!J&I&!E&D&!C&!B)|(O&!N&!M&I&G&!F&!E&D&C&B)|(O&!N&!M&J&!H&!E&D&C&!B&A)|(!O&!N&M&L&J&!H&!E&D&C&!B)|(!N&!M&L&!J&I&H&!E&D&!C&B)|(O&!N&!M&J&!I&!H&!G&!E&!D)|(!O&L&!J&I&!H&!E&D&!C&!B)|(!O&M&!J&I&!E&D&!C&!B&A)|(O&!N&!M&!L&J&!I&!H&G&!E)|(!O&L&!K&J&!I&!E&D&!C&B)|(!O&!M&K&J&!I&!E&D&!C&B)|(!O&M&J&!I&!F&!E&D&!C&B)|(!O&N&M&J&!I&!H&!E&D&!C)|(!O&L&J&!I&!E&D&C&!B&!A)|(!O&N&!M&J&!G&!E&D&C&!B)|(O&!N&!M&J&!I&H&!E&D&C)|(!O&M&J&!I&G&!E&D&C&!B)|(!O&N&J&!H&G&!E&D&C&!B)|(O&!N&M&J&!I&!E&D&C&B)|(!O&N&M&!J&I&!E&D&!B&!A)|(!O&!J&I&H&!E&D&!C&!B&A)|(!O&N&!J&I&!E&D&!C&B)|(O&N&M&!L&!K&J&!I&!H&!G&!F&E&!D&C&!B&!A)|(O&!N&M&!K&!J&!I&H&G&F&E&!D&C&!A)|(O&!N&M&!L&!K&!J&!I&H&G&E&!D&C&B&!A)|(O&!N&M&!J&!I&H&G&F&E&!D&C&!B)|(O&!N&M&!L&!J&!I&H&G&E&!D&C&!B&A)|(O&N&M&!L&!K&!J&I&H&G&E&!D&C&!B&!A)|(O&N&!M&L&K&J&!I&!H&!G&!F&E&!D&!B&!A)|(O&N&!L&!K&J&!I&!F&E&!D&!C&B&!A)|(O&N&!M&L&!K&!J&I&H&!G&!F&E&!D&!B)|(O&N&!L&!K&J&!I&!H&E&!D&!C&B)|(O&N&!L&J&!I&!H&!G&F&E&!D&!C&B&!A)|(O&N&!L&J&!I&!H&G&!F&E&!D&!C&B&!A)|(O&!N&L&K&!J&!I&H&G&F&E&!D&C&!B)|(O&N&!M&!L&!K&!J&I&!H&E&!D&C&!B)|(O&!N&L&!J&!I&H&G&F&E&!D&C&!B&!A)|(O&N&!L&!K&!J&I&H&G&E&!D&!C&B)|(O&N&!M&L&K&J&!I&!G&!F&E&!D&!C)|(O&!N&M&!L&!J&!I&H&G&F&E&!D&!C&B)|(O&N&!M&J&!I&E&!D&!C&!A)|(O&N&!M&L&J&!I&!H&E&!D&!C)|(O&N&!M&J&!I&!H&!G&E&!D&!C)|(O&N&!M&J&!I&!H&!F&E&!D&!C)|(O&N&!M&J&!I&E&!D&!C&!B)|(O&N&!M&!J&I&H&E&!D&!C&B)|(O&!N&!M&L&!J&!I&H&G&F&E&!D&!C&B)|(O&N&!M&!L&!K&!J&I&F&E&!D&!C&B)|(O&!N&M&L&K&J&!I&E&!D&!C&!A)|(O&!N&M&L&K&J&!I&!H&!G&!F&E&!D&!C)|(O&!N&M&L&J&!I&!H&!G&E&!D&!C&!A)|(O&!N&M&K&J&!I&E&!D&!C&!B)|(O&!N&M&L&J&!I&E&!D&!C&!B)|(O&!N&M&J&!I&H&G&E&!D&!C&!B)|(O&!N&M&J&!H&!G&!F&E&!D&!C&!B)|(O&N&!M&L&!K&J&!H&!G&E&!D&!C&!A)|(O&N&!M&!L&K&J&!H&!G&E&!D&!C&!A)|(!O&N&M&L&K&!J&I&H&!G&!F&!D&!C&!B)|(!O&N&M&L&K&!J&I&H&!G&!D&!C&!B&!A)|(O&N&!M&J&!H&!G&!F&E&!D&!C&!B)|(O&N&!M&!K&J&!H&!G&E&!D&!C&!B)|(O&N&!M&!L&J&!H&!G&E&!D&!C&!B)|(!O&N&M&L&K&J&I&!H&G&E&!D&!C&!B&!A)|(!O&N&M&L&J&I&!H&G&F&E&!D&!C&!B&!A)|(O&!N&L&K&I&!H&G&!F&E&!D&!C&!B)|(!O&N&!L&!J&!I&H&!G&!E&!D&C&B)|(!O&N&!L&!J&!I&!H&G&F&!E&!D&C&B)|(!O&N&!M&!J&!I&H&!E&!D&C&B)|(!O&N&M&!L&!K&!J&!I&!H&G&F&!E&!D&C&A)|(!O&N&!M&!K&!J&!I&F&!E&!D&C&B)|(!O&N&!M&!J&!I&G&!E&!D&C&B)|(!O&N&!M&!L&!J&!I&F&!E&!D&C&B)|(!O&N&M&J&!I&!H&!G&!E&!D)|(!O&N&!M&L&!K&!J&!I&!H&G&F&!E&!D&C&A)|(!O&N&M&L&!J&I&H&!E&!D)|(!O&N&M&K&!J&I&H&F&!E&!D)|(!O&!N&M&L&!J&!I&H&!E&!D&C&B)|(!O&N&M&!J&I&H&G&!E&!D)|(!O&N&L&K&J&!I&!H&!G&!E&!D&C&B&A)|(!O&!N&M&K&!J&!I&H&G&F&!E&!D&C&B)|(!O&!N&M&L&K&!J&!I&G&!E&!D&C&B)|(!O&!N&M&L&!J&!I&G&F&!E&!D&C&B)|(O&!N&!M&!K&!J&I&H&F&!E)|(O&!N&!M&!L&!J&I&H&!E)|(O&!N&!M&!J&I&H&G&!E)|(O&!N&!M&!L&!K&!J&I&G&!E&C&B&A)|(!O&N&!M&!L&!J&I&!H&!G&!F&!E&!D&C&B)|(!O&!N&M&!L&!K&!J&I&!H&G&!F&!E&!D&C&B)|(O&!M&!L&!J&I&H&F&!E&D&C&B&A)|(O&!M&!L&!K&!J&I&H&!E&D&C&B&A)|(O&!M&!K&!J&I&H&G&!E&D&C&B&A)|(O&!M&!L&!J&I&H&G&!E&D&C&B&A)|(O&!M&!L&!K&!J&I&H&G&!E&D&C&B)|(O&!N&!J&I&H&F&!E&D&C&B)|(O&!N&!K&!J&I&H&!E&D&C&B)|(O&!N&!L&!J&I&H&!E&D&C)|(O&!N&!J&I&H&G&!E&D&C&B)|(!O&N&L&!K&!J&I&H&G&F&!E&D&!A)|(O&!N&!K&!J&I&H&G&!E&D&C)|(O&!N&!M&!J&I&H&!E&D&C)|(O&!N&!M&!J&I&G&F&!E&D&C)|(!O&M&L&K&J&!G&!E&D&C&!B)|(!O&N&J&I&!H&!E&D&C&!A)|(O&!N&!M&!L&!K&!J&I&F&!E&D&!C)|(O&!N&!M&!J&I&G&F&!E&D&B&A)|(O&!N&!M&!L&!K&!J&I&G&!E&D)|(!O&M&K&J&!G&!F&!E&D&C&!B&A)|(!O&L&K&J&!H&!G&!E&D&!C&B&A)|(!O&L&J&!H&!G&!F&!E&D&!C&B&A);
endmodule