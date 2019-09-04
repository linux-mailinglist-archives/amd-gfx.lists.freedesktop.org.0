Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6289A85DF
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFB289C1C;
	Wed,  4 Sep 2019 15:02:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC1189B0C
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:02:42 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r195so4201768wme.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 04 Sep 2019 08:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dBu2/4vV4QRUajBa/tJ8Rvw3yV41nYiwn327krL9Y2M=;
 b=tMaZvkZq69P/0GkGaNTDZoLebr+peX8wPM9ReU0j18MOX8VoPzVTRKshfmLf1fLnaG
 i4/8o+8d8amrsPjZ/WP+1/GUukBPgYgqhd1pqgLnxVPo2OQpQg0zXs8AhO5HEbqYdP6y
 QR0IVHCgGnO1YgfxsbmyyODAPLaKH6l7CVFTNSJDk0cSGbgLXOlX2levOBeYQq6R4LVO
 uW4Sy7Ys4pG1pCrgpbj94q9w9sZbByD7WUJg58yBVueO/AVZ/bjJAqdvmFinCTElHu4p
 g6srMkONRRG4IsxOsGFSJv4Y1JrXRTfPuK42m7rKQnAS5/LWJcPYrOFTUMlCVVMoIfSN
 K8EA==
X-Gm-Message-State: APjAAAVI2o+kGUZp+t+C4MXDy+v+emfyZ4EmImgDI4IrMNzKavRhqpEj
 XrPxt48/ofFLLMlpbbpOmzDsnVjw
X-Google-Smtp-Source: APXvYqxaGBlwpfQaIMNYpeTJNG2/cr52+dhIrc9/z0LBQUaZipprAZfukximEAD2O+RMV/3iw6UeeQ==
X-Received: by 2002:a1c:6c0c:: with SMTP id h12mr4757253wmc.162.1567609361053; 
 Wed, 04 Sep 2019 08:02:41 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6124:f264:ed7d:d416])
 by smtp.gmail.com with ESMTPSA id o9sm25928802wrj.17.2019.09.04.08.02.40
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 08:02:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 7/9] drm/amdgpu: allocate PDs/PTs with no_gpu_wait in a page
 fault
Date: Wed,  4 Sep 2019 17:02:28 +0200
Message-Id: <20190904150230.13885-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904150230.13885-1-christian.koenig@amd.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dBu2/4vV4QRUajBa/tJ8Rvw3yV41nYiwn327krL9Y2M=;
 b=sCcbIPIeLSzSSmvLHvrjXq/DM+tIDxJySEL3WN6xRJjYoz9Jj1lGPN+WrxwhiP272m
 /dC/+jsaJrMHURyOSGtx2pUv0S7MAOiUNi9wmewuTHH0KbzTeXZezcauqtFYI9TfmUq1
 KMV1mfZM/Y1A5iITSTSlnwJl6A1KfVUk/h2VVMX88kxzhWO4n7W1fdqcevOidRI8BoSH
 6fd8DFIuxL1d1x1S/RgcahkjwHKHIWCXrAHubcNir4/GWAn5cjG2ruyQ4AVewRIrmLiS
 ucClw7dkxnL+zNrO6E137aNvpQZnm2jWNblkDYW2qFGydLuod6wVQxzxwkSgh9/GpjKt
 ox9w==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hpbGUgaGFuZGxpbmcgYSBwYWdlIGZhdWx0IHdlIGNhbid0IHdhaXQgZm9yIG90aGVyIG9uZ29p
