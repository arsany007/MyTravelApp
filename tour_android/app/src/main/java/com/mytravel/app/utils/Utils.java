package com.mytravel.app.utils;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.util.Log;
import android.widget.Toast;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import static com.mytravel.app.BuildConfig.DEBUG;


public class Utils {

    private static String LOG_TAG = "Tour";

    public static void postToast(Context context, String message) {
        Toast.makeText(context, message, Toast.LENGTH_LONG).show();
    }

    public static void logD(String msg) {
        if (DEBUG) Log.d(LOG_TAG, msg);
    }

    public static void logW(String msg) {
        if (DEBUG) Log.w(LOG_TAG, msg);
    }

    public static void logE(String msg) {
        if (DEBUG) Log.e(LOG_TAG, msg);
    }

    public static boolean checkForInternetAvailability(Context applicationContext) {
        ConnectivityManager cm =
                (ConnectivityManager) applicationContext.getSystemService(Context.CONNECTIVITY_SERVICE);

        NetworkInfo activeNetwork = cm.getActiveNetworkInfo();

        return activeNetwork != null &&
                activeNetwork.isConnectedOrConnecting();
    }

    public static boolean internetFilter(Context applicationContext) {
        if (applicationContext == null) return false;
        boolean internetAvailability = checkForInternetAvailability(applicationContext);
        if (!internetAvailability) {
//            AppUtils.makeToast(applicationContext, applicationContext.getString(R.string.no_internet_connection));
            postToast(applicationContext, "No Internet Connection");
        }
        return internetAvailability;
    }

    public static String getFormattedDate(String date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        try {
            Date formatted = format.parse(date);
            SimpleDateFormat format1 = new SimpleDateFormat("dd,MMM");
            return format1.format(formatted);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }


}
