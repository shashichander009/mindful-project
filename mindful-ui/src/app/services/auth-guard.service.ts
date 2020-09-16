import { Injectable } from '@angular/core';
import { Router, CanActivate } from '@angular/router';
import { AuthService } from './auth.service';
import { TokenService } from './token.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardService implements CanActivate {

  constructor(public authService: AuthService, private tokenService: TokenService, public router: Router) { }

  canActivate(): boolean {
    if (!this.authService.isAuthenticated()) {
      if (this.tokenService.getAccessToken()) {
        return true
      } else {
        this.router.navigate(['login']);
        return false
      }
    }
    return true;
  }
}
