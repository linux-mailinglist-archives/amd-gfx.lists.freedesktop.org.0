Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F47D2DB0
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 17:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF816EB75;
	Thu, 10 Oct 2019 15:26:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF1F6EB71
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 15:26:39 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id l51so9015670qtc.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 08:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y9gnbSxos69WCzxYLwavAX4yRo96VvyFJCiuXtUuAW8=;
 b=hZmTcRrIJBWHHs37o5ab299+HFBDvhcK6iuduycIVx0tvGkxvDkr+ySc7QilejyGmB
 n3w/pCzjI1SbwfSq78G5Pc2McrmQl2a95KakHHD560utDbBHU7XirIQ8xhV1HzLdnYUD
 zZA2bdR0FxHfKLaZ6Gh/BydkmjwxLRIEmRK+Nx3HGqVpSFM4jeWcWbXWNv+6VwQ0RmmV
 K5b07i7HXZkNti2nOWFNDQhJ/eP+9MLSp5yWE4UrPl2OtOM3nes3T3wcIGXhmEYpKlJg
 48JXoG8kQpmuibjMXHGHXw9q8UokEHPw25MJDG5IuljGtRj1DXwek3MV8kq/4hQvKJs5
 5lCQ==
X-Gm-Message-State: APjAAAUUYFI4Gb4kuV+wI/Dk8uHOKO0xj46aoaVHPM5qkVgDU228OgXu
 4idAev5TFfT0295PXAK6nxUWIy+c
X-Google-Smtp-Source: APXvYqzraLeAlhkUW/ezcYW9nvH7P4AA/pX+0Hk9O5UTJr1k4UL/bD4qysp2f0odznbt21CwwR5e7w==
X-Received: by 2002:ac8:2a83:: with SMTP id b3mr11112042qta.244.1570721198561; 
 Thu, 10 Oct 2019 08:26:38 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id w45sm3389610qtb.47.2019.10.10.08.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 08:26:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/amdgpu/soc15: add support for baco reset with swSMU
Date: Thu, 10 Oct 2019 10:26:19 -0500
Message-Id: <20191010152619.31011-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191010152619.31011-1-alexander.deucher@amd.com>
References: <20191010152619.31011-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y9gnbSxos69WCzxYLwavAX4yRo96VvyFJCiuXtUuAW8=;
 b=GShBTdNeVod+jHdTR0HGzaNcplWFdVRV1LpZM3befo8sQyuw8wcxiwP/5joj9Njaea
 SwEq0u1pY/YiybxuW4MRVuXx259pYKphK+72cIulGHoWAIEhQtVMcUmKS6/so1uLokYF
 GyQWj9o8e5HpdsQNMg6tqHfR5J5qQCDsKv8jPG+obTJyAw/v5UQJYZLbo00earnAsDbx
 9bvcguBXo/iEP0KxhYE8N8ShzR9FkcxT63MEBPkb9sxVPRnF/cKpkWKR/fPMPGFKR0oA
 XBuqoMTogY5b9i71NI/efMSM2bDqvxEXz+rdDLdGLH9gEP5nuo7BWsnRH5bdgSudJOv4
 QqIA==
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

