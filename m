Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 656262AB320
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Nov 2020 10:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E129189826;
	Mon,  9 Nov 2020 09:06:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B4789826
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Nov 2020 09:06:43 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id o21so11133478ejb.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 09 Nov 2020 01:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=n/ZkDPrxYQnBPGruplLBCZYDs70O/RHL1QZXd1r0x1s=;
 b=kv+z6rUbAZatEAKZHssiolIEICTIYyAjD8fQZ2oyAvyPMQxnbgiVPAGHX9twnqhzJX
 LY/JWe+xHE4pT0UjgKKEmLFmnK8knPS4QLMOcbxgoGMEJZNQg/aiVY6JvUPg4WDlIkrj
 MpuEXg/xpD4E/UKwER3OdLK1YtKTUIK8zSBxXUJUamjAehB+UgVBJV7clAfTKXNwbtJ/
 J8oKQPsmH2bgoyAfpKTfunLKVhIuY6stCX4kRwIyvRt0mKudEUqqHrPDWGey+xYPjQpN
 u1pQZ48FcoBUjvVBiQduDTBtNM/MkYDq6oCmVpHY35BAXCfaLFzGimkKa0zhnZjYdj8V
 avsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=n/ZkDPrxYQnBPGruplLBCZYDs70O/RHL1QZXd1r0x1s=;
 b=uVyo4+IOsE79N4hKFZIDwLkMcDmrFUTIZ+IEELg+YA7RFq3nZ+oJyiSUK+++5Yff57
 Ym218x9sEk32s+BytaGrvdm0LHPrCQ9LDM8rMvurADWeSbEsCjqfpKzDBEyVy+zwAyyl
 RN0LH7fHGoEToBiCfu0eTM/U1xVxRUUs899dhSNY48UwF7i0NJg58mqOtZPLKKya2tuN
 4EPhtQPaxi1EszUxSa6J+d//YZXviGg23nB7mLeHEsZCctoYavNEyOrVgqsCnX6TGJFB
 UfYl30rkpaYlEVUjyX3NVkNHDUlUupnsYCdir56O+YY0SdnQ0uAxh/Fcqz6Y0bFbXbjf
 V+5A==
X-Gm-Message-State: AOAM530MCs9vrJ+UCwFFvSP37E9BGBGhFPpBKKzHJVIPf9f+Om63mCu/
 RsOkemsJ2cEaRGGovXeLdSTvIQiAyiA=
X-Google-Smtp-Source: ABdhPJzx3kMrK9OPsC3TYW4hTevTHmIknGw5y2Ig/T1yw6HNR07Z7xaREn4SFckFfX9pTFSVwn021w==
X-Received: by 2002:a17:906:3a8d:: with SMTP id
 y13mr14488979ejd.460.1604912801950; 
 Mon, 09 Nov 2020 01:06:41 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id k2sm8316485ejp.6.2020.11.09.01.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 01:06:41 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: fix SI UVD firmware validate resume fail
To: Sonny Jiang <sonny.jiang@amd.com>, amd-gfx@lists.freedesktop.org
References: <20201108150953.12042-1-sonny.jiang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d0bdc224-6a4c-1e49-3cfc-1d4988b8516b@gmail.com>
Date: Wed, 11 Nov 2020 18:06:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201108150953.12042-1-sonny.jiang@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 08.11.20 um 16:09 schrieb Sonny Jiang:
> The SI UVD firmware validate key is stored at the end of firmware,
> which is changed during resume while playing video. So only to get
> the key at device initialization and save it for later using.
>
> Signed-off-by: Sonny Jiang <sonny.jiang@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> index 7cf4b11a65c5..aab7415c1a32 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> @@ -279,13 +279,16 @@ static int uvd_v3_1_fw_validate(struct amdgpu_device *adev)
>   {
>   	void *ptr;
>   	uint32_t ucode_len, i;
> -	uint32_t keysel;
> -
> -	ptr = adev->uvd.inst[0].cpu_addr;
> -	ptr += 192 + 16;
> -	memcpy(&ucode_len, ptr, 4);
> -	ptr += ucode_len;
> -	memcpy(&keysel, ptr, 4);
> +	static uint32_t keysel = 0;

Well, that is a really big NAK.

You can't just make a variable static and hope that we don't have 
multiple instances of the device driver loaded.

If you need to keep the value around put it into adev somehow.

Christian.

> +
> +	/* Only get the validate key at device initialization*/
> +	if (!keysel) {
> +		ptr = adev->uvd.inst[0].cpu_addr;
> +		ptr += 192 + 16;
> +		memcpy(&ucode_len, ptr, 4);
> +		ptr += ucode_len;
> +		memcpy(&keysel, ptr, 4);
> +	}
>   
>   	WREG32(mmUVD_FW_START, keysel);
>   

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
