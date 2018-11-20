package com.mytravel.app.utils;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Created by nidhi on 7/12/15.
 */
public class PreferenceUtil {

    private static final String PREF_NAME = "MyTourPref";
    private static final String UserId = "USER-ID";
    private static final String UserEmail = "USER_EMAIL";
    private static final String UserName = "UserName";
    private static final String UserImage = "UserImage";
    private static final String HomeShortcut = "HomeShortCut";

    private static PreferenceUtil mInstance;
    private static SharedPreferences sharedPreferences;
    private static SharedPreferences.Editor editor;

    public PreferenceUtil(Context context) {
        sharedPreferences = context.getSharedPreferences(PREF_NAME, 0);
        editor = sharedPreferences.edit();
    }


    public static PreferenceUtil getInstance(Context context) {
        if (mInstance == null) {
            mInstance = new PreferenceUtil(context);
        }
        return mInstance;
    }

    public static String getUserEmail() {
        return sharedPreferences.getString(UserEmail, "");
    }

    public static void setUserEmail(String userEmail) {
        editor.putString(UserEmail, userEmail);
        editor.commit();
    }

    public static String getUserId() {
        return sharedPreferences.getString(UserId, "");
    }

    public static void setUserId(String userId) {
        editor.putString(UserId, userId);
        editor.commit();
    }

    public static String getUserName() {
        return sharedPreferences.getString(UserName, "");
    }

    public static void setUserName(String userId) {
        editor.putString(UserName, userId);
        editor.commit();
    }

    public static String getUserImage() {
        return sharedPreferences.getString(UserImage, "");
    }

    public static void setUserImage(String userImage) {
        editor.putString(UserImage, userImage);
        editor.commit();
    }

    public static boolean getHomeShortCutAdded() {
        return sharedPreferences.getBoolean(HomeShortcut, false);
    }

    public static void setHomeShortCutAdded(boolean userId) {
        editor.putBoolean(HomeShortcut, userId);
        editor.commit();
    }

    public static void clearPreference() {
        setUserName("");
        setUserId("");
        setUserEmail("");
    }
}
