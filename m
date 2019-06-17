Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE3648F33
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402D089B9F;
	Mon, 17 Jun 2019 19:31:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED61C89B99
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:23 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n11so12228671qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WmMpbJSW+b/UUCa8Vy5/XJtIMlEurMatvscUabl1Vtg=;
 b=UnOXKgoHKjMZc6qawyvhMcQ18L7HwN188Hpl4D6O02z5Madn3I1xc0QYYBh1aTHLrS
 y2QcEDRRMn9TlQE0X7TCOJKIowTLS18HBxf6vg5d2N5MujTegMMKiXySuGuBpn0+NFCX
 gXskrTXUJh2dphxqfdozd2qYSmH3B/iDUxWr6oam0sMdIdsQWuwlCvB93YL/62g3J/L4
 eYsnYVTh0Z//jCXmG7Wx9aAf7EI4s4/uaMia7h6QqR/V9b6Sg0+FsxDa7N8YD5xhOJwH
 2p0Im7BXRZB48CY+QfKpa+wnFxYOC2zjZ64pe6dnArMB13ANVhVf8g+mjxsldxzLTEWz
 VxwA==
X-Gm-Message-State: APjAAAXuxQDhenZQ9+5zzLTybG1dh8MqZGqopqAJEBlY91BxA3sTE2L5
 tCy32y3PKVTZeIJeSpI5rDz8pncOPXk=
X-Google-Smtp-Source: APXvYqwG5kqTLuUDMKypgyEHQe7gxdkoVfV4cYT5Y/bZyo8PyFovD5350xgjW9Uvt0LWLF+j67j3LA==
X-Received: by 2002:ac8:5407:: with SMTP id b7mr89422637qtq.48.1560799882029; 
 Mon, 17 Jun 2019 12:31:22 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 209/459] drm/amdgpu/mes10.1: load mes firmware file to CPU
 buffer
