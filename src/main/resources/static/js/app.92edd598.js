(function(t){function s(s){for(var r,o,a=s[0],c=s[1],l=s[2],d=0,v=[];d<a.length;d++)o=a[d],Object.prototype.hasOwnProperty.call(n,o)&&n[o]&&v.push(n[o][0]),n[o]=0;for(r in c)Object.prototype.hasOwnProperty.call(c,r)&&(t[r]=c[r]);u&&u(s);while(v.length)v.shift()();return i.push.apply(i,l||[]),e()}function e(){for(var t,s=0;s<i.length;s++){for(var e=i[s],r=!0,a=1;a<e.length;a++){var c=e[a];0!==n[c]&&(r=!1)}r&&(i.splice(s--,1),t=o(o.s=e[0]))}return t}var r={},n={app:0},i=[];function o(s){if(r[s])return r[s].exports;var e=r[s]={i:s,l:!1,exports:{}};return t[s].call(e.exports,e,e.exports,o),e.l=!0,e.exports}o.m=t,o.c=r,o.d=function(t,s,e){o.o(t,s)||Object.defineProperty(t,s,{enumerable:!0,get:e})},o.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},o.t=function(t,s){if(1&s&&(t=o(t)),8&s)return t;if(4&s&&"object"===typeof t&&t&&t.__esModule)return t;var e=Object.create(null);if(o.r(e),Object.defineProperty(e,"default",{enumerable:!0,value:t}),2&s&&"string"!=typeof t)for(var r in t)o.d(e,r,function(s){return t[s]}.bind(null,r));return e},o.n=function(t){var s=t&&t.__esModule?function(){return t["default"]}:function(){return t};return o.d(s,"a",s),s},o.o=function(t,s){return Object.prototype.hasOwnProperty.call(t,s)},o.p="/";var a=window["webpackJsonp"]=window["webpackJsonp"]||[],c=a.push.bind(a);a.push=s,a=a.slice();for(var l=0;l<a.length;l++)s(a[l]);var u=c;i.push([0,"chunk-vendors"]),e()})({0:function(t,s,e){t.exports=e("56d7")},"034f":function(t,s,e){"use strict";var r=e("85ec"),n=e.n(r);n.a},"56d7":function(t,s,e){"use strict";e.r(s);e("e260"),e("e6cf"),e("cca6"),e("a79d");var r=e("2b0e"),n=function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",{attrs:{id:"app"}},[e("router-view"),e("quiz-score")],1)},i=[],o=function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",[e("div",[t._v("QuizMain")]),e("h1",[t._v("먹거리 쿠이이이이이즈~!")]),e("p",{staticClass:"lead"},[t._v(" 가공식품들에 대한 퀴즈를 풀며 (사실 별 쓸데없는) 지식을 쌓고 다른 사람들과 실시간 경쟁을 해보세요! ")]),e("button",{staticClass:"btn btn-primary btn-lg btn-block",attrs:{type:"button"},on:{click:function(s){return t.GoQuiz()}}},[t._v(" 게임 시작하기 ")])])},a=[],c={name:"addBulletin",created:function(){this.$store.state.score=0,this.$store.state.solvedCnt=0,this.$store.state.level=1,this.$store.state.quizNo=[]},computed:{id:function(){return this.$store.state.id}},data:function(){return{bulletin:{uid:this.$store.state.id}}},methods:{GoQuiz:function(){this.$router.push("/quiz")}}},l=c,u=e("2877"),d=Object(u["a"])(l,o,a,!1,null,"96514280",null),v=d.exports,h=function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",[e("br"),e("br"),e("div",[t._v("Quiz")]),e("div",{staticClass:"progress"},[e("div",{staticClass:"progress-bar progress-bar-striped progress-bar-animated",class:{"bg-warning":t.warning,"bg-danger":t.danger},style:{width:t.myWidth},attrs:{id:"progressBar",role:"progressbar","aria-valuenow":t.progress,"aria-valuemin":"0","aria-valuemax":"100"}})]),e("div",{staticClass:"container"},[e("div",{staticClass:"row"},[e("div",{staticClass:"col-sm"},[t._v("사용자 "+t._s(t.id))]),e("div",{staticClass:"col-sm"},[t._v("현재 레벨 "+t._s(t.level))]),e("div",{staticClass:"col-sm"},[t._v("맞춘 개수 "+t._s(t.solvedCnt))]),e("div",{staticClass:"col-sm"},[t._v(" 최고 점수 "+t._s(t.bestScore)+" "),e("br"),t._v(" 현재 점수 "+t._s(t.score)+" ")])])]),e("br"),e("br"),1==t.correct?e("div",[e("h2",[t._v("정답!!!")])]):t._e(),0==t.correct?e("div",[e("h2",[t._v(".")])]):t._e(),e("div",{staticClass:"container"},[e("div",{staticClass:"row"},[e("div",{staticClass:"col-sm-9"},[e("div",{domProps:{innerHTML:t._s(t.quiz.question)}}),1==t.possible?[2==t.quiz.answer_cnt?e("div",{staticClass:"row"},[e("div",{staticClass:"col-8 col-sm-6 alert alert-dark",attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans1)},on:{click:function(s){return t.isAnswer(1)}}}),t._v(" "),e("div",{staticClass:"col-4 col-sm-6 alert alert-dark",attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans2)},on:{click:function(s){return t.isAnswer(2)}}})]):t._e(),3==t.quiz.answer_cnt?e("div",{staticClass:"row"},[e("div",{staticClass:"col-6 col-md-4 alert alert-dark",attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans1)},on:{click:function(s){return t.isAnswer(1)}}}),t._v(" "),e("div",{staticClass:"col-6 col-md-4 alert alert-dark",attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans2)},on:{click:function(s){return t.isAnswer(2)}}}),t._v(" "),e("div",{staticClass:"col-6 col-md-4 alert alert-dark",attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans3)},on:{click:function(s){return t.isAnswer(3)}}})]):t._e(),4==t.quiz.answer_cnt?e("div",{staticClass:"row"},[e("div",{staticClass:"col-8 col-sm-6 alert alert-dark",attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans1)},on:{click:function(s){return t.isAnswer(1)}}}),t._v(" "),e("div",{staticClass:"col-4 col-sm-6 alert alert-dark",attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans2)},on:{click:function(s){return t.isAnswer(2)}}})]):t._e(),4==t.quiz.answer_cnt?e("div",{staticClass:"row"},[e("div",{staticClass:"cl-8 col-sm-6 alert alert-dark",attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans3)},on:{click:function(s){return t.isAnswer(3)}}}),t._v(" "),e("div",{staticClass:"col-4 col-sm-6 alert alert-dark",attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans4)},on:{click:function(s){return t.isAnswer(4)}}})]):t._e()]:t._e(),0==t.possible?[2==t.quiz.answer_cnt?e("div",{staticClass:"row"},[e("div",{staticClass:"col-8 col-sm-6 alert",class:{"alert-dark":t.notAnswer(1),"alert-success":t.thisAnswer(1)},attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans1)}}),t._v(" "),e("div",{staticClass:"col-4 col-sm-6 alert",class:{"alert-dark":t.notAnswer(2),"alert-success":t.thisAnswer(2)},attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans2)}})]):t._e(),3==t.quiz.answer_cnt?e("div",{staticClass:"row"},[e("div",{staticClass:"col-6 col-md-4 alert",class:{"alert-dark":t.notAnswer(1),"alert-success":t.thisAnswer(1)},attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans1)}}),t._v(" "),e("div",{staticClass:"col-6 col-md-4 alert",class:{"alert-dark":t.notAnswer(2),"alert-success":t.thisAnswer(2)},attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans2)}}),t._v(" "),e("div",{staticClass:"col-6 col-md-4 alert",class:{"alert-dark":t.notAnswer(3),"alert-success":t.thisAnswer(3)},attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans3)}})]):t._e(),4==t.quiz.answer_cnt?e("div",{staticClass:"row"},[e("div",{staticClass:"col-8 col-sm-6 alert",class:{"alert-dark":t.notAnswer(1),"alert-success":t.thisAnswer(1)},attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans1)}}),t._v(" "),e("div",{staticClass:"col-4 col-sm-6 alert",class:{"alert-dark":t.notAnswer(2),"alert-success":t.thisAnswer(2)},attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans2)}})]):t._e(),4==t.quiz.answer_cnt?e("div",{staticClass:"row"},[e("div",{staticClass:"cl-8 col-sm-6 alert",class:{"alert-dark":t.notAnswer(3),"alert-success":t.thisAnswer(3)},attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans3)}}),t._v(" "),e("div",{staticClass:"col-4 col-sm-6 alert",class:{"alert-dark":t.notAnswer(4),"alert-success":t.thisAnswer(4)},attrs:{role:"alert",id:"quizAns"},domProps:{innerHTML:t._s(t.quiz.ans4)}})]):t._e(),1==t.correct?e("div",{staticClass:"col-8 col-sm-4 alert alert-dark",domProps:{innerHTML:t._s(t.quiz.ps_correct)}}):t._e(),0==t.correct?e("div",{staticClass:"col-8 col-sm-4 alert alert-dark",domProps:{innerHTML:t._s(t.quiz.ps_wrong)}}):t._e(),1==t.correct?e("button",{staticClass:"btn btn-success btn-lg btn-block",attrs:{type:"button"},on:{click:function(s){return t.nextQuiz()}}},[t._v(" 다음 문제! ")]):t._e()]:t._e(),e("button",{staticClass:"btn btn-secondary btn-lg btn-block",attrs:{type:"button"},on:{click:function(s){return t.GoQuizMain()}}},[t._v(" 메인화면으로 돌아가기 ")])],2)])])])},_=[],p=(e("c975"),e("e25e"),{GET_QUIZ_ONE:"getQuizOne",GET_BESTSCORE:"getBestScore",UPDATE_BESTSCORE:"updateBestScore"}),f={name:"quiz",created:function(){this.nextQuiz()},computed:{quiz:function(){return this.$store.state.quiz},myWidth:function(){return this.progress+"%"},id:function(){return this.$store.state.id},score:function(){return this.$store.state.score},solvedCnt:function(){return this.$store.state.solvedCnt},level:function(){return this.$store.state.level},bestScore:function(){return this.$store.state.best_quiz_score}},data:function(){return{warning:!1,danger:!1,progress:0,timer:"",possible:!0,correct:!1,state:"finding"}},methods:{nextQuiz:function(){var t=this;this.state="finding",this.$store.state.quizNo.push(this.quiz.no),this.solvedCnt>=10&&this.$router.push("/quizEnd"),this.progress=0,this.timer="",this.possible=!0,this.correct=!1,this.$store.dispatch(p.GET_QUIZ_ONE,{level:this.$store.state.level}),this.getId(),clearInterval(this.timer),this.timer=setInterval((function(){t.progress+=1}),100)},GoQuizMain:function(){this.$router.push("/quiz.jsp")},getId:function(){this.$store.dispatch(p.GET_ID)},isAnswer:function(t){this.state="click",clearInterval(this.timer),this.quiz.answer==t?(this.correct=!0,this.possible=!1,this.$store.state.score+=100,this.$store.state.score+=100-this.progress,this.$store.state.solvedCnt+=1,this.$store.state.level=parseInt(this.$store.state.solvedCnt/4+1),this.bestScore<this.$store.state.score&&this.$store.dispatch(p.UPDATE_BESTSCORE,{bestScore:this.$store.state.score})):(this.$store.state.quizNo=[],this.possible=!1),this.progress=0},notAnswer:function(t){return t!=this.quiz.answer},thisAnswer:function(t){return t==this.quiz.answer}},updated:function(){-1!=this.$store.state.quizNo.indexOf(this.quiz.no)&&"finding"==this.state&&this.nextQuiz(),this.progress>75?(this.warning=!1,this.danger=!0):this.progress>35?(this.warning=!0,this.danger=!1):(this.warning=!1,this.danger=!1),this.progress>105&&(this.progress=0,this.possible=!1,clearInterval(this.timer),alert("시간 초과!!!!"))}},m=f,b=Object(u["a"])(m,h,_,!1,null,"4bf20416",null),z=b.exports,q=function(){var t=this,s=t.$createElement;t._self._c;return t._m(0)},w=[function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",[e("div",[t._v("QuizScore")])])}],g={},C=g,T=Object(u["a"])(C,q,w,!1,null,"a14f491c",null),A=T.exports,E=function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",[e("br"),e("br"),e("div",[t._v("Quiz End")]),e("div",[e("h2",[t._v(t._s(t.solvedCnt)+" 문제를 모두 맞추셨습니다!!")])]),e("div",{staticClass:"container"},[e("div",{staticClass:"row"},[e("div",{staticClass:"col-sm"},[t._v("사용자 "+t._s(t.id))]),e("div",{staticClass:"col-sm"},[t._v("맞춘 개수 : "+t._s(t.solvedCnt))]),e("div",{staticClass:"col-sm"},[t._v("최종 점수 : "+t._s(t.score))])])]),e("button",{staticClass:"btn btn-secondary btn-lg btn-block",attrs:{type:"button"},on:{click:function(s){return t.GoQuizMain()}}},[t._v(" 메인화면으로 돌아가기 ")])])},$=[],k={name:"quiz",created:function(){this.nextQuiz()},computed:{id:function(){return this.$store.state.id},score:function(){return this.$store.state.score},solvedCnt:function(){return this.$store.state.solvedCnt},level:function(){return this.$store.state.level}},methods:{GoQuizMain:function(){this.$router.push("/quiz.jsp")},getId:function(){this.$store.dispatch(p.GET_ID)}}},O=k,L=Object(u["a"])(O,E,$,!1,null,"5bbdb3c2",null),y=L.exports,M=e("8c4f");r["a"].use(M["a"]);var P,S,j=new M["a"]({mode:"history",routes:[{path:"/",component:v},{path:"/quiz.html",component:v},{path:"/quiz.jsp",component:v},{path:"/quiz",component:z},{path:"/quizEnd",component:y}]}),G={name:"app",components:{QuizScore:A},router:j},I=G,Q=(e("034f"),Object(u["a"])(I,n,i,!1,null,null,null)),H=Q.exports,x=e("2fa7"),B=e("2f62"),N=e("bc3a"),U=e.n(N),D=U.a.create({baseURL:"http://localhost:8080/",headers:{"Content-type":"application/json"}}),R=void 0;r["a"].use(B["a"]);var Z=new B["a"].Store({state:{id:"ssafy",score:0,quizNo:[],solvedCnt:0,best_quiz_score:0,level:1,quiz:{no:1,level:1,question:"테스트임 신라면의 제조사는?",answer_cnt:4,answer:2,ps_correct:"테스트임 농심 신~~라면! 아시죠??",ps_wrong:"",ans1:"테스트임삼양",ans2:"테스트임농심",ans3:"테스트임빙그레",ans4:"테스트임오뚜기"}},actions:(P={},Object(x["a"])(P,p.GET_QUIZ_ONE,(function(t,s){console.log(s),D.get("/rest/quizOneWithLevel/"+s.level).then((function(s){console.log("action 거침"),t.commit(p.GET_QUIZ_ONE,{quiz:s.data.data[0]})})).catch((function(t){return alert("퀴즈 하나 불러오는데 실패하였습니다."+t)}))})),Object(x["a"])(P,p.GET_BULLETINLIST,(function(t){D.get("/rest/boardlist/2").then((function(s){t.commit(p.GET_BULLETINLIST,{bulletins:s.data.data})})).catch((function(t){return alert("처리에 실패하였습니다."+t)}))})),Object(x["a"])(P,p.GET_BULLETIN,(function(t,s){D.get("/rest/board/"+s.no).then((function(s){console.log("get_bulletin"),console.log(s.data.data),t.commit(p.GET_BULLETIN,{bulletin:s.data.data})})).catch((function(t){return alert("처리에 실패하였습니다."+t)}))})),Object(x["a"])(P,p.GET_ID,(function(t){D.get("/session.do",{withCredentials:!0}).then((function(s){t.commit(p.GET_ID,{id:s.data.id})})).catch((function(t){console.log(t)}))})),Object(x["a"])(P,p.GET_BESTSCORE,(function(t){D.get("/rest/user/"+R.id).then((function(s){t.commit(p.GET_BESTSCORE,{best_quiz_score:s.data.best_quiz_score})})).catch((function(t){console.log(t)}))})),P),mutations:(S={},Object(x["a"])(S,p.GET_ID,(function(t,s){Z.state.id=s.id})),Object(x["a"])(S,p.GET_BESTSCORE,(function(t,s){Z.state.best_quiz_score=s.best_quiz_score})),Object(x["a"])(S,p.GET_QUIZ_ONE,(function(t,s){console.log("mutations 거침"),Z.state.quiz=s.quiz})),S)}),W=Z;r["a"].config.productionTip=!0,r["a"].config.devtools=!0,new r["a"]({render:function(t){return t(H)},store:W}).$mount("#app")},"85ec":function(t,s,e){}});
//# sourceMappingURL=app.92edd598.js.map