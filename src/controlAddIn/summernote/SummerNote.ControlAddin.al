//https://summernote.org/

controladdin "SummerNote"
{


    Scripts =
        'https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js', //https://docs.microsoft.com/en-us/aspnet/ajax/cdn/overview
        'https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote.min.js', //https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/
        'https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-es-ES.js', //https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/
        'https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.5/umd/popper.min.js',   //este revisar en la ultima version cual estan utilizando antes de actualizar
        'https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js', //este revisar en la ultima version cual estan utilizando antes de actualizar
        'src/controlAddIn/summernote/script/ScriptsDescription.js',
        'src/controlAddIn/summernote/script/ScriptsComments.js';

    StyleSheets =
         'https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css', //https://www.bootstrapcdn.com/
         'https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote.min.css'; //https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/

    StartupScript =
        'src/controlAddIn/summernote/script/Startup.js';



    RequestedHeight = 300;
    MinimumHeight = 1;
    HorizontalStretch = true;

    event ControlAddInReady();

    event Mention(UserMention: JsonObject);

    //funciones y eventos para la parte del Description
    procedure AddNewSummerNoteDescription(Data: Text; JsonMention: JsonArray);
    procedure DisableDescription();
    procedure EnableDescription();
    procedure DestroyDescription();
    procedure GetDataDescription(Data: Text);
    procedure SetDataDescription(Data: Text);
    event OnChangeDescription(Data: Text);


    //funciones y eventos para la parte de Comments
    procedure InitHtmlComments();
    procedure AddNewSummerNoteComments(Data: Text);
    procedure FinishHtmlComments();
    event OnChangeComments(Data: Text);

}