import axios from "axios";

export default axios.create({
  baseURL: "http://70.12.108.106:8080/",
  headers: {
    "Content-type": "application/json"
  }
});
