module prm_oblgc_chk379
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
assign edge_mask = (!O&!N&M&!L&!K&J&!I&H&G&!F&E&!D&!C&A)|(O&!N&!L&!K&J&I&!G&F&E&!D&!C&!B&!A)|(O&!N&!L&J&I&H&!G&E&!D&!C&!B&!A)|(!O&!N&M&K&J&I&!H&!F&E&!D&!C&!B&A)|(!O&!N&M&L&K&J&H&!G&!F&E&!D&!C&!B&A)|(!O&N&!M&!K&J&I&H&!G&!F&E&!D&!C&!A)|(N&!M&!L&!K&J&I&H&!G&!F&E&!D&!C&!B&!A)|(!O&N&!M&!L&!K&J&!H&G&F&E&!D&!C&!B)|(N&!M&!K&J&I&!H&G&!F&E&!D&!C&!B&!A)|(!O&N&!L&J&I&!H&E&!D&!C&!B&!A)|(!O&N&M&!J&I&H&G&F&!E&!B&!A)|(O&!N&!M&!L&J&I&G&E&!D&!C&!B&!A)|(O&!N&!K&J&!I&!G&F&!E&!D&C&B&A)|(O&!N&!K&J&!I&G&!F&!E&!D&C&B&A)|(O&!N&M&L&J&I&!G&!F&E&!D&!C&!B&!A)|(!O&N&M&L&K&J&!I&!G&!F&!E&!D&C&B)|(!O&N&!M&!L&J&!H&G&E&!D&!C&!B&!A)|(!O&N&!K&J&I&!H&E&!D&!C&!B&!A)|(O&!M&!L&!K&J&!I&H&F&!E&D&B&!A)|(!N&M&K&J&!I&H&G&F&!E&D&C&B)|(O&!M&!L&!K&J&!I&H&G&!E&D&B&!A)|(O&!N&!M&L&J&!H&!E&D&!C&B&A)|(!N&M&L&J&!I&H&G&F&!E&D&C&B)|(O&!N&!M&L&!K&J&!H&!F&!E&D&!C&B)|(!O&M&!L&J&!I&H&G&!F&!E&D&C&B&A)|(O&!N&!L&!K&J&I&!G&!F&!E&D&C)|(O&!N&!K&J&!I&G&F&!E&D&!B&!A)|(O&!N&!L&!K&J&!I&!E&D&!C)|(!O&N&M&L&K&J&I&!E&D&C&B&A)|(O&!N&!L&K&J&!I&!G&!E&!D&C&B)|(!O&N&L&K&J&I&!G&!E&D&C&B&A)|(!O&N&M&K&J&I&!F&!E&D&C&B&A)|(O&!N&!K&J&I&!G&!F&!E&D&C&!B&A)|(O&!N&!M&!L&!K&J&!I&G&!E&D&!B)|(O&!M&J&!I&H&!G&F&!E&D&!C&B&A)|(O&!N&M&!L&J&I&!G&F&E&!D&!C&!B&!A)|(!O&N&M&K&J&!H&!G&!F&!E&D&!C&B)|(O&!N&!K&J&I&!H&!G&!F&!E&D&!B&A)|(!N&M&L&K&J&I&!H&!G&!F&!E&D&C&A)|(O&!N&!M&J&I&G&!F&E&!D&!C&!B&!A)|(O&!M&!L&!K&J&!I&H&!F&!E&D&!B&A)|(O&!N&!K&J&I&H&!G&E&!D&!C&!B&!A)|(!O&N&L&K&J&!H&!G&!F&!E&D&!C&B&A)|(!O&N&L&K&J&!I&!G&!E&D&!C&A)|(!O&N&M&J&!I&!F&!E&D&!C&A)|(O&!N&M&L&!K&J&I&!H&E&!D&!C&!B&!A)|(N&!M&!K&J&I&!H&!G&!E&D&C&A)|(!O&N&L&K&J&I&!G&!F&!E&D&C&A)|(!O&N&L&K&J&I&!H&!F&!E&D&C)|(O&!M&!K&J&!I&H&!E&D&C&!B&!A)|(!O&N&L&J&I&H&!G&E&!D&!C&!B)|(!O&N&M&!L&J&I&G&!F&E&!D&!C&!B)|(!O&N&L&K&J&I&H&!F&E&!D&!C&!B)|(!O&!N&M&L&J&!I&G&F&E&!D&!C&!B)|(!O&N&M&L&K&J&!H&!G&!F&!E&D&!C&A)|(!O&N&M&L&K&J&I&G&E&!D&!C&!B&!A)|(!O&!N&M&L&J&I&!H&E&!D&!C&!B&A)|(N&!M&!L&J&I&!H&G&E&!D&!C&!B&!A)|(!O&N&J&I&!H&G&F&E&!D&!C&!B)|(!O&N&!M&!K&J&!H&G&E&!D&!C&!B&!A)|(O&!M&!L&!K&J&!I&G&F&!E&D&C&!B)|(O&!N&L&!K&J&!I&H&F&!E&D&!B)|(O&!N&!M&J&I&G&!F&!E&D&C&B&A)|(!N&M&L&K&J&!I&H&G&!E&D&C&A)|(!N&M&L&K&J&I&!H&!F&!E&D&C&B)|(O&!N&M&L&K&J&!I&H&!E&D&B&!A)|(N&!M&!L&J&I&!H&!E&D&C&B)|(!N&M&L&J&!I&H&G&!E&D&C&B&!A)|(!O&N&L&K&J&!I&!F&!E&D&!C&B)|(O&!N&!L&J&I&G&!F&E&!D&!C&!B&!A)|(O&!N&!M&!L&J&!I&G&!E&D&!B&!A)|(O&!N&!M&!K&J&!I&G&!E&D&!B&!A)|(O&!N&!M&!L&!K&J&!I&!E&D&!B&!A)|(O&!N&J&I&!H&G&F&E&!D&!C&!B&!A)|(N&!L&!K&J&I&!H&!G&!F&!E&D&C&B)|(!O&N&M&J&!I&H&G&F&!E&D&B)|(O&!M&!L&!K&J&!I&H&!G&!E&D&!B)|(N&!M&J&I&!H&!G&!F&!E&D&C&A)|(!O&N&K&J&I&H&!G&E&!D&!C&!B)|(!O&N&M&L&J&!H&!F&!E&D&!C&B&A)|(!O&N&M&!K&J&I&G&!F&E&!D&!C&!B)|(!O&N&M&!L&J&I&!G&F&E&!D&!C&!B)|(!O&N&J&I&!H&F&E&!D&!C&!B&!A)|(!O&N&M&J&!I&!H&!G&!E&!C)|(O&!N&!L&J&I&!H&!G&!E&D&B)|(O&!M&!L&!K&J&!H&G&F&!E&D&C&!B&A)|(O&!N&!L&J&!I&F&!E&D&!C)|(O&!N&!M&J&!H&!G&!E&D&!C&B)|(!O&M&!L&J&!I&H&!G&F&!E&D&C&B&A)|(!O&M&L&K&J&!I&G&F&!E&D&C&!B&A)|(O&!N&J&I&!H&!G&!E&D&!C&B&A)|(N&!M&!L&K&J&!I&H&!G&!F&!E&D&!C&B)|(N&!M&!L&K&J&I&!H&!F&!E&D&C&A)|(!O&N&!M&K&J&!I&!H&F&!E&D&B)|(O&N&!M&J&!I&H&G&!F&!E&D&B&A)|(O&!M&!L&!K&J&!I&!H&G&F&!E&D&!C)|(O&!N&!L&J&!H&!G&!F&!E&D&!C&!B&A)|(O&!N&L&J&!H&G&F&!E&D&C&!B&!A)|(O&!N&!M&J&I&!G&!F&!E&D&C&!A)|(N&!M&J&I&!H&!F&!E&D&C&B&!A)|(N&!L&!K&J&!I&H&G&!E&D&C&A)|(!O&N&L&K&J&!I&G&!F&!E&D&!B&A)|(N&!M&J&!I&H&!G&F&!E&D&C&!A)|(!O&N&K&J&!I&!H&G&!E&D&!C&B)|(N&!M&L&!K&J&I&!H&!G&!F&!E&D&C)|(!O&N&M&J&I&!H&!F&!E&D&C)|(!O&N&M&K&J&!I&!H&!F&!E&!D)|(!O&N&M&L&J&!H&!G&!E&D&!C&B)|(!O&N&L&J&!I&!H&!E&D&!C&A)|(!O&N&L&J&I&!H&!E&D&C&A)|(!O&N&L&J&I&!H&!G&!E&D&C)|(!O&N&J&I&H&!G&!F&E&!D&!C&!B)|(O&!N&!K&J&I&!H&!G&F&!E&D&B)|(O&!N&J&!I&H&G&F&!E&D&B&!A)|(O&!N&M&K&J&!I&H&!G&F&!E&D&!B)|(!N&M&L&K&J&!I&H&!E&D&C&!B&A)|(O&N&!M&!L&J&!I&H&F&!E&D&B)|(N&!M&L&!K&J&!I&H&!G&!E&D&B&!A)|(O&!M&J&I&!H&!G&F&!E&D&C&B)|(!O&N&M&!L&!K&J&!I&G&!E&D&B)|(!O&N&M&!K&J&!H&!G&F&!E&D&C&!A)|(!O&N&K&J&!I&F&!E&D&C&!B)|(!O&N&M&L&J&!H&G&F&!E&D&C&!A)|(O&!M&!K&J&!I&H&!E&D&!C&B&A)|(O&!M&!L&J&!I&H&!G&!E&D&!B&A)|(!O&N&!M&L&J&H&!G&!F&!E&D&C&B)|(O&!N&!M&J&I&!G&!E&D&C&!B&A)|(!O&N&M&L&J&!G&F&!E&D&C&!B&A)|(N&!M&!K&J&I&!H&!E&D&C&B)|(!O&N&L&J&!I&!E&D&!C&B&A)|(!O&N&L&J&!I&!G&!F&!E&D&!C&A)|(!O&N&M&J&H&!G&!F&!E&D&C&!B&A)|(!O&N&M&J&!H&!G&!E&D&!C&B&A)|(!O&N&!M&J&I&!H&E&!D&!C&!B)|(O&!N&!M&K&J&I&!H&!E&D&B&A)|(O&!N&J&I&!H&!G&!F&!E&D&B&!A)|(O&!N&J&I&!H&!F&!E&D&!C&B&A)|(!O&N&M&!L&J&!I&!H&!G&!E&!B)|(O&!N&!M&J&!H&!G&!F&!E&D&!C&A)|(!O&N&M&!K&J&!I&G&!E&D&B&!A)|(!N&M&L&J&I&!H&!G&!E&D&C&B)|(O&N&!M&!L&J&!I&H&!E&D&B&!A)|(!O&N&M&!L&K&J&!I&H&G&!E&D)|(!O&N&!M&L&J&!I&!G&F&!E&D&B)|(O&!N&J&!I&H&!F&!E&D&!C)|(!O&N&!L&!K&J&!I&H&!G&!E&D&C)|(!O&N&M&K&J&!H&!E&D&C&!B&!A)|(!O&N&!M&L&J&!I&!H&!E&D&B&!A)|(!O&N&!L&J&!I&!H&G&!E&D&C&!A)|(!O&N&!M&L&K&J&!I&!H&!E&D&!B)|(!O&N&M&J&I&!G&!E&D&C&B)|(!O&N&M&L&J&!I&!E&D&!C)|(!O&N&!M&J&!I&G&!E&D&C&A)|(!O&N&M&J&!H&G&!E&D&C&!B&A)|(!O&N&J&I&!H&!G&!E&D&C&A)|(!O&N&M&!L&J&!I&!H&!G&!E&!A)|(O&!N&J&I&H&!G&!E&D&C&B)|(O&!N&J&I&!H&G&!E&D&C)|(O&!N&J&!I&H&G&!E&D&!B&A)|(O&!N&J&!I&H&!E&D&C&!B&!A)|(O&!M&!L&J&!I&H&!E&D&C&!B)|(!O&N&!M&K&J&!I&H&!E&D&C)|(N&!M&L&J&!I&H&G&!E&D&C)|(!O&N&L&!K&J&!I&!E&D&C&!B)|(!O&N&M&J&!I&H&!E&D&C&!A)|(!O&N&M&J&!I&!H&!E&D&!C)|(!O&N&M&L&J&!I&!H&!E&!D)|(O&!N&!L&J&!I&!E&D&!C&!A)|(O&!N&J&!I&H&!E&D&!C&B)|(O&!N&!M&J&!I&!E&D&!C)|(O&!N&J&!I&!H&G&!E&D&!C)|(O&!N&J&I&!H&!E&D&C&!B)|(!O&N&J&I&!H&!E&D&C&B)|(!O&N&M&J&!I&!G&!E&D&!C)|(O&!N&!M&!L&J&I&H&G&!F&E&!D&!C&!B)|(!O&!N&M&J&I&!H&!G&E&!D&!C&!B&A)|(O&!N&!M&!L&J&I&H&!G&F&E&!D&!C&!B)|(O&!N&!M&!L&!J&I&H&!E&!D)|(O&!N&!M&!K&J&I&H&G&!F&E&!D&!C&!B)|(!O&!N&M&K&J&I&!H&!G&E&!D&!C&!A)|(!O&!N&M&L&K&J&I&!H&E&!D&!C&!A)|(O&!N&!M&!K&J&I&H&!G&F&E&!D&!C&!B)|(O&!N&!M&!J&I&H&G&!E&!D)|(!O&!N&M&J&I&!H&!G&!F&E&!D&!C&B&!A)|(!O&!N&M&L&J&I&!H&!F&E&!D&!C&!A)|(!O&!N&M&L&J&I&!H&!G&E&!D&!C&!A)|(O&!N&!M&!K&!J&I&H&F&!E&!D)|(!O&N&!M&!L&J&I&!H&E&!D&!C&!A)|(O&!N&!M&J&I&H&!G&E&!D&!C&!B&!A)|(!O&N&M&!J&I&H&G&!E&!D)|(!O&N&!M&!L&J&I&!G&!F&E&!D&!C&!A)|(!O&N&!M&L&J&I&H&!G&F&E&!D&!C&!A)|(!O&N&M&K&!J&I&H&F&!E&!D)|(!O&N&M&L&!J&I&H&!E&!D)|(!O&!N&M&L&!K&J&!I&G&F&E&!D&!C&!A)|(!O&!N&L&K&J&!I&H&G&E&!D&!C&!B&A)|(!O&!N&M&J&!I&H&G&E&!D&!C&!B&A)|(!O&!N&L&K&J&!I&H&G&E&!D&!C&B&!A)|(!O&!N&M&J&!I&H&G&E&!D&!C&B&!A)|(!O&!N&M&K&J&!I&H&E&!D&!C&!B)|(!O&!N&M&L&J&!I&H&E&!D&!C&!B)|(!O&!N&M&K&J&!I&H&F&E&!D&!C&!A)|(!O&N&!M&!L&J&!I&H&E&!D&!C&!B)|(!O&!N&M&L&J&!I&H&E&!D&!C&!A)|(!O&N&!M&!K&J&!I&H&G&E&!D&!C&!B)|(!O&N&!M&!L&!K&J&!I&H&G&E&!D&!C&!A)|(!O&N&!M&J&!I&H&E&!D&!C&!B&!A)|(!O&N&!L&!K&J&!I&H&G&E&!D&!C&!B&!A)|(O&!N&!M&!L&!K&!J&I&H&G&!E&!C)|(O&!N&!M&!K&!J&I&H&G&F&!E&!C)|(O&!N&!M&!L&!J&I&H&!E&!C&!B)|(O&!N&!M&!J&I&H&G&!E&!C&!B)|(O&!N&!M&!L&!J&I&H&!E&!C&!A)|(O&!N&!M&!J&I&H&F&!E&D&!C&!B&A)|(O&!N&!M&!J&I&H&G&F&!E&!C&!A)|(O&!N&!M&!K&!J&I&H&G&!E&!C&!A)|(O&!N&!M&!K&!J&I&H&F&!E&!C&!A)|(!O&N&L&K&!J&I&H&G&F&!E&D&!C)|(!O&N&M&!J&I&H&G&F&!E&!C)|(!O&N&!M&L&K&!J&I&H&G&F&!E&D&!B)|(!O&N&M&K&!J&I&H&G&!E&!C)|(!O&N&M&!L&K&!J&I&H&G&!E&!B)|(!O&N&!M&L&K&!J&I&H&G&F&!E&D&!A)|(!O&N&M&!K&!J&I&H&G&F&!E&!B)|(!O&N&M&!L&!K&!J&I&H&G&F&!E&!A)|(!O&N&M&!J&I&H&G&!E&!C&!B)|(!O&N&M&L&!J&I&H&G&!E&!C)|(!O&N&M&L&!J&I&H&F&!E&!C)|(!O&N&M&K&!J&I&H&F&!E&!C&!B)|(!O&N&M&!J&I&H&G&!E&!C&!A)|(!O&N&M&K&!J&I&H&F&!E&!C&!A)|(!O&N&M&L&!J&I&H&!E&!C&!B)|(!O&N&M&L&!K&!J&I&H&G&!E&!B&!A)|(!O&N&M&L&K&!J&I&H&!E&!C&!A)|(O&!N&!M&!L&J&!I&!H&!E&!D)|(O&!N&!M&J&!I&!E&!D&C&B&A)|(O&!N&J&!I&!H&G&!E&!D&C&B)|(O&!N&M&!L&J&!I&!G&!E&!D&C&B)|(O&!N&!M&!K&J&!I&!H&!F&!E&!D)|(O&!N&!M&J&!I&!H&!G&!E&!D)|(O&!N&!K&J&!I&!H&F&!E&!D&C&B)|(O&!N&!L&J&!I&!F&!E&!D&C&B&A)|(!O&N&M&J&!I&!H&!E&!D&C&B&A)|(O&!N&!K&J&!I&H&!G&!F&!E&!D&C&B)|(O&!N&!M&L&J&!I&!F&!E&!D&C&B)|(O&!N&M&!L&!K&J&!I&!F&!E&!D&C&B)|(O&!N&J&!I&H&!G&!F&!E&!D&C&B&A)|(O&!N&!M&L&J&!I&!G&!E&!D&C&B)|(!O&N&M&K&J&!I&!G&!F&!E&!D&C&B&A)|(!O&N&M&L&K&J&!I&!F&!E&!D&C&B&A)|(!O&N&M&L&J&!I&!G&!E&!D&C&B&A)|(O&!N&!M&!L&J&I&!E&D&C&B&A)|(O&!N&!L&J&I&!F&!E&D&C&B&A)|(O&!M&!L&!K&J&I&!H&!G&!E&D&B&A)|(O&!M&!L&J&I&!H&!G&!E&D&C)|(O&!M&!L&J&I&!H&!G&!F&!E&D&B&A)|(O&!N&!L&J&I&!G&!F&!E&D&C&A)|(O&!M&!L&!K&J&I&!H&!F&!E&D&C)|(O&!M&!L&J&I&!G&!F&!E&D&C&B)|(O&!M&!L&!K&J&I&!H&!G&!F&!E&D&B)|(!O&N&M&L&J&I&!F&!E&D&C&B&A)|(!O&!N&M&L&J&!I&G&F&!E&D&C&B)|(O&!N&!K&J&!I&F&!E&D&!C)|(!O&!N&M&K&J&!I&H&!E&D&C&B)|(!O&!N&M&L&J&!I&H&!E&D&C&B)|(N&!M&J&!I&H&!E&D&C&!B&A)|(N&!L&!K&J&!I&H&G&!E&D&C&B);
endmodule