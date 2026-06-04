Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l7LPKlcsIWpTAAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 09:42:15 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335BD63DB25
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 09:42:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=rnZ76DL6;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=mailbox.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF35113D47;
	Thu,  4 Jun 2026 07:42:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F2B113D47
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2026 07:42:11 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gWGjr65Tsz9v5S;
 Thu,  4 Jun 2026 09:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1780558928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zIStY60baNuf+TofaUa/BrJgW3zXTo2H93HKUJpJtI=;
 b=rnZ76DL6H4yHugIOtUdkkNf+hdx7yVpBOUzgfAYzBF4EEvWfbZRp37OBmdUAtHgmEdDmjI
 bhla9XHoQ762YdXZyXVdZOHHbqGV6eLTuaApGAQv2SD1M7xGNzaX7jYCYX27Pb2sPxXr4/
 pMGEjWCGeab0/YdYGFEa51nbM0xHZObjVQt/dCrH5m/TBzzd+tisne45yAoIG7V1A5NJn+
 qAu8xvzCS5HFeRcKGAc47Chb1wNaU4bCujKLK0yzlF6QsnY6PIduJ8pqqnNMxVouK+W7jU
 dn5T6+HAwGGblVGsjxtrWcxiKYfZDqOdqInuLeBtpjqIdpC7Ixl1TpDlGXh6xg==
Message-ID: <af4dff0f-0c62-4a7d-9a3f-fc029c8757f4@mailbox.org>
Date: Thu, 4 Jun 2026 09:42:05 +0200
MIME-Version: 1.0
Subject: Re: Test result / finding of "drm/amd/display: Consult MCCS FreeSync
 cap only if requested & supported"
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Pei-Hsin Yang <peihsiny@valvesoftware.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <44069eb146824aa195312f5b02c49287@valvesoftware.com>
 <7a9021cd-fd78-4b0d-846b-135d0d72224e@mailbox.org>
 <16231b1742004f848af243ce398281ec@valvesoftware.com>
 <ce51243c-3b98-4f99-911f-70dd0b860da0@mailbox.org>
 <1c522568-1d5e-4210-8f25-1aa96e0d3c3a@leemhuis.info>
 <BL1PR12MB51447AB016BB28843BAD0216F7092@BL1PR12MB5144.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <BL1PR12MB51447AB016BB28843BAD0216F7092@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5f99bfaab095d404ecb
X-MBO-RS-META: hbubzry35fgbghriagqsxb69e4kwd1p6
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:Alexander.Deucher@amd.com,m:regressions@leemhuis.info,m:peihsiny@valvesoftware.com,m:Harry.Wentland@amd.com,m:Sunpeng.Li@amd.com,m:regressions@lists.linux.dev,m:Christian.Koenig@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:from_mime,mailbox.org:dkim,gitlab.freedesktop.org:url,leemhuis.info:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 335BD63DB25

On 5/29/26 00:02, Deucher, Alexander wrote:
>> From: Thorsten Leemhuis <regressions@leemhuis.info>
>> On 5/21/26 09:09, Michel Dänzer wrote:
>>>
>>> Note that some kind of short-term solution is needed for the regression(s) in
>> 7.1-rc.
>>
>> Yeah, that would be good. Makes me wonder how the rough plan to realize
>> this looks like? Sounds like Michael's patch[1] that was discussed here is not a
>> good option? Reminder, Linus ideally wants known regression fixed by -rc6,
>> which is why I'm asking.
> 
> @Wentland, Harry can you sort this out for next week's -fixes PR?

Looks like this regression will make it to 7.1 final?

I filed https://gitlab.freedesktop.org/drm/amd/-/work_items/5286 3 weeks ago, and proposed a fix the following week. There's been no reaction by any AMD display developer.

This is pretty sad.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
