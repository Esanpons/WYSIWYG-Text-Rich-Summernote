pageextension 62000 "Esanpons Sales Order" extends "Sales Order"
{

    layout
    {
        addafter(General)
        {
            usercontrol(Summernote; "SummerNote")
            {
                ApplicationArea = All;
                trigger ControlAddinReady()
                begin
                    NewData := Rec.GetWorkDescription();
                    CurrPage.Summernote.AddNewSummerNote(NewData, false);

                end;

                trigger OnChange(Data: Text)
                begin
                    NewData := Data;
                    Rec.SetWorkDescription(NewData);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        NewData := '';
        NewData := Rec.GetWorkDescription();
        CurrPage.Summernote.SetData(NewData);
        if CurrPage.Editable then
            CurrPage.Summernote.Enable()
        else
            CurrPage.Summernote.Disable();
    end;



    var
        NewData: Text;
}
