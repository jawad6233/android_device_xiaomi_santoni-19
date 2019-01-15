#!/system/vendor/bin/sh

# Copyright (c) 2012-2013, 2016-2018, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

function 8937_sched_dcvs_eas()
{
    # enable governor for perf cluster
    echo 1 > /sys/devices/system/cpu/cpu0/online
    echo "schedutil" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/rate_limit_us
    #set the hispeed_freq
    echo 1094400 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/hispeed_freq
    #default value for hispeed_load is 90, for 8937 it should be 85
    echo 85 > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/hispeed_load
    ## enable governor for power cluster
    echo 1 > /sys/devices/system/cpu/cpu4/online
    echo "schedutil" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
    echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/rate_limit_us
    #set the hispeed_freq
    echo 768000 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/hispeed_freq
    #default value for hispeed_load is 90, for 8937 it should be 85
    echo 85 > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/hispeed_load

}

function 8937_sched_dcvs_hmp()
{
    # HMP scheduler settings
    echo 3 > /proc/sys/kernel/sched_window_stats_policy
    echo 3 > /proc/sys/kernel/sched_ravg_hist_size

    # HMP Task packing settings
    echo 20 > /proc/sys/kernel/sched_small_task
    echo 30 > /sys/devices/system/cpu/cpu0/sched_mostly_idle_load
    echo 30 > /sys/devices/system/cpu/cpu1/sched_mostly_idle_load
    echo 30 > /sys/devices/system/cpu/cpu2/sched_mostly_idle_load
    echo 30 > /sys/devices/system/cpu/cpu3/sched_mostly_idle_load
    echo 30 > /sys/devices/system/cpu/cpu4/sched_mostly_idle_load
    echo 30 > /sys/devices/system/cpu/cpu5/sched_mostly_idle_load
    echo 30 > /sys/devices/system/cpu/cpu6/sched_mostly_idle_load
    echo 30 > /sys/devices/system/cpu/cpu7/sched_mostly_idle_load
    echo 3 > /sys/devices/system/cpu/cpu0/sched_mostly_idle_nr_run
    echo 3 > /sys/devices/system/cpu/cpu1/sched_mostly_idle_nr_run
    echo 3 > /sys/devices/system/cpu/cpu2/sched_mostly_idle_nr_run
    echo 3 > /sys/devices/system/cpu/cpu3/sched_mostly_idle_nr_run
    echo 3 > /sys/devices/system/cpu/cpu4/sched_mostly_idle_nr_run
    echo 3 > /sys/devices/system/cpu/cpu5/sched_mostly_idle_nr_run
    echo 3 > /sys/devices/system/cpu/cpu6/sched_mostly_idle_nr_run
    echo 3 > /sys/devices/system/cpu/cpu7/sched_mostly_idle_nr_run
    echo 0 > /sys/devices/system/cpu/cpu0/sched_prefer_idle
    echo 0 > /sys/devices/system/cpu/cpu1/sched_prefer_idle
    echo 0 > /sys/devices/system/cpu/cpu2/sched_prefer_idle
    echo 0 > /sys/devices/system/cpu/cpu3/sched_prefer_idle
    echo 0 > /sys/devices/system/cpu/cpu4/sched_prefer_idle
    echo 0 > /sys/devices/system/cpu/cpu5/sched_prefer_idle
    echo 0 > /sys/devices/system/cpu/cpu6/sched_prefer_idle
    echo 0 > /sys/devices/system/cpu/cpu7/sched_prefer_idle

    # enable governor for perf cluster
    echo 1 > /sys/devices/system/cpu/cpu0/online
    echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    echo "19000 1094400:39000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
    echo 85 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
    echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
    echo 1094400 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
    echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
    echo "1 960000:85 1094400:90 1344000:80" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
    echo 40000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
    echo 40000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/sampling_down_factor

    # enable governor for power cluster
    echo 1 > /sys/devices/system/cpu/cpu4/online
    echo "interactive" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
    echo 39000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
    echo 90 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
    echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
    echo 768000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
    echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/io_is_busy
    echo "1 768000:90" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
    echo 40000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
    echo 40000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/sampling_down_factor

    # Enable sched guided freq control
    echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
    echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
    echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load
    echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
    echo 50000 > /proc/sys/kernel/sched_freq_inc_notify
    echo 50000 > /proc/sys/kernel/sched_freq_dec_notify
}

