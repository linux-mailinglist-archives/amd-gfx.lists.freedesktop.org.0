Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lPE6OYIGPmoF+wgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 06:56:34 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D60C6CA32C
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 06:56:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=B0EF3wbl;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEE010F0EE;
	Fri, 26 Jun 2026 04:56:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD64C10F0EE
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 04:56:31 +0000 (UTC)
Received: by mail-oo1-f68.google.com with SMTP id
 006d021491bc7-6a0e55e82d0so393548eaf.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jun 2026 21:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782449791; cv=none;
 d=google.com; s=arc-20260327;
 b=JhYBvLz5CPx/XDVWaHiDaTIkDwYgLGGdK9thk/VLqsl/aaxZiN1CiByq84PJFuvgLt
 /RJ0qZD3Y8NZbygJcf5geCSUBbwLH0+1FkZPznbcheDyu0NM4GrtsmYSOQdA3RED0gWa
 cu/uFVL/0y7lY7Omr/4VhuEjfv9AF2T6xQg+pzjaD8W9t8XHjjuPUK1PNsjOjUgkSyVL
 4z2uuFVTjIOWIAawxAQvLAgp2WaZkEOQ89I99AY6D4WUlN+NZiSoE83MaTqg4jsVW0hr
 EE74JDDPnjMTUBIzfgrfy1RIyIgOu3Uyq9AI6qdpbH7cBeVlPSPwQJZZtGXtyMRd+CXW
 Ctsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TLCDSxTzhM1JO0GFxs3906RW+bAoUMN+D9UfGDqItVw=;
 fh=DzrCScACkdCDp85BLpTL1eqE+whjSzW1oy6+lpZPlrk=;
 b=EkNdH7QTqrv0C1QaTjb50d4ErOaG99XD+V7DmE8yb6f93rUrh/bIheHf+diN+iFBma
 5l4OYLXb2388FL+mp3u2N2FxvBZM0Mbvx7tz19HLTbfTR+WsYjg2ZPkLn59GTketF4P1
 S3c9/Vj+RoPWnV43s02lpK9Mcr5Im7cAzXVEnRcVQWf78gLCYtkqPo0/2Ok2hPherqzH
 NLneLIv2hNdqMvWB1JJek2FfBclRJKQmhOsY8jRuoj2Sxb/KId9L8p0tODlVa+9eKOBp
 QPSbILv/o6SeC2MgR1NF1JDzLkJbCvZWz3c+1KRmREqLPs1XoR86RmDwm8LR4LvW8qOt
 WAJA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782449791; x=1783054591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TLCDSxTzhM1JO0GFxs3906RW+bAoUMN+D9UfGDqItVw=;
 b=B0EF3wblvGhAUENkJTCpBypuauGf7a1M3Ob9UFmnc3P/6HrOhAl2Gzs8lbGyfjhIWo
 nZU5pvLPWaSN8Zd995i0TiBFzsVMx5Im92y7fkIbKl+oLJcE+gmqJalTm+mF4pTKVISg
 b3KN9dqk7QwQ6pymv8pp8qa0h30t22UX92S85JGJj+rvtw5ZHl0YhTF9EevTB1IRmbUq
 NIDGlZ8YQnMLyRBlKn9krTZRKNc5ghiFgVb8liaj3z18RIYhx2p7dP36HwhLyjN8C70z
 d5f/wXjyHw0eWOqj2EpT0Fzcp6PXm9OL5fLgMHBF9BtM7PKAaHK6HZscSCNs5nCC9z29
 Z+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782449791; x=1783054591;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TLCDSxTzhM1JO0GFxs3906RW+bAoUMN+D9UfGDqItVw=;
 b=p2gD/Pu98gO+3ASyB3FfencBUECeHfrP4Mq+rDmIaX8ZbNYsQsl/53ORhYUa5DC+rQ
 N+Ijdo0lcQI9M4DNILaAUax6sq3KeZNVhRv3FRXx5PGAmAIWh2bX7wkqDlNbhDlmk2sv
 jjPB27TUgyVxwnReqUxWpuWuV6pG+AyZrVRT8S/WuSbdyJmwZ1En3fD4b/ptcz+6jz1c
 +vQOkCYxhsiGvKHyySDIGf0HUJ2b8QC5k09QX7YthtyDuvaoZJH+pbHPbITV1kuVY6nr
 Zt6K1xxHKtiZATxewXsKCyVj3cj6IyD50G1IMtNUzISfVis25+cQ6InK1mIaMMg5HQYC
 kAvA==
