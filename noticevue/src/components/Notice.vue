<template>
  <div>
    <div>Notice.vue 입니다</div>
    <br />
    <div>
      <table>
        <th>공지사항 번호</th>
        <th width="50%">제목</th>
        <th>작성일</th>
        <th>삭제</th>
        <tr v-for="bulletin in bulletins" v-bind:key="bulletin.no">
          <td>{{ bulletin.bno }}</td>
          <td @click="getBulletin(bulletin.bno)">{{ bulletin.title }}</td>
          <td>{{ bulletin.bregdate }}</td>
          <td>
            <input
              v-if="id == 'root'"
              type="button"
              value="삭제"
              @click="deleteBulletin(bulletin.bno)"
            />
          </td>
        </tr>
        <br />
        <tr>
          <td></td>
          <td></td>
          <td></td>
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
  name: "Notice",
  created() {
    this.$store.state.id = "root";
    this.getAllBulltein();
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
    getAllBulltein() {
      this.$store.dispatch(Constant.GET_BULLETINLIST, { sno: 1 });
    },
    getBulletin(no) {
      this.$router.push("/detail/" + no);
    },
    GoAddBulletin() {
      this.$router.push("/addNotice");
    },
    deleteBulletin(bno) {
      this.$store.dispatch(Constant.DELETE_BULLETIN, { bno });
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
