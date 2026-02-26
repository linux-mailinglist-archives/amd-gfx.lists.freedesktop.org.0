Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMkRJ9N6oGkakQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Feb 2026 17:54:43 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91061AB52C
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Feb 2026 17:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA5410E9D8;
	Thu, 26 Feb 2026 16:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bsecA1zQ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com
 [74.125.82.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A82810E9D8
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Feb 2026 16:54:39 +0000 (UTC)
Received: by mail-dy1-f175.google.com with SMTP id
 5a478bee46e88-2bda3b4318dso83092eec.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Feb 2026 08:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772124878; cv=none;
 d=google.com; s=arc-20240605;
 b=jkRQ4ORfXe5jvG1hTpP88QG2MntRC8s+pWx9ONmIb3T6jIJU+HGj8718i1HbUcpJLU
 6TEG1O01Ehcv3lOSj9a4u0ovAIdjX4fQFAre+ou5Xg4U0PcTyLGZeopaJIolKvWAlwvk
 JK2U0K/JmdKAkY30O8EqkgWworxiCXwXTN2YuInP7BYgTqXPfE+cjCOr5F6t1DjtB2hz
 wmUliDCuaQKdzNERtM7HvZMFbdKVn9Dwli6an7dK7NsbG3WLY4tsch6ew5lH6vry/JV+
 GtiiMIqiCoEohtGZhF9927Xg7Eb7y8XUbSoq2CtD7RZKCUECU+ZONf348RXXVaR5xfyE
 lChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Up3sT8qjuR5kM0SPkhMO2u8EAJVJK4TECaFQv8JLTOM=;
 fh=+JyG5JBvSeunIIwyQbZAlEPaka/uc/yMgD64kkAO84M=;
 b=ksKW05a6oAIZcxFyCxiQxTvzlqpt9+iBFuqSdmjXksAfKIXkEl0rVllwTqhFu3qjKc
 wx1/4yH6DQlv9KuzJdE77u6rhasPv7fzPuPrCli2BixIroJszFZdq20XXVZy0az2wdvc
 qKkIS9IJlj2OTKltMoRSN0tXSNpuL+y52Gj5BCoHIcjaoU3lAbQJj2e8sLsweAPJOXEZ
 EjuJmMEH/J8mi+eryevvUeqKdXpsyf+umkC6oAIz5STjn+6MUR4rtLxWUWosnbiNaF23
 sUyr+S8N4qrKnTSJqKRnw7d3gcyp83FUz43UDqDK541rA500dBoCRGpxrHWbRBW6irfM
 kqxA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772124878; x=1772729678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Up3sT8qjuR5kM0SPkhMO2u8EAJVJK4TECaFQv8JLTOM=;
 b=bsecA1zQKJaORF7opFUhwDHK8/F5CmhDrs4cMTf8kCB/Qd9A7IO3ubFjBuRBOk+0IE
 ETXIJ7lumShjWf0huZt4fzbO2tHzY47qsoiOXMcSWqV8LBikPRGIsqsnoRAS5koi1QcH
 onPd7O5VOlch3YfSjmt6/BZjlH7Sq711fOgeXsvueGaiYsXDOB+FTQucZGY/ITlzeihK
 M0/xlWEjJ6idR4Ecx0HDt4RQ2CDm9/QC1R4KFDVjBdJu3/dLNfNhtC3/feu+LwXwE3us
 AB/A3VIayIWQmSAYxE/SsiDLJ01DQeFcW8+3YgPOcjhWpXbhIHRIOPKer0dLB3kzITPz
 FhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772124878; x=1772729678;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Up3sT8qjuR5kM0SPkhMO2u8EAJVJK4TECaFQv8JLTOM=;
 b=Jqb/7AsPkmadyq55QZqcpBGJmQqdewUPBdXcTeSSBT1857jGOt0o03M2ypMtkbG3i0
 LS7GxPATafuQS7nz87BrDVj+4HgS/GVYpVW3twwMpuwfDg7pwmCPLD9zsD06buK3FzVh
 HduwgyTGds88DjGXM+UV3Ma2BDy+7v86UkadF4DkxSOeuZmvpPA09JEz1PkfHE4ybF9h
 QNyX5ytriqkdiX4wxYUe9UN/moW9O9X/HydXwtbZaSFBrOhdrBXUjQpalarF8wkXDtRV
 VuSeOLSRnxS+xtP2TmzHhZzyQWNItpIzEiNShy3r6IhhzH8/Td1UI5hBX1VfJ8k+5PxV
 f0Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3QMiHQ93eDDD6dAgCY4olJhaCd6O1mOUkOJK4e+CpTNMSRzXkfmZEeIcaAv3GOwWck2SbFTUh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWS6n92NP83AWoaqI3r6rnWV/TgEL2yuo5tF2rQSINfvWtPUG9
 E+gkQsHajCJCQnDIC8hdJbRH6h3JimmV66Eqd/HQWtokEJP4cp3jnQuuy1M7CHy0z+1iGNbmPSZ
 4YIeMrzsijsRS+EAkpj6W5FAzNRr0ITU=
X-Gm-Gg: ATEYQzzdcgnuEHAZVC+IsmpSbo3PRj+vZzCoxdcwD2KsFB0vabgTJttD++EQzl0Nmbm
 IkGu+eHc+Xzt6jwNktdKpLYpb01U8xKWbLyJCk++ubflFhwn2hG4GwW8icW1jncOeP6bpT9wWTE
 j7O4akZZNKOdzkOfGV65QJzq3QOR1mA+W2ade4q6MnmogE5McMXqdbKbP6Dyte+6QDD+o6HEkg1
 4DAW1EvHZm9CmzEFoasnBublU/DSbzH79hy4mID7q5X11nyQrEI+H84aSm9ZPRRLFMV+70UUsCy
 oNbhcvlv3FUY06aon+tmN284av7NxtK32Q8Ur6jHo5Gg0OFEiMCnyJnUfPIsUQlOBNkv0g==
X-Received: by 2002:a05:7022:f005:b0:11a:43fb:58dd with SMTP id
 a92af1059eb24-1276ad3bcd8mr3975440c88.5.1772124878272; Thu, 26 Feb 2026
 08:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-7-yujie.liu@intel.com>
In-Reply-To: <20260226030038.1182961-7-yujie.liu@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Feb 2026 11:54:26 -0500
X-Gm-Features: AaiRm50FIm7gW9ftKbXM9mUDFZF-JB2g7m56NgkO01zsGUV36mqPkWnCPIpQdvQ
Message-ID: <CADnq5_N819Zv-dQU_rswGDBdt7wKB+fCgFDLswbLgbwhz6J2Sg@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/amd/pm: fix kernel-doc warning for
 smu_msg_v1_send_msg()
To: Yujie Liu <yujie.liu@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kenneth Feng <kenneth.feng@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Asad Kamal <asad.kamal@amd.com>, Yang Wang <kevinyang.wang@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>, 
 Gangliang Xie <ganglxie@amd.com>, Candice Li <candice.li@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Luben Tuikov <luben.tuikov@amd.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:yujie.liu@intel.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kenneth.feng@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:patrik.r.jakobsson@gmail.com,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:pierre-eric.pelloux-prayer@amd.com,m:srinivasan.shanmugam@amd.com,m:tvrtko.ursulin@igalia.com,m:sunil.khatri@amd.com,m:lijo.lazar@amd.com,m:asad.kamal@amd.com,m:kevinyang.wang@amd.com,m:Hawking.Zhang@amd.com,m:tao.zhou1@amd.com,m:ganglxie@amd.com,m:candice.li@amd.com,m:YiPeng.Chai@amd.com,m:matthew.auld@intel.com,m:luben.tuikov@amd.com,m:ville.syrjala@linux.intel.com,m:michal.winiarski@intel.com,m:michal.wajdeczko@intel.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:intel-xe@lists.freedesktop.org,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,igalia.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E91061AB52C
X-Rspamd-Action: no action

Applied.  Thanks!

On Wed, Feb 25, 2026 at 10:19=E2=80=AFPM Yujie Liu <yujie.liu@intel.com> wr=
ote:
>
> Warning: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:415 expecting p=
rototype for smu_msg_proto_v1_send_msg(). Prototype was for smu_msg_v1_send=
_msg() instead
>
> Fixes: 4f379370a49c ("drm/amd/pm: Add smu message control block")
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd=
/pm/swsmu/smu_cmn.c
> index 6fd50c2fd20e..c471c0e2cbd1 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> @@ -405,7 +405,7 @@ static int __smu_msg_v1_ras_filter(struct smu_msg_ctl=
 *ctl,
>  }
>
>  /**
> - * smu_msg_proto_v1_send_msg - Complete V1 protocol with all filtering
> + * smu_msg_v1_send_msg - Complete V1 protocol with all filtering
>   * @ctl: Message control block
>   * @args: Message arguments
>   *
> --
> 2.43.0
>
