!function(e){var o={};function t(n){if(o[n])return o[n].exports;var r=o[n]={i:n,l:!1,exports:{}};return e[n].call(r.exports,r,r.exports,t),r.l=!0,r.exports}t.m=e,t.c=o,t.d=function(e,o,n){t.o(e,o)||Object.defineProperty(e,o,{configurable:!1,enumerable:!0,get:n})},t.r=function(e){Object.defineProperty(e,"__esModule",{value:!0})},t.n=function(e){var o=e&&e.__esModule?function(){return e.default}:function(){return e};return t.d(o,"a",o),o},t.o=function(e,o){return Object.prototype.hasOwnProperty.call(e,o)},t.p="/js/",t(t.s=2)}([function(e,o){function t(e){this.$el=e,this.setupEasel()}window._randomColorString=function(){return"#"+Math.random().toString(16).substr(-6)},t.prototype.exercise0=function(){$("li").removeClass("square")},t.prototype.exercise1=function(){$("li").addClass("orange")},t.prototype.exercise2=function(){$("li").remove()},t.prototype.exercise3=function(){const e=$("<h1></h1>");e.text("i love jquery"),$("body").append(e)},t.prototype.exercise4=function(){$("li:nth-child(2n)").each((e,o)=>{$(o).text("Ian")})},t.prototype.exercise5=function(){$("li").each((e,o)=>{$(o).on("click",e=>{e.preventDefault(),alert($(o).data("pos"))})})},t.prototype.exercise6=function(){$("li").each((e,o)=>{$(o).css("background-color",window._randomColorString())})},t.prototype.exercise7=function(){$("li").each((e,o)=>{$(o).on("mouseenter",e=>{console.log($(o).css("background-color"))})})},t.prototype.setupEasel=function(){const e=$("<button>").html("Add a row");this.$el.append(e),e.on("click",this.addRow.bind(this));for(let e=0;e<=7;e++){const o=$("<button>").html("Exercise "+e);o.on("click",this["exercise"+e]),this.$el.append(o)}for(let e=0;e<20;e++)this.addRow()},t.prototype.addRow=function(){const e=this.$el.find(".row").length,o=$("<ul>").addClass("row").addClass("group");for(let t=0;t<20;t++){const n=$("<li>").addClass("square").attr("data-pos",[e,t]);n.on("mouseenter",e=>{$(e.currentTarget).css("background-color",window._randomColorString())}),o.append(n)}this.$el.append(o)},e.exports=t},function(e,o,t){var n=t(0);$(function(){var e=$("#easel");new n(e)})},function(e,o,t){e.exports=t(1)}]);
//# sourceMappingURL=bundle.js.map