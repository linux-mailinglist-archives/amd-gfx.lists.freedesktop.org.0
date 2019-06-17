Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F3148F65
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E73589C63;
	Mon, 17 Jun 2019 19:32:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AB589C25
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:49 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m29so12266270qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yOhBJswBJ2zTIQ117ntW22D1hCrAdIEvPvVkF7AGLOA=;
 b=eZLMuIOOkNrbyWOng4yELp1CTHKMxE+61Ix3szuiAtBiZ0egoXoBkfQRdSSkY2Sp9t
 yBoBLL5ah2Nn0Cl+yLgM/XKLBg1tkAf9KQmmhognPEdgp5Z10qOOx1reF2xMhYhKhjHQ
 lzWrO2tq6ruk2AogP0ZYKndguPaibvt1ZtcP6junvaQeNc/uabnCZQKfVgBo29wgEOJh
 uGb24b3xY29CL7UW3LOke3sQxpywtNcMs95DkXRsCyyix6KMyr8WWtGvGLMOfh0t8hSJ
 hm8AnrIORWqj6Ypb+WeRCMIpUeR7oNqnt3qCbEcBfSI7GujjmI2gtRv5kkVZpCzARgml
 w+ow==
X-Gm-Message-State: APjAAAUdRsBrixHixN6zAuegr0s5DLZt4QjvNnjKK0OT+FOcKCX27gmA
 W2OnOJEtx7MboYV3uQiSoiO1YiAN2CE=
X-Google-Smtp-Source: APXvYqx8TBWqpiG8ovlorikmB5GFCPt6hKafESM+R1lPI/bVSx0F6dMGY7qXFT1+9fXL222Qs+jhRw==
X-Received: by 2002:a0c:afac:: with SMTP id s41mr23424965qvc.184.1560799908682; 
 Mon, 17 Jun 2019 12:31:48 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 239/459] drm/amd/powerplay: add function unforce_dpm_levels
 for navi10
Date: Mon, 17 Jun 2019 14:30:06 -0500
Message-Id: <20190617193106.18231-40-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yOhBJswBJ2zTIQ117ntW22D1hCrAdIEvPvVkF7AGLOA=;
 b=KHrNXt/hCZ8Yn9zMekZJck2Zqp3JHAMjEIBuHApme+XMyuWAT3cr3XrNTsRjij4GT1
 aPekdvQsXkse2gYP9b+Z3H8FPYpii1b2js/ZGB6seWuT0Qvx4IJ4f6MO0wFSBfuYjNCE
 4NSD8iLd04spL2PPbZTmhLuBgmCW/OzHSr9kIjhhblSfpBztc6ES0Ip4OVp08lrB/Mkz
 lz3TEA73nfi1bwfdHue28/2hX/jo5h8Jz4/kl8X1LPfj5MXlP7uWMDb9Fh2X7rG4fvJJ
 lqYO5rHFV4z3xVUIayN8xbyPpIEaOswQVTaGzuOzHxRYFEiX90PSkseAFdvjCQ/shJ3N
 bYSQ==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCBjYWxsYmFjayBmdW5j
dGlvbiB1bmZvcmNlX2RwbV9sZXZlbHMgZm9yIG5hdmkxMCBhc2ljCgpTaWduZWQtb2ZmLWJ5OiBL
ZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxy
YXkuaHVhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
bmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
CmluZGV4IDcyYjZkZTgzZTY2Zi4uMjJiNmFlOTMxMzdjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC03MjMsNiArNzIzLDMyIEBAIHN0YXRpYyBpbnQg
bmF2aTEwX2ZvcmNlX2RwbV9saW1pdF92YWx1ZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgYm9v
bCBoaWdoZXN0KQogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBpbnQgbmF2aTEwX3VuZm9yY2Vf
ZHBtX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkgeworCisJaW50IHJldCA9IDAsIGkg
PSAwOworCXVpbnQzMl90IG1pbl9mcmVxLCBtYXhfZnJlcTsKKwllbnVtIHNtdV9jbGtfdHlwZSBj
bGtfdHlwZTsKKworCWVudW0gc211X2Nsa190eXBlIGNsa3NbXSA9IHsKKwkJU01VX0dGWENMSywK
KwkJU01VX01DTEssCisJCVNNVV9TT0NDTEssCisJfTsKKworCWZvciAoaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKGNsa3MpOyBpKyspIHsKKwkJY2xrX3R5cGUgPSBjbGtzW2ldOworCQlyZXQgPSBzbXVf
Z2V0X2RwbV9mcmVxX3JhbmdlKHNtdSwgY2xrX3R5cGUsICZtaW5fZnJlcSwgJm1heF9mcmVxKTsK
KwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisKKwkJcmV0ID0gc211X3NldF9zb2Z0X2ZyZXFf
cmFuZ2Uoc211LCBjbGtfdHlwZSwgbWluX2ZyZXEsIG1heF9mcmVxKTsKKwkJaWYgKHJldCkKKwkJ
CXJldHVybiByZXQ7CisJfQorCisJcmV0dXJuIHJldDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVj
dCBwcHRhYmxlX2Z1bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7CiAJLnRhYmxlc19pbml0ID0gbmF2
aTEwX3RhYmxlc19pbml0LAogCS5hbGxvY19kcG1fY29udGV4dCA9IG5hdmkxMF9hbGxvY2F0ZV9k
cG1fY29udGV4dCwKQEAgLTc0NSw2ICs3NzEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBwdGFi
bGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsKIAkucHJlX2Rpc3BsYXlfY29uZmlnX2NoYW5n
ZWQgPSBuYXZpMTBfcHJlX2Rpc3BsYXlfY29uZmlnX2NoYW5nZWQsCiAJLmRpc3BsYXlfY29uZmln
X2NoYW5nZWQgPSBuYXZpMTBfZGlzcGxheV9jb25maWdfY2hhbmdlZCwKIAkuZm9yY2VfZHBtX2xp
bWl0X3ZhbHVlID0gbmF2aTEwX2ZvcmNlX2RwbV9saW1pdF92YWx1ZSwKKwkudW5mb3JjZV9kcG1f
bGV2ZWxzID0gbmF2aTEwX3VuZm9yY2VfZHBtX2xldmVscywKIH07CiAKIHZvaWQgbmF2aTEwX3Nl
dF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
