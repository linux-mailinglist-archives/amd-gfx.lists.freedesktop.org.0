Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CAC139AB4
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jan 2020 21:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CB689B55;
	Mon, 13 Jan 2020 20:27:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C0D89B55
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jan 2020 20:27:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c9so9994403wrw.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jan 2020 12:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K827RJnir/gfEyusgV1lUn2OBrkpHnuy+ExGAIPpiaE=;
 b=cfBY8U5OUgl+R0hbEATJtv2UF5Lluuu+ply3ejh4dCUb1eYKQMdXPDUztqCly0Jb1i
 mU+RUxh/b6ToZCZJXpzJI5GTwICDsfwas/sj9RHIPGXM5MjJxyJIqcuyAuNUXK52SpR0
 RZpX2Tj7xlejaVm5Mki2CLP2PzTOblgf4N3b5hMjrhL7OOfWtm5l/M+rYlCCJaz9Gg4J
 cWbv+QmWYmgLOiqygQdbPay1YK0guPCnYXGwVlbmObtkpZecRDyr3IU3lFavtt/NDsRr
 hHfYSDDk4xQztPdQmy67Hb9daBku4uwVmslKLZwiCOgV0KzMkF70DtoCj/pCsKkqQ2ll
 VeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K827RJnir/gfEyusgV1lUn2OBrkpHnuy+ExGAIPpiaE=;
 b=ECzeAJPlbQ2cPz9opoGv7N8uWeFLPFPi1KSgFBvi0nZ7KPg4GEQwxuDK+jF/SlcN4V
 ga0H790U49skjJaZGYEpBr4qZeLAR3SWxXwkyhhnu27m/S3sAoPB/EdGBpFOaXT9XVuW
 UQb3dCUJY0/YEy+fxKoOsPpNNAn0tpD2zwp1BHhp4oG1omf9U6SArG6LMQyKfWvZ3bUN
 8yj02zdUo8Zs9zN/JwRjIW4VuMM5FzXM5q/XC+h/16OR44mtrjZIzCgT8HENkcA+TPqa
 t2u4jt5R38JIoWm+XxULq2OY7KPgpVze3AoqkOPOTXKlgedkD2pSM9nXYfnmzWbRo22j
 HsTg==
X-Gm-Message-State: APjAAAV2aFLrKdZ4y7/Z0xWW/7hph4PO+BIgOTjdoIDC22teyefc7zCg
 P8CqsWacHv1Wkc6GMhlt1sOPMhA/cy5tFNVwxXMK9Q==
X-Google-Smtp-Source: APXvYqzT4hIM4C2RwDbcIj1YB0XCd1b2jlYGNH5auoU4gY4lYsVIxG4uIecYR+jSoUYc6vzvL5AmOn1XHUF5NJJbQdY=
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr20571842wrs.11.1578947225581; 
 Mon, 13 Jan 2020 12:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20200110234509.4195-1-alexander.deucher@amd.com>
 <MN2PR12MB334455C7CB4ADB0C5365D341E4350@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB334455C7CB4ADB0C5365D341E4350@MN2PR12MB3344.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Jan 2020 15:26:52 -0500
Message-ID: <CADnq5_P9YOPVWKyfRVhH9c=yJJHaWuz-BaGpG62GTFOV59jBUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu/pm: properly handle runtime pm
To: "Quan, Evan" <Evan.Quan@amd.com>
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sun, Jan 12, 2020 at 10:35 PM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> The "count" from amdgpu_set_pp_feature_status() seems with type of size_t.
> Then assignment "count = -EINVAL" may be improper.

It's fine. ssize_t is signed.  We've been doing it long before this patch.

Alex

