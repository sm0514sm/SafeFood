<template>
  <div>
    <div>우리 민기 삼성갑니다!!!5</div>
    <br />
    <div>
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

      <br /><br /><br />

      <!-- <tr id="header" style="background-color: lightblue">
          <td>작성자</td>
          <td>작성일</td>
          <td>조회수</td>
          <td>추천수</td>
        </tr> -->

      <table>
        <tr
          v-for="comment in comments"
          v-bind:key="comment.bno"
          style="background-color: lightblue"
        >
          <td>{{ comment.uid }}</td>
          <td colspan="2">{{ comment.contents }}</td>
          <td>{{ comment.bregdate }}</td>
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
  created() {
    this.$store.dispatch(Constant.GET_BULLETIN, { no: this.$route.params.no });
    this.$store.dispatch(Constant.GET_COMMENTS, { qno: this.$route.params.no });
  },
  computed: {
    bulletin() {
      return this.$store.state.bulletin;
    },
    comments() {
      return this.$store.state.comments;
    }
  },
  methods: {
    GoBoard() {
      this.$router.push("/");
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
