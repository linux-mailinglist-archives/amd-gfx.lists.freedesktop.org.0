Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WGrNLDaTS2oyVwEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Jul 2026 13:36:22 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C0870FEC2
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Jul 2026 13:36:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BujReDTG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDE210E353;
	Mon,  6 Jul 2026 11:36:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B62210E353
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jul 2026 11:36:19 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-92e533aacf2so129124285a.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 Jul 2026 04:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783337778; x=1783942578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=eI2RFBADatE519dR/g8Z358f1+0B3inK+oU4BAAsg9w=;
 b=BujReDTGEJTFP6aAuKic2+aRZMrBPx/BlZZVCseK78l97U/pgKGZi/bsKIkP/J+iGF
 hPJhVqcwzRJrEbishF3JlSKJeKQBm1Q4tELM6ziCQkxEsVpmY8TTcoWFoKwG+GCjjH/g
 0V/sW5EGw+w8GDoQV98KZbhIXRLZfW+6qRaxzjmm2xvS+l+OscynL5jQOeofrpxlUcCa
 j6NkXkawmjVmOrQQ6Qhg07wKkzIuNWrsczr4y2fHRbrPimvI2v/kgwzIYXnX5EfXDQSU
 sKn761hARe1nrDJhRiSphIeSGL8Zvxgq0C/2rfsW+jxVvB6HJHB4p3XezyIfXYAQpzQ5
 rIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783337778; x=1783942578;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eI2RFBADatE519dR/g8Z358f1+0B3inK+oU4BAAsg9w=;
 b=CKNs69zmxrqBcfYtGP/3vegvtIU3fWXlnlan6VCONqzkkanx7ZD8BZgUZYc4Kb+eNl
 S+uqHqfhfzWZ7xLOi4ttyRZPbJTpNbqNu6WTmerF14FWEZJEwyJvB69JLnWrkU+0aWsI
 UcrVoiicmq5SgUS6k3LOlRCW6VbgwsiBckl1PAdfygI1uEePAgcm76XvmEUisPzAQuzH
 bKUbqmj/DpSubo2EHXtRzGgaUieWPy5RcE8d1J/Nxy1p5yOlNQjpTBCZ58MfG/fmYk0Q
 W/wF47NIN3/4jhJOv/nFq/gRybyBtCOeV0Z+gPpJKUNhLJSYbkOlAoMc3Q+stAF3n7He
 uNJw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrUrFMeV70VKECMHljIJG7TvLD+vEyRUCeXXNC4rMbt52byjvNYKNCSgLBmjUF5GX8cs3D9vFUr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyemWcD4mVkfDUCHZT+zqKIX0HeEY3vaw9PeWOFQw66YnPEhOEk
 Oa3q9V+MiFULjMfnMqkZ+xmbjLzlDM0yxyEvoFXfnjoGtq/ymEp+rVrY
X-Gm-Gg: AfdE7clqLnXh5qySBPwtf3V8kYJgqL18ikVc5xViPh8UKTWnW/uzc09JowoIkWmfCnO
 RE8L1HlxhvR4zdWllfTfZQsPs41PaSfJTYjD+pvJyJwY/aX2Cnl0bjne16YWTXndExiCY9C79iU
 3SWEzLWTRNYiU/dRWq+3fPszW4N20QenSVA7/QlUltLWygq/o/+KoF1B1AYlvgt9RwRla/OV6ff
 tWS4iGRLG8mMv6syYogYhfrYERFSUkmW6y94pI0mWTMooKcUJkc+iUaZpGmxVTACWiBJ51/NnhS
 0pmmkAfSuPIChOsHudil3ik3FjgnaB1QQndfqrCl8loG6s7tOMSe2nj/xRzqiqpw3cWXsnKNvOx
 u1NTceQs+WV3jOCKxduh8RLkRUuyCXLRAC5L25huSWjHZkOMFTPq+Po3+bhNarkLlieA+Dd5ExU
 6DjRkWxoOR8pbycnkI5mQsySABLh1flq28raZ0WyKKZnDW
