<template>
  <div>
    <br /><br />
    <div>Quiz</div>
    <div class="progress">
      <div
        id="progressBar"
        class="progress-bar progress-bar-striped progress-bar-animated"
        :class="{ 'bg-warning': warning, 'bg-danger': danger }"
        role="progressbar"
        :aria-valuenow="progress"
        aria-valuemin="0"
        aria-valuemax="100"
        v-bind:style="{ width: myWidth }"
      ></div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-sm">사용자 {{ id }}</div>
        <div class="col-sm">현재 레벨 {{ level }}</div>
        <div class="col-sm">맞춘 개수 {{ solvedCnt }}</div>
        <div class="col-sm">현재 점수 {{ score }}</div>
      </div>
    </div>
    <br /><br />
    <div class="container">
      <div class="row">
        <div class="col-sm-9">
          <div v-html="quiz.question" />
          <template v-if="possible == true">
            <div class="row" v-if="quiz.answer_cnt == 2">
              <div
                class="col-8 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                @click="isAnswer(1)"
                v-html="quiz.ans1"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                @click="isAnswer(2)"
                v-html="quiz.ans2"
              />
            </div>
            <div class="row" v-if="quiz.answer_cnt == 3">
              <div
                class="col-8 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                @click="isAnswer(1)"
                v-html="quiz.ans1"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                @click="isAnswer(2)"
                v-html="quiz.ans2"
              />
              &nbsp;
              <div
                class="col-2 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                @click="isAnswer(3)"
                v-html="quiz.ans3"
              />
            </div>
            <div class="row" v-if="quiz.answer_cnt == 4">
              <div
                class="col-8 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                @click="isAnswer(1)"
                v-html="quiz.ans1"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                @click="isAnswer(2)"
                v-html="quiz.ans2"
              />
            </div>
            <div class="row" v-if="quiz.answer_cnt == 4">
              <div
                class="cl-8 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                @click="isAnswer(3)"
                v-html="quiz.ans3"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                @click="isAnswer(4)"
                v-html="quiz.ans4"
              />
            </div>
          </template>
          <!-- 시간초과, 정답 맞춘 경우, 정답 틀린 경우 -->
          <template v-if="possible == false">
            <div class="row" v-if="quiz.answer_cnt == 2">
              <div
                class="col-8 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                v-html="quiz.ans1"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                v-html="quiz.ans2"
              />
            </div>
            <div class="row" v-if="quiz.answer_cnt == 3">
              <div
                class="col-8 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                v-html="quiz.ans1"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                v-html="quiz.ans2"
              />
              &nbsp;
              <div
                class="col-2 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                v-html="quiz.ans3"
              />
            </div>
            <div class="row" v-if="quiz.answer_cnt == 4">
              <div
                class="col-8 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                v-html="quiz.ans1"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                v-html="quiz.ans2"
              />
            </div>
            <div class="row" v-if="quiz.answer_cnt == 4">
              <div
                class="cl-8 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                v-html="quiz.ans3"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert alert-dark"
                role="alert"
                id="quizAns"
                v-html="quiz.ans4"
              />
            </div>
            <div class="col-8 col-sm-4 alert alert-dark" v-html="quiz.ps" />
            <button
              type="button"
              class="btn btn-success btn-lg btn-block"
              @click="nextQuiz()"
              v-if="correct == true"
            >
              다음 문제!
            </button>
          </template>

          <button
            type="button"
            class="btn btn-secondary btn-lg btn-block"
            @click="GoQuizMain()"
          >
            메인화면으로 돌아가기
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Constant from "../Constant";

export default {
  name: "quiz",
  created() {
    this.nextQuiz();
  },
  computed: {
    quiz() {
      return this.$store.state.quiz;
    },
    myWidth: function() {
      return this.progress + "%";
    },
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
  data() {
    return {
      progress: 0,
      timer: "",
      possible: true,
      correct: false
    };
  },
  methods: {
    nextQuiz() {
      this.progress = 0;
      this.timer = "";
      this.possible = true;
      this.correct = false;
      this.$store.dispatch(Constant.GET_QUIZ_ONE, {
        level: this.$store.state.level
      });
      this.getId();
      this.timer = setInterval(() => {
        this.progress += 1;
      }, 100);
    },
    GoQuizMain() {
      this.$router.push("/quiz.jsp");
    },
    getId() {
      this.$store.dispatch(Constant.GET_ID);
    },
    isAnswer(click) {
      this.progress = 0;
      clearInterval(this.timer);
      if (this.quiz.answer == click) {
        alert("정답입니다.");
        this.correct = true;
        this.possible = false;
        this.$store.state.score += 100;
        this.$store.state.score += 100 - this.progress;
        this.$store.state.solvedCnt += 1;
        this.$store.state.level = parseInt(this.$store.state.solvedCnt / 4 + 1);
      } else {
        alert("안정답입니다.");
        this.possible = false;
      }
    }
  },
  updated() {
    if (this.progress > 75) {
      this.warning = false;
      this.danger = true;
    } else if (this.progress > 35) {
      this.warning = true;
      this.danger = false;
    } else {
      this.warning = false;
      this.danger = false;
    }

    if (this.progress > 105) {
      this.progress = 0;
      this.possible = false;
      clearInterval(this.timer);
      alert("시간 초과!!!!");
    }
  }
};
</script>

<style scoped></style>
