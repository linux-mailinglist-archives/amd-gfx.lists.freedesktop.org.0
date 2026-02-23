Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNiOAhJcnGmzEgQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 14:54:26 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927301776F7
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 14:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2600310E2EF;
	Mon, 23 Feb 2026 13:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="do1bepG6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7274F10E299
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Feb 2026 08:52:47 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-59e62834439so4504845e87.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Feb 2026 00:52:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771836766; cv=none;
 d=google.com; s=arc-20240605;
 b=kvJAcD5qY7BPqihk3KpDppFDD5PPzJZ3VWb42u2R7+DkC7X/lPNJm2nt8JSdB0lH7w
 qe6GRjaD3r4jftaPY1N/Xj26tQF72k2vw08Hj48v7x7vS3rvADwh0DBmHK8NX88+Y0Pz
 fUWwMvkLGREhUMUr466IkuRQGlqDzvtKO7haHcZlhZ1n9PxqDv/u213/xUxeeN2bUdbe
 LxELtmvh5KlpFT3JPNDoyj/pfIXfirKyHqQ/W2lTBDJxwZjeRuDuRxwRWKNz67e7IR5n
 at/dnBTEBb4RLvyDmw0qX1/wV8GhnLTtApEGSAcccCqkrSsDCxKxoR0UfeqrWxqMb2eU
 qs/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8pMfDy0/3VKLDSPvg/zhyqaAQb/EPG1TE7b+CoYlVks=;
 fh=/2aFyDbF4u/6Lu+E2H+ATN89M3ohUcrfgtOT+lFoJtM=;
 b=g/z4+pdF+kufhqbzf3JIMZtYvKSe1XyApsOzQSPsmzGQW0X89AmFb2hghDiD+2KQWZ
 sp9SmHXOI5G+FldeAHxXEqK0LbLqqCMIqWS0xhUaomeIYheGgbG7wys2Qlig848OKZFx
 PvVky8OlfG+hUg8qhLubi8mRPcS6U0b31AdrJedKUoUmsQ+War7EsjLiid+v0TTMLYsR
 3Y6CgjBnfMTtY20TpdX5TnSVikOF5aApWOWIsXOJoLbjalINuvEYAG29WTK/A2VdFRT1
 61PaYxHhR3xSJhNESNchECAcYao39N7gV0pNxkU81aGapAWniRIfbBYiorXbz1L4JRtH
 437Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1771836766; x=1772441566; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8pMfDy0/3VKLDSPvg/zhyqaAQb/EPG1TE7b+CoYlVks=;
 b=do1bepG6l4934cYzPhXZ4yAF2xq4A+OIPzrUQ1nkcbKme6TcjJ9OuhfNxifOgxT7qP
 +Ly4M4WTjWgMkIndSGJFiB06k49f6d0Dj9+J5PdudsuVooiq9UgqntOcz1Y/buqIiH+q
 1y/rjttFarMU2Wl3fwNB522qod/vfRAri0pyehyYMwrO48tS8Md73bpZ7UQ3Cvbxd7yv
 +cDzqA5teoU1VYcC0Ah7eyIbts+syOBPg2emVMAVGz16Hn8+6+5uT2jW4Sl1PKVdog4G
 rmn9/xMrfz5E07rVl+KpVCwexCYJFYXYCEJWCVzrWF0fw7isKz90DV3tGpLX04j1qqh6
 RdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771836766; x=1772441566;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8pMfDy0/3VKLDSPvg/zhyqaAQb/EPG1TE7b+CoYlVks=;
 b=kvVe8nDw3frDPcDnO7jnHxqN8hI8XtmDSaD4i3co8r8c54TLjBeRewhgl6XPyEgPxS
 UyBtR3hUzpFMPTLG0mC7QpnSIOnY2DhvyWkMsFvGxuAlSuh0sTCoPI/G3ZloQ1Jz53x4
 ARlHrYQN/Xn3fSdJ3xUvD+PRi1xsS2BTnL3MUcEHJ2FKxw1vCFRtXDobPfTh8YyeokkL
 lU2lH6RfC1mN/LZkyGw1wbxDqrApXll6x6LhvA96H8XZxw60vm5rV8Nio3Cp5jPLR3LZ
 43EmHP6E1VMqYhT1CZ3JsCEZrDuFej2n6eLgKpgci0eOaR7rFZO1fDmqU7Zmq7Te82sF
 yPZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtdpGRnOb4E8yDdP/9JjayWhjQ7AGwDsin0cCDcgqiKZ8wnktYsizN1j7gfALl612C1CmEdBCi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnKNNgNhfxKkwKOKS+VlsvdR1mqNpNnm12k2iThqmD9tUKcSzd
 cVuuBACFx8ZcvCRRiUde/1xa4y9I84VO5geOLOAYmDtCbln8nVYHOfdNj8htfUi8+M+gfqysraD
 Q14G2xKOQzQkPVqFel4lfYaREH/v0ZfzicszpgUjsuA==
X-Gm-Gg: AZuq6aKnCP7o5AYmkYg66c/aQ7IYeyg8JVgiCx/u9Sbb86yucHeBFMJ3PDvwr2OeNN/
 xfw+LsrDQjGffiQExFXgEJ2iXdATUNsaicAlboKR5iBvJHrrKBM8ZW4UXxGCY57cuyjXQA/wdC/
 BFPEonG/LMUv+XSbTmNzj59/MPfhpyx9BWZXrxebgBQn3jh+ARTqdak+LaTBowpPqNtvEc/yaaQ
 2WsKvinBrptNrMJ7c9N1rSIP9bbWAU3zg6Wtp4YRlIz80PdUkPJk5ORFomIn++Fs5sqBvYa4lWy
 pmpq9VOzI5OA8JN7Om2NI3gFVCh12oHWS5DIA7Ik
X-Received: by 2002:a05:6512:aca:b0:59d:eab0:c836 with SMTP id
 2adb3069b0e04-5a0ed87759bmr2452544e87.6.1771836765637; Mon, 23 Feb 2026
 00:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20251224144708.61167-1-marco.crivellari@suse.com>
In-Reply-To: <20251224144708.61167-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 23 Feb 2026 09:52:33 +0100
X-Gm-Features: AaiRm50yF5Rlw7ATpftOWtV82_eD6bFHXzpnPtJ1vlADkXKmkv3g_Y7y2xwA-KI
Message-ID: <CAAofZF5XSUVn+XW75rC76-Amibc3rZnG3QQhWxPtk7K6YMQx4w@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Replace old wq name and add WQ_PERCPU and
 WQ_UNBOUND to alloc_workqueue users
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Christian Konig <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Philip Yang <yangp@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Feb 2026 13:54:22 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:yangp@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marco.crivellari@suse.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,amd.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,suse.com:email,suse.com:dkim]
X-Rspamd-Queue-Id: 927301776F7
X-Rspamd-Action: no action

On Wed, Dec 24, 2025 at 3:47=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> Marco Crivellari (4):
>   drm/amdgpu: replace use of system_unbound_wq with system_dfl_wq
>   drm/amdgpu: replace use of system_wq with system_dfl_wq
>   amd/amdkfd: add WQ_UNBOUND to alloc_workqueue users
>   drm/radeon: add WQ_PERCPU to alloc_workqueue users
>
>  drivers/gpu/drm/amd/amdgpu/aldebaran.c     | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c   | 3 ++-
>  drivers/gpu/drm/radeon/radeon_display.c    | 3 ++-
>  5 files changed, 9 insertions(+), 7 deletions(-)

Gentle ping.

Thanks.

--=20

Marco Crivellari

L3 Support Engineer
