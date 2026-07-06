Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HF0TB/eTS2pqVwEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Jul 2026 13:39:35 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3997570FF78
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Jul 2026 13:39:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=opJzsSk0;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D5A10E34D;
	Mon,  6 Jul 2026 11:39:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2C810E34D
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jul 2026 11:39:31 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-92e512a9a6bso120638085a.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 Jul 2026 04:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783337970; x=1783942770; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M0Z8z2hQuVXZTXJB/8X2KRBea8t4sgsU0prcB/4mvG8=;
 b=opJzsSk06LlM362iXKbAE0vB55zbZ+minE4HCL+CllcgAqiU77vdGAAaoZ16nOhG+L
 Ssyct1wvLfMS3UMG4SnoMIBoEUjnHA2ThMCpwnCdB3u/Yp9Dh9cTS2S01OB+jUCaJZVK
 GB/5hTrJvfiXZ+O+Ygi67HdI0wydHMaYAlSPXm2g91dSqeSonYg+UErYu3WDxgGp8WAJ
 KIsFgHnihHxcreJhXpgMrcx5VIJAkvAEbhK1t/kulUdGZ2MSf8QlswPBbgxvtcE1GV1B
 h7RCRuxFCVJddukOeBpIFMwPs28ehD0FgBPRgY+/B+7JVozB7YYK39eny3TAsMfFx2LT
 9QRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783337970; x=1783942770;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M0Z8z2hQuVXZTXJB/8X2KRBea8t4sgsU0prcB/4mvG8=;
 b=UforprEaxglsWNPG1eucNPWvOek+oMWZ1CyopszlQQbWjrP8YakAH+GPYBDYHb4+7K
 AFqEHbCqRURUTrBmyZKRP6/JUqr/phyoW41CHXr2cOUqwgBb3VhxZwhyidhA0LVBM8yf
 fnbi87/SSBOe+n5cXVRsJXif3A98aps3RCf5uIQNoK+8uucCCFfr+MlAxMA/U3RN0oOx
 +zbDePyeyJ18bmtidhAsfDRD1YTVr4E7RIiPh2ybScqzS0R7R3l1SVzx4dfCME4E9j7n
 3P44GE2jZeGD7s/5ODFfuDlu0caYmtNs2aG2JjSRNVkZFwCncV4ttNwdAHLT/j9hIawT
 mA2A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp/Y9fxkE1ysVHm7wBPdPpEo8NKA0tyoMlVY5ze5sWIO9qTfwKJywVQwLClJ84WDKzR2XX2uWvR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwreOCFtWR52znfoWoPU1blm+I6lg42GnS/FNPrerpDujiZt9D0
 pwIGZY3c2fmLEAXweCx9F+jGvltOOG5KKq9QcrTC013Y8klqay03EV+U
X-Gm-Gg: AfdE7clnhs4vZ5rnhSlYK4I78Cp1tew8QKl8HNN9OmCrXSBIJdQtb9s9gD2L+OvMngp
 0fEU1RXCRmf+/u4ITrA7TVXsMPRkoQ4qsj4pn3tiD1pQT07FT/ZUpuDlVLoCDgmnHa+Gbw6NPqv
 C5SILfpr7287Zu7+wt9sVPyU8aEf1rxRpxH6zkOU4q1hIVbD1X5JJGihSPTqf+CXozBJMiw/h7H
 uFKZZFehgZ0W8xCQEqiXoDXAQzWF4SizK2iW2nq5o91CUrFWkTE0ZuUK72bEWzeHqWqiBLLtIZi
 +hYOSizv8JDTeSs14iulmWVb97pQC4JYbJzkkgyIEpcAjIj77UZDNi2Mp8xAZhbBAkWrbEgi4j1
 RHxuu8xp0LkfP1Q5ZuhqXzQ3ezg+d7nWAjRP0MvOxEEBX+aTF1AZ5402N09aS84JBHoB5cg846u
 3U2Z6P+G8jFTx4hOS+DAfM+yDGACxGGVStrJYZiF0uQ8k4
X-Received: by 2002:a05:620a:198b:b0:92e:6b16:6a09 with SMTP id
 af79cd13be357-92ebb589de4mr19803685a.49.1783337970461; 
 Mon, 06 Jul 2026 04:39:30 -0700 (PDT)
Received: from [10.254.122.221] (mkmvpn.amd.com. [165.204.54.211])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8f46f304533sm133446416d6.18.2026.07.06.04.39.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2026 04:39:30 -0700 (PDT)
Message-ID: <6151568f-037e-4a2e-9a38-aa1ad692dba2@gmail.com>
Date: Mon, 6 Jul 2026 13:39:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: improve the amdgpu device init progress
 in sriov mode
To: chong li <chongli2@amd.com>, amd-gfx@lists.freedesktop.org
Cc: HaiJun.Chang@amd.com, Emily.Deng@amd.com, Cursor <cursoragent@cursor.com>
References: <20260701055355.20478-1-chongli2@amd.com>
 <20260701055355.20478-2-chongli2@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20260701055355.20478-2-chongli2@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chongli2@amd.com,m:HaiJun.Chang@amd.com,m:Emily.Deng@amd.com,m:cursoragent@cursor.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,cursor.com:email,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3997570FF78

On 7/1/26 07:53, chong li wrote:
> Move the initialization of non-GPU resources
> out of the full GPU access region during AMDGPU device initialization

As far as I can see that won't work like this.

There are a lot of steps which require full GPU access.

What exactly is the justification of the change?

Regards,
Christian.

> 
> Signed-off-by: chong li <chongli2@amd.com>
> Co-authored-by: Cursor <cursoragent@cursor.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 610d82b79de3..c2ce4659ddc7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1994,10 +1994,6 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
>  	amdgpu_device_enable_virtual_display(adev);
>  
>  	if (amdgpu_sriov_vf(adev)) {
> -		r = amdgpu_virt_request_full_gpu(adev, true);
> -		if (r)
> -			return r;
> -
>  		r = amdgpu_virt_init_critical_region(adev);
>  		if (r)
>  			return r;
> @@ -2159,6 +2155,12 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
>  	if (!total)
>  		return -ENODEV;
>  
> +	if (amdgpu_sriov_vf(adev)) {
> +		r = amdgpu_virt_request_full_gpu(adev, true);
> +		if (r)
> +			return r;
> +	}
> +
>  	if (adev->gmc.xgmi.supported)
>  		amdgpu_xgmi_early_init(adev);
>  

