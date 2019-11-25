<template>
  <div>
    <div>NoticeDetail</div>
    <br />
    <div>
      <div v-if="id == 'root'">
        <input
          type="button"
          value="우리 관리자님 로그인 되어있군요! 수정하기"
          @click="GoEditBulletin(id)"
        />
      </div>
      <table>
        <tr id="header">
          <td>작성일</td>
          <td>조회수</td>
        </tr>
        <tr id="header">
          <td>{{ bulletin.bregdate }}</td>
          <td>{{ bulletin.hits }}</td>
        </tr>
        <tr>
          <td colspan="4">
            <h2>{{ bulletin.title }}</h2>
          </td>
        </tr>
        <tr>
          <td
            colspan="4"
            v-html="bulletin.contents"
            style="text-align: left"
          ></td>
        </tr>
      </table>

      <br />
      <br />
      <input type="button" value="목록" @click="GoBoard()" />
    </div>
  </div>
</template>

<script>
import Constant from "../Constant";

export default {
  name: "BulletinDetail",
  data() {
    return {
      boardAns: {
        bno: "",
        sno: "",
        contents: "",
        bregdate: "",
        uid: this.$store.state.id,
        qno: this.$route.params.no
      }
    };
  },
  created() {
    alert(this.id + "로 로그인되어 있습니다.");
    this.$store.dispatch(Constant.GET_BULLETIN, { no: this.$route.params.no });
    this.$store.dispatch(Constant.GET_COMMENTS, { qno: this.$route.params.no });
  },
  computed: {
    bulletin() {
      return this.$store.state.bulletin;
    },
    comments() {
      return this.$store.state.comments;
    },
    id() {
      return "root";
      // return this.$store.state.id;
    }
  },
  methods: {
    GoBoard() {
      this.$router.push("/");
    },
    addBoardAns() {
      this.$store.dispatch(Constant.ADD_BOARDANS, {
        sno: 2,
        title: "",
        contents: this.boardAns.contents,
        hits: 0,
        goods: 0,
        uid: this.$store.state.id,
        qno: this.$route.params.no
      });
      this.ansClear();
    },
    removeBoardAns(bno) {
      //bno : 답글 번호 , qno : 게시글 번호
      this.$store.dispatch(Constant.REMOVE_BOARDANS, {
        bno,
        qno: this.boardAns.qno
      });
    },
    ansClear() {
      this.boardAns.contents = "";
    },
    GoEditBulletin(id) {
      this.$router.push("/updateNotice/" + id);
    }
  }
};
</script>

<style scoped>
table {
  margin: auto;
  width: 90%;
  border-top: 3px solid #696969;
  border-collapse: collapse;
}
td {
  border-bottom: 1px solid #444444;
  padding: 10px;
}
#header {
  border-top: 50px;
  border-bottom: 3px solid #707070;
  padding: 10px;
  background: #dfc0fc;
}
</style>
