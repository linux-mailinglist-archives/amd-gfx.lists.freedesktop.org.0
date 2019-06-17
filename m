Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13E749054
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AAA6E048;
	Mon, 17 Jun 2019 19:50:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213BF6E047
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:10 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id t8so7012561qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gZ6QM/KKMvvAPl6HgxyWX5y16F483vS//B/yVJKKzRI=;
 b=p75JxF+UGzd483B4OXUMvlMtBToR1DZXV6kSM3BRNcXbZyMiTo+8hakNqoKCW2n6NR
 zP9Z5pULfoMssWIhYB7nNNEwfcIy52JWY0GOHmfWn0nKxddAuJFA9N2yI7Mh/VWIuMZB
 da99d3dVXRTt88nsBLc0BSMW4JE4KfhBlt60ELy5ldkfKio8xZY9aQob/VSwOG4Tactk
 eKK2GplMqQV0J6d+Vy5rXnc4b7dkkNQr76zdD2XsWDEee3FIICUaD80EKb3DDraM/847
 8wd/VuNJlykIcRK4bMt1Xps+lcQ1ILJX3xkQEf314tOpUSLSfwdb5paaj2lJB3KLdrKw
 +8qw==
X-Gm-Message-State: APjAAAWUhIvyGEwfn6cBMcWGqwCVTMWZ3F7lKW1RhwmMh+dHyAl5EM7i
 UNYR+wJXyVZJtXADLXpyfbM9f/0T1wD11A==
X-Google-Smtp-Source: APXvYqzjDvZKO914gmUpB86+5rYUSIwJhx+FSL+uvy5i0ptY+o2SOc/faMbE0FTZloB+7yLC6Gmcpw==
X-Received: by 2002:a37:9f0a:: with SMTP id i10mr22680356qke.91.1560801009118; 
 Mon, 17 Jun 2019 12:50:09 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:08 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 413/459] drm/amd/display: Intermittent DCN2 pipe hang on mode
 change
Date: Mon, 17 Jun 2019 14:49:02 -0500
Message-Id: <20190617194948.18667-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gZ6QM/KKMvvAPl6HgxyWX5y16F483vS//B/yVJKKzRI=;
 b=qutBIOEMhq7cX/BMfI4A6b6D+TBJY7n3Ed+EXZB05CKpvGLgLtJIGqmyI4mT+xdEZP
 B+H/Sx/X1vAUKKNdel6s5G2Xb5BCvZjwf+bflysboU2AllPPvMlSl+0AaSjp7hYni8Fz
 Xltvq/CqShv7emPH605PMwTOgVoGoZDN0j6W+eorlg0nIwG1ML5e8JvWEPAR1PnXBzkZ
 p8KAqfgipaccObS4brBO6269Upj8TyzU7fLv8AMeKm6OOXivq3jMxOnlh+CgvtEC+Xxf
 yO37FVZJ5V98Jqv1w0MqvC/oWIb0Vl/htpZQpc9NmoQbcFLuhZ5LFJrv8Ie591fqcYU3
 cJ2g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpbV2h5XQpHU0wgaXMgYmVpbmcgdXNl
