Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPuxMu3o2GnjjggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Apr 2026 14:11:25 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595533D68B5
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Apr 2026 14:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D777B10E94B;
	Fri, 10 Apr 2026 12:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="LJVHXfr2";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EE810E94B
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Apr 2026 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1775823082;
 bh=aKYTAnOrtDKEGtEi/In+qbq9TXaAYl881B/XMSw2ewc=;
 b=LJVHXfr2N8ixqA/EQWgV619u5pSkrvgcSAwnY+HGmYgk9+RoQMPDn83t9yGLTMZvAvYwUyx2g
 Ucl2wPSU3dQuwgIJWUsn8P+rDxicUSnkS5gFUVQbA5wPZ+Y+O2859sO4dZ0K2gMzQLR4cA1qHDi
 3b19/kuSKz8KvfZZpAnPEycQ9WBY4U+Zb7g3Zp3rAzb4rV8aBETpqTfnUMGPShhM7mxSMvhYFKE
 Dk3mkJMjjYMvtjqv7VHLDE1NmER8G/46Hu+g5FK6aJgAuxiHnMvlK3BJ//P+crVKjp22e7F1PBN
 MeUOLDb7hAeAva+nmuO0JGCf/lw6UszdiuDh5cwiWncQ==
X-Forward-Email-ID: 69d8e6592520a8349e4f62f7
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.69
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Fri, 10 Apr 2026 08:00:23 -0400
Message-Id: <DHPGIF5U4U8O.1R90J7IR4M80L@ubuntu.com>
Cc: <amd-gfx@lists.freedesktop.org>, "SHANMUGAM, SRINIVASAN"
 <SRINIVASAN.SHANMUGAM@amd.com>
Subject: Re: [bug report] drm/amdgpu/amdgpu_connectors: remove
 amdgpu_connector_free_edid
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Dan Carpenter" <error27@gmail.com>, "Joshua Peisach"
 <jpeisach@ubuntu.com>, "Alex Deucher" <alexander.deucher@amd.com>
X-Mailer: aerc 0.21.0
References: <adinpZORBkhVcw31@stanley.mountain>
In-Reply-To: <adinpZORBkhVcw31@stanley.mountain>
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
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ubuntu.com,amd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,ubuntu.com:dkim,ubuntu.com:mid,people.freedesktop.org:url]
X-Rspamd-Queue-Id: 595533D68B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Apr 10, 2026 at 3:32 AM EDT, Dan Carpenter wrote:
>
>     1057                         amdgpu_connector->use_digital =3D
> --> 1058                                 drm_edid_is_digital(amdgpu_conne=
ctor->edid);
>                                                              ^^^^^^^^^^^^=
^^^^^^^^^^
> Use after free.
>

Lovely. I was wondering if that Claude review[1] was accurate. I also
asked in IRC if it was something to be considered about but I didn't
get a response[2]. I'll be more pressing next time, sorry.

This morning I'm unable to test, but I think reverting the commit that
removed amdgpu_connector_free_edid[3] should fix it.

What do you think?

Thanks again for the report.

[1]: https://lore.gitlab.freedesktop.org/drm-ai-reviews/review-overall-2026=
0303211823.76631-1-jpeisach@ubuntu.com/
[2]: https://people.freedesktop.org/~cbrill/dri-log/?channel=3Dradeon&highl=
ight_names=3D&date=3D2026-03-17&show_html=3Dtrue
[3]: https://gitlab.freedesktop.org/agd5f/linux/-/commit/289479173fb538f3ec=
7aac5206f49e39367ee75c

-Josh