bmcgR1BVCm9wZXJhdGlvbnMgb3Igd2UgY2FuIHBvdGVudGlhbGx5IHJ1biBpbnRvIGRlYWRsb2Nr
cy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgfCAy
ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggfCAxICsKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jICAgICB8IDggKysrKystLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwppbmRleCAwNDc2NzkwNWYwMDQuLjUx
MGQwNGZkNmU1ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3Qu
YwpAQCAtNDUxLDcgKzQ1MSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2JvX2RvX2NyZWF0ZShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIHsKIAlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggY3R4
ID0gewogCQkuaW50ZXJydXB0aWJsZSA9IChicC0+dHlwZSAhPSB0dG1fYm9fdHlwZV9rZXJuZWwp
LAotCQkubm9fd2FpdF9ncHUgPSBmYWxzZSwKKwkJLm5vX3dhaXRfZ3B1ID0gYnAtPm5vX3dhaXRf
Z3B1LAogCQkucmVzdiA9IGJwLT5yZXN2LAogCQkuZmxhZ3MgPSBUVE1fT1BUX0ZMQUdfQUxMT1df
UkVTX0VWSUNUCiAJfTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3Qu
aAppbmRleCA1YTNjMTc3OWUyMDAuLmU2ZGRkMDQ4YTk4NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaApAQCAtNDEsNiArNDEsNyBAQCBzdHJ1Y3QgYW1kZ3B1
X2JvX3BhcmFtIHsKIAl1MzIJCQkJcHJlZmVycmVkX2RvbWFpbjsKIAl1NjQJCQkJZmxhZ3M7CiAJ
ZW51bSB0dG1fYm9fdHlwZQkJdHlwZTsKKwlib29sCQkJCW5vX3dhaXRfZ3B1OwogCXN0cnVjdCBy
ZXNlcnZhdGlvbl9vYmplY3QJKnJlc3Y7CiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5jCmluZGV4IGUzYzExYmQxY2NlZS4uNGM0YzM0OGIyNzUyIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwpAQCAtODIxLDcgKzgyMSw4IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X3ZtX2NsZWFyX2JvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogICogQGJwOiBy
ZXN1bHRpbmcgQk8gYWxsb2NhdGlvbiBwYXJhbWV0ZXJzCiAgKi8KIHN0YXRpYyB2b2lkIGFtZGdw
dV92bV9ib19wYXJhbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92
bSAqdm0sCi0JCQkgICAgICAgaW50IGxldmVsLCBzdHJ1Y3QgYW1kZ3B1X2JvX3BhcmFtICpicCkK
KwkJCSAgICAgICBpbnQgbGV2ZWwsIGJvb2wgZGlyZWN0LAorCQkJICAgICAgIHN0cnVjdCBhbWRn
cHVfYm9fcGFyYW0gKmJwKQogewogCW1lbXNldChicCwgMCwgc2l6ZW9mKCpicCkpOwogCkBAIC04
MzYsNiArODM3LDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3ZtX2JvX3BhcmFtKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKIAllbHNlIGlmICghdm0tPnJv
b3QuYmFzZS5ibyB8fCB2bS0+cm9vdC5iYXNlLmJvLT5zaGFkb3cpCiAJCWJwLT5mbGFncyB8PSBB
TURHUFVfR0VNX0NSRUFURV9TSEFET1c7CiAJYnAtPnR5cGUgPSB0dG1fYm9fdHlwZV9rZXJuZWw7
CisJYnAtPm5vX3dhaXRfZ3B1ID0gZGlyZWN0OwogCWlmICh2bS0+cm9vdC5iYXNlLmJvKQogCQli
cC0+cmVzdiA9IHZtLT5yb290LmJhc2UuYm8tPnRiby5yZXN2OwogfQpAQCAtODc3LDcgKzg3OSw3
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2FsbG9jX3B0cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKIAlpZiAoZW50cnktPmJhc2UuYm8pCiAJCXJldHVybiAwOwogCi0JYW1kZ3B1X3ZtX2Jv
X3BhcmFtKGFkZXYsIHZtLCBjdXJzb3ItPmxldmVsLCAmYnApOworCWFtZGdwdV92bV9ib19wYXJh
bShhZGV2LCB2bSwgY3Vyc29yLT5sZXZlbCwgZGlyZWN0LCAmYnApOwogCiAJciA9IGFtZGdwdV9i
b19jcmVhdGUoYWRldiwgJmJwLCAmcHQpOwogCWlmIChyKQpAQCAtMjczMCw3ICsyNzMyLDcgQEAg
aW50IGFtZGdwdV92bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1k
Z3B1X3ZtICp2bSwKIAkJdm0tPnVwZGF0ZV9mdW5jcyA9ICZhbWRncHVfdm1fc2RtYV9mdW5jczsK
IAl2bS0+bGFzdF91cGRhdGUgPSBOVUxMOwogCi0JYW1kZ3B1X3ZtX2JvX3BhcmFtKGFkZXYsIHZt
LCBhZGV2LT52bV9tYW5hZ2VyLnJvb3RfbGV2ZWwsICZicCk7CisJYW1kZ3B1X3ZtX2JvX3BhcmFt
KGFkZXYsIHZtLCBhZGV2LT52bV9tYW5hZ2VyLnJvb3RfbGV2ZWwsIGZhbHNlLCAmYnApOwogCWlm
ICh2bV9jb250ZXh0ID09IEFNREdQVV9WTV9DT05URVhUX0NPTVBVVEUpCiAJCWJwLmZsYWdzICY9
IH5BTURHUFVfR0VNX0NSRUFURV9TSEFET1c7CiAJciA9IGFtZGdwdV9ib19jcmVhdGUoYWRldiwg
JmJwLCAmcm9vdCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
