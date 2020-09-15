import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  user_uri = 'http://127.0.0.1:8000/api/users/'

  constructor(private http: HttpClient) { }


  signUp(data: FormData) {
    this.http.post(this.user_uri, data, { observe: 'response' }).subscribe((res) => {
      console.log(res)
    })
  }


  login() {

  }
}
