Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SZOvJ2c8Vmr51wAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 15:40:55 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00712755446
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 15:40:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rYVzMl2y;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B37510E083;
	Tue, 14 Jul 2026 13:40:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FC810E083
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2026 13:40:52 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-c8612812170so565574a12.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2026 06:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784036452; cv=none;
 d=google.com; s=arc-20260327;
 b=bHUvWn0zrV83WMnm8opLkqM4JZNdEYds/p5PK6hRr3jQEojxIRvWTbnK6S34eFXAmM
 TrAVuDaGaySOJB6Vpi7HpaWNyPnJ5FRIlbIZEEzVjsDu+B7Ef8YO40cOw7zbQcDAJqPG
 v2b1FmO7dM3REi3lvLkGt59fqO+27a+s0ZFc7dnPIQm7jBwBahXlDt/4COjGZU8gQKnp
 r4lmSRDc2HvmmN+jUlmFmVVD9whQ8eg/S7rYOGGKMQLHbQ+ueMitnMVHUYj5BwD2hndF
 7wbbwHp8dVpLYUdpGcmuT115ZNNdhf02g9t2/htYwfRcLv3oVSL0urWl+OhfPSZeb4cd
 0foQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EoE5E4v2bdewNclLVvGL95rHSltmNPxTCq5J2nM8KwY=;
 fh=wgURtbBzqlebdSSt8uXLWxIynNc9WuwaTLLM18RxH+s=;
 b=JHt8s/PmYVOHK8dVZBfrKMEIUdheVbc7A4qkXcIEbJTWpGq+ijcalzohUOOG2s7LrM
 kceJV8lryw8tl457g6oNJ/W18epcLc6/G09A7xHakxZifnT06eJ+WGvABmxVDfu05/BK
 S6jxfVIxeKL0jLbQCtNIeVwbi+CjKjuJVq6oN/pjBgQRReLtgDMxSaH0orR18b0Xs8DH
 WNIKBntbiRJNi8azI5z22SUoLUNctnTzR4Uks8fbgBoFGotEUv02HaPm9c6tUCEsS3lC
 Rv7QB1ufh3gl60vbRmWR3mEX8Bb53J8mgulqprBfXe9OxnzT/btvB6k0pib0MY4Jj4ST
 Up8Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784036452; x=1784641252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=EoE5E4v2bdewNclLVvGL95rHSltmNPxTCq5J2nM8KwY=;
 b=rYVzMl2yVlEWd7bCVeR+p6TyE13xNb47PhDOHjDhR/tqW8MwMzPx4lYV6J9s6HV43y
 5y7Y6GoxCssakiKCAwGIVHmJFmaeckv3cllxNWdEGsYtPtfv0TNMngUNsO9me3JTmY5l
 D3WMFbzydtVEYw3VdaP7MxJu53UiXhQGMMyNio6HsdfIOK9LBHdQN/vGothwvD03HsXz
 eMXwbe7KaJbJJQfbYHRNzWQVP+NEb2+115OeCtM2V0oz/GpH6H1Ooxkt5lhYhcLs+UFC
 1BVqKKDUe7AOltUwUc8r8fS/kCin7gWAoL+bSpiZTnPIuAGu9DBLl0RDiwArFybVMdXX
 w08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784036452; x=1784641252;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EoE5E4v2bdewNclLVvGL95rHSltmNPxTCq5J2nM8KwY=;
 b=S9mdQZatiQANCi0mXcBipzwPjvD69Wm+nijPeljQKooqvaJRzeWST5VQEo/gOSy5I2
 pJAuUJbhJ6ISUaI937fVSAiJWg5lLRVVJZslLy0NFVIdkj6MuCPhzqWqTNOpeLU2nasa
 r415dADSQ5P1ncVNGp4KsTLQVQs/PyGx0w6aU4vtlW14ry5n79s0XD8AejNrKppCkek2
 fh6abjYwba/utImM4fndjHx1q9dothc8OII4MOOu0h59idqyqf302YFpv0rtnaFZrfR4
 H5CNSYZG9KHl9Z2LXRRRzPtt71a22gTMy62jwPV45eJfiTO9ag3EqJ5FNi/ry+QfVZLf
 OZvg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrE7A43m8J47Qm56tfqOmEzjXiFG/8U4zfbPTN+z3lI7Jl0+KU0VC4Tb2tT8sLp16yM0ql5uukN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqMy1t/dlmGWDLIA9ALw25tm8Ojb8DF8r1plTKOhOTlXQ3oBE0
 FNcaTGDQ1skhpnOdz88yocSFF9M3Dn7aWJDsGJ/W1PRUcTQAyuRNX+3manc4dRWbvVhRRG7Ve2j
 m554opnLQZf1HDsw8mvbSZXP6K2kUxig=
