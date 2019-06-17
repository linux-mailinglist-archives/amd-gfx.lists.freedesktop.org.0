Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64948EBE
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4B089930;
	Mon, 17 Jun 2019 19:27:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB0D89930
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:47 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id a27so6943779qkk.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jqB6cuRd6O7X6NGgrsZMH8YLgz3iAJx7ZVi3oT0TwP8=;
 b=tHT5OgwRulzmelr5v4LM8o4HlcmzbG/JcndFXLIrQsPtw/DMoOU6o2aN0eNWgO72Df
 gqOYwZxbN3jIv/vTq1Xr8hYPS4J2axAwBUrkDe1sEyWC454O4RmSX3QMq8EuioWp+qPj
 ecVTZHo11DoJne6URn19JfBjetUsGk1clZ1JiF/Ai4LSZ2fb/VacUjE4OcpG+trN1Bdr
 ekOoYTPaIL7ySi/CcBSLBch/T4oWTGh0Xxt8GMxg/amGlqkHKGuQzc1XsLiOpgoz7kJ9
 +Y0Gn4pLe24QVKahP/2y6n1JQHFBAOYDazEzYRKkBCYEz3P2iXYvd3BY2x5BM/VC5lkg
 ciyA==
X-Gm-Message-State: APjAAAVLRTYHBx3Q6R4UUu6kAeeGLyuRmlwc8wnTpvyzxbDIU71C6MrG
 TIwLaZbd8/FeJNPkpIBJXjmqherHQLM=
X-Google-Smtp-Source: APXvYqw8rKjBYzatVCUFlB4zeGeLcD/awDpF6fW359U8LMnzYSf6e/6DgXQ4mbbpjsB+wAj1i7Ah0g==
X-Received: by 2002:a37:f50f:: with SMTP id l15mr72886284qkk.343.1560799666024; 
 Mon, 17 Jun 2019 12:27:46 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:45 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 134/459] drm/amdkfd: Allocate hiq and sdma mqd from mqd trunk
 for gfx10
Date: Mon, 17 Jun 2019 14:25:59 -0500
Message-Id: <20190617192704.18038-35-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jqB6cuRd6O7X6NGgrsZMH8YLgz3iAJx7ZVi3oT0TwP8=;
 b=hwAJNOwOhIAtAkgDpymaVj0wrgN2bt8/G7wRyK0LX0hlmiSWuIFx2qDh3PVCPoNcWJ
 UNUVD2t7ddRHagBzFbgRQMP/6IVYM656RgqCtfXjdIfx+tjY/asODMexBs5N82WflylH
 A7sRwJ83OyqVIP3I6vpi3t7WY12U68ZhBARsUxU61b70yAEovfEfbIeL8q58k3cFlQ1p
 TOof2o2MuqOsmT5dZ+mxEOLoJGcHtUTFC7L8lv9jT4UQRUbTEYR7gEeOOmFzlD9PUcWi
 PuXHFCKZbHHWlP7TaGMoMm7pm1xIZhTebRyp59224QeI8uTk5TRNa9IzRB34Lhqqt3RN
 NH0w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBhbGxvY2F0IGhpcSBhbmQgc2RtYSBtcWQgZnJvbSBzdWItYWxsb2NhdG9yLCBh
