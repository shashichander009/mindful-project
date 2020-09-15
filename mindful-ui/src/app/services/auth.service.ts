import { Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt'

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private jwtHelper = new JwtHelperService();

  constructor() { }

  public isAuthenticated(): boolean {
    const token = localStorage.getItem('access_token')!
    return !this.jwtHelper.isTokenExpired(token)
  }
}
