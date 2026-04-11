Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCY+IFs02mlezAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Apr 2026 13:45:31 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D0B3DF90E
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Apr 2026 13:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FB510E1C7;
	Sat, 11 Apr 2026 11:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="SMxnHZm3";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8833710E1C7
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Apr 2026 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1775907926;
 bh=fKc7rNjB607WrvadSSpq8ggFYcIZbT8rYkFD7UDg5zE=;
 b=SMxnHZm3h6g/JqjRMNcsZll/REPRoc31ayf/TMHbZ9qh0/cXTRrmWl925d81k1322bHfJH9g9
 jRKlOnRoGW6ZhBQIVtbh0+TuIdzEABL5Pa9ZySI5Z2j9BWq9+EhYf4MN1z37kD82CHPWXNSFY41
 E5Bytw6wRmxpiEpJmJ6H+YavlhO9Etd7A0H0cH+gTEwl04Khq8xQ6vqtYArrX2zhGUXRyn0FmaI
 G3N/CVq/Mzdx2HPo9OGr5WeFhcckohiTA9dQUCO1lJPsNCxRDmwi1ET/TWD5d93JtZPaoF2k7gt
 MGu60glrh8IESz/booGTiylodyozl+kYkK6wvw2ZF41Q==
X-Forward-Email-ID: 69da345156946c16b3de7e88
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
Date: Sat, 11 Apr 2026 07:45:19 -0400
Message-Id: <DHQATFD3MPLS.XULA16D1IROS@ubuntu.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Roman" <Roman.Li@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>, "Chung, ChiaHsuan (Tom)"
 <ChiaHsuan.Chung@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Subject: Re: [bug report] drm/amdgpu/amdgpu_connectors: remove
 amdgpu_connector_free_edid
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>, "Dan Carpenter"
 <error27@gmail.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
X-Mailer: aerc 0.20.0
References: <adinpZORBkhVcw31@stanley.mountain>
 <DHPGIF5U4U8O.1R90J7IR4M80L@ubuntu.com>
 <IA0PR12MB8208DAB29B0617E8F6D082C490262@IA0PR12MB8208.namprd12.prod.outlook.com>
In-Reply-To: <IA0PR12MB8208DAB29B0617E8F6D082C490262@IA0PR12MB8208.namprd12.prod.outlook.com>
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:dkim,ubuntu.com:mid]
X-Rspamd-Queue-Id: 95D0B3DF90E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat Apr 11, 2026 at 1:30 AM EDT, SRINIVASAN SHANMUGAM wrote:

> I went through the code path, and the warning looks valid:
>
> In amdgpu_connector_dvi_detect(), we do:
> drm_edid_free(amdgpu_connector->edid);
> After that, we call:
> amdgpu_connector_get_edid(connector);
> But inside amdgpu_connector_get_edid():
> It immediately returns if amdgpu_connector->edid is non-NULL
> Since we did not set amdgpu_connector->edid =3D NULL after freeing:
> The pointer is still non-NULL (but already freed)
> So amdgpu_connector_get_edid() becomes a no-op
> No new EDID is read
> Then later we do:
> drm_edid_is_digital(amdgpu_connector->edid);
> At this point:
> amdgpu_connector->edid still points to freed memory
> So this becomes a real use-after-free
>
> So the issue is not just the removal of amdgpu_connector_free_edid(),
> but that we lost the behavior of clearing the cached EDID pointer after f=
ree.
>
> Because of this, the EDID cache logic breaks.
>
> About reverting:
>
> Reverting the commit would fix it indirectly
> But I think a minimal fix is better:
> Set amdgpu_connector->edid =3D NULL after drm_edid_free()
>
> This keeps the current design intact and fixes the bug cleanly.
>

I like it - less is more :) and it also makes it clear that the
pointer is set to NULL, instead of being hidden behind a function.

-Josh
