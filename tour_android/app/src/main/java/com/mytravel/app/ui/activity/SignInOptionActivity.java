package com.mytravel.app.ui.activity;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

import com.mytravel.app.R;
import com.mytravel.app.databinding.ActivitySignInOptionBinding;


public class SignInOptionActivity extends AppCompatActivity {

    private ActivitySignInOptionBinding mBinding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        mBinding = DataBindingUtil.setContentView(this,R.layout.activity_sign_in_option);

        mBinding.relativeSignIn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(SignInOptionActivity.this,SignInActivity.class));
                finish();
            }
        });
    }
}
