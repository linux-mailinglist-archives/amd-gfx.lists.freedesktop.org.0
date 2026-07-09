Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MNw6EvOcUGqw2QIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 09:19:15 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98A3737FCD
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 09:19:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=infradead.org header.s=bombadil.20210309 header.b=HDNHPzPk;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=infradead.org (policy=none);
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8439610F7CE;
	Fri, 10 Jul 2026 07:19:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC09D10F2EE;
 Thu,  9 Jul 2026 18:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=YnqarTgy0D0htDBKBMRAk90GEEctz896WdQ3FnbljDo=; b=HDNHPzPkoyRv41XVzG+0pPFbJr
 0vgwd4aQfN1IkANAY/KCtBQwgjDUr1ERCm7TLpNk1FUBxMuRHTORGi3waQsLFsTl6sVvUKR4aAGeb
 XroE4oYVnzSaFG1C8nqKAIJZ7UrzsFyo3i63OpIanzwHD2bndkOjmbhLzIeog10vtT7jOGFH1n/3R
 JnRFVjofwFHzSxlDNAj7Tn/WRUUWH/JLECjHrzsoKjmdeX1rih1oFxwUWruGAAZQmJag5W8PRej7s
 4BSUXz8CRe4IR8ChGLaXKc047t14odzEvoOtA2K6haWpOPnpshdoV77yqdGFCpXTTsNkd83s/I73N
 LLikkWXg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1whtPc-00000003DZO-3G8l; Thu, 09 Jul 2026 18:23:52 +0000
Message-ID: <54f6efe8-cab8-4fc8-bf00-f012b3224e54@infradead.org>
Date: Thu, 9 Jul 2026 11:23:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] drm/amd/display: amdgpu_dm_plane_test.ko fails to
 build due to modpost "too long symbol"
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 george.zhang@amd.com, bhawanpreet.lakha@amd.com,
 LKML <linux-kernel@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, christian.koenig@amd.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, broonie@kernel.org,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <fde3656e-9e22-4e4c-937f-7e8cb918da6b@linux.ibm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <fde3656e-9e22-4e4c-937f-7e8cb918da6b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 10 Jul 2026 07:19:09 +0000
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
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[infradead.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,infradead.org:mid,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D98A3737FCD



On 7/7/26 10:05 PM, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> linux-next is failing to build for me with:
> 
> ERROR: modpost: too long symbol
> "amdgpu_dm_plane_fill_gfx9_plane_attributes_from_modifiers"
> [drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_plane_test.ko]
> 
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[1]: *** [Makefile:2165: modpost] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> The failure occurs during modpost while building:
> 
> drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_plane_test.ko
> 
> This appears to be a regression in the AMD display KUnit test code.
> 
> Could someone please take a look?
> 
> 
> If you happen to fix this, please add below tag.
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Hi,
I cannot reproduce this when using gcc v15.3.0.

Which compiler & version are you using?


-- 
~Randy

