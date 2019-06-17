Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD68748F01
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E0C89B49;
	Mon, 17 Jun 2019 19:28:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CCF89AC6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:40 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so12258218qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NsPd5MnUfXe2LAfVqZeJXZbrnk76blAs2ay+bycqpRA=;
 b=sPsLXm+lJB9+aQ8tdb7Gy67Zt75LloKUV+i1QVyc27eLXQ9k5wtYE9ETbwJsn7zP/y
 hRI+BYJ9E94xbfGg/bjVhiEuSS2NvbAExHzH1ln9AkYj4aq+0kWudhzA7NRu1oRKNL7I
 wHZOHlHeR2gbPDVOK3RcDlky8j93tOEmXs+RVQ3oz9TpSz8g0KSISkfvqIC+7KXIDiis
 KhTZa1I/Uffg4kHa5l+p7WRCwsu/Fbj/lHEwVsK1WGJ4RZg/Z3NUEY2jjMCeSxYLjA8h
 0TcE6GZJdv2L5GxXp/f7CMyhFUl2Sa6w13GN2poe0j7zbmvLJUmS7+/fFKWUHinliE5D
 JlXA==
X-Gm-Message-State: APjAAAWLyQW6Q43qYGg2t58tjAHybkJqR8arAwfZjx2v2QmFPw85l9Pk
 Oi+Qp5VEsUMmvG2vN9vuuFQqF33BK84=
X-Google-Smtp-Source: APXvYqwMLUZbGTGMPgHRQkVE/lPilr1nnkGOF+Sc0UPVvn+Hf5RB6HAAKUUS6RkKzDH90iux66WJTQ==
X-Received: by 2002:ac8:5141:: with SMTP id h1mr60726722qtn.15.1560799719303; 
 Mon, 17 Jun 2019 12:28:39 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 193/459] drm/amd/powerplay: set dpm_enabled flag but don't
 enable vcn dpm
Date: Mon, 17 Jun 2019 14:26:58 -0500
Message-Id: <20190617192704.18038-94-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsPd5MnUfXe2LAfVqZeJXZbrnk76blAs2ay+bycqpRA=;
 b=c8GDg+rjqhmyHD8aDz8iJwcvlQvKdX2idWpQVsZRSAT2MZDhrppS7RFHk8PMS9shRq
 NJMqhqtXfGn/OaNohW/Z1VxhJg375f2p9dOv98ROHU6b/vzn8MJDHLgm/oB3lsOGsZux
 UrcT85ICrBgxml4+f4aJbDOaMqQuzqtVmHg68DgjanULJpcJeZynBk+h1Wojg5Dtyy9P
 Ubw0V1HDvJ6uNmsHRGXr4SULl60a4ahBLjzEvxuLCorvJUtuHIE/YhQRAMf+NaVl0tPe
 jF/1Aw0Ct/ZglZPKk8phHy8+iCk4dgjG4RbbkjLa6UlQ4E74FANRCpeSOl/8kXmELJUb
 1IkA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgcGF0Y2ggc2V0cyBkcG1f
ZW5hYmxlZCBmbGFnIGJ1dCBkb24ndCBlbmFibGUgdmNuIGRwbSwgYmVjYXVzZSB2Y24gZHBtCmRv
ZXNuJ3Qgd29yayBzbyBmYXIgYW5kIHdlIG5lZWRzIHRvIGVuYWJsZSB0aGUgc3lzZnMgaW50ZXJm
YWNlcy4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+CkFja2Vk
LWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDUgKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92Y24uYwppbmRleCA2YTc0ZjU0OTllZjcuLjc2NTAxODMyMmFiZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwpAQCAtMjQ5LDcgKzI0OSw3IEBAIHN0YXRp
YyB2b2lkIGFtZGdwdV92Y25faWRsZV93b3JrX2hhbmRsZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3
b3JrKQogCiAJaWYgKGZlbmNlcyA9PSAwKSB7CiAJCWFtZGdwdV9nZnhfb2ZmX2N0cmwoYWRldiwg
dHJ1ZSk7Ci0JCWlmIChhZGV2LT5wbS5kcG1fZW5hYmxlZCkKKwkJaWYgKGFkZXYtPmFzaWNfdHlw
ZSAhPSBDSElQX05BVkkxMCAmJiBhZGV2LT5wbS5kcG1fZW5hYmxlZCkKIAkJCWFtZGdwdV9kcG1f
ZW5hYmxlX3V2ZChhZGV2LCBmYWxzZSk7CiAJCWVsc2UKIAkJCWFtZGdwdV9kZXZpY2VfaXBfc2V0
X3Bvd2VyZ2F0aW5nX3N0YXRlKGFkZXYsIEFNRF9JUF9CTE9DS19UWVBFX1ZDTiwKQEAgLTI2Niw3
ICsyNjYsNyBAQCB2b2lkIGFtZGdwdV92Y25fcmluZ19iZWdpbl91c2Uoc3RydWN0IGFtZGdwdV9y
aW5nICpyaW5nKQogCiAJaWYgKHNldF9jbG9ja3MpIHsKIAkJYW1kZ3B1X2dmeF9vZmZfY3RybChh
ZGV2LCBmYWxzZSk7Ci0JCWlmIChhZGV2LT5wbS5kcG1fZW5hYmxlZCkKKwkJaWYgKGFkZXYtPmFz
aWNfdHlwZSAhPSBDSElQX05BVkkxMCAmJiBhZGV2LT5wbS5kcG1fZW5hYmxlZCkKIAkJCWFtZGdw
dV9kcG1fZW5hYmxlX3V2ZChhZGV2LCB0cnVlKTsKIAkJZWxzZQogCQkJYW1kZ3B1X2RldmljZV9p
cF9zZXRfcG93ZXJnYXRpbmdfc3RhdGUoYWRldiwgQU1EX0lQX0JMT0NLX1RZUEVfVkNOLApkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDA2ZjVlNWNlOWRi
MS4uNjUyOTYzZTUyYTVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1
X3NtdS5jCkBAIC04NjUsMTAgKzg2NSw3IEBAIHN0YXRpYyBpbnQgc211X2h3X2luaXQodm9pZCAq
aGFuZGxlKQogCWlmICghc211LT5wbV9lbmFibGVkKQogCQlhZGV2LT5wbS5kcG1fZW5hYmxlZCA9
IGZhbHNlOwogCWVsc2UKLQkJYWRldi0+cG0uZHBtX2VuYWJsZWQgPSB0cnVlOwotCS8qIFRPRE86
IHdpbGwgc2V0IGRwbV9lbmFibGVkIGZsYWcgd2hpbGUgVkNOIGFuZCBEQUwgRFBNIGlzIHdvcmth
YmxlICovCi0JaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX05BVkkxMCkKLQkJYWRldi0+cG0u
ZHBtX2VuYWJsZWQgPSB0cnVlOworCQlhZGV2LT5wbS5kcG1fZW5hYmxlZCA9IHRydWU7CS8qIFRP
RE86IHdpbGwgc2V0IGRwbV9lbmFibGVkIGZsYWcgd2hpbGUgVkNOIGFuZCBEQUwgRFBNIGlzIHdv
cmthYmxlICovCiAKIAlwcl9pbmZvKCJTTVUgaXMgaW5pdGlhbGl6ZWQgc3VjY2Vzc2Z1bGx5IVxu
Iik7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
