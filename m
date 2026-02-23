Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KfQB0+gnGnqJgQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 19:45:35 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD717BB34
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 19:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A1B10E301;
	Mon, 23 Feb 2026 18:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hgQzTrjE";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF7810E301
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Feb 2026 18:45:31 +0000 (UTC)
Received: by mail-dl1-f50.google.com with SMTP id
 a92af1059eb24-12736a0147cso326791c88.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Feb 2026 10:45:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771872330; cv=none;
 d=google.com; s=arc-20240605;
 b=I04SrVlqVz1QHHxZOsXjf34ge1xfOsk2TQRbzGyzziJshPUJuJEASFy56VtxctA5vD
 dAo+Id44j5xYJ5h2Bhq0WLIX3UXcbQD0svGrNSV0+sW1W790pZW9GnUOUytIleQz4Kjp
 5B+8qQMEKKvXlPu5pROVTdLtA0vJY+TNHtI7rLZPqRLcg78MOmIp+fnCXrEVzL+69NNo
 BbHdHyZdDsP+OJ4jsO7BJpS+WiAwoQMugjYii4Qe8fLwfebGmsy/SoJaSrjYKVzGD4Kn
 8jJt2NDQGQekIit64U5dqBjfu6dK/2VwiSou5jf3fJ0uG93vufxGbwy29BaqBBtf8eRp
 yXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=u6FCLN2LqYstA/6d/j9xpKBWJM9wMTpnzZt6Z6HCI/g=;
 fh=ofQB6h77rBR4BbRySvIX/yVjXUpWgkiO3jj3gt2RR/U=;
 b=EviB3r/CVsR93r+ux+lSOJ0ZXTphgC2uVw6DbvZCh5c5c7lOf7coiCarFrxN70+zc9
 FJ0uxT9Eoj2sT14PM4YNDDxWv+ONv0+FsvnKpPuYmfzkaackFTjAQFBGnIzSB5SEtIUF
 Na+mtnTKNoYfiAYsZ/kdVdC6nIzR+9t6mpiwqeu/JuOFWoDMlXjLUfiiGBPIrbPpAfDc
 UUn5IKDx7GamZGaP8FTCqXh4xZTKufLFlQUdFgB2ZE2qmfCkkxrYoVvUZN3VAaeM4++f
 YBDhemXhKmWPabbwS4Zyg0DA95pULMN+KdgJbj3yN9ew/iIj59UlENcI+VJ/eo7zr2PH
 0ruQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771872330; x=1772477130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6FCLN2LqYstA/6d/j9xpKBWJM9wMTpnzZt6Z6HCI/g=;
 b=hgQzTrjEYN3CYMatnivbnwfvl8RsauAwzaiSc/XpfsmXU3f82aVD2MoCoFC6GGp1+7
 My6aqoeOoKLRkFdSzaa+TD6C5j7mF4v/AUoPVEn3Xood75b4/ZJMb2hCdd/tNFkqLa4i
 0GkEZgerU+1d5EsaMuILECNMSdJKBtihXoVhevW8NgjpejlTEgkNZyqocME/d9zjZeKh
 +dCtHX5gNcg6O5f5lAym65LWafRhr18CHfju1/x+uYROnd7YtiXtA+WUzhOKPFCcF1pg
 Gkv2elZXmoS884et0IKDKFU4fdDcfK74bU6zKlwkGIYGeJJnctsP31EsLiF21u4vsdiU
 X2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771872330; x=1772477130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u6FCLN2LqYstA/6d/j9xpKBWJM9wMTpnzZt6Z6HCI/g=;
 b=hg/PeW6l4e9xll5j6iYUZ7ywekxPwXqMoaCkqIQi/FNSiqIXUv1zyH9kXhruFsZ7ID
 Kp6TKbrCPPl5ZIpgHe6gvnKGWVCJ2SHCZjdH8f/PO183dhlvxNlDM+I4XIDjFJbASELv
 buPuy69x50OU5LnDzvCI0VDxER0ONuHdWL4YVjY/JVWJuyl1V/8XZCLNXMHXNCuAUVY5
 XC4pbp3d10WAbTLooDuxDJWu9DKZ0wn/YLFUr9fwHnlp/W6L9lsNJAFkI43j7QSpb9JE
 LWp85Og3aMyaC3R8Bg1wpjofbXiT2D/Utaqk5hvd9vrp2PiOs6dslPWpzaMzG3oYaVBE
 79Ug==
