from __future__ import (absolute_import, division, print_function,
                        unicode_literals)

from django import forms
from django.contrib.auth import get_user_model

from . import models


class LoginForm(forms.Form):
    username = forms.CharField(max_length=150, label='Your Name')
    password = forms.CharField(max_length=128, label='Your Password',
                               widget = forms.PasswordInput())


class ThreadForm(forms.ModelForm):
    class Meta:
        model = models.Thread
        fields = ['title']
        widgets = {
            'title': forms.TextInput(attrs={'size': '20'}),
        }
        labels = {
            'title': 'Topic Name'
        }


class PostForm(forms.ModelForm):
    class Meta:
        model = models.Post
        fields = ['content']
        widgets = {
            'content': forms.Textarea(attrs={'rows': '10', 'cols': '50'}),
        }
        labels = {
            'content': 'Your Message',
        }
