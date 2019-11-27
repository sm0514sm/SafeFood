<template>
  <div>
    <br /><br />
    <div>Quiz End</div>
    <div>
      <h2>{{ solvedCnt }} 문제를 모두 맞추셨습니다!!</h2>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-sm">사용자 {{ id }}</div>
        <div class="col-sm">맞춘 개수 : {{ solvedCnt }}</div>
        <div class="col-sm">최종 점수 : {{ score }}</div>
      </div>
    </div>
    <button
      type="button"
      class="btn btn-secondary btn-lg btn-block"
      @click="GoQuizMain()"
    >
      메인화면으로 돌아가기
    </button>
  </div>
</template>

<script>
import Constant from "../Constant";

export default {
  name: "quiz",
  computed: {
    id() {
      return this.$store.state.id;
    },
    score() {
      return this.$store.state.score;
    },
    solvedCnt() {
      return this.$store.state.solvedCnt;
    },
    level() {
      return this.$store.state.level;
    }
  },
  methods: {
    GoQuizMain() {
      this.$router.push("/quiz.jsp");
    },
    getId() {
      this.$store.dispatch(Constant.GET_ID);
    }
  }
};
</script>

<style scoped></style>
