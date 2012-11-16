from django import forms
from django.forms.util import ErrorList, ErrorDict


class ChangePasswordForm(forms.Form):
    pass1 = forms.CharField(max_length=100, widget=forms.PasswordInput, required=True)
    pass2 = forms.CharField(max_length=100, widget=forms.PasswordInput, required=True)

    def clean(self):
        cleaned_data = self.cleaned_data

        errors = ErrorDict()

        if 'pass1' in self._errors or 'pass2' in self._errors:
            errors['pass1'] = ErrorList([])
            errors['pass2'] = ErrorList([])

        if cleaned_data.get('pass1') != cleaned_data.get('pass2'):
            errors['pass1'] = ErrorList([])
            errors['pass2'] = ErrorList([])

        self._errors = errors
        return cleaned_data