function set_cpu_parameters()
{
    # HMP scheduler settings
    echo 3 > /proc/sys/kernel/sched_window_stats_policy
    echo 3 > /proc/sys/kernel/sched_ravg_hist_size
    echo 20000000 > /proc/sys/kernel/sched_ravg_window

    #disable sched_boost in 8937
    echo 0 > /proc/sys/kernel/sched_boost

    for devfreq_gov in /sys/class/devfreq/qcom,mincpubw*/governor
    do
        echo "cpufreq" > $devfreq_gov
    done

    for devfreq_gov in /sys/class/devfreq/soc:qcom,cpubw/governor
    do
        echo "bw_hwmon" > $devfreq_gov
        for cpu_io_percent in /sys/class/devfreq/soc:qcom,cpubw/bw_hwmon/io_percent
        do
            echo 20 > $cpu_io_percent
        done
        for cpu_guard_band in /sys/class/devfreq/soc:qcom,cpubw/bw_hwmon/guard_band_mbps
        do
            echo 30 > $cpu_guard_band
        done
    done

    for gpu_bimc_io_percent in /sys/class/devfreq/soc:qcom,gpubw/bw_hwmon/io_percent
    do
        echo 40 > $gpu_bimc_io_percent
    done

    # disable thermal core_control to update interactive gov and core_ctl settings
    echo 0 > /sys/module/msm_thermal/core_control/enabled

    KernelVersionStr=`cat /proc/sys/kernel/osrelease`
    KernelVersionS=${KernelVersionStr:2:2}
    KernelVersionA=${KernelVersionStr:0:1}
    KernelVersionB=${KernelVersionS%.*}
    if [ $KernelVersionA -ge 4 ] && [ $KernelVersionB -ge 9 ]; then
        8937_sched_dcvs_eas
    else
        8937_sched_dcvs_hmp
    fi
    echo 960000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
    echo 768000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
    # Disable L2-GDHS low power modes
    echo N > /sys/module/lpm_levels/system/pwr/pwr-l2-gdhs/idle_enabled
    echo N > /sys/module/lpm_levels/system/pwr/pwr-l2-gdhs/suspend_enabled
    echo N > /sys/module/lpm_levels/system/perf/perf-l2-gdhs/idle_enabled
    echo N > /sys/module/lpm_levels/system/perf/perf-l2-gdhs/suspend_enabled

    # Bring up all cores online
    echo 1 > /sys/devices/system/cpu/cpu1/online
    echo 1 > /sys/devices/system/cpu/cpu2/online
    echo 1 > /sys/devices/system/cpu/cpu3/online
    echo 1 > /sys/devices/system/cpu/cpu4/online
    echo 1 > /sys/devices/system/cpu/cpu5/online
    echo 1 > /sys/devices/system/cpu/cpu6/online
    echo 1 > /sys/devices/system/cpu/cpu7/online

    # Enable low power modes
    echo 0 > /sys/module/lpm_levels/parameters/sleep_disabled

    # HMP scheduler (big.Little cluster related) settings
    echo 93 > /proc/sys/kernel/sched_upmigrate
    echo 83 > /proc/sys/kernel/sched_downmigrate

    # Enable core control
    echo 2 > /sys/devices/system/cpu/cpu0/core_ctl/min_cpus
    echo 4 > /sys/devices/system/cpu/cpu0/core_ctl/max_cpus
    echo 68 > /sys/devices/system/cpu/cpu0/core_ctl/busy_up_thres
    echo 40 > /sys/devices/system/cpu/cpu0/core_ctl/busy_down_thres
    echo 100 > /sys/devices/system/cpu/cpu0/core_ctl/offline_delay_ms
    echo 1 > /sys/devices/system/cpu/cpu0/core_ctl/is_big_cluster

    # re-enable thermal core_control
    echo 1 > /sys/module/msm_thermal/core_control/enabled

    # Enable dynamic clock gating
    echo 1 > /sys/module/lpm_levels/lpm_workarounds/dynamic_clock_gating
    # Enable timer migration to little cluster
    if [ -f /proc/sys/kernel/power_aware_timer_migration ]; then
        echo 1 > /proc/sys/kernel/power_aware_timer_migration
    fi
}

