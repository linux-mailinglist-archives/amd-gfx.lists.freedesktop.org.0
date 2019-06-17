Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD2748E07
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDDF89518;
	Mon, 17 Jun 2019 19:18:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5523D89503
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:12 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id d23so12200490qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NO8moXarsKOJN3qdVtgsPC1ecc4oluaMutReyh24V4s=;
 b=si4Dkcqyvu3fkqZZo6hVJ/udXmQzIbuDKJFLRifPpLAhOg/lnAqyjcR/h4NXERQc+y
 13mu4qiA+sPYLG7awjrpKjZ7QEbtLLOwQC/T6kOwORPeKPjZWvtg3psb3wtxaJsO3FFa
 Ib7N2uh/zHISCTkRYTaVQIvxhL/XXfcBIBm5BYLcFI3Nk84Lvo7fMgXOo9TP9Fva+ANw
 Jrncp9oQ3UqHBo2/JxvR/0whM4DwIe+bftE4ngvR4lUiyrI3AdH7TPMbz+YPXram/DKq
 w71cYJA/UFRJL2FKq7d6gxK8yoOLOUX855Kx3irRJCJXEq0wvniGiS7BkTMSAVJuOXgO
 HILw==
X-Gm-Message-State: APjAAAUr0HOzrdtPMaDrsxBw2JboJNZA/Nt0jf8dUACZQDso/zTUXiZ4
 emrK7d+FBpXQSwISgq+RwxgYrl0oR98=
X-Google-Smtp-Source: APXvYqwcf0THUgUs6wg3EB9rvFRO5lQPo9JdFJ7sKY2bP7f2yyCnN/kPzCzkc/prGfsfBovVvGF/dQ==
X-Received: by 2002:a0c:d109:: with SMTP id a9mr12901497qvh.89.1560799091335; 
 Mon, 17 Jun 2019 12:18:11 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:10 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 071/459] drm/amdgpu/psp: print out psp v11 ucode hdr in drm
 debug mode
Date: Mon, 17 Jun 2019 14:10:32 -0500
Message-Id: <20190617191700.17899-60-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NO8moXarsKOJN3qdVtgsPC1ecc4oluaMutReyh24V4s=;
 b=bG4uR3K65GNq17/dSpfD2sUjtPDaS0TVgNN4cvTTK9Psp+jJBdF9FwNJd+8CjdTrEk
 j4o0/kRYsojsyxvq90NOerbQ/+NgH7Co4+tT04e2Mw+GH4b+6sLhilCPeJiohnahUvL9
 EeM640d0v9ENXFF5c/ZzmsbafHAHz5RZ88ptYGcXEU72Qe8gktY+z7ywRlnREGPy2A34
 RFhE71JbRyzSj/AhBdsrSjmktMllwEuQY8UwEyJ/ysYQk66CG6mr2GszVcFJYk2/bvQt
 nB/agBvzZB/x27sbaYQ76N52nqgydOPowi/IHbgWA75m8iCnj7/tQk0WM2rKjLbpsCj9
 wq+g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogTGUg
TWEgPExlLk1hQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjEx
XzAuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9wc3BfdjExXzAuYwppbmRleCBkMmZiY2FkMDU0ZTQuLjY0M2U0ZWY1OTdiYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKQEAgLTgzLDYgKzgzLDcgQEAg
c3RhdGljIGludCBwc3BfdjExXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IHBzcF9jb250ZXh0ICpw
c3ApCiAJCWdvdG8gb3V0OwogCiAJc29zX2hkciA9IChjb25zdCBzdHJ1Y3QgcHNwX2Zpcm13YXJl
X2hlYWRlcl92MV8wICopYWRldi0+cHNwLnNvc19mdy0+ZGF0YTsKKwlhbWRncHVfdWNvZGVfcHJp
bnRfcHNwX2hkcigmc29zX2hkci0+aGVhZGVyKTsKIAogCXN3aXRjaCAoc29zX2hkci0+aGVhZGVy
LmhlYWRlcl92ZXJzaW9uX21ham9yKSB7CiAJY2FzZSAxOgotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