> With that confirmed, the patch is reviewed-by: Evan Quan <evan.quan@amd.com>
>
> > -----Original Message-----
> > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex
> > Deucher
> > Sent: Saturday, January 11, 2020 7:45 AM
> > To: amd-gfx@lists.freedesktop.org
> > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
> > Subject: [PATCH 1/2] drm/amdgpu/pm: properly handle runtime pm
> >
> > If power management sysfs or debugfs files are accessed, power up the GPU
> > when necessary.
> >
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 822 ++++++++++++++++++-----
> > --
> >  1 file changed, 614 insertions(+), 208 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > index 285d460624c8..806e731c1ff4 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > @@ -37,6 +37,7 @@
> >  #include <linux/hwmon.h>
> >  #include <linux/hwmon-sysfs.h>
> >  #include <linux/nospec.h>
> > +#include <linux/pm_runtime.h>
> >  #include "hwmgr.h"
> >  #define WIDTH_4K 3840
> >
> > @@ -158,10 +159,15 @@ static ssize_t amdgpu_get_dpm_state(struct device
> > *dev,
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> >       enum amd_pm_state_type pm;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev)) {
> >               if (adev->smu.ppt_funcs->get_current_power_state)
> >                       pm = smu_get_current_power_state(&adev->smu);
> > @@ -173,6 +179,9 @@ static ssize_t amdgpu_get_dpm_state(struct device
> > *dev,
> >               pm = adev->pm.dpm.user_state;
> >       }
> >
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       return snprintf(buf, PAGE_SIZE, "%s\n",
> >                       (pm == POWER_STATE_TYPE_BATTERY) ? "battery" :
> >                       (pm == POWER_STATE_TYPE_BALANCED) ?
> > "balanced" : "performance"); @@ -186,6 +195,7 @@ static ssize_t
> > amdgpu_set_dpm_state(struct device *dev,
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> >       enum amd_pm_state_type  state;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return -EINVAL;
> > @@ -201,6 +211,10 @@ static ssize_t amdgpu_set_dpm_state(struct device
> > *dev,
> >               goto fail;
> >       }
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev)) {
> >               mutex_lock(&adev->pm.mutex);
> >               adev->pm.dpm.user_state = state;
> > @@ -212,11 +226,12 @@ static ssize_t amdgpu_set_dpm_state(struct device
> > *dev,
> >               adev->pm.dpm.user_state = state;
> >               mutex_unlock(&adev->pm.mutex);
> >
> > -             /* Can't set dpm state when the card is off */
> > -             if (!(adev->flags & AMD_IS_PX) ||
> > -                 (ddev->switch_power_state == DRM_SWITCH_POWER_ON))
> > -                     amdgpu_pm_compute_clocks(adev);
> > +             amdgpu_pm_compute_clocks(adev);
> >       }
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> > +
> >  fail:
> >       return count;
> >  }
> > @@ -288,13 +303,14 @@ static ssize_t
> > amdgpu_get_dpm_forced_performance_level(struct device *dev,
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> >       enum amd_dpm_forced_level level = 0xff;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > -     if ((adev->flags & AMD_IS_PX) &&
> > -         (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return snprintf(buf, PAGE_SIZE, "off\n");
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> >
> >       if (is_support_sw_smu(adev))
> >               level = smu_get_performance_level(&adev->smu);
> > @@ -303,6 +319,9 @@ static ssize_t
> > amdgpu_get_dpm_forced_performance_level(struct device *dev,
> >       else
> >               level = adev->pm.dpm.forced_level;
> >
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       return snprintf(buf, PAGE_SIZE, "%s\n",
> >                       (level == AMD_DPM_FORCED_LEVEL_AUTO) ? "auto" :
> >                       (level == AMD_DPM_FORCED_LEVEL_LOW) ? "low" :
> > @@ -329,11 +348,6 @@ static ssize_t
> > amdgpu_set_dpm_forced_performance_level(struct device *dev,
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return -EINVAL;
> >
> > -     /* Can't force performance level when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > -
> >       if (strncmp("low", buf, strlen("low")) == 0) {
> >               level = AMD_DPM_FORCED_LEVEL_LOW;
> >       } else if (strncmp("high", buf, strlen("high")) == 0) { @@ -353,17
> > +367,23 @@ static ssize_t amdgpu_set_dpm_forced_performance_level(struct
> > device *dev,
> >       } else if (strncmp("profile_peak", buf, strlen("profile_peak")) == 0) {
> >               level = AMD_DPM_FORCED_LEVEL_PROFILE_PEAK;
> >       }  else {
> > -             count = -EINVAL;
> > -             goto fail;
> > +             return -EINVAL;
> >       }
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> >               current_level = smu_get_performance_level(&adev->smu);
> >       else if (adev->powerplay.pp_funcs->get_performance_level)
> >               current_level = amdgpu_dpm_get_performance_level(adev);
> >
> > -     if (current_level == level)
> > +     if (current_level == level) {
> > +             pm_runtime_mark_last_busy(ddev->dev);
> > +             pm_runtime_put_autosuspend(ddev->dev);
> >               return count;
> > +     }
> >
> >       /* profile_exit setting is valid only when current mode is in profile
> > mode */
> >       if (!(current_level & (AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD
> > | @@ -372,6 +392,8 @@ static ssize_t
> > amdgpu_set_dpm_forced_performance_level(struct device *dev,
> >           AMD_DPM_FORCED_LEVEL_PROFILE_PEAK)) &&
> >           (level == AMD_DPM_FORCED_LEVEL_PROFILE_EXIT)) {
> >               pr_err("Currently not in any profile mode!\n");
> > +             pm_runtime_mark_last_busy(ddev->dev);
> > +             pm_runtime_put_autosuspend(ddev->dev);
> >               return -EINVAL;
> >       }
> >
> > @@ -382,9 +404,10 @@ static ssize_t
> > amdgpu_set_dpm_forced_performance_level(struct device *dev,
> >       } else if (adev->powerplay.pp_funcs->force_performance_level) {
> >               mutex_lock(&adev->pm.mutex);
> >               if (adev->pm.dpm.thermal_active) {
> > -                     count = -EINVAL;
> >                       mutex_unlock(&adev->pm.mutex);
> > -                     goto fail;
> > +                     pm_runtime_mark_last_busy(ddev->dev);
> > +                     pm_runtime_put_autosuspend(ddev->dev);
> > +                     return -EINVAL;
> >               }
> >               ret = amdgpu_dpm_force_performance_level(adev, level);
> >               if (ret)
> > @@ -393,8 +416,9 @@ static ssize_t
> > amdgpu_set_dpm_forced_performance_level(struct device *dev,
> >                       adev->pm.dpm.forced_level = level;
> >               mutex_unlock(&adev->pm.mutex);
> >       }
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> >
> > -fail:
> >       return count;
> >  }
> >
> > @@ -407,6 +431,10 @@ static ssize_t amdgpu_get_pp_num_states(struct
> > device *dev,
> >       struct pp_states_info data;
> >       int i, buf_len, ret;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev)) {
> >               ret = smu_get_power_num_states(&adev->smu, &data);
> >               if (ret)
> > @@ -414,6 +442,9 @@ static ssize_t amdgpu_get_pp_num_states(struct
> > device *dev,
> >       } else if (adev->powerplay.pp_funcs->get_pp_num_states)
> >               amdgpu_dpm_get_pp_num_states(adev, &data);
> >
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       buf_len = snprintf(buf, PAGE_SIZE, "states: %d\n", data.nums);
> >       for (i = 0; i < data.nums; i++)
> >               buf_len += snprintf(buf + buf_len, PAGE_SIZE, "%d %s\n", i,
> > @@ -439,6 +470,10 @@ static ssize_t amdgpu_get_pp_cur_state(struct device
> > *dev,
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev)) {
> >               pm = smu_get_current_power_state(smu);
> >               ret = smu_get_power_num_states(smu, &data); @@ -450,6
> > +485,9 @@ static ssize_t amdgpu_get_pp_cur_state(struct device *dev,
> >               amdgpu_dpm_get_pp_num_states(adev, &data);
> >       }
> >
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       for (i = 0; i < data.nums; i++) {
> >               if (pm == data.states[i])
> >                       break;
> > @@ -500,14 +538,18 @@ static ssize_t amdgpu_set_pp_force_state(struct
> > device *dev,
> >               struct pp_states_info data;
> >
> >               ret = kstrtoul(buf, 0, &idx);
> > -             if (ret || idx >= ARRAY_SIZE(data.states)) {
> > -                     count = -EINVAL;
> > -                     goto fail;
> > -             }
> > +             if (ret || idx >= ARRAY_SIZE(data.states))
> > +                     return -EINVAL;
> > +
> >               idx = array_index_nospec(idx, ARRAY_SIZE(data.states));
> >
> >               amdgpu_dpm_get_pp_num_states(adev, &data);
> >               state = data.states[idx];
> > +
> > +             ret = pm_runtime_get_sync(ddev->dev);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> >               /* only set user selected power states */
> >               if (state != POWER_STATE_TYPE_INTERNAL_BOOT &&
> >                   state != POWER_STATE_TYPE_DEFAULT) { @@ -515,8
> > +557,10 @@ static ssize_t amdgpu_set_pp_force_state(struct device *dev,
> >                                       AMD_PP_TASK_ENABLE_USER_STATE,
> > &state);
> >                       adev->pp_force_state_enabled = true;
> >               }
> > +             pm_runtime_mark_last_busy(ddev->dev);
> > +             pm_runtime_put_autosuspend(ddev->dev);
> >       }
> > -fail:
> > +
> >       return count;
> >  }
> >
> > @@ -538,20 +582,32 @@ static ssize_t amdgpu_get_pp_table(struct device
> > *dev,
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> >       char *table = NULL;
> > -     int size;
> > +     int size, ret;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev)) {
> >               size = smu_sys_get_pp_table(&adev->smu, (void **)&table);
> > +             pm_runtime_mark_last_busy(ddev->dev);
> > +             pm_runtime_put_autosuspend(ddev->dev);
> >               if (size < 0)
> >                       return size;
> > -     }
> > -     else if (adev->powerplay.pp_funcs->get_pp_table)
> > +     } else if (adev->powerplay.pp_funcs->get_pp_table) {
> >               size = amdgpu_dpm_get_pp_table(adev, &table);
> > -     else
> > +             pm_runtime_mark_last_busy(ddev->dev);
> > +             pm_runtime_put_autosuspend(ddev->dev);
> > +             if (size < 0)
> > +                     return size;
> > +     } else {
> > +             pm_runtime_mark_last_busy(ddev->dev);
> > +             pm_runtime_put_autosuspend(ddev->dev);
> >               return 0;
> > +     }
> >
> >       if (size >= PAGE_SIZE)
> >               size = PAGE_SIZE - 1;
> > @@ -573,13 +629,23 @@ static ssize_t amdgpu_set_pp_table(struct device
> > *dev,
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return -EINVAL;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev)) {
> >               ret = smu_sys_set_pp_table(&adev->smu, (void *)buf, count);
> > -             if (ret)
> > +             if (ret) {
> > +                     pm_runtime_mark_last_busy(ddev->dev);
> > +                     pm_runtime_put_autosuspend(ddev->dev);
> >                       return ret;
> > +             }
> >       } else if (adev->powerplay.pp_funcs->set_pp_table)
> >               amdgpu_dpm_set_pp_table(adev, buf, count);
> >
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       return count;
> >  }
> >
> > @@ -703,18 +769,28 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct
> > device *dev,
> >                       tmp_str++;
> >       }
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev)) {
> >               ret = smu_od_edit_dpm_table(&adev->smu, type,
> >                                           parameter, parameter_size);
> >
> > -             if (ret)
> > +             if (ret) {
> > +                     pm_runtime_mark_last_busy(ddev->dev);
> > +                     pm_runtime_put_autosuspend(ddev->dev);
> >                       return -EINVAL;
> > +             }
> >       } else {
> >               if (adev->powerplay.pp_funcs->odn_edit_dpm_table) {
> >                       ret = amdgpu_dpm_odn_edit_dpm_table(adev, type,
> >                                               parameter, parameter_size);
> > -                     if (ret)
> > +                     if (ret) {
> > +                             pm_runtime_mark_last_busy(ddev->dev);
> > +                             pm_runtime_put_autosuspend(ddev->dev);
> >                               return -EINVAL;
> > +                     }
> >               }
> >
> >               if (type == PP_OD_COMMIT_DPM_TABLE) { @@ -722,12
> > +798,18 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct device *dev,
> >                               amdgpu_dpm_dispatch_task(adev,
> >
> >       AMD_PP_TASK_READJUST_POWER_STATE,
> >                                               NULL);
> > +                             pm_runtime_mark_last_busy(ddev->dev);
> > +                             pm_runtime_put_autosuspend(ddev->dev);
> >                               return count;
> >                       } else {
> > +                             pm_runtime_mark_last_busy(ddev->dev);
> > +                             pm_runtime_put_autosuspend(ddev->dev);
> >                               return -EINVAL;
> >                       }
> >               }
> >       }
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> >
> >       return count;
> >  }
> > @@ -738,27 +820,33 @@ static ssize_t amdgpu_get_pp_od_clk_voltage(struct
> > device *dev,  {
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> > -     uint32_t size = 0;
> > +     ssize_t size;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev)) {
> >               size = smu_print_clk_levels(&adev->smu, SMU_OD_SCLK, buf);
> >               size += smu_print_clk_levels(&adev->smu, SMU_OD_MCLK,
> > buf+size);
> >               size += smu_print_clk_levels(&adev->smu,
> > SMU_OD_VDDC_CURVE, buf+size);
> >               size += smu_print_clk_levels(&adev->smu, SMU_OD_RANGE,
> > buf+size);
> > -             return size;
> >       } else if (adev->powerplay.pp_funcs->print_clock_levels) {
> >               size = amdgpu_dpm_print_clock_levels(adev, OD_SCLK, buf);
> >               size += amdgpu_dpm_print_clock_levels(adev, OD_MCLK,
> > buf+size);
> >               size += amdgpu_dpm_print_clock_levels(adev,
> > OD_VDDC_CURVE, buf+size);
> >               size += amdgpu_dpm_print_clock_levels(adev, OD_RANGE,
> > buf+size);
> > -             return size;
> >       } else {
> > -             return snprintf(buf, PAGE_SIZE, "\n");
> > +             size = snprintf(buf, PAGE_SIZE, "\n");
> >       }
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> >
> > +     return size;
> >  }
> >
> >  /**
> > @@ -796,15 +884,21 @@ static ssize_t amdgpu_set_pp_feature_status(struct
> > device *dev,
> >
> >       pr_debug("featuremask = 0x%llx\n", featuremask);
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev)) {
> >               ret = smu_sys_set_pp_feature_mask(&adev->smu,
> > featuremask);
> >               if (ret)
> > -                     return -EINVAL;
> > +                     count = -EINVAL;
> >       } else if (adev->powerplay.pp_funcs->set_ppfeature_status) {
> >               ret = amdgpu_dpm_set_ppfeature_status(adev, featuremask);
> >               if (ret)
> > -                     return -EINVAL;
> > +                     count = -EINVAL;
> >       }
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> >
> >       return count;
> >  }
> > @@ -815,16 +909,27 @@ static ssize_t amdgpu_get_pp_feature_status(struct
> > device *dev,  {
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> > +     ssize_t size;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev))
> >               return 0;
> >
> > -     if (is_support_sw_smu(adev)) {
> > -             return smu_sys_get_pp_feature_mask(&adev->smu, buf);
> > -     } else if (adev->powerplay.pp_funcs->get_ppfeature_status)
> > -             return amdgpu_dpm_get_ppfeature_status(adev, buf);
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (is_support_sw_smu(adev))
> > +             size = smu_sys_get_pp_feature_mask(&adev->smu, buf);
> > +     else if (adev->powerplay.pp_funcs->get_ppfeature_status)
> > +             size = amdgpu_dpm_get_ppfeature_status(adev, buf);
> > +     else
> > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> >
> > -     return snprintf(buf, PAGE_SIZE, "\n");
> > +     return size;
> >  }
> >
> >  /**
> > @@ -863,16 +968,27 @@ static ssize_t amdgpu_get_pp_dpm_sclk(struct
> > device *dev,  {
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> > +     ssize_t size;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> > -             return smu_print_clk_levels(&adev->smu, SMU_SCLK, buf);
> > +             size = smu_print_clk_levels(&adev->smu, SMU_SCLK, buf);
> >       else if (adev->powerplay.pp_funcs->print_clock_levels)
> > -             return amdgpu_dpm_print_clock_levels(adev, PP_SCLK, buf);
> > +             size = amdgpu_dpm_print_clock_levels(adev, PP_SCLK, buf);
> >       else
> > -             return snprintf(buf, PAGE_SIZE, "\n");
> > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> > +     return size;
> >  }
> >
> >  /*
> > @@ -928,11 +1044,18 @@ static ssize_t amdgpu_set_pp_dpm_sclk(struct
> > device *dev,
> >       if (ret)
> >               return ret;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> >               ret = smu_force_clk_levels(&adev->smu, SMU_SCLK, mask,
> > true);
> >       else if (adev->powerplay.pp_funcs->force_clock_level)
> >               ret = amdgpu_dpm_force_clock_level(adev, PP_SCLK, mask);
> >
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       if (ret)
> >               return -EINVAL;
> >
> > @@ -945,16 +1068,27 @@ static ssize_t amdgpu_get_pp_dpm_mclk(struct
> > device *dev,  {
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> > +     ssize_t size;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> > -             return smu_print_clk_levels(&adev->smu, SMU_MCLK, buf);
> > +             size = smu_print_clk_levels(&adev->smu, SMU_MCLK, buf);
> >       else if (adev->powerplay.pp_funcs->print_clock_levels)
> > -             return amdgpu_dpm_print_clock_levels(adev, PP_MCLK, buf);
> > +             size = amdgpu_dpm_print_clock_levels(adev, PP_MCLK, buf);
> >       else
> > -             return snprintf(buf, PAGE_SIZE, "\n");
> > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> > +     return size;
> >  }
> >
> >  static ssize_t amdgpu_set_pp_dpm_mclk(struct device *dev, @@ -964,8
> > +1098,8 @@ static ssize_t amdgpu_set_pp_dpm_mclk(struct device *dev,  {
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> > -     int ret;
> >       uint32_t mask = 0;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >                       return -EINVAL;
> > @@ -974,11 +1108,18 @@ static ssize_t amdgpu_set_pp_dpm_mclk(struct
> > device *dev,
> >       if (ret)
> >               return ret;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> >               ret = smu_force_clk_levels(&adev->smu, SMU_MCLK, mask,
> > true);
> >       else if (adev->powerplay.pp_funcs->force_clock_level)
> >               ret = amdgpu_dpm_force_clock_level(adev, PP_MCLK, mask);
> >
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       if (ret)
> >               return -EINVAL;
> >
> > @@ -991,16 +1132,27 @@ static ssize_t amdgpu_get_pp_dpm_socclk(struct
> > device *dev,  {
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> > +     ssize_t size;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> > -             return smu_print_clk_levels(&adev->smu, SMU_SOCCLK, buf);
> > +             size = smu_print_clk_levels(&adev->smu, SMU_SOCCLK, buf);
> >       else if (adev->powerplay.pp_funcs->print_clock_levels)
> > -             return amdgpu_dpm_print_clock_levels(adev, PP_SOCCLK, buf);
> > +             size = amdgpu_dpm_print_clock_levels(adev, PP_SOCCLK, buf);
> >       else
> > -             return snprintf(buf, PAGE_SIZE, "\n");
> > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> > +     return size;
> >  }
> >
> >  static ssize_t amdgpu_set_pp_dpm_socclk(struct device *dev, @@ -1020,10
> > +1172,19 @@ static ssize_t amdgpu_set_pp_dpm_socclk(struct device *dev,
> >       if (ret)
> >               return ret;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> >               ret = smu_force_clk_levels(&adev->smu, SMU_SOCCLK, mask,
> > true);
> >       else if (adev->powerplay.pp_funcs->force_clock_level)
> >               ret = amdgpu_dpm_force_clock_level(adev, PP_SOCCLK, mask);
> > +     else
> > +             ret = 0;
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> >
> >       if (ret)
> >               return -EINVAL;
> > @@ -1037,16 +1198,27 @@ static ssize_t amdgpu_get_pp_dpm_fclk(struct
> > device *dev,  {
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> > +     ssize_t size;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> > -             return smu_print_clk_levels(&adev->smu, SMU_FCLK, buf);
> > +             size = smu_print_clk_levels(&adev->smu, SMU_FCLK, buf);
> >       else if (adev->powerplay.pp_funcs->print_clock_levels)
> > -             return amdgpu_dpm_print_clock_levels(adev, PP_FCLK, buf);
> > +             size = amdgpu_dpm_print_clock_levels(adev, PP_FCLK, buf);
> >       else
> > -             return snprintf(buf, PAGE_SIZE, "\n");
> > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> > +     return size;
> >  }
> >
> >  static ssize_t amdgpu_set_pp_dpm_fclk(struct device *dev, @@ -1066,10
> > +1238,19 @@ static ssize_t amdgpu_set_pp_dpm_fclk(struct device *dev,
> >       if (ret)
> >               return ret;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> >               ret = smu_force_clk_levels(&adev->smu, SMU_FCLK, mask,
> > true);
> >       else if (adev->powerplay.pp_funcs->force_clock_level)
> >               ret = amdgpu_dpm_force_clock_level(adev, PP_FCLK, mask);
> > +     else
> > +             ret = 0;
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> >
> >       if (ret)
> >               return -EINVAL;
> > @@ -1083,16 +1264,27 @@ static ssize_t amdgpu_get_pp_dpm_dcefclk(struct
> > device *dev,  {
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> > +     ssize_t size;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> > -             return smu_print_clk_levels(&adev->smu, SMU_DCEFCLK, buf);
> > +             size = smu_print_clk_levels(&adev->smu, SMU_DCEFCLK, buf);
> >       else if (adev->powerplay.pp_funcs->print_clock_levels)
> > -             return amdgpu_dpm_print_clock_levels(adev, PP_DCEFCLK,
> > buf);
> > +             size = amdgpu_dpm_print_clock_levels(adev, PP_DCEFCLK,
> > buf);
> >       else
> > -             return snprintf(buf, PAGE_SIZE, "\n");
> > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> > +     return size;
> >  }
> >
> >  static ssize_t amdgpu_set_pp_dpm_dcefclk(struct device *dev, @@ -1112,10
> > +1304,19 @@ static ssize_t amdgpu_set_pp_dpm_dcefclk(struct device *dev,
> >       if (ret)
> >               return ret;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> >               ret = smu_force_clk_levels(&adev->smu, SMU_DCEFCLK, mask,
> > true);
> >       else if (adev->powerplay.pp_funcs->force_clock_level)
> >               ret = amdgpu_dpm_force_clock_level(adev, PP_DCEFCLK,
> > mask);
> > +     else
> > +             ret = 0;
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> >
> >       if (ret)
> >               return -EINVAL;
> > @@ -1129,16 +1330,27 @@ static ssize_t amdgpu_get_pp_dpm_pcie(struct
> > device *dev,  {
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> > +     ssize_t size;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> > -             return smu_print_clk_levels(&adev->smu, SMU_PCIE, buf);
> > +             size = smu_print_clk_levels(&adev->smu, SMU_PCIE, buf);
> >       else if (adev->powerplay.pp_funcs->print_clock_levels)
> > -             return amdgpu_dpm_print_clock_levels(adev, PP_PCIE, buf);
> > +             size = amdgpu_dpm_print_clock_levels(adev, PP_PCIE, buf);
> >       else
> > -             return snprintf(buf, PAGE_SIZE, "\n");
> > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> > +     return size;
> >  }
> >
> >  static ssize_t amdgpu_set_pp_dpm_pcie(struct device *dev, @@ -1158,10
> > +1370,19 @@ static ssize_t amdgpu_set_pp_dpm_pcie(struct device *dev,
> >       if (ret)
> >               return ret;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> >               ret = smu_force_clk_levels(&adev->smu, SMU_PCIE, mask,
> > true);
> >       else if (adev->powerplay.pp_funcs->force_clock_level)
> >               ret = amdgpu_dpm_force_clock_level(adev, PP_PCIE, mask);
> > +     else
> > +             ret = 0;
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> >
> >       if (ret)
> >               return -EINVAL;
> > @@ -1176,15 +1397,23 @@ static ssize_t amdgpu_get_pp_sclk_od(struct
> > device *dev,
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> >       uint32_t value = 0;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> >               value = smu_get_od_percentage(&(adev->smu),
> > SMU_OD_SCLK);
> >       else if (adev->powerplay.pp_funcs->get_sclk_od)
> >               value = amdgpu_dpm_get_sclk_od(adev);
> >
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       return snprintf(buf, PAGE_SIZE, "%d\n", value);  }
> >
> > @@ -1203,10 +1432,12 @@ static ssize_t amdgpu_set_pp_sclk_od(struct
> > device *dev,
> >
> >       ret = kstrtol(buf, 0, &value);
> >
> > -     if (ret) {
> > -             count = -EINVAL;
> > -             goto fail;
> > -     }
> > +     if (ret)
> > +             return -EINVAL;
> > +
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> >
> >       if (is_support_sw_smu(adev)) {
> >               value = smu_set_od_percentage(&(adev->smu),
> > SMU_OD_SCLK, (uint32_t)value); @@ -1222,7 +1453,9 @@ static ssize_t
> > amdgpu_set_pp_sclk_od(struct device *dev,
> >               }
> >       }
> >
> > -fail:
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       return count;
> >  }
> >
> > @@ -1233,15 +1466,23 @@ static ssize_t amdgpu_get_pp_mclk_od(struct
> > device *dev,
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> >       uint32_t value = 0;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> >               value = smu_get_od_percentage(&(adev->smu),
> > SMU_OD_MCLK);
> >       else if (adev->powerplay.pp_funcs->get_mclk_od)
> >               value = amdgpu_dpm_get_mclk_od(adev);
> >
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       return snprintf(buf, PAGE_SIZE, "%d\n", value);  }
> >
> > @@ -1260,10 +1501,12 @@ static ssize_t amdgpu_set_pp_mclk_od(struct
> > device *dev,
> >
> >       ret = kstrtol(buf, 0, &value);
> >
> > -     if (ret) {
> > -             count = -EINVAL;
> > -             goto fail;
> > -     }
> > +     if (ret)
> > +             return -EINVAL;
> > +
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> >
> >       if (is_support_sw_smu(adev)) {
> >               value = smu_set_od_percentage(&(adev->smu),
> > SMU_OD_MCLK, (uint32_t)value); @@ -1279,7 +1522,9 @@ static ssize_t
> > amdgpu_set_pp_mclk_od(struct device *dev,
> >               }
> >       }
> >
> > -fail:
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       return count;
> >  }
> >
> > @@ -1309,16 +1554,27 @@ static ssize_t
> > amdgpu_get_pp_power_profile_mode(struct device *dev,  {
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> > +     ssize_t size;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> > -             return smu_get_power_profile_mode(&adev->smu, buf);
> > +             size = smu_get_power_profile_mode(&adev->smu, buf);
> >       else if (adev->powerplay.pp_funcs->get_power_profile_mode)
> > -             return amdgpu_dpm_get_power_profile_mode(adev, buf);
> > +             size = amdgpu_dpm_get_power_profile_mode(adev, buf);
> > +     else
> > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> >
> > -     return snprintf(buf, PAGE_SIZE, "\n");
> > +     return size;
> >  }
> >
> >
> > @@ -1343,7 +1599,7 @@ static ssize_t
> > amdgpu_set_pp_power_profile_mode(struct device *dev,
> >       tmp[1] = '\0';
> >       ret = kstrtol(tmp, 0, &profile_mode);
> >       if (ret)
> > -             goto fail;
> > +             return -EINVAL;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return -EINVAL;
> > @@ -1358,23 +1614,30 @@ static ssize_t
> > amdgpu_set_pp_power_profile_mode(struct device *dev,
> >               while (tmp_str[0]) {
> >                       sub_str = strsep(&tmp_str, delimiter);
> >                       ret = kstrtol(sub_str, 0, &parameter[parameter_size]);
> > -                     if (ret) {
> > -                             count = -EINVAL;
> > -                             goto fail;
> > -                     }
> > +                     if (ret)
> > +                             return -EINVAL;
> >                       parameter_size++;
> >                       while (isspace(*tmp_str))
> >                               tmp_str++;
> >               }
> >       }
> >       parameter[parameter_size] = profile_mode;
> > +
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev))
> >               ret = smu_set_power_profile_mode(&adev->smu, parameter,
> > parameter_size, true);
> >       else if (adev->powerplay.pp_funcs->set_power_profile_mode)
> >               ret = amdgpu_dpm_set_power_profile_mode(adev, parameter,
> > parameter_size);
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       if (!ret)
> >               return count;
> > -fail:
> > +
> >       return -EINVAL;
> >  }
> >
> > @@ -1397,10 +1660,17 @@ static ssize_t amdgpu_get_busy_percent(struct
> > device *dev,
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > +     r = pm_runtime_get_sync(ddev->dev);
> > +     if (r < 0)
> > +             return r;
> > +
> >       /* read the IP busy sensor */
> >       r = amdgpu_dpm_read_sensor(adev,
> > AMDGPU_PP_SENSOR_GPU_LOAD,
> >                                  (void *)&value, &size);
> >
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       if (r)
> >               return r;
> >
> > @@ -1426,10 +1696,17 @@ static ssize_t
> > amdgpu_get_memory_busy_percent(struct device *dev,
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > +     r = pm_runtime_get_sync(ddev->dev);
> > +     if (r < 0)
> > +             return r;
> > +
> >       /* read the IP busy sensor */
> >       r = amdgpu_dpm_read_sensor(adev,
> > AMDGPU_PP_SENSOR_MEM_LOAD,
> >                                  (void *)&value, &size);
> >
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       if (r)
> >               return r;
> >
> > @@ -1455,11 +1732,20 @@ static ssize_t amdgpu_get_pcie_bw(struct device
> > *dev,
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = ddev->dev_private;
> >       uint64_t count0, count1;
> > +     int ret;
> >
> >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> >               return 0;
> >
> > +     ret = pm_runtime_get_sync(ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       amdgpu_asic_get_pcie_usage(adev, &count0, &count1);
> > +
> > +     pm_runtime_mark_last_busy(ddev->dev);
> > +     pm_runtime_put_autosuspend(ddev->dev);
> > +
> >       return snprintf(buf, PAGE_SIZE, "%llu %llu %i\n",
> >                       count0, count1, pcie_get_mps(adev->pdev));  } @@ -
> > 1547,42 +1833,43 @@ static ssize_t amdgpu_hwmon_show_temp(struct device
> > *dev,
> >                                     char *buf)
> >  {
> >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > -     struct drm_device *ddev = adev->ddev;
> >       int channel = to_sensor_dev_attr(attr)->index;
> >       int r, temp = 0, size = sizeof(temp);
> >
> > -     /* Can't get temperature when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > -
> >       if (channel >= PP_TEMP_MAX)
> >               return -EINVAL;
> >
> > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (r < 0)
> > +             return r;
> > +
> >       switch (channel) {
> >       case PP_TEMP_JUNCTION:
> >               /* get current junction temperature */
> >               r = amdgpu_dpm_read_sensor(adev,
> > AMDGPU_PP_SENSOR_HOTSPOT_TEMP,
> >                                          (void *)&temp, &size);
> > -             if (r)
> > -                     return r;
> >               break;
> >       case PP_TEMP_EDGE:
> >               /* get current edge temperature */
> >               r = amdgpu_dpm_read_sensor(adev,
> > AMDGPU_PP_SENSOR_EDGE_TEMP,
> >                                          (void *)&temp, &size);
> > -             if (r)
> > -                     return r;
> >               break;
> >       case PP_TEMP_MEM:
> >               /* get current memory temperature */
> >               r = amdgpu_dpm_read_sensor(adev,
> > AMDGPU_PP_SENSOR_MEM_TEMP,
> >                                          (void *)&temp, &size);
> > -             if (r)
> > -                     return r;
> > +             break;
> > +     default:
> > +             r = -EINVAL;
> >               break;
> >       }
> >
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> > +     if (r)
> > +             return r;
> > +
> >       return snprintf(buf, PAGE_SIZE, "%d\n", temp);  }
> >
> > @@ -1678,16 +1965,27 @@ static ssize_t
> > amdgpu_hwmon_get_pwm1_enable(struct device *dev,  {
> >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> >       u32 pwm_mode = 0;
> > +     int ret;
> > +
> > +     ret = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> >
> >       if (is_support_sw_smu(adev)) {
> >               pwm_mode = smu_get_fan_control_mode(&adev->smu);
> >       } else {
> > -             if (!adev->powerplay.pp_funcs->get_fan_control_mode)
> > +             if (!adev->powerplay.pp_funcs->get_fan_control_mode) {
> > +                     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +                     pm_runtime_put_autosuspend(adev->ddev->dev);
> >                       return -EINVAL;
> > +             }
> >
> >               pwm_mode = amdgpu_dpm_get_fan_control_mode(adev);
> >       }
> >
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> >       return sprintf(buf, "%i\n", pwm_mode);  }
> >
> > @@ -1697,27 +1995,32 @@ static ssize_t
> > amdgpu_hwmon_set_pwm1_enable(struct device *dev,
> >                                           size_t count)
> >  {
> >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > -     int err;
> > +     int err, ret;
> >       int value;
> >
> > -     /* Can't adjust fan when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > -
> >       err = kstrtoint(buf, 10, &value);
> >       if (err)
> >               return err;
> >
> > +     ret = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (is_support_sw_smu(adev)) {
> >               smu_set_fan_control_mode(&adev->smu, value);
> >       } else {
> > -             if (!adev->powerplay.pp_funcs->set_fan_control_mode)
> > +             if (!adev->powerplay.pp_funcs->set_fan_control_mode) {
> > +                     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +                     pm_runtime_put_autosuspend(adev->ddev->dev);
> >                       return -EINVAL;
> > +             }
> >
> >               amdgpu_dpm_set_fan_control_mode(adev, value);
> >       }
> >
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> >       return count;
> >  }
> >
> > @@ -1744,34 +2047,43 @@ static ssize_t amdgpu_hwmon_set_pwm1(struct
> > device *dev,
> >       u32 value;
> >       u32 pwm_mode;
> >
> > -     /* Can't adjust fan when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (err < 0)
> > +             return err;
> > +
> >       if (is_support_sw_smu(adev))
> >               pwm_mode = smu_get_fan_control_mode(&adev->smu);
> >       else
> >               pwm_mode = amdgpu_dpm_get_fan_control_mode(adev);
> > +
> >       if (pwm_mode != AMD_FAN_CTRL_MANUAL) {
> >               pr_info("manual fan speed control should be enabled first\n");
> > +             pm_runtime_mark_last_busy(adev->ddev->dev);
> > +             pm_runtime_put_autosuspend(adev->ddev->dev);
> >               return -EINVAL;
> >       }
> >
> >       err = kstrtou32(buf, 10, &value);
> > -     if (err)
> > +     if (err) {
> > +             pm_runtime_mark_last_busy(adev->ddev->dev);
> > +             pm_runtime_put_autosuspend(adev->ddev->dev);
> >               return err;
> > +     }
> >
> >       value = (value * 100) / 255;
> >
> > -     if (is_support_sw_smu(adev)) {
> > +     if (is_support_sw_smu(adev))
> >               err = smu_set_fan_speed_percent(&adev->smu, value);
> > -             if (err)
> > -                     return err;
> > -     } else if (adev->powerplay.pp_funcs->set_fan_speed_percent) {
> > +     else if (adev->powerplay.pp_funcs->set_fan_speed_percent)
> >               err = amdgpu_dpm_set_fan_speed_percent(adev, value);
> > -             if (err)
> > -                     return err;
> > -     }
> > +     else
> > +             err = -EINVAL;
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> > +     if (err)
> > +             return err;
> >
> >       return count;
> >  }
> > @@ -1784,20 +2096,22 @@ static ssize_t amdgpu_hwmon_get_pwm1(struct
> > device *dev,
> >       int err;
> >       u32 speed = 0;
> >
> > -     /* Can't adjust fan when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (err < 0)
> > +             return err;
> >
> > -     if (is_support_sw_smu(adev)) {
> > +     if (is_support_sw_smu(adev))
> >               err = smu_get_fan_speed_percent(&adev->smu, &speed);
> > -             if (err)
> > -                     return err;
> > -     } else if (adev->powerplay.pp_funcs->get_fan_speed_percent) {
> > +     else if (adev->powerplay.pp_funcs->get_fan_speed_percent)
> >               err = amdgpu_dpm_get_fan_speed_percent(adev, &speed);
> > -             if (err)
> > -                     return err;
> > -     }
> > +     else
> > +             err = -EINVAL;
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> > +     if (err)
> > +             return err;
> >
> >       speed = (speed * 255) / 100;
> >
> > @@ -1812,20 +2126,22 @@ static ssize_t
> > amdgpu_hwmon_get_fan1_input(struct device *dev,
> >       int err;
> >       u32 speed = 0;
> >
> > -     /* Can't adjust fan when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (err < 0)
> > +             return err;
> >
> > -     if (is_support_sw_smu(adev)) {
> > +     if (is_support_sw_smu(adev))
> >               err = smu_get_fan_speed_rpm(&adev->smu, &speed);
> > -             if (err)
> > -                     return err;
> > -     } else if (adev->powerplay.pp_funcs->get_fan_speed_rpm) {
> > +     else if (adev->powerplay.pp_funcs->get_fan_speed_rpm)
> >               err = amdgpu_dpm_get_fan_speed_rpm(adev, &speed);
> > -             if (err)
> > -                     return err;
> > -     }
> > +     else
> > +             err = -EINVAL;
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> > +     if (err)
> > +             return err;
> >
> >       return sprintf(buf, "%i\n", speed);
> >  }
> > @@ -1839,8 +2155,16 @@ static ssize_t amdgpu_hwmon_get_fan1_min(struct
> > device *dev,
> >       u32 size = sizeof(min_rpm);
> >       int r;
> >
> > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (r < 0)
> > +             return r;
> > +
> >       r = amdgpu_dpm_read_sensor(adev,
> > AMDGPU_PP_SENSOR_MIN_FAN_RPM,
> >                                  (void *)&min_rpm, &size);
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> >       if (r)
> >               return r;
> >
> > @@ -1856,8 +2180,16 @@ static ssize_t
> > amdgpu_hwmon_get_fan1_max(struct device *dev,
> >       u32 size = sizeof(max_rpm);
> >       int r;
> >
> > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (r < 0)
> > +             return r;
> > +
> >       r = amdgpu_dpm_read_sensor(adev,
> > AMDGPU_PP_SENSOR_MAX_FAN_RPM,
> >                                  (void *)&max_rpm, &size);
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> >       if (r)
> >               return r;
> >
> > @@ -1872,20 +2204,22 @@ static ssize_t
> > amdgpu_hwmon_get_fan1_target(struct device *dev,
> >       int err;
> >       u32 rpm = 0;
> >
> > -     /* Can't adjust fan when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (err < 0)
> > +             return err;
> >
> > -     if (is_support_sw_smu(adev)) {
> > +     if (is_support_sw_smu(adev))
> >               err = smu_get_fan_speed_rpm(&adev->smu, &rpm);
> > -             if (err)
> > -                     return err;
> > -     } else if (adev->powerplay.pp_funcs->get_fan_speed_rpm) {
> > +     else if (adev->powerplay.pp_funcs->get_fan_speed_rpm)
> >               err = amdgpu_dpm_get_fan_speed_rpm(adev, &rpm);
> > -             if (err)
> > -                     return err;
> > -     }
> > +     else
> > +             err = -EINVAL;
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> > +     if (err)
> > +             return err;
> >
> >       return sprintf(buf, "%i\n", rpm);
> >  }
> > @@ -1899,32 +2233,40 @@ static ssize_t
> > amdgpu_hwmon_set_fan1_target(struct device *dev,
> >       u32 value;
> >       u32 pwm_mode;
> >
> > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (err < 0)
> > +             return err;
> > +
> >       if (is_support_sw_smu(adev))
> >               pwm_mode = smu_get_fan_control_mode(&adev->smu);
> >       else
> >               pwm_mode = amdgpu_dpm_get_fan_control_mode(adev);
> >
> > -     if (pwm_mode != AMD_FAN_CTRL_MANUAL)
> > +     if (pwm_mode != AMD_FAN_CTRL_MANUAL) {
> > +             pm_runtime_mark_last_busy(adev->ddev->dev);
> > +             pm_runtime_put_autosuspend(adev->ddev->dev);
> >               return -ENODATA;
> > -
> > -     /* Can't adjust fan when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > +     }
> >
> >       err = kstrtou32(buf, 10, &value);
> > -     if (err)
> > +     if (err) {
> > +             pm_runtime_mark_last_busy(adev->ddev->dev);
> > +             pm_runtime_put_autosuspend(adev->ddev->dev);
> >               return err;
> > +     }
> >
> > -     if (is_support_sw_smu(adev)) {
> > +     if (is_support_sw_smu(adev))
> >               err = smu_set_fan_speed_rpm(&adev->smu, value);
> > -             if (err)
> > -                     return err;
> > -     } else if (adev->powerplay.pp_funcs->set_fan_speed_rpm) {
> > +     else if (adev->powerplay.pp_funcs->set_fan_speed_rpm)
> >               err = amdgpu_dpm_set_fan_speed_rpm(adev, value);
> > -             if (err)
> > -                     return err;
> > -     }
> > +     else
> > +             err = -EINVAL;
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> > +     if (err)
> > +             return err;
> >
> >       return count;
> >  }
> > @@ -1935,15 +2277,27 @@ static ssize_t
> > amdgpu_hwmon_get_fan1_enable(struct device *dev,  {
> >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> >       u32 pwm_mode = 0;
> > +     int ret;
> > +
> > +     ret = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (ret < 0)
> > +             return ret;
> >
> >       if (is_support_sw_smu(adev)) {
> >               pwm_mode = smu_get_fan_control_mode(&adev->smu);
> >       } else {
> > -             if (!adev->powerplay.pp_funcs->get_fan_control_mode)
> > +             if (!adev->powerplay.pp_funcs->get_fan_control_mode) {
> > +                     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +                     pm_runtime_put_autosuspend(adev->ddev->dev);
> >                       return -EINVAL;
> > +             }
> >
> >               pwm_mode = amdgpu_dpm_get_fan_control_mode(adev);
> >       }
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> >       return sprintf(buf, "%i\n", pwm_mode == AMD_FAN_CTRL_AUTO ? 0 :
> > 1);  }
> >
> > @@ -1957,12 +2311,6 @@ static ssize_t
> > amdgpu_hwmon_set_fan1_enable(struct device *dev,
> >       int value;
> >       u32 pwm_mode;
> >
> > -     /* Can't adjust fan when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > -
> > -
> >       err = kstrtoint(buf, 10, &value);
> >       if (err)
> >               return err;
> > @@ -1974,14 +2322,24 @@ static ssize_t
> > amdgpu_hwmon_set_fan1_enable(struct device *dev,
> >       else
> >               return -EINVAL;
> >
> > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (err < 0)
> > +             return err;
> > +
> >       if (is_support_sw_smu(adev)) {
> >               smu_set_fan_control_mode(&adev->smu, pwm_mode);
> >       } else {
> > -             if (!adev->powerplay.pp_funcs->set_fan_control_mode)
> > +             if (!adev->powerplay.pp_funcs->set_fan_control_mode) {
> > +                     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +                     pm_runtime_put_autosuspend(adev->ddev->dev);
> >                       return -EINVAL;
> > +             }
> >               amdgpu_dpm_set_fan_control_mode(adev, pwm_mode);
> >       }
> >
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> >       return count;
> >  }
> >
> > @@ -1990,18 +2348,20 @@ static ssize_t amdgpu_hwmon_show_vddgfx(struct
> > device *dev,
> >                                       char *buf)
> >  {
> >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > -     struct drm_device *ddev = adev->ddev;
> >       u32 vddgfx;
> >       int r, size = sizeof(vddgfx);
> >
> > -     /* Can't get voltage when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (r < 0)
> > +             return r;
> >
> >       /* get the voltage */
> >       r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_VDDGFX,
> >                                  (void *)&vddgfx, &size);
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> >       if (r)
> >               return r;
> >
> > @@ -2020,7 +2380,6 @@ static ssize_t amdgpu_hwmon_show_vddnb(struct
> > device *dev,
> >                                      char *buf)
> >  {
> >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > -     struct drm_device *ddev = adev->ddev;
> >       u32 vddnb;
> >       int r, size = sizeof(vddnb);
> >
> > @@ -2028,14 +2387,17 @@ static ssize_t amdgpu_hwmon_show_vddnb(struct
> > device *dev,
> >       if  (!(adev->flags & AMD_IS_APU))
> >               return -EINVAL;
> >
> > -     /* Can't get voltage when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (r < 0)
> > +             return r;
> >
> >       /* get the voltage */
> >       r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_VDDNB,
> >                                  (void *)&vddnb, &size);
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> >       if (r)
> >               return r;
> >
> > @@ -2054,19 +2416,21 @@ static ssize_t
> > amdgpu_hwmon_show_power_avg(struct device *dev,
> >                                          char *buf)
> >  {
> >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > -     struct drm_device *ddev = adev->ddev;
> >       u32 query = 0;
> >       int r, size = sizeof(u32);
> >       unsigned uw;
> >
> > -     /* Can't get power when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (r < 0)
> > +             return r;
> >
> >       /* get the voltage */
> >       r = amdgpu_dpm_read_sensor(adev,
> > AMDGPU_PP_SENSOR_GPU_POWER,
> >                                  (void *)&query, &size);
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> >       if (r)
> >               return r;
> >
> > @@ -2089,16 +2453,27 @@ static ssize_t
> > amdgpu_hwmon_show_power_cap_max(struct device *dev,  {
> >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> >       uint32_t limit = 0;
> > +     ssize_t size;
> > +     int r;
> > +
> > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (r < 0)
> > +             return r;
> >
> >       if (is_support_sw_smu(adev)) {
> >               smu_get_power_limit(&adev->smu, &limit, true, true);
> > -             return snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> > +             size = snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> >       } else if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs-
> > >get_power_limit) {
> >               adev->powerplay.pp_funcs->get_power_limit(adev-
> > >powerplay.pp_handle, &limit, true);
> > -             return snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> > +             size = snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> >       } else {
> > -             return snprintf(buf, PAGE_SIZE, "\n");
> > +             size = snprintf(buf, PAGE_SIZE, "\n");
> >       }
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> > +     return size;
> >  }
> >
> >  static ssize_t amdgpu_hwmon_show_power_cap(struct device *dev, @@ -
> > 2107,16 +2482,27 @@ static ssize_t amdgpu_hwmon_show_power_cap(struct
> > device *dev,  {
> >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> >       uint32_t limit = 0;
> > +     ssize_t size;
> > +     int r;
> > +
> > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (r < 0)
> > +             return r;
> >
> >       if (is_support_sw_smu(adev)) {
> >               smu_get_power_limit(&adev->smu, &limit, false,  true);
> > -             return snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> > +             size = snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> >       } else if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs-
> > >get_power_limit) {
> >               adev->powerplay.pp_funcs->get_power_limit(adev-
> > >powerplay.pp_handle, &limit, false);
> > -             return snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> > +             size = snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> >       } else {
> > -             return snprintf(buf, PAGE_SIZE, "\n");
> > +             size = snprintf(buf, PAGE_SIZE, "\n");
> >       }
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> > +     return size;
> >  }
> >
> >
> > @@ -2138,13 +2524,20 @@ static ssize_t
> > amdgpu_hwmon_set_power_cap(struct device *dev,
> >
> >       value = value / 1000000; /* convert to Watt */
> >
> > -     if (is_support_sw_smu(adev)) {
> > +
> > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     if (is_support_sw_smu(adev))
> >               err = smu_set_power_limit(&adev->smu, value);
> > -     } else if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs-
> > >set_power_limit) {
> > +     else if (adev->powerplay.pp_funcs &&
> > +adev->powerplay.pp_funcs->set_power_limit)
> >               err = adev->powerplay.pp_funcs->set_power_limit(adev-
> > >powerplay.pp_handle, value);
> > -     } else {
> > +     else
> >               err = -EINVAL;
> > -     }
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> >
> >       if (err)
> >               return err;
> > @@ -2157,18 +2550,20 @@ static ssize_t amdgpu_hwmon_show_sclk(struct
> > device *dev,
> >                                     char *buf)
> >  {
> >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > -     struct drm_device *ddev = adev->ddev;
> >       uint32_t sclk;
> >       int r, size = sizeof(sclk);
> >
> > -     /* Can't get voltage when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (r < 0)
> > +             return r;
> >
> >       /* get the sclk */
> >       r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_GFX_SCLK,
> >                                  (void *)&sclk, &size);
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> >       if (r)
> >               return r;
> >
> > @@ -2187,18 +2582,20 @@ static ssize_t amdgpu_hwmon_show_mclk(struct
> > device *dev,
> >                                     char *buf)
> >  {
> >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > -     struct drm_device *ddev = adev->ddev;
> >       uint32_t mclk;
> >       int r, size = sizeof(mclk);
> >
> > -     /* Can't get voltage when the card is off */
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > -             return -EINVAL;
> > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > +     if (r < 0)
> > +             return r;
> >
> >       /* get the sclk */
> >       r = amdgpu_dpm_read_sensor(adev,
> > AMDGPU_PP_SENSOR_GFX_MCLK,
> >                                  (void *)&mclk, &size);
> > +
> > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > +
> >       if (r)
> >               return r;
> >
> > @@ -3220,8 +3617,12 @@ static int amdgpu_debugfs_pm_info(struct seq_file
> > *m, void *data)
> >       struct drm_info_node *node = (struct drm_info_node *) m->private;
> >       struct drm_device *dev = node->minor->dev;
> >       struct amdgpu_device *adev = dev->dev_private;
> > -     struct drm_device *ddev = adev->ddev;
> >       u32 flags = 0;
> > +     int r;
> > +
> > +     r = pm_runtime_get_sync(dev->dev);
> > +     if (r < 0)
> > +             return r;
> >
> >       amdgpu_device_ip_get_clockgating_state(adev, &flags);
> >       seq_printf(m, "Clock Gating Flags Mask: 0x%x\n", flags); @@ -3230,23
> > +3631,28 @@ static int amdgpu_debugfs_pm_info(struct seq_file *m, void
> > *data)
> >
> >       if (!adev->pm.dpm_enabled) {
> >               seq_printf(m, "dpm not enabled\n");
> > +             pm_runtime_mark_last_busy(dev->dev);
> > +             pm_runtime_put_autosuspend(dev->dev);
> >               return 0;
> >       }
> > -     if  ((adev->flags & AMD_IS_PX) &&
> > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON)) {
> > -             seq_printf(m, "PX asic powered off\n");
> > -     } else if (!is_support_sw_smu(adev) && adev->powerplay.pp_funcs-
> > >debugfs_print_current_performance_level) {
> > +
> > +     if (!is_support_sw_smu(adev) &&
> > +         adev->powerplay.pp_funcs-
> > >debugfs_print_current_performance_level)
> > +{
> >               mutex_lock(&adev->pm.mutex);
> >               if (adev->powerplay.pp_funcs-
> > >debugfs_print_current_performance_level)
> >                       adev->powerplay.pp_funcs-
> > >debugfs_print_current_performance_level(adev, m);
> >               else
> >                       seq_printf(m, "Debugfs support not implemented for
> > this asic\n");
> >               mutex_unlock(&adev->pm.mutex);
> > +             r = 0;
> >       } else {
> > -             return amdgpu_debugfs_pm_info_pp(m, adev);
> > +             r = amdgpu_debugfs_pm_info_pp(m, adev);
> >       }
> >
> > -     return 0;
> > +     pm_runtime_mark_last_busy(dev->dev);
> > +     pm_runtime_put_autosuspend(dev->dev);
> > +
> > +     return r;
> >  }
> >
> >  static const struct drm_info_list amdgpu_pm_info_list[] = {
> > --
> > 2.24.1
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.free
> > desktop.org%2Fmailman%2Flistinfo%2Famd-
> > gfx&amp;data=02%7C01%7Cevan.quan%40amd.com%7C238a3b3424e54410d5
> > 4b08d796272999%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637
> > 142967374684544&amp;sdata=oFtEwMdJl2KVMiwz9y5GBcwwheE%2FKeg80C4
> > LqfjZf08%3D&amp;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
