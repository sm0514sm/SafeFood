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
    comments: []
  },
  actions: {
    [Constant.GET_BULLETINLIST]: store => {
      http
        .get("/rest/board")
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
          console.log("아무거나");
          console.log(payload);
          console.log(response.data.data);
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
        .then(response => {
          console.log(response);
          console.log(payload.bulletin);
          store.dispatch(Constant.GET_BULLETINLIST);
        })
        .catch(() => console.log("추가에 실패하였습니다."));
    },
    [Constant.DELETE_BULLETIN]: (store, payload) => {
      http
        .delete("rest/board/" + payload.bno)
        .then(response => {
          console.log(response);
          console.log(payload.bulletin);
          console.log("삭제 처리 되었습니다.");
          store.dispatch(Constant.GET_BULLETINLIST);
        })
        .catch(exp => alert("삭제 처리에 실패하였습니다" + exp));
    },
    [Constant.ADD_BOARDANS]: (store, payload) => {
      http.post("/rest/boardans", {
        sno : payload.sno,
        title : payload.title,
        contents : payload.contents,
        hits : payload.hits,
        goods : payload.goods,
        uid : payload.uid,
        qno : payload.qno
      })
      .then( () =>{
        store.dispatch(Constant.GET_COMMENTS, {qno : payload.qno});
      })
      .catch( err => {
        console.log(err);
      });
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
    }
  }
});
export default store;
