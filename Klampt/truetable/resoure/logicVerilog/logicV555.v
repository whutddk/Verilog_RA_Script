module prm_oblgc_chk555
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
assign edge_mask = (O&!N&!M&!L&!K&!I&H&!G&!E&D&C&B&A)|(O&!N&!M&!L&!I&H&!G&!F&!E&D&C&B&A)|(!O&N&M&L&K&!J&G&F&!E&D&C&B)|(O&!N&!M&!L&!K&I&!H&!G&!F&E&!D&!C&B)|(O&!N&!M&!L&!K&I&!H&!G&!F&E&!D&!B&A)|(!O&N&M&L&!J&I&G&!E&D&C&!A)|(O&!N&!M&!L&!K&!I&H&G&E&!D&!A)|(O&!N&!M&!L&!J&H&F&E&!D&!B&!A)|(!O&N&M&L&!I&!H&G&F&!E&D&C&B&A)|(O&!N&!M&!L&!K&!I&G&E&!D&!C&!B&!A)|(O&!N&!M&!L&J&!I&!H&!D&C&B&A)|(!O&N&M&L&K&I&!H&!G&!F&E&!D&!B&A)|(O&!N&!M&!K&!J&!H&G&F&E&!D&!C&!B&!A)|(!O&N&M&K&J&!I&F&E&!D&!C&B&A)|(!O&N&M&L&!J&I&F&E&!D&!C&B&A)|(!O&N&M&K&J&!I&G&E&!D&!C&B&A)|(!O&N&M&L&!J&I&G&!E&D&!C&B)|(!O&N&M&L&!J&I&G&E&!D&!C&B&A)|(!O&N&M&K&J&!I&!F&E&!D&C&!B&!A)|(O&!N&!M&!L&I&!H&!G&E&!D&C&!B&!A)|(!O&N&M&L&!J&I&G&E&!D&C&!A)|(!O&N&M&L&!J&I&G&!E&D&!B&A)|(!O&N&M&L&K&!I&G&F&E&!D&!C)|(O&!N&!M&!K&!J&I&!G&E&!D&C&!B)|(!O&N&M&L&K&J&!I&!H&!D&C&B&A)|(O&!N&!M&!L&!I&!H&G&F&!E&D&C&B)|(O&!N&!M&!L&I&!H&!G&E&!D&!C&B&A)|(O&!N&!M&!L&I&!H&!G&!F&E&!D&C&!B)|(!O&N&M&L&!J&I&F&E&!D&C&!A)|(!O&N&M&L&J&!I&!F&E&!D&!B)|(O&!N&!M&!L&!J&I&H&G&!D)|(O&!N&!M&!K&!J&I&H&!G&E&!D&C&!A)|(!O&N&M&L&K&!I&H&E&!D&!C)|(!O&N&M&L&!I&H&!F&E&!D&!C&B&A)|(O&!N&!M&!L&J&!I&!H&D&!C&!B&!A)|(!O&N&M&K&J&!I&!H&E&!D&C&!B)|(O&!N&!M&!L&!K&!J&I&H&D&!C&!B)|(O&!N&!M&!L&!I&H&E&!D&!C&B&A)|(O&!N&!M&!L&J&!I&E&!D&C&!B)|(!O&N&M&L&!J&H&G&E&!D&C&!B)|(O&!N&!M&!L&!J&G&F&E&!D&!C&!B)|(!O&N&M&L&K&!J&I&H&D&!C&!B)|(O&!N&!M&!L&J&!I&!G&!F&E&!D)|(!O&N&M&K&J&!I&G&F&E&!D&!C)|(!O&N&M&L&!I&H&!G&E&!D&!C&B)|(!O&N&M&L&!J&I&G&F&!E&D)|(O&!N&!M&!L&J&!I&!G&E&!D&B)|(O&!N&!M&!L&!J&I&H&F&!D)|(O&!N&!M&!L&!K&!I&G&F&E&!D&!C&!A)|(O&!N&!M&!L&!K&!I&H&E&!D&!B&!A)|(!O&N&M&L&!I&H&!G&F&E&!D&C&!B)|(O&!N&!M&!L&!K&!I&H&F&E&!D&!B)|(!O&N&M&K&J&!I&!G&E&!D&C&!B)|(!O&N&M&K&J&!I&!H&E&!D&C&!A)|(O&!N&!M&!L&!J&H&G&E&!D&!B)|(!O&N&M&L&!J&!H&G&F&E&!D&!C&!A)|(!O&N&M&L&!J&I&H&E&!D&!C)|(!O&N&M&L&!J&I&!H&E&!D&C&B)|(!O&N&M&L&!J&I&G&F&E&!D)|(!O&N&M&L&!I&H&!G&!F&E&!D&!C)|(!O&N&M&L&!J&I&E&!D&C&!B&A)|(!O&N&M&L&K&!I&H&G&E&!D&!B)|(!O&N&M&L&!J&I&H&E&!D&!A)|(!O&N&M&L&K&!I&H&G&E&!D&!A)|(!O&N&M&L&!I&H&E&!D&C&!B&!A)|(!O&N&M&L&K&J&!I&!H&!G&!C&!B)|(!O&N&M&K&J&!I&!G&!E&D&C&B&A)|(!O&N&M&K&J&!I&!H&!F&!E)|(!O&N&M&L&K&J&!I&!G&!F&E&!C&!B&!A)|(!O&N&M&L&J&!I&!G&!E&D&C&B&A)|(!O&N&M&L&J&!I&!H&!G&!E)|(!O&N&M&K&J&!I&!H&!G&!E)|(!O&N&M&L&J&!I&!H&!F&!E)|(!O&N&M&K&J&!I&!H&!E&D&C&B)|(!O&N&M&L&J&!I&!H&!E&D&C&A)|(!O&N&M&L&J&!I&!H&!E&D&C&B)|(!O&N&M&L&K&J&!I&!H&D&!C&!B&!A)|(O&!N&!M&!L&J&!I&!H&!G&!F&!C&!B)|(!O&N&M&L&!J&I&H&!E&D)|(!O&N&M&L&K&!J&I&!E&D&C)|(!O&N&M&K&!J&I&H&G&!E)|(O&!N&!M&!L&J&!I&!H&!F&!E)|(O&!N&!M&!L&!K&J&!I&!G&!F&E&!C&!B&!A)|(!O&N&M&L&!J&I&!H&G&E&D&!C&!B&!A)|(!O&N&M&L&K&!J&I&F&E&!C&!B&!A)|(!O&N&M&L&!J&I&F&!E&D&!C&B)|(O&!N&!M&!L&!K&J&!I&!H&!G&!C&!B)|(O&!N&!M&!K&J&!I&!H&!G&!E)|(!O&N&M&L&K&!J&H&!E&D&C&B)|(O&!N&!M&!L&J&!I&!H&!G&!E)|(O&!N&!M&!L&K&J&!I&!H&!E&D&A)|(!O&N&M&L&!J&I&F&!E&D&C&!B)|(!O&N&M&K&!J&I&H&F&!E&!C&!B&!A)|(!O&N&M&L&J&!H&!G&!F&E&!D&!C&B)|(!O&N&M&L&K&!J&H&G&!E&D&C&A)|(!O&N&M&L&K&!J&H&F&!E&D&C&A)|(O&!N&!M&!L&J&!I&!H&!E&D&!B)|(!O&N&M&K&J&!I&H&E&!D&!C)|(O&!N&!M&!K&J&!I&!H&!F&!E&!C&!B&!A)|(!O&N&M&L&K&J&!I&!G&E&!D)|(!O&N&M&K&J&I&!H&!G&!F&E&!D&!C&!B&A)|(!O&N&M&L&J&!I&!H&!F&!D)|(!O&N&M&L&J&!I&E&!D&!C)|(!O&N&M&J&!I&H&G&E&!D&!C&B)|(!O&N&M&L&K&!J&H&G&F&!E&D&C)|(!O&N&M&L&J&!H&!G&!F&E&!D&!C&A)|(!O&N&M&L&J&!I&!G&E&!D&!A)|(!O&N&M&L&J&!I&!H&!G&!D)|(!O&N&M&L&J&!H&!G&!F&E&!D&C&!B&!A)|(!O&N&M&L&J&!I&!H&E&!D&!A)|(!O&N&M&L&J&!I&!H&E&!D&!B)|(O&!N&!M&!L&!J&I&!E&D&C)|(O&!N&!M&!L&!J&I&H&!E&D)|(O&!N&!M&!K&!J&I&!E&D&C)|(O&!N&!M&!L&!J&I&G&!E&D&B)|(O&!N&!M&!L&!J&I&H&G&F&!C&!B)|(O&!N&!M&!K&!J&I&H&!E&D)|(O&!N&!M&!L&!K&!J&I&G&E&!C&!B&!A)|(O&!N&!M&!J&I&!H&!G&F&!E&D&!C&B&A)|(O&!N&!M&!L&!K&!J&I&F&E&!C&!B&!A)|(O&!N&!M&!K&!J&I&G&!E&D&B)|(O&!N&!M&!J&!I&H&!G&!E&D&C&B)|(O&!N&!M&!L&!J&I&F&!E&D&B)|(O&!N&!M&!L&!J&H&!E&D&C&B)|(O&!N&!M&!K&!J&I&F&!E&D&B)|(O&!N&!M&!K&!J&H&G&!E&D&C&A)|(O&!N&!M&!L&!K&!J&I&G&!E&D&A)|(O&!N&!M&!J&!I&!H&G&F&!E&D&C&B&A)|(O&!N&!M&!K&!J&H&!E&D&C&B)|(O&!N&!M&!L&!J&I&G&F&!E&D&A)|(O&!N&!M&!L&!J&H&G&!E&D&C&A)|(!O&N&M&L&K&!J&I&E&!D)|(O&!N&!M&!K&!J&I&G&F&!E&D&A)|(O&!N&!M&!L&!J&H&F&!E&D&C&A)|(O&!N&!M&!L&J&!I&!H&E&!D)|(O&!N&!M&!L&!K&J&!I&!F&E&!D)|(O&!N&!M&!L&!J&H&G&F&!E&D&C)|(!O&N&M&K&!J&I&H&G&F&!D&C&!A)|(O&!N&!M&!L&J&!I&E&!D&C&!A)|(O&!N&!M&!K&!J&H&G&F&!E&D&C)|(!O&N&M&K&!J&I&H&G&F&!D&C&!B)|(!O&N&M&L&K&!J&H&G&F&E&!D)|(!O&N&M&L&!J&H&G&E&!D&C&!A)|(!O&N&M&K&!J&I&H&F&!E&!D)|(!O&N&M&L&!J&I&H&G&!E)|(!O&N&M&L&!J&I&H&F&!E)|(!O&N&M&L&!I&!H&G&E&!D&!C&!B)|(O&!N&!M&!K&J&!I&!H&!F&!E&!D)|(O&!N&!M&!L&!J&I&H&E&!D)|(O&!N&!M&!L&!J&I&E&!D&!C)|(O&!N&!M&!L&!K&!J&I&E&!D)|(O&!N&!M&!L&!J&I&E&!D&!A)|(O&!N&!M&!K&!J&I&!G&!F&E&!D&!C)|(O&!N&!M&!K&!J&I&!H&E&!D&!C)|(O&!N&!M&!L&!J&I&G&F&E&!D)|(O&!N&!M&!L&!J&I&E&!D&!B)|(O&!N&!M&!K&!J&I&!H&G&E&!D&!A)|(O&!N&!M&!K&!J&!I&H&G&E&!D&!C)|(O&!N&!M&!L&!J&H&E&!D&!C)|(O&!N&!M&!L&!K&!J&H&G&F&E&!D)|(O&!N&!M&!K&!J&I&!H&E&!D&!B)|(O&!N&!M&!K&!J&!I&H&F&E&!D&!C&!A)|(O&!N&!M&!K&!J&I&H&G&!E)|(O&!N&!M&!J&!I&H&!G&!F&E&!D&!C&!B)|(O&!N&!M&!K&!J&I&H&F&!E)|(O&!N&!M&!K&!J&!I&H&E&!D&!C&!B)|(O&!N&!M&!J&!I&H&!G&E&!D&!C&!B&!A)|(O&!N&!M&!K&!J&!I&H&G&F&E&!D&!B&!A);
endmodule