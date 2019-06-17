Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425CA48F4C
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C882B89BF6;
	Mon, 17 Jun 2019 19:31:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A9F89BC0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:35 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m14so6943452qka.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/Zh7/v3tLzrgJnS200g1YbSBn7goMO7S+E98c1jcUQ=;
 b=AXwC/T3+sj3QxqSi6Jzc+4nAVyjvP/KwLDdtl5i8ICk83HKz2GLCzGkgNVZhxAKY4y
 jXFfJ+p/VC1N2lf45KaZ1QK4EGqTicjx/f2yKOFnPyvtzo1pfpBEQgT++Ot1tg3nCt2F
 B49fmGHmTHkXota9SrfFxE0zp+dC/uYEPCcikP3ZmHEcab/W22Ze76vr+WTjEoRKDlxK
 whNqlu65sJgtLciD5/taiklrk3aRaevxyazQJnMswoGt17MJ08qxDqwUuMQk8kBv51Fe
 4gnia743Wo4skGhj06ayokhBQHwkdAttNZPpc91A9yNwYu6NUxN7K+XHUMuPk1UqXY/B
 29RQ==
X-Gm-Message-State: APjAAAUe+sFWaNnc7WaJVXDEws5oOOKK8DgR1zvym3d8uq7Edqv0ylxv
 c7mmIuSozWvPJNm2BRSIuiW7c090Ttw=
X-Google-Smtp-Source: APXvYqzgHCqfZZOEH2Ln6efUs9RorZhsdqiyhlkfn5A8tO/ZQ8trOwatmGApSuyplGiybaItILXb8w==
X-Received: by 2002:a05:620a:16a6:: with SMTP id
 s6mr92118339qkj.39.1560799894089; 
 Mon, 17 Jun 2019 12:31:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 223/459] drm/amd/powerplay/smu11: disable PLL shutdown when
 gfxoff enabled
Date: Mon, 17 Jun 2019 14:29:50 -0500
Message-Id: <20190617193106.18231-24-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/Zh7/v3tLzrgJnS200g1YbSBn7goMO7S+E98c1jcUQ=;
 b=ZZDshzPjQkQwTfpF4kR6ly1DzBRQBz/QkQdFN2HXG+dM6wMcyJGBTqyLb6E3Vtq6rK
 MqBbm64dSqrUcbT9Jw/RZaX2xi5B7s2qPj+R9hRn5oC+SeOnOE7WtxAmbtOTIVZHDHd+
 w1uTJDdE9ciAOH1lvMFNGovxDTqkyInW89F58s1ZeRv3cpvmbNdGyWssffwo1n1uk8QP
 cAY+66iTIdlp6PdLwNr7/nw6kGkJLCz38cWdi/pivJGsJQEll7KjT1WGZtQqdfesN9re
 DHfgc1rpLX0NDhKxPEa0sSKpWINX3lEgSF5II1T39lKjavNpsjBw7Ce4l5BdQYrDb460
 u4Cg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCk1QMSBjYW5ub3QgYWNjZXNzIGNs
b2NrIElQIGR1cmluZyBNUDEgRlcgcmVsb2FkLCBkaXNhYmxlIFBMTApzaHV0ZG93biBhcyBhIHdv
cmthcm91bmQuCgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpS
ZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgNiArKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggOWZiODk0ZmVjM2QzLi44MDMwYzdh
N2VkYWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9w
cHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAg
LTM4MywxMCArMzgzLDE0IEBAIHN0YXRpYyBpbnQgbmF2aTEwX2FwcGVuZF9wb3dlcnBsYXlfdGFi
bGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJLyogTXZkZCBTdmkyIERpdiBSYXRpbyBTZXR0
aW5nICovCiAJc21jX3BwdGFibGUtPk12ZGRSYXRpbyA9IHNtY19kcG1fdGFibGUtPk12ZGRSYXRp
bzsKIAotCWlmIChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBfR0ZYT0ZGX01BU0spCisJaWYgKGFk
ZXYtPnBtLnBwX2ZlYXR1cmUgJiBQUF9HRlhPRkZfTUFTSykgewogCQkqKHVpbnQ2NF90ICopc21j
X3BwdGFibGUtPkZlYXR1cmVzVG9SdW4gfD0gRkVBVFVSRV9NQVNLKEZFQVRVUkVfR0ZYX1NTX0JJ
VCkKIAkJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9HRlhPRkZfQklUKTsKIAorCQkvKiBUT0RP
OiByZW1vdmUgaXQgb25jZSBTTVUgZncgZml4IGl0ICovCisJCXNtY19wcHRhYmxlLT5EZWJ1Z092
ZXJyaWRlcyB8PSBEUE1fT1ZFUlJJREVfRElTQUJMRV9ERkxMX1BMTF9TSFVURE9XTjsKKwl9CisK
IAlyZXR1cm4gMDsKIH0KIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
