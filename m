Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 262B9A85D9
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637FA8926B;
	Wed,  4 Sep 2019 15:02:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9216A8925E
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:02:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g207so3684017wmg.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 04 Sep 2019 08:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SdKWeuYyy0aS4EI/QzpxAkNUKG/0T1FoI8pYN1xA+Po=;
 b=g/cBQsGxZ/ZFKOIVJHk5W+cVfNZUcDycKoxfSowwSeALkzKYpmGYzjYF7ipkau4Ljm
 zZSVhdGay2TYe6bMbSPIdQMEOhCX/L7NPk54qJwIxhRAj0M00a6G8Q41GdbKtmqTsdKX
 pWC+mF/Zw3U6lTOSz+CrbS+DLuLtmU40Rj5K7TJJW+xa9sYKTnrduucKr8GBTp7aqHtR
 cv6VQTU8e4M1hLdQubkWbmYYlsPvQ9LqVRUDL//zyu14m3KP++cBVmMlORNFG4rokV1x
 KhK9Iady2YWl/ew31hBZRSS4PA4nM9XfLIMj43IoRjq3rH/ByE7Yi9M3l7oesW9x4eHN
 mbVA==
X-Gm-Message-State: APjAAAUAAlWw7s+QjKM4DIXN6dJuuZY178S48c1RS0+S0+rR1fZhqr8N
 qHUzNDqbKaPYzl5jhpgX7tUIm6hE
X-Google-Smtp-Source: APXvYqwTwVfdvmxPG+ROxDvlcnOdoHPuKcJCzjDRLbb9nESV6XprMtHDsM35EIDn740cZ+JvwkIf0w==
X-Received: by 2002:a7b:c447:: with SMTP id l7mr2388897wmi.33.1567609353966;
 Wed, 04 Sep 2019 08:02:33 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6124:f264:ed7d:d416])
 by smtp.gmail.com with ESMTPSA id o9sm25928802wrj.17.2019.09.04.08.02.33
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 08:02:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/9] drm/ttm: return -EBUSY on pipelining with no_gpu_wait
Date: Wed,  4 Sep 2019 17:02:22 +0200
Message-Id: <20190904150230.13885-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904150230.13885-1-christian.koenig@amd.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SdKWeuYyy0aS4EI/QzpxAkNUKG/0T1FoI8pYN1xA+Po=;
 b=jncg57Jh75dfBIBKAf8w1v2pqDSb8zLNbqFx3zyWEzql7lgk+cfejn8K6Gnh7k6Xr4
 Rgs8zppPBSVK0coHOtTJEhBvpNlPD1MBfFSu2C+EVmS0xUX/ovx9YniiWxyjbYpiJbFr
 3OEWNszLGNYNY6ahm8VmOOqIPCIQQ1cINxz93ag+XtRAFFbJaL2tDGhR7m1fHL/DAQ+i
 9UH44NDaLucTD/PPc6yx5M4fJkJ69lUXbBqjnMw9Kqc0lqFMEmnHyxH7od8ruAi4murF
 4bheC/KF7EoG4YnybtFEJwQanBcH87XrxRvGih8sPFWJFk0pJWur5W1ffykHdmGOgAND
 BapQ==
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