X-Gm-Message-State: AOJu0YwPBhenO8Z6SirrDVrz/m/tegwuUeRKrcz9+5Nze3NMrZSgdgGG
 AjbjypaAqwO4PsLOhGnwa7ZCCfi+QjLoRkV94oVT9eEcIf9WBG2dmdgMdw0ac2kagnCTiwphfFL
 RdsFk+nE4oiAwUs05iPoJV/vLlOBDpv/XX+5lW2Uk+g==
X-Gm-Gg: AfdE7cmTqA84BSJFPwA5pzfCAv8EM43yfd+2zdDE5MImH1D2w492ibI+kKQxQpU06dj
 crY1FFksW5sxbWuj6DPBl74Ojq/5/3kFbRFgbssmYQ93MWCLSUZPBrOFuH1oMIvyFYgtSdRO3pk
 vYI6LDVpkZoQDYqIiMnLox+zp2SdKueH3cbr840R5iGjA1LbpC9jJLr135iBparPnVSYGk/y4Li
 lvdT19wuI71j05xdpc3vO8BFo9PRfLg3KGDgH004EekAbgPMibaBfCAIq8AcMkF4gPGFvlk4rFb
 1g8yRQqL42d86JlIPB5OBx982/WW+ww=
X-Received: by 2002:a05:6820:178e:b0:69e:b425:744d with SMTP id
 006d021491bc7-6a135055ad0mr4528390eaf.6.1782449790927; Thu, 25 Jun 2026
 21:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260620-ch7218-rfc-v1-b4-v1-1-3412debf44b6@gmail.com>
 <b9256d5f-ac08-46cd-ab84-3fc0e6e52b61@amd.com>
In-Reply-To: <b9256d5f-ac08-46cd-ab84-3fc0e6e52b61@amd.com>
From: Stephen <stevester.codes@gmail.com>
Date: Thu, 25 Jun 2026 22:56:25 -0600
X-Gm-Features: AVVi8Cf64YJ4owdxmkzWNKc4BReuGudKjy14P2Lq_16_tPqhQ4ExlJJJtpbeL-k
Message-ID: <CANC0aFeXLE0j8ukyRS_gzP3uQhJb9xD98+a=jE96Cc4EuNFcmw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] drm/amd/display: quirk malformed CH7218 PCON
 topology
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stevestercodes@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ALIAS_RESOLVED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D60C6CA32C

Hi George,

This dongle is from Amazon and is described as the "MysRuida USB Type
C to HDMI 2.1 EMI/RFI Braided Cable 0.6ft, 48Gbps,
8K@60Hz/4K@144Hz/2K@240Hz, HDCP2.3/Dynamic
HDR/eARC/VRR/ALLM/DSC1.2/Dolby Atmos/DTS, DP Alt Mode Compatible with
PS5 Xbox Monitor"

Just FYI, these CH7218 USB-C to HDMI 2.1 adapters seem hard to come
by, hence why I purchased this specific one. I=E2=80=99d note that the Vola=
ns
brand one, despite claiming to be CH7218A, is not. Mine was VMM7100. I
suspect the Lindy 43428 may actually be CH7218-based, but I have not
tested that one personally.

The one I tested exposes:
branch_dev_id: 0x2b02f0
branch_dev_name: CH7218

Thanks,
Stephen

On Thu, Jun 25, 2026 at 2:38=E2=80=AFPM George Zhang <george.zhang@amd.com>=
 wrote:
> Hi Stephen, thank you for the patch.
>
> What dongle you are observing this issue on? We are interested in
> reproducing the observed bug.
>
> Thanks,
> George
