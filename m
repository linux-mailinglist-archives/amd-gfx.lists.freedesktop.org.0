Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jE54FV6AxmnQLAUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 14:04:30 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DF0344B0D
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 14:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465A410E0BE;
	Fri, 27 Mar 2026 13:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BV3Rye0s";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F101C10E0BE;
 Fri, 27 Mar 2026 13:04:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 973A340716;
 Fri, 27 Mar 2026 13:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18093C19423;
 Fri, 27 Mar 2026 13:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774616666;
 bh=rGKwmiXyHfN5+L0HwaW5Cnl1fARnmwe/8Hv058mvEgc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BV3Rye0sYCmQmUfEhD7/wWYugEZIBkDLg4xEPQ0H0AwKhjnfFZjVWpx9/97U/Rp1l
 UmbYyTpTwLrVH2h6I+Wr1bDNir0jfF/mUPnihm+QuZ4Z9oTiL9sB6UgqaXgDnumP9I
 ve7iiNiF6Kfj0WEaR2gLXxUdWpPboUj8wp6upKPJhE0cWmEeFiXPBIdK95AIyaey5G
 Vlguwkdm30o+vXNkkoDt0KjrFUYjmoam3PwOwanVz8/3G1HQcPBwUAAkuDh2LhWvLJ
 fun10nNZRB6XrQ1EPxUQ0gQQEg438RBY4JWPpIFY8i7UIiekfIkPkdGXDPrU86YCDk
 6Tccau9Ty4Zpg==
Message-ID: <1208774a-f1ba-4785-a91e-ae141f97a64d@kernel.org>
Date: Fri, 27 Mar 2026 08:04:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: Move AMD VSDB parsing into DRM EDID core
To: Chenyu Chen <chen-yu.chen@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
References: <20260327082342.1286878-1-chen-yu.chen@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260327082342.1286878-1-chen-yu.chen@amd.com>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D3DF0344B0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/27/26 03:21, Chenyu Chen wrote:
> The AMD Vendor-Specific Data Block (VSDB) v3 parsing currently lives
> in amdgpu_dm, using raw byte-walking over EDID extension blocks. This
> series moves the parsing into the DRM EDID core so the data is
> available through drm_display_info for any driver.
> 
> Patch 1 adds the parser in drm_edid.c and the new drm_amd_vsdb_info
> struct in drm_connector.h.
> 
> Patch 2 updates amdgpu_dm to consume the parsed data from
> display_info instead of doing its own parsing, and factors out
> panel type determination into a dedicated function.
> 
> Chenyu Chen (2):
>    drm/edid: Parse AMD Vendor-Specific Data Block
>    drm/amd/display: Use drm_display_info for AMD VSDB data
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 120 ++++++++++--------
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  14 --
>   drivers/gpu/drm/drm_edid.c                    |  72 +++++++++++
>   include/drm/drm_connector.h                   |  38 ++++++
>   4 files changed, 178 insertions(+), 66 deletions(-)
> 

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
