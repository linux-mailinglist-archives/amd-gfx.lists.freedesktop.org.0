Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rZQOFlI7MGrbQAUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 19:50:10 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A641F688F68
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 19:50:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=q90RLtpV;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B78910E4C1;
	Mon, 15 Jun 2026 17:50:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6871810E5C3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 17:50:07 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-304dc707bfbso230306eec.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 10:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781545806; cv=none;
 d=google.com; s=arc-20240605;
 b=k92zjQvkOC/74/AwcXGeWgbCrFevjX/uhqyygmjvU0aVZIhCosBW0iuwcuotLFRTtM
 KV/KbiTBpRSlAAq0ldY0yxQBEkd6thAsMLzAXREMmox664XUuD1BcNZub+ZAw9nor45q
 uk+6ZQGdgHhhFrixiWYdYyjAr2aV9ITxa4lkxpVtgxM8OLygUIeXFCBT6Rz3ffZ4d8zp
 CfDdE8fktMd45wRnBp5vO4sF34gVvcE+KpJZT64X67jDCNw3H43EoBn0MHO9jDdABUiy
 9U764QV/BD6mlcGSgCca6V3DUB9ayC/iR30vIO1bWkfQgNM75EdLnCKuGiq0rYc6uUDR
 CLAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QH6edDiZYrunzmCwgOfYr96OEZNPihGP8JCdMp4/enM=;
 fh=8NZK/li2IV6I8S/rS1JLlv99vfsCN11tCzFwSSRu8c4=;
 b=JfUsJDOgPEMcjualPWBvAcls5wGfx2GTaY9FsudtJGbSwKsomQ5C7EltXglj2ysjS7
 vWYPCzlyU5D5PrKa4KTVnTNgUyXcy9wc7s9nEHN+vSxiSe7PrCOffIlZVPhJGAncTByh
 N7kroo+t5u2DYDgv5tXbG+oP3cdhBu8hY88S6vRNjmmgv1kuJduZ1nTmyQAB6+g2HZb4
 67BE2RxUi8UGkXbXWyRjPZi6baVjMlUldK8uh4xJxTRV3S5KR7jzn6rw6I4tFFPKLiZv
 DazfAD3eHEQanV7DPcdSPKHJQzqWGDTGu6hcFwfv+LQoLGsCI9In6Ft3ZHh0SIX+mBbC
 1d9w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781545806; x=1782150606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QH6edDiZYrunzmCwgOfYr96OEZNPihGP8JCdMp4/enM=;
 b=q90RLtpVolusTw1dbX529iGvNtTi1QB4uiWZPxWyQd3z+e46GrKH/lb376qXqlzBYB
 f3D9wcF1v6krPolWKR04f9NlwfW7qQmuAzYxjzX3FpFW9wBMRjOveXAGiFc+hbVXwsrJ
 efyXp7Eo0wql0usmSiuctOSOaJhbrFOPUmJ7xbDx6uKJBSuFvMNQRuaZHvk3o1+VzVzm
 nQ3LfUD92XMxtY47vih4YiQAGOIts33jKHULFzeQTeGRiaP6e/P0YyQVoBvNLH3qGoUr
 pqEHFh4ZAGEG71QpgEJ/D+S4SCWllk25aoQYr6q7QWcG+UsPNNJM1M6Xy8E2rH8tud9F
 TuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781545806; x=1782150606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QH6edDiZYrunzmCwgOfYr96OEZNPihGP8JCdMp4/enM=;
 b=NoHS5JagSOIIvo5Ayet8ULWmT+pM6IRKjpSGwn3j+o+vq1ybXPI5s/TytpyNua2C6Y
 rNZ6QErQwaafrj0+PfSfvbnzUHTxlIyNCvHSwO0fUTfk9m9ttPGKHc42Z2wuvab0rDZ0
 bBavp7m3gSBR/fYeLFw54Gm2C8cdQ3qPJlR3pJTk7KIJX4D3YwC09xEBi4CV9c7iSoX8
 N9ISnocDMq8DEi5o1G+HGaPShWNupwuYqkzjK2/qorIwtVbraFdr7YiiEmZQVsjfyrbK
 QHO+rNNhwrSrKSz0NLrq03fajIBLyMdrjbGyeHv1YLKNuq6DBbWOrTtcAxS6kfi6kYHZ
 HZsQ==
