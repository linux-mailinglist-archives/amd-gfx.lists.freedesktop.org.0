Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1781E140ECE
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Jan 2020 17:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A536F604;
	Fri, 17 Jan 2020 16:20:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BBB6F629
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Jan 2020 16:20:20 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id z8so26596259ioh.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Jan 2020 08:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kGUTejDm0mRFA6bkLOL5qSVC6c0fdMm7U2krAkY8a1E=;
 b=TAJIJYMYk/JVacb8/lJGzAq2CZha46mBgn4KgLIwvAp23XiNNITwBQ5Ck4usN3ZH3o
 4B2Jonc2UhO16YDcoPgQVcugGIk9dMmcRhx4L6qIW1Rwa0PgyVR32lJnaIFhKeRnFCDI
 avVfNCpB1I6ZdMLZRMXzHIYfd5e/Mz/RUyrsbOXrKkocrMOmtRH4epgY/L4Y6Q4Vn4/j
 rUind0+oRqU8eW7aaZvypWn25rpFQdEbowkmN+cQQtsrhswGQOswZn8qCVGNxnn74cZv
 YWI8nvDeZwT6+TRW7rFea16rfQ8P6aBLqkzMvOYTp1Y+bNxZuFO3kR8v4dreAGqLLLnT
 XE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kGUTejDm0mRFA6bkLOL5qSVC6c0fdMm7U2krAkY8a1E=;
 b=jjSFmmUa4TAqBPo1xPnySJmcvhZLKgHAuU51VQyq66P7NOerjcTaNm5CmqMbWua2Ze
 um6GBSb5cSZQa2S716EMtOzbqGhAUem36IyXYTFfjU1S2alUxMd0NCcVCHrmtTKpvAW1
 fKBqMk23G5Jia0HMb2w+oxiPGCoSwWB1fLgLo5SMzQNyzPByN1C6bR75QRvOpHXvrR9D
 6EEIiDmDJnnImhxOGhGUC1tC7IPVb09tqUs3xoZ2sJ1b6PETAtu+vWMbAm1riaqOyoNE
 doVk0pBzzgy+9cGCQff5wZUnzlxbucz7d+mbKR++LaAgGNNoKLrMhMnE8VDWQ5ayuZhR
 SbFg==
X-Gm-Message-State: APjAAAWmpdYwPBET8LbGna+JmXW9/fqPnNDp8u2aV5vFSTEQOhQSt/3J
 ufPD5jy8LyOFaCJckY0V3IV92GuHfHULSJfzsWt9gQ==
X-Google-Smtp-Source: APXvYqzQTj67SQ13Hcr5Ah2CmiZvdaLaxCceda6OLW4Jhy1rBpoVP+YbSZez1+FNd7slYyg8M9uCfnUOBPiy5o7+29A=
X-Received: by 2002:a5d:9742:: with SMTP id c2mr32104402ioo.165.1579278020036; 
 Fri, 17 Jan 2020 08:20:20 -0800 (PST)
MIME-Version: 1.0
References: <20191205090043.7580-1-Wayne.Lin@amd.com>
 <a6c4db964da7e00a6069d40abcb3aa887ef5522b.camel@redhat.com>
 <ec3e020798d99ce638c05b0f3eb00ebf53c3bd7c.camel@redhat.com>
 <DM6PR12MB41371AC4B0EC24E84AB0C84DFC580@DM6PR12MB4137.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB41371AC4B0EC24E84AB0C84DFC580@DM6PR12MB4137.namprd12.prod.outlook.com>
