Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD/2N8Wh2GlXgQgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Apr 2026 09:07:49 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3263D32BD
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Apr 2026 09:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7AD10E8DD;
	Fri, 10 Apr 2026 07:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nppct.ru header.i=@nppct.ru header.b="otQ+y9zR";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 451 seconds by postgrey-1.36 at gabe;
 Thu, 09 Apr 2026 18:16:49 UTC
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B898210E057
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Apr 2026 18:16:49 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 380F01C2529
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Apr 2026 21:09:14 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:content-language:subject:subject:references:to
 :user-agent:mime-version:date:date:message-id; s=dkim; t=
 1775758153; x=1776622154; bh=Z6VJas5O1TGJ28DeGbupUhtgkajrhZGcBwA
 fc4PV2gg=; b=otQ+y9zRzciI3m6FByq2z8/Rz7WeYnPoz6yAj7h1hTW8v+BhK6r
 k7YCfYPbFbS6RdtbRmfbNYDniFdz91JTcy0SG4TCIkFtc37HvABQWEQoe6Gy6baA
 XJbSoG7kFMc+c3wkhUaS1OZbnPIxQGhwY0Qx5eEhnOFTEVTI/RqWFGv8=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id AQJMt7NnFCI4 for <amd-gfx@lists.freedesktop.org>;
 Thu,  9 Apr 2026 21:09:13 +0300 (MSK)
Received: from [192.168.1.67] (unknown [95.221.18.101])
 by mail.nppct.ru (Postfix) with ESMTPSA id 88C341C060C;
 Thu,  9 Apr 2026 21:09:12 +0300 (MSK)
Message-ID: <bfcff656-9b76-482d-941c-ee0e8da6d05d@nppct.ru>
Date: Thu, 9 Apr 2026 21:09:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: benjamin.cheng@amd.com
Cc: David.Wu3@amd.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, leo.liu@amd.com,
 ruijing.dong@amd.com, lvc-project@linuxtesting.org
References: <20260326122918.3486416-4-benjamin.cheng@amd.com>
Subject: Re: [PATCH v2 2/4] drm/amdgpu/vcn3: Prevent OOB reads when parsing
 dec msg
Content-Language: ru
From: SDL <sdl@nppct.ru>
In-Reply-To: <20260326122918.3486416-4-benjamin.cheng@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 10 Apr 2026 07:07:32 +0000
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[nppct.ru:s=dkim];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nppct.ru:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sdl@nppct.ru,amd-gfx-bounces@lists.freedesktop.org];
	DMARC_NA(0.00)[nppct.ru];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:benjamin.cheng@amd.com,m:David.Wu3@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:leo.liu@amd.com,m:ruijing.dong@amd.com,m:lvc-project@linuxtesting.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sdl@nppct.ru,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nppct.ru:dkim,nppct.ru:mid]
X-Rspamd-Queue-Id: 0E3263D32BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Benjamin,

I'm working on a related fix for 'vcn_v3_0_dec_msg()' that you might
want to be aware of. In you update bounds check:

     if (size < 4 || offset + size > end - addr)

the 'offset' and 'size' fields in the VCN decode message buffer are
both u32 values sourced from userspace. The check performs 32-bit
arithmetic before comparison against the 64-bit 'end' value, allowing
a crafted message with offset=0xffffffff and size=1 to wrap around
to 0 and bypass the bounds check.

Fix this by cast 'offset' to u64 before the addition so the
comparison is done in 64-bit arithmetic.

Best regards,
Alexey Nepomnyashih

