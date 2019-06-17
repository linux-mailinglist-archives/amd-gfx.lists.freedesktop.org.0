Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 987ED48DE7
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638B989388;
	Mon, 17 Jun 2019 19:17:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB8E8936E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:44 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d17so7218081qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8D1OpILN5kSNp/c7ZtKjsK7J/1u1JfLZytPx8VMSNDc=;
 b=jsZah5nRU+r2N5p9jrRAzPLHfflFx8ln6i7jFB+BjgwIuhxo8vxUHE1Jbtpv71eGaa
 yPNm6j4YV9Dn1pA3rXkRZOrphfA3BqZ7n9S62XKS9vthbxhhZMd1Q3mRdFkDzB7ULxfW
 20iC/E+lk52LGHPR4qB3LhsSFml3E9YCNX9lkyp7w6m7EcbxMVdrm1lVZw2g5CZBDhzm
 8d6WYJ4+rzQWTzCt2I4Jg/umNUhZZ1Nxt0d15Gxy/h8QjZQAjGJMiXXkswlUo7GHiziJ
 z1Kyu9F7Ew/8RjW0PN1jYBLEaxIjiWt0X4E7MBNcre8tvfY0DzXmpQSMjtfFsa0E0rfq
 AOTQ==
X-Gm-Message-State: APjAAAXzGjJ2Wn/f6qmkBCJ5B9lWIxZ43aSo0083n/mDN1hmVLg8gemq
 EHiDAVZSFTsnq5pVAO/4p/rhSeZHbjY=
X-Google-Smtp-Source: APXvYqzD1Zk4mtjjUtE6Zjegi3GvXt3SziY8qvHgDNKps1Ng6Zy3VniHo4ckZxIK1R1CO+XB41uzCw==
X-Received: by 2002:a0c:d109:: with SMTP id a9mr12899017qvh.89.1560799063408; 
 Mon, 17 Jun 2019 12:17:43 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:42 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 040/459] drm/amdgpu: Add struct kiq_pm4_funcs into kiq struct
Date: Mon, 17 Jun 2019 14:10:01 -0500
Message-Id: <20190617191700.17899-29-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8D1OpILN5kSNp/c7ZtKjsK7J/1u1JfLZytPx8VMSNDc=;
 b=aB8OWPn3PUXzD6PwRCa2CebtE9GTtJbW4kLsbQly/wwk7uHwMxTD3ALspqdhP66ORL
 230D4hOpNVb1qrR9bj+hjtwjbK3ALvVs9dXsnu131bWTke1Fb3kuMSKo44iA/xP6/vmx
 lYI6r49zMY4LuND33sVTeF6ClCtFUz2WL1wQLvz4MieeI6YCtwFc8re4b9y2WG/3GK5X
 b5Xyph3uP9HkQPFvWjs33UkE3BCpZJNn3pw0dM0X0Jk1WKDXwtyqmcUY6Ve1xIWvjW1H
 O5PcMBNeyk5oyPizV4lyiZRvHfBPadUyty0H1+9jUqMEkrzpTNUk8lXM3CgB1ZK4d24a
 vNDA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUmV4IFpodSA8UmV4LlpodUBhbWQuY29tPgoKa2lxIGNhbiBzdXBwb3J0IDQgcG00IHNj
aGVkdWxlciBwYWNrZXRzCnNldF9yZXNvdXJjZSwgbWFwX3F1ZXVlcywgdW5tYXBfcXVldWVzLCBx
dWVyeV9zdGF0dXMuCgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBSZXggWmh1IDxSZXguWmh1QGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggfCAyMCArKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2Z4LmgKaW5kZXggZjI0NDFjMDJmOWRiLi4xNGQ2ZjAxZGIyN2IgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKQEAgLTU1LDEyICs1NSwzMiBAQCBz
dHJ1Y3QgYW1kZ3B1X21lYyB7CiAJREVDTEFSRV9CSVRNQVAocXVldWVfYml0bWFwLCBBTURHUFVf
TUFYX0NPTVBVVEVfUVVFVUVTKTsKIH07CiAKK3N0cnVjdCBraXFfcG00X2Z1bmNzIHsKKwkvKiBT
dXBwb3J0IEFTSUMtc3BlY2lmaWMga2lxIHBtNCBwYWNrZXRzKi8KKwl2b2lkICgqa2lxX3NldF9y
ZXNvdXJjZXMpKHN0cnVjdCBhbWRncHVfcmluZyAqa2lxX3JpbmcsCisJCQkJCXVpbnQ2NF90IHF1
ZXVlX21hc2spOworCXZvaWQgKCpraXFfbWFwX3F1ZXVlcykoc3RydWN0IGFtZGdwdV9yaW5nICpr
aXFfcmluZywKKwkJCQkJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKTsKKwl2b2lkICgqa2lxX3Vu
bWFwX3F1ZXVlcykoc3RydWN0IGFtZGdwdV9yaW5nICpraXFfcmluZywKKwkJCQkgc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nLCBib29sIHJlc2V0KTsKKwl2b2lkICgqa2lxX3F1ZXJ5X3N0YXR1cyko
c3RydWN0IGFtZGdwdV9yaW5nICpraXFfcmluZywKKwkJCQkJc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nLAorCQkJCQl1NjQgYWRkciwKKwkJCQkJdTY0IHNlcSk7CisJLyogUGFja2V0IHNpemVzICov
CisJaW50IHNldF9yZXNvdXJjZXNfc2l6ZTsKKwlpbnQgbWFwX3F1ZXVlc19zaXplOworCWludCB1
bm1hcF9xdWV1ZXNfc2l6ZTsKKwlpbnQgcXVlcnlfc3RhdHVzX3NpemU7Cit9OworCiBzdHJ1Y3Qg
YW1kZ3B1X2tpcSB7CiAJdTY0CQkJZW9wX2dwdV9hZGRyOwogCXN0cnVjdCBhbWRncHVfYm8JKmVv
cF9vYmo7CiAJc3BpbmxvY2tfdCAgICAgICAgICAgICAgcmluZ19sb2NrOwogCXN0cnVjdCBhbWRn
cHVfcmluZwlyaW5nOwogCXN0cnVjdCBhbWRncHVfaXJxX3NyYwlpcnE7CisJY29uc3Qgc3RydWN0
IGtpcV9wbTRfZnVuY3MgKnBtZjsKIH07CiAKIC8qCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
