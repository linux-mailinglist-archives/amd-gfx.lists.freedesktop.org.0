Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B20590FCE
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Aug 2022 12:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A54BAEE54;
	Fri, 12 Aug 2022 10:56:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D6B93FF1;
 Fri, 12 Aug 2022 10:56:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id s23so413600wmj.4;
 Fri, 12 Aug 2022 03:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=wCpuZt7zsXJCv3TvvAq6C8ZRf18JeBZLzSKLyeoAOvA=;
 b=fnS1IPb0E6N1C98wxeCMIWt6EtshUj7O+SNyhhr57QZBHDadvq4q27+uS9ThH0DE7v
 MCxkfL+z13JSzOaI7VdqGJqXXe+vibHJ4cAM28KU7yo5nsCVQsmbpN6unHBGUDsb6/Gq
 i6A+pa9Kq7qkyErb7k4tHbzu8NxB1toJu09kR68HSincaHrgUUU4in19ra3LCidpG1z0
 gJIpje3PsxPgNmKNDG5coEyNNl2fVnrYNnfkxakrZhvd+qTLeCyPLp/Rdvl5t6zDUJZC
 wiS42T3nbhVS56q6c0k7YFG5i0zIdFqBE6zsCaZBbW9p69kIO9iSVOiAOkFv/QGPQ5S+
 Qikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=wCpuZt7zsXJCv3TvvAq6C8ZRf18JeBZLzSKLyeoAOvA=;
 b=RmaemZVPVoJ5u09mV0hzXIEw26GPJB8ce7lyAEsS73lUtehMbesREUvivgHM2ck3yS
 VlqO83MLHPz22HbGmpgq+sCDUTxgqwFRKV3hMHHURQu6dSaghhRBIhWmVhj18FTRCx9I
 GZyZ/nRKKB9/q4ti5st1BxNgu7cqg9aZsXBEsjrnw1idpWzF35huS2wMPD2V4FuTMeTx
 lLOb36Itgmy31p77Jg/4Vu2dCXoRYAXFcu4SU/9kXciTr5dwbRztAJ7SPTcUrf3CAr9x
 RIoTK2lPiDXzLNKpOLyD5ZgNQ93Bn+tMWGLLt87e7THrdUsKWl7dRiBGpti68VnZmnK0
 TwwQ==
X-Gm-Message-State: ACgBeo2cdzmLV+wa3KV0KKj2X0ZNj0cy9TgHdmngz1B1PjLDM/QVrYEx
 f2UVSTVozoIQmyM2OxCnF2w=
X-Google-Smtp-Source: AA6agR7d5inXLGzsnj4k2QyMbh37IJq1TJbdxWbcr3Zz8PUpaIsqBHZlXkkbkDbpsRtZaYoT2BbxjA==
X-Received: by 2002:a1c:cc11:0:b0:3a4:c032:c44 with SMTP id
 h17-20020a1ccc11000000b003a4c0320c44mr9006222wmb.84.1660301760738; 
 Fri, 12 Aug 2022 03:56:00 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bd9f.dip0.t-ipconnect.de.
 [87.176.189.159]) by smtp.gmail.com with ESMTPSA id
 t5-20020a5d4605000000b0021b956da1dcsm1586433wrq.113.2022.08.12.03.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 03:56:00 -0700 (PDT)
Message-ID: <b23e4037-2030-32d0-d626-b5a846fcafeb@gmail.com>
Date: Fri, 12 Aug 2022 12:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/radeon: add a force flush to delay work when radeon
Content-Language: en-US
To: Zhenneng Li <lizhenneng@kylinos.cn>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20220811072540.964309-1-lizhenneng@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220811072540.964309-1-lizhenneng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 11.08.22 um 09:25 schrieb Zhenneng Li:
> Although radeon card fence and wait for gpu to finish processing current batch rings,
> there is still a corner case that radeon lockup work queue may not be fully flushed,
> and meanwhile the radeon_suspend_kms() function has called pci_set_power_state() to
> put device in D3hot state.

If I'm not completely mistaken the reset worker uses the suspend/resume 
functionality as well to get the hardware into a working state again.

So if I'm not completely mistaken this here would lead to a deadlock, 
please double check that.

Regards,
Christian.

> Per PCI spec rev 4.0 on 5.3.1.4.1 D3hot State.
>> Configuration and Message requests are the only TLPs accepted by a Function in
>> the D3hot state. All other received Requests must be handled as Unsupported Requests,
>> and all received Completions may optionally be handled as Unexpected Completions.
> This issue will happen in following logs:
> Unable to handle kernel paging request at virtual address 00008800e0008010
> CPU 0 kworker/0:3(131): Oops 0
> pc = [<ffffffff811bea5c>]  ra = [<ffffffff81240844>]  ps = 0000 Tainted: G        W
> pc is at si_gpu_check_soft_reset+0x3c/0x240
> ra is at si_dma_is_lockup+0x34/0xd0
> v0 = 0000000000000000  t0 = fff08800e0008010  t1 = 0000000000010000
> t2 = 0000000000008010  t3 = fff00007e3c00000  t4 = fff00007e3c00258
> t5 = 000000000000ffff  t6 = 0000000000000001  t7 = fff00007ef078000
> s0 = fff00007e3c016e8  s1 = fff00007e3c00000  s2 = fff00007e3c00018
> s3 = fff00007e3c00000  s4 = fff00007fff59d80  s5 = 0000000000000000
> s6 = fff00007ef07bd98
> a0 = fff00007e3c00000  a1 = fff00007e3c016e8  a2 = 0000000000000008
> a3 = 0000000000000001  a4 = 8f5c28f5c28f5c29  a5 = ffffffff810f4338
> t8 = 0000000000000275  t9 = ffffffff809b66f8  t10 = ff6769c5d964b800
> t11= 000000000000b886  pv = ffffffff811bea20  at = 0000000000000000
> gp = ffffffff81d89690  sp = 00000000aa814126
> Disabling lock debugging due to kernel taint
> Trace:
> [<ffffffff81240844>] si_dma_is_lockup+0x34/0xd0
> [<ffffffff81119610>] radeon_fence_check_lockup+0xd0/0x290
> [<ffffffff80977010>] process_one_work+0x280/0x550
> [<ffffffff80977350>] worker_thread+0x70/0x7c0
> [<ffffffff80977410>] worker_thread+0x130/0x7c0
> [<ffffffff80982040>] kthread+0x200/0x210
> [<ffffffff809772e0>] worker_thread+0x0/0x7c0
> [<ffffffff80981f8c>] kthread+0x14c/0x210
> [<ffffffff80911658>] ret_from_kernel_thread+0x18/0x20
> [<ffffffff80981e40>] kthread+0x0/0x210
>   Code: ad3e0008  43f0074a  ad7e0018  ad9e0020  8c3001e8  40230101
>   <88210000> 4821ed21
> So force lockup work queue flush to fix this problem.
>
> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
> ---
>   drivers/gpu/drm/radeon/radeon_device.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 15692cb241fc..e608ca26780a 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1604,6 +1604,9 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
>   		if (r) {
>   			/* delay GPU reset to resume */
>   			radeon_fence_driver_force_completion(rdev, i);
> +		} else {
> +			/* finish executing delayed work */
> +			flush_delayed_work(&rdev->fence_drv[i].lockup_work);
>   		}
>   	}
>   

