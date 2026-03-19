Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJdUFArvu2liqQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Mar 2026 13:41:46 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5992CB48E
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Mar 2026 13:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C616C10E9FB;
	Thu, 19 Mar 2026 12:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ouzsMYWN";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DAE10E13F;
 Thu, 19 Mar 2026 09:52:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3B41343504;
 Thu, 19 Mar 2026 09:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881C6C19424;
 Thu, 19 Mar 2026 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1773913946;
 bh=4Qfd1Q5XgYM+CK2s6vx5dou3qkEQsI9rw6/NNHD2vuo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ouzsMYWNJ9HrAyMGy0NtOANi0HtgPVd8y230ib3UhKeQEcjjhd1Sp4Q2g9FpDQ7j5
 aROYaYqM9ZkZOxSbg4qjEA4/6Gmy6J4vVOkrRdK0ZTv/AbCT3+qmtQw9kSudoSf0Ur
 KYOeef4Ga3GNYVsJ3/uZG93r5L1Bv3CTZsrYNlFU=
Date: Thu, 19 Mar 2026 10:52:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: stable@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 Alex Hung <alex.hung@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 "chr[]" <chris@rudorff.com>, Sasha Levin <sashal@kernel.org>,
 Wentao Liang <vulab@iscas.ac.cn>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH for 6.12 and 6.6 1/2] drm/amd/display: Add pixel_clock to
 amd_pp_display_configuration
Message-ID: <2026031910-improving-approval-9457@gregkh>
References: <20260225215804.11398-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225215804.11398-1-rosenp@gmail.com>
X-Mailman-Approved-At: Thu, 19 Mar 2026 12:41:39 +0000
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
X-Spamd-Result: default: False [4.69 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.959];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com,ffwll.ch,rudorff.com,kernel.org,iscas.ac.cn,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 0A5992CB48E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Feb 25, 2026 at 01:58:03PM -0800, Rosen Penev wrote:
> From: Timur Kristóf <timur.kristof@gmail.com>
> 
> commit b515dcb0dc4e85d8254f5459cfb32fce88dacbfb upstream.
> 
> This commit adds the pixel_clock field to the display config
> struct so that power management (DPM) can use it.
> 
> We currently don't have a proper bandwidth calculation on old
> GPUs with DCE 6-10 because dce_calcs only supports DCE 11+.
> So the power management (DPM) on these GPUs may need to make
> ad-hoc decisions for display based on the pixel clock.
> 
> Also rename sym_clock to pixel_clock in dm_pp_single_disp_config
> to avoid confusion with other code where the sym_clock refers to
> the DisplayPort symbol clock.
> 
> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c       | 1 +
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/dm_services_types.h             | 2 +-
>  drivers/gpu/drm/amd/include/dm_pp_interface.h                  | 1 +
>  4 files changed, 4 insertions(+), 2 deletions(-)

You did not sign-off on these backports :(

