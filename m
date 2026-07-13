Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z0D5OcztVGqThQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:53:16 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3078074BE9D
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:53:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=W3+jGADn;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0395410E542;
	Mon, 13 Jul 2026 13:53:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2549110E542
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 13:53:13 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2caf18d4904so7504805ad.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 06:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783950793; cv=none;
 d=google.com; s=arc-20260327;
 b=BblRHmmkoV+a8xxYFVO0qIoW05IoRLc0dEVvWagFELR8AEsYq/u8cgo/UYMYaoHXsp
 vJMA8Sr5LmVNvJFhuT6hdmyDMgwGhdVeKMLpBz0qiZ9zNo1l+meYokRBIiB/XtMqMfRz
 OYEc26UHIapct+6IQBTnGoBtDv8/3H/0R/s8m1nmflx6dj4rEUqqxh9FDpRUUujA79Dh
 m8a0F4IyGGfiVnSClFcRGCRBZ3xR1ekKYOj/nfB+JEUZD3mPT88/3k/AHsRM1TGXIog3
 WUPUqtCStuERuVA5GRW1qFRrLMN4hiyLO9Rr5Lbvc4pcSGPInOx1I33DObts8aU8p5DC
 hlng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6Ju7JkIl5UIVeq+e4m/4INBwT5l7DAudqFtY95A7Hsc=;
 fh=UCmQF1hYC+nU64AKGSmOqe7UwqTgX6L1hAWSpxYIIzc=;
 b=Fcq5/vPTZtJ+3ZNL1TywCDpJm1zUPVYTw0rXqG+hM3VjU6x371c4MBMPBgHwhGo7hh
 FpKCgr+zKtBE7tJ8rUl5znMC/mrIXxPFqSAh8tuYlDmFZmGgvf/zvkPUtpZoB8ZI/cgr
 O8EdcpVdfdn9dD4kUjeCOEg4kZMsu7NDhHdux7h2WUiKa9IvucPnInSwjOhsKTAsAEZ2
 WREWOfG/Loea3NED0nKixLj/7iVHbnGXeETI0SloEcivXWD0F6f7RPS0C10Pd37OAstz
 xQSKmvggILyJZWA71P5oEQ3ev9ZyZZ+RwzqjE2zVwtCxsLumEgvruw74x+1+QHfXF9Qn
 ZMXw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783950793; x=1784555593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6Ju7JkIl5UIVeq+e4m/4INBwT5l7DAudqFtY95A7Hsc=;
 b=W3+jGADnI3pPhNpCnq7ML35pTCqu5algQDOQAJS0qz7Wvsn2WsxNsXF514rITFqPXw
 dLmnbtAA2zPn7RWC+hDCdJvndwPCMgdg1i7+uIw4pLns0sVICZ+9B+x/e1tvIqRBMwHm
 cwomi+V+7Ho6bTGRCg+Q1MngNP5sDpTUEZGoNSPClsw9DiqtsTV4bje0QZIrRTTVNiRN
 pPl2MV0K/rLeRmCnTV2hdrb3j89C2qpkf38Cq/wn1AQDX38HnwklEWdA5+p94TbBrHCD
 CnC6+chTC0VE6zFnmkCuZLksrSJn1AhNWBMBoXiwyJPzvnReHdPBQAxP9JNN51/tF9d6
 WAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783950793; x=1784555593;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6Ju7JkIl5UIVeq+e4m/4INBwT5l7DAudqFtY95A7Hsc=;
 b=Xw5dz3E4Z1G8qOwyJEm+sPVeTJU+1dWVBJRA+Qcvr0mmpeULl/Gi2ktCTduxpZV9uj
 vLpIzL0oTWxkNt5cd9kjc1byUqJsuS8RL0+ZWNc/m88lRC6/OR4jbhDPofWV7yqc98m0
 8DXVKTuSLpzhVfku+X50MyQVLdxU9UVdgm+Ss8v6uXAoHzMRj9Faexmxl07uPxcgrLnM
 Tz0rEGK82dVKdoGfc4JDaT/rRxe6YQQRoltNYgUMKTz9qBK6Z3Bdk08dZWumLckI8JO3
 7/6ih5XUkelET4VZDLXese6z0vWhQw0+thxO0UkOgGrkczGFTU7UbkhO0lDe+ciJ2r2B
 GQTg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro/jU/KX8VfdP+0ujlem3yXkLIbhch/FXtPe5EW9kwORwYK9VWJed/rLQ9I+EnaF+KZN/UxW94W@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd+XTZhAaS+E0eQAD+bLLqdb5oQpTvmJShhqljdZB5NeCHYf8j
 ZyNRmQOGvvKs0jLXGRaEo41Nw1DmOcr4VmjiIc0wwpzF2GDFTfHr2AcXCe/Q8wA1wG1kAkQoiJj
 uA3uTcx6h8kf7775+9l9iVuPgkUErxtk=
