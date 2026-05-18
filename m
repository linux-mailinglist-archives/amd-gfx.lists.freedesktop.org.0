Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOHcMP24CmoB6QQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 18 May 2026 09:00:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A65567152
	for <lists+amd-gfx@lfdr.de>; Mon, 18 May 2026 09:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B8810E68E;
	Mon, 18 May 2026 07:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=m1k.cloud header.i=@m1k.cloud header.b="Ncpz0TzB";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.m1k.cloud (mail.m1k.cloud [195.231.66.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5667410E68E
 for <amd-gfx@lists.freedesktop.org>; Mon, 18 May 2026 07:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=m1k.cloud; s=mail;
 t=1779087608; bh=eY8OO5UtythPRJ5c2J2GPU2rkJITTH1atpR+z4s0pvc=;
 h=Subject:To:Cc:References:From:In-Reply-To;
 b=Ncpz0TzBluYP362qqpocteqBqNPywoJchgSn8OyE+QG2irRAOFZISXdOC0xDzKxVK
 a8l8+360/fMJISU58EA+33V09gPyS5UgE7+HQ8+8Y5CapTgeFAuCNifgpTOCfHV/rK
 gvfqUeJHvlIjUUvQ7KRwuVisvuMGL7WvgKZh6Y8i06icqkMvXNS+vMyQFjRw0+MWIi
 A/4GBbpgwVj3gG3B35SW+xlwb6ghSUNs0o7R4KF33wiQWSOpfU5IfZJMAC2ZbNOVRR
 KoWJTwhS+cP6RfEgmULgt8A4unAHD65juRjKg1nAjuw0ZE1+X35Acfatqk1DJHiFYe
 W9Fo2C7JN1k2g==
Message-ID: <d3e8f87c-b239-484f-a734-72017d60425d@m1k.cloud>
Date: Mon, 18 May 2026 09:00:06 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amd/display: Use vline2 interrupt on DCN instead of
 vstartup
To: Shengyu Qu <wiagn233@outlook.com>, sunpeng.li@amd.com,
 amd-gfx@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, Aurabindo.Pillai@amd.com, mario.limonciello@amd.com
References: <20260504183649.165131-1-sunpeng.li@amd.com>
 <TY4PR01MB14432FD1DC8B9B826B6CE9474983B2@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <TY4PR01MB14432444AD2D53FEC2AA85D2698032@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Michele Palazzi <sysdadmin@m1k.cloud>
In-Reply-To: <TY4PR01MB14432444AD2D53FEC2AA85D2698032@TY4PR01MB14432.jpnprd01.prod.outlook.com>
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
X-Rspamd-Queue-Id: 41A65567152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[m1k.cloud,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[m1k.cloud:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wiagn233@outlook.com,m:sunpeng.li@amd.com,m:Harry.Wentland@amd.com,m:Aurabindo.Pillai@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,amd.com,lists.freedesktop.org];
	FORGED_SENDER(0.00)[sysdadmin@m1k.cloud,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[sysdadmin@m1k.cloud,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[m1k.cloud:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,m1k.cloud:mid,m1k.cloud:dkim]
X-Rspamd-Action: no action

On 5/18/26 08:34, Shengyu Qu wrote:
> Hi,
> 
> Still no issues after longer testing:
> https://gitlab.freedesktop.org/drm/amd/-/work_items/2950#note_3477114
> 
> Also what's your test result, Michele?
> 
> Best regards,
> Shengyu
> 
no issues for me too, patch seems to work.

Michele
