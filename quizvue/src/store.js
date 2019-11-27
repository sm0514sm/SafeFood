import Vue from "vue";
import Vuex from "vuex";
import Constant from "./Constant";
import http from "./http-common";

Vue.use(Vuex);

const store = new Vuex.Store({
  state: {
    id: "ssafy",
    score: 0,
    quizNo: [], // 푼 문제 리스트
    solvedCnt: 0,
    level: 1,
    quiz: {
      no: 1,
      level: 1,
      question: "테스트임 신라면의 제조사는?",
      answer_cnt: 4,
      answer: 2,
      ps_correct: "테스트임 농심 신~~라면! 아시죠??",
      ps_wrong: "",
      ans1: "테스트임삼양",
      ans2: "테스트임농심",
      ans3: "테스트임빙그레",
      ans4: "테스트임오뚜기"
    }
  },
  actions: {
    [Constant.GET_QUIZ_ONE]: (store, payload) => {
      console.log(payload);
      http
        .get("/rest/quizOneWithLevel/" + payload.level)
        .then(response => {
          store.commit(Constant.GET_QUIZ_ONE, {
            quiz: response.data.data[0]
          });
        })
        .catch(exp => alert("퀴즈 하나 불러오는데 실패하였습니다." + exp));
    },
    [Constant.GET_BULLETINLIST]: store => {
      http
        .get("/rest/boardlist/" + 2)
        .then(response => {
          store.commit(Constant.GET_BULLETINLIST, {
            bulletins: response.data.data
          });
        })
        .catch(exp => alert("처리에 실패하였습니다." + exp));
    },
    [Constant.GET_BULLETIN]: (store, payload) => {
      http
        .get("/rest/board/" + payload.no)
        .then(response => {
          console.log("get_bulletin");
          console.log(response.data.data);
          store.commit(Constant.GET_BULLETIN, { bulletin: response.data.data });
        })
        .catch(exp => alert("처리에 실패하였습니다." + exp));
    },

    [Constant.GET_ID]: store => {
      http
        .get("/session.do", { withCredentials: true })
        .then(response => {
          store.commit(Constant.GET_ID, { uid: response.data.id });
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  mutations: {
    [Constant.GET_ID]: (state, payload) => {
      store.state.id = payload.uid;
    },
    [Constant.GET_QUIZ_ONE]: (state, payload) => {
      store.state.quiz = payload.quiz;
    }
  }
});
export default store;
