import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }


  signUp(data: any) {
    this.http.post('https://reqres.in/api/users', data, {observe: 'response'}).subscribe((res) => {
      console.log(res.body)
    })
  }


  login() {

  }
}
