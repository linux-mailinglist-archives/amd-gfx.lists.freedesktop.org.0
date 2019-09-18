Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E74AB69D8
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 19:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18796F615;
	Wed, 18 Sep 2019 17:48:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7B66F3E6;
 Wed, 18 Sep 2019 16:09:55 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id q1so573617ion.1;
 Wed, 18 Sep 2019 09:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BvDGB+V/nASMvCed6TT+EuLlfHR1McV76EsCinnwHUM=;
 b=GOC6GUZ5Toz4bgJ0vet1MExw5RIH8T2VLLCkZmQLRszb3ZnP+gyCVx/yE60+KHYd0b
 EGgGeOkECcbihp/3BQBjaFQlU2T7NMy+ssocHVrk92BjDrCqwy6swb22r/LUdofv+GzC
 XkWIfqKHtHFogL+AaIldp7xQ7ekr9+9C0dLlvuiPWSCUTorWOMxodM9AJ7BoCL3Y1naY
 T5e33IgNR1RVIBPa8JjYhejolOLzfn37OEaG+dOIi2xDYjA3MR0Qbkbaslyab0Hyc0PV
 LL7BYiq/NMGP+wLnVZNonGnvzdrsmJgu/5I1W3cXXF1cKiSCt9/25wH6KSPQfvYVS15Q
 s6IA==
X-Gm-Message-State: APjAAAVCbsP8Xd+TChOWlUCIhgllKKHz3SuVIs2ZUIINvLb0BP3GOg8N
 L0lW/S3Ub6YhqxWll6CdaMo=
X-Google-Smtp-Source: APXvYqynC081DIdUE2EUfE3EbXiFoYcTxuO3RtA0A+9tw6YudCla7BwKQcLYgARe+NwO3SzQR4X5sg==
X-Received: by 2002:a05:6638:294:: with SMTP id
 c20mr5705640jaq.77.1568822994587; 
 Wed, 18 Sep 2019 09:09:54 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id j8sm4315160iog.9.2019.09.18.09.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 09:09:53 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] drm/amdgpu: fix multiple memory leaks
Date: Wed, 18 Sep 2019 11:09:41 -0500
Message-Id: <20190918160943.14105-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 18 Sep 2019 17:48:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BvDGB+V/nASMvCed6TT+EuLlfHR1McV76EsCinnwHUM=;
 b=mMq37Kxp6hZGxxEC+mrqEpd1jfQB1ImzvHtC/zMAstwJSIbX3JTRi+bT22WKwoTVxd
 KFg63MlhFSGijX0KcBtWq7KvYTJLqlxqkHnIlUkfuIU1TNy9LGvijm6SiN/GP7n67f2A
 tzX/BYacuvkTywgrzIPM+MWHqLtxxN7LzCRGDjjtSjIISpxg5OdCCswju0QRub64Z/LY
 O9VSIbn24x0c9ajNW0VoiVjfveHwqVPUU37K5A68IC8jNHa9W3L6naZcIcE5Mjl5J61C
 GAlZDWiGkgiaWhRDL4XEqjnysdXHPlGJc5gSNHocB5wD+m051xHNehw7azQ/6MvwA/KB
 wU0Q==
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, emamd001@umn.edu,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 smccaman@umn.edu, Alex Deucher <alexander.deucher@amd.com>,
 Rex Zhu <Rex.Zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gYWNwX2h3X2luaXQgdGhlcmUgYXJlIHNvbWUgYWxsb2NhdGlvbnMgdGhhdCBuZWVkcyB0byBi
