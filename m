Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9qdnHUQ8MGoSQQUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 19:54:12 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495C688FE9
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 19:54:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=A9v93ZkL;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE8310E511;
	Mon, 15 Jun 2026 17:54:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A2810E569
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 17:54:06 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-304d3d3d8f8so438709eec.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 10:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781546046; cv=none;
 d=google.com; s=arc-20240605;
 b=N74gOHYsT9djSFr/K9N4z7M11VcjRvgIGfGY3f771eLdjetiFccuegob2QYqHd52if
 nVE5TteuUS8N7MpPSdWWvq+thR1yGtD4FJp7oamHEaIctScgSb591YA+HlHOqjEm9oA8
 1XAjyVFljvklqOZaCtEMlUrCC4kN7F3jRoE0WnWEHggdXBs2wTWh6oIlMOTiVUZW1xSF
 VX3XpLUukjaHekzWmZaZ9tbtwm58vDLA0f4l1G9WQqmlt7HIgc/tYIqszYllLxVqzCXn
 0TtbmK3nWRXXAp7+LGk1CRibH7zkp6nrMin83jvRUJ0dfd//KvhMGKBbhjYEjG+zu86t
 gvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9Rqy3CrWBr5mXZd21QMPU6BJ30DbF1dOpUcQYTCdhx0=;
 fh=8NZK/li2IV6I8S/rS1JLlv99vfsCN11tCzFwSSRu8c4=;
 b=iQLljBUWF7JqyVmQlbb8ICUBXm58Uxk7yrsTXwezQ3/7kPzp0ceMdC6Rxzu2g6bs3j
 O9quZlDD2W9eJa0ILnnJqkRyx9R7P6bal0I8y0VcJ/mp82PIiTX2IqaxF5BRsoCuXx3B
 7pINP7UDc9hpRXzK+dXr9q/Zng1hsNN6Tu7zAv/LJXLduu//rn52Jjb/RozEpvku8aEs
 TJ9iRjPDz7cpXePlZ5KI/gqsE9jxcR5F/p6Q95kz4i42iiqWUVs5GzZA+6SiVje3C26T
 nsVp7j9CscBbihxrurxcMWDw1+JUIY0ybxxTiK3+uLfGMu3D/zUdLnMtXyoZzRQDy64B
 zlvQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781546046; x=1782150846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Rqy3CrWBr5mXZd21QMPU6BJ30DbF1dOpUcQYTCdhx0=;
 b=A9v93ZkL1JXCrZLCLp+kilr4+5swFWxF5esqbMSYTea+4n+eQ4TY9056FTUt4Aztgq
 jButYOx+1rbOEX1aAP9F6eMEwju6xf0eiotmgS9Qg7LteWoCgVyolNSHxfkGRHh/tVnB
 tSyAXssnGL9mXO5j1/8qcrzekvoAb2VK9y/F/HACHuY1GFoj/a5i01qWy/MAz379D8ij
 K5L4FXAaDwnKdu8tAT7w3lkfCsDHF1R17OpgQoEZRAvEEt8ktB+1GaFay0KdO+0033aG
 0XFw43mk/dHd/XsTXvP2Ai/5yJaAvB/8ahwyRkLGx0ItIFGjeRpXiZGj8eRCJHMWLBlI
 gZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781546046; x=1782150846;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Rqy3CrWBr5mXZd21QMPU6BJ30DbF1dOpUcQYTCdhx0=;
 b=aEYpJivDFDrH1Ue1hE9huIuXEyKAUAh7bft0C6WKjo1jhxZPRxmZBvciV7tqDrY/Ed
 Ll/7ukbnYNAiA1C7Rt339R8T/NeP9uNfF792LTLUOZVcFoMfVtDCcqEFHvITtejLBT5M
 /KOoQuXBCTapHJXilKlIdHIbYjja7mguzOEVmoPh8fikc2s5HcfZBK7QfitjVvYtk6+5
 M5cXujKumnfuRlY6ZIAq2GfyLYpzSd1ubNaL2cUPNND5FbtsOiM2KHmJf3oA+h7J1v1N
 /l6y9X4GJs+oLz9wwm/vZ92tG/tiAZcDL61AYHj6kjva5xeLTp+Bj+Qnk/Sv/OunFjCU
 KJZg==
