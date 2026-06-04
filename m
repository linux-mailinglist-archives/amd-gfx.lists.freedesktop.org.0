Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i4biKT9KIWp2CgEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 11:49:51 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2516663EAA4
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 11:49:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=rYffpsq4;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E4910E5E2;
	Thu,  4 Jun 2026 09:49:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D737410E5DE;
 Thu,  4 Jun 2026 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vCL6XLGZbPYHzf24wiXSlcfpsWTswMCi57bgSjUSRoI=; b=rYffpsq4l6WVXkaoAtE8QC/tPy
 mgMzDBm8zOGq9jSbOpdypMaNbqm9IABImsNNMuSwhZivi1Tgbu4WuO6+pkPzum4QKUWlbt9DQChIc
 LYQtTItX6l66idKyxmYwQZCK0YA2jgslxD6WGAtDPCnDR0YHQ/GcCAabOQX2CGRwdp2NKOYRJKl5P
 s7H7mAyWp0ycEJ0s4x9d2gmxATrpZG4cH/WPLhSAvS7am4aTOwjDQMdZVKy6CGqE5rox8NTNEl7bj
 CWTFJOSPyJ5IJ+l/+RUbfnahhiiXuOAYetoutMUqBIVbcW+HXNOJPUALTdH9TqiT0tbINEqcWkhGW
 1bw/QwOA==;
Received: from [79.117.146.159] (helo=[192.168.1.135])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wV4ht-00CZqY-Qj; Thu, 04 Jun 2026 11:49:45 +0200
Message-ID: <cb66bacc-f8ff-4cc3-8663-c260fc34c744@igalia.com>
Date: Thu, 4 Jun 2026 11:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix mem_type change detection for async
 flips
To: Matthew Schwartz <matthew.schwartz@linux.dev>, Leo Li
 <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Tom Chung <chiahsuan.chung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20260604064424.3154796-1-matthew.schwartz@linux.dev>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260604064424.3154796-1-matthew.schwartz@linux.dev>
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2516663EAA4



On 04/06/2026 08:44, Matthew Schwartz wrote:
> [Why]
> amdgpu_dm_crtc_mem_type_changed() fetches the "old" and "new" plane state
> with two drm_atomic_get_plane_state() calls, which both return the new
> state. It compares a state against itself, so it never detects a mem_type
> change and never rejects the async flip.
>
> On DCN 3.0.1, this shows up as intermittent corruption when a single DCC
> plane is scanned out with immediate flips under gamescope and its buffer
> moves between the VRAM carveout and GTT.
>
> [How]
> Use drm_atomic_get_old_plane_state() and drm_atomic_get_new_plane_state()
> to compare the actual old and new states. These return NULL rather than
> an error pointer for a plane that is not part of the commit, so the
> IS_ERR() check becomes a NULL check that skips those planes, such as an
> unmodified cursor still in the CRTC's plane_mask.

Nice catch!

Reviewed-by: Melissa Wen <mwen@igalia.com>

>
> Fixes: 4caacd1671b7a ("drm/amd/display: Do not elevate mem_type change to full update")
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 6c1e7e13f0399..711640739179e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -12934,13 +12934,11 @@ static bool amdgpu_dm_crtc_mem_type_changed(struct drm_device *dev,
>   	struct drm_plane_state *new_plane_state, *old_plane_state;
>   
>   	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
> -		new_plane_state = drm_atomic_get_plane_state(state, plane);
> -		old_plane_state = drm_atomic_get_plane_state(state, plane);
> +		new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +		old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>   
> -		if (IS_ERR(new_plane_state) || IS_ERR(old_plane_state)) {
> -			drm_err(dev, "Failed to get plane state for plane %s\n", plane->name);
> -			return false;
> -		}
> +		if (!old_plane_state || !new_plane_state)
> +			continue;
>   
>   		if (old_plane_state->fb && new_plane_state->fb &&
>   		    get_mem_type(old_plane_state->fb) != get_mem_type(new_plane_state->fb))

