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
    best_quiz_score: 0, // 여지껏 이 사용자의 최고 점수
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
    },
    user: {},
    top5: []
  },
  actions: {
    [Constant.GET_QUIZ_ONE]: (store, payload) => {
      http
        .get("/rest/quizOneWithLevel/" + payload.level)
        .then(response => {
          store.commit(Constant.GET_QUIZ_ONE, {
            quiz: response.data.data[0]
          });
        })
        .catch(exp => alert("퀴즈 하나 불러오는데 실패하였습니다." + exp));
    },
    [Constant.GET_ID]: store => {
      http
        .get("/session.do", { withCredentials: true })
        .then(response => {
          store.commit(Constant.GET_ID, { id: response.data.id });
        })
        .catch(err => {
          console.log(err);
        });
    },
    [Constant.GET_BESTSCORE]: store => {
      http
        .get("/rest/user/" + store.state.id)
        .then(response => {
          store.commit(Constant.GET_BESTSCORE, {
            best_quiz_score: response.data.data.best_quiz_score,
            user: response.data.data
          });
          store.commit(Constant.GET_USER, {
            user: response.data.data
          });
        })
        .catch(err => {
          console.log(err);
        });
    },
    [Constant.UPDATE_BESTSCORE]: (store, payload) => {
      http
        .put("/rest/user/modify", {
          address: store.state.user.address,
          allergy: store.state.user.allergy,
          best_quiz_score: payload.bestScore,
          email: store.state.user.email,
          id: store.state.user.id,
          name: store.state.user.name,
          password: store.state.user.password,
          phone: store.state.user.phone
        })
        .then(() => {
          store.dispatch(Constant.GET_BULLETINLIST, 1);
        })
        .catch(() => console.log("수정에 실패하였습니다."));
    },
    [Constant.GET_TOP5]: store => {
      http
        .get("/rest/user/top5")
        .then(response => {
          store.commit(Constant.GET_TOP5, {
            top5: response.data.data
          });
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  mutations: {
    [Constant.GET_ID]: (state, payload) => {
      store.state.id = payload.id;
    },
    [Constant.GET_BESTSCORE]: (state, payload) => {
      store.state.best_quiz_score = payload.best_quiz_score;
    },
    [Constant.GET_QUIZ_ONE]: (state, payload) => {
      store.state.quiz = payload.quiz;
    },
    [Constant.GET_USER]: (state, payload) => {
      store.state.user = payload.user;
    },
    [Constant.GET_TOP5]: (state, payload) => {
      store.state.top5 = payload.top5;
    }
  }
});
export default store;
