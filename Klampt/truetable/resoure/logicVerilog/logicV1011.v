module prm_oblgc_chk1011
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
assign edge_mask = (!O&M&L&K&!J&!I&!H&G&F&E&!D&!C&!B&!A)|(!O&!N&L&!K&!J&I&!H&!G&E&!D&!C&!B&!A)|(!O&M&K&!J&!I&H&!F&E&!D&!C&!B&!A)|(!O&!M&L&K&!J&!I&H&G&F&E&!D&!C&!B&!A)|(O&!N&!M&!K&J&!I&!H&!G&!F&!E&!C)|(!O&!N&L&!J&I&!H&!G&!F&E&!D&!C&!B&!A)|(!O&M&L&!J&!I&H&!F&E&!D&!C&!B&!A)|(!O&N&M&!L&!J&!I&!G&F&E&!D&!C&!B&!A)|(O&!N&!M&!L&!K&J&!I&G&!F&!E&D&C&!B&!A)|(O&!N&!M&!L&!J&I&G&F&!E&D&!C)|(O&!N&!M&!K&!J&I&H&!G&!F&!E&D&!A)|(!O&M&L&K&J&!I&G&F&!E&D&!C&B)|(!O&!M&L&K&J&!H&!F&!E&D&!C&B&A)|(!O&!M&L&K&J&!H&!G&!E&D&!C&B&A)|(!O&!N&M&!L&!K&J&!I&!G&!F&!E&D&C)|(!O&M&!L&K&J&!G&!F&!E&D&!C&B&A)|(O&!N&!M&!L&J&!I&!H&F&!E&!B&!A)|(!O&L&K&!J&I&G&F&!E&D&!C&B&A)|(O&!N&!M&!K&!J&I&!H&G&F&!E&D&!B)|(!O&N&L&K&!J&I&G&F&!E&D&!C&A)|(!O&N&!L&I&!G&!F&!E&D&C&!B)|(!O&N&M&K&!I&H&G&F&!E&D&!C&B&A)|(!O&M&K&!J&I&F&!E&D&!C&B&A)|(!O&N&M&K&!J&I&G&F&!E&D&!C)|(O&!N&!M&!L&!J&I&H&!E&!C)|(!O&N&M&K&!J&!I&G&!E&D&C&A)|(!O&M&L&K&!J&!I&G&F&!E&D&C&B)|(O&!N&!M&!L&!J&!I&G&F&!E&D&C&B)|(!O&M&!L&K&I&!G&!F&!E&D&C&!B&!A)|(!O&L&!J&!I&H&G&F&!E&D&C&B&A)|(!O&M&!J&!I&H&!G&F&E&!D&!C&!B&!A)|(!O&M&K&!I&H&G&!E&D&C&!B&A)|(!O&N&L&K&!J&I&H&F&!E&D&!C)|(O&!N&!M&!K&!J&I&H&!E&D&!B&!A)|(!O&M&K&!J&!I&H&!E&D&C&B&A)|(!O&N&K&!J&I&H&F&!E&D&!C&A)|(!O&M&L&K&!I&H&F&!E&D&C&!B)|(!O&!N&M&!J&!I&H&G&E&!D&!C&!B&!A)|(!O&!N&K&!J&I&G&F&!E&D&C&!B&A)|(!O&N&!M&!J&!I&H&E&!D&!C&!B&!A)|(O&!N&!M&!L&!K&J&!I&H&!G&!E&D&!B)|(O&!N&!M&!L&!J&!I&H&F&!E&D&C)|(!O&!N&M&L&K&J&I&!G&!E&D&!C&B)|(!O&!N&K&!J&I&H&G&F&!E&D&C&!A)|(!O&N&M&J&!I&!F&!E&D&!C&A)|(!O&N&L&J&!I&!H&!G&!E&D&!C)|(!O&!N&M&!L&!K&J&!I&!H&!E&D&C)|(O&!N&!M&!L&!K&!J&I&!E&D&!C&B)|(!O&N&M&J&!I&!G&!E&D&!C&A)|(!O&N&!M&L&J&!F&!E&D&!C&B)|(!O&!N&!M&L&K&J&!I&!G&!F&!E&D&C)|(O&!N&!M&!L&!I&!H&G&F&!E&D&C&!B&A)|(!O&N&K&!J&I&!E&D&!C&B&A)|(O&!N&!M&!L&!J&I&G&!E&D&!C&B)|(!O&N&M&L&!I&H&G&F&!E&D&!C&B&A)|(!O&N&M&L&!J&I&G&F&!E&D&!C)|(!O&!N&K&J&!I&!G&!E&D&C&!A)|(!O&!N&M&I&!H&!G&!F&!E&D&C&!A)|(!O&N&M&!L&I&!G&!E&D&C&!B)|(!O&N&M&L&!J&!I&G&!E&D&C&A)|(!O&N&K&!J&!I&G&!E&D&C&B)|(!O&M&L&!J&!I&G&F&!E&D&C&B&A)|(!O&L&!J&I&!H&G&!E&D&C&!B&A)|(!O&N&!J&!I&H&!F&E&!D&!C&!B&!A)|(!O&N&!M&!L&!K&!J&H&!G&!F&!E&D&C)|(!O&N&!M&L&K&!J&!I&F&!E&D&C&B)|(!O&M&K&!I&H&G&F&!E&D&C&!B)|(!O&N&!M&L&I&!G&!F&!E&D&C&!A)|(!O&N&!M&!L&J&!I&!E&D&C&!A)|(!O&M&L&!I&H&F&!E&D&C&!B&A)|(!O&!N&K&!J&I&H&!G&!E&D&C&A)|(!N&!M&!K&!J&I&!H&G&F&!E&D&C&B&!A)|(!O&M&!I&H&G&F&!E&D&C&!B&A)|(!O&N&J&!H&!G&!F&!E&D&!C&B)|(!O&!N&M&L&K&J&I&!H&!F&!E&D&B&!A)|(!O&N&L&J&!I&!H&!F&!E&D&!C)|(!O&N&K&J&!I&!H&!E&D&!C&A)|(!O&M&L&K&J&!I&H&!E&D&!C&B)|(!O&N&M&K&!J&I&H&F&!E&!D)|(!O&N&M&!L&!K&H&!G&!F&!E&D&C&B&!A)|(!O&N&!L&K&I&!H&G&F&!E&D&!C&B)|(!O&N&L&!K&!J&H&!G&!F&!E&D&C&!A)|(!O&!N&!M&J&!I&!H&!G&!F&!E&D&C&A)|(!O&N&L&J&!I&!G&!E&D&!C&A)|(!O&!N&!M&L&K&J&!I&!H&!E&D&C)|(!N&!M&!L&!J&I&H&!G&!F&!E&D&C&B&!A)|(!O&!N&M&!L&J&!I&!H&!G&!E&D&C)|(!O&N&!K&!J&I&!F&!E&D&C&!B)|(!O&!N&M&L&I&!H&!G&!E&D&C&!A)|(!O&!M&L&K&!I&H&G&!E&D&C&B&!A)|(!O&N&!J&H&!G&!F&!E&D&C&B&!A)|(O&!N&!M&!L&!J&I&!H&!G&!E&D&B&A)|(!O&!N&M&L&I&!G&!E&D&C&!B&!A)|(!O&!N&!M&L&K&!J&H&G&!E&D&C&B)|(!N&!M&!L&J&!I&!H&G&!E&D&C&!B&!A)|(!N&!M&!L&J&!I&H&!G&!F&!E&D&C&!B)|(!O&N&!M&L&H&!G&!E&D&C&!B)|(!O&N&M&!K&I&!G&!F&!E&D&!C&B&A)|(!O&N&L&!J&I&H&G&!E&D&!C)|(!O&M&!J&I&H&!E&D&!C&B&A)|(!O&N&K&!J&I&H&!E&D&!C&B)|(O&!N&!M&!L&!J&H&G&!E&D&C&!B&!A)|(!O&!N&K&!J&I&!G&F&!E&D&C&B)|(!O&N&L&K&J&!I&!H&G&!E&D&!B&!A)|(O&!N&!M&!L&!J&I&!H&!E&D&C&!B)|(!O&N&!L&K&J&!F&!E&D&!C&B)|(O&!N&!M&!L&!J&!I&H&!E&D&C&B)|(!O&N&M&L&J&!I&!G&F&!E&D&!B&!A)|(!N&!M&L&!K&!J&I&H&!G&!E&D&C&!B)|(!O&N&L&J&!I&!H&!E&D&!C&A)|(!O&L&!K&J&!I&H&!G&!E&D&C&!A)|(!O&N&M&!L&!K&!H&G&!E&D&C&B&!A)|(!O&N&M&L&J&!I&!E&D&!C&A)|(O&!N&!M&!K&!J&I&H&!E&D&!C)|(!O&N&!M&L&K&I&F&!E&D&!C&B)|(!O&!M&L&K&I&!H&G&!F&!E&D&C&!B)|(!O&N&M&!L&!K&H&F&!E&D&C&!B&!A)|(!O&N&M&!I&G&F&!E&D&C&!B&A)|(!O&N&!M&L&!H&G&F&!E&D&C&!B&A)|(!O&!L&J&!I&H&!G&!F&!E&D&C&!A)|(!O&N&!M&L&I&!H&G&!E&D&B&!A)|(O&!N&!M&!L&!J&I&G&!E&D&!C&A)|(!O&N&!L&!I&!H&G&F&!E&D&C&B&!A)|(!O&N&M&L&!I&H&!G&F&!E&D&C&!A)|(!O&N&!L&I&H&!F&!E&D&!C&B&A)|(O&!N&!M&!L&!J&I&F&!E&D&!C&B)|(!O&N&!L&!K&!J&I&H&G&!E&D&B&!A)|(!O&N&!M&!J&I&!H&!F&!E&D&C)|(!O&N&M&!L&!J&!I&F&!E&D&C&B)|(!O&M&!J&!I&H&G&!E&D&C&B)|(!O&N&!J&I&F&!E&D&!C&B&A)|(!O&N&!L&K&!J&I&H&G&!E&D&!B&A)|(!O&N&!M&!L&!J&I&!H&G&!E&D&B&A)|(O&!N&!M&!L&!J&!I&H&!E&D&C&A)|(O&!N&!M&!L&!J&I&H&!G&!E&!B)|(!O&N&!L&!J&I&H&!G&F&!E&D&B&!A)|(!O&L&!J&I&H&!E&D&!C&B&A)|(O&!N&!M&!L&!J&I&!H&!E&D&C&!A)|(!O&N&!M&L&H&!E&D&C&!B&!A)|(!O&N&L&!J&I&H&!E&D&!C&B)|(!O&M&!J&!I&H&F&!E&D&C&B)|(!O&!N&!L&K&!J&I&G&!E&D&C&B)|(!O&!L&J&!I&!H&!E&D&C&!B&A)|(!O&N&M&J&!I&H&!G&!F&!E&D&!B)|(!O&!N&M&J&!H&!E&D&!C&B&A)|(!O&N&!K&I&!H&!E&D&C&!B)|(!O&!N&M&L&I&!G&!E&D&!C&B&A)|(!O&N&M&!K&!J&!I&F&!E&D&C&B)|(!O&N&M&!L&I&H&!E&D&!C&B)|(!O&N&!L&H&G&!F&!E&D&C&!B&!A)|(!O&!M&L&J&!H&!G&!E&D&C&!B)|(!O&N&!M&!I&H&G&!E&D&C&!A)|(!O&L&K&!J&I&!H&F&!E&D&C&!B)|(!O&N&M&!J&I&!H&G&!E&D&!B&A)|(!O&N&M&!J&I&!H&G&!E&D&B&!A)|(!O&!N&L&K&!J&I&!G&!E&D&C&A)|(!O&N&!J&!I&G&!E&D&C&B&A)|(!O&N&!M&L&!J&I&H&!E&D&!B&A)|(!O&N&!K&J&!H&!E&D&!C&B)|(!O&!L&!J&I&H&F&!E&D&C&!B&A)|(!O&N&!J&!I&H&!E&D&C&A)|(!O&M&L&!J&!I&H&!E&D&C&B)|(!O&N&!K&J&!H&G&!E&D&C&!B)|(!O&M&!J&I&!G&!E&D&C&!B)|(!O&!N&!J&I&H&G&!E&D&C&!B&A)|(!O&N&!K&J&!G&!E&D&C&!B&!A)|(!O&N&M&J&!I&!H&!E&D&!C)|(!O&N&M&!L&I&F&!E&D&!C&B)|(!O&N&!M&J&!G&!E&D&!C&B)|(!O&!N&M&J&!I&!E&D&C&!B)|(!O&!M&J&!I&!H&!E&D&C&B&!A)|(!O&N&!M&L&I&!E&D&!C&B&A)|(!O&M&!J&I&G&!E&D&!C&B&A)|(!O&N&I&!H&!G&!F&!E&D&C&!B)|(!O&M&L&!I&H&G&!E&D&C&!B)|(!O&N&!L&K&H&!G&!E&D&C&!B)|(!O&N&M&L&!J&I&!E&D&!C&B)|(!O&N&!L&I&!H&!E&D&C&!B)|(!O&N&L&!J&!I&G&!E&D&C&B)|(!O&N&M&!J&I&H&!E&D&!C)|(!O&!N&!K&!J&I&H&!E&D&C&B)|(!O&!N&L&!J&I&!H&!E&D&C&B)|(!O&N&!J&I&!H&!G&!E&D&C)|(!O&!N&L&!J&I&H&!E&D&C&!A)|(!O&!N&M&!L&!J&I&!E&D&C)|(!O&!L&K&J&!I&!E&D&C&!B)|(!O&!N&M&J&!I&!E&D&C&!A)|(!O&!M&L&J&!I&!E&D&C&!B)|(!O&N&!I&H&!E&D&C&!B&A)|(!O&!N&M&I&!H&!E&D&C&!B)|(!O&N&!M&I&!H&!E&D&C&!A)|(!O&M&!J&I&!E&D&C&!B&!A)|(!O&N&!M&!J&H&!E&D&C&!A)|(O&!N&!M&!L&!K&!J&!I&!H&G&F&E&!D&!C&!B&!A)|(O&!N&!M&!L&!J&!I&H&!F&E&!D&!C&!B&!A)|(O&!N&!M&!L&!J&!I&H&!G&E&!D&!C&!B&!A)|(!O&!N&!M&L&!J&I&!H&!G&E&!D&!C&!B&!A)|(!O&!N&!M&L&!K&!J&I&!H&!F&E&!D&!C&!B&!A)|(!O&!N&M&!L&!J&I&!H&!G&E&!D&!C&!B&!A)|(!O&N&!J&!I&!H&G&E&!D&!C&!B&!A)|(!O&N&!M&L&K&!J&!I&F&E&!D&!C&!B&!A)|(!O&N&!M&!L&!K&!J&I&!H&!G&!F&E&!D&!C&!B&!A)|(O&!N&!M&J&!I&!H&!G&!E&!D)|(O&!N&!M&!K&J&!I&!H&!F&!E&!D)|(O&!N&!M&!L&J&!I&!H&!E&!C)|(O&!N&!M&!J&I&H&G&!E&!D)|(O&!N&!M&!L&J&!I&!H&!E&!D)|(O&!N&!M&!L&!K&J&!I&!G&!F&!E&!D&C&B&A)|(O&!N&!M&!K&!J&I&H&F&!E&!D)|(O&!N&!M&!L&!J&I&H&!E&!D)|(O&!N&!M&J&!I&!H&!F&!E&D&!C&!B)|(O&!N&!M&J&!I&!H&!G&!E&!C&!B)|(O&!N&!M&!K&J&!I&!H&!E&D&!C&!B)|(O&!N&!M&!L&J&!I&!G&!F&!E&D&!C)|(O&!N&!M&!L&!K&J&!I&!E&D&!C&A)|(O&!N&!M&!K&J&!I&!H&!G&!E&!C&!A)|(O&!N&!M&!L&!K&J&!I&!E&D&!C&B)|(O&!N&!M&!K&!J&I&G&F&!E&D&!C)|(O&!N&!M&!J&I&H&G&!E&!C&!B)|(O&!N&!M&!J&I&H&F&!E&D&!C&!B)|(!O&N&M&L&J&!I&!H&!E&!D)|(!O&N&M&K&J&!I&!H&!F&!E&!D)|(!O&N&M&L&!J&I&H&!E&!D)|(O&!N&!M&!L&!K&!J&!I&G&!E&D&C&B)|(!O&N&M&J&!I&!H&!G&!E&!D)|(!O&N&M&J&!I&!H&!F&!E&!D&C&B&A)|(!O&N&M&K&J&!I&!H&!E&!D&C&B&A)|(!O&N&M&K&!J&I&H&!E&!D&C&B&A)|(!O&N&M&!J&I&H&G&!E&!D)|(!O&N&M&!J&I&H&F&!E&!D&C&B&A)|(!O&M&J&!I&!E&D&!C&B&A)|(!O&L&J&!I&!H&!E&D&!C&B&A)|(!O&L&K&J&!I&!E&D&!C&B&A)|(!O&L&J&!H&!G&!F&!E&D&!C&B&A)|(!O&L&J&!I&G&F&!E&D&!C&B&A)|(!O&!N&M&L&J&I&H&!G&!F&!E&D&!C&B)|(!O&N&J&!I&!E&D&!C&B);
endmodule