Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHhRNmEOuWk/ngEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Mar 2026 09:18:41 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D502A572F
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Mar 2026 09:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F3710E589;
	Tue, 17 Mar 2026 08:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="DlEq/05P";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0A110E3A5
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Mar 2026 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=rAMD9NUGsDWfV3M+fYKX8kA7EoKc4rzM4qI+LQYHKL4=; b=DlEq/05P/MoO3YG7
 6F/+K1V4UqSserW+sWWD49MqTqocDUfHnMbG6rBpnx4ch2uq+wOckl9nJO18I5Io1jOxmdeQl1RRa
 F3L79kfP7Wyd+7oSZoqNjSoTMbNG5bnuElpD+9KQ1LluqATMHRErl9XdKkld67B6Kj8u1SVZgf2Ml
 j0nUVO12AyzbCPFzC6vKFp9dorFMesmHi7+Mw9UeOCoH+D7iX+7vqV2W0JLCIzIQ9/i0ArPmHejcf
 jKDCKvDGtX5xDzd9RRVZK3Zow4MEY5+l1bwFmXJ1l2UH0xTIZkUTd3U8/GP1+nDOOmdgH2EObzeul
 Z6sF/iAmIsABrm4gNg==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
 (envelope-from <dg@treblig.org>) id 1w28m1-00000000gnP-2kGt;
 Mon, 16 Mar 2026 14:18:25 +0000
Date: Mon, 16 Mar 2026 14:18:25 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
Subject: Re: oops/null pointer in 0010:dma_fence_is_signaled+0x12/0x60 [amdgpu]
Message-ID: <abgRMTeW0UQDZkM5@gallifrey>
References: <abdVX_LJiNvkm4tW@gallifrey>
 <41627fc7-a0d8-44bf-982d-334f548d9f88@amd.com>
 <abf48cuwzRBczbeA@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <abf48cuwzRBczbeA@gallifrey>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.74+deb13+1-amd64 (x86_64)
X-Uptime: 14:18:02 up 3 days, 15:31, 2 users, load average: 0.05, 0.05, 0.01
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Mailman-Approved-At: Tue, 17 Mar 2026 08:18:20 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	FROM_NAME_HAS_TITLE(1.00)[dr];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[treblig.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[treblig.org:s=bytemarkmx];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dave@treblig.org,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[treblig.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave@treblig.org,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 44D502A572F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Raised as:
https://gitlab.freedesktop.org/drm/amd/-/issues/5081

Thanks,

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
