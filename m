Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tKjuNYDzVWoNwwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 10:29:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FE6752683
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2026 10:29:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YWMwjJ2h;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112D410EC7C;
	Tue, 14 Jul 2026 08:29:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FF610E54C
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 19:46:00 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so2883865e9.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 12:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783971958; x=1784576758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:subject:from:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=u6PelZAI+KFvbzb80jmL6OS+uw9J1USbd6jLA648u2k=;
 b=YWMwjJ2hOfCsChl2fOJIdjkSka1GdOZ12bezrRlCzw319KypcOf5PIW+wlgX9C8HV2
 +XW1UIwHrqUNpUwJqwxVtPeQkjrghiUCYOoL4cavN5IBGmxS6S8mELY4koWnZooVeCyS
 WtA2Zx/hEoVBdgfMw0EnuaX5YpG0s/CknNJzF1FsNufzmkeEQraJPcfsxMAUVYQckuu6
 LuGqDmRfoB9AzLUWoGb80Y2FfmBWadXXP02bNxnTV9aamgUTYiHXDo7JReXAIVfMSOEx
 fuKAKiMtLd1u8U+Smvk6TfnofHpPbNtToYYoKBIOPMM41GD3NrAyifNQZ05OwRc5cilj
 CviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783971958; x=1784576758;
 h=content-transfer-encoding:content-type:subject:from:cc:to
 :content-language:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=u6PelZAI+KFvbzb80jmL6OS+uw9J1USbd6jLA648u2k=;
 b=s0jdK8PLLYGC67iKNnoVAts3oV9oVF2tDQ+1GL2EE9hWDj5yrGBukkRgX/HzHUtOdc
 A9IfiBR9JymsJemtzZnqsR4bp4T1Ls+dM9fCWoOizbP6YKA2UXWmLE2u80v+8cvj4keT
 ZxCnF9+4wVOrmHxUAUPwJqqSaF8sem3TV+fYmudOPU2yJ04YoCa+Owb/2Kc3GiyPDnKZ
 bXV/W94g6QrW9wJmyfDewUW0jKm+RDs++xOOX2rz2+T4JvWqsZYuqPTWO++q3ZwNHk5x
 lyI5SZ/EI9hKycep5ydVeWJNcVBCtLsiHjHFQAEdgp4Wb9cAeZHYNBqYmI6ho2DIX76y
 gSHg==
X-Gm-Message-State: AOJu0YykQMEIpAusp94OnNaQhSglfVOYSe7lEL79TMfeWOOD0KUNpHKO
 wCRRduT0hL/6oLYfCvN9Ky2B2OrJrjDRjjaAG4IoBazEEudcqH+DnuVE
X-Gm-Gg: AfdE7clnha1ESBK75sQQLnDVzyEeyTkrJpiK9RNZzo1HIKLAPRGMKKQCQ2Ayn597mkn
 Zt1/naftg54SSeG+w1sQLVHfOkApiSxTgezSM+F8Xl4DvyQUD4fZ0CUqVJRyF6Uy37S/NsYOCDo
 4k6VoNxwtrJ2ANmD2UVnWB4iB7Sjt2wvoFIeChh5ILiM1TS6AloOR9bU6VG1pttHUYoW/0+hy/7
 e+9CWkeVSfTQxFCh0XIueqS4MT0JsXQx7XdpmzK5k9iFcVplFL8icebnONFV0z6Xx6WdZ7DGBBm
 4fM+LkRY1YhHgGtiRdaxe+HhuJIx/zgrFN6v4wY+hm+NDsgn2Hesi7o28JkHeCBHxL6yXdC48vv
 4KwOBfrgV0B42XpsjB4iAD9G0ZZlPcHkpeVMFqWz88coVZ16a5ui6BAGiDHZ7TFIJzW5GA7e2Eg
 yDHRh/ijNr6IBZbXE743Op6rULjajgrvfzyCefTHcle7YAz5F5guIqGRlwfXYNrukhatz7s07aO
 OKjkZp8sVR3FKKkxY3oEqj2DFmMwaLtqg==
X-Received: by 2002:a05:600c:1d0a:b0:493:c991:8e56 with SMTP id
 5b1f17b1804b1-493f887bc07mr108264125e9.4.1783971958168; 
 Mon, 13 Jul 2026 12:45:58 -0700 (PDT)
Received: from ?IPV6:2a02:1388:23c0:16c0:aa41:f4ff:fec6:26e2?
 ([2a02:1388:23c0:16c0:aa41:f4ff:fec6:26e2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2e0f165sm224718205e9.0.2026.07.13.12.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 12:45:57 -0700 (PDT)
Message-ID: <98fff9ff-f013-404d-9d92-aa1dd6160f63@gmail.com>
Date: Mon, 13 Jul 2026 22:45:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: tzimmermann@suse.de
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch,
 kees@kernel.org, felix.kuehling@amd.com, jani.nikula@intel.com,
 superm1@kernel.org, pierre-eric.pelloux-prayer@amd.com, mripard@kernel.org
From: Gravias Panagiotis <graviaspanagiotis1@gmail.com>
Subject: TODO: Open-code drm_simple_encoder_init in amdgpu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 14 Jul 2026 08:29:45 +0000
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:kees@kernel.org,m:felix.kuehling@amd.com,m:jani.nikula@intel.com,m:superm1@kernel.org,m:pierre-eric.pelloux-prayer@amd.com,m:mripard@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,ffwll.ch,kernel.org,amd.com,intel.com];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[graviaspanagiotis1@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[graviaspanagiotis1@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2FE6752683

Hi all,

I am looking to get started with kernel development and would like to 
claim the TODO item to open-code drm_simple_encoder_init().

I plan to implement this for the amdgpu_vkms driver. Let me know if 
anyone is already working on this or if there are any objections. I have 
a patch prepared and can send it over.

Thanks,
Panagiotis Gravias

