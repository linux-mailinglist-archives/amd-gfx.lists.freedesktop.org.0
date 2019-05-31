Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE39C31286
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 18:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE26893A8;
	Fri, 31 May 2019 16:37:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDE3893A8
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 16:37:15 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id s57so1591612qte.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 09:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TRjWZhV19zwaFYeuZKqg4kid8eKseAKI2B3Uxam6NmE=;
 b=N+5pEXXdXIk/DAIdQDMGYeC1jABKDfnNcRXBjBE4U50/XTqawnQbHLeq5XK8yg5QkI
 pcdi8I8S19avev1QgI9+qgJ+yh1zDSJ9JnWIwSIgr0xELO4le5opNBQ9CC5vLLt+T2+Q
 o+lVwHCUlj2B9em1+5hKh+I7NCdJxSbPJDPSkNkuhVUtprx61e9EPlDzHeLGdnrD53oY
 5TyKKQutoxBdpjPIslBXFXS96bDPUfgh6Xf3INHPaSvU2yIcjJYgt8+UODeV3+G0oWl4
 PI7ol4D7XI/ZyEHDOt0XqA99BfgDBMcKr082RUhUUTsjYy6OeeRk+cI9LDij/93y3hJs
 LAiA==
X-Gm-Message-State: APjAAAUM/TCIeQUrfKBwhM6U2amf3afe6jmQPkACHRutd85HcK69mqQ6
 OIMnJ5QxKwsUSP+VOgvhfWFup+E+
X-Google-Smtp-Source: APXvYqxmRA6kMQNm3PWjNiM1dGuZVT0enNbV4HGw+2acQCWRaXfwIV59Ju3GX+fw010YUFee17l9Cg==
X-Received: by 2002:ac8:2bbb:: with SMTP id m56mr10128879qtm.298.1559320634018; 
 Fri, 31 May 2019 09:37:14 -0700 (PDT)
Received: from localhost.localdomain ([71.219.72.228])
 by smtp.gmail.com with ESMTPSA id y19sm4203486qty.43.2019.05.31.09.37.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 31 May 2019 09:37:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/display: Drop some new CONFIG_DRM_AMD_DC_DCN1_01
 guards
Date: Fri, 31 May 2019 11:37:06 -0500
Message-Id: <20190531163707.21363-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TRjWZhV19zwaFYeuZKqg4kid8eKseAKI2B3Uxam6NmE=;
 b=ch2SZcvBN84+62+FNaYUOIzFejJzz+IBuoHWyDdsF6H9pHKU2MJYcAcYdTlF6+zibU
 URQActLH6yRvdNx867NO6FLFQ2dopX6CE68CCXttJooLcSPi+wInbnAtAnGgOJmNhtQq
 Ry8M2hkbXoCoRmn7KiBJBSv3w6eRQaraRx34/82m1AdMB/85Pgf9I5xZ3keRZrJ25IY/
 x/Rr4N6UFYvJ7VxD4MoN75vMa06Qd15QJvmBVvJOHw9qUq9DKpgm5jTBnSEv6o4e2e9o
 yTDvKdl6P8FFPlnJs3Ld5tNAdF56qhLznJZZDNAajGtCFh/wmzcYGZ3Xt1dJDLAoSLS5
 ZYbQ==
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

VGhlc2UgZ290IGFkZGVkIGJhY2sgYnkgc3Vic2VxdWVudCBtZXJnZXMgYWNjaWRlbnRseS4KClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMiAt
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvY2xrX21nci5jICB8IDQg
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDMzZTM5ODg4MjEx
Yy4uYjVhNWNmYWU3YmExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTY2NSwxMyArNjY1LDExIEBAIHN0YXRpYyBpbnQgbG9h
ZF9kbWN1X2Z3KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWNhc2UgQ0hJUF9WRUdBMjA6
CiAJCXJldHVybiAwOwogCWNhc2UgQ0hJUF9SQVZFTjoKLSNpZiBkZWZpbmVkKENPTkZJR19EUk1f
QU1EX0RDX0RDTjFfMDEpCiAJCWlmIChBU0lDUkVWX0lTX1BJQ0FTU08oYWRldi0+ZXh0ZXJuYWxf
cmV2X2lkKSkKIAkJCWZ3X25hbWVfZG1jdSA9IEZJUk1XQVJFX1JBVkVOX0RNQ1U7CiAJCWVsc2Ug
aWYgKEFTSUNSRVZfSVNfUkFWRU4yKGFkZXYtPmV4dGVybmFsX3Jldl9pZCkpCiAJCQlmd19uYW1l
X2RtY3UgPSBGSVJNV0FSRV9SQVZFTl9ETUNVOwogCQllbHNlCi0jZW5kaWYKIAkJCXJldHVybiAw
OwogCQlicmVhazsKIAlkZWZhdWx0OgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2Nsa19tZ3IvY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Nsa19tZ3IvY2xrX21nci5jCmluZGV4IDA4YjI3Yzc3NWNkNC4uZWIyMjA0ZDQyMzM3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9jbGtfbWdy
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvY2xrX21nci5j
CkBAIC0xMDUsMTQgKzEwNSwxMCBAQCBzdHJ1Y3QgY2xrX21nciAqZGNfY2xrX21ncl9jcmVhdGUo
c3RydWN0IGRjX2NvbnRleHQgKmN0eCwgc3RydWN0IHBwX3NtdV9mdW5jcyAqcAogCiAjaWYgZGVm
aW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04xXzApCiAJY2FzZSBGQU1JTFlfUlY6Ci0KLSNpZiBk
ZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjFfMDEpCiAJCWlmIChBU0lDUkVWX0lTX1JBVkVO
Mihhc2ljX2lkLmh3X2ludGVybmFsX3JldikpIHsKIAkJCXJ2Ml9jbGtfbWdyX2NvbnN0cnVjdChj
dHgsIGNsa19tZ3IsIHBwX3NtdSk7CiAJCQlicmVhazsKIAkJfQotI2VuZGlmCS8qIERDTjFfMDEg
Ki8KLQogCQlpZiAoQVNJQ1JFVl9JU19SQVZFTihhc2ljX2lkLmh3X2ludGVybmFsX3JldikgfHwK
IAkJCQlBU0lDUkVWX0lTX1BJQ0FTU08oYXNpY19pZC5od19pbnRlcm5hbF9yZXYpKSB7CiAJCQly
djFfY2xrX21ncl9jb25zdHJ1Y3QoY3R4LCBjbGtfbWdyLCBwcF9zbXUpOwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