X-Gm-Gg: AfdE7ckKknnnRNuOAMRhgXA+e0l9QsfFTVp9hm4iQYtSoD8xYegmaBTRrVEbf9z9/Ez
 fH0xg/sbEJKwAIDZohrbzS8ctett5GFWAXKYU9YU4ntTt0Tz8u0lR7St6a7MQd1XFbPhtnHMn8m
 pNtE3Y7WNKElIAlSe0SYVaE1ohbC+qP/x0fAyjvtE6/CfuEvxSbslq0EVFiL6gqVq9JpLQR7QSx
 XFKxslN70GGQgzKIiSqaGr5u9khVlIgB11zy+iBW69GDqBU5AHvz2vnQUwUffuCzwLzypCJLJrO
 Mi7JIJiCZDVpDi0G7OSH8OGIX1sDsm69c5Ovn6qXEWDzVtIGKtmNgi5845E=
X-Received: by 2002:a17:902:d552:b0:2ca:11ee:b002 with SMTP id
 d9443c01a7336-2ce9f16e095mr70950855ad.5.1783950792608; Mon, 13 Jul 2026
 06:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260711112108.8980-1-timur.kristof@gmail.com>
 <43c2ca71-c468-41f1-adbc-cc170109de14@amd.com>
In-Reply-To: <43c2ca71-c468-41f1-adbc-cc170109de14@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Jul 2026 09:53:00 -0400
X-Gm-Features: AVVi8Ce8WLyKNmn2oNsvvShbz1yBi5ACSZZs1_clI6r66K__7nIlFUw6cWjxGHQ
Message-ID: <CADnq5_PwktZb9tuUZ6sZX-=3wkQ_X56pmEUaswHh2k=fz6xQjg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: Print vmid,
 pasid and more task info in devcoredump
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, pierre-eric.pelloux-prayer@amd.com, 
 Natalie Vock <natalie.vock@gmx.de>
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
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:tursulin@ursulin.net,m:pierre-eric.pelloux-prayer@amd.com,m:natalie.vock@gmx.de,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,amd.com,ursulin.net,gmx.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3078074BE9D

Applied the series.  Thanks!

On Mon, Jul 13, 2026 at 7:09=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 7/11/26 13:21, Timur Krist=C3=B3f wrote:
> > These are in the dmesg logs but are missing from devcoredumps.
> >
> > Signed-off-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c | 7 ++++++-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h | 1 +
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> > index 4fd0df3aa70d..aaf091b7f9d0 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> > @@ -356,10 +356,14 @@ amdgpu_devcoredump_format(char *buffer, size_t co=
unt, struct amdgpu_coredump_inf
> >       drm_printf(&p, "kernel: %s\n", init_utsname()->release);
> >       drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> >       drm_printf(&p, "time: %ptSp\n", &coredump->reset_time);
> > +     drm_printf(&p, "pasid: %u\n", coredump->pasid);
> > +     drm_printf(&p, "vmid: %u\n", coredump->vmid);
> >
> >       if (coredump->reset_task_info.task.pid)
> > -             drm_printf(&p, "process_name: %s PID: %d\n",
> > +             drm_printf(&p, "process_name: %s TGID: %d thread: %s PID:=
 %d\n",
> >                          coredump->reset_task_info.process_name,
> > +                        coredump->reset_task_info.tgid,
> > +                        coredump->reset_task_info.task.comm,
> >                          coredump->reset_task_info.task.pid);
> >
> >       /* SOC Information */
> > @@ -563,6 +567,7 @@ void amdgpu_coredump(struct amdgpu_device *adev, bo=
ol skip_vram_check,
> >                       amdgpu_vm_put_task_info(ti);
> >               }
> >               coredump->pasid =3D job->pasid;
> > +             coredump->vmid =3D job->vmid;
> >               coredump->num_ibs =3D job->num_ibs;
> >               for (i =3D 0; i < job->num_ibs; ++i) {
> >                       coredump->ibs[i].gpu_addr =3D job->ibs[i].gpu_add=
r;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> > index 2371e20fc68b..63f27337c09a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> > @@ -63,6 +63,7 @@ struct amdgpu_coredump_info {
> >       char                            *formatted;
> >
> >       unsigned int                    pasid;
> > +     unsigned int                    vmid;
> >       int                             num_ibs;
> >       struct amdgpu_coredump_ib_info  ibs[] __counted_by(num_ibs);
> >  };
>
