Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BCB1CA8A2
	for <lists+amd-gfx@lfdr.de>; Fri,  8 May 2020 12:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B736EADE;
	Fri,  8 May 2020 10:53:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E7D6EADE
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 May 2020 10:53:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x17so1334680wrt.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 08 May 2020 03:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ktiaJfdKg6GcRJhwoDKvJkcd2Ah7x63KEd0rUp4khnM=;
 b=YrSMEtiXntSXz4KfbjLUpOHr86Zv+5bnxFio7LEUcTkfRhcTXM6we6WlVrrt3FWtD+
 +wpIweJHEWXZQrpYtN/e9vhWGBjp84D3SXKr6WuYbk545CwvoDqsvn5yNcGvkrK82vS4
 mSg5LSyDWj6cqhfB2q7ZWPHaQp6H0V60hBoG2u4ouhNziVBVKGo+M568QNfFiuocpi8Q
 R4yaf0YwP8sapMAMSFLe4EscxkPyAjJzVtiectTXXBsRXpj+60+AHitvSgy3dQrVK53/
 cfDEvb644ehQNrm1Lzeoi3Hz9baYL5gSnt2m5Stslc1DnlPZXJnplhcFZLgkujZulT86
 g+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ktiaJfdKg6GcRJhwoDKvJkcd2Ah7x63KEd0rUp4khnM=;
 b=JD3/8C00OEyyqU1a8/km4ldsfKCk3GDX7l/87s2GAOupD8gOPKauKCiCtP8k17gBf5
 DuXAkoSiS/QDmXaR/LPiy8P3UccvdNr+do5zHbIj6KUecRm9Qzku6tpseVlVeVThikyD
 KjanIbWkrWk6Pq/TRqDJ2igbEe0Ey7NrOa2A+jmfN1jtSXBXtCNSn+aviSuIvOTwMTzD
 PuAkyheScfqQQsEYlJ/oz1PYqdo9j/iMWMxjv1o0PCbXv29YRts+bu4QokrYGy7An2yl
 Lwz20tDMUuYGY6FHiiOcBA/hVGOXZu49bJjPy/c/VAUPKNnsyYKkwrtxGZq//onJVmqU
 zcoA==
X-Gm-Message-State: AGi0PuaMbtQSQrhvXcL/I/f7Xdtcgrucm9sJXtxUAcW08InEaoCHJXOh
 M4Jtj4b/hEdkl1lD2HSLUHsfDOMv
X-Google-Smtp-Source: APiQypJQR1lBFbooWRwWLNEATPUfFOI24NfFIRxhZIQAkzo4emONtHYj/Js3x+XKZI/lz6PneHXqEw==
X-Received: by 2002:a05:6000:1105:: with SMTP id
 z5mr2335387wrw.208.1588935184480; 
 Fri, 08 May 2020 03:53:04 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id n9sm2266479wrv.43.2020.05.08.03.53.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 03:53:03 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: decode the ctxid for SMC to host IH
To: Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20200508100253.12839-1-evan.quan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4d132c20-5c5e-946b-91bd-1d7739ed884f@gmail.com>
Date: Fri, 8 May 2020 12:53:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200508100253.12839-1-evan.quan@amd.com>
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
Cc: alexander.deucher@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 08.05.20 um 12:02 schrieb Evan Quan:
> Driver needs that to tell the different events raised from SMC.

NAK, the ctxid is filled in by the SMC and not by the IH. We only decode 
fields here which are filled in by the IH.

Just use src_data[0] when you need some SMC specific bits.

Christian.

>
> Change-Id: I0e44e22527182fbb45a2db4fc3b1cd73fb17ba33
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h | 1 +
>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c  | 1 +
>   drivers/gpu/drm/amd/amdgpu/vega10_ih.c  | 1 +
>   3 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
> index 7b1762b1c595..965875b8bf93 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
> @@ -55,6 +55,7 @@ struct amdgpu_iv_entry {
>   	unsigned timestamp_src;
>   	unsigned pasid;
>   	unsigned pasid_src;
> +	unsigned ctxid; /* for SMC to Host interrupt */
>   	unsigned src_data[AMDGPU_IRQ_SRC_DATA_MAX_SIZE_DW];
>   	const uint32_t *iv_entry;
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> index f97857ed3c7e..932dc3eabbe2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> @@ -470,6 +470,7 @@ static void navi10_ih_decode_iv(struct amdgpu_device *adev,
>   	entry->timestamp_src = dw[2] >> 31;
>   	entry->pasid = dw[3] & 0xffff;
>   	entry->pasid_src = dw[3] >> 31;
> +	entry->ctxid = dw[4];
>   	entry->src_data[0] = dw[4];
>   	entry->src_data[1] = dw[5];
>   	entry->src_data[2] = dw[6];
> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> index 407c6093c2ec..e46d1f9f62ca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> @@ -460,6 +460,7 @@ static void vega10_ih_decode_iv(struct amdgpu_device *adev,
>   	entry->timestamp_src = dw[2] >> 31;
>   	entry->pasid = dw[3] & 0xffff;
>   	entry->pasid_src = dw[3] >> 31;
> +	entry->ctxid = dw[4];
>   	entry->src_data[0] = dw[4];
>   	entry->src_data[1] = dw[5];
>   	entry->src_data[2] = dw[6];

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
