Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014F074E9E4
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jul 2023 11:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EEF10E33A;
	Tue, 11 Jul 2023 09:09:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1B510E33A
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jul 2023 09:09:19 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso8410464e87.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jul 2023 02:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689066557; x=1691658557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WGrGUOSt1YkljRjy6nP+J8hvm+5DmvAJIgtuelG92bA=;
 b=NR+Iccm9YWYVUEnR/lGedKcu1yo5oxPQYqLCJR2idtqtnc0iVdn9hT4RpRHNx06X2r
 /5TWNa3nz+qLX+Wp7ra3fuBu1tzkJcwpGcN8BNedFIw9ABNYjKrwNHQdBcIiIe/yXZMu
 cxLzD2UDXNlOrNpywSh/ZVVIERfzoDteiqh3oe8GlXUaaWKqOBXLW0S+eQvR3ftsODrT
 zwgjW4qT41kBKzyK6NCOjrV0GL9+twWmDz94pF6NrxRMWfwuFqw6IAtGJJEQrQcOGU3n
 sMMAmpDYinpSn7H6ByGh/z0cncmd0kdxxrk/lgRUVBGs2T006N3u6i5guAbGPyY4dmsy
 G9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689066557; x=1691658557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WGrGUOSt1YkljRjy6nP+J8hvm+5DmvAJIgtuelG92bA=;
 b=BVD0n90W6ulDllqh7pk/vwm5HcpM9Vj1aY4fiT9FsJ4av9RPGzpPhKC5Z/yEPudtmJ
 zcILU4VUG1rS7n97jJ8nkn0Eo82/irC7VhKDC8XnAd4wG7Dst8gus/O1A5pIwYij0pIB
 3ZGXsJYRl3akDkDUscIH3HWeicz0R0V0oeFW4jR5vfo/o5fuTe3M806pFBmViaZTYTTe
 y2WcNSV2l3BsvEa0MtmWOrj4Utl39Agu26JO86t+vhejsx0zV0rfY6f59MgHqhCWisA0
 qOAi5HFucSldCniMoXEyKSZEwH7AlINzhR9Qt6QbkmtO9UsvENaTOgYAAM6xQw99l+Kr
 65Zw==
X-Gm-Message-State: ABy/qLakV5j7ax9c8bdHxDYiRLHOT7xFAWRTLyd6XaYtjkH/PTykUcTx
 /l9L645WtNvRmbsjmTP0VB0=
X-Google-Smtp-Source: APBJJlF9POGtPnvWltk1/kMNz9HO3xod8pr1WXnaYB1rTeFiR5Fi+4SgZeQE+1nVC/f7sq4Kv0iv7A==
X-Received: by 2002:a05:6512:32ce:b0:4fb:9f93:365e with SMTP id
 f14-20020a05651232ce00b004fb9f93365emr14362817lfg.41.1689066556636; 
 Tue, 11 Jul 2023 02:09:16 -0700 (PDT)
Received: from ?IPV6:2a00:e180:154b:c600:506b:c492:754a:b750?
 ([2a00:e180:154b:c600:506b:c492:754a:b750])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a5d6752000000b0031434cebcd8sm1687101wrw.33.2023.07.11.02.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 02:09:16 -0700 (PDT)
Message-ID: <2a71b5c0-a79d-16e7-cba4-37018f2ebecf@gmail.com>
Date: Tue, 11 Jul 2023 11:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] drm/amdgpu/vkms: relax timer deactivation by
 hrtimer_try_to_cancel
Content-Language: en-US
To: Guchun Chen <guchun.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, hawking.zhang@amd.com, christian.koenig@amd.com,
 dusica.milinkovic@amd.com, nikola.prica@amd.com, flora.cui@amd.com
References: <20230711013831.2181718-1-guchun.chen@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230711013831.2181718-1-guchun.chen@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: stable@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