function configure_io_scheduler()
{
    echo bfq > /sys/block/mmcblk0/queue/scheduler
    echo bfq > /sys/block/mmcblk0rpmb/queue/scheduler

    if [ -f /sys/block/mmcblk1/queue/scheduler ]; then
        echo bfq > /sys/block/mmcblk1/queue/scheduler
    fi
}

function configure_zram_parameters()
{
    echo 0 > /proc/sys/vm/page-cluster

    if [ -f /sys/block/zram0/disksize ]; then
        echo lz4 > /sys/block/zram0/comp_algorithm
        echo 1073741824 > /sys/block/zram0/disksize
        echo 4 > /sys/block/zram0/max_comp_streams

        mkswap /dev/block/zram0
        swapon /dev/block/zram0 -p 32758
    fi
}

function configure_read_ahead_kb_values()
{
    MemTotalStr=`cat /proc/meminfo | grep MemTotal`
    MemTotal=${MemTotalStr:16:8}

    # Set 128 for <= 3GB &
    # Set 512 for > 3GB
    if [ $MemTotal -le 3145728 ]; then
        echo 256 > /sys/block/mmcblk0/bdi/read_ahead_kb
        echo 256 > /sys/block/mmcblk0/queue/read_ahead_kb
        echo 256 > /sys/block/mmcblk0rpmb/bdi/read_ahead_kb
        echo 256 > /sys/block/mmcblk0rpmb/queue/read_ahead_kb
        echo 256 > /sys/block/dm-0/queue/read_ahead_kb
        echo 256 > /sys/block/dm-1/queue/read_ahead_kb
        if [ -f /sys/block/mmcblk1/bdi/read_ahead_kb ]; then
                echo 256 > /sys/block/mmcblk1/bdi/read_ahead_kb
        fi
        if [ -f /sys/block/mmcblk1/queue/read_ahead_kb ]; then
                echo 256 > /sys/block/mmcblk1/queue/read_ahead_kb
        fi
    else
        echo 512 > /sys/block/mmcblk0/bdi/read_ahead_kb
        echo 512 > /sys/block/mmcblk0/queue/read_ahead_kb
        echo 512 > /sys/block/mmcblk0rpmb/bdi/read_ahead_kb
        echo 512 > /sys/block/mmcblk0rpmb/queue/read_ahead_kb
        echo 512 > /sys/block/dm-0/queue/read_ahead_kb
        echo 512 > /sys/block/dm-1/queue/read_ahead_kb
        if [ -f /sys/block/mmcblk1/bdi/read_ahead_kb ]; then
                echo 512 > /sys/block/mmcblk1/bdi/read_ahead_kb
        fi
        if [ -f /sys/block/mmcblk1/queue/read_ahead_kb ]; then
                echo 512 > /sys/block/mmcblk1/queue/read_ahead_kb
        fi
    fi
}

