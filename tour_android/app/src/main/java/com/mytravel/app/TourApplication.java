package com.mytravel.app;

import android.app.Application;

import uk.co.chrisjenx.calligraphy.CalligraphyConfig;

public class TourApplication extends Application{

    @Override
    public void onCreate() {
        super.onCreate();
        CalligraphyConfig.initDefault(new CalligraphyConfig.Builder()
                .setDefaultFontPath(getString(R.string.font_regular))
                .setFontAttrId(R.attr.fontPath)
                .build());
    }


}
