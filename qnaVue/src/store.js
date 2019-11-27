import Vue from "vue";
import Vuex from "vuex";
import Constant from "./Constant";
import http from "./http-common";
Vue.use(Vuex);
const store = new Vuex.Store({
  state: {
    bulletins: [],
    bulletin: {},
    searchBulletin: {},
    comments: [],
    id: "ssafy"
  },
  actions: {
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
    [Constant.GET_SEARCH_BULLETINLIST]: (store, payload) => {
      http
        .get(
          "/rest/boardsearch/" +
            payload.searchBulletin.searchType +
            "_" +
            payload.searchBulletin.searchWord
        )
        .then(response => {
          store.commit(Constant.GET_SEARCH_BULLETINLIST, {
            bulletins: response.data.data
          });
        })
        .catch(exp => alert("처리에 실패하였습니다." + exp));
    },
    [Constant.GET_BULLETIN]: (store, payload) => {
      http
        .get("/rest/board/" + payload.no)
        .then(response => {
          store.commit(Constant.GET_BULLETIN, { bulletin: response.data.data });
        })
        .catch(exp => alert("처리에 실패하였습니다." + exp));
    },
    [Constant.ADD_BULLETIN_CNT]: (store, payload) => {
      http
        .put("/rest/board/" + payload.bno)
        .then(() => {})
        .catch(exp => alert("조회수 증가에 실패하였습니다." + exp));
    },
    [Constant.GET_COMMENTS]: (store, payload) => {
      http
        .get("/rest/boardansq/" + payload.qno)
        .then(response => {
          store.commit(Constant.GET_COMMENTS, { comments: response.data.data });
        })
        .catch(exp => alert("처리에 실패하였습니다." + exp));
    },
    [Constant.ADD_BULLETIN]: (store, payload) => {
      http
        .post("/rest/board", {
          contents: payload.bulletin.contents,
          goods: payload.bulletin.goods,
          hits: payload.bulletin.hits,
          sno: payload.bulletin.sno,
          title: payload.bulletin.title,
          uid: payload.bulletin.uid
        })
        .then(() => {
          store.dispatch(Constant.GET_BULLETINLIST, payload.sno);
        })
        .catch(() => console.log("추가에 실패하였습니다."));
    },
    [Constant.UPDATE_BULLETIN]: (store, payload) => {
      http
        .put("/rest/board", {
          bno: payload.bulletin.bno,
          bregdate: "",
          contents: payload.bulletin.contents,
          goods: payload.bulletin.goods,
          hits: payload.bulletin.hits,
          sno: payload.bulletin.sno,
          title: payload.bulletin.title,
          uid: payload.bulletin.uid
        })
        .then(() => {
          store.commit(Constant.GET_BULLETIN, {
            bulletin: payload.bulletin
          });
        })
        .catch(err => {
          console.log(err);
          console.log("수정에 실패하였습니다.");
        });
    },
    [Constant.DELETE_BULLETIN]: (store, payload) => {
      http
        .delete("rest/board/" + payload.bno)
        .then(() => {
          store.dispatch(Constant.GET_BULLETINLIST, 2);
        })
        .catch(exp => alert("삭제 처리에 실패하였습니다" + exp));
    },
    [Constant.ADD_BOARDANS]: (store, payload) => {
      http
        .post("/rest/boardans", {
          sno: payload.sno,
          title: payload.title,
          contents: payload.contents,
          hits: payload.hits,
          goods: payload.goods,
          uid: payload.uid,
          qno: payload.qno
        })
        .then(() => {
          store.dispatch(Constant.GET_COMMENTS, { qno: payload.qno });
        })
        .catch(err => {
          console.log(err);
        });
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
    },
    [Constant.REMOVE_BOARDANS]: (store, payload) => {
      http
        .delete("/rest/boardans/" + payload.bno)
        .then(() => {
          store.dispatch(Constant.GET_COMMENTS, { qno: payload.qno });
        })
        .catch(err => {
          console.log(err);
        });
    },
    [Constant.GOOD_BOARDANS]: (store, payload) => {
      http
        .put("/rest/goodboardans", {
          bno: payload.bno
        })
        .then(() => {
          store.dispatch(Constant.GET_COMMENTS, { qno: payload.qno });
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  mutations: {
    // 저장소에 데이터 실제 반영(commit시 호출)
    [Constant.GET_BULLETINLIST]: (state, payload) => {
      store.state.bulletins = payload.bulletins;
    },
    [Constant.GET_BULLETIN]: (state, payload) => {
      store.state.bulletin = payload.bulletin;
    },
    [Constant.GET_SEARCH_BULLETINLIST]: (state, payload) => {
      store.state.bulletins = payload.bulletins;
    },
    [Constant.GET_COMMENTS]: (state, payload) => {
      store.state.comments = payload.comments;
    },
    [Constant.GET_ID]: (state, payload) => {
      store.state.id = payload.uid;
    }
  }
});
export default store;
