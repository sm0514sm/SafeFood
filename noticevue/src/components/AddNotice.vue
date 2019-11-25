<template>
  <div>
    <div>AddNotice.vue 입니다.</div>
    <br />
    <div>
      <table>
        <tr>
          <td>
            제목 :
            <input type="text" v-model="notice.title" style="width : 80%" />
          </td>
        </tr>
        <tr>
          <td>
            <input type="text" v-model="notice.contents" id="contents" />
          </td>
        </tr>
        <tr>
          <td>
            <input type="button" value="목록으로" @click="GoBoard()" />
            &nbsp;
            <input type="button" value="초기화" @click="clear()" />
            &nbsp;
            <input type="button" value="작성하기" @click="addBulletin()" />
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
import Constant from "../Constant";

export default {
  name: "addNotice",
  data() {
    return {
      notice: {
        bregdate: "",
        contents: "",
        goods: 0,
        hits: 0,
        sno: 1,
        title: "",
        uid: this.$store.state.id
      }
    };
  },
  methods: {
    addBulletin() {
      if (this.notice.title.trim() == "") alert("제목을 입력하세요!");
      else if (this.notice.contents.trim() == "") alert("내용을 입력하세요!");
      else {
        this.$store.dispatch(Constant.ADD_BULLETIN, {
          bulletin: this.notice
        });
        this.$router.push("/");
      }
    },
    clear() {
      this.notice.contents = "";
      this.notice.title = "";
    },
    GoBoard() {
      this.$router.push("/");
    }
  }
};
</script>

<style scoped>
table {
  margin: auto;
  width: 70%;
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
#contents {
  width: 95%;
  height: 200px;
}
input {
  padding: 10px;
}
</style>
