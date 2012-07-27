$(document).ready(function() {
  
  var editing, converter;
  editing = true;
  converter = new Markdown.Converter();

  var hideTextFieldShowPreview = function() {
    var el, text;
    // reference the element 
    el = $('#mde-textarea');
    // get the text
    text = el.val(); 
    $('#mde-previewarea').show();
    $('#mde-preview').unbind('click'); 
    //append an anchor to the form field..
    // hide the textarea
    $('#mde-textarea').hide();
    $('#mde-previewarea').html(converter.makeHtml(text));
    // turn the preview button into an edit button
    $('#mde-preview').attr('id', 'mde-edit');
    $('#mde-edit').bind('click', hidePreviewShowTextField);
  }
  
  var hidePreviewShowTextField = function() {
    var el, text;
    el = $('#mde-previewarea').hide();
    $('#mde-textarea').show();
    $('#mde-edit').attr('id', 'mde-preview');
    $('#mde-preview').bind('click', hideTextFieldShowPreview);
  }
  $('#mde-preview').bind('click', hideTextFieldShowPreview);


});

