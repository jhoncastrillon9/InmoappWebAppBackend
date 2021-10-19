
  ALTER TABLE [CodeMono].[User]
  ADD CompanyId Int Not null References Companies.Company([CompayId]) 