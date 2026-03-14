Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA2cLtvOt2mDVgEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Mar 2026 10:35:23 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53762297156
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Mar 2026 10:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45A510E38A;
	Mon, 16 Mar 2026 09:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O8g7RhU0";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8877F10E06D
 for <amd-gfx@lists.freedesktop.org>; Sat, 14 Mar 2026 18:36:51 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-7987531082aso33962277b3.3
 for <amd-gfx@lists.freedesktop.org>; Sat, 14 Mar 2026 11:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773513410; x=1774118210; darn=lists.freedesktop.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3EyIw04VNf2/EW2NiDs8upBgwGalbT+ND5YbBpTgmE=;
 b=O8g7RhU00fXM1cZ1tT9s9jbfy7VeqrUQ7/ctM9KdLGOR8b/VI6WkuWtYpltdaxJtFG
 Gi9lALgIbHqIr2UkGhxtX1hz/iHxj9xcWP4gc9b+zSW0aSCRbxpq8fqvTiHLA/Hop/hR
 qJmo6hMl3yASBoNXMI/Vg6XrbCGIAQvawwq0dh8JgNqdO7utoUj2QgWAFOt0rsCYEVjh
 cr911kfC37v/iOBwT6BzGSVyg1I/bgbjtVteBF1PHGVAblCBCppe4yoGmxmwT52uEmGU
 02juHFaFtR0rBDtb/WsunNCTPR5+Jz6mrRLatbJRmAlvn3jxkhTG2ZhP5OS28RKo/YB4
 TRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773513410; x=1774118210;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j3EyIw04VNf2/EW2NiDs8upBgwGalbT+ND5YbBpTgmE=;
 b=ZS++4zgHBasVPjMVPNeDUVQxD6ranCcCqwbt0LVgyEP1Y4IhsA6UEYl5a6cUeJ1l89
 kvmGS2QLQid9K2vJxN4XhIPSYS9j70DdKUGPiGIo+EmhDevW5s4XFPmrhZrhNN0/hXmm
 1RvPip9tuoPlEvdR313TZrcO8cLjigMuqDXS80eQ5EJp5MlKges7K/bN9Ve6T+vESwHK
 BSC2ejJiFm4pHfth2EypVHsrbaY0IttL4QgKYmyfFqCDP05zlxi/67gBhIVaWK2R2o0+
 I9S83kOXO3HGUgDM/uggt8qIeasxXLJOpt060boW0aSGdNfsbUdFeJ8bAY0x2pFlZPex
 mqcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAlDStb+aBdDcJLeZZeuTr9zmS5d2eI4xCud/z6bg7kX+OEpKgRPkW2TAOKM9C+wTELdp9mv+4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyDtj648QsBM73BpCyFt0sWFsTZhe9PGWuBO2rBNDoYJg5JQAR
 1NNDfcgYfkEEd00QRgNFyilk81kLzH1zKO9EtN9IxiU+QsoTwq9Ltobb
X-Gm-Gg: ATEYQzzkfFS+32R8cg966t1nAFxuQeCypNsRG1yIlfZVJHtTYMEu5yCOU0RBbwhbHhk
 s/SnbicdnEz4+p6Oc1BQiXIHE2xdtp1+T+UCIQzYLZ3BQVSTwaBkAWcGydxLePsQ5x+PqZtM9Ib
 Pdgrd/xBUKqopyN0xgr+3d53u4AvkTu6YDXmXj4XqG3MVzMRxowXq1mwaxgxH3qvhABuCrnL152
 NCRQIA23nqmIFq5s6RatEPE6xlaC3JzGOARL9jCLna6Di77QMIKxXQnbjuo86HE22QlZ0q0Dovr
 ydQQu5VG2CgoZkh5Mk2SYRT9RHONLb0AVC8lL/KDmepTwzzIJmxuaAbj8lwje2VuycUaHnx0hep
 ZMi39I+2vOjV6K5r9s0a5i9F+CvhgOX7ABHXkj9QhtlrawhYa/rLjMSSDew1Sbp1e9jRO1FQDGu
 ichixWqQXKFh19iFGdBpxYeg+YGlMoWGSV4kDiNJqsbHt2HvxXWzTgX4KvT259i2PVJRvKou1QR
 NFSWP2/J0q5poJPKCuKk9TlameVp9DddFLLeJLe+wIW3haiKtrE411kgQynNKEzcMU=
X-Received: by 2002:a05:690c:260c:b0:799:266:83e3 with SMTP id
 00721157ae682-79a1c1d2627mr78752297b3.50.1773513410298; 
 Sat, 14 Mar 2026 11:36:50 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00:f174:ec69:bc86:8883])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-79917f2a268sm64415117b3.47.2026.03.14.11.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2026 11:36:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 13:36:49 -0500
Message-Id: <DH2Q18KB89QO.21OU5SNECAXMG@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>
Cc: <airlied@gmail.com>, <simona@ffwll.ch>, <lijo.lazar@amd.com>,
 <superm1@kernel.org>, <mario.limonciello@amd.com>, <cesun102@amd.com>,
 <Leo.Lin@amd.com>, <Jammy.Zhou@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/amdgpu: Fix resource leaks
X-Mailer: aerc 0.21.0
References: <20260225145154.14168-1-ethantidmore06@gmail.com>
In-Reply-To: <20260225145154.14168-1-ethantidmore06@gmail.com>
X-Mailman-Approved-At: Mon, 16 Mar 2026 09:35:18 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	DATE_IN_PAST(1.00)[38];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ethantidmore06@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:lijo.lazar@amd.com,m:superm1@kernel.org,m:mario.limonciello@amd.com,m:cesun102@amd.com,m:Leo.Lin@amd.com,m:Jammy.Zhou@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,amd.com,kernel.org,lists.freedesktop.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 53762297156
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Feb 25, 2026 at 8:51 AM CST, Ethan Tidmore wrote:
> There are multiple resource leaks due to ioremap() being used and
> iounmap never being called in multiple possible error paths.
>
> Change ioremap() to devm_ioremap() to fix all resource leaks at
> once.
>
> Detected by Smatch:
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4834 amdgpu_device_init() warn=
:
> 'adev->rmmio' from ioremap() not released on lines:
> 4539,4549,4563,4574,4592,4834.
>
> Fixes: d38ceaf99ed01 ("drm/amdgpu: add core driver (v4)")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---

Friendly ping.

Thanks,

ET
