Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dvDnAVWTOmo0AggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 16:08:21 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC246B7BE4
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 16:08:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dhXI4Jk0;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DB510E73C;
	Tue, 23 Jun 2026 14:08:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DED910E73C
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 14:08:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2628643667;
 Tue, 23 Jun 2026 14:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFA01F00A3A;
 Tue, 23 Jun 2026 14:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782223697;
 bh=8ssEs1fZzIbQ5y84qIP7mgPuP3e9LyAYeFOzE9KW3vI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=dhXI4Jk0zBsQe5iIIl0h/3BqeQU4u0rltZdT1iMd/Jmm92+8VV3c+YbbR1rhcX6Hg
 SEbFkEstrgaogvY08GdlGZGbxYR/EZn/5TKFY/PTI8bKQAZK3oGSPAGyQDX3h86la4
 0co/PhdJw7NRrtTIWTOgpOizLgdgNGMroOy6rLrJm/ILXzeZPScf5My7eZtaPafj+A
 Ew6TdO4Of73TqwBpw+XpOyTMzmdU2i0gFDDSub8f+/IHl0bHpLM2aoF6wdcnkCdZGd
 mgEp2oEB0UTub5ekcPV1zCg+blWSI3NqMr3oRjcN5OLhgMHM/4PFf0HYWSDZTo5vXe
 4lTqrKHxpy/vg==
Message-ID: <35aa34d8-193f-4011-becf-3de7a3dcbdb2@kernel.org>
Date: Tue, 23 Jun 2026 07:08:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: use kvzalloc to allocate struct dc
To: Honglei Huang <honghuan@amd.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, Christian.Koenig@amd.com,
 amd-gfx@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com, Ray.Huang@amd.com
References: <20260623065635.2525331-1-honghuan@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260623065635.2525331-1-honghuan@amd.com>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:honghuan@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:Christian.Koenig@amd.com,m:Alexander.Deucher@amd.com,m:Ray.Huang@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[superm1@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BC246B7BE4



On 6/22/26 23:56, Honglei Huang wrote:
> struct dc has grown large over time (most of it the two inlined
> dc_scratch_space copies) and now sits close to the page allocator's 4 MiB
> contiguous allocation limit. Its actual size is not fixed by the source
> alone, it also depends on the compiler and the .configk, so it can
> easily cross 4 MiB, e.g. with a newer GCC or a config change, and once it
> does dc_create() fails.
> 
> dc_create() allocates it with kzalloc(). Once struct dc exceeds 4 MiB the
> request is rounded up to order 11 (8 MiB), which is above MAX_PAGE_ORDER,
> so the page allocator warns and returns NULL. dc_create() then fails, DM
> init fails and amdgpu probe aborts with -EINVAL:
> 
>    WARNING: mm/page_alloc.c:5197 at __alloc_frozen_pages_noprof+0x2f9/0x380
>    RSI: ...000b   RBP: ...000b      <- order = 11 (8 MiB)
>     __kmalloc_large_noprof+0x1e/0xc0
>     dc_create+0x38/0x660 [amdgpu]
>     amdgpu_dm_init+0x2d9/0x510 [amdgpu]
>     dm_hw_init+0x1b/0x90 [amdgpu]
>    amdgpu 0000:03:00.0: hw_init of IP block <dm> failed -22
>    amdgpu 0000:03:00.0: probe with driver amdgpu failed with error -22
> 
> struct dc is software only state, never DMAed and only kept as an opaque
> pointer, so it needs no physically contiguous memory. Use kvzalloc()/
> kvfree() so it falls back to vmalloc(), removing the dependency on
> MAX_PAGE_ORDER. The underlying bloat of struct dc should be addressed
> separately.
> 

Cc: stable@vger.kernel.org
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/5406

> Signed-off-by: Honglei Huang <honghuan@amd.com>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index b3530fbf32f..65bd927435e 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -1507,7 +1507,7 @@ static void disable_vbios_mode_if_required(
>   
>   struct dc *dc_create(const struct dc_init_data *init_params)
>   {
> -	struct dc *dc = kzalloc_obj(*dc);
> +	struct dc *dc = kvzalloc_obj(*dc);
>   	unsigned int full_pipe_count;
>   
>   	if (!dc)
> @@ -1555,7 +1555,7 @@ struct dc *dc_create(const struct dc_init_data *init_params)
>   
>   destruct_dc:
>   	dc_destruct(dc);
> -	kfree(dc);
> +	kvfree(dc);
>   	return NULL;
>   }
>   
> @@ -1604,7 +1604,7 @@ void dc_deinit_callbacks(struct dc *dc)
>   void dc_destroy(struct dc **dc)
>   {
>   	dc_destruct(*dc);
> -	kfree(*dc);
> +	kvfree(*dc);
>   	*dc = NULL;
>   }
>   