X-Gm-Message-State: AOJu0YyS1aGa1qez4gtsMRuZG+6FIeJUX3/wxv0vAGuOYrkLJTZ6maib
 clJ4zHsmvNZvXrsJo5oFVS7ejQGDWtcp97mM7sgnMM2Psz5mQtOmTpeqND9W3tmveQFzsERrYN0
 BpAdNmRMhLkP3RiVCE1mQObve0iaqs6g=
X-Gm-Gg: AZuq6aKIuLj0vE12LDnxLM9atyYXij6i8dleTdZHDl9e2MCUKvAHhqcPPDp3TqKSQ4u
 g0nxEBbgIzqbxFD0O37uOl3ohVfJQM41KhvXhFgoYpyhJYLEou7qHgpRhcbYKAk3qvjNufNtBy2
 hGD5SvSXLV+SWvB5sOIDNIQdas9ESEy8uWu5cMGt0lRFhbDYhegopoXqnjaif3mQJbZEiSLH3c6
 3evn1pErtkDRwHv+jLq2H+J7bajBweAYq3I0ZvHjjBPxYfUw6Z1iWS9QvziB4qa/qrlX4u+FMPx
 AOA2Dc9xBNpalMr3kkPLpo1WT7cAFc+Gps2wepTurZxPTSRGb2jZKUAHqSeFPOCRFC2usA==
X-Received: by 2002:a05:7022:521:b0:11e:3e9:3e88 with SMTP id
 a92af1059eb24-1276ad1a953mr1854586c88.6.1771872330116; Mon, 23 Feb 2026
 10:45:30 -0800 (PST)
MIME-Version: 1.0
References: <20260223124141.10641-1-tvrtko.ursulin@igalia.com>
 <20260223124141.10641-4-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260223124141.10641-4-tvrtko.ursulin@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Feb 2026 13:45:18 -0500
X-Gm-Features: AaiRm51QD3MVUON6GHUP535yCub2I_gEaCXBmq0DSDFYU0JI9TZPSyzELhLUero
Message-ID: <CADnq5_Or9jtGE6QtGR49jJ7MraL5d_7c3h+UHP5-7WxO+7Bz5g@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] drm/amdgpu/userq: Consolidate wait ioctl exit
 path
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>, 
 kernel-dev@igalia.com
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:sunil.khatri@amd.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 70CD717BB34
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 7:41=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
> If we gate the fence destruction with a check telling us whether there ar=
e
> valid pointers in there we can eliminate the need for dual, basically
> identical, exit paths.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Patches 1-3 are:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
and applied.  Still reviewing the rest.

Alex



> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 28 ++++---------------
>  1 file changed, 5 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_userq_fence.c
> index d972dc46f5a8..67911e6c552f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -971,32 +971,14 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev,=
 void *data,
>                         r =3D -EFAULT;
>                         goto free_fences;
>                 }
> -
> -               kfree(fences);
> -               kfree(fence_info);
>         }
>
> -       drm_exec_fini(&exec);
> -       for (i =3D 0; i < num_read_bo_handles; i++)
> -               drm_gem_object_put(gobj_read[i]);
> -       kfree(gobj_read);
> -
> -       for (i =3D 0; i < num_write_bo_handles; i++)
> -               drm_gem_object_put(gobj_write[i]);
> -       kfree(gobj_write);
> -
> -       kfree(timeline_points);
> -       kfree(timeline_handles);
> -       kfree(syncobj_handles);
> -       kfree(bo_handles_write);
> -       kfree(bo_handles_read);
> -
> -       return 0;
> -
>  free_fences:
> -       while (num_fences-- > 0)
> -               dma_fence_put(fences[num_fences]);
> -       kfree(fences);
> +       if (fences) {
> +               while (num_fences-- > 0)
> +                       dma_fence_put(fences[num_fences]);
> +               kfree(fences);
> +       }
>  free_fence_info:
>         kfree(fence_info);
>  exec_fini:
> --
> 2.52.0
>
