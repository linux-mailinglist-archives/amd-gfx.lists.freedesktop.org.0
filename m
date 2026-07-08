Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KNYIN9uuTmpfSQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 22:11:07 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1B672A1CD
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 22:11:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rtUvn8Jm;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AED89A16;
	Wed,  8 Jul 2026 20:11:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3BF89A16
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jul 2026 20:11:04 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2ca7605ce4bso1609295ad.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Jul 2026 13:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783541464; cv=none;
 d=google.com; s=arc-20260327;
 b=V6HKjLlBExM+e7im7hpbyNnIJiW+G0Uesm1/Xt9P8Q2RwgO13SXK6Myq0bltkcBDyl
 QPJlRJoHTGI49vFHYeFG5xwYePYShbT6Bf9skzKuu+JUZ0dWT9a5VcFzGmimox1sGben
 cX9o7T0WJMix8tzHBbsmLPMTKxAdbfWuULsXfsAKDQyI/k4x0CLnAL0yTOXKPp7HtG9Y
 5mYRBkHv4BRC1FYApzCuOEfRev2btHBu6+EjW/ejrWAwRMbd1slCSYuKH0MWKc94zj1d
 1jv4nc5LILeE+XrYqOjewvjt/1cemAvtnA1ZteaV2RTBNeuHysbzgwWgdYFXxRtRBZFK
 P41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QZLNjVpmyi0d+h50Tfa22Ci3luNx0l9N4UfOz4jz/fA=;
 fh=hzoWuElyInASonsFCViuzUgDeWKlwzi3eZ8quAjGESY=;
 b=CvG+ZdBOb8+qise74Z+aD8hIZ5SkPOvDfw7rekmSf7dUW6diAvYgmpFOqThFiddiUN
 xI7kjn2eXPsf0iCysU16CKX5ould2gK6C+s7egt//EQiQt08bikYJmQ5WORlsJ5l0tnZ
 amHC0kelwWMIMoB5szfLnKRABkWoFPoHD40p/hinRmSwWg2KXIMx1BmWAT/V/Jgfc5Y3
 Quq0jJmaEHFCoy8oT2t7fyd6mOX5by/vFt+nPuNE0EdmGGdMUyJElRnTZSlx8Xp379mZ
 iNoni9RNP7WGybcwmM1Uz4KcS9XTMI1QOYfzhjiU/J//c+n3/supMj8+fZZUFo+y0dlE
 Y8UQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783541464; x=1784146264; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QZLNjVpmyi0d+h50Tfa22Ci3luNx0l9N4UfOz4jz/fA=;
 b=rtUvn8JmBWvFyFtRKTBKX3j6stHzjHqH28oES3LYVXcBnvEwNbEInZTz3+1uBbPx2M
 Eew29jmWOv9zOP1hgddkzpnpKYa4CAGqy4o8cWNPAjgi60QXTWI77WbV0xo7VqnFWAej
 E9xePAOsfP1pBjCVbbk8u1S6Kj/Ns39nYa54u9wZCR14n3AGrhLfVkrGVGAbZLrLEM8c
 GkTb55D5GoY5CsUB76q0AeFcOxGgyOYheSZnklPfhdnMcCokuinDfLqDAAt72m7buRH+
 hxn1LfHmedmDLPZDLHizEx/DCUp+NuUm82Hy2rpCZHwQmyWpekOgHzdzrF2Qd0/fPOcy
 EIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783541464; x=1784146264;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QZLNjVpmyi0d+h50Tfa22Ci3luNx0l9N4UfOz4jz/fA=;
 b=X70QfKhXlQEv0WjRZ0zQJdWrXbLfYgQoZG3cFx2KoWkFEyba+JZHKodioTqonZwADV
 q+LKzrFrpeB/tNwWr6xdx+e2EHoTiI0ErqkVKnb4tVW1dR28wbMFC1UNMg8JtULwwhM4
 JYwhhJqGBEXtxmlZTTxLSw0dxKnC2Mmny323mVsbgie5DlqRz6hYPM2jV+pVedXFTtU4
 AzykBh7HLx9yRd2kY0GT9Gs1Lug74NvnMPJtowxVZb7UzHbm5aPGQyIfjbxEK8yYUGv3
 fXdDGtlCq3vQMypHT+W7VQfRqLju00BNT5h0hUtumzINAMpWixZxzzXQfpg3NOmv+hXJ
 gQag==
X-Gm-Message-State: AOJu0YwCIXU0qIwPWwEeA6eBWArgBn4IB8bDW+ER1psYNkC9Qm4VvDQE
 HzmXnodz2lsaOj8doHqDjoEGWlUWAoL7bZK1LyzRYS/H7PuxLKOM8O/AtHCi3TqLRXmSb5zQw2x
 7RoIalZ11XBEpc1GLkPNfxd1QaiLqJWhhKQ==
X-Gm-Gg: AfdE7cnJNd+q17VahMw85pyYnUAV0fK8eXix+EDITKSIhnPPgaSNBuJOy9Tspn7cpKE
 V+5UyEH8MGuenwprzMqZDoFIH4B6RmEb7VLL0sFj1wraeCYjNDuEtve1Jlbw8JSYD9gQjGky0uN
 I6lnmgZoflE3kKVnkEcCh2GEVb9+5h4873wbn5nPeb/QjhdjyGN9MhsrZIhwrprpA8xINiCL56D
 KHjcragxZKnIzWrxkYwtzSlmOdjd48wRLeCcOeaQ8jlmYdwo+ZWpasNXoNZTFdeG1f/RT5xWdNk
 FddOoSFM/hPVXC+a0nrkvJpFkjtGiMLyk8P7yz4ciSJgnf9VMDlBtkAU+nE=
X-Received: by 2002:a17:902:c412:b0:2ca:bca8:109b with SMTP id
 d9443c01a7336-2ccfef8d44cmr7301935ad.5.1783541463812; Wed, 08 Jul 2026
 13:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260708193518.702584-1-mario.limonciello@amd.com>
In-Reply-To: <20260708193518.702584-1-mario.limonciello@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Jul 2026 16:10:51 -0400
X-Gm-Features: AVVi8Cek1YhkOgD8szXAnN301KlsSILgWbwNdd2ISjTlq0HW74Y_n6YQqYAbUbI
Message-ID: <CADnq5_Mc--qTm=oj2PGEdydBWbRS8j_rF5nK70QcJeYpC6syHw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Allow matching devices with different bus numbers
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Oz Tiram <oz@shift-computing.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:oz@shift-computing.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E1B672A1CD

On Wed, Jul 8, 2026 at 3:44=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> If a user has specified pci=3Drealloc,assign-busses on kernel command lin=
e
> then it's plausible that the bus number in the ACPI VFCT won't match
> the bus number the kernel assigned.
>
> In this case the device will fail to probe because of the mismatch.
>
> Loosen the requirements on VFCT bus number matching to allow this case
> but log it with dev_notice().

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> Cc: Oz Tiram <oz@shift-computing.de>
> Mario Limonciello (5):
>   drm/amdgpu: Fix VFCT bus number matching with soft filter
>   drm/amdgpu: Release VFCT ACPI table reference
>   drm/radeon: Modernize VFCT error handling
>   drm/radeon: Fix VFCT bus number matching with soft filter
>   drm/radeon: Validate VBIOS signature in VFCT path
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 62 +++++++++++++++++++----
>  drivers/gpu/drm/radeon/radeon_bios.c     | 64 +++++++++++++++++++-----
>  2 files changed, 103 insertions(+), 23 deletions(-)
>
> --
> 2.43.0
>
