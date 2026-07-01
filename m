Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yAsJI6Y9RWq99AoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 18:17:42 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331AA6EFA7C
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 18:17:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Xb96jpZE;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12DF10EECD;
	Wed,  1 Jul 2026 16:17:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE75A10EECD
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Jul 2026 16:17:39 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493c1950518so4662285e9.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 01 Jul 2026 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782922658; x=1783527458; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p/Vq/KrrHT2PIV2udEWzP9xO+YQv9/+rn4f2pkOy2ow=;
 b=Xb96jpZEiNZ+hH2wjTL2QLppEtdXPxVoTkjDsXkDWyjI9eGI8ulBKYAHK9t2J/I5ZH
 yXoJ40jRzMOn3RApL3PPLerfu87Tb3fdQL+WLdkWiPtYeHwM3DIQzLUElB37ojM0eeo+
 D3M3WJWgS4Pa7XMvYXtyqrS2zvqaQUSTeEO66oEg6bSzwDwxx6/CvAinrscz1Q1PhY06
 gUXAlDNyFyWCVq85Zim7AgYqdEDUsgQ4fa3WQNQPy0RhEAvyQa+bh3RkQr3VuSwTPJaJ
 pFYHwMEzgjpXrsd4lOatnZ5riUHoYUlTQ0g1Zf8AbFJ1lUgf3UfbRZTdZtmVbU67I2+s
 T2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782922658; x=1783527458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p/Vq/KrrHT2PIV2udEWzP9xO+YQv9/+rn4f2pkOy2ow=;
 b=jiCW2BypZwhR/ZzP9l4B1yUgsBymsYRvF1kvYNTke31H0PsvUY+BA0nTz6YAbe2vrd
 41MCwRULYsHbqJVj9q0eZeb6qji24Bj5pQPQJAx2OOIjKRlUnfbfe6noKj862xzWw6i0
 0nkHCsXEXvs91S2v6bXQQx733MsTjtYID3ZPXjzglxJF9X7rjTHFWbnh2CT2lGTpvWYE
 BINO4eZ3fEGKxZLzwAMayOPPi03kpM7/HXh/RGCopqdvwHdRqzE/1dzeyiQERsq3unrc
 Is+nNLvyp7rDTGYpTSoJPe5XOBuqa+5QtRDfM9EJH+mNxIRstQ2Cdss5ntGWb8K3TEJ9
 Nz4A==
X-Gm-Message-State: AOJu0YxlvemxP3U4P24u93Pp7hGa8sNvZjcYd4MmkjHg9/jGQzb+R1AU
 K9eaDFNQK3kE1d4LGrKzFKry4+ncmuC+mm6qDTRU5qeRHGJSlGZpe5eS/CiQGb75
X-Gm-Gg: AfdE7cnf8+miCDY7z7qV7RmIvkFZo5gUnxc9GyTujFC5/rZtnJHY6wd1Abu7KJyMCrl
 zMC5DtAMgFTe7Tzd8lDulCP9iE9EMBwfFv/qC1UBQEyGhLQJqiLYMWG69tjiII8BnJazhG0zlIx
 KNgah7/s5ErUkmS0pg8ht6FCBtHWO6qPVzrS6djUzxQJ6RKjulRqgt8LDCS+TkjIL97h4QAKyP+
 /x0Mi+OgnDtwtBBtUbz1o/GzNbEWno/7HabfyTyFV2z0EzswMjVMzoNWchQVb56azBRexFqMmyR
 23OBMaMWHLujV/gBQ6OHi1IbXiN3HHvBNTOgEtNYuaFg3xz6nE4zE3W2fMNAuZyOSE+8uKbBRCI
 br3H7mmwFwA0KQcTXajdvQ9hwwcRyiEhZxy90Gv0DG9et3a1CXfrU/Sl2XM+I96QHQEOVeNDKdp
 XAOAvFlI63mp41JK/F
X-Received: by 2002:a05:600d:8488:10b0:492:3fb5:3a17 with SMTP id
 5b1f17b1804b1-493c4cf158fmr983035e9.2.1782922658219; 
 Wed, 01 Jul 2026 09:17:38 -0700 (PDT)
Received: from Timur-Max ([212.108.193.106]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be81df2asm168812255e9.12.2026.07.01.09.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 09:17:37 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>, Amir Shetaia <Amir.Shetaia@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Siwei He <siwei.he@amd.com>, Philip Yang <philip.yang@amd.com>,
 Mukul Joshi <mukul.joshi@amd.com>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 05/14] drm/amdgpu/ih6.1: Use IH_SW_RING_SIZE for soft IH ring
 instead of PAGE_SIZE
Date: Wed,  1 Jul 2026 18:17:12 +0200
Message-ID: <20260701161721.85681-6-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701161721.85681-1-timur.kristof@gmail.com>
References: <20260701161721.85681-1-timur.kristof@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmx.de,gmail.com,ursulin.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[gmail.com,igalia.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 331AA6EFA7C

When there are a lot of retry faults happening, the soft IH ring
can fill up really quickly and possibly overflow. PAGE_SIZE was
too small, use IH_SW_RING_SIZE to match what other GPU generations
are doing.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
index 9dbc20131410..f6fdb3a950e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
@@ -590,7 +590,7 @@ static int ih_v6_1_sw_init(struct amdgpu_ip_block *ip_block)
 	/* initialize ih control register offset */
 	ih_v6_1_init_register_offset(adev);
 
-	r = amdgpu_ih_ring_init(adev, &adev->irq.ih_soft, PAGE_SIZE, true);
+	r = amdgpu_ih_ring_init(adev, &adev->irq.ih_soft, IH_SW_RING_SIZE, true);
 	if (r)
 		return r;
 
-- 
2.54.0

