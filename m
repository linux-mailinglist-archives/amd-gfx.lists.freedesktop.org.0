Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMUvDxPRs2ncbAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 09:55:47 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FEF28002A
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Mar 2026 09:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5073E10EB43;
	Fri, 13 Mar 2026 08:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FTe2ydBk";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2B710EA34
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Mar 2026 15:08:34 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5a12c310e8aso1188841e87.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Mar 2026 08:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773328113; x=1773932913; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g73dHOMHtG4L3LkXal4Y77T3TPFEUJ1oLGYicL2Ezq4=;
 b=FTe2ydBkJSt/JXYH4Xo6vMekZ9XyRbQXH+IG4sIvn0kjZDNuV6hXDrRWf1aZ7fCZy2
 QGHfM/t/1P0EL+L8OATD6q7Ej2BprxRBqYFP09xH0zWw09061bppeM8LLeMBNsuwg6de
 YXWNEOYFwh+8DIPMi5zX7jwos1wnVcYXaJ7wVKlUU5h1o8xal3WlE7hsZMuvJ0lSGtMs
 WYOfScBCjAt49GXKpTMMAX5ZBJkBtx6bg2pgTBP+w9XjnvtjxRymzN6S66AW05Kt+Vcn
 HvUugNzE4r6bAJFjJOjNSlCp1kDKb+/GOjsy58gBR2+0h3N5xpvaO1Fgu8okKzq3mMP+
 Mwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773328113; x=1773932913;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g73dHOMHtG4L3LkXal4Y77T3TPFEUJ1oLGYicL2Ezq4=;
 b=nKCtZlk2G1PDdWnf3/2xQayuhvS293yte5ZeN3nnrKHMAhJ0KG1dfI3CDEWppJY6ak
 Uk2MDutkWvvHRv+7kqeig800QbGGZPHVB73qAuBwBg1K8gOaM+hyr16ytExBYXfvBTkW
 IEXKgBK8QYnOJKxpv0GNapXug5Kl86TYvy6iK+jaZ35ZIyf7GP9829ZQlkUS4Yvl9CC2
 QoTgxvd5EVhpixZAZTNYxx2Xez2Zb8HNp/oaWjW2KcI62nOtZ8llEBcFby1r9GqimLaZ
 Wf0tbYwORsh1GFNtQ7t2eaGkvO8y2nTVrMgkHLeRFyOiUGcefQHBmYsce7h+p0tfcdlX
 ykaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH7fAGoZett12mUlMSQXf3jIl6YBUjeV35qAq9/pAX/h7s4J8P9wGp3oCp+mVegcojs/h+e4bX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNouFF77ayP/ArD5kmnVFWU8JOsUP2ARk8dU6yIyjPe6aHMlit
 JPRFMQcqdCpU+rM4YFaPO5oiQ7/NGPNspaQndlgOFttbU7P8WML0+TzOE+ewa5FfQwc=
X-Gm-Gg: ATEYQzzEl44lWZ7vhPx0fGk49cV0iM9eeqPLMo3inOf3ys4LXHe2tN1+ySLGIyoZQ9N
 bm9j+/kxJWRnaXftHs+4Di4v/ZQ24nUjCzhVXIn2I2zGeEURF5bb+rD9cvwi8ZKY/K1oAu5EFqz
 qEqgnJt4141YvzWEe1G/RgdtKR27i/fms1qzuHPgTnFUN7mkvXMEGAYBgMca8rM+L27k0efr1dM
 Diu4weLRTz7ICu9vwodxdWdjIkxhaZW9BMeCa5g0TjNq5Z9yb630EWdW9nijxYrAk9qbsDTX4pd
 rgLq5o5De5DUVH2/0JHD/RqTD75LzDB+83J6VkSUvW/EJtoR0f7uAFykRHaFj5/rhXSDu8DSguT
 A1Zc6yMp22HMEPXwUXfj2hn7zoLSRWRtTaNq5G1ppIg0q5XnBsYEmdMhMEhMKQ3uHTH3ZXh4Yyr
 eLInsMRFp8+mtyOiOB90PScZ2hUjEz
X-Received: by 2002:a05:6512:2242:b0:5a1:3da4:e92f with SMTP id
 2adb3069b0e04-5a156ddc9f3mr2520677e87.43.1773328112722; 
 Thu, 12 Mar 2026 08:08:32 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a15636227asm1013714e87.68.2026.03.12.08.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 08:08:32 -0700 (PDT)
Date: Thu, 12 Mar 2026 18:08:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/amdgpu: Make amdgpu_dma_buf_attach() return paths
 consistent
Message-ID: <abLW7eM5VVLDNtu6@stanley.mountain>
References: <20260312134415.1839742-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312134415.1839742-1-srinivasan.shanmugam@amd.com>
X-Mailman-Approved-At: Fri, 13 Mar 2026 08:55:39 +0000
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srinivasan.shanmugam@amd.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:dkim]
X-Rspamd-Queue-Id: D9FEF28002A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 07:14:15PM +0530, Srinivasan Shanmugam wrote:
> amdgpu_dma_buf_attach() locks bo->tbo.base.resv before updating the BO
> sharing state and unlocks it before returning.
> 
> Return the local status variable after the unlock so the function has a
> single consistent success return path, which avoids the Smatch warning
> about inconsistent reservation lock handling.
> 
> Fixes the below:
> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:111 amdgpu_dma_buf_attach() warn: inconsistent returns 'bo->tbo.base.resv'.
> 

This seems like a false positive to me and I don't like this solution
very much really... :/

I don't get this warning on my system on linux-next.  I have tested the
released version with and without the database...  :/

regards,
dan carpenter

