Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mh28NIWSNWqZ0AYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 21:03:33 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335EB6A7726
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 21:03:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sNl1cBeX;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489C610E0FE;
	Fri, 19 Jun 2026 19:03:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034FD10E0FE
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 19:03:29 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-30bf69bcb8dso214793eec.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 12:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781895809; cv=none;
 d=google.com; s=arc-20240605;
 b=AXmAFcQWrhGb5qqJbm0z6DNoQZZPsKWXNU/00orXDJ+lSwoZx51OZrXCgmYrYU+Do6
 KOswHxcxlK5daXHaPxHUmEGbMfJXY6y10YbJEAX2YkTG0d+bu0Ny97RVD/sgLtyCY01B
 qn0qA48BNDKzufqsKNdNwLYFuPUMty0GWo1OZmUGZskZaw8L4Lh/iLIQcvn95a1rWuFk
 mzYyJ0tcDn9fGIQa8Vgidqo8sq3t5wt85Qy5fbQePHg6ntbeaAGnL5/GFQQxE4SQA2wv
 iIxxN0op2HyNTYsL1WiWOZoz/KeuN2+2JnHD/3w9h/5MHqLpBMnjWoSIIrHvCIFblO59
 Z60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aH9Tuchiwo5nemq4b44VQ6izZf8xGODHNJChDeCrE5g=;
 fh=FPgF+aPKHmzparW/4Z4ZiSi2RZsA+mZxVRA/kpLE/JY=;
 b=h6GM4ltCFju/XaaKB9GmDoObOvsklaSOxs0wmpIi2+8m7FKoYlEHOUf++NqFG9APRB
 pgpvfv9tvJfDsqsEHH08T3t/CTU8i2KfHLIv/MGE4yuvhNvzrP/Eqr8oT15WjgXJDInE
 wpR7YPLgIzTQrduifQbhytIbymw5TND/eXHr4k5SPXXLUCndSCRCPBuuL0riHobTXefy
 GwO0bxaJ6pyKiHLutR8cQNhrxVRj8p0T4NwSirjumMZkoXbFK2K3uJdvp0mQV7jQB+Ep
 WwdeKfzPD9V8MI+LBasHkqtH171t4475RL6O4WHeKeVpMlou8lL5yAvc9Sqrvftqk8BH
 4sNw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781895809; x=1782500609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aH9Tuchiwo5nemq4b44VQ6izZf8xGODHNJChDeCrE5g=;
 b=sNl1cBeXlz6KkoY3+i5DB29Bdj1vZwYSFCsdgvz90QJ5QDBG+ArjmWKAd845ukWJJi
 s+zQrhnH0wBXKUJMg9nYCBSTPd05YdORPEGXQxeV2dlEZ0PAyAI1CFop6gwoxwO8asMr
 zmKpJY/fTw0LJqFYApLs/c/cuj7irwrNgRHrtCwBm7DTSKghv9d1I/OFZz8A1k4lgWSO
 ZC5agpy5aMr/PzgAzY87WUC3TKXAsfeJcYKQFTUgpGIZgxX+9bCc1hN1TI476OzEB9i1
 YDZtrISXnAV9LBerxhW9cMOXkqvuei4DYL4gYqQ2qvc00e2pYbx9djr6oRtq33ewTdts
 KOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781895809; x=1782500609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aH9Tuchiwo5nemq4b44VQ6izZf8xGODHNJChDeCrE5g=;
 b=UzSMf7TX5q9Ze54kn9HzULuKWlP24NDmFKZXJZGvsulroSsNsTUg/u3gztqqmRZILU
 DnroFYNaVHbk1XAmeCn2WlcZctsl2PwMx5ot2HYRvvJ8C5kw2Ib0NURTKvzU5mH4+x89
 DxJH1giYzR1VoY6qvdowYFx5H9h4zX5wBn2OovA42Ti02WdvYWJslocNDqY1N6W3CjZq
 1N/8kEXRCXy1PnKloMPLVkbK8Ta45PSaMMGO65ZVXHnP1esQ+td+3N7bo69FGVpHa3jM
 NmAvgvkm9LDlpifwfLL5dArEdSyw7XcOTGjxxzUvxruPNpq9PgRnx/EtPmmmjgnYiKZu
 GWKg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9PrUS1ufa/23plwmBX5dG0SRZYO+CPmXHBxupqprroY8cCszxMxTd84pRxxw9eKfjqdgwEVKLq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRGgso3fUzng9rnz4BmScFTDTHSGwmEGkgIxG8IIuyIVdaUuVI
 cfxpJHYNpGl4I6WAp4b7BL01fbV+u7WJ1tCkc6DW0FS4MjPQj5WHIyT9Wa03I2iM+ViWxOZ+Cxa
 RvRwTQ18iUP9a48dvR0ruXxwl7ZHe654STg==
