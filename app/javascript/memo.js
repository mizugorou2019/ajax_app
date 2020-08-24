function memo() {
  // 送信ボタンのDOMを取得する
 const submit = document.getElementById("submit")
  // クリック時のイベントを定義
  submit.addEventListener("click", (e) => {
    // リクエストを送信する記述1
    const formData = new FormData(document.getElementById("form"));
    // XMLHttpRequestを定義する
    const XHR = new XMLHttpRequest ();
    // XMLHttpRequestを初期化する記述
    XHR.open("POST", "/posts", true);
    // レスポンスの形式を定義する
    XHR.responseType = "json";
    // リクエストを送信する記述2
    XHR.send(formData);

   XHR.onload = () => {
     if (XHR.status != 200) {
       alert(`Error ${XHR.status}: ${XHR.statusText}`);
       return null;
     }
     const item = XHR.response.post;
     const list = document.getElementById("list");
     const formText = document.getElementById("content");
     const HTML = `
       <div class="post" data-id=${item.id}>
         <div class="post-date">
           投稿日時：${item.created_at}
         </div>
         <div class="post-content">
         ${item.content}
         </div>
       </div>`;
     list.insertAdjacentHTML("afterend", HTML);
     formText.value = "";
   };
   e.preventDefault();
 });
}

window.addEventListener("load", memo);