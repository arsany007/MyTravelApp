package com.mytravel.app.ui.activity;

import android.databinding.DataBindingUtil;
import android.support.v4.app.Fragment;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.mytravel.app.R;
import com.mytravel.app.databinding.ActivityNavigationBinding;
import com.mytravel.app.ui.fragment.DiscoverAreaFragment;
import com.mytravel.app.ui.fragment.HomeFragment;
import com.mytravel.app.ui.fragment.PlanTripFragment;
import com.mytravel.app.ui.fragment.ProfileFragment;
import com.mytravel.app.ui.fragment.TourGuidFragment;

public class NavigationActivity extends AppCompatActivity {

    private ActivityNavigationBinding mBinding;
    private View.OnClickListener menuItemClickListener;
    private Toolbar toolbar;
    private TextView tv_toolbar;
    private ImageView image_hambarg;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        mBinding = DataBindingUtil.setContentView(this,R.layout.activity_navigation);

        toolbar = findViewById(R.id.toolbar);
        tv_toolbar = findViewById(R.id.tv_toolbar);
        image_hambarg = findViewById(R.id.img_hambarg);

        image_hambarg.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                mBinding.drawerLayout.openDrawer(GravityCompat.START);

            }
        });

        tv_toolbar.setText("Dashboard");

        toolbar.setTitle(tv_toolbar.getText().toString());

        setSupportActionBar(toolbar);

        setListener();

        showHomeFragment();

    }

    private void showHomeFragment() {
        getSupportFragmentManager().beginTransaction().add(R.id.fragment_container, new HomeFragment(), "home").commit();
    }

    private void setListener() {

        menuItemClickListener = new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (mBinding.drawerLayout.isDrawerOpen(GravityCompat.START)){
                    mBinding.drawerLayout.closeDrawer(GravityCompat.START);
                }else{
                    mBinding.drawerLayout.openDrawer(GravityCompat.START);
                }

                switch (view.getId()){

                    case R.id.menu_loginprofile :
                        replaceFragment(new ProfileFragment());
                        mBinding.drawerLayout.closeDrawers();
                        break;

                    case R.id.menu_discoverarea :
                        replaceFragment(new DiscoverAreaFragment());
                        mBinding.drawerLayout.closeDrawers();
                        break;

                    case R.id.menu_plantrip :
                        replaceFragment(new PlanTripFragment());
                        mBinding.drawerLayout.closeDrawers();
                        break;

                    case R.id.menu_tourguide :
                        replaceFragment(new TourGuidFragment());
                        mBinding.drawerLayout.closeDrawers();
                        break;

                }
            }
        };


        mBinding.nav1.menuLoginprofile.setOnClickListener(menuItemClickListener);
        mBinding.nav1.menuDiscoverarea.setOnClickListener(menuItemClickListener);
        mBinding.nav1.menuPlantrip.setOnClickListener(menuItemClickListener);
        mBinding.nav1.menuTourguide.setOnClickListener(menuItemClickListener);
        mBinding.nav1.menuFriendhangout.setOnClickListener(menuItemClickListener);
        mBinding.nav1.menuShare.setOnClickListener(menuItemClickListener);
        mBinding.nav1.menuSetting.setOnClickListener(menuItemClickListener);

    }

    public void replaceFragment(Fragment fragment){
        getSupportFragmentManager().beginTransaction().replace(R.id.fragment_container,fragment,"tag").addToBackStack("").commit();
    }
    @Override
    public void onBackPressed() {

        DrawerLayout drawerLayout = findViewById(R.id.drawer_layout);

        if (drawerLayout.isDrawerOpen(GravityCompat.START)){
            drawerLayout.closeDrawer(GravityCompat.START);
        }else {
            super.onBackPressed();
        }
    }

    public void setActionBarTitle(String title){
        tv_toolbar.setText(title);
        toolbar.setTitle(tv_toolbar.getText().toString());
    }

}
