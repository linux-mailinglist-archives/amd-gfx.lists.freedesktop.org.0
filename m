Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2926E15F1F
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 10:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF6389F4F;
	Tue,  7 May 2019 08:15:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E21B89F6D
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 08:15:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p21so19192052wmc.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 May 2019 01:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4jq3mtFjTjvP6SQIg3rsF/ss/UsHGa9CdJjNnavVreA=;
 b=PEeHqRKm6H6vL6NiX7vYR/NQ1cvBOntRKjsJj5Z364C7i8ItphAq27BSn2WcCW6RgJ
 +FvZJOnKkzl5xxwnUxaNETkqeYu3SJJMuoWxxv3qUMJqIeOsAlbOtcq81HOg7RHupl33
 16GIyM9ZySiS9aULapCgK84x17Wcyw2mkzSurl+SbYRM3l/ii3VFpYqhgfyBvd8nQNDU
 +bHJKiSlmNXkRlZP6OqfzOOKy1SZed0KwAT8484eyGANzYYbR5pHkMLvUHgMz6ldqpEP
 VnjAZVjOuwcDDMDk5w1UOM2rBfHJvnWGe5jE0pMD6HRgqPR7YsudYffFdKQwPDP8jMW5
 T7lA==
X-Gm-Message-State: APjAAAW2uFQpv9++AK1oL8Xs4lu7lQpM6KEOM4E92BwnQxV89jk7Aa4I
 7ctVQcg+7tigEdiae5DkpHUOhkII
X-Google-Smtp-Source: APXvYqyoNJ6zBeW+vB35dVFS1gFMGI5+iD+oxm9n+ZQEm+LG9qseUWcY1VV4XJ95XhcPMV0N296LnA==
X-Received: by 2002:a1c:f616:: with SMTP id w22mr5379583wmc.28.1557216920995; 
 Tue, 07 May 2019 01:15:20 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c572:e952:8ef0:ace])
 by smtp.gmail.com with ESMTPSA id v16sm15065476wru.76.2019.05.07.01.15.20
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 01:15:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 9/9] drm/amdgpu: add DMA-buf invalidation callback v2
Date: Tue,  7 May 2019 10:15:12 +0200
Message-Id: <20190507081512.2619-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507081512.2619-1-christian.koenig@amd.com>
References: <20190507081512.2619-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4jq3mtFjTjvP6SQIg3rsF/ss/UsHGa9CdJjNnavVreA=;
 b=RoXmCa5lbxF+N5fvx7tfJ8UD9/aSlZKGt3woyhaMMrUAgUrnKZemU9EPi3XPPBEXr8
 OoLu6gS1P1JBhjsd0kI9dDB66rBdrbbD57BZhtgo6Mxapa4CRlT4e290qQK/r0I41Nhk
 7f+atXQ/sYITpxSMT32D/7BQwJrC9BJPSWZIurHP2tYiRXpuvGbNjVmZ3T4mkhvc0ezE
 VrNvLiL5dk7f5pTOD0FOGQRr4GTyM/HbsfiGMTkoy8Jrw2AoFMNb6VQlcNP33+8hfK0/
 MuBY6SWByJyC3eq845wF4HGMOQF+jKmqhetEsgBH7tzb3uYvDChok43s1sdQULMHhXON
 l7CQ==
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

