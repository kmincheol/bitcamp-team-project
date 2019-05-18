<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="${contextRootPath}/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.css" rel="stylesheet">
  <title>게시글 등록</title>
</head>
<body>


이름: <input id='name' type='text'><br>
나이: <input id='age' type='text'><br>
사진: <input id="fileupload" type="file" name="files" multiple><br>
<button id='upload-btn' type='button'>등록</button>
<div id='images-div'></div>
<br>
<br>
<div class="container">
  <h1>새 글</h1>

  <div>
    <textarea id="summernote" name='contents' rows="10" cols="10"></textarea>
  </div>

  <div class="form-group row">
    <div class="col-sm-10">
      <button class="btn btn-primary">등록</button>
      <a class="btn btn-primary" href='.'>목록</a> 
    </div>
  </div>
</div><!-- .container -->
<script src="${contextRootPath}/node_modules/jquery/dist/jquery.min.js"></script> 
<script src="${contextRootPath}/node_modules/popper.js/dist/umd/popper.min.js"></script>
<script src="${contextRootPath}/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-load-image/js/load-image.all.min.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-canvas-to-blob/js/canvas-to-blob.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload.js"></script>
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload-process.js"></script> 
<script src="${contextRootPath}/node_modules/blueimp-file-upload/js/jquery.fileupload-image.js"></script>  
<script src="${contextRootPath}/node_modules/summernote/dist/summernote-bs4.js"></script>
<script>
"use strict"

  $(document).ready(function() {
    $('#summernote').summernote();
  });
  
  $('#fileupload').fileupload({
    url: 'upload.jsp',        // 서버에 요청할 URL
    dataType: 'json',         // 서버가 보낸 응답이 JSON임을 지정하기
    sequentialUploads: true,  // 여러 개의 파일을 업로드 할 때 순서대로 요청하기.
    singleFileUploads: false, // 한 요청에 여러 개의 파일을 전송시키기.
    autoUpload: false,        // 파일을 추가할 때 자동 업로딩 하지 않도록 설정.
    disableImageResize: /Android(?!.*Chrome)|Opera/
          .test(window.navigator && navigator.userAgent), // 안드로이드와 오페라 브라우저는 크기 조정 비활성 시키기
    previewMaxWidth: 100,   // 미리보기 이미지 너비
    previewMaxHeight: 100,  // 미리보기 이미지 높이 
    previewCrop: true,      // 미리보기 이미지를 출력할 때 원본에서 지정된 크기로 자르기
    processalways: function(e, data) { //Callback for the end (done or fail) of an individual file processing queue.
        console.log('fileuploadprocessalways()...');
        console.log(data.files);
        var imagesDiv = $('#images-div');
        imagesDiv.html("");
        for (var i = 0; i < data.files.length; i++) {
          try {
            if (data.files[i].preview.toDataURL) {
              // Base64로 바이너리 데이터를 텍스트로 변환해서 추가
              console.log(data.files[i].preview.toDataURL());
              $("<img>")
              .attr('src', data.files[i]
                .preview.toDataURL())
                .css('width', '100px')
                .appendTo(imagesDiv);
            }
          } catch (err) {
          }
        }
        $('#upload-btn').unbind("click");
        $('#upload-btn').click(function() {
            data.submit();
        });
    }, 
    submit: function (e, data) { // 서버에 전송하기 직전에 호출된다.
      console.log('submit()...');
      data.formData = {
          name: $('#name').val(),
          age: $('#age').val()
      };
    }, 
    done: function (e, data) { // 서버에서 응답이 오면 호출된다. 각 파일 별로 호출된다.
      console.log('done()...');
      console.log(data.result);
      $('<p/>').text("name : " + data.result.name).appendTo(document.body);
      $('<p/>').text("age : " + data.result.age).appendTo(document.body);
      $.each(data.result.files, function(index, file) {
        $('<p/>').text(file.filename + " : " + file.filesize).appendTo(document.body);
      });
    }
  });
</script>
</body>
</html>