X-Gm-Message-State: AOJu0YzsUJnqXLcb87V2BxQmvMFJndnodNexPugBoV5XCQo4xr1l1bzv
 2DIQKAKlMxFMB4ilOXgugN1cI87RfrtdIb5KLOkWuJLZzGCupf8wLzmA7uSXrjtvR6AZr0OKzdR
 6zheiq+m+JSWkdykIxxr2PdI99zWu6Aw=
X-Gm-Gg: Acq92OFL8W7y19o40aSckNr25dHoqg58gCWwbub+XX45W6RoLqrlAoAoisg8gSKSftR
 VrCJX3/fUgh1G5RyERWkiQU0TVzSmjhf0z8EK9fDdevyp/tsaZeovoHRNUUhAIj879Vuq75N/I3
 g4hjdKLF9NCDxg9vnawgV4O5ZcnMqxtIm7xEVqJ2XOaBmTdvI+ebkM/jgvzgWDcU+PV2SB7DP3X
 e/KMSJaU+LKGq4y/8nquaPLAVypJciRvACss/LFUDgFkE/8Y1xuFo363IkWTZoHnRkw+rwwzwB0
 FnBiJ9P9K/HBOVHyuMWsmrsbsL69t7M8UeTWa0Bcy3eZwH8Criys/YZhO7js2Fvq0dNzAg==
X-Received: by 2002:a05:7022:688a:b0:138:63d:e43e with SMTP id
 a92af1059eb24-1384bb7c5e9mr3340297c88.4.1781545806352; Mon, 15 Jun 2026
 10:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <e0689a10-9cd6-4d74-a276-99f8f01c83fa@web.de>
 <e2023393-da68-4775-9f55-16363191328a@web.de>
In-Reply-To: <e2023393-da68-4775-9f55-16363191328a@web.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jun 2026 13:49:54 -0400
X-Gm-Features: AVVi8CfMO9SzD3O4Xa5h3nVjisRImAqG6YrgxabGoNCulRONqwvNst645q0TcYo
Message-ID: <CADnq5_P6aSFKefO+f3aofhfNh7kELEQWxid4EWgwAUr2saEh8Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amd/display: Simplify data output in
 psr_capability_show()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>, Chenyu Chen <chen-yu.chen@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Harry Wentland <harry.wentland@amd.com>, 
 Ivan Lipski <ivan.lipski@amd.com>, Kees Cook <kees@kernel.org>,
 Leo Li <sunpeng.li@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, Ray Wu <ray.wu@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, Rong Zhang <i@rong.moe>,
 Simona Vetter <simona@ffwll.ch>, 
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 Tom Chung <chiahsuan.chung@amd.com>, LKML <linux-kernel@vger.kernel.org>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Markus.Elfring@web.de,m:dri-devel@lists.freedesktop.org,m:alexander.deucher@amd.com,m:chen-yu.chen@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:harry.wentland@amd.com,m:ivan.lipski@amd.com,m:kees@kernel.org,m:sunpeng.li@amd.com,m:mario.limonciello@amd.com,m:ray.wu@amd.com,m:siqueira@igalia.com,m:i@rong.moe,m:simona@ffwll.ch,m:timur.kristof@gmail.com,m:chiahsuan.chung@amd.com,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[web.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com,kernel.org,igalia.com,rong.moe,ffwll.ch,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A641F688F68

On Fri, Jun 5, 2026 at 7:49=E2=80=AFAM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jun 2026 11:39:13 +0200
>
> Move the specification for a line break from a seq_puts() call
> to a seq_printf() call.
>
> The source code was transformed by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 4b09a740f205..6e6f391b640e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -1076,9 +1076,9 @@ static int psr_capability_show(struct seq_file *m, =
void *data)
>         seq_printf(m, "Sink support: %s", str_yes_no(link->dpcd_caps.psr_=
info.psr_version !=3D 0));
>         if (link->dpcd_caps.psr_info.psr_version)
>                 seq_printf(m, " [0x%02x]", link->dpcd_caps.psr_info.psr_v=
ersion);
> -       seq_puts(m, "\n");

Why not just convert this to seq_putc() and drop the rest?  It seems
more logical from a code structure perspective.

Alex

>
> -       seq_printf(m, "Driver support: %s", str_yes_no(link->psr_settings=
.psr_feature_enabled));
> +       seq_printf(m, "\nDriver support: %s",
> +                  str_yes_no(link->psr_settings.psr_feature_enabled));
>         if (link->psr_settings.psr_version)
>                 seq_printf(m, " [0x%02x]", link->psr_settings.psr_version=
);
>         seq_puts(m, "\n");
> --
> 2.54.0
>
