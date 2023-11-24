object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog=xml_db;Data Source=DESKTOP' +
      '-9VTPEG5\SQLEXPRESS;Initial File Name="";Server SPN="";Authentic' +
      'ation="";Access Token=""'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 152
    Top = 120
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 256
    Top = 120
  end
  object ADOTable1: TADOTable
    Left = 256
    Top = 184
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 336
    Top = 128
  end
end