QWxsb3cgZm9yIGludmFsaWRhdGlvbiBvZiBpbXBvcnRlZCBETUEtYnVmcy4KCnYyOiBhZGQgZG1h
X2J1Zl9waW4vZG1hX2J1Zl91bnBpbiBzdXBwb3J0CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jICB8ICA2ICsrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwppbmRleCAwZjRmZTIxZDFiMmIuLjYz
ZGVkYzkzYzNkNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RtYV9idWYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1
Zi5jCkBAIC00NjUsNiArNDY1LDMyIEBAIGFtZGdwdV9kbWFfYnVmX2NyZWF0ZV9vYmooc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRtYV9idWYgKmRtYV9idWYpCiAJcmV0dXJuIEVSUl9Q
VFIocmV0KTsKIH0KIAorLyoqCisgKiBhbWRncHVfZ2VtX3ByaW1lX2ludmFsaWRhdGVfbWFwcGlu
Z3MgLSAmYXR0YWNoLmludmFsaWRhdGUgaW1wbGVtZW50YXRpb24KKyAqCisgKiBAYXR0YWNoOiB0
aGUgRE1BLWJ1ZiBhdHRhY2htZW50CisgKgorICogSW52YWxpZGF0ZSB0aGUgRE1BLWJ1ZiBhdHRh
Y2htZW50LCBtYWtpbmcgc3VyZSB0aGF0IHRoZSB3ZSByZS1jcmVhdGUgdGhlCisgKiBtYXBwaW5n
IGJlZm9yZSB0aGUgbmV4dCB1c2UuCisgKi8KK3N0YXRpYyB2b2lkCithbWRncHVfZ2VtX3ByaW1l
X2ludmFsaWRhdGVfbWFwcGluZ3Moc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKQor
eworCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7IGZhbHNlLCBmYWxzZSB9OworCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gYXR0YWNoLT5pbXBvcnRlcl9wcml2OworCXN0cnVj
dCBhbWRncHVfYm8gKmJvID0gZ2VtX3RvX2FtZGdwdV9ibyhvYmopOworCXN0cnVjdCB0dG1fcGxh
Y2VtZW50IHBsYWNlbWVudCA9IHt9OworCWludCByOworCisJciA9IHR0bV9ib192YWxpZGF0ZSgm
Ym8tPnRibywgJnBsYWNlbWVudCwgJmN0eCk7CisJaWYgKHIpCisJCURSTV9FUlJPUigiRmFpbGVk
IHRvIGludmFsaWRhdGUgRE1BLWJ1ZiBpbXBvcnQgKCVkKSlcbiIsIHIpOworfQorCitzdGF0aWMg
Y29uc3Qgc3RydWN0IGRtYV9idWZfYXR0YWNoX29wcyBhbWRncHVfZG1hX2J1Zl9hdHRhY2hfb3Bz
ID0geworCS5pbnZhbGlkYXRlID0gYW1kZ3B1X2dlbV9wcmltZV9pbnZhbGlkYXRlX21hcHBpbmdz
Cit9OworCiAvKioKICAqIGFtZGdwdV9nZW1fcHJpbWVfaW1wb3J0IC0gJmRybV9kcml2ZXIuZ2Vt
X3ByaW1lX2ltcG9ydCBpbXBsZW1lbnRhdGlvbgogICogQGRldjogRFJNIGRldmljZQpAQCAtNDk4
LDcgKzUyNCw4IEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqYW1kZ3B1X2dlbV9wcmltZV9pbXBv
cnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAoSVNfRVJSKG9iaikpCiAJCXJldHVybiBv
Ymo7CiAKLQlhdHRhY2ggPSBkbWFfYnVmX2F0dGFjaChkbWFfYnVmLCBkZXYtPmRldik7CisJYXR0
YWNoID0gZG1hX2J1Zl9keW5hbWljX2F0dGFjaChkbWFfYnVmLCBkZXYtPmRldiwKKwkJCQkJJmFt
ZGdwdV9kbWFfYnVmX2F0dGFjaF9vcHMsIG9iaik7CiAJaWYgKElTX0VSUihhdHRhY2gpKSB7CiAJ
CWRybV9nZW1fb2JqZWN0X3B1dChvYmopOwogCQlyZXR1cm4gRVJSX0NBU1QoYXR0YWNoKTsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwppbmRleCBkMjZlMmYwYjg4
ZDIuLmNmMDFkYTA4M2M3NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuYwpAQCAtODUwLDYgKzg1MCw5IEBAIGludCBhbWRncHVfYm9fcGluX3Jlc3RyaWN0ZWQo
c3RydWN0IGFtZGdwdV9ibyAqYm8sIHUzMiBkb21haW4sCiAJCXJldHVybiAwOwogCX0KIAorCWlm
IChiby0+Z2VtX2Jhc2UuaW1wb3J0X2F0dGFjaCkKKwkJZG1hX2J1Zl9waW4oYm8tPmdlbV9iYXNl
LmltcG9ydF9hdHRhY2gpOworCiAJYm8tPmZsYWdzIHw9IEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1f
Q09OVElHVU9VUzsKIAkvKiBmb3JjZSB0byBwaW4gaW50byB2aXNpYmxlIHZpZGVvIHJhbSAqLwog
CWlmICghKGJvLT5mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX05PX0NQVV9BQ0NFU1MpKQpAQCAt
OTMzLDYgKzkzNiw5IEBAIGludCBhbWRncHVfYm9fdW5waW4oc3RydWN0IGFtZGdwdV9ibyAqYm8p
CiAKIAlhbWRncHVfYm9fc3VidHJhY3RfcGluX3NpemUoYm8pOwogCisJaWYgKGJvLT5nZW1fYmFz
ZS5pbXBvcnRfYXR0YWNoKQorCQlkbWFfYnVmX3VucGluKGJvLT5nZW1fYmFzZS5pbXBvcnRfYXR0
YWNoKTsKKwogCWZvciAoaSA9IDA7IGkgPCBiby0+cGxhY2VtZW50Lm51bV9wbGFjZW1lbnQ7IGkr
KykgewogCQliby0+cGxhY2VtZW50c1tpXS5scGZuID0gMDsKIAkJYm8tPnBsYWNlbWVudHNbaV0u
ZmxhZ3MgJj0gflRUTV9QTF9GTEFHX05PX0VWSUNUOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
