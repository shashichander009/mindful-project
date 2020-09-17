import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt';

@Injectable({
  providedIn: 'root'
})
export class TokenService {

  private jwtHelper = new JwtHelperService();

  private refreshTokenURI = 'http://127.0.0.1:8000/api/token/refresh/';

  constructor(private http: HttpClient) { }

  public setAccessToken(accessToken: string) {
    localStorage.setItem('access_token', accessToken);
  }

  public setRefreshToken(refreshToken: string) {
    localStorage.setItem('refresh_token', refreshToken);
  }

  public isRefreshTokenExpired(): boolean {
    const token = localStorage.getItem('refresh_token') || undefined;
    return this.jwtHelper.isTokenExpired(token);
  }

  public getAccessToken(): boolean {

    if (!this.isRefreshTokenExpired()) {
      const headers = new HttpHeaders({
        'Content-Type': 'application/json'
      });

      const token = localStorage.getItem('refresh_token');
      const data = {
        refresh: token
      };

      this.http.post(this.refreshTokenURI, JSON.stringify(data), { observe: 'response', headers }).subscribe(res => {
        if (res.status === 200) {
          const accessToken = res.body as any;
          this.setAccessToken(accessToken.access);
        }
      });

      return true;
    } else {
      localStorage.removeItem('access_token');
      localStorage.removeItem('refresh_token');
    }
    return false;
  }
}
