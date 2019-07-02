Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246DF5D754
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58806E041;
	Tue,  2 Jul 2019 20:29:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FF26E042
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:28:59 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id d15so15489878qkl.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ptvP2V42yWviqThm7Sc6Zk6ZliURU0BmePyBgugPDQo=;
 b=KLTMvaEO42G5blzxYzwCM81Oh27XR3YA+pGgSkUFIKg+sWJ35jNk1HcXF1DaBmZNpb
 4NSmpufduIVGGqtV5prL1M3VxGz2mJUZRaYenTXQL8uM31lFMZmuTgSQAAcD8gg7guXq
 YfjM1MucqxvoJlOSdMV8DMNz/PY6eqTZvhxKEfR7FpDbNtoDhPNf77zp6fQP15hxtI8z
 TBxlHMvIenvXt8kMToX6iW8SYHr47SGx2hMYai3FrmsvxHVUVwMor9AvIZA92599unDS
 UJ0WJ/W8tEO24y9mQ/Yc8hT/1JtlMfXS2HWxrZjdaXvgAh9CvpXUylJcfXiQIkSierQ6
 3mTg==
X-Gm-Message-State: APjAAAUQfVwuP6+whkY3vwvxgdiGO++A5LvZOcBMG2gQ6+X4JX6nRpFu
 x6IgKQIs5CIviH4pPP28XUqzsTgytBo=
X-Google-Smtp-Source: APXvYqyCBw7wyB8GM8bOq9rCgiz1PjA68IaqoGwvsJIVNhCkY/do4KQsU1ew7yL9Bl23gF/D3sRwfw==
X-Received: by 2002:a05:620a:13b9:: with SMTP id
 m25mr28003264qki.246.1562099338950; 
 Tue, 02 Jul 2019 13:28:58 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.28.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:28:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/53] drm/amdgpu: add navi14 ucode loading method
Date: Tue,  2 Jul 2019 15:27:55 -0500
Message-Id: <20190702202844.17001-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ptvP2V42yWviqThm7Sc6Zk6ZliURU0BmePyBgugPDQo=;
 b=YtXEN2+l6fKuKVD2q5mo/P9p6LHP5gFxC+kjcviEIwWAGrrd4eY2nCCfa5n2p8ulUu
 ZaT7t98XwDppSi+nVi92YvWquR46/oMgOXs4vma8EgQ3XTDXIkllqaa7Vhcq9fzkj26k
 r/WOHxDnHIY4ua3VzVQ4eLUvLKiCgPK3XEBJZjaJdaACRAXt/NtWBn42Dy4Watxp3sDf
 ZXRvclG9c6bgs1lhjCF7TaMKGPy1d89baXAXD477CtOM2XC68vQX24an65cKqq6zF/aM
 MiKJcX2I9fIXMSjVvMw74ynLlOgMiUOBGK2jxyJRkH7A15cdCCqB3KD2KThH254HC2EB
 TH9Q==
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
aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KUmV2aWV3
ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vj
b2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYwppbmRleCA3
MDgxYWQ5ZjkzZTMuLmJmN2U4YmE4NmI0YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Vjb2RlLmMKQEAgLTM0NSw2ICszNDUsNyBAQCBhbWRncHVfdWNvZGVfZ2V0X2xvYWRf
dHlwZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxvYWRfdHlwZSkKIAljYXNlIENI
SVBfVkVHQTEyOgogCWNhc2UgQ0hJUF9WRUdBMjA6CiAJY2FzZSBDSElQX05BVkkxMDoKKwljYXNl
IENISVBfTkFWSTE0OgogCQlpZiAoIWxvYWRfdHlwZSkKIAkJCXJldHVybiBBTURHUFVfRldfTE9B
RF9ESVJFQ1Q7CiAJCWVsc2UKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