ZSByZWxlYXNlZCBpbgpjYXNlIG9mIGZhaWx1cmU6CgoxLSBhZGV2LT5hY3AuYWNwX2dlbnBkIHNo
b3VsZCBiZSByZWxlYXNlZCBpZiBhbnkgYWxsb2NhdGlvbiBhdHRlbXAgZm9yCmFkZXYtPmFjcC5h
Y3BfY2VsbCwgYWRldi0+YWNwLmFjcF9yZXMgb3IgaTJzX3BkYXRhIGZhaWxzLgoyLSBhbGwgb2Yg
dGhvc2UgYWxsb2NhdGlvbnMgc2hvdWxkIGJlIHJlbGVhc2VkIGlmIHBtX2dlbnBkX2FkZF9kZXZp
Y2UKZmFpbHMuCgpTaWduZWQtb2ZmLWJ5OiBOYXZpZCBFbWFtZG9vc3QgPG5hdmlkLmVtYW1kb29z
dEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcC5j
IHwgMTAgKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
Y3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYwppbmRleCBlYmE0
MmM3NTJiY2EuLmRkM2ZhODViMTFjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2FjcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9hY3AuYwpAQCAtMjMxLDE3ICsyMzEsMjEgQEAgc3RhdGljIGludCBhY3BfaHdfaW5pdCh2b2lk
ICpoYW5kbGUpCiAJYWRldi0+YWNwLmFjcF9jZWxsID0ga2NhbGxvYyhBQ1BfREVWUywgc2l6ZW9m
KHN0cnVjdCBtZmRfY2VsbCksCiAJCQkJCQkJR0ZQX0tFUk5FTCk7CiAKLQlpZiAoYWRldi0+YWNw
LmFjcF9jZWxsID09IE5VTEwpCisJaWYgKGFkZXYtPmFjcC5hY3BfY2VsbCA9PSBOVUxMKSB7CisJ
CWtmcmVlKGFkZXYtPmFjcC5hY3BfZ2VucGQpOwogCQlyZXR1cm4gLUVOT01FTTsKKwl9CiAKIAlh
ZGV2LT5hY3AuYWNwX3JlcyA9IGtjYWxsb2MoNSwgc2l6ZW9mKHN0cnVjdCByZXNvdXJjZSksIEdG
UF9LRVJORUwpOwogCWlmIChhZGV2LT5hY3AuYWNwX3JlcyA9PSBOVUxMKSB7CisJCWtmcmVlKGFk
ZXYtPmFjcC5hY3BfZ2VucGQpOwogCQlrZnJlZShhZGV2LT5hY3AuYWNwX2NlbGwpOwogCQlyZXR1
cm4gLUVOT01FTTsKIAl9CiAKIAlpMnNfcGRhdGEgPSBrY2FsbG9jKDMsIHNpemVvZihzdHJ1Y3Qg
aTJzX3BsYXRmb3JtX2RhdGEpLCBHRlBfS0VSTkVMKTsKIAlpZiAoaTJzX3BkYXRhID09IE5VTEwp
IHsKKwkJa2ZyZWUoYWRldi0+YWNwLmFjcF9nZW5wZCk7CiAJCWtmcmVlKGFkZXYtPmFjcC5hY3Bf
cmVzKTsKIAkJa2ZyZWUoYWRldi0+YWNwLmFjcF9jZWxsKTsKIAkJcmV0dXJuIC1FTk9NRU07CkBA
IC0zNDgsNiArMzUyLDEwIEBAIHN0YXRpYyBpbnQgYWNwX2h3X2luaXQodm9pZCAqaGFuZGxlKQog
CQlyID0gcG1fZ2VucGRfYWRkX2RldmljZSgmYWRldi0+YWNwLmFjcF9nZW5wZC0+Z3BkLCBkZXYp
OwogCQlpZiAocikgewogCQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYWRkIGRldiB0byBnZW5w
ZFxuIik7CisJCQlrZnJlZShhZGV2LT5hY3AuYWNwX2dlbnBkKTsKKwkJCWtmcmVlKGFkZXYtPmFj
cC5hY3BfcmVzKTsKKwkJCWtmcmVlKGFkZXYtPmFjcC5hY3BfY2VsbCk7CisJCQlrZnJlZShpMnNf
cGRhdGEpOwogCQkJcmV0dXJuIHI7CiAJCX0KIAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
