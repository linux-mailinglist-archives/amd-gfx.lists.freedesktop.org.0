Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DEF62F118
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Nov 2022 10:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847CB10E20C;
	Fri, 18 Nov 2022 09:24:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 386 seconds by postgrey-1.36 at gabe;
 Fri, 18 Nov 2022 09:24:46 UTC
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77DA10E20C
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Nov 2022 09:24:46 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4NDB606Phzz9skf;
 Fri, 18 Nov 2022 10:18:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1668763096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lTdyYev7Ss9teMBT/XBdYBNta7QNMGTiSYism0OihVU=;
 b=K4iIv+pZTFwX+LEDRaLRHyjsgcD4KeBvR0ua48NOL0K5wqITYyjnjgNxRis4zmvj7lI5WQ
 tKQ/qV08YGd+MwUdViZ892ZR6tyNTo/TeaSnzkcXCI7Baa2CvAjAvVxCN1ebiQ66okaEL0
 WQXhuqP6Wxiq6m16KKL3Hbo1oOKlKducPVYjbF3EwAZH2zVR+Y4ClR79JKcojy2eakDzzb
 PCJzbJrb5EKfuHr2kjQYiMoI0Tc8rHhiJBVsG4VJJoX3aNmuVRcYqfLvAhvHFmEOWjWmFz
 cmTdNo7oTXxjP8RKYYjFKvyrmoLYtpJ5bZFIqEJsqr0d8NlhrQVRW/yBBc5E6A==
Message-ID: <800a1207-8ff6-4cfa-60f3-6ff456874890@mailbox.org>
Date: Fri, 18 Nov 2022 10:18:14 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amdgpu: add mb for si
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Zhenneng Li <lizhenneng@kylinos.cn>, Alex Deucher <alexander.deucher@amd.com>
References: <20221118074810.380368-1-lizhenneng@kylinos.cn>
 <ecd9d251-8941-b2db-71b2-e4ac06f860a3@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <ecd9d251-8941-b2db-71b2-e4ac06f860a3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1afyttkaptk1qh7bss3ey8wa78i7z3af
X-MBO-RS-ID: 4afc4dcc6c7cfafea96
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
Cc: amd-gfx@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 11/18/22 09:01, Christian König wrote:
> Am 18.11.22 um 08:48 schrieb Zhenneng Li:
>> During reboot test on arm64 platform, it may failure on boot,
>> so add this mb in smc.
>>
>> The error message are as follows:
>> [    6.996395][ 7] [  T295] [drm:amdgpu_device_ip_late_init [amdgpu]] *ERROR*
>>                 late_init of IP block <si_dpm> failed -22
>> [    7.006919][ 7] [  T295] amdgpu 0000:04:00.0: amdgpu_device_ip_late_init failed
>> [    7.014224][ 7] [  T295] amdgpu 0000:04:00.0: Fatal error during GPU init
> 
> Memory barries are not supposed to be sprinkled around like this, you need to give a detailed explanation why this is necessary.
> 
> Regards,
> Christian.
> 
>>
>> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
>> ---
>>   drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>> index 8f994ffa9cd1..c7656f22278d 100644
>> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>> @@ -155,6 +155,8 @@ bool amdgpu_si_is_smc_running(struct amdgpu_device *adev)
>>       u32 rst = RREG32_SMC(SMC_SYSCON_RESET_CNTL);
>>       u32 clk = RREG32_SMC(SMC_SYSCON_CLOCK_CNTL_0);
>>   +    mb();
>> +
>>       if (!(rst & RST_REG) && !(clk & CK_DISABLE))
>>           return true;

In particular, it makes no sense in this specific place, since it cannot directly affect the values of rst & clk.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

