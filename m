Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xRz9F0+xU2r8dgMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Jul 2026 17:22:55 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 281F3745299
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Jul 2026 17:22:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=PjQVa5HZ;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none);
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE4810E4BB;
	Sun, 12 Jul 2026 15:22:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CA610E225;
 Fri, 10 Jul 2026 20:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nWMCsn7SL/siBSwB6UFwJByxu9dJFWCvNa6O7mKClts=; b=PjQVa5HZ6snuoLqG0zl1RrpsCw
 lmhc62ysduDhxb5jFmj/T8iWuODj6/htZLn2UsW7tjb2rDF6dHa9/TrpBLjiB2H7yfAbcl5DfnFSv
 TcGIbQ17C51PQPiaL8POp+uRLfkc8Nyk118pTdH4pmMBJMd/Se26ElfeXESqEAyyjVutHSa5n9LuM
 qw8tCJPz7l+UGQ4lbh4GsQnCZJIFx279fwPkb9+3pvy1ijjnZCX6sOk1fQ19eJixU0zpLgVRjNmrR
 0Vla1DIImsjBvkaYNXcjZpZb3Cvf4jvN+i7znXE5CdjYIBVF5Yhuqs8QEcxumrC4bgp3e69JLTC8j
 /nm5RqHA==;
Received: from 179-125-92-221-dinamico.pombonet.net.br ([179.125.92.221]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wiHUM-00D82X-CH; Fri, 10 Jul 2026 22:06:22 +0200
Date: Fri, 10 Jul 2026 17:06:15 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t v2 7/7] tests/dmem_cgroups: add test for dmem.current
Message-ID: <alFQt8d8we7nFztu@quatroqueijos.cascardo.eti.br>
References: <20260702130108.1397444-1-cascardo@igalia.com>
 <20260702130108.1397444-8-cascardo@igalia.com>
 <20260707110740.5tublsdxxxsp222u@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707110740.5tublsdxxxsp222u@kamilkon-DESK.igk.intel.com>
X-Mailman-Approved-At: Sun, 12 Jul 2026 15:22:44 +0000
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
X-Spamd-Result: default: False [1.59 / 15.00];
	DATE_IN_PAST(1.00)[43];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,lists.freedesktop.org,igalia.com,amd.com,gmx.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cascardo@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,igalia.com:from_mime,igalia.com:email,quatroqueijos.cascardo.eti.br:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 281F3745299

On Tue, Jul 07, 2026 at 01:07:40PM +0200, Kamil Konieczny wrote:
> Hi Thadeu,
> On 2026-07-02 at 10:00:58 -0300, Thadeu Lima de Souza Cascardo wrote:
> > Based on the work of Thomas Hellström to test dmem.max eviction, add a test
> > for dmem.current usage after allocations and setting dmem.max.
> > 
> > Create a dmem cgroup, allocate close to capacity (or at most 4GiB), check
> > current usage is within a small slack of the expected allocation.  Then,
> > set max to a small value and check allocations and current usage are
> > limited to the max set.  Set max to 0, then check no allocations are
> > allowed and current usage is also within the slack.  After each allocation,
> > release memory and check current usage has gone down.
> > 
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > ---
> >  tests/dmem_cgroups.c | 245 +++++++++++++++++++++++++++++++++++++++++++
> 
> Why two tests? dmesm_cgropus and cgroups_dmem?
> Why not only one? This is confusing.
> 
> Regards,
> Kamil

Agreed. This is the result of cgroups_dmem being present in the original
patchset and the other test being Xe specific. The Xe specific test is now
replaced by what I initially called drv_dmem_cgroups, but I ended up
renaming dmem_cgroups.

I will merge them all into cgroups_dmem and send a v4.

Thanks.
Cascardo.