Am 11.07.23 um 03:38 schrieb Guchun Chen:
> In below thousands of screen rotation loop tests with virtual display
> enabled, a CPU hard lockup issue may happen, leading system to unresponsive
> and crash.
>
> do {
> 	xrandr --output Virtual --rotate inverted
> 	xrandr --output Virtual --rotate right
> 	xrandr --output Virtual --rotate left
> 	xrandr --output Virtual --rotate normal
> } while (1);
>
> NMI watchdog: Watchdog detected hard LOCKUP on cpu 1
>
> ? hrtimer_run_softirq+0x140/0x140
> ? store_vblank+0xe0/0xe0 [drm]
> hrtimer_cancel+0x15/0x30
> amdgpu_vkms_disable_vblank+0x15/0x30 [amdgpu]
> drm_vblank_disable_and_save+0x185/0x1f0 [drm]
> drm_crtc_vblank_off+0x159/0x4c0 [drm]
> ? record_print_text.cold+0x11/0x11
> ? wait_for_completion_timeout+0x232/0x280
> ? drm_crtc_wait_one_vblank+0x40/0x40 [drm]
> ? bit_wait_io_timeout+0xe0/0xe0
> ? wait_for_completion_interruptible+0x1d7/0x320
> ? mutex_unlock+0x81/0xd0
> amdgpu_vkms_crtc_atomic_disable
>
> It's caused by a stuck in lock dependency in such scenario on different
> CPUs.
>
> CPU1                                             CPU2
> drm_crtc_vblank_off                              hrtimer_interrupt
>      grab event_lock (irq disabled)                   __hrtimer_run_queues
>          grab vbl_lock/vblank_time_block                  amdgpu_vkms_vblank_simulate
>              amdgpu_vkms_disable_vblank                       drm_handle_vblank
>                  hrtimer_cancel                                         grab dev->event_lock
>
> So CPU1 stucks in hrtimer_cancel as timer callback is running endless on
> current clock base, as that timer queue on CPU2 has no chance to finish it
> because of failing to hold the lock. So NMI watchdog will throw the errors
> after its threshold, and all later CPUs are impacted/blocked.
>
> So use hrtimer_try_to_cancel to fix this, as disable_vblank callback
> does not need to wait the handler to finish. And also it's not necessary
> to check the return value of hrtimer_try_to_cancel, because even if it's
> -1 which means current timer callback is running, it will be reprogrammed
> in hrtimer_start with calling enable_vblank to make it works.
>
> v2: only re-arm timer when vblank is enabled (Christian) and add a Fixes
> tag as well
>
> v3: drop warn printing (Christian)
>
> Fixes: 84ec374bd580("drm/amdgpu: create amdgpu_vkms (v4)")
> Cc: stable@vger.kernel.org
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> index 53ff91fc6cf6..b870c827cbaa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -46,7 +46,10 @@ static enum hrtimer_restart amdgpu_vkms_vblank_simulate(struct hrtimer *timer)
>   	struct amdgpu_crtc *amdgpu_crtc = container_of(timer, struct amdgpu_crtc, vblank_timer);
>   	struct drm_crtc *crtc = &amdgpu_crtc->base;
>   	struct amdgpu_vkms_output *output = drm_crtc_to_amdgpu_vkms_output(crtc);
> +	struct drm_vblank_crtc *vblank;
> +	struct drm_device *dev;
>   	u64 ret_overrun;
> +	unsigned int pipe;
>   	bool ret;
>   
>   	ret_overrun = hrtimer_forward_now(&amdgpu_crtc->vblank_timer,
> @@ -54,9 +57,13 @@ static enum hrtimer_restart amdgpu_vkms_vblank_simulate(struct hrtimer *timer)
>   	if (ret_overrun != 1)
>   		DRM_WARN("%s: vblank timer overrun\n", __func__);
>   
> +	dev = crtc->dev;
> +	pipe = drm_crtc_index(crtc);
> +	vblank = &dev->vblank[pipe];
>   	ret = drm_crtc_handle_vblank(crtc);
> -	if (!ret)
> -		DRM_ERROR("amdgpu_vkms failure on handling vblank");
> +	/* Don't queue timer again when vblank is disabled. */
> +	if (!ret && !READ_ONCE(vblank->enabled))
> +		return HRTIMER_NORESTART;

When drm_crtc_handle_vblank() returns false when vblank is disabled I 
think we can simplify this to just removing the error.

Regards,
Christian.

>   
>   	return HRTIMER_RESTART;
>   }
> @@ -81,7 +88,7 @@ static void amdgpu_vkms_disable_vblank(struct drm_crtc *crtc)
>   {
>   	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
>   
> -	hrtimer_cancel(&amdgpu_crtc->vblank_timer);
> +	hrtimer_try_to_cancel(&amdgpu_crtc->vblank_timer);
>   }
>   
>   static bool amdgpu_vkms_get_vblank_timestamp(struct drm_crtc *crtc,

