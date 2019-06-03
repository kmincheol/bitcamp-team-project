var l = function(e){
  function t(e,r){
    var n=arguments.length>2&&void 0!==arguments[2]?arguments[2]:[],
        o=arguments.length>3&&void 0!==arguments[3]?arguments[3]:null;
        !function(e,t){
          if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(this,t);
          var i=function(e,t){
            if(!e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
            return!t||"object"!=typeof t&&"function"!=typeof t?e:t}
          (this,(t.__proto__||Object.getPrototypeOf(t)).call(this,e,r,n,o));return i.group=e,i.name=r,i}
  return function(e,t){
    if("function"!=typeof t&&null!==t)
      throw new TypeError("Super expression must either be null or a function, not "+typeof t);
    e.prototype=Object.create(t&&t.prototype,{
      constructor:{value:e,enumerable:!1,writable:!0,configurable:!0}}),
      t&&(Object.setPrototypeOf?Object.setPrototypeOf(e,t):e.__proto__=t)}(t,a.default),
      o(t,[{key:"addControl",value:function(e){var r=this,n=function e(t,r,n){
        null===t&&(t=Function.prototype);
        var o=Object.getOwnPropertyDescriptor(t,r);
        if(void 0===o){var i=Object.getPrototypeOf(t);
        return null===i?void 0:e(i,r,n)}if("value"in o)return o.value;var a=o.get;
        return void 0!==a?a.call(n):void 0}(
            t.prototype.__proto__||Object.getPrototypeOf(t.prototype),"addControl",this)
            .call(this,e);
        if(n.id){var o=this.deepLinkParams.find(
            function(e){return e.key===n.id});o&&(n.text=o.value,n.element.value=o.value)}
        if(n.element.addEventListener("keyup",function(e){
          e.preventDefault(),n.text=e.target.value,r.textChanged(n)}),
          n.clearButtonID=(n.element.getAttribute("data-clear-btn-id")||"").trim(),n.clearButtonID){
          var i=document.getElementById(n.clearButtonID);
        }
      }
      }
}