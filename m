Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D91139EE5
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jan 2020 02:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C41B6E1CE;
	Tue, 14 Jan 2020 01:27:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760071.outbound.protection.outlook.com [40.107.76.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDC66E1CE
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jan 2020 01:27:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLBvi/DW8B9I4nKr/nEN5QsyWD7NJvjx0tTiP+21yqgIOAmuPSLsMpzpD85Xw3shY4q1//nfF1LBSJuc1oYP2KEyCiJoTP2RFdKHmUpze1X5mGASk7sLaA6tizncfQpR6jhJ51SPH3zmxrrFoFonV+I0ob3Oc4cD0E/hRKLmS+834vk9VfZPhUTVQXVQoIYedXEew1Ds5bT9jNiXluVbgXirnfBNuTkSIBzPNJCPQQvuG/NGPEx/sr8EyoKhVzqzgQAjEVau7Ym/pS/QJPrs25E4Y8jxxbMGl2lkKG+jL1SenDkN0YbYif73JJZHg2K3Y98CxrVswJE6M4y5Fy0NJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrWLCZl762Il8wUyANUXId5Jtv3a0iM/CGD4VSgxQ+M=;
 b=afDIBvZpVDtafT5lU/7KHBGkzlazPxxX20G9z20koGRwwx8wi/uV0h8QxwXqcvkWwE1QE/j1k7nhRaSrUWoFKE12v67Ne4xsw2XuMY7sPEMhuKcUSDL1R0wdquHooDaluJSDrJuy1jXlaQzD162Tt2uTcX2HOuxgbczoZT/p32kCrBaTs45mFBdrOzz9K/gkVfVI3cc8RI7vBzBw9GZlTOxBLeJx3dK8XXI6Pg9x/0vMJGYv+cNq9XMNN27UkCM1VmENIH8HLemyKCf2xS4X7dsHtSPS0TpDd5rlBF6mZq4xwM07EXOVGe3y4TPxMrY5Ctf0xEOUMR7HsAHH77W4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrWLCZl762Il8wUyANUXId5Jtv3a0iM/CGD4VSgxQ+M=;
 b=gS/4JpuwnWoqa5sttVvbGcHEQWZ9gQx7aue9qXc4gYbj2uCrchq++WmJ33ckAMUHa5C7PreCSTa5JKZK/6kUms7/QAQHGvqF83TKOzIi6PKny0m6gkz7ooySNeajRji/Qbr1XcWP2z7q1dXStpDYzmlF5VFS69q0bJvlPMywtYs=
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3503.namprd12.prod.outlook.com (20.178.243.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Tue, 14 Jan 2020 01:27:32 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1010:4621:68dd:5b47]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1010:4621:68dd:5b47%5]) with mapi id 15.20.2623.015; Tue, 14 Jan 2020
 01:27:32 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: RE: [PATCH 1/2] drm/amdgpu/pm: properly handle runtime pm
Thread-Topic: [PATCH 1/2] drm/amdgpu/pm: properly handle runtime pm
Thread-Index: AQHVyBAPEEcDXh19SUK2qIwRkWBKnqfn9FYggAEbHgCAAFM4EA==
Date: Tue, 14 Jan 2020 01:27:32 +0000
Message-ID: <MN2PR12MB33446ABDBFC8D14D14E3B4B4E4340@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20200110234509.4195-1-alexander.deucher@amd.com>
 <MN2PR12MB334455C7CB4ADB0C5365D341E4350@MN2PR12MB3344.namprd12.prod.outlook.com>
 <CADnq5_P9YOPVWKyfRVhH9c=yJJHaWuz-BaGpG62GTFOV59jBUg@mail.gmail.com>
