pageextension 81501 "SMT Sales Order" extends "Sales Order" //42
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
                    CurrPage.Summernote.InitializeSummerNote(NewData);

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
        CurrPage.Summernote.InitializeSummerNote(NewData);
        if CurrPage.Editable then
            CurrPage.Summernote.Enable()
        else
            CurrPage.Summernote.Disable();
    end;



    var
        NewData: Text;
}