function configure_memory_parameters()
{
    arch_type=`uname -m`
    MemTotalStr=`cat /proc/meminfo | grep MemTotal`
    MemTotal=${MemTotalStr:16:8}

    # Read adj series and set adj threshold for PPR and ALMK.
    # This is required since adj values change from framework to framework.
    adj_series=`cat /sys/module/lowmemorykiller/parameters/adj`
    adj_1="${adj_series#*,}"
    set_almk_ppr_adj="${adj_1%%,*}"

    # PPR and ALMK should not act on HOME adj and below.
    # Normalized ADJ for HOME is 6. Hence multiply by 6
    # ADJ score represented as INT in LMK params, actual score can be in decimal
    # Hence add 6 considering a worst case of 0.9 conversion to INT (0.9*6).
    # For uLMK + Memcg, this will be set as 6 since adj is zero.
    set_almk_ppr_adj=$(((set_almk_ppr_adj * 6) + 6))
    echo $set_almk_ppr_adj > /sys/module/lowmemorykiller/parameters/adj_max_shift
    echo $set_almk_ppr_adj > /sys/module/process_reclaim/parameters/min_score_adj

    #Set other memory parameters
    echo 1 > /sys/module/process_reclaim/parameters/enable_process_reclaim
    echo 70 > /sys/module/process_reclaim/parameters/pressure_max
    echo 30 > /sys/module/process_reclaim/parameters/swap_opt_eff
    echo 1 > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
    if [ "$arch_type" == "aarch64" ] && [ $MemTotal -gt 2097152 ]; then
        echo 10 > /sys/module/process_reclaim/parameters/pressure_min
        echo 1024 > /sys/module/process_reclaim/parameters/per_swap_size
        echo "18432,23040,27648,32256,55296,80640" > /sys/module/lowmemorykiller/parameters/minfree
        echo 80640 > /sys/module/lowmemorykiller/parameters/vmpressure_file_min
    elif [ "$arch_type" == "aarch64" ] && [ $MemTotal -gt 1048576 ]; then
        echo 10 > /sys/module/process_reclaim/parameters/pressure_min
        echo 1024 > /sys/module/process_reclaim/parameters/per_swap_size
        echo "14746,18432,22118,25805,40000,55000" > /sys/module/lowmemorykiller/parameters/minfree
        echo 55000 > /sys/module/lowmemorykiller/parameters/vmpressure_file_min
    elif [ "$arch_type" == "aarch64" ]; then
        echo 50 > /sys/module/process_reclaim/parameters/pressure_min
        echo 512 > /sys/module/process_reclaim/parameters/per_swap_size
        echo "14746,18432,22118,25805,40000,55000" > /sys/module/lowmemorykiller/parameters/minfree
        echo 55000 > /sys/module/lowmemorykiller/parameters/vmpressure_file_min
    else
        # Set allocstall_threshold to 0 for both Go & non-go <=1GB targets
        if [ $MemTotal -le 1048576 ]; then
            echo 0 > /sys/module/vmpressure/parameters/allocstall_threshold
        fi

        if [ $MemTotal -le 1048576 ] && [ "$low_ram" == "true" ]; then
            # Disable KLMK, ALMK, PPR & Core Control for Go devices
            echo 0 > /sys/module/lowmemorykiller/parameters/enable_lmk
            echo 0 > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
            echo 0 > /sys/module/process_reclaim/parameters/enable_process_reclaim
            echo 1 > /sys/devices/system/cpu/cpu0/core_ctl/disable
        else
            # Disable Core Control, enable KLMK for non-go 8909
            if [ "$ProductName" == "msm8909" ]; then
                echo 1 > /sys/devices/system/cpu/cpu0/core_ctl/disable
                echo 1 > /sys/module/lowmemorykiller/parameters/enable_lmk
            fi
            echo 50 > /sys/module/process_reclaim/parameters/pressure_min
            echo 512 > /sys/module/process_reclaim/parameters/per_swap_size
            echo "15360,19200,23040,26880,34415,43737" > /sys/module/lowmemorykiller/parameters/minfree
            echo 53059 > /sys/module/lowmemorykiller/parameters/vmpressure_file_min
        fi
    fi

    #Enable oom_reaper
    if [ -f /sys/module/lowmemorykiller/parameters/oom_reaper ]; then
        echo 1 > /sys/module/lowmemorykiller/parameters/oom_reaper
    fi

    configure_zram_parameters

    configure_read_ahead_kb_values
}

# Configure CPU management
set_cpu_parameters
# Configure IO Scheduler
configure_io_scheduler
# Set Memory parameters
configure_memory_parameters
# Enable Parsed post_boot
setprop sys.post_boot.parsed 1

# Let kernel know our image version/variant/crm_version
if [ -f /sys/devices/soc0/select_image ]; then
    image_version="10:"
    image_version+=`getprop ro.build.id`
    image_version+=":"
    image_version+=`getprop ro.build.version.incremental`
    image_variant=`getprop ro.product.name`
    image_variant+="-"
    image_variant+=`getprop ro.build.type`
    oem_version=`getprop ro.build.version.codename`
    echo 10 > /sys/devices/soc0/select_image
    echo $image_version > /sys/devices/soc0/image_version
    echo $image_variant > /sys/devices/soc0/image_variant
    echo $oem_version > /sys/devices/soc0/image_crm_version
fi

# Change console log level as per console config property
console_config=`getprop persist.console.silent.config`
case "$console_config" in
    "1")
        echo "Enable console config to $console_config"
        echo 0 > /proc/sys/kernel/printk
        ;;
    *)
        echo "Enable console config to $console_config"
        ;;
esac

# Parse misc partition path and set property
misc_link=$(ls -l /dev/block/bootdevice/by-name/misc)
real_path=${misc_link##*>}
setprop persist.vendor.mmi.misc_dev_path $real_path

