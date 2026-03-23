Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIBUMwM0wWm7RQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Mar 2026 13:37:23 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E19C2F2027
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Mar 2026 13:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F3F10E23D;
	Mon, 23 Mar 2026 12:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="04wGH4mC";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EE310E4D0;
 Mon, 23 Mar 2026 10:32:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AFC9B43FA5;
 Mon, 23 Mar 2026 10:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155C6C4CEF7;
 Mon, 23 Mar 2026 10:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1774261976;
 bh=nu9KpscKUDBHHpMe1GSngED3iiYBegN779XB3oiDq/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=04wGH4mC1KfLOSBXHPTRJfNUuxnMmyK+Lsx5lpOWNqMYwWDLirA8niGIkoAcmghVA
 jyiXRHixl+6ydXRyru9sEQgDb3javn5DMXGxej+/A5KEl6Ghpvpk5JMDhhfo10luEX
 KFngbqFlqN/0lTu76BpXagjLE/N7QY7WCsuJpGDI=
Date: Mon, 23 Mar 2026 11:32:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Li hongliang <1468888505@139.com>, srinivasan.shanmugam@amd.com,
 patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, sashal@kernel.org, guchun.chen@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6.1.y] drm/amdgpu: Fix potential out-of-bounds access in
 'amdgpu_discovery_reg_base_init()'
Message-ID: <2026032346-ruse-dork-baf3@gregkh>
References: <20260323071052.4068410-1-1468888505@139.com>
 <f2d125ce-8cb9-4ae8-8f55-0b5a78e66f83@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2d125ce-8cb9-4ae8-8f55-0b5a78e66f83@amd.com>
X-Mailman-Approved-At: Mon, 23 Mar 2026 12:37:19 +0000
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
X-Spamd-Result: default: False [3.19 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[139.com,amd.com,lists.linux.dev,vger.kernel.org,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 7E19C2F2027
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 10:51:18AM +0100, Christian König wrote:
> Hi Li,
> 
> On 3/23/26 08:10, Li hongliang wrote:
> > From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> > 
> > [ Upstream commit cdb637d339572398821204a1142d8d615668f1e9 ]
> > 
> > The issue arises when the array 'adev->vcn.vcn_config' is accessed
> > before checking if the index 'adev->vcn.num_vcn_inst' is within the
> > bounds of the array.
> > 
> > The fix involves moving the bounds check before the array access. This
> > ensures that 'adev->vcn.num_vcn_inst' is within the bounds of the array
> > before it is used as an index.
> > 
> > Fixes the below:
> > drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1289 amdgpu_discovery_reg_base_init() error: testing array offset 'adev->vcn.num_vcn_inst' after use.
> 
> well this patch only fixed a compiler warning and has not much practical value otherwise.
> 
> Why are you sending this for inclusion into the 6.1 kernel?

Perhaps because it was assigned to CVE-2024-27042?  If this is ONLY a
compiler warning fix, and NOT an actual vulnerability fix, please let
cve@kernel.org know about that and they will revoke this CVE.

thanks,

greg k-h
