<template>
  <div>
    <br /><br />
    <div>Quiz2</div>
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
        <div class="col-sm" style="font-family: 'Do Hyeon'; font-size: 1.3em;">
          사용자 {{ id }}
        </div>
        <div class="col-sm" style="font-family: 'Do Hyeon'; font-size: 1.3em;">
          현재 레벨 {{ level }}
        </div>
        <div class="col-sm" style="font-family: 'Do Hyeon'; font-size: 1.3em;">
          맞춘 개수 {{ solvedCnt }}
        </div>
        <div class="col-sm" style="font-family: 'Do Hyeon'; font-size: 1.3em;">
          최고 점수 {{ bestScore }} <br />
          현재 점수 {{ score }}
        </div>
      </div>
    </div>
    <br /><br />
    <div v-if="correct == true"><h2>정답!!!</h2></div>
    <div v-if="correct == false"><br /><br /></div>
    <div class="container">
      <div class="row">
        <div class="col-sm-9" style="margin-left: auto; margin-right: auto;">
          <div v-html="quiz.question" />
          <template v-if="possible == true">
            <div class="row" v-if="quiz.answer_cnt == 2">
              <div
                class="col-8 col-sm-6 alert alert-primary"
                role="alert"
                id="quizAns"
                @click="isAnswer(1)"
                v-html="quiz.ans1"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert alert-info"
                role="alert"
                id="quizAns"
                @click="isAnswer(2)"
                v-html="quiz.ans2"
              />
            </div>
            <div class="row" v-if="quiz.answer_cnt == 3">
              <div
                class="col-6 col-md-4 alert alert-info"
                role="alert"
                id="quizAns"
                @click="isAnswer(1)"
                v-html="quiz.ans1"
              />
              &nbsp;
              <div
                class="col-6 col-md-4 alert alert-warning"
                role="alert"
                id="quizAns"
                @click="isAnswer(2)"
                v-html="quiz.ans2"
              />
              &nbsp;
              <div
                class="col-6 col-md-4 alert alert-danger"
                role="alert"
                id="quizAns"
                @click="isAnswer(3)"
                v-html="quiz.ans3"
              />
            </div>
            <div class="row" v-if="quiz.answer_cnt == 4">
              <div
                class="col-8 col-sm-6 alert alert-primary"
                role="alert"
                id="quizAns"
                @click="isAnswer(1)"
                v-html="quiz.ans1"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert alert-danger"
                role="alert"
                id="quizAns"
                @click="isAnswer(2)"
                v-html="quiz.ans2"
              />
            </div>
            <div class="row" v-if="quiz.answer_cnt == 4">
              <div
                class="cl-8 col-sm-6 alert alert-warning"
                role="alert"
                id="quizAns"
                @click="isAnswer(3)"
                v-html="quiz.ans3"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert alert-info"
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
                class="col-8 col-sm-6 alert"
                :class="{
                  'alert-dark': notAnswer(1),
                  'alert-success': thisAnswer(1)
                }"
                role="alert"
                id="quizAns"
                v-html="quiz.ans1"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert"
                :class="{
                  'alert-dark': notAnswer(2),
                  'alert-success': thisAnswer(2)
                }"
                role="alert"
                id="quizAns"
                v-html="quiz.ans2"
              />
            </div>
            <div class="row" v-if="quiz.answer_cnt == 3">
              <div
                class="col-6 col-md-4 alert"
                :class="{
                  'alert-dark': notAnswer(1),
                  'alert-success': thisAnswer(1)
                }"
                role="alert"
                id="quizAns"
                v-html="quiz.ans1"
              />
              &nbsp;
              <div
                class="col-6 col-md-4 alert"
                :class="{
                  'alert-dark': notAnswer(2),
                  'alert-success': thisAnswer(2)
                }"
                role="alert"
                id="quizAns"
                v-html="quiz.ans2"
              />
              &nbsp;
              <div
                class="col-6 col-md-4 alert"
                :class="{
                  'alert-dark': notAnswer(3),
                  'alert-success': thisAnswer(3)
                }"
                role="alert"
                id="quizAns"
                v-html="quiz.ans3"
              />
            </div>
            <div class="row" v-if="quiz.answer_cnt == 4">
              <div
                class="col-8 col-sm-6 alert"
                :class="{
                  'alert-dark': notAnswer(1),
                  'alert-success': thisAnswer(1)
                }"
                role="alert"
                id="quizAns"
                v-html="quiz.ans1"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert"
                :class="{
                  'alert-dark': notAnswer(2),
                  'alert-success': thisAnswer(2)
                }"
                role="alert"
                id="quizAns"
                v-html="quiz.ans2"
              />
            </div>
            <div class="row" v-if="quiz.answer_cnt == 4">
              <div
                class="cl-8 col-sm-6 alert"
                :class="{
                  'alert-dark': notAnswer(3),
                  'alert-success': thisAnswer(3)
                }"
                role="alert"
                id="quizAns"
                v-html="quiz.ans3"
              />
              &nbsp;
              <div
                class="col-4 col-sm-6 alert"
                :class="{
                  'alert-dark': notAnswer(4),
                  'alert-success': thisAnswer(4)
                }"
                role="alert"
                id="quizAns"
                v-html="quiz.ans4"
              />
            </div>
            <div
              class="col-8 col-sm-6 alert alert-info"
              v-html="quiz.ps_correct"
              v-if="correct == true"
              style="margin-left: auto; margin-right: auto;"
            />
            <div
              class="col-8 col-sm-4 alert alert-warning"
              v-html="quiz.ps_wrong"
              v-if="correct == false"
              style="margin-left: auto; margin-right: auto;"
            />
            <button
              type="button"
              class="btn btn-success btn-lg btn-block"
              @click="nextQuiz()"
              v-if="correct == true"
            >
              다음 문제!
            </button>
          </template>
          <br /><br /><br />
          <button
            type="button"
            class="btn btn-secondary btn-block col-sm-3"
            style="margin-right: auto;"
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
    this.$store.dispatch(Constant.GET_BESTSCORE);
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
    },
    bestScore() {
      return this.$store.state.best_quiz_score;
    }
  },
  data() {
    return {
      warning: false,
      danger: false,
      progress: 0,
      timer: "",
      possible: true,
      correct: false
    };
  },
  methods: {
    nextQuiz() {
      this.$store.state.quizNo.push(this.quiz.no);
      if (this.solvedCnt >= 10) this.$router.push("/quizEnd");
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
      this.$store.dispatch(Constant.GET_BESTSCORE, "");
    },
    isAnswer(click) {
      this.$store.dispatch(Constant.GET_TOP5);
      clearInterval(this.timer);
      if (this.quiz.answer == click) {
        this.correct = true;
        this.possible = false;
        this.$store.state.score += 100;
        this.$store.state.score += 100 - this.progress;
        this.$store.state.solvedCnt += 1;
        this.$store.state.level = parseInt(this.$store.state.solvedCnt / 4 + 1);
        if (this.bestScore < this.$store.state.score) {
          // 기록 갱신하기
          this.$store.dispatch(Constant.UPDATE_BESTSCORE, {
            bestScore: this.score
          });
        }
      } else {
        this.$store.state.quizNo = [];
        this.possible = false;
      }
      this.progress = 0;
    },
    notAnswer(val) {
      if (val == this.quiz.answer) return false;
      else return true;
    },
    thisAnswer(val) {
      if (val == this.quiz.answer) return true;
      else return false;
    }
  },
  updated() {
    // 만약 있는 거라면 다음문제
    if (this.$store.state.quizNo.indexOf(this.quiz.no) != -1) {
      this.$store.dispatch(Constant.GET_QUIZ_ONE, {
        level: this.$store.state.level
      });
    }
    if (this.progress > 60) {
      this.warning = false;
      this.danger = true;
    } else if (this.progress > 25) {
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
