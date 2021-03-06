// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .

function entryChange() {
  radio = document.getElementsByName('order[shipping]')

  if(radio[0].checked) {
    document.getElementById('my_address').style.display = "";
    document.getElementById('registered_address').style.display = "none";
    document.getElementById('new_address').style.display = "none";

  }else if(radio[1].checked) {
    document.getElementById('my_address').style.display = "none";
    document.getElementById('registered_address').style.display = "";
    document.getElementById('new_address').style.display = "none";

  }else if (radio[2].checked) {
    document.getElementById('my_address').style.display = "none";
    document.getElementById('registered_address').style.display = "none";
    document.getElementById('new_address').style.display = "";
  }
}

$(document).ready(function () {
  $(".top-images").skippr({
    // スライドショーの変化（"fade" or "slide"）
    transition : 'fade',
    // 変化にかかる時間（ミリ秒）
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形（"block" or "bubble"）
    navType : 'block',
    // 子要素の種類（"div" or "img"）
    childrenElementType : 'div',
    // ナビゲーション矢印の表示（trueで表示）
    arrows : true,
    // スライドショーの自動再生（falseで自動再生なし）
    autoPlay : true,
    // 自動再生時のスライド切替間隔（ミリ秒）
    autoPlayDuration : 5000,
    // キーボードの矢印キーによるスライド送りの設定（trueで有効）
    keyboardOnAlways : true,
    // 1枚目のスライド表示時に戻る矢印を表示するかどうか [false]:矢印を隠さない [true]:矢印を隠す
    hidePrevious : false
  });
});

$(document).ready(function () {
  $('.nav-link').mouseover(function(){
    $(this).css({
      'background-color': '#7b5115',
      'color': '#fff',
      'border-radius': '20px'
    });
  });
  $('.nav-link').mouseout(function(){
    $(this).css({'background-color': '#f9d2a1', 'color': '#7b5115'});
  });
});

$(document).ready(function () {
  $('.signup-btn').mouseover(function(){
    $(this).css({'background-color': '#ad6f00'
    });
  });
  $('.signup-btn').mouseout(function(){
    $(this).css({'background-color': '#d68a00'
    });
  });

  $('.login-btn').mouseover(function(){
    $(this).css({'background-color': '#ad6f00'
    });
  });
  $('.login-btn').mouseout(function(){
    $(this).css({'background-color': '#d68a00'
    });
  });

  $('.address-register').mouseover(function(){
    $(this).css({'background-color': '#ad6f00'
    });
  });
  $('.address-register').mouseout(function(){
    $(this).css({'background-color': '#d68a00'
    });
  });

  $('.address-edit-btn').mouseover(function(){
    $(this).css({'background-color': '#ad6f00'
    });
  });
  $('.address-edit-btn').mouseout(function(){
    $(this).css({'background-color': '#d68a00'
    });
  });

  $('.product-show-already').mouseover(function(){
    $(this).css({'background-color': '#ad6f00'
    });
  });
  $('.product-show-already').mouseout(function(){
    $(this).css({'background-color': '#d68a00'
    });
  });

  $('.product-show-notyet').mouseover(function(){
    $(this).css({'background-color': '#ad6f00'
    });
  });
  $('.product-show-notyet').mouseout(function(){
    $(this).css({'background-color': '#d68a00'
    });
  });

  $('.order-new-btn').mouseover(function(){
    $(this).css({'background-color': '#ad6f00'
    });
  });
  $('.order-new-btn').mouseout(function(){
    $(this).css({'background-color': '#d68a00'
    });
  });

  $('.order-confirm-btn').mouseover(function(){
    $(this).css({'background-color': '#ad6f00'
    });
  });
  $('.order-confirm-btn').mouseout(function(){
    $(this).css({'background-color': '#d68a00'
    });
  });
});

// 画像プレビュー機能
$(function(){
    $('#product_image').on('change', function (e) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $(".image").attr('src', e.target.result);
      }
      reader.readAsDataURL(e.target.files[0]);
    });
  });