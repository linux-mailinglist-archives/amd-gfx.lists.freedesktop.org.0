Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I6h/F1ELR2pcSgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 03:07:29 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61D46FDACA
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 03:07:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BW45mtE4;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3BF10F48B;
	Fri,  3 Jul 2026 01:07:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B54910E545;
 Fri,  3 Jul 2026 01:07:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 23D534359C;
 Fri,  3 Jul 2026 01:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3791F000E9;
 Fri,  3 Jul 2026 01:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783040845;
 bh=xxk4IRdkdS80Y7ozvEETiJ30SiAsseLRUpsNlm+4sOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=BW45mtE4H5s0tpJqRXcyn5jti6mOh3VdEy1DFWMHoNWR63ueooW7yTWytN1dGndU3
 kj8Sbn2QJFBva87+DL+kUGCfJDO6IdG8HdJDFG0slK0rDhq32B9n5r7LnpVi/dDlRG
 2WIGwHPa4V+udlDj8GZ+88tWi6+4fR3VXZpnNeHOfnfR+QURBy6RNcaWSQ8RwBuO30
 UgyaElCenY1qVny99hWD2Gwhtlj5gv+Wsm2hJhIq3JRybonx6svogQ8lyJsjfDRIv+
 4I3DjP/4KHYMxmXg4L87U/vTJt6JuXbGjDPX/olGUVyo8MJeUk6S0rRPbKRPQGYIiv
 o701+E6kAtK6w==
Date: Thu, 2 Jul 2026 18:07:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alex Hung <alex.hung@amd.com>
Subject: Re: [PATCH v2] drm/amd/display: Shorten
 hdmi_frl_status_polling_workqueue
Message-ID: <20260703010720.GA2950778@ax162>
References: <20260618-amdgpu-fix-wq_name_len-warning-v2-1-ef0e2e6f5be7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-amdgpu-fix-wq_name_len-warning-v2-1-ef0e2e6f5be7@kernel.org>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,amd.com:email,ax162:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D61D46FDACA

Ping? This is an obvious fix. Is this being ignored because of the
Sashiko comments?

On Thu, Jun 18, 2026 at 09:52:14AM -0700, Nathan Chancellor wrote:
> There is a warning when creating the hdmi_frl_status_polling_wq
> workqueue because "hdmi_frl_status_polling_workqueue" excceds
> WQ_NAME_LEN:
> 
>   workqueue: name exceeds WQ_NAME_LEN. Truncating to: hdmi_frl_status_polling_workque
> 
> Shorten the workqueue name to "hdmi_frl_status_polling_wq" like the
> structure member to avoid the warning.
> 
> Fixes: 5c9b8b27a883 ("drm/amd/display: Tie FRL support into amdgpu_dm")
> Reviewed-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Rebase to solve conflicts with 0e967e086e75 ("drm/amd/display: Extract
>   connector and encoder code to amdgpu_dm_connector").
> - Pick up Alex's Reviewed-by.
> - Link to v1: https://patch.msgid.link/20260604-amdgpu-fix-wq_name_len-warning-v1-1-eb5415b45b27@kernel.org
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2e74ff94dcac..881626f0f258 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -834,9 +834,9 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>  	}
>  	if (adev->dm.dc->caps.max_links > 0) {
>  		adev->dm.hdmi_frl_status_polling_wq =
> -			create_singlethread_workqueue("hdmi_frl_status_polling_workqueue");
> +			create_singlethread_workqueue("hdmi_frl_status_polling_wq");
>  		if (!adev->dm.hdmi_frl_status_polling_wq)
> -			drm_err(adev_to_drm(adev), "failed to initialize hdmi_frl_status_polling_workqueue\n");
> +			drm_err(adev_to_drm(adev), "failed to initialize hdmi_frl_status_polling_wq\n");
>  	}
>  	if (dc_is_dmub_outbox_supported(adev->dm.dc)) {
>  		init_completion(&adev->dm.dmub_aux_transfer_done);
> 
> ---
> base-commit: 991fd2cb908bf5d35a496760519442d6e9f8763d
> change-id: 20260604-amdgpu-fix-wq_name_len-warning-63c8012e0c2b
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 

-- 
Cheers,
Nathan