X-Gm-Message-State: AOJu0YzUWbt6BDF2TbvyL1dTDZ41oPbWI7vdF+JC2Z9WWt0/pEeuN4t0
 tLzY2OeA4rqj7b50IJ4C/ULV5kDOVr1FaExWLmDBihIhhPca2bhf38gsPUnpl6oY7gVwiI+/SnA
 Kij0KK3GPzlmNhb2C0ZRmGNjW9+J+QRI=
X-Gm-Gg: Acq92OFhhIKY2UVkTApHkZPFh6oAeRfV5BJF8nL3eP42ACrGDkx+7RKH5xrfkieiJrd
 iELN6Xyvm/E0pVqg2hWeP1qiLoiQMoMZarY7rz7V7a2U3/bK2aIiyLOTenyxt5ykUUSd8tPDmyn
 YoHa5w520VT+RLqb0BnVRVAzjvsiOk9w5HyhOC7WKVewYd2ckP9KMm5/OiZZxJJlF+iqvQ8PIpg
 9IiovYa/ZyuDkAxKBkmc97xS2xSB/CckwxV5asNBNQuzuPnsWakoiBUpe+uP5EhNXeYJNTzTdvg
 Bx5XYpeGyAgA73bS+UdOXgxxZOMAbcA3lw5R5QLnaC9St1xWfMMvDNmRciBMngXGpxwZdvyHy1h
 kjerC
X-Received: by 2002:a05:7300:2d07:b0:304:cec4:dbdb with SMTP id
 5a478bee46e88-3082008977cmr3599528eec.4.1781546045858; Mon, 15 Jun 2026
 10:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <e0689a10-9cd6-4d74-a276-99f8f01c83fa@web.de>
 <da65ea0b-81bd-4109-89cd-f4a5120edba0@web.de>
In-Reply-To: <da65ea0b-81bd-4109-89cd-f4a5120edba0@web.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jun 2026 13:53:52 -0400
X-Gm-Features: AVVi8CdqwiWNBPSphn3J7yyMq6FkhbfPshSymt8PKr3c0v0L9dqT3Suxzi8nKmw
Message-ID: <CADnq5_P0WSMb1ALbKO-mqRWa+Et3Qe+04um_r0B-cDdxiYo0nA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/display: Use seq_putc() in three functions
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Markus.Elfring@web.de,m:dri-devel@lists.freedesktop.org,m:alexander.deucher@amd.com,m:chen-yu.chen@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:harry.wentland@amd.com,m:ivan.lipski@amd.com,m:kees@kernel.org,m:sunpeng.li@amd.com,m:mario.limonciello@amd.com,m:ray.wu@amd.com,m:siqueira@igalia.com,m:i@rong.moe,m:simona@ffwll.ch,m:timur.kristof@gmail.com,m:chiahsuan.chung@amd.com,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[web.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com,kernel.org,igalia.com,rong.moe,ffwll.ch,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0495C688FE9

Applied patches 2 and 3.  Thanks!

Alex

On Fri, Jun 5, 2026 at 8:09=E2=80=AFAM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jun 2026 12:44:01 +0200
>
> Single characters should occasionally be put into a sequence.
> Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D.
>
> The source code was transformed by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 885e9b7bc27a..e45fa6e97fc6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -606,7 +606,7 @@ static int dp_lttpr_status_show(struct seq_file *m, v=
oid *unused)
>                 break;
>         }
>
> -       seq_puts(m, "\n");
> +       seq_putc(m, '\n');
>         return 0;
>  }
>
> @@ -1081,7 +1081,7 @@ static int psr_capability_show(struct seq_file *m, =
void *data)
>                    str_yes_no(link->psr_settings.psr_feature_enabled));
>         if (link->psr_settings.psr_version)
>                 seq_printf(m, " [0x%02x]", link->psr_settings.psr_version=
);
> -       seq_puts(m, "\n");
> +       seq_putc(m, '\n');
>
>         return 0;
>  }
> @@ -1266,7 +1266,7 @@ static int hdcp_sink_capability_show(struct seq_fil=
e *m, void *data)
>         if (!hdcp_cap && !hdcp2_cap)
>                 seq_printf(m, "%s ", "None");
>
> -       seq_puts(m, "\n");
> +       seq_putc(m, '\n');
>
>         return 0;
>  }
> --
> 2.54.0
>
