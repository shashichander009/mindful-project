import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Token } from '../models/token.model';
import { TokenService } from './token.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  userURI = 'http://127.0.0.1:8000/api/users/';
  loginURI = 'http://127.0.0.1:8000/api/login/';
  resetPasswordURI = 'http://127.0.0.1:8000/api/reset-password/';

  constructor(private http: HttpClient, private tokenService: TokenService, private router: Router) { }


  signUp(data: FormData) {

    const username = data.get('username');
    const password = data.get('password');

    this.http.post(this.userURI, data, { observe: 'response' }).subscribe((res) => {
      console.log(res);
      if (res.status === 201) {
        this.login({ username, password });
      }
    });

  }

  login(payload: any) {

    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    const jsonPayload = JSON.stringify(payload);
    console.log(jsonPayload);

    this.http.post(this.loginURI, jsonPayload, { observe: 'response', headers }).subscribe((res) => {
      if (res.status === 200) {
        const tokens = res.body as Token;
        this.tokenService.setAccessToken(tokens.access);
        this.tokenService.setRefreshToken(tokens.refresh);
        this.router.navigate(['/']);
      }

      if (res.status === 401) {
        if (this.tokenService.getAccessToken()) {
          this.router.navigate(['/']);
        } else {
          console.log(res.body);
        }
      }
    });
  }

  resetPassword(payload: any) {

    const userId = payload.email;
    const password = payload.new_password;

    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    const jsonPayload = JSON.stringify(payload);
    this.http.post(this.resetPasswordURI, jsonPayload, { observe: 'response', headers }).subscribe((res) => {
      if (res.status === 200) {
        console.log(res.body);
        this.login({ email: userId, password });
      } else {
        console.log(res);
      }
    });
  }

}
