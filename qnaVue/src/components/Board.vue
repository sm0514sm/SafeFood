<template>
  <div>
    <!-- 나중에 삭제 바람 -->
    <div>Board.vue 입니다</div>
    로그인 아이디 : {{ id }}
    <br />
    <div>
      <table>
        <th>게시글 번호</th>
        <th width="50%">제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>삭제</th>
        <tr v-for="bulletin in bulletins" v-bind:key="bulletin.no">
          <td>{{ bulletin.bno }}</td>
          <td @click="getBulletin(bulletin.bno)">{{ bulletin.title }}</td>
          <td>{{ bulletin.uid }}</td>
          <td>{{ bulletin.bregdate }}</td>
          <td>
            <input
              v-if="bulletin.uid == id"
              type="button"
              value="삭제"
              @click="deleteBulletin(bulletin.bno)"
            />
          </td>
        </tr>
        <br />
        <tr>
          <td colspan="3">
            <select
              name="searchType"
              style="height:22px;"
              v-model="searchBulletin.searchType"
            >
              <option value="notSelect">검색선택</option>
              <option value="title">제목</option>
              <option value="contents">내용</option>
              <option value="uid">작성자</option>
            </select>
            &nbsp;
            <input
              type="text"
              style="height:22px;"
              v-model="searchBulletin.searchWord"
            />
            &nbsp;
            <input
              type="button"
              style="height:25px;"
              value="검색"
              @click="search()"
            />
          </td>
          <td>
            <input
              type="button"
              style="height:25px;"
              value="전체목록"
              @click="getAllBulltein(2)"
            />
          </td>
          <td>
            <input
              type="button"
              style="height:25px;"
              value="글쓰기"
              @click="GoAddBulletin()"
            />
          </td>
        </tr>
      </table>

      <br />
      <iframe
        width="728"
        height="90"
        allowtransparency="true"
        src="https://tab2.clickmon.co.kr/pop/wp_ad_728.php?PopAd=CM_M_1003067%7C%5E%7CCM_A_1065523%7C%5E%7CAdver_M_1046207&mon_rf=REFERRER_URL"
        frameborder="0"
        scrolling="no"
        id="ad"
      ></iframe>
    </div>
  </div>
</template>

<script>
import Constant from "../Constant";

export default {
  name: "Board",
  data() {
    return {
      searchBulletin: {
        searchType: "notSelect",
        searchWord: ""
      }
    };
  },
  created() {
    this.getAllBulltein(2);
    this.getId();
  },
  computed: {
    bulletins() {
      return this.$store.state.bulletins;
    },
    id() {
      return this.$store.state.id;
    }
  },
  methods: {
    getAllBulltein(sno) {
      this.$store.dispatch(Constant.GET_BULLETINLIST, { sno });
    },
    getBulletin(no) {
      this.$router.push("/detail/" + no);
    },
    GoAddBulletin() {
      this.$router.push("/addBulletin");
    },
    search() {
      if (this.searchBulletin.searchType == "notSelect")
        alert("검색 종류를 선택하세요!");
      else if (this.searchBulletin.searchWord == "")
        alert("검색할 단어를 입력하세요!");
      else {
        this.$store.dispatch(Constant.GET_SEARCH_BULLETINLIST, {
          searchBulletin: this.searchBulletin
        });
      }
    },
    deleteBulletin(bno) {
      this.$store.dispatch(Constant.DELETE_BULLETIN, {
        bno
      });
    },
    getId() {
      this.$store.dispatch(Constant.GET_ID);
    }
  }
};
</script>

<style scoped>
table {
  margin: auto;
  width: 80%;
  border-top: 3px solid #696969;
  border-collapse: collapse;
}
td {
  border-bottom: 1px solid #444444;
  padding: 10px;
}
th {
  border-top: 50px;
  border-bottom: 3px solid #707070;
  padding: 10px;
  background: #c6f5fd;
}
#id {
  margin: auto;
  display: block;
}
</style>
