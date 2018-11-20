package com.mytravel.app.ui.activity;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.LinearLayout;

import com.mytravel.app.R;
import com.mytravel.app.databinding.ActivitySignInBinding;


public class SignInActivity extends BaseActivity {

    private LinearLayout linear_send;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_in);
        linear_send = findViewById(R.id.linear_send_singin);

        linear_send.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                startActivity(new Intent(SignInActivity.this,NavigationActivity.class));

            }
        });
    }
}
