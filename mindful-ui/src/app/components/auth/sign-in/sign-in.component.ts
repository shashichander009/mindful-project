import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UserService } from 'src/app/services/user.service';
import { UtilsService } from 'src/app/services/utils.service';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.scss']
})
export class SignInComponent implements OnInit {

  currentPage = 1;

  securityQuestions = ['What is your favorite color?', 'What city were you born in?', 'What was your childhood nickname?'];

  signInForm = this.formBuilder.group({
    userId: ['', [Validators.required]],
    password: ['', [Validators.required]],
  });

  forgetPasswordForm = this.formBuilder.group({
    email: ['', [Validators.required, Validators.email]],
    dateOfBirth: ['', [Validators.required]],
    question: ['', [Validators.required]],
    answer: ['', [Validators.required]],
    passwords: this.formBuilder.group({
      password: ['', [Validators.required, Validators.minLength(4)]],
      confirmPassword: ['', [Validators.required]]
    }, { validator: this.matchPassword }),
  });

  constructor(private formBuilder: FormBuilder, private userService: UserService, private utils: UtilsService) { }

  ngOnInit(): void { }

  get userId() { return this.signInForm.get('userId'); }
  get password() { return this.signInForm.get('password'); }

  get email() { return this.forgetPasswordForm.get('email'); }
  get dateOfBirth() { return this.forgetPasswordForm.get('dateOfBirth'); }
  get question() { return this.forgetPasswordForm.get('question'); }
  get answer() { return this.forgetPasswordForm.get('answer'); }
  get fPassword() { return this.forgetPasswordForm.get('passwords.password'); }


  matchPassword(f: FormGroup) {
    const password = f.get('password')?.value;
    const confirmPassword = f.get('confirmPassword')?.value;
    return password === confirmPassword ? null : { notSame: true };
  }

  onLoginFormSubmit() {
    if (this.signInForm.valid) {
      const userId = this.userId?.value;
      const password = this.password?.value;
      if (this.utils.isValidEmail(userId)) {
        this.userService.login({ email: userId, password });
      } else {
        this.userService.login({ username: userId, password });
      }
    }
  }


  onForgetPasswordSubmit() {
    if (this.forgetPasswordForm.valid) {
      const resetPasswordPayload = {
        email: this.email?.value,
        date_of_birth: this.dateOfBirth?.value,
        security_que: this.question?.value,
        security_ans: this.answer?.value,
        new_password: this.fPassword?.value
      };

      this.userService.resetPassword(resetPasswordPayload);
    }
  }

  changePage(page: number) {
    this.currentPage = page;
  }

}