ZCB0byBzeW5jaHJvbml6ZSBwaXBlcyB3aGVuIHZzeW5jIGlzIG9mZiBidXQKb24gdHJhbnNpdGlv
biB0byB2c3luYyBvbiBkdXJpbmcgYSBtb2RlIGNoYW5nZSBHU0wgaXMgbm90CmJlaW5nIHJlc2V0
IGNvcnJlY3RseS4KCltIb3ddCkRpc2FibGUgR1NMIG9uIGFueSBwbGFuZSB0aGF0IGlzIGRpc2Fi
bGVkLgoKU2lnbmVkLW9mZi1ieTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBLcnVub3NsYXYgS292YWMgPEtydW5vc2xhdi5Lb3ZhY0BhbWQuY29tPgpBY2tlZC1ieTog
Qmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jICAgIHwgMTUgKysrKysrKysr
KystLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5oICAg
IHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfaHdzZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9o
d3NlcS5jCmluZGV4IGY5ZWFlNDdmN2JlMy4uYzdhZTUzODYxMWY3IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwpAQCAtNDY3LDYg
KzQ2NywxNCBAQCBzdGF0aWMgdm9pZCBkY24yMF9wbGFuZV9hdG9taWNfZGlzYWJsZShzdHJ1Y3Qg
ZGMgKmRjLCBzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQogCiAJZGMtPmh3c3Mud2FpdF9mb3Jf
bXBjY19kaXNjb25uZWN0KGRjLCBkYy0+cmVzX3Bvb2wsIHBpcGVfY3R4KTsKIAorCS8qIEluIGZs
aXAgaW1tZWRpYXRlIHdpdGggcGlwZSBzcGxpdHRpbmcgY2FzZSBHU0wgaXMgdXNlZCBmb3IKKwkg
KiBzeW5jaHJvbml6YXRpb24gc28gd2UgbXVzdCBkaXNhYmxlIGl0IHdoZW4gdGhlIHBsYW5lIGlz
IGRpc2FibGVkLgorCSAqLworCWlmIChwaXBlX2N0eC0+c3RyZWFtX3Jlcy5nc2xfZ3JvdXAgIT0g
MCkKKwkJZGNuMjBfc2V0dXBfZ3NsX2dyb3VwX2FzX2xvY2soZGMsIHBpcGVfY3R4LCBmYWxzZSk7
CisKKwlkYy0+aHdzcy5zZXRfZmxpcF9jb250cm9sX2dzbChwaXBlX2N0eCwgZmFsc2UpOworCiAJ
aHVicC0+ZnVuY3MtPmh1YnBfY2xrX2NudGwoaHVicCwgZmFsc2UpOwogCiAJZHBwLT5mdW5jcy0+
ZHBwX2RwcGNsa19jb250cm9sKGRwcCwgZmFsc2UsIGZhbHNlKTsKQEAgLTE5MDAsMTQgKzE5MDgs
MTQgQEAgc3RhdGljIGludCBmaW5kX2ZyZWVfZ3NsX2dyb3VwKGNvbnN0IHN0cnVjdCBkYyAqZGMp
CiB2b2lkIGRjbjIwX3NldHVwX2dzbF9ncm91cF9hc19sb2NrKAogCQljb25zdCBzdHJ1Y3QgZGMg
KmRjLAogCQlzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4LAotCQlib29sIGZsaXBfaW1tZWRpYXRl
KQorCQlib29sIGVuYWJsZSkKIHsKIAlzdHJ1Y3QgZ3NsX3BhcmFtcyBnc2w7CiAJaW50IGdyb3Vw
X2lkeDsKIAogCW1lbXNldCgmZ3NsLCAwLCBzaXplb2Yoc3RydWN0IGdzbF9wYXJhbXMpKTsKIAot
CWlmIChmbGlwX2ltbWVkaWF0ZSkgeworCWlmIChlbmFibGUpIHsKIAkJLyogcmV0dXJuIGlmIGdy
b3VwIGFscmVhZHkgYXNzaWduZWQgc2luY2UgR1NMIHdhcyBzZXQgdXAKIAkJICogZm9yIHZzeW5j
IGZsaXAsIHdlIHdvdWxkIHVuYXNzaWduIHNvIGl0IGNhbid0IGJlICJsZWZ0IG92ZXIiCiAJCSAq
LwpAQCAtMTk3Myw4ICsxOTgxLDcgQEAgdm9pZCBkY24yMF9zZXR1cF9nc2xfZ3JvdXBfYXNfbG9j
aygKIAkJCSZnc2wpOwogCiAJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLnRnLT5mdW5jcy0+c2V0X2dz
bF9zb3VyY2Vfc2VsZWN0KAotCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMudGcsIGdyb3VwX2lkeCwK
LQkJCWZsaXBfaW1tZWRpYXRlID8gNCA6IDApOworCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMudGcs
IGdyb3VwX2lkeCwJZW5hYmxlID8gNCA6IDApOwogCX0gZWxzZQogCQlCUkVBS19UT19ERUJVR0dF
UigpOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX2h3c2VxLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNu
MjBfaHdzZXEuaAppbmRleCAzNzY5OWRmNjg1ZWUuLmI3ODkyZThmNDUxOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmgKQEAgLTg2
LDYgKzg2LDYgQEAgdm9pZCBkY24yMF9zZXR1cF92dXBkYXRlX2ludGVycnVwdChzdHJ1Y3QgcGlw
ZV9jdHggKnBpcGVfY3R4KTsKIAogdm9pZCBkY24yMF9zZXR1cF9nc2xfZ3JvdXBfYXNfbG9jayhj
b25zdCBzdHJ1Y3QgZGMgKmRjLAogCQkJCSAgc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCwKLQkJ
CQkgIGJvb2wgZmxpcF9pbW1lZGlhdGUpOworCQkJCSAgYm9vbCBlbmFibGUpOwogCiAjZW5kaWYg
LyogX19EQ19IV1NTX0RDTjIwX0hfXyAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
