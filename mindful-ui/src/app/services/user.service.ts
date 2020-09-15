import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Token } from '../models/token.model';
import { TokenService } from './token.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  user_uri = 'http://127.0.0.1:8000/api/users/'
  login_uri = 'http://127.0.0.1:8000/api/login/'

  constructor(private http: HttpClient, private tokenService: TokenService, private router: Router) { }


  signUp(data: FormData) {
    this.http.post(this.user_uri, data, { observe: 'response' }).subscribe((res) => {
      console.log(res)
    })
  }

  login(data: any) {

    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    })

    this.http.post(this.login_uri, data, { observe: 'response', headers: headers }).subscribe((res) => {
      if (res.status === 200) {
        const response_token = res.body as Token
        this.tokenService.setAccessToken(response_token.token.access)
        this.tokenService.setRefreshToken(response_token.token.refresh)
        this.router.navigate(['/']);
      } else if (res.status === 401) {
        if (this.tokenService.getAccessToken()) {
          this.router.navigate(['/']);
        }
      }
    })
  }
}