Date: Mon, 17 Jun 2019 14:29:36 -0500
Message-Id: <20190617193106.18231-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WmMpbJSW+b/UUCa8Vy5/XJtIMlEurMatvscUabl1Vtg=;
 b=p5zjAoe5ZZW/kFGXo8DgIvgEx8dh54pu0ljx6Ikmm+/3xszt8abws3Dn9W98LKBvhH
 64cYsgascDp1PJpa6w+WO4WJx2d80625Aop5tJqUv1KJv7u6po2WG6aW/CN8ErioCLv/
 i3mzKZH1opWrh6mE/7Au37iXNj7GV0rGLmTdgT5ORhK3lgHP4lWKpsiCAqEMj+nAGJjZ
 hFSsJbTlhnhjnKIrbusxeVLwWFOTxFbZHMT1J+e6bP1ufTeqJUC55e2ANQ5yxNDuYsoW
 MKNoyyDMJQn1BlvN5Nma/jupSFdBU64iTzmSFsvJYHDxXOUgei4s5OtlBEthiXBGY5oI
 G2YQ==
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

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkl0IHJlcXVlc3RzIE1FUyBmaXJt
d2FyZSBiaW5hcnkgYW5kIHVwbG9hZHMgdG8gQ1BVIGJ1ZmZlci4KClNpZ25lZC1vZmYtYnk6IEph
Y2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxI
YXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tZXNf
djEwXzEuYyB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L21lc192MTBfMS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbWVzX3YxMF8xLmMKaW5k
ZXggMmU2NTU3MzZiMjRkLi5jNzk5YjBjYTE5MDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L21lc192MTBfMS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L21lc192MTBfMS5jCkBAIC0yMyw2ICsyMyw4IEBACiAKICNpbmNsdWRlICJhbWRncHUuaCIKIAor
TU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2aTEwX21lcy5iaW4iKTsKKwogc3RhdGljIGludCBt
ZXNfdjEwXzFfYWRkX2h3X3F1ZXVlKHN0cnVjdCBhbWRncHVfbWVzICptZXMsCiAJCQkJICBzdHJ1
Y3QgbWVzX2FkZF9xdWV1ZV9pbnB1dCAqaW5wdXQpCiB7CkBAIC01NCw2ICs1Niw0NyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9tZXNfZnVuY3MgbWVzX3YxMF8xX2Z1bmNzID0gewogCS5y
ZXN1bWVfZ2FuZyA9IG1lc192MTBfMV9yZXN1bWVfZ2FuZywKIH07CiAKK3N0YXRpYyBpbnQgbWVz
X3YxMF8xX2luaXRfbWljcm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCWNv
bnN0IGNoYXIgKmNoaXBfbmFtZTsKKwljaGFyIGZ3X25hbWVbMzBdOworCWludCBlcnI7CisJY29u
c3Qgc3RydWN0IG1lc19maXJtd2FyZV9oZWFkZXJfdjFfMCAqbWVzX2hkcjsKKworCXN3aXRjaCAo
YWRldi0+YXNpY190eXBlKSB7CisJY2FzZSBDSElQX05BVkkxMDoKKwkJY2hpcF9uYW1lID0gIm5h
dmkxMCI7CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCUJVRygpOworCX0KKworCXNucHJpbnRmKGZ3
X25hbWUsIHNpemVvZihmd19uYW1lKSwgImFtZGdwdS8lc19tZXMuYmluIiwgY2hpcF9uYW1lKTsK
KwllcnIgPSByZXF1ZXN0X2Zpcm13YXJlKCZhZGV2LT5tZXMuZncsIGZ3X25hbWUsIGFkZXYtPmRl
dik7CisJaWYgKGVycikKKwkJcmV0dXJuIGVycjsKKworCWVyciA9IGFtZGdwdV91Y29kZV92YWxp
ZGF0ZShhZGV2LT5tZXMuZncpOworCWlmIChlcnIpIHsKKwkJcmVsZWFzZV9maXJtd2FyZShhZGV2
LT5tZXMuZncpOworCQlhZGV2LT5tZXMuZncgPSBOVUxMOworCQlyZXR1cm4gZXJyOworCX0KKwor
CW1lc19oZHIgPSAoY29uc3Qgc3RydWN0IG1lc19maXJtd2FyZV9oZWFkZXJfdjFfMCAqKWFkZXYt
Pm1lcy5mdy0+ZGF0YTsKKwlhZGV2LT5tZXMudWNvZGVfZndfdmVyc2lvbiA9IGxlMzJfdG9fY3B1
KG1lc19oZHItPm1lc191Y29kZV92ZXJzaW9uKTsKKwlhZGV2LT5tZXMudWNvZGVfZndfdmVyc2lv
biA9CisJCWxlMzJfdG9fY3B1KG1lc19oZHItPm1lc191Y29kZV9kYXRhX3ZlcnNpb24pOworCWFk
ZXYtPm1lcy51Y19zdGFydF9hZGRyID0KKwkJbGUzMl90b19jcHUobWVzX2hkci0+bWVzX3VjX3N0
YXJ0X2FkZHJfbG8pIHwKKwkJKCh1aW50NjRfdCkobGUzMl90b19jcHUobWVzX2hkci0+bWVzX3Vj
X3N0YXJ0X2FkZHJfaGkpKSA8PCAzMik7CisJYWRldi0+bWVzLmRhdGFfc3RhcnRfYWRkciA9CisJ
CWxlMzJfdG9fY3B1KG1lc19oZHItPm1lc19kYXRhX3N0YXJ0X2FkZHJfbG8pIHwKKwkJKCh1aW50
NjRfdCkobGUzMl90b19jcHUobWVzX2hkci0+bWVzX2RhdGFfc3RhcnRfYWRkcl9oaSkpIDw8IDMy
KTsKKworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50IG1lc192MTBfMV9zd19pbml0KHZvaWQg
KmhhbmRsZSkKIHsKIAlyZXR1cm4gMDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
