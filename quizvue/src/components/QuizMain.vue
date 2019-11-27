<template>
  <div>
    <div>QuizMain</div>
    <h1>먹거리 쿠이이이이이즈~!</h1>
    <p class="lead">
      가공식품들에 대한 퀴즈를 풀며 (사실 별 쓸데없는) 지식을 쌓고 다른 사람들과
      실시간 경쟁을 해보세요!
    </p>
    <button
      type="button"
      class="btn btn-primary btn-lg btn-block"
      @click="GoQuiz()"
    >
      게임 시작하기
    </button>
  </div>
</template>

<script>
// import Constant from "../Constant";

export default {
  name: "addBulletin",
  created() {
    // 초기화를 해줍니다
    this.$store.state.score = 0;
    this.$store.state.quizNo = 0;
    this.$store.state.solvedCnt = 0;
    this.$store.state.level = 1;
  },
  computed: {
    id() {
      return this.$store.state.id;
    }
  },
  data() {
    return {
      bulletin: {
        uid: this.$store.state.id
      }
    };
  },
  methods: {
    GoQuiz() {
      this.$router.push("/quiz");
    }
  }
};
</script>

<style scoped></style>
