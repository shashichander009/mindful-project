import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';
import { formatDate } from '@angular/common';
import { UserService } from 'src/app/services/user.service';


@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.scss']
})
export class SignUpComponent implements OnInit {
  currentPage = 1;

  userPicture = '';
  selectedProfilePicture: File | undefined;

  signUpForm = this.formBuilder.group({
    email: ['', [Validators.required, Validators.email]],
    username: ['', [Validators.required, Validators.minLength(2)]],
    dateOfBirth: ['', Validators.required],
    passwords: this.formBuilder.group({
      password: ['', [Validators.required, Validators.minLength(4)]],
      confirmPassword: ['', [Validators.required]]
    }, { validator: this.matchPassword }),
    profilePicture: [''],
    name: [''],
    bio: [''],
  });

  constructor(private formBuilder: FormBuilder, private userService: UserService) { }

  ngOnInit(): void {
    this.setDefaultPicture();
  }

  get email() { return this.signUpForm.get('email'); }
  get username() { return this.signUpForm.get('username'); }
  get password() { return this.signUpForm.get('passwords.password'); }
  get dateOfBirth() { return this.signUpForm.get('dateOfBirth'); }
  get name() { return this.signUpForm.get('name'); }
  get bio() { return this.signUpForm.get('bio'); }
  get profilePicture() { return this.selectedProfilePicture; }


  matchPassword(f: FormGroup) {
    const password = f.get('password')?.value;
    const confirmPassword = f.get('confirmPassword')?.value;
    return password === confirmPassword ? null : { notSame: true };
  }

  onFormSubmit() {
    if (this.signUpForm.invalid) {
      this.changePage(1);
    }

    const formattedDate = formatDate(this.dateOfBirth?.value, 'yyyy-MM-dd', 'en-IN');

    const formData = new FormData();

    formData.append('username', this.username?.value);
    formData.append('email', this.email?.value);
    formData.append('password', this.password?.value);
    formData.append('date_of_birth', formattedDate);
    formData.append('name', this.name?.value);
    formData.append('bio', this.bio?.value);
    formData.append('profile_picture', this.profilePicture as File);

    this.userService.signUp(formData);

  }

  changePage(page: number) {
    this.currentPage = page;
  }

  setDefaultPicture() {
    this.userPicture = 'https://www.pinkvilla.com/files/styles/contentpreview/public/iron-man-star-robert-downey-jr-best-film.jpg';
  }

  showPreview(event: any) {
    if (event.target.files && event.target.files[0]) {
      const reader = new FileReader();
      reader.readAsDataURL(event.target.files[0]);
      reader.onload = (e: any) => this.userPicture = e.target.result;
      this.selectedProfilePicture = event.target.files[0];
    } else {
      this.setDefaultPicture();
    }
  }

}