U2V0dGluZyB0aGUgbm9fZ3B1X3dhaXQgZmxhZyBtZWFucyB0aGF0IHRoZSBhbGxvY2F0ZSBCTyBt
dXN0IGJlIGF2YWlsYWJsZQppbW1lZGlhdGVseSBhbmQgd2UgY2FuJ3Qgd2FpdCBmb3IgYW55IEdQ
VSBvcGVyYXRpb24gdG8gZmluaXNoLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMgfCA0MyArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpp
bmRleCAyMDcwZThhNTdlZDguLjI4OTk3MDIxMzlmYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBAIC05
MjQsNyArOTI0LDggQEAgRVhQT1JUX1NZTUJPTCh0dG1fYm9fbWVtX3B1dCk7CiAgKi8KIHN0YXRp
YyBpbnQgdHRtX2JvX2FkZF9tb3ZlX2ZlbmNlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
CiAJCQkJIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAotCQkJCSBzdHJ1Y3QgdHRt
X21lbV9yZWcgKm1lbSkKKwkJCQkgc3RydWN0IHR0bV9tZW1fcmVnICptZW0sCisJCQkJIGJvb2wg
bm9fd2FpdF9ncHUpCiB7CiAJc3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7CiAJaW50IHJldDsKQEAg
LTkzMywxOSArOTM0LDIyIEBAIHN0YXRpYyBpbnQgdHRtX2JvX2FkZF9tb3ZlX2ZlbmNlKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJZmVuY2UgPSBkbWFfZmVuY2VfZ2V0KG1hbi0+bW92
ZSk7CiAJc3Bpbl91bmxvY2soJm1hbi0+bW92ZV9sb2NrKTsKIAotCWlmIChmZW5jZSkgewotCQly
ZXNlcnZhdGlvbl9vYmplY3RfYWRkX3NoYXJlZF9mZW5jZShiby0+cmVzdiwgZmVuY2UpOworCWlm
ICghZmVuY2UpCisJCXJldHVybiAwOwogCi0JCXJldCA9IHJlc2VydmF0aW9uX29iamVjdF9yZXNl
cnZlX3NoYXJlZChiby0+cmVzdiwgMSk7Ci0JCWlmICh1bmxpa2VseShyZXQpKSB7Ci0JCQlkbWFf
ZmVuY2VfcHV0KGZlbmNlKTsKLQkJCXJldHVybiByZXQ7Ci0JCX0KKwlpZiAobm9fd2FpdF9ncHUp
CisJCXJldHVybiAtRUJVU1k7CisKKwlyZXNlcnZhdGlvbl9vYmplY3RfYWRkX3NoYXJlZF9mZW5j
ZShiby0+cmVzdiwgZmVuY2UpOwogCi0JCWRtYV9mZW5jZV9wdXQoYm8tPm1vdmluZyk7Ci0JCWJv
LT5tb3ZpbmcgPSBmZW5jZTsKKwlyZXQgPSByZXNlcnZhdGlvbl9vYmplY3RfcmVzZXJ2ZV9zaGFy
ZWQoYm8tPnJlc3YsIDEpOworCWlmICh1bmxpa2VseShyZXQpKSB7CisJCWRtYV9mZW5jZV9wdXQo
ZmVuY2UpOworCQlyZXR1cm4gcmV0OwogCX0KIAorCWRtYV9mZW5jZV9wdXQoYm8tPm1vdmluZyk7
CisJYm8tPm1vdmluZyA9IGZlbmNlOwogCXJldHVybiAwOwogfQogCkBAIC05NzQsNyArOTc4LDcg
QEAgc3RhdGljIGludCB0dG1fYm9fbWVtX2ZvcmNlX3NwYWNlKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdCAqYm8sCiAJCQlyZXR1cm4gcmV0OwogCX0gd2hpbGUgKDEpOwogCi0JcmV0dXJuIHR0bV9i
b19hZGRfbW92ZV9mZW5jZShibywgbWFuLCBtZW0pOworCXJldHVybiB0dG1fYm9fYWRkX21vdmVf
ZmVuY2UoYm8sIG1hbiwgbWVtLCBjdHgtPm5vX3dhaXRfZ3B1KTsKIH0KIAogc3RhdGljIHVpbnQz
Ml90IHR0bV9ib19zZWxlY3RfY2FjaGluZyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1h
biwKQEAgLTExMTYsMTMgKzExMjAsMTYgQEAgaW50IHR0bV9ib19tZW1fc3BhY2Uoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKIAkJaWYgKHVubGlrZWx5KHJldCkpCiAJCQlnb3RvIGVycm9y
OwogCi0JCWlmIChtZW0tPm1tX25vZGUpIHsKLQkJCXJldCA9IHR0bV9ib19hZGRfbW92ZV9mZW5j
ZShibywgbWFuLCBtZW0pOwotCQkJaWYgKHVubGlrZWx5KHJldCkpIHsKLQkJCQkoKm1hbi0+ZnVu
Yy0+cHV0X25vZGUpKG1hbiwgbWVtKTsKLQkJCQlnb3RvIGVycm9yOwotCQkJfQotCQkJcmV0dXJu
IDA7CisJCWlmICghbWVtLT5tbV9ub2RlKQorCQkJY29udGludWU7CisKKwkJcmV0ID0gdHRtX2Jv
X2FkZF9tb3ZlX2ZlbmNlKGJvLCBtYW4sIG1lbSwgY3R4LT5ub193YWl0X2dwdSk7CisJCWlmICh1
bmxpa2VseShyZXQpKSB7CisJCQkoKm1hbi0+ZnVuYy0+cHV0X25vZGUpKG1hbiwgbWVtKTsKKwkJ
CWlmIChyZXQgPT0gLUVCVVNZKQorCQkJCWNvbnRpbnVlOworCisJCQlnb3RvIGVycm9yOwogCQl9
CiAJfQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
