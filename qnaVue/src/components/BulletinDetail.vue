<template>
  <div>
    <!-- 나중에 삭제 바람 -->
    <br />
    <div>
      <div v-if="id == bulletin.uid">
        <input
          type="button"
          value="로그인 되어있군요! 수정하기"
          @click="GoEditBulletin()"
        />
      </div>
      <table>
        <tr id="header">
          <td>작성자</td>
          <td>작성일</td>
          <td>조회수</td>
          <td>추천수</td>
        </tr>
        <tr id="header">
          <td>{{ bulletin.uid }}</td>
          <td>{{ bulletin.bregdate }}</td>
          <td>{{ bulletin.hits }}</td>
          <td>{{ bulletin.goods }}</td>
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
      <br />

      <table>
        <tr id="header" style="background-color: lightblue">
          <td>댓글</td>
          <td colspan="2">
            <input type="text" size="65" v-model="boardAns.contents" />
          </td>
          <td>
            <input type="button" value="등록" @click="addBoardAns()" />
          </td>
          <td style="width: 85px"></td>
          <td style="width: 85px"></td>
        </tr>
        <tr id="header" style="background-color: lightblue">
          <td>작성자</td>
          <td colspan="2">내용</td>
          <td>시간</td>
          <td width="25px"></td>
          <td></td>
        </tr>
        <tr v-for="comment in comments" v-bind:key="comment.bno">
          <td>{{ comment.uid }}</td>
          <td colspan="2">{{ comment.contents }}</td>
          <td>{{ comment.bregdate }}</td>
          <td>
            {{ comment.goods }}
            <input
              type="button"
              value="좋아요"
              @click="goodBoardAns(comment.bno, comment.qno)"
            />
          </td>
          <td>
            <input
              v-if="comment.uid == id"
              type="button"
              value="삭제"
              @click="removeBoardAns(comment.bno)"
            />
          </td>
        </tr>
      </table>

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
    this.$store.dispatch(Constant.ADD_BULLETIN_CNT, { bno: this.bulletin.bno });
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
      return this.$store.state.id;
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
    GoEditBulletin() {
      this.$router.push("/updateBulletin");
    },
    goodBoardAns(bno, qno) {
      //좋아요 증가 기능
      this.$store.dispatch(Constant.GOOD_BOARDANS, { bno, qno });
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