In-Reply-To: <CADnq5_P9YOPVWKyfRVhH9c=yJJHaWuz-BaGpG62GTFOV59jBUg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=8d2a49bf-001b-4e94-927a-000022ea7239;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-01-14T01:24:44Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 777aba6d-7cae-46b4-531b-08d79890ed86
x-ms-traffictypediagnostic: MN2PR12MB3503:|MN2PR12MB3503:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB35032CA775A51B983251F273E4340@MN2PR12MB3503.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:541;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(189003)(199004)(8676002)(8936002)(5660300002)(9686003)(53546011)(55016002)(86362001)(26005)(186003)(81166006)(81156014)(6506007)(7696005)(52536014)(4326008)(64756008)(54906003)(966005)(33656002)(66446008)(71200400001)(76116006)(30864003)(316002)(6916009)(2906002)(478600001)(45080400002)(66476007)(66556008)(66946007)(559001)(579004)(569006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3503;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /9QFiOhCEHQF0Go5QzC5fRehbA1e5mZ33fHxpZVhr7n7hrv+pCR47Wg0KO8HUrTdf4548ZIhwW2EJxpILNcjldZjtvoggpO0F6RQtsRF+BDAL0msPUeDUYZVXELIpaTjiDpKZJ8JbDD0ix+C432/zpiWUIWrv2yClBcagX1lsXxzuq0Pmg4jzq0N9xLVOtLZR6QsJUJJBM2AL139DE7tqFLw/W/bsLbYjTCqwH/l3Z3pyTwQ38q5RXmuN71xnOEasp6AKehJKPm9hCViUSQlZN7QcE19Ya1tVvumB5sGEIG3sUa1wl2Xer34+KJkMaQCI180/ABuaUKIQefrb+ltvWHkI1ILJGtTpCTINo6tEe5A5qTHBZDiimjRe+aUc4CgEx6CVeqxHzPDuOfwDP7iJgkthr2fZjnGXUWnMwRAIK6A6pk+fJteYrR2NK+5+gz2Tu+DO7wFKHqmCvapqUhHxKnK9UTlnIpq9sf5WvKb3IGUMILzaxGcT0VzzZVPjI1vmCETuVecSvRnjmQoVsD6Tw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777aba6d-7cae-46b4-531b-08d79890ed86
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 01:27:32.1281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AhUQUom+tgwan05k9igTr9Koyhw38phszm64frZjFtKrBoGtBTLKMJUj0puqHLUr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3503
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

Yes, 'ssize_t' is fine. But 'count' comes with type of 'size_t'.
Although it should not bring any true problem. I'm not sure whether there will be compile warnings.

Regards,
Evan
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Tuesday, January 14, 2020 4:27 AM
> To: Quan, Evan <Evan.Quan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH 1/2] drm/amdgpu/pm: properly handle runtime pm
> 
> On Sun, Jan 12, 2020 at 10:35 PM Quan, Evan <Evan.Quan@amd.com> wrote:
> >
> > The "count" from amdgpu_set_pp_feature_status() seems with type of size_t.
> > Then assignment "count = -EINVAL" may be improper.
> 
> It's fine. ssize_t is signed.  We've been doing it long before this patch.
> 
> Alex
> 
> > With that confirmed, the patch is reviewed-by: Evan Quan
> <evan.quan@amd.com>
> >
> > > -----Original Message-----
> > > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex
> > > Deucher
> > > Sent: Saturday, January 11, 2020 7:45 AM
> > > To: amd-gfx@lists.freedesktop.org
> > > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
> > > Subject: [PATCH 1/2] drm/amdgpu/pm: properly handle runtime pm
> > >
> > > If power management sysfs or debugfs files are accessed, power up the
> GPU
> > > when necessary.
> > >
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 822
> ++++++++++++++++++-----
> > > --
> > >  1 file changed, 614 insertions(+), 208 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > > index 285d460624c8..806e731c1ff4 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > > @@ -37,6 +37,7 @@
> > >  #include <linux/hwmon.h>
> > >  #include <linux/hwmon-sysfs.h>
> > >  #include <linux/nospec.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include "hwmgr.h"
> > >  #define WIDTH_4K 3840
> > >
> > > @@ -158,10 +159,15 @@ static ssize_t amdgpu_get_dpm_state(struct
> device
> > > *dev,
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > >       enum amd_pm_state_type pm;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev)) {
> > >               if (adev->smu.ppt_funcs->get_current_power_state)
> > >                       pm = smu_get_current_power_state(&adev->smu);
> > > @@ -173,6 +179,9 @@ static ssize_t amdgpu_get_dpm_state(struct device
> > > *dev,
> > >               pm = adev->pm.dpm.user_state;
> > >       }
> > >
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       return snprintf(buf, PAGE_SIZE, "%s\n",
> > >                       (pm == POWER_STATE_TYPE_BATTERY) ? "battery" :
> > >                       (pm == POWER_STATE_TYPE_BALANCED) ?
> > > "balanced" : "performance"); @@ -186,6 +195,7 @@ static ssize_t
> > > amdgpu_set_dpm_state(struct device *dev,
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > >       enum amd_pm_state_type  state;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return -EINVAL;
> > > @@ -201,6 +211,10 @@ static ssize_t amdgpu_set_dpm_state(struct
> device
> > > *dev,
> > >               goto fail;
> > >       }
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev)) {
> > >               mutex_lock(&adev->pm.mutex);
> > >               adev->pm.dpm.user_state = state;
> > > @@ -212,11 +226,12 @@ static ssize_t amdgpu_set_dpm_state(struct
> device
> > > *dev,
> > >               adev->pm.dpm.user_state = state;
> > >               mutex_unlock(&adev->pm.mutex);
> > >
> > > -             /* Can't set dpm state when the card is off */
> > > -             if (!(adev->flags & AMD_IS_PX) ||
> > > -                 (ddev->switch_power_state == DRM_SWITCH_POWER_ON))
> > > -                     amdgpu_pm_compute_clocks(adev);
> > > +             amdgpu_pm_compute_clocks(adev);
> > >       }
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > > +
> > >  fail:
> > >       return count;
> > >  }
> > > @@ -288,13 +303,14 @@ static ssize_t
> > > amdgpu_get_dpm_forced_performance_level(struct device *dev,
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > >       enum amd_dpm_forced_level level = 0xff;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > -     if ((adev->flags & AMD_IS_PX) &&
> > > -         (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return snprintf(buf, PAGE_SIZE, "off\n");
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > >
> > >       if (is_support_sw_smu(adev))
> > >               level = smu_get_performance_level(&adev->smu);
> > > @@ -303,6 +319,9 @@ static ssize_t
> > > amdgpu_get_dpm_forced_performance_level(struct device *dev,
> > >       else
> > >               level = adev->pm.dpm.forced_level;
> > >
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       return snprintf(buf, PAGE_SIZE, "%s\n",
> > >                       (level == AMD_DPM_FORCED_LEVEL_AUTO) ? "auto" :
> > >                       (level == AMD_DPM_FORCED_LEVEL_LOW) ? "low" :
> > > @@ -329,11 +348,6 @@ static ssize_t
> > > amdgpu_set_dpm_forced_performance_level(struct device *dev,
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return -EINVAL;
> > >
> > > -     /* Can't force performance level when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > -
> > >       if (strncmp("low", buf, strlen("low")) == 0) {
> > >               level = AMD_DPM_FORCED_LEVEL_LOW;
> > >       } else if (strncmp("high", buf, strlen("high")) == 0) { @@ -353,17
> > > +367,23 @@ static ssize_t
> amdgpu_set_dpm_forced_performance_level(struct
> > > device *dev,
> > >       } else if (strncmp("profile_peak", buf, strlen("profile_peak")) == 0) {
> > >               level = AMD_DPM_FORCED_LEVEL_PROFILE_PEAK;
> > >       }  else {
> > > -             count = -EINVAL;
> > > -             goto fail;
> > > +             return -EINVAL;
> > >       }
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > >               current_level = smu_get_performance_level(&adev->smu);
> > >       else if (adev->powerplay.pp_funcs->get_performance_level)
> > >               current_level = amdgpu_dpm_get_performance_level(adev);
> > >
> > > -     if (current_level == level)
> > > +     if (current_level == level) {
> > > +             pm_runtime_mark_last_busy(ddev->dev);
> > > +             pm_runtime_put_autosuspend(ddev->dev);
> > >               return count;
> > > +     }
> > >
> > >       /* profile_exit setting is valid only when current mode is in profile
> > > mode */
> > >       if (!(current_level & (AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD
> > > | @@ -372,6 +392,8 @@ static ssize_t
> > > amdgpu_set_dpm_forced_performance_level(struct device *dev,
> > >           AMD_DPM_FORCED_LEVEL_PROFILE_PEAK)) &&
> > >           (level == AMD_DPM_FORCED_LEVEL_PROFILE_EXIT)) {
> > >               pr_err("Currently not in any profile mode!\n");
> > > +             pm_runtime_mark_last_busy(ddev->dev);
> > > +             pm_runtime_put_autosuspend(ddev->dev);
> > >               return -EINVAL;
> > >       }
> > >
> > > @@ -382,9 +404,10 @@ static ssize_t
> > > amdgpu_set_dpm_forced_performance_level(struct device *dev,
> > >       } else if (adev->powerplay.pp_funcs->force_performance_level) {
> > >               mutex_lock(&adev->pm.mutex);
> > >               if (adev->pm.dpm.thermal_active) {
> > > -                     count = -EINVAL;
> > >                       mutex_unlock(&adev->pm.mutex);
> > > -                     goto fail;
> > > +                     pm_runtime_mark_last_busy(ddev->dev);
> > > +                     pm_runtime_put_autosuspend(ddev->dev);
> > > +                     return -EINVAL;
> > >               }
> > >               ret = amdgpu_dpm_force_performance_level(adev, level);
> > >               if (ret)
> > > @@ -393,8 +416,9 @@ static ssize_t
> > > amdgpu_set_dpm_forced_performance_level(struct device *dev,
> > >                       adev->pm.dpm.forced_level = level;
> > >               mutex_unlock(&adev->pm.mutex);
> > >       }
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > >
> > > -fail:
> > >       return count;
> > >  }
> > >
> > > @@ -407,6 +431,10 @@ static ssize_t amdgpu_get_pp_num_states(struct
> > > device *dev,
> > >       struct pp_states_info data;
> > >       int i, buf_len, ret;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev)) {
> > >               ret = smu_get_power_num_states(&adev->smu, &data);
> > >               if (ret)
> > > @@ -414,6 +442,9 @@ static ssize_t amdgpu_get_pp_num_states(struct
> > > device *dev,
> > >       } else if (adev->powerplay.pp_funcs->get_pp_num_states)
> > >               amdgpu_dpm_get_pp_num_states(adev, &data);
> > >
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       buf_len = snprintf(buf, PAGE_SIZE, "states: %d\n", data.nums);
> > >       for (i = 0; i < data.nums; i++)
> > >               buf_len += snprintf(buf + buf_len, PAGE_SIZE, "%d %s\n", i,
> > > @@ -439,6 +470,10 @@ static ssize_t amdgpu_get_pp_cur_state(struct
> device
> > > *dev,
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev)) {
> > >               pm = smu_get_current_power_state(smu);
> > >               ret = smu_get_power_num_states(smu, &data); @@ -450,6
> > > +485,9 @@ static ssize_t amdgpu_get_pp_cur_state(struct device *dev,
> > >               amdgpu_dpm_get_pp_num_states(adev, &data);
> > >       }
> > >
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       for (i = 0; i < data.nums; i++) {
> > >               if (pm == data.states[i])
> > >                       break;
> > > @@ -500,14 +538,18 @@ static ssize_t amdgpu_set_pp_force_state(struct
> > > device *dev,
> > >               struct pp_states_info data;
> > >
> > >               ret = kstrtoul(buf, 0, &idx);
> > > -             if (ret || idx >= ARRAY_SIZE(data.states)) {
> > > -                     count = -EINVAL;
> > > -                     goto fail;
> > > -             }
> > > +             if (ret || idx >= ARRAY_SIZE(data.states))
> > > +                     return -EINVAL;
> > > +
> > >               idx = array_index_nospec(idx, ARRAY_SIZE(data.states));
> > >
> > >               amdgpu_dpm_get_pp_num_states(adev, &data);
> > >               state = data.states[idx];
> > > +
> > > +             ret = pm_runtime_get_sync(ddev->dev);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > >               /* only set user selected power states */
> > >               if (state != POWER_STATE_TYPE_INTERNAL_BOOT &&
> > >                   state != POWER_STATE_TYPE_DEFAULT) { @@ -515,8
> > > +557,10 @@ static ssize_t amdgpu_set_pp_force_state(struct device *dev,
> > >                                       AMD_PP_TASK_ENABLE_USER_STATE,
> > > &state);
> > >                       adev->pp_force_state_enabled = true;
> > >               }
> > > +             pm_runtime_mark_last_busy(ddev->dev);
> > > +             pm_runtime_put_autosuspend(ddev->dev);
> > >       }
> > > -fail:
> > > +
> > >       return count;
> > >  }
> > >
> > > @@ -538,20 +582,32 @@ static ssize_t amdgpu_get_pp_table(struct device
> > > *dev,
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > >       char *table = NULL;
> > > -     int size;
> > > +     int size, ret;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev)) {
> > >               size = smu_sys_get_pp_table(&adev->smu, (void **)&table);
> > > +             pm_runtime_mark_last_busy(ddev->dev);
> > > +             pm_runtime_put_autosuspend(ddev->dev);
> > >               if (size < 0)
> > >                       return size;
> > > -     }
> > > -     else if (adev->powerplay.pp_funcs->get_pp_table)
> > > +     } else if (adev->powerplay.pp_funcs->get_pp_table) {
> > >               size = amdgpu_dpm_get_pp_table(adev, &table);
> > > -     else
> > > +             pm_runtime_mark_last_busy(ddev->dev);
> > > +             pm_runtime_put_autosuspend(ddev->dev);
> > > +             if (size < 0)
> > > +                     return size;
> > > +     } else {
> > > +             pm_runtime_mark_last_busy(ddev->dev);
> > > +             pm_runtime_put_autosuspend(ddev->dev);
> > >               return 0;
> > > +     }
> > >
> > >       if (size >= PAGE_SIZE)
> > >               size = PAGE_SIZE - 1;
> > > @@ -573,13 +629,23 @@ static ssize_t amdgpu_set_pp_table(struct device
> > > *dev,
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return -EINVAL;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev)) {
> > >               ret = smu_sys_set_pp_table(&adev->smu, (void *)buf, count);
> > > -             if (ret)
> > > +             if (ret) {
> > > +                     pm_runtime_mark_last_busy(ddev->dev);
> > > +                     pm_runtime_put_autosuspend(ddev->dev);
> > >                       return ret;
> > > +             }
> > >       } else if (adev->powerplay.pp_funcs->set_pp_table)
> > >               amdgpu_dpm_set_pp_table(adev, buf, count);
> > >
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       return count;
> > >  }
> > >
> > > @@ -703,18 +769,28 @@ static ssize_t
> amdgpu_set_pp_od_clk_voltage(struct
> > > device *dev,
> > >                       tmp_str++;
> > >       }
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev)) {
> > >               ret = smu_od_edit_dpm_table(&adev->smu, type,
> > >                                           parameter, parameter_size);
> > >
> > > -             if (ret)
> > > +             if (ret) {
> > > +                     pm_runtime_mark_last_busy(ddev->dev);
> > > +                     pm_runtime_put_autosuspend(ddev->dev);
> > >                       return -EINVAL;
> > > +             }
> > >       } else {
> > >               if (adev->powerplay.pp_funcs->odn_edit_dpm_table) {
> > >                       ret = amdgpu_dpm_odn_edit_dpm_table(adev, type,
> > >                                               parameter, parameter_size);
> > > -                     if (ret)
> > > +                     if (ret) {
> > > +                             pm_runtime_mark_last_busy(ddev->dev);
> > > +                             pm_runtime_put_autosuspend(ddev->dev);
> > >                               return -EINVAL;
> > > +                     }
> > >               }
> > >
> > >               if (type == PP_OD_COMMIT_DPM_TABLE) { @@ -722,12
> > > +798,18 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct device
> *dev,
> > >                               amdgpu_dpm_dispatch_task(adev,
> > >
> > >       AMD_PP_TASK_READJUST_POWER_STATE,
> > >                                               NULL);
> > > +                             pm_runtime_mark_last_busy(ddev->dev);
> > > +                             pm_runtime_put_autosuspend(ddev->dev);
> > >                               return count;
> > >                       } else {
> > > +                             pm_runtime_mark_last_busy(ddev->dev);
> > > +                             pm_runtime_put_autosuspend(ddev->dev);
> > >                               return -EINVAL;
> > >                       }
> > >               }
> > >       }
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > >
> > >       return count;
> > >  }
> > > @@ -738,27 +820,33 @@ static ssize_t
> amdgpu_get_pp_od_clk_voltage(struct
> > > device *dev,  {
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > > -     uint32_t size = 0;
> > > +     ssize_t size;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev)) {
> > >               size = smu_print_clk_levels(&adev->smu, SMU_OD_SCLK, buf);
> > >               size += smu_print_clk_levels(&adev->smu, SMU_OD_MCLK,
> > > buf+size);
> > >               size += smu_print_clk_levels(&adev->smu,
> > > SMU_OD_VDDC_CURVE, buf+size);
> > >               size += smu_print_clk_levels(&adev->smu, SMU_OD_RANGE,
> > > buf+size);
> > > -             return size;
> > >       } else if (adev->powerplay.pp_funcs->print_clock_levels) {
> > >               size = amdgpu_dpm_print_clock_levels(adev, OD_SCLK, buf);
> > >               size += amdgpu_dpm_print_clock_levels(adev, OD_MCLK,
> > > buf+size);
> > >               size += amdgpu_dpm_print_clock_levels(adev,
> > > OD_VDDC_CURVE, buf+size);
> > >               size += amdgpu_dpm_print_clock_levels(adev, OD_RANGE,
> > > buf+size);
> > > -             return size;
> > >       } else {
> > > -             return snprintf(buf, PAGE_SIZE, "\n");
> > > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > >       }
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > >
> > > +     return size;
> > >  }
> > >
> > >  /**
> > > @@ -796,15 +884,21 @@ static ssize_t
> amdgpu_set_pp_feature_status(struct
> > > device *dev,
> > >
> > >       pr_debug("featuremask = 0x%llx\n", featuremask);
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev)) {
> > >               ret = smu_sys_set_pp_feature_mask(&adev->smu,
> > > featuremask);
> > >               if (ret)
> > > -                     return -EINVAL;
> > > +                     count = -EINVAL;
> > >       } else if (adev->powerplay.pp_funcs->set_ppfeature_status) {
> > >               ret = amdgpu_dpm_set_ppfeature_status(adev, featuremask);
> > >               if (ret)
> > > -                     return -EINVAL;
> > > +                     count = -EINVAL;
> > >       }
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > >
> > >       return count;
> > >  }
> > > @@ -815,16 +909,27 @@ static ssize_t
> amdgpu_get_pp_feature_status(struct
> > > device *dev,  {
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > > +     ssize_t size;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev))
> > >               return 0;
> > >
> > > -     if (is_support_sw_smu(adev)) {
> > > -             return smu_sys_get_pp_feature_mask(&adev->smu, buf);
> > > -     } else if (adev->powerplay.pp_funcs->get_ppfeature_status)
> > > -             return amdgpu_dpm_get_ppfeature_status(adev, buf);
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     if (is_support_sw_smu(adev))
> > > +             size = smu_sys_get_pp_feature_mask(&adev->smu, buf);
> > > +     else if (adev->powerplay.pp_funcs->get_ppfeature_status)
> > > +             size = amdgpu_dpm_get_ppfeature_status(adev, buf);
> > > +     else
> > > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > >
> > > -     return snprintf(buf, PAGE_SIZE, "\n");
> > > +     return size;
> > >  }
> > >
> > >  /**
> > > @@ -863,16 +968,27 @@ static ssize_t amdgpu_get_pp_dpm_sclk(struct
> > > device *dev,  {
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > > +     ssize_t size;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > > -             return smu_print_clk_levels(&adev->smu, SMU_SCLK, buf);
> > > +             size = smu_print_clk_levels(&adev->smu, SMU_SCLK, buf);
> > >       else if (adev->powerplay.pp_funcs->print_clock_levels)
> > > -             return amdgpu_dpm_print_clock_levels(adev, PP_SCLK, buf);
> > > +             size = amdgpu_dpm_print_clock_levels(adev, PP_SCLK, buf);
> > >       else
> > > -             return snprintf(buf, PAGE_SIZE, "\n");
> > > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > > +     return size;
> > >  }
> > >
> > >  /*
> > > @@ -928,11 +1044,18 @@ static ssize_t amdgpu_set_pp_dpm_sclk(struct
> > > device *dev,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > >               ret = smu_force_clk_levels(&adev->smu, SMU_SCLK, mask,
> > > true);
> > >       else if (adev->powerplay.pp_funcs->force_clock_level)
> > >               ret = amdgpu_dpm_force_clock_level(adev, PP_SCLK, mask);
> > >
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       if (ret)
> > >               return -EINVAL;
> > >
> > > @@ -945,16 +1068,27 @@ static ssize_t amdgpu_get_pp_dpm_mclk(struct
> > > device *dev,  {
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > > +     ssize_t size;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > > -             return smu_print_clk_levels(&adev->smu, SMU_MCLK, buf);
> > > +             size = smu_print_clk_levels(&adev->smu, SMU_MCLK, buf);
> > >       else if (adev->powerplay.pp_funcs->print_clock_levels)
> > > -             return amdgpu_dpm_print_clock_levels(adev, PP_MCLK, buf);
> > > +             size = amdgpu_dpm_print_clock_levels(adev, PP_MCLK, buf);
> > >       else
> > > -             return snprintf(buf, PAGE_SIZE, "\n");
> > > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > > +     return size;
> > >  }
> > >
> > >  static ssize_t amdgpu_set_pp_dpm_mclk(struct device *dev, @@ -964,8
> > > +1098,8 @@ static ssize_t amdgpu_set_pp_dpm_mclk(struct device *dev,  {
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > > -     int ret;
> > >       uint32_t mask = 0;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >                       return -EINVAL;
> > > @@ -974,11 +1108,18 @@ static ssize_t amdgpu_set_pp_dpm_mclk(struct
> > > device *dev,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > >               ret = smu_force_clk_levels(&adev->smu, SMU_MCLK, mask,
> > > true);
> > >       else if (adev->powerplay.pp_funcs->force_clock_level)
> > >               ret = amdgpu_dpm_force_clock_level(adev, PP_MCLK, mask);
> > >
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       if (ret)
> > >               return -EINVAL;
> > >
> > > @@ -991,16 +1132,27 @@ static ssize_t
> amdgpu_get_pp_dpm_socclk(struct
> > > device *dev,  {
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > > +     ssize_t size;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > > -             return smu_print_clk_levels(&adev->smu, SMU_SOCCLK, buf);
> > > +             size = smu_print_clk_levels(&adev->smu, SMU_SOCCLK, buf);
> > >       else if (adev->powerplay.pp_funcs->print_clock_levels)
> > > -             return amdgpu_dpm_print_clock_levels(adev, PP_SOCCLK, buf);
> > > +             size = amdgpu_dpm_print_clock_levels(adev, PP_SOCCLK, buf);
> > >       else
> > > -             return snprintf(buf, PAGE_SIZE, "\n");
> > > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > > +     return size;
> > >  }
> > >
> > >  static ssize_t amdgpu_set_pp_dpm_socclk(struct device *dev, @@ -
> 1020,10
> > > +1172,19 @@ static ssize_t amdgpu_set_pp_dpm_socclk(struct device *dev,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > >               ret = smu_force_clk_levels(&adev->smu, SMU_SOCCLK, mask,
> > > true);
> > >       else if (adev->powerplay.pp_funcs->force_clock_level)
> > >               ret = amdgpu_dpm_force_clock_level(adev, PP_SOCCLK, mask);
> > > +     else
> > > +             ret = 0;
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > >
> > >       if (ret)
> > >               return -EINVAL;
> > > @@ -1037,16 +1198,27 @@ static ssize_t amdgpu_get_pp_dpm_fclk(struct
> > > device *dev,  {
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > > +     ssize_t size;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > > -             return smu_print_clk_levels(&adev->smu, SMU_FCLK, buf);
> > > +             size = smu_print_clk_levels(&adev->smu, SMU_FCLK, buf);
> > >       else if (adev->powerplay.pp_funcs->print_clock_levels)
> > > -             return amdgpu_dpm_print_clock_levels(adev, PP_FCLK, buf);
> > > +             size = amdgpu_dpm_print_clock_levels(adev, PP_FCLK, buf);
> > >       else
> > > -             return snprintf(buf, PAGE_SIZE, "\n");
> > > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > > +     return size;
> > >  }
> > >
> > >  static ssize_t amdgpu_set_pp_dpm_fclk(struct device *dev, @@ -1066,10
> > > +1238,19 @@ static ssize_t amdgpu_set_pp_dpm_fclk(struct device *dev,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > >               ret = smu_force_clk_levels(&adev->smu, SMU_FCLK, mask,
> > > true);
> > >       else if (adev->powerplay.pp_funcs->force_clock_level)
> > >               ret = amdgpu_dpm_force_clock_level(adev, PP_FCLK, mask);
> > > +     else
> > > +             ret = 0;
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > >
> > >       if (ret)
> > >               return -EINVAL;
> > > @@ -1083,16 +1264,27 @@ static ssize_t
> amdgpu_get_pp_dpm_dcefclk(struct
> > > device *dev,  {
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > > +     ssize_t size;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > > -             return smu_print_clk_levels(&adev->smu, SMU_DCEFCLK, buf);
> > > +             size = smu_print_clk_levels(&adev->smu, SMU_DCEFCLK, buf);
> > >       else if (adev->powerplay.pp_funcs->print_clock_levels)
> > > -             return amdgpu_dpm_print_clock_levels(adev, PP_DCEFCLK,
> > > buf);
> > > +             size = amdgpu_dpm_print_clock_levels(adev, PP_DCEFCLK,
> > > buf);
> > >       else
> > > -             return snprintf(buf, PAGE_SIZE, "\n");
> > > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > > +     return size;
> > >  }
> > >
> > >  static ssize_t amdgpu_set_pp_dpm_dcefclk(struct device *dev, @@ -
> 1112,10
> > > +1304,19 @@ static ssize_t amdgpu_set_pp_dpm_dcefclk(struct device
> *dev,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > >               ret = smu_force_clk_levels(&adev->smu, SMU_DCEFCLK, mask,
> > > true);
> > >       else if (adev->powerplay.pp_funcs->force_clock_level)
> > >               ret = amdgpu_dpm_force_clock_level(adev, PP_DCEFCLK,
> > > mask);
> > > +     else
> > > +             ret = 0;
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > >
> > >       if (ret)
> > >               return -EINVAL;
> > > @@ -1129,16 +1330,27 @@ static ssize_t amdgpu_get_pp_dpm_pcie(struct
> > > device *dev,  {
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > > +     ssize_t size;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > > -             return smu_print_clk_levels(&adev->smu, SMU_PCIE, buf);
> > > +             size = smu_print_clk_levels(&adev->smu, SMU_PCIE, buf);
> > >       else if (adev->powerplay.pp_funcs->print_clock_levels)
> > > -             return amdgpu_dpm_print_clock_levels(adev, PP_PCIE, buf);
> > > +             size = amdgpu_dpm_print_clock_levels(adev, PP_PCIE, buf);
> > >       else
> > > -             return snprintf(buf, PAGE_SIZE, "\n");
> > > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > > +     return size;
> > >  }
> > >
> > >  static ssize_t amdgpu_set_pp_dpm_pcie(struct device *dev, @@ -1158,10
> > > +1370,19 @@ static ssize_t amdgpu_set_pp_dpm_pcie(struct device *dev,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > >               ret = smu_force_clk_levels(&adev->smu, SMU_PCIE, mask,
> > > true);
> > >       else if (adev->powerplay.pp_funcs->force_clock_level)
> > >               ret = amdgpu_dpm_force_clock_level(adev, PP_PCIE, mask);
> > > +     else
> > > +             ret = 0;
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > >
> > >       if (ret)
> > >               return -EINVAL;
> > > @@ -1176,15 +1397,23 @@ static ssize_t amdgpu_get_pp_sclk_od(struct
> > > device *dev,
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > >       uint32_t value = 0;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > >               value = smu_get_od_percentage(&(adev->smu),
> > > SMU_OD_SCLK);
> > >       else if (adev->powerplay.pp_funcs->get_sclk_od)
> > >               value = amdgpu_dpm_get_sclk_od(adev);
> > >
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       return snprintf(buf, PAGE_SIZE, "%d\n", value);  }
> > >
> > > @@ -1203,10 +1432,12 @@ static ssize_t amdgpu_set_pp_sclk_od(struct
> > > device *dev,
> > >
> > >       ret = kstrtol(buf, 0, &value);
> > >
> > > -     if (ret) {
> > > -             count = -EINVAL;
> > > -             goto fail;
> > > -     }
> > > +     if (ret)
> > > +             return -EINVAL;
> > > +
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > >
> > >       if (is_support_sw_smu(adev)) {
> > >               value = smu_set_od_percentage(&(adev->smu),
> > > SMU_OD_SCLK, (uint32_t)value); @@ -1222,7 +1453,9 @@ static ssize_t
> > > amdgpu_set_pp_sclk_od(struct device *dev,
> > >               }
> > >       }
> > >
> > > -fail:
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       return count;
> > >  }
> > >
> > > @@ -1233,15 +1466,23 @@ static ssize_t amdgpu_get_pp_mclk_od(struct
> > > device *dev,
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > >       uint32_t value = 0;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > >               value = smu_get_od_percentage(&(adev->smu),
> > > SMU_OD_MCLK);
> > >       else if (adev->powerplay.pp_funcs->get_mclk_od)
> > >               value = amdgpu_dpm_get_mclk_od(adev);
> > >
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       return snprintf(buf, PAGE_SIZE, "%d\n", value);  }
> > >
> > > @@ -1260,10 +1501,12 @@ static ssize_t amdgpu_set_pp_mclk_od(struct
> > > device *dev,
> > >
> > >       ret = kstrtol(buf, 0, &value);
> > >
> > > -     if (ret) {
> > > -             count = -EINVAL;
> > > -             goto fail;
> > > -     }
> > > +     if (ret)
> > > +             return -EINVAL;
> > > +
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > >
> > >       if (is_support_sw_smu(adev)) {
> > >               value = smu_set_od_percentage(&(adev->smu),
> > > SMU_OD_MCLK, (uint32_t)value); @@ -1279,7 +1522,9 @@ static ssize_t
> > > amdgpu_set_pp_mclk_od(struct device *dev,
> > >               }
> > >       }
> > >
> > > -fail:
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       return count;
> > >  }
> > >
> > > @@ -1309,16 +1554,27 @@ static ssize_t
> > > amdgpu_get_pp_power_profile_mode(struct device *dev,  {
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > > +     ssize_t size;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > > -             return smu_get_power_profile_mode(&adev->smu, buf);
> > > +             size = smu_get_power_profile_mode(&adev->smu, buf);
> > >       else if (adev->powerplay.pp_funcs->get_power_profile_mode)
> > > -             return amdgpu_dpm_get_power_profile_mode(adev, buf);
> > > +             size = amdgpu_dpm_get_power_profile_mode(adev, buf);
> > > +     else
> > > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > >
> > > -     return snprintf(buf, PAGE_SIZE, "\n");
> > > +     return size;
> > >  }
> > >
> > >
> > > @@ -1343,7 +1599,7 @@ static ssize_t
> > > amdgpu_set_pp_power_profile_mode(struct device *dev,
> > >       tmp[1] = '\0';
> > >       ret = kstrtol(tmp, 0, &profile_mode);
> > >       if (ret)
> > > -             goto fail;
> > > +             return -EINVAL;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return -EINVAL;
> > > @@ -1358,23 +1614,30 @@ static ssize_t
> > > amdgpu_set_pp_power_profile_mode(struct device *dev,
> > >               while (tmp_str[0]) {
> > >                       sub_str = strsep(&tmp_str, delimiter);
> > >                       ret = kstrtol(sub_str, 0, &parameter[parameter_size]);
> > > -                     if (ret) {
> > > -                             count = -EINVAL;
> > > -                             goto fail;
> > > -                     }
> > > +                     if (ret)
> > > +                             return -EINVAL;
> > >                       parameter_size++;
> > >                       while (isspace(*tmp_str))
> > >                               tmp_str++;
> > >               }
> > >       }
> > >       parameter[parameter_size] = profile_mode;
> > > +
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev))
> > >               ret = smu_set_power_profile_mode(&adev->smu, parameter,
> > > parameter_size, true);
> > >       else if (adev->powerplay.pp_funcs->set_power_profile_mode)
> > >               ret = amdgpu_dpm_set_power_profile_mode(adev, parameter,
> > > parameter_size);
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       if (!ret)
> > >               return count;
> > > -fail:
> > > +
> > >       return -EINVAL;
> > >  }
> > >
> > > @@ -1397,10 +1660,17 @@ static ssize_t amdgpu_get_busy_percent(struct
> > > device *dev,
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > +     r = pm_runtime_get_sync(ddev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > > +
> > >       /* read the IP busy sensor */
> > >       r = amdgpu_dpm_read_sensor(adev,
> > > AMDGPU_PP_SENSOR_GPU_LOAD,
> > >                                  (void *)&value, &size);
> > >
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       if (r)
> > >               return r;
> > >
> > > @@ -1426,10 +1696,17 @@ static ssize_t
> > > amdgpu_get_memory_busy_percent(struct device *dev,
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > +     r = pm_runtime_get_sync(ddev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > > +
> > >       /* read the IP busy sensor */
> > >       r = amdgpu_dpm_read_sensor(adev,
> > > AMDGPU_PP_SENSOR_MEM_LOAD,
> > >                                  (void *)&value, &size);
> > >
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       if (r)
> > >               return r;
> > >
> > > @@ -1455,11 +1732,20 @@ static ssize_t amdgpu_get_pcie_bw(struct
> device
> > > *dev,
> > >       struct drm_device *ddev = dev_get_drvdata(dev);
> > >       struct amdgpu_device *adev = ddev->dev_private;
> > >       uint64_t count0, count1;
> > > +     int ret;
> > >
> > >       if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
> > >               return 0;
> > >
> > > +     ret = pm_runtime_get_sync(ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       amdgpu_asic_get_pcie_usage(adev, &count0, &count1);
> > > +
> > > +     pm_runtime_mark_last_busy(ddev->dev);
> > > +     pm_runtime_put_autosuspend(ddev->dev);
> > > +
> > >       return snprintf(buf, PAGE_SIZE, "%llu %llu %i\n",
> > >                       count0, count1, pcie_get_mps(adev->pdev));  } @@ -
> > > 1547,42 +1833,43 @@ static ssize_t amdgpu_hwmon_show_temp(struct
> device
> > > *dev,
> > >                                     char *buf)
> > >  {
> > >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > > -     struct drm_device *ddev = adev->ddev;
> > >       int channel = to_sensor_dev_attr(attr)->index;
> > >       int r, temp = 0, size = sizeof(temp);
> > >
> > > -     /* Can't get temperature when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > -
> > >       if (channel >= PP_TEMP_MAX)
> > >               return -EINVAL;
> > >
> > > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > > +
> > >       switch (channel) {
> > >       case PP_TEMP_JUNCTION:
> > >               /* get current junction temperature */
> > >               r = amdgpu_dpm_read_sensor(adev,
> > > AMDGPU_PP_SENSOR_HOTSPOT_TEMP,
> > >                                          (void *)&temp, &size);
> > > -             if (r)
> > > -                     return r;
> > >               break;
> > >       case PP_TEMP_EDGE:
> > >               /* get current edge temperature */
> > >               r = amdgpu_dpm_read_sensor(adev,
> > > AMDGPU_PP_SENSOR_EDGE_TEMP,
> > >                                          (void *)&temp, &size);
> > > -             if (r)
> > > -                     return r;
> > >               break;
> > >       case PP_TEMP_MEM:
> > >               /* get current memory temperature */
> > >               r = amdgpu_dpm_read_sensor(adev,
> > > AMDGPU_PP_SENSOR_MEM_TEMP,
> > >                                          (void *)&temp, &size);
> > > -             if (r)
> > > -                     return r;
> > > +             break;
> > > +     default:
> > > +             r = -EINVAL;
> > >               break;
> > >       }
> > >
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > > +     if (r)
> > > +             return r;
> > > +
> > >       return snprintf(buf, PAGE_SIZE, "%d\n", temp);  }
> > >
> > > @@ -1678,16 +1965,27 @@ static ssize_t
> > > amdgpu_hwmon_get_pwm1_enable(struct device *dev,  {
> > >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > >       u32 pwm_mode = 0;
> > > +     int ret;
> > > +
> > > +     ret = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > >
> > >       if (is_support_sw_smu(adev)) {
> > >               pwm_mode = smu_get_fan_control_mode(&adev->smu);
> > >       } else {
> > > -             if (!adev->powerplay.pp_funcs->get_fan_control_mode)
> > > +             if (!adev->powerplay.pp_funcs->get_fan_control_mode) {
> > > +                     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +                     pm_runtime_put_autosuspend(adev->ddev->dev);
> > >                       return -EINVAL;
> > > +             }
> > >
> > >               pwm_mode = amdgpu_dpm_get_fan_control_mode(adev);
> > >       }
> > >
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > >       return sprintf(buf, "%i\n", pwm_mode);  }
> > >
> > > @@ -1697,27 +1995,32 @@ static ssize_t
> > > amdgpu_hwmon_set_pwm1_enable(struct device *dev,
> > >                                           size_t count)
> > >  {
> > >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > > -     int err;
> > > +     int err, ret;
> > >       int value;
> > >
> > > -     /* Can't adjust fan when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > -
> > >       err = kstrtoint(buf, 10, &value);
> > >       if (err)
> > >               return err;
> > >
> > > +     ret = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > >       if (is_support_sw_smu(adev)) {
> > >               smu_set_fan_control_mode(&adev->smu, value);
> > >       } else {
> > > -             if (!adev->powerplay.pp_funcs->set_fan_control_mode)
> > > +             if (!adev->powerplay.pp_funcs->set_fan_control_mode) {
> > > +                     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +                     pm_runtime_put_autosuspend(adev->ddev->dev);
> > >                       return -EINVAL;
> > > +             }
> > >
> > >               amdgpu_dpm_set_fan_control_mode(adev, value);
> > >       }
> > >
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > >       return count;
> > >  }
> > >
> > > @@ -1744,34 +2047,43 @@ static ssize_t
> amdgpu_hwmon_set_pwm1(struct
> > > device *dev,
> > >       u32 value;
> > >       u32 pwm_mode;
> > >
> > > -     /* Can't adjust fan when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (err < 0)
> > > +             return err;
> > > +
> > >       if (is_support_sw_smu(adev))
> > >               pwm_mode = smu_get_fan_control_mode(&adev->smu);
> > >       else
> > >               pwm_mode = amdgpu_dpm_get_fan_control_mode(adev);
> > > +
> > >       if (pwm_mode != AMD_FAN_CTRL_MANUAL) {
> > >               pr_info("manual fan speed control should be enabled first\n");
> > > +             pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +             pm_runtime_put_autosuspend(adev->ddev->dev);
> > >               return -EINVAL;
> > >       }
> > >
> > >       err = kstrtou32(buf, 10, &value);
> > > -     if (err)
> > > +     if (err) {
> > > +             pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +             pm_runtime_put_autosuspend(adev->ddev->dev);
> > >               return err;
> > > +     }
> > >
> > >       value = (value * 100) / 255;
> > >
> > > -     if (is_support_sw_smu(adev)) {
> > > +     if (is_support_sw_smu(adev))
> > >               err = smu_set_fan_speed_percent(&adev->smu, value);
> > > -             if (err)
> > > -                     return err;
> > > -     } else if (adev->powerplay.pp_funcs->set_fan_speed_percent) {
> > > +     else if (adev->powerplay.pp_funcs->set_fan_speed_percent)
> > >               err = amdgpu_dpm_set_fan_speed_percent(adev, value);
> > > -             if (err)
> > > -                     return err;
> > > -     }
> > > +     else
> > > +             err = -EINVAL;
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > > +     if (err)
> > > +             return err;
> > >
> > >       return count;
> > >  }
> > > @@ -1784,20 +2096,22 @@ static ssize_t
> amdgpu_hwmon_get_pwm1(struct
> > > device *dev,
> > >       int err;
> > >       u32 speed = 0;
> > >
> > > -     /* Can't adjust fan when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (err < 0)
> > > +             return err;
> > >
> > > -     if (is_support_sw_smu(adev)) {
> > > +     if (is_support_sw_smu(adev))
> > >               err = smu_get_fan_speed_percent(&adev->smu, &speed);
> > > -             if (err)
> > > -                     return err;
> > > -     } else if (adev->powerplay.pp_funcs->get_fan_speed_percent) {
> > > +     else if (adev->powerplay.pp_funcs->get_fan_speed_percent)
> > >               err = amdgpu_dpm_get_fan_speed_percent(adev, &speed);
> > > -             if (err)
> > > -                     return err;
> > > -     }
> > > +     else
> > > +             err = -EINVAL;
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > > +     if (err)
> > > +             return err;
> > >
> > >       speed = (speed * 255) / 100;
> > >
> > > @@ -1812,20 +2126,22 @@ static ssize_t
> > > amdgpu_hwmon_get_fan1_input(struct device *dev,
> > >       int err;
> > >       u32 speed = 0;
> > >
> > > -     /* Can't adjust fan when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (err < 0)
> > > +             return err;
> > >
> > > -     if (is_support_sw_smu(adev)) {
> > > +     if (is_support_sw_smu(adev))
> > >               err = smu_get_fan_speed_rpm(&adev->smu, &speed);
> > > -             if (err)
> > > -                     return err;
> > > -     } else if (adev->powerplay.pp_funcs->get_fan_speed_rpm) {
> > > +     else if (adev->powerplay.pp_funcs->get_fan_speed_rpm)
> > >               err = amdgpu_dpm_get_fan_speed_rpm(adev, &speed);
> > > -             if (err)
> > > -                     return err;
> > > -     }
> > > +     else
> > > +             err = -EINVAL;
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > > +     if (err)
> > > +             return err;
> > >
> > >       return sprintf(buf, "%i\n", speed);
> > >  }
> > > @@ -1839,8 +2155,16 @@ static ssize_t
> amdgpu_hwmon_get_fan1_min(struct
> > > device *dev,
> > >       u32 size = sizeof(min_rpm);
> > >       int r;
> > >
> > > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > > +
> > >       r = amdgpu_dpm_read_sensor(adev,
> > > AMDGPU_PP_SENSOR_MIN_FAN_RPM,
> > >                                  (void *)&min_rpm, &size);
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > >       if (r)
> > >               return r;
> > >
> > > @@ -1856,8 +2180,16 @@ static ssize_t
> > > amdgpu_hwmon_get_fan1_max(struct device *dev,
> > >       u32 size = sizeof(max_rpm);
> > >       int r;
> > >
> > > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > > +
> > >       r = amdgpu_dpm_read_sensor(adev,
> > > AMDGPU_PP_SENSOR_MAX_FAN_RPM,
> > >                                  (void *)&max_rpm, &size);
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > >       if (r)
> > >               return r;
> > >
> > > @@ -1872,20 +2204,22 @@ static ssize_t
> > > amdgpu_hwmon_get_fan1_target(struct device *dev,
> > >       int err;
> > >       u32 rpm = 0;
> > >
> > > -     /* Can't adjust fan when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (err < 0)
> > > +             return err;
> > >
> > > -     if (is_support_sw_smu(adev)) {
> > > +     if (is_support_sw_smu(adev))
> > >               err = smu_get_fan_speed_rpm(&adev->smu, &rpm);
> > > -             if (err)
> > > -                     return err;
> > > -     } else if (adev->powerplay.pp_funcs->get_fan_speed_rpm) {
> > > +     else if (adev->powerplay.pp_funcs->get_fan_speed_rpm)
> > >               err = amdgpu_dpm_get_fan_speed_rpm(adev, &rpm);
> > > -             if (err)
> > > -                     return err;
> > > -     }
> > > +     else
> > > +             err = -EINVAL;
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > > +     if (err)
> > > +             return err;
> > >
> > >       return sprintf(buf, "%i\n", rpm);
> > >  }
> > > @@ -1899,32 +2233,40 @@ static ssize_t
> > > amdgpu_hwmon_set_fan1_target(struct device *dev,
> > >       u32 value;
> > >       u32 pwm_mode;
> > >
> > > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (err < 0)
> > > +             return err;
> > > +
> > >       if (is_support_sw_smu(adev))
> > >               pwm_mode = smu_get_fan_control_mode(&adev->smu);
> > >       else
> > >               pwm_mode = amdgpu_dpm_get_fan_control_mode(adev);
> > >
> > > -     if (pwm_mode != AMD_FAN_CTRL_MANUAL)
> > > +     if (pwm_mode != AMD_FAN_CTRL_MANUAL) {
> > > +             pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +             pm_runtime_put_autosuspend(adev->ddev->dev);
> > >               return -ENODATA;
> > > -
> > > -     /* Can't adjust fan when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > +     }
> > >
> > >       err = kstrtou32(buf, 10, &value);
> > > -     if (err)
> > > +     if (err) {
> > > +             pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +             pm_runtime_put_autosuspend(adev->ddev->dev);
> > >               return err;
> > > +     }
> > >
> > > -     if (is_support_sw_smu(adev)) {
> > > +     if (is_support_sw_smu(adev))
> > >               err = smu_set_fan_speed_rpm(&adev->smu, value);
> > > -             if (err)
> > > -                     return err;
> > > -     } else if (adev->powerplay.pp_funcs->set_fan_speed_rpm) {
> > > +     else if (adev->powerplay.pp_funcs->set_fan_speed_rpm)
> > >               err = amdgpu_dpm_set_fan_speed_rpm(adev, value);
> > > -             if (err)
> > > -                     return err;
> > > -     }
> > > +     else
> > > +             err = -EINVAL;
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > > +     if (err)
> > > +             return err;
> > >
> > >       return count;
> > >  }
> > > @@ -1935,15 +2277,27 @@ static ssize_t
> > > amdgpu_hwmon_get_fan1_enable(struct device *dev,  {
> > >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > >       u32 pwm_mode = 0;
> > > +     int ret;
> > > +
> > > +     ret = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > >
> > >       if (is_support_sw_smu(adev)) {
> > >               pwm_mode = smu_get_fan_control_mode(&adev->smu);
> > >       } else {
> > > -             if (!adev->powerplay.pp_funcs->get_fan_control_mode)
> > > +             if (!adev->powerplay.pp_funcs->get_fan_control_mode) {
> > > +                     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +                     pm_runtime_put_autosuspend(adev->ddev->dev);
> > >                       return -EINVAL;
> > > +             }
> > >
> > >               pwm_mode = amdgpu_dpm_get_fan_control_mode(adev);
> > >       }
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > >       return sprintf(buf, "%i\n", pwm_mode == AMD_FAN_CTRL_AUTO ? 0 :
> > > 1);  }
> > >
> > > @@ -1957,12 +2311,6 @@ static ssize_t
> > > amdgpu_hwmon_set_fan1_enable(struct device *dev,
> > >       int value;
> > >       u32 pwm_mode;
> > >
> > > -     /* Can't adjust fan when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (adev->ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > -
> > > -
> > >       err = kstrtoint(buf, 10, &value);
> > >       if (err)
> > >               return err;
> > > @@ -1974,14 +2322,24 @@ static ssize_t
> > > amdgpu_hwmon_set_fan1_enable(struct device *dev,
> > >       else
> > >               return -EINVAL;
> > >
> > > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (err < 0)
> > > +             return err;
> > > +
> > >       if (is_support_sw_smu(adev)) {
> > >               smu_set_fan_control_mode(&adev->smu, pwm_mode);
> > >       } else {
> > > -             if (!adev->powerplay.pp_funcs->set_fan_control_mode)
> > > +             if (!adev->powerplay.pp_funcs->set_fan_control_mode) {
> > > +                     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +                     pm_runtime_put_autosuspend(adev->ddev->dev);
> > >                       return -EINVAL;
> > > +             }
> > >               amdgpu_dpm_set_fan_control_mode(adev, pwm_mode);
> > >       }
> > >
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > >       return count;
> > >  }
> > >
> > > @@ -1990,18 +2348,20 @@ static ssize_t
> amdgpu_hwmon_show_vddgfx(struct
> > > device *dev,
> > >                                       char *buf)
> > >  {
> > >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > > -     struct drm_device *ddev = adev->ddev;
> > >       u32 vddgfx;
> > >       int r, size = sizeof(vddgfx);
> > >
> > > -     /* Can't get voltage when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > >
> > >       /* get the voltage */
> > >       r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_VDDGFX,
> > >                                  (void *)&vddgfx, &size);
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > >       if (r)
> > >               return r;
> > >
> > > @@ -2020,7 +2380,6 @@ static ssize_t
> amdgpu_hwmon_show_vddnb(struct
> > > device *dev,
> > >                                      char *buf)
> > >  {
> > >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > > -     struct drm_device *ddev = adev->ddev;
> > >       u32 vddnb;
> > >       int r, size = sizeof(vddnb);
> > >
> > > @@ -2028,14 +2387,17 @@ static ssize_t
> amdgpu_hwmon_show_vddnb(struct
> > > device *dev,
> > >       if  (!(adev->flags & AMD_IS_APU))
> > >               return -EINVAL;
> > >
> > > -     /* Can't get voltage when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > >
> > >       /* get the voltage */
> > >       r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_VDDNB,
> > >                                  (void *)&vddnb, &size);
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > >       if (r)
> > >               return r;
> > >
> > > @@ -2054,19 +2416,21 @@ static ssize_t
> > > amdgpu_hwmon_show_power_avg(struct device *dev,
> > >                                          char *buf)
> > >  {
> > >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > > -     struct drm_device *ddev = adev->ddev;
> > >       u32 query = 0;
> > >       int r, size = sizeof(u32);
> > >       unsigned uw;
> > >
> > > -     /* Can't get power when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > >
> > >       /* get the voltage */
> > >       r = amdgpu_dpm_read_sensor(adev,
> > > AMDGPU_PP_SENSOR_GPU_POWER,
> > >                                  (void *)&query, &size);
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > >       if (r)
> > >               return r;
> > >
> > > @@ -2089,16 +2453,27 @@ static ssize_t
> > > amdgpu_hwmon_show_power_cap_max(struct device *dev,  {
> > >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > >       uint32_t limit = 0;
> > > +     ssize_t size;
> > > +     int r;
> > > +
> > > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > >
> > >       if (is_support_sw_smu(adev)) {
> > >               smu_get_power_limit(&adev->smu, &limit, true, true);
> > > -             return snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> > > +             size = snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> > >       } else if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs-
> > > >get_power_limit) {
> > >               adev->powerplay.pp_funcs->get_power_limit(adev-
> > > >powerplay.pp_handle, &limit, true);
> > > -             return snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> > > +             size = snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> > >       } else {
> > > -             return snprintf(buf, PAGE_SIZE, "\n");
> > > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > >       }
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > > +     return size;
> > >  }
> > >
> > >  static ssize_t amdgpu_hwmon_show_power_cap(struct device *dev, @@ -
> > > 2107,16 +2482,27 @@ static ssize_t
> amdgpu_hwmon_show_power_cap(struct
> > > device *dev,  {
> > >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > >       uint32_t limit = 0;
> > > +     ssize_t size;
> > > +     int r;
> > > +
> > > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > >
> > >       if (is_support_sw_smu(adev)) {
> > >               smu_get_power_limit(&adev->smu, &limit, false,  true);
> > > -             return snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> > > +             size = snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> > >       } else if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs-
> > > >get_power_limit) {
> > >               adev->powerplay.pp_funcs->get_power_limit(adev-
> > > >powerplay.pp_handle, &limit, false);
> > > -             return snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> > > +             size = snprintf(buf, PAGE_SIZE, "%u\n", limit * 1000000);
> > >       } else {
> > > -             return snprintf(buf, PAGE_SIZE, "\n");
> > > +             size = snprintf(buf, PAGE_SIZE, "\n");
> > >       }
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > > +     return size;
> > >  }
> > >
> > >
> > > @@ -2138,13 +2524,20 @@ static ssize_t
> > > amdgpu_hwmon_set_power_cap(struct device *dev,
> > >
> > >       value = value / 1000000; /* convert to Watt */
> > >
> > > -     if (is_support_sw_smu(adev)) {
> > > +
> > > +     err = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (err < 0)
> > > +             return err;
> > > +
> > > +     if (is_support_sw_smu(adev))
> > >               err = smu_set_power_limit(&adev->smu, value);
> > > -     } else if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs-
> > > >set_power_limit) {
> > > +     else if (adev->powerplay.pp_funcs &&
> > > +adev->powerplay.pp_funcs->set_power_limit)
> > >               err = adev->powerplay.pp_funcs->set_power_limit(adev-
> > > >powerplay.pp_handle, value);
> > > -     } else {
> > > +     else
> > >               err = -EINVAL;
> > > -     }
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > >
> > >       if (err)
> > >               return err;
> > > @@ -2157,18 +2550,20 @@ static ssize_t
> amdgpu_hwmon_show_sclk(struct
> > > device *dev,
> > >                                     char *buf)
> > >  {
> > >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > > -     struct drm_device *ddev = adev->ddev;
> > >       uint32_t sclk;
> > >       int r, size = sizeof(sclk);
> > >
> > > -     /* Can't get voltage when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > >
> > >       /* get the sclk */
> > >       r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_GFX_SCLK,
> > >                                  (void *)&sclk, &size);
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > >       if (r)
> > >               return r;
> > >
> > > @@ -2187,18 +2582,20 @@ static ssize_t
> amdgpu_hwmon_show_mclk(struct
> > > device *dev,
> > >                                     char *buf)
> > >  {
> > >       struct amdgpu_device *adev = dev_get_drvdata(dev);
> > > -     struct drm_device *ddev = adev->ddev;
> > >       uint32_t mclk;
> > >       int r, size = sizeof(mclk);
> > >
> > > -     /* Can't get voltage when the card is off */
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
> > > -             return -EINVAL;
> > > +     r = pm_runtime_get_sync(adev->ddev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > >
> > >       /* get the sclk */
> > >       r = amdgpu_dpm_read_sensor(adev,
> > > AMDGPU_PP_SENSOR_GFX_MCLK,
> > >                                  (void *)&mclk, &size);
> > > +
> > > +     pm_runtime_mark_last_busy(adev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(adev->ddev->dev);
> > > +
> > >       if (r)
> > >               return r;
> > >
> > > @@ -3220,8 +3617,12 @@ static int amdgpu_debugfs_pm_info(struct
> seq_file
> > > *m, void *data)
> > >       struct drm_info_node *node = (struct drm_info_node *) m->private;
> > >       struct drm_device *dev = node->minor->dev;
> > >       struct amdgpu_device *adev = dev->dev_private;
> > > -     struct drm_device *ddev = adev->ddev;
> > >       u32 flags = 0;
> > > +     int r;
> > > +
> > > +     r = pm_runtime_get_sync(dev->dev);
> > > +     if (r < 0)
> > > +             return r;
> > >
> > >       amdgpu_device_ip_get_clockgating_state(adev, &flags);
> > >       seq_printf(m, "Clock Gating Flags Mask: 0x%x\n", flags); @@ -3230,23
> > > +3631,28 @@ static int amdgpu_debugfs_pm_info(struct seq_file *m, void
> > > *data)
> > >
> > >       if (!adev->pm.dpm_enabled) {
> > >               seq_printf(m, "dpm not enabled\n");
> > > +             pm_runtime_mark_last_busy(dev->dev);
> > > +             pm_runtime_put_autosuspend(dev->dev);
> > >               return 0;
> > >       }
> > > -     if  ((adev->flags & AMD_IS_PX) &&
> > > -          (ddev->switch_power_state != DRM_SWITCH_POWER_ON)) {
> > > -             seq_printf(m, "PX asic powered off\n");
> > > -     } else if (!is_support_sw_smu(adev) && adev->powerplay.pp_funcs-
> > > >debugfs_print_current_performance_level) {
> > > +
> > > +     if (!is_support_sw_smu(adev) &&
> > > +         adev->powerplay.pp_funcs-
> > > >debugfs_print_current_performance_level)
> > > +{
> > >               mutex_lock(&adev->pm.mutex);
> > >               if (adev->powerplay.pp_funcs-
> > > >debugfs_print_current_performance_level)
> > >                       adev->powerplay.pp_funcs-
> > > >debugfs_print_current_performance_level(adev, m);
> > >               else
> > >                       seq_printf(m, "Debugfs support not implemented for
> > > this asic\n");
> > >               mutex_unlock(&adev->pm.mutex);
> > > +             r = 0;
> > >       } else {
> > > -             return amdgpu_debugfs_pm_info_pp(m, adev);
> > > +             r = amdgpu_debugfs_pm_info_pp(m, adev);
> > >       }
> > >
> > > -     return 0;
> > > +     pm_runtime_mark_last_busy(dev->dev);
> > > +     pm_runtime_put_autosuspend(dev->dev);
> > > +
> > > +     return r;
> > >  }
> > >
> > >  static const struct drm_info_list amdgpu_pm_info_list[] = {
> > > --
> > > 2.24.1
> > >
> > > _______________________________________________
> > > amd-gfx mailing list
> > > amd-gfx@lists.freedesktop.org
> > >
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.free
> > > desktop.org%2Fmailman%2Flistinfo%2Famd-
> > >
> gfx&amp;data=02%7C01%7Cevan.quan%40amd.com%7C238a3b3424e54410d5
> > >
> 4b08d796272999%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637
> > >
> 142967374684544&amp;sdata=oFtEwMdJl2KVMiwz9y5GBcwwheE%2FKeg80C4
> > > LqfjZf08%3D&amp;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