QWRkIHN1cHBvcnQgZm9yIHZlZ2EyMCB3aGVuIHRoZSBzd1NNVSBwYXRoIGlzIHVzZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDUzICsrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDE5IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IGQxNzU2OGRkOWU4Ny4u
YjMyOTFhMTlhNzcxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2Mx
NS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTQ3OCwzNiAr
NDc4LDUxIEBAIHN0YXRpYyBpbnQgc29jMTVfYXNpY19tb2RlMV9yZXNldChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAogc3RhdGljIGludCBzb2MxNV9hc2ljX2dldF9iYWNvX2NhcGFiaWxp
dHkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgKmNhcCkKIHsKLQl2b2lkICpwcF9o
YW5kbGUgPSBhZGV2LT5wb3dlcnBsYXkucHBfaGFuZGxlOwotCWNvbnN0IHN0cnVjdCBhbWRfcG1f
ZnVuY3MgKnBwX2Z1bmNzID0gYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzOworCWlmIChpc19zdXBw
b3J0X3N3X3NtdShhZGV2KSkgeworCQlzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9ICZhZGV2LT5z
bXU7CiAKLQlpZiAoIXBwX2Z1bmNzIHx8ICFwcF9mdW5jcy0+Z2V0X2FzaWNfYmFjb19jYXBhYmls
aXR5KSB7Ci0JCSpjYXAgPSBmYWxzZTsKLQkJcmV0dXJuIC1FTk9FTlQ7Ci0JfQorCQkqY2FwID0g
c211X2JhY29faXNfc3VwcG9ydChzbXUpOworCQlyZXR1cm4gMDsKKwl9IGVsc2UgeworCQl2b2lk
ICpwcF9oYW5kbGUgPSBhZGV2LT5wb3dlcnBsYXkucHBfaGFuZGxlOworCQljb25zdCBzdHJ1Y3Qg
YW1kX3BtX2Z1bmNzICpwcF9mdW5jcyA9IGFkZXYtPnBvd2VycGxheS5wcF9mdW5jczsKIAotCXJl
dHVybiBwcF9mdW5jcy0+Z2V0X2FzaWNfYmFjb19jYXBhYmlsaXR5KHBwX2hhbmRsZSwgY2FwKTsK
KwkJaWYgKCFwcF9mdW5jcyB8fCAhcHBfZnVuY3MtPmdldF9hc2ljX2JhY29fY2FwYWJpbGl0eSkg
eworCQkJKmNhcCA9IGZhbHNlOworCQkJcmV0dXJuIC1FTk9FTlQ7CisJCX0KKworCQlyZXR1cm4g
cHBfZnVuY3MtPmdldF9hc2ljX2JhY29fY2FwYWJpbGl0eShwcF9oYW5kbGUsIGNhcCk7CisJfQog
fQogCiBzdGF0aWMgaW50IHNvYzE1X2FzaWNfYmFjb19yZXNldChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIHsKLQl2b2lkICpwcF9oYW5kbGUgPSBhZGV2LT5wb3dlcnBsYXkucHBfaGFuZGxl
OwotCWNvbnN0IHN0cnVjdCBhbWRfcG1fZnVuY3MgKnBwX2Z1bmNzID0gYWRldi0+cG93ZXJwbGF5
LnBwX2Z1bmNzOworCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkgeworCQlzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSA9ICZhZGV2LT5zbXU7CiAKLQlpZiAoIXBwX2Z1bmNzIHx8IXBwX2Z1bmNz
LT5nZXRfYXNpY19iYWNvX3N0YXRlIHx8IXBwX2Z1bmNzLT5zZXRfYXNpY19iYWNvX3N0YXRlKQot
CQlyZXR1cm4gLUVOT0VOVDsKKwkJZGV2X2luZm8oYWRldi0+ZGV2LCAiR1BVIEJBQ08gcmVzZXRc
biIpOworCisJCXJldHVybiBzbXVfYmFjb19yZXNldChzbXUpOworCX0gZWxzZSB7CisJCXZvaWQg
KnBwX2hhbmRsZSA9IGFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGU7CisJCWNvbnN0IHN0cnVjdCBh
bWRfcG1fZnVuY3MgKnBwX2Z1bmNzID0gYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzOwogCi0JLyog
ZW50ZXIgQkFDTyBzdGF0ZSAqLwotCWlmIChwcF9mdW5jcy0+c2V0X2FzaWNfYmFjb19zdGF0ZShw
cF9oYW5kbGUsIDEpKQotCQlyZXR1cm4gLUVJTzsKKwkJaWYgKCFwcF9mdW5jcyB8fCFwcF9mdW5j
cy0+Z2V0X2FzaWNfYmFjb19zdGF0ZSB8fCFwcF9mdW5jcy0+c2V0X2FzaWNfYmFjb19zdGF0ZSkK
KwkJCXJldHVybiAtRU5PRU5UOwogCi0JLyogZXhpdCBCQUNPIHN0YXRlICovCi0JaWYgKHBwX2Z1
bmNzLT5zZXRfYXNpY19iYWNvX3N0YXRlKHBwX2hhbmRsZSwgMCkpCi0JCXJldHVybiAtRUlPOwor
CQkvKiBlbnRlciBCQUNPIHN0YXRlICovCisJCWlmIChwcF9mdW5jcy0+c2V0X2FzaWNfYmFjb19z
dGF0ZShwcF9oYW5kbGUsIDEpKQorCQkJcmV0dXJuIC1FSU87CiAKLQlkZXZfaW5mbyhhZGV2LT5k
ZXYsICJHUFUgQkFDTyByZXNldFxuIik7CisJCS8qIGV4aXQgQkFDTyBzdGF0ZSAqLworCQlpZiAo
cHBfZnVuY3MtPnNldF9hc2ljX2JhY29fc3RhdGUocHBfaGFuZGxlLCAwKSkKKwkJCXJldHVybiAt
RUlPOwogCi0JcmV0dXJuIDA7CisJCWRldl9pbmZvKGFkZXYtPmRldiwgIkdQVSBCQUNPIHJlc2V0
XG4iKTsKKworCQlyZXR1cm4gMDsKKwl9CiB9CiAKIHN0YXRpYyBpbnQgc29jMTVfbW9kZTJfcmVz
ZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
