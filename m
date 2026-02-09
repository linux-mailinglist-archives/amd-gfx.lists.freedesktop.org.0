Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPQcGdUBimluFQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Feb 2026 16:48:37 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4363112261
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Feb 2026 16:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA7A10E422;
	Mon,  9 Feb 2026 15:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="G4uRwDdX";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBF610E422
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Feb 2026 15:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P/zBpDH6fvKZD2z3Gh2l+UmTWQzCbItY4EkrK3IIzvU=; b=G4uRwDdXHGPkSwhoAwJRjERz5V
 3O2t9q5N7OKVPvNWtyiLxMF2jbx7sm5nMx6vT1ikJynjydJsL3s7PSKCc5FNMRCyL0D9n1bTgCtSv
 3ZNW9/SIzZ/PPUSOOjJi1+N5ImEJ3t19EKNhH3rDKG9ymG6T041ac+MBedR8GgPXHrlTq2UwJz++8
 O2tLfNd4X15Q6pRcuLwCCByMUqo3JbPO6fnu0mUOI2XFP4jtW5Yc/Yb3CforWSuKB20mkOf+DpFuE
 m+aVPg34fkeX1EJqITx5ZsJuV9j5wz1x2dF0/AYKZhzZiUtwXsE5NFgcJDYPa7Ax3FnXftHr/VPsI
 5p9gHAZg==;
Received: from d198-53-218-11.abhsia.telus.net ([198.53.218.11] helo=atmagalia)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vpTV1-00G2ky-29; Mon, 09 Feb 2026 16:48:31 +0100
Date: Mon, 9 Feb 2026 08:48:25 -0700
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Hung <alex.hung@amd.com>, 
 "ChiaHsuan Chung (Tom)" <ChiaHsuan.Chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com, 
 Mario Limonciello <mario.limonciello@amda.com>,
 Ivan Lipski <ivan.lipski@amd.com>, harry.wentland@amd.com, 
 Leo Li <sunpeng.li@amd.com>,
 Timur =?utf-8?Q?Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: Re: [PATCH 0/5] drm/amd/display: Clean up some DCE 6 code
Message-ID: <aYoA2Z4svnQ-Md_x@atmagalia>
References: <20260118173150.19790-1-timur.kristof@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118173150.19790-1-timur.kristof@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex.hung@amd.com,m:ChiaHsuan.Chung@amd.com,m:daniel.wheeler@amd.com,m:Alexander.Deucher@amd.com,m:mario.limonciello@amda.com,m:ivan.lipski@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:timur.kristof@gmail.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[siqueira@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[siqueira@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,amda.com,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E4363112261
X-Rspamd-Action: no action

On 01/18, Timur Kristóf wrote:
> Reduce code duplication and ease maintenance burden for old
> DCE versions. Clean up some code that was duplicated between
> DCE 6 and the rest of DCE.
> 
> Timur Kristóf (5):
>   drm/amd/display: Use dce_audio_create for DCE 6
>   drm/amd/display: Delete unused dce_clk_mgr.c
>   drm/amd/display: Remove unused dce60_clk_mgr register definitions
>   drm/amd/display: Handle DCE 6 in dce_clk_mgr.c
>   drm/amd/display: Handle DCE 6 in dce110_register_irq_handlers
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 165 +--
>  .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |  12 +-
>  .../display/dc/clk_mgr/dce100/dce_clk_mgr.c   |  64 +-
>  .../display/dc/clk_mgr/dce60/dce60_clk_mgr.c  | 166 ---
>  .../display/dc/clk_mgr/dce60/dce60_clk_mgr.h  |  36 -
>  .../gpu/drm/amd/display/dc/dce/dce_audio.c    | 131 ---
>  .../gpu/drm/amd/display/dc/dce/dce_audio.h    |   9 -
>  .../gpu/drm/amd/display/dc/dce/dce_clk_mgr.c  | 967 ------------------
>  .../amd/display/dc/inc/hw/clk_mgr_internal.h  |  11 -
>  .../dc/resource/dce60/dce60_resource.c        |   2 +-
>  10 files changed, 88 insertions(+), 1475 deletions(-)
>  delete mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dce60/dce60_clk_mgr.c
>  delete mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dce60/dce60_clk_mgr.h
>  delete mode 100644 drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
> 
> -- 
> 2.52.0
> 

I Alex, Dan, Tom,

Could you also include this series in this weekly promotion? Overall, it
looks good, but I believe the last patch needs thorough testing via
promotion since it can affect multiple GPUs.

Thanks

-- 
Rodrigo Siqueira
