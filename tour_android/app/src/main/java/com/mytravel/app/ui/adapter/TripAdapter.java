package com.mytravel.app.ui.adapter;

import android.content.Context;
import android.databinding.DataBindingUtil;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.mytravel.app.R;
import com.mytravel.app.databinding.ItemRowDashboardBinding;

public class TripAdapter extends RecyclerView.Adapter<TripAdapter.TripHolder>{

    private Context context;

    public TripAdapter(Context context) {
        this.context = context;
    }

    @NonNull
    @Override
    public TripHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {

        View view = LayoutInflater.from(context).inflate(R.layout.item_row_dashboard,viewGroup,false);

        return new TripHolder(view);

    }

    @Override
    public void onBindViewHolder(@NonNull TripHolder tripHolder, int i) {

        
    }

    @Override
    public int getItemCount() {
        return 2;
    }

    public static class TripHolder extends RecyclerView.ViewHolder{

        private ItemRowDashboardBinding mBinding;

        public TripHolder(@NonNull View itemView) {
            super(itemView);

            mBinding = DataBindingUtil.bind(itemView);

        }
    }
}
