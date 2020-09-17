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

  constructor(private http: HttpClient, private tokenService: TokenService, private router: Router) { }


  signUp(data: FormData) {
    this.http.post(this.userURI, data, { observe: 'response' }).subscribe((res) => {
      console.log(res);
    });
  }

  login(data: any) {

    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    this.http.post(this.loginURI, data, { observe: 'response', headers }).subscribe((res) => {
      if (res.status === 200) {
        const tokens = res.body as Token;
        this.tokenService.setAccessToken(tokens.access);
        this.tokenService.setRefreshToken(tokens.refresh);
        this.router.navigate(['/']);
      } else if (res.status === 401) {
        if (this.tokenService.getAccessToken()) {
          console.log('This is executing')
          this.router.navigate(['/']);
        } else {
          console.log(res.body);
        }
      }
    });
  }
}
