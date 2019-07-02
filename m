Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A645D784
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0928D6E083;
	Tue,  2 Jul 2019 20:29:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131AD6E084
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:41 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h21so20130572qtn.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6tTKyhfrdEM7eGU9Eu/VxkK7BYrZmQgmbHdkfF6E0P8=;
 b=jDJP/ujco0jT+exzHXRbOm07v2Ey78NyAZGi790yn+aXziMsCsp6nNkU5XDB/KU8hl
 LuG8ocohABCgTHTJCBbyYlMp4Shp07Z1mdYWb/i+gIAWUQfejgZ1F97kRFF76DBHVM5m
 +pZZqZHA8QTJW+Tz5SgZOlYYQndLICdujrC74wPX0ngG73derixxYBumPLaIZuWgumdW
 i+fcsqIbw0PJqLDBd0jCbMmGqEeynTbYrZ6b5I3NMJjO8ytahryKgTugQtDxblhIwowq
 0xPDCHWn/kjUS6GwPLiCbenUqCetqt9bpSmDao2syjiHDaDoOt8EYuxeQJBmK/rMrQCE
 6lOw==
X-Gm-Message-State: APjAAAWFTwEYmPbZzxv9mkkXqBVhLyAqabUKSiT8R6VrjAnr8/DTx4wV
 KY/x0eHT16TGcHhSU/V8vDe16s8z1vg=
X-Google-Smtp-Source: APXvYqySwbZtVgSF3oFGylI0hLZHndk77jrC7lf0G49JDkLbtsLzo9uRhdUpaCaNI4khCPk9O7J2oQ==
X-Received: by 2002:a0c:d91b:: with SMTP id p27mr27759390qvj.236.1562099379677; 
 Tue, 02 Jul 2019 13:29:39 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 50/53] drm/amdgpu/vcn: enable indirect DPG SRAM mode for navi14
Date: Tue,  2 Jul 2019 15:28:41 -0500
Message-Id: <20190702202844.17001-51-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6tTKyhfrdEM7eGU9Eu/VxkK7BYrZmQgmbHdkfF6E0P8=;
 b=Nh/yeLvqNFB1Nydu5YbgQKPQVBNijm32GoHlDyZBsCd36ikKBUJlGZmkr+f685BPrp
 McW+e0dZ9682Wg+XZOLFJEgVQvKLNBNCiGQo/6ApKUI3DSErR1SLCbKM7XzCwtbUyKB7
 khw+HeuSDIGLr6Xhm2mi5MNUHhtMdtedwPo+uu3hdcZRB207MWanp+GSSdOJwZa1mPlV
 nmazGnB9j8MHhq3wpysj7YkknWbjLkMMQI1FpQhnAPx3hxvylTEM4Usgws8g+dKPCydB
 c/gYbyUJodtzh1y+xFT14zjp0TJt430jvMvmJr6fI0veBsQnsn3TSGTr/us98Ry0KTin
 gwzQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkVuYWJsZSBWQ04gZHlu
YW1pYyBwb3dlcmdhdGluZyBmb3IgbmF2aTE0LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFu
IDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IExlbyBMaXUgPGxlby5saXVAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyB8IDMgKysr
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jICAgICAgICAgfCAzICsrLQogMiBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKaW5kZXggZjNhYWY1NTMxYzBlLi44YTE2MmJkYWQ3OWUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKQEAgLTgzLDYgKzgzLDkg
QEAgaW50IGFtZGdwdV92Y25fc3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJ
YnJlYWs7CiAgICAgY2FzZSBDSElQX05BVkkxNDoKIAkJZndfbmFtZSA9IEZJUk1XQVJFX05BVkkx
NDsKKwkJaWYgKChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQ
KSAmJgorCQkgICAgKGFkZXYtPnBnX2ZsYWdzICYgQU1EX1BHX1NVUFBPUlRfVkNOX0RQRykpCisJ
CQlhZGV2LT52Y24uaW5kaXJlY3Rfc3JhbSA9IHRydWU7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJ
CXJldHVybiAtRUlOVkFMOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
bnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKaW5kZXggMWIyYjU1YmUzZDE0
Li45ZTIxZTIyM2U3YmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwpAQCAtNTQ2LDcgKzU0Niw4
IEBAIHN0YXRpYyBpbnQgbnZfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCQkJQU1E
X0NHX1NVUFBPUlRfVkNOX01HQ0cgfAogCQkJQU1EX0NHX1NVUFBPUlRfQklGX01HQ0cgfAogCQkJ
QU1EX0NHX1NVUFBPUlRfQklGX0xTOwotCQlhZGV2LT5wZ19mbGFncyA9IEFNRF9QR19TVVBQT1JU
X1ZDTjsKKwkJYWRldi0+cGdfZmxhZ3MgPSBBTURfUEdfU1VQUE9SVF9WQ04gfAorCQkJQU1EX1BH
X1NVUFBPUlRfVkNOX0RQRzsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRldi0+cmV2X2lk
ICsgMHgxOyAvKiA/Pz8gKi8KIAkJYnJlYWs7CiAJZGVmYXVsdDoKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