X-Gm-Gg: AfdE7cloMg/NMPWdPNiQqjE8td/SWYy8oV3dgyouT4siUiRhfiHDumThBZVOEgO5nK3
 HdqQZxyNNQKiaZu0KCfUWHQ6QQeKCV+fb47DZvwpOpuU73jandmTokMGbHgM8Z0D+xHSFJjlGLj
 dTfEmfnQzauFRoTEZ4nXkW9Q1CGlzaYbz4OyC7hNV9yP+5AYPJ9VyUaAv3XJ72n0zNWYFBbH9Zu
 nd2Qp5Wzu0bs2V4aFOz/KCCSPxjuZyEUInw/3QW2p+0wl1TzAjVlpbJE2iQcKIx6uQXKzE/ERni
 TLxoUCeaXUm2680+QoiADUEvlb0MuAMOK3XkWzPLlhACZjdcPa0fiFCsXys=
X-Received: by 2002:a05:6a20:7287:b0:3bf:95f4:dacf with SMTP id
 adf61e73a8af0-3c110b15ba3mr10056038637.7.1784036452154; Tue, 14 Jul 2026
 06:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <98fff9ff-f013-404d-9d92-aa1dd6160f63@gmail.com>
In-Reply-To: <98fff9ff-f013-404d-9d92-aa1dd6160f63@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Jul 2026 09:40:40 -0400
X-Gm-Features: AUfX_mwhHVjEGHPCpoUA7DyyfTA1nc_LbivSjVnxBUEMSxVShl02R1kThL-Za2g
Message-ID: <CADnq5_Mv_ojWBD-=g60EaGMV_HMzodNs2K8XC8n-Okm4fzr0wQ@mail.gmail.com>
Subject: Re: TODO: Open-code drm_simple_encoder_init in amdgpu
To: Gravias Panagiotis <graviaspanagiotis1@gmail.com>
Cc: tzimmermann@suse.de, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, kees@kernel.org, felix.kuehling@amd.com, 
 jani.nikula@intel.com, superm1@kernel.org, pierre-eric.pelloux-prayer@amd.com, 
 mripard@kernel.org
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
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:graviaspanagiotis1@gmail.com,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:kees@kernel.org,m:felix.kuehling@amd.com,m:jani.nikula@intel.com,m:superm1@kernel.org,m:pierre-eric.pelloux-prayer@amd.com,m:mripard@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[suse.de,lists.freedesktop.org,vger.kernel.org,gmail.com,ffwll.ch,kernel.org,amd.com,intel.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00712755446

On Tue, Jul 14, 2026 at 4:39=E2=80=AFAM Gravias Panagiotis
<graviaspanagiotis1@gmail.com> wrote:
>
> Hi all,
>
> I am looking to get started with kernel development and would like to
> claim the TODO item to open-code drm_simple_encoder_init().
>
> I plan to implement this for the amdgpu_vkms driver. Let me know if
> anyone is already working on this or if there are any objections. I have
> a patch prepared and can send it over.

Someone already did this last week.

Thanks!

Alex

>
> Thanks,
> Panagiotis Gravias
>
