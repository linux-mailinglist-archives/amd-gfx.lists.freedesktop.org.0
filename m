Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BFE5D780
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13EB6E07F;
	Tue,  2 Jul 2019 20:29:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800C56E075
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:37 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w17so20140186qto.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jFNkMUq8LivGi16hT11PhNjyz+BttO8dgb/IGd+4glM=;
 b=nvQIsjjdcyeT75s3B/L1cK3ufDenX64IQNoVC4cHE8vZKPhU3hyUKHGplVTDXWiDu6
 6qPDvTy5zHvuxbjlKJLDYqDGo63RnME02M2Cy9tVp3Mqt/445QRLcJxGECWDsGWBNYEn
 5M7Z0N7Vp/uMQQf8po7iBNzSfyjNGd+VOv++BdWZ4ZyMcuONgPQhtsFyAhpmxtd9OcT0
 LWINP/fi8SqxSNLRHz6gWZSjylZZ/33D+AlGJKELftpnEIzf4anE5kQe7+megJFUzHrT
 IlzhyDAi4s9aPl6BcQIO1PwkQNnly75vML93Indh5SNf34jgG9b/SOinlmP/4nc7rkKX
 ae9w==
X-Gm-Message-State: APjAAAUeXZOUlC//7WhnjBsbIQhefQuCVlZrI72QpKfChDzANgAwQb8W
 e1xt0lAw7+p1MihTEVe3y+RvA/5s3so=
X-Google-Smtp-Source: APXvYqzZ8/RjziaVpj9VFDWBZN9uTRQoAnL19VHO7hYJCjGHGbCXJnx5TztDGWU8JD/m+bvkFKRoVg==
X-Received: by 2002:ac8:3118:: with SMTP id g24mr26970986qtb.390.1562099376465; 
 Tue, 02 Jul 2019 13:29:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 46/53] drm/amdgpu: enable async gfx ring for navi14
Date: Tue,  2 Jul 2019 15:28:37 -0500
Message-Id: <20190702202844.17001-47-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jFNkMUq8LivGi16hT11PhNjyz+BttO8dgb/IGd+4glM=;
 b=O37nwLReFzrxmbka04HSBRdEHYdLQVGQsB4g6n2Tb/uDL7HZlU0ObTZK/3GHyMAZG1
 cMyddTX81ieYs6rR/XlSWQpDFl3FFGSy15T7mTAyJl7sVMrpZELhQE2CLNB/vfV6HSES
 g0IjDywLp0mVkCzWL49I+2S2pDodUeRFmAaqOGggi2T8Gq1ZO3g3/A9BaexI6rKlXPA5
 K8ZPeYiAw5DthCdcGUjRcl2zRSd2tdmr5Y/SWZxs3Hzs90u/SV0dbK+j9vTLVouOnhwW
 0TRsLWaJKUzOq3olml90XgsW4JVSKjDp8JHj1O9FEPLJBseKAZJMqCIqubU7267Y444Q
 g6Pw==
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
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgbmF2aTEw
LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ2Z4LmMKaW5kZXggNjMzZjY4NzZiMjBkLi5lMWZkY2I0NGE3ZGQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMKQEAgLTM4OSw3ICszODksNyBAQCBpbnQgYW1k
Z3B1X2dmeF9tcWRfc3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQlkZXZf
d2FybihhZGV2LT5kZXYsICJubyBtZW1vcnkgdG8gY3JlYXRlIE1RRCBiYWNrdXAgZm9yIHJpbmcg
JXNcbiIsIHJpbmctPm5hbWUpOwogCX0KIAotCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9O
QVZJMTAgJiYgYW1kZ3B1X2FzeW5jX2dmeF9yaW5nKSB7CisJaWYgKGFkZXYtPmFzaWNfdHlwZSA+
PSBDSElQX05BVkkxMCAmJiBhbWRncHVfYXN5bmNfZ2Z4X3JpbmcpIHsKIAkJLyogY3JlYXRlIE1R
RCBmb3IgZWFjaCBLR1EgKi8KIAkJZm9yIChpID0gMDsgaSA8IGFkZXYtPmdmeC5udW1fZ2Z4X3Jp
bmdzOyBpKyspIHsKIAkJCXJpbmcgPSAmYWRldi0+Z2Z4LmdmeF9yaW5nW2ldOwpAQCAtNDM3LDcg
KzQzNyw3IEBAIHZvaWQgYW1kZ3B1X2dmeF9tcWRfc3dfZmluaShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSBOVUxMOwogCWludCBpOwogCi0J
aWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxMCAmJiBhbWRncHVfYXN5bmNfZ2Z4X3Jp
bmcpIHsKKwlpZiAoYWRldi0+YXNpY190eXBlID49IENISVBfTkFWSTEwICYmIGFtZGdwdV9hc3lu
Y19nZnhfcmluZykgewogCQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+Z2Z4Lm51bV9nZnhfcmluZ3M7
IGkrKykgewogCQkJcmluZyA9ICZhZGV2LT5nZnguZ2Z4X3JpbmdbaV07CiAJCQlrZnJlZShhZGV2
LT5nZngubWUubXFkX2JhY2t1cFtpXSk7CkBAIC00NTYsNyArNDU2LDcgQEAgdm9pZCBhbWRncHVf
Z2Z4X21xZF9zd19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCX0KIAogCXJpbmcg
PSAmYWRldi0+Z2Z4LmtpcS5yaW5nOwotCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9OQVZJ
MTAgJiYgYW1kZ3B1X2FzeW5jX2dmeF9yaW5nKQorCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJ
UF9OQVZJMTAgJiYgYW1kZ3B1X2FzeW5jX2dmeF9yaW5nKQogCQlrZnJlZShhZGV2LT5nZngubWUu
bXFkX2JhY2t1cFtBTURHUFVfTUFYX0dGWF9SSU5HU10pOwogCWtmcmVlKGFkZXYtPmdmeC5tZWMu
bXFkX2JhY2t1cFtBTURHUFVfTUFYX0NPTVBVVEVfUklOR1NdKTsKIAlhbWRncHVfYm9fZnJlZV9r
ZXJuZWwoJnJpbmctPm1xZF9vYmosCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
