unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB,Xml.XMLDoc,Xml.XMLIntf;

type
  TForm3 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
var
    XMLDoc: TXMLDocument;
    OrdersNode, OrderNode, ProductNode: IXMLNode;
    OrderId, CustomerName, OrderTotal: string;
begin
   XMLDoc:=TXMLDocument.Create(Self);

     XMLDoc.LoadFromFile('C:\Users\hp\Desktop\yemeksepeti1.xml');

      OrdersNode := XMLDoc.DocumentElement;

      OrderNode := OrdersNode.ChildNodes.First;       //ilk alt düðümü alýr.


    while Assigned(OrderNode) do
  begin
    // Get data from the order node
    OrderId := OrderNode.Attributes['Id'];
    CustomerName := OrderNode.Attributes['CustomerName'];
    OrderTotal := OrderNode.Attributes['OrderTotal'];



     ADOQuery1.SQL.Clear;
     ADOQuery1.SQL.Text := 'INSERT INTO son (OrderID, CustomerName,Price) ' +
                          'VALUES (:OrderId, :CustomerName, :OrderTotal)';
    ADOQuery1.Parameters.ParamByName('OrderId').Value := OrderNode.Attributes['Id'];
    ADOQuery1.Parameters.ParamByName('CustomerName').Value := OrderNode.Attributes['CustomerName'];
    ADOQuery1.Parameters.ParamByName('OrderTotal').Value := (OrderNode.Attributes['OrderTotal']);
    ADOQuery1.ExecSQL;



    // Move to the next order node
    OrderNode := OrderNode.NextSibling;

  end;
      ShowMessage('Tabloya Eklendi.');

  end;




end.
