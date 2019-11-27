<template>
  <div>
    <div>QuizScore</div>
    <br />
    <table class="table table-sm" style="margin:auto">
      <thead>
        <tr table-info>
          <th scope="col">#</th>
          <th scope="col">이름</th>
          <th scope="col">점수</th>
        </tr>
      </thead>
      <tbody>
        <!-- 5개 반복해서 -->
        <tr v-for="(one, index) in top5" v-bind:key="one.id">
          <th scope="row">{{ index + 1 }}</th>
          <td>{{ one.id }}</td>
          <td>{{ one.best_quiz_score }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import Constant from "../Constant";
export default {
  name: "quizScore",
  created() {
    this.getTop5();
    setInterval(() => {
      this.getTop5();
    }, 4000);
  },
  computed: {
    top5() {
      return this.$store.state.top5;
    }
  },
  methods: {
    getTop5() {
      this.$store.dispatch(Constant.GET_TOP5);
    }
  }
};
</script>

<style scoped></style>
