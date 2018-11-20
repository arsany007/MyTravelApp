package com.mytravel.app.ui.adapter;

import android.content.Context;
import android.databinding.DataBindingUtil;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.text.Layout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.mytravel.app.R;
import com.mytravel.app.databinding.ItemTourdetailsliderBinding;

public class TourDetailSliderAdapter extends RecyclerView.Adapter<TourDetailSliderAdapter.TourDetailSliderHolder>{

    private Context context;

    public TourDetailSliderAdapter(Context context) {
        this.context = context;
    }

    @NonNull
    @Override
    public TourDetailSliderHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {

        View view = LayoutInflater.from(context).inflate(R.layout.item_tourdetailslider,viewGroup,false);

        return new TourDetailSliderHolder(view);

    }

    @Override
    public void onBindViewHolder(@NonNull TourDetailSliderHolder tourDetailSliderHolder, int i) {

        tourDetailSliderHolder.mBinding.imgTourslider.setImageResource(R.drawable.ic_profile1);
    }

    @Override
    public int getItemCount() {
        return 3;
    }

    public static class TourDetailSliderHolder extends RecyclerView.ViewHolder{

        private ItemTourdetailsliderBinding mBinding;

        public TourDetailSliderHolder(@NonNull View itemView) {
            super(itemView);

            mBinding = DataBindingUtil.bind(itemView);

        }
    }
}