X-Received: by 2002:a05:620a:4486:b0:928:f440:2dc7 with SMTP id
 af79cd13be357-92ebb5dec59mr16408385a.35.1783337777641; 
 Mon, 06 Jul 2026 04:36:17 -0700 (PDT)
Received: from [10.254.122.221] (mkmvpn.amd.com. [165.204.54.211])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-92e90cfe34dsm947412485a.46.2026.07.06.04.36.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2026 04:36:17 -0700 (PDT)
Message-ID: <48d65314-02fd-401e-b2a6-1b09c6f8da5f@gmail.com>
Date: Mon, 6 Jul 2026 13:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: read FB through BAR0 when aperture is
 unavailable
To: chong li <chongli2@amd.com>, amd-gfx@lists.freedesktop.org
Cc: HaiJun.Chang@amd.com, Emily.Deng@amd.com, Cursor <cursoragent@cursor.com>
References: <20260701055355.20478-1-chongli2@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20260701055355.20478-1-chongli2@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chongli2@amd.com,m:HaiJun.Chang@amd.com,m:Emily.Deng@amd.com,m:cursoragent@cursor.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2C0870FEC2

On 7/1/26 07:53, chong li wrote:
> Allow early VRAM reads to fall back to a temporary BAR0 mapping
> when the normal aperture mapping has not been established yet.

Clear NAK.

You are just trying to fix a symptom of incorrect initialization order here.

Regards,
Christian.

> 
> Signed-off-by: chong li <chongli2@amd.com>
> Co-authored-by: Cursor <cursoragent@cursor.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 43 +++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 5442a1fc1c37..610d82b79de3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -743,6 +743,44 @@ void amdgpu_device_mm_access(struct amdgpu_device *adev, loff_t pos,
>  	drm_dev_exit(idx);
>  }
>  
> +static int amdgpu_device_read_fb_via_bar0(struct amdgpu_device *adev,
> +					  u64 offset, void *buf, size_t size)
> +{
> +	resource_size_t bar_start, bar_size, map_base;
> +	void __iomem *vram;
> +	size_t map_offset, map_size;
> +	unsigned long flags;
> +	u64 end;
> +
> +	if (!buf || !size)
> +		return -EINVAL;
> +
> +	flags = pci_resource_flags(adev->pdev, 0);
> +	if ((flags & IORESOURCE_UNSET) || !(flags & IORESOURCE_MEM))
> +		return -EINVAL;
> +
> +	bar_size = pci_resource_len(adev->pdev, 0);
> +	if (!bar_size)
> +		return -ENODEV;
> +
> +	if (check_add_overflow(offset, size, &end) || end > bar_size)
> +		return -EINVAL;
> +
> +	bar_start = pci_resource_start(adev->pdev, 0);
> +	map_offset = offset_in_page(offset);
> +	map_base = bar_start + (offset & PAGE_MASK);
> +	map_size = PAGE_ALIGN(map_offset + size);
> +
> +	vram = ioremap_wc(map_base, map_size);
> +	if (!vram)
> +		return -ENOMEM;
> +
> +	memcpy_fromio(buf, (u8 __iomem *)vram + map_offset, size);
> +	iounmap(vram);
> +
> +	return 0;
> +}
> +
>  /**
>   * amdgpu_device_aper_access - access vram by vram aperture
>   *
> @@ -762,8 +800,11 @@ size_t amdgpu_device_aper_access(struct amdgpu_device *adev, loff_t pos,
>  	size_t count = 0;
>  	uint64_t last;
>  
> -	if (!adev->mman.aper_base_kaddr)
> +	if (!adev->mman.aper_base_kaddr) {
> +		if (!write && !amdgpu_device_read_fb_via_bar0(adev, pos, buf, size))
> +			return size;
>  		return 0;
> +	}
>  
>  	last = min(pos + size, adev->gmc.visible_vram_size);
>  	if (last > pos) {