X-Gm-Gg: AfdE7ckqfx6Gm8dZr52keRv3517zrLPNuozTvzhWstosuRK2NorssDn7q91Ix6tUk28
 UtKYo0v/vqfR32KLjuSpm08XS3VzIJI0/uPXIHxaedNWD5jT5D8IGMUFI2jk1MBYrLqVj1g/tUk
 8tI+yEvvID9xvBXkaxng8NciwGjEQdr1QotS0ZWNzU+37LB32e1ZKxVyAMggYlZ0SsQzsh13mQy
 KIzXFZbXNbdR95eeT42t4F+Kl5ardrOP4DJpsCfjkMH+YSY3K5gogGwKDhvKToawt1juQuzfn05
 T5T8xhzww/Ihe1+9Q41NCTH+9IVXLmvxidIEFJ5Irey8aBh3vk5vneiiA9w=
X-Received: by 2002:a05:7022:110d:b0:12d:c389:ae54 with SMTP id
 a92af1059eb24-139a20c956emr1048831c88.2.1781895809062; Fri, 19 Jun 2026
 12:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <1b83ac6f-1018-3dee-c029-1b2ed78a8460@feralsw.com>
In-Reply-To: <1b83ac6f-1018-3dee-c029-1b2ed78a8460@feralsw.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Jun 2026 15:03:17 -0400
X-Gm-Features: AVVi8CevisgOi0ZqIoy8gQ_YegmcH69NGAYJIIBYzq7F0daalK69QYUtgOcR-LQ
Message-ID: <CADnq5_OOHvP+AfZND5zNsB1zvAjWSfnkyJ8OSAGfCwO8njeJwA@mail.gmail.com>
Subject: Re: [PATCH] Support some Barco AMD based graphics adapters
To: mjacob@feralsw.com
Cc: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org, feralmatt@pm.me
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
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mjacob@feralsw.com,m:christian.koenig@amd.com,m:feralmatt@pm.me,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid,feralsw.com:email,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 335EB6A7726

Applied.  Thanks!

On Fri, Jun 19, 2026 at 2:46=E2=80=AFPM Matthew Jacob <mjacob@feralsw.com> =
wrote:
>
> These adapters typically are only supported by Barco on the Windows
> platform. However, with these changes in the linux driver, multiple
> monitor support should work correctly.
>
> Signed-off-by: Matthew Jacob <mjacob@feralsw.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 60debd543e44..e3ba168795cc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1926,6 +1926,7 @@ static const struct pci_device_id pciidlist[] =3D {
>         {0x1002, 0x6646, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE|AMD_I=
S_MOBILITY},
>         {0x1002, 0x6647, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE|AMD_I=
S_MOBILITY},
>         {0x1002, 0x6649, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE},
> +       {0x1002, 0x664D, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE}, // =
Barco MXRT-5600
>         {0x1002, 0x6650, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE},
>         {0x1002, 0x6651, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE},
>         {0x1002, 0x6658, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BONAIRE},
> @@ -1995,6 +1996,7 @@ static const struct pci_device_id pciidlist[] =3D {
>         {0x1002, 0x6930, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TONGA},
>         {0x1002, 0x6938, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TONGA},
>         {0x1002, 0x6939, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TONGA},
> +       {0x1002, 0x693B, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TONGA}, // Ba=
rco MXRT-7600
>         /* fiji */
>         {0x1002, 0x7300, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_FIJI},
>         {0x1002, 0x730F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_FIJI},
> @@ -2023,6 +2025,7 @@ static const struct pci_device_id pciidlist[] =3D {
>         {0x1002, 0x67C4, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
>         {0x1002, 0x67C7, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
>         {0x1002, 0x67D0, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
> +       {0x1002, 0x67D4, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10}, /=
/ Tentative Barco MXRT-8750
>         {0x1002, 0x67DF, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
>         {0x1002, 0x67C8, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
>         {0x1002, 0x67C9, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS10},
> @@ -2036,6 +2039,7 @@ static const struct pci_device_id pciidlist[] =3D {
>         {0x1002, 0x6985, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
>         {0x1002, 0x6986, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
>         {0x1002, 0x6987, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
> +       {0x1002, 0x698F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12}, /=
/ Tentative Barco MXRT-4700
>         {0x1002, 0x6995, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
>         {0x1002, 0x6997, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
>         {0x1002, 0x699F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_POLARIS12},
> --
> 2.47.3
>