From: Sean Paul <sean@poorly.run>
Date: Fri, 17 Jan 2020 11:19:44 -0500
Message-ID: <CAMavQK+pS40SQibFuirjLAmjmy8NbOcXWvNsFP8PanS6dEcXWw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology mgr
To: "Lin, Wayne" <Wayne.Lin@amd.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Dec 9, 2019 at 12:56 AM Lin, Wayne <Wayne.Lin@amd.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Lyude Paul <lyude@redhat.com>
> > Sent: Saturday, December 7, 2019 3:57 AM
> > To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> > amd-gfx@lists.freedesktop.org
> > Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Wentland, Harry
> > <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>;
> > stable@vger.kernel.org
> > Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology
> > mgr
> >
> > On Fri, 2019-12-06 at 14:24 -0500, Lyude Paul wrote:
> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > >
> > > I'll go ahead and push this to drm-misc-next-fixes right now, thanks!
> >
> > Whoops-meant to say drm-misc-next here, anyway, pushed!
> Thanks for your time!
>

I'm getting the following warning on unplug with this patch:

[   54.010099]
[   54.011765] ======================================================
[   54.018670] WARNING: possible circular locking dependency detected
[   54.025577] 5.5.0-rc6-02274-g77381c23ee63 #47 Not tainted
[   54.031610] ------------------------------------------------------
[   54.038516] kworker/1:6/1040 is trying to acquire lock:
[   54.044354] ffff888272af3228 (&mgr->payload_lock){+.+.}, at:
drm_dp_mst_topology_mgr_set_mst+0x218/0x2e4
[   54.054957]
[   54.054957] but task is already holding lock:
[   54.061473] ffff888272af3060 (&mgr->lock){+.+.}, at:
drm_dp_mst_topology_mgr_set_mst+0x3c/0x2e4
[   54.071193]
[   54.071193] which lock already depends on the new lock.
[   54.071193]
[   54.080334]
[   54.080334] the existing dependency chain (in reverse order) is:
[   54.088697]
[   54.088697] -> #1 (&mgr->lock){+.+.}:
[   54.094440]        __mutex_lock+0xc3/0x498
[   54.099015]        drm_dp_mst_topology_get_port_validated+0x25/0x80
[   54.106018]        drm_dp_update_payload_part1+0xa2/0x2e2
[   54.112051]        intel_mst_pre_enable_dp+0x144/0x18f
[   54.117791]        intel_encoders_pre_enable+0x63/0x70
[   54.123532]        hsw_crtc_enable+0xa1/0x722
[   54.128396]        intel_update_crtc+0x50/0x194
[   54.133455]        skl_commit_modeset_enables+0x40c/0x540
[   54.139485]        intel_atomic_commit_tail+0x5f7/0x130d
[   54.145418]        intel_atomic_commit+0x2c8/0x2d8
[   54.150770]        drm_atomic_helper_set_config+0x5a/0x70
[   54.156801]        drm_mode_setcrtc+0x2ab/0x833
[   54.161862]        drm_ioctl+0x2e5/0x424
[   54.166242]        vfs_ioctl+0x21/0x2f
[   54.170426]        do_vfs_ioctl+0x5fb/0x61e
[   54.175096]        ksys_ioctl+0x55/0x75
[   54.179377]        __x64_sys_ioctl+0x1a/0x1e
[   54.184146]        do_syscall_64+0x5c/0x6d
[   54.188721]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   54.194946]
[   54.194946] -> #0 (&mgr->payload_lock){+.+.}:
[   54.201463]
[   54.201463] other info that might help us debug this:
[   54.201463]
[   54.210410]  Possible unsafe locking scenario:
[   54.210410]
[   54.217025]        CPU0                    CPU1
[   54.222082]        ----                    ----
[   54.227138]   lock(&mgr->lock);
[   54.230643]                                lock(&mgr->payload_lock);
[   54.237742]                                lock(&mgr->lock);
[   54.244062]   lock(&mgr->payload_lock);
[   54.248346]
[   54.248346]  *** DEADLOCK ***
[   54.248346]
[   54.254959] 7 locks held by kworker/1:6/1040:
[   54.259822]  #0: ffff888275c4f528 ((wq_completion)events){+.+.},
at: worker_thread+0x455/0x6e2
[   54.269451]  #1: ffffc9000119beb0
((work_completion)(&(&dev_priv->hotplug.hotplug_work)->work)){+.+.},
at: worker_thread+0x455/0x6e2
[   54.282768]  #2: ffff888272a403f0 (&dev->mode_config.mutex){+.+.},
at: i915_hotplug_work_func+0x4b/0x2be
[   54.293368]  #3: ffffffff824fc6c0 (drm_connector_list_iter){.+.+},
at: i915_hotplug_work_func+0x17e/0x2be
[   54.304061]  #4: ffffc9000119bc58 (crtc_ww_class_acquire){+.+.},
at: drm_helper_probe_detect_ctx+0x40/0xfd
[   54.314855]  #5: ffff888272a40470 (crtc_ww_class_mutex){+.+.}, at:
drm_modeset_lock+0x74/0xe2
[   54.324385]  #6: ffff888272af3060 (&mgr->lock){+.+.}, at:
drm_dp_mst_topology_mgr_set_mst+0x3c/0x2e4
[   54.334597]
[   54.334597] stack backtrace:
[   54.339464] CPU: 1 PID: 1040 Comm: kworker/1:6 Not tainted
5.5.0-rc6-02274-g77381c23ee63 #47
[   54.348893] Hardware name: Google Fizz/Fizz, BIOS
Google_Fizz.10139.39.0 01/04/2018
[   54.357451] Workqueue: events i915_hotplug_work_func
[   54.362995] Call Trace:
[   54.365724]  dump_stack+0x71/0x9c
[   54.369427]  check_noncircular+0x91/0xbc
[   54.373809]  ? __lock_acquire+0xc9e/0xf66
[   54.378286]  ? __lock_acquire+0xc9e/0xf66
[   54.382763]  ? lock_acquire+0x175/0x1ac
[   54.387048]  ? drm_dp_mst_topology_mgr_set_mst+0x218/0x2e4
[   54.393177]  ? __mutex_lock+0xc3/0x498
[   54.397362]  ? drm_dp_mst_topology_mgr_set_mst+0x218/0x2e4
[   54.403492]  ? drm_dp_mst_topology_mgr_set_mst+0x218/0x2e4
[   54.409620]  ? drm_dp_dpcd_access+0xd9/0x101
[   54.414390]  ? drm_dp_mst_topology_mgr_set_mst+0x218/0x2e4
[   54.420517]  ? drm_dp_mst_topology_mgr_set_mst+0x218/0x2e4
[   54.426645]  ? intel_digital_port_connected+0x34d/0x35c
[   54.432482]  ? intel_dp_detect+0x227/0x44e
[   54.437056]  ? ww_mutex_lock+0x49/0x9a
[   54.441242]  ? drm_helper_probe_detect_ctx+0x75/0xfd
[   54.446789]  ? intel_encoder_hotplug+0x4b/0x97
[   54.451752]  ? intel_ddi_hotplug+0x61/0x2e0
[   54.456423]  ? mark_held_locks+0x53/0x68
[   54.460803]  ? _raw_spin_unlock_irqrestore+0x3a/0x51
[   54.466347]  ? lockdep_hardirqs_on+0x187/0x1a4
[   54.471310]  ? drm_connector_list_iter_next+0x89/0x9a
[   54.476953]  ? i915_hotplug_work_func+0x206/0x2be
[   54.482208]  ? worker_thread+0x4d5/0x6e2
[   54.486587]  ? worker_thread+0x455/0x6e2
[   54.490966]  ? queue_work_on+0x64/0x64
[   54.495151]  ? kthread+0x1e9/0x1f1
[   54.498946]  ? queue_work_on+0x64/0x64
[   54.503130]  ? kthread_unpark+0x5e/0x5e
[   54.507413]  ? ret_from_fork+0x3a/0x50

\snip
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