bGxvY2F0ZQp0aGVtIGZyb20gYSBtcWQgdHJ1bmsgcG9vbC4gVGhpcyBpcyBkb25lIGZvciBhbGwg
YXNpY3MKClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAuYyAg
fCAyMiArKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
bXFkX21hbmFnZXJfdjEwLmMKaW5kZXggNWVjYzZkM2ExYjA5Li4wNjUwOTk5YzE1ZjQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMKQEAg
LTcyLDYgKzcyLDkgQEAgc3RhdGljIHN0cnVjdCBrZmRfbWVtX29iaiAqYWxsb2NhdGVfbXFkKHN0
cnVjdCBrZmRfZGV2ICprZmQsCiAJaW50IHJldHZhbDsKIAlzdHJ1Y3Qga2ZkX21lbV9vYmogKm1x
ZF9tZW1fb2JqID0gTlVMTDsKIAorCWlmIChxLT50eXBlID09IEtGRF9RVUVVRV9UWVBFX0hJUSkK
KwkJcmV0dXJuIGFsbG9jYXRlX2hpcV9tcWQoa2ZkKTsKKwogCS8qIEZyb20gVjksICBmb3IgQ1dT
UiwgdGhlIGNvbnRyb2wgc3RhY2sgaXMgbG9jYXRlZCBvbiB0aGUgbmV4dCBwYWdlCiAJICogYm91
bmRhcnkgYWZ0ZXIgdGhlIG1xZCwgd2Ugd2lsbCB1c2UgdGhlIGd0dCBhbGxvY2F0aW9uIGZ1bmN0
aW9uCiAJICogaW5zdGVhZCBvZiBzdWItYWxsb2NhdGlvbiBmdW5jdGlvbi4KQEAgLTM0NiwxMyAr
MzQ5LDEwIEBAIHN0YXRpYyBpbnQgaW5pdF9tcWRfc2RtYShzdHJ1Y3QgbXFkX21hbmFnZXIgKm1t
LCB2b2lkICoqbXFkLAogewogCWludCByZXR2YWw7CiAJc3RydWN0IHYxMF9zZG1hX21xZCAqbTsK
KwlzdHJ1Y3Qga2ZkX2RldiAqZGV2ID0gbW0tPmRldjsKIAotCi0JcmV0dmFsID0ga2ZkX2d0dF9z
YV9hbGxvY2F0ZShtbS0+ZGV2LAotCQkJc2l6ZW9mKHN0cnVjdCB2MTBfc2RtYV9tcWQpLAotCQkJ
bXFkX21lbV9vYmopOwotCi0JaWYgKHJldHZhbCAhPSAwKQorCSptcWRfbWVtX29iaiA9IGFsbG9j
YXRlX3NkbWFfbXFkKGRldiwgcSk7CisJaWYgKCEqbXFkX21lbV9vYmopCiAJCXJldHVybiAtRU5P
TUVNOwogCiAJbSA9IChzdHJ1Y3QgdjEwX3NkbWFfbXFkICopICgqbXFkX21lbV9vYmopLT5jcHVf
cHRyOwpAQCAtMzY4LDEyICszNjgsNiBAQCBzdGF0aWMgaW50IGluaXRfbXFkX3NkbWEoc3RydWN0
IG1xZF9tYW5hZ2VyICptbSwgdm9pZCAqKm1xZCwKIAlyZXR1cm4gcmV0dmFsOwogfQogCi1zdGF0
aWMgdm9pZCB1bmluaXRfbXFkX3NkbWEoc3RydWN0IG1xZF9tYW5hZ2VyICptbSwgdm9pZCAqbXFk
LAotCQlzdHJ1Y3Qga2ZkX21lbV9vYmogKm1xZF9tZW1fb2JqKQotewotCWtmZF9ndHRfc2FfZnJl
ZShtbS0+ZGV2LCBtcWRfbWVtX29iaik7Ci19Ci0KIHN0YXRpYyBpbnQgbG9hZF9tcWRfc2RtYShz
dHJ1Y3QgbXFkX21hbmFnZXIgKm1tLCB2b2lkICptcWQsCiAJCXVpbnQzMl90IHBpcGVfaWQsIHVp
bnQzMl90IHF1ZXVlX2lkLAogCQlzdHJ1Y3QgcXVldWVfcHJvcGVydGllcyAqcCwgc3RydWN0IG1t
X3N0cnVjdCAqbW1zKQpAQCAtNDg4LDcgKzQ4Miw3IEBAIHN0cnVjdCBtcWRfbWFuYWdlciAqbXFk
X21hbmFnZXJfaW5pdF92MTAoZW51bSBLRkRfTVFEX1RZUEUgdHlwZSwKIAljYXNlIEtGRF9NUURf
VFlQRV9ISVE6CiAJCXByX2RlYnVnKCIlc0AlaVxuIiwgX19mdW5jX18sIF9fTElORV9fKTsKIAkJ
bXFkLT5pbml0X21xZCA9IGluaXRfbXFkX2hpcTsKLQkJbXFkLT51bmluaXRfbXFkID0gdW5pbml0
X21xZDsKKwkJbXFkLT51bmluaXRfbXFkID0gdW5pbml0X21xZF9oaXFfc2RtYTsKIAkJbXFkLT5s
b2FkX21xZCA9IGxvYWRfbXFkOwogCQltcWQtPnVwZGF0ZV9tcWQgPSB1cGRhdGVfbXFkX2hpcTsK
IAkJbXFkLT5kZXN0cm95X21xZCA9IGRlc3Ryb3lfbXFkOwpAQCAtNTE0LDcgKzUwOCw3IEBAIHN0
cnVjdCBtcWRfbWFuYWdlciAqbXFkX21hbmFnZXJfaW5pdF92MTAoZW51bSBLRkRfTVFEX1RZUEUg
dHlwZSwKIAljYXNlIEtGRF9NUURfVFlQRV9TRE1BOgogCQlwcl9kZWJ1ZygiJXNAJWlcbiIsIF9f
ZnVuY19fLCBfX0xJTkVfXyk7CiAJCW1xZC0+aW5pdF9tcWQgPSBpbml0X21xZF9zZG1hOwotCQlt
cWQtPnVuaW5pdF9tcWQgPSB1bmluaXRfbXFkX3NkbWE7CisJCW1xZC0+dW5pbml0X21xZCA9IHVu
aW5pdF9tcWRfaGlxX3NkbWE7CiAJCW1xZC0+bG9hZF9tcWQgPSBsb2FkX21xZF9zZG1hOwogCQlt
cWQtPnVwZGF0ZV9tcWQgPSB1cGRhdGVfbXFkX3NkbWE7CiAJCW1xZC0+ZGVzdHJveV9tcWQgPSBk
ZXN0cm95X21xZF9zZG1hOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
