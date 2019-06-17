Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E0148FD6
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A0C89CF5;
	Mon, 17 Jun 2019 19:46:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFE189CE0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:58 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id y57so12329208qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Px4674uAO4ubGsjmGs3mEPWXYRy6p8aBgvaqdGwcHf0=;
 b=Sku+vnzDRiQXKcentWq04TDce+sFa5A6DkScotp2TcF4AYGxAESB006IlKeHBb+h6D
 0uRjwYAsDt9H7r9yqOjn/S8NS98PTX3yl88f0r4CQBWhowGzkV+C2got6/8+oDs95eQN
 LLSI0D/lH+UKn1tEaMMx6nZW+3xZg1BY84tlSlf/8Sa0cw+B+RkwYG8tDpNpDmvpR+1X
 YOqFWR3oelJizrtWhxogIHZoeNZkiTyZsDp+p9eidSJJPLoNlRCU/X+Qc5ArRs0WTKDb
 iZ3WgwqP9r1l7dtzyXS9FgtJ3tMrua4vbgzJekyGJKuUha262EDzILX0RfpYLPuQjLeo
 PdWw==
X-Gm-Message-State: APjAAAXMu78xp0HTOrWjdzbwkU8ss8tecrMK5BT+sZDJ5ONdq/E4El0a
 crwm26Wq7Ivx7kFl547LRcw0ynXLdsw=
X-Google-Smtp-Source: APXvYqy8v96MHUU91PnsI/wL74Q1ZrRnsD4B/9kaYlB47gcYpesQO21oK94CoMd1Fvex30mCWLpiGA==
X-Received: by 2002:a0c:c3c7:: with SMTP id p7mr21549110qvi.125.1560800757075; 
 Mon, 17 Jun 2019 12:45:57 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.45.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 306/459] drm/amd/powerplay: use pp_feature_mask to control
 uclk(mclk) dpm enabled
Date: Mon, 17 Jun 2019 14:44:07 -0500
Message-Id: <20190617194540.18497-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Px4674uAO4ubGsjmGs3mEPWXYRy6p8aBgvaqdGwcHf0=;
 b=hM2FpbPROX2JpPIg5HLlpmW9G9vjgZPkuWQ3ltw+IjpIIbK2YvhuWRMSdhBDbxqioy
 nrvdtbB1NpDQ6MK7Uai1ZfMcv5XegY4dWtWWZrGNNWJoy33Ydc+1a4B4LNVPzHx1MXEU
 Y0ixyxkXzd1Y2FaSI0bv1aFSkxlV59VyHDTOnvBuq3MLRoffHjUGP4dM8oOXmyOYZqA8
 5exB75QHSesjt8Mw1XVgAzlbH3stuGVMlwnGY2mXxekkktyLZWTnQyO/TBrM4bJEJuHx
 NSvVOqA+MiP9fb7xtVxxGL6/uOx0r5JJwBsQlEsjtVhJG13b9ngh8e9tkTEWsyc+k90b
 +Qug==
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
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCnRoZSB1Y2xrIGRwbSBmZWF0
dXJlIGlzIG5vdCB3b3JrIHdlbGwgb24gYWxsIG5hdmkxMCBhc2ljLAp1c2UgcHAgZmVhdHVyZSBt
YXNrIG1vZHVsZSBwYXJhbWV0ZXIgdG8gY29udHJvbCBpdC4KClNpZ25lZC1vZmYtYnk6IEtldmlu
IFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhpYW8gPEphY2su
WGlhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jIHwgOCArKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5k
ZXggYWYwYWJlZDYxNjllLi5jNGJkMTRhYjJhZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTMxNSw5ICszMTUsNiBAQCBuYXZpMTBfZ2V0X2FsbG93
ZWRfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJCXwgRkVBVFVSRV9N
QVNLKEZFQVRVUkVfRFBNX1NPQ0NMS19CSVQpCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9E
UE1fTVAwQ0xLX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RQTV9MSU5LX0JJVCkK
LQkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RQTV9VQ0xLX0JJVCkKLQkJCQl8IEZFQVRVUkVf
TUFTSyhGRUFUVVJFX01FTV9WRERDSV9TQ0FMSU5HX0JJVCkKLQkJCQl8IEZFQVRVUkVfTUFTSyhG
RUFUVVJFX01FTV9NVkREX1NDQUxJTkdfQklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVf
R0ZYX1VMVl9CSVQpCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9SU01VX1NNTl9DR19CSVQp
CiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EU19TT0NDTEtfQklUKQpAQCAtMzM2LDYgKzMz
MywxMSBAQCBuYXZpMTBfZ2V0X2FsbG93ZWRfZmVhdHVyZV9tYXNrKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LAogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfRldfRFNUQVRFX0JJVCkKIAkJCQl8
IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FDRENfQklUKTsKIAorCWlmIChhZGV2LT5wbS5wcF9mZWF0
dXJlICYgUFBfTUNMS19EUE1fTUFTSykKKwkJKih1aW50NjRfdCAqKWZlYXR1cmVfbWFzayB8PSBG
RUFUVVJFX01BU0soRkVBVFVSRV9EUE1fVUNMS19CSVQpCisJCQkJfCBGRUFUVVJFX01BU0soRkVB
VFVSRV9NRU1fVkREQ0lfU0NBTElOR19CSVQpCisJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9N
RU1fTVZERF9TQ0FMSU5HX0JJVCk7CisKIAlpZiAoYWRldi0+cG0ucHBfZmVhdHVyZSAmIFBQX0dG
WE9GRl9NQVNLKSB7CiAJCSoodWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0gRkVBVFVSRV9NQVNL
KEZFQVRVUkVfR0ZYX1NTX0JJVCkKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0dGWE9GRl9C
SVQpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
