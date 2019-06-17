Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D6C4901C
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D980189F43;
	Mon, 17 Jun 2019 19:47:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCAB89F27
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:02 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id i125so6988500qkd.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/7oYTlk+lgQrxMAqRytAdBguN6RqPimPVS4hLIiWEJ8=;
 b=cwlmpv5nQqYW/F+cwN6tT+uUYRcApQ98LGg+PxRWliwkpJo3po49lZpmiEpto3h/JT
 eLmbnwjbMJQEtOt98LjyN9NEVC1Fh3OkFFSdkNtfBtjZmFVi7f8eLDEWiP2ic0pFiliM
 o/QfHzD2hEX46U3o9fKmW8quyoa9TgrOD1+le5vVY3cyLckyfpBVndYsWDpjkm4FJ65i
 Pg1rlxPcF0g0hTiWsx+lDDueyy4VB+cvGRWZSg3AllKTCsLvK4I508VmEQ1tjHx/zP4E
 ibS6f6KyhkuO4s94jhllH4HBenEdqkNkHoh8x4fSwDGYAo17Uf8jM1anKTxeNhkDw5xH
 d+Sw==
X-Gm-Message-State: APjAAAWB03KF6fzcWp2FeqMqTWfA7sHlymISNC/0xecmWyZU+NOUlk0R
 X8O83/j4Wg+HsP+jyXu2OcnD9mW1LtaUAQ==
X-Google-Smtp-Source: APXvYqxrwvxknix1Bpv6ffKrLLwYp7Nh4FXMrwSSCoMiOp0AAz1ZUay64Cgk9Yhuu79d2LrrM7NQ+Q==
X-Received: by 2002:a37:4b56:: with SMTP id y83mr47541529qka.338.1560800821065; 
 Mon, 17 Jun 2019 12:47:01 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 364/459] drm/amd/display: clean up validation failure log spam
Date: Mon, 17 Jun 2019 14:45:05 -0500
Message-Id: <20190617194540.18497-65-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/7oYTlk+lgQrxMAqRytAdBguN6RqPimPVS4hLIiWEJ8=;
 b=DfAomEZKaepbX7Ou5dox34QY7O7Oy329m7Olaif791rGILhamr2MHEUFV0JxmB2CCb
 zmS0tH24QDISmGl+/ascVENFqjxeL6y2QTsEBQcw5bBJYHXIacixQ3r291sI1NGhTCl+
 LV/dcd0RtQMAzXs9fL8dUdWumTCZIRjwpaTEGftcea4Xl/qxYtPO5E1mrjk99vy8dH3D
 /W4AoR4wChJ/WYGnIaAEpYettsZXG1ZbrqI67A9qo5Cust1NHyIpdHVzq3RdGHQT/ifU
 GA9/8vIhObBU8JmR4qGxS3QrwjXG0taphOmqq9zgzw/pHkO1o6+hZJkN6vilL3+93rBh
 JmNg==
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkN1
cnJlbnRseSBkY24yKyB2YWxpZGF0aW9uIHdpbGwgdW5jb25kaXRpb25hbGx5IHByaW50IGEgZmFp
bHVyZQpyZWFzb24gYmVmb3JlIHZhbGlkYXRpb24gY29tcGxldGVzLiBUaGlzIGNoYW5nZSBjYXRl
Z29yaXplcyB0aGUKZmFpbHVyZSByZWFzb24gYXMgYSB3YXJuaW5nIGxvZyBhbmQgb25seSBwcmlu
dHMgYXQgdGhlIGVuZCBvZgp2YWxpZGF0aW9uIHJlc29sdmluZyBmYWxzZSBwb3NpdGl2ZXMuCgpT
aWduZWQtb2ZmLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5MYWt0eXVzaGtpbkBhbWQu
Y29tPgpSZXZpZXdlZC1ieTogTmlrb2xhIENvcm5paiA8Tmlrb2xhLkNvcm5pakBhbWQuY29tPgpB
Y2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jICAgIHwgIDMgKysrCiAuLi4vZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3ZiYS5jICAgIHwgMTIgKy0tLS0tLS0t
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jl
c291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVz
b3VyY2UuYwppbmRleCBlMmE2ZTgwMDEzZjMuLjQ5MTE0ZDgyMzI0MCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKQEAg
LTE4ODAsNiArMTg4MCw3IEBAIGJvb2wgZGNuMjBfdmFsaWRhdGVfYmFuZHdpZHRoKHN0cnVjdCBk
YyAqZGMsCiAJaW50IHNwbGl0X3RocmVzaG9sZCA9IGRjLT5yZXNfcG9vbC0+cGlwZV9jb3VudCAv
IDI7CiAJYm9vbCBhdm9pZF9zcGxpdCA9IGRjLT5kZWJ1Zy5waXBlX3NwbGl0X3BvbGljeSAhPSBN
UENfU1BMSVRfRFlOQU1JQzsKIAlkaXNwbGF5X2UyZV9waXBlX3BhcmFtc19zdCAqcGlwZXMgPSBr
emFsbG9jKGRjLT5yZXNfcG9vbC0+cGlwZV9jb3VudCAqIHNpemVvZihkaXNwbGF5X2UyZV9waXBl
X3BhcmFtc19zdCksIEdGUF9LRVJORUwpOworCURDX0xPR0dFUl9JTklUKGRjLT5jdHgtPmxvZ2dl
cik7CiAKIAlBU1NFUlQocGlwZXMpOwogCWlmICghcGlwZXMpCkBAIC0yMTgzLDYgKzIxODQsOCBA
QCBib29sIGRjbjIwX3ZhbGlkYXRlX2JhbmR3aWR0aChzdHJ1Y3QgZGMgKmRjLAogCXJldHVybiB0
cnVlOwogCiB2YWxpZGF0ZV9mYWlsOgorCURDX0xPR19XQVJOSU5HKCJNb2RlIFZhbGlkYXRpb24g
V2FybmluZzogJXMgZmFpbGVkIHZhbGlkYXRpb24uXG4iLAorCQlkbWxfZ2V0X3N0YXR1c19tZXNz
YWdlKGNvbnRleHQtPmJ3X2N0eC5kbWwudmJhLlZhbGlkYXRpb25TdGF0dXNbY29udGV4dC0+Yndf
Y3R4LmRtbC52YmEuc29jLm51bV9zdGF0ZXNdKSk7CiAJa2ZyZWUocGlwZXMpOwogCXJldHVybiBm
YWxzZTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwv
ZGlzcGxheV9tb2RlX3ZiYS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9k
aXNwbGF5X21vZGVfdmJhLmMKaW5kZXggMzU2MDMxOWE1YzZmLi43ZjNlYTc0MGJmZTggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3Zi
YS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2Rl
X3ZiYS5jCkBAIC03MywxNyArNzMsNyBAQCB1bnNpZ25lZCBpbnQgZG1sX2dldF92b2x0YWdlX2xl
dmVsKAogCQlmZXRjaF9waXBlX3BhcmFtcyhtb2RlX2xpYik7CiAJCVBpeGVsQ2xvY2tBZGp1c3Rt
ZW50Rm9yUHJvZ3Jlc3NpdmVUb0ludGVybGFjZVVuaXQobW9kZV9saWIpOwogCX0KLQkJbW9kZV9s
aWItPmZ1bmNzLnZhbGlkYXRlKG1vZGVfbGliKTsKLQotCS8qIGNoZWNrIGlmIE1vZGUgU3VwcG9y
dCBWYWxpZGF0aW9uIGZhaWxlZCAqLwotCWlmIChtb2RlX2xpYi0+dmJhLlZvbHRhZ2VMZXZlbCA+
IG1vZGVfbGliLT52YmEuc29jLm51bV9zdGF0ZXMpIHsKLQkJLyogZ2V0IHRoZSB2YWxpZGF0aW9u
IHN0YXR1cyBmb3IgaGlnaGVzdCB2b2x0YWdlIGxldmVsIGFuZCBvdXRwdXQgY29uc29sZSBtZXNz
YWdlICovCi0JCWVudW0gZG1fdmFsaWRhdGlvbl9zdGF0dXMgc3RhdHVzID0gbW9kZV9saWItPnZi
YS5WYWxpZGF0aW9uU3RhdHVzW21vZGVfbGliLT52YmEuc29jLm51bV9zdGF0ZXNdOwotCQlpZiAo
c3RhdHVzICE9IERNTF9GQUlMX1BJVENIX1NVUFBPUlQpIHsKLQkJCS8qQWxpZ25lZFlQaXRjaCBp
cyBiYXNlZCBvbiBzd2l6emxlIG1vZGUsIHNvIGl0IGlzIG5vcm1hbCBpZiBzb21lIHN3aXp6bGUg
bW9kZSBub3Qgc3VwcG9ydGVkKi8KLQkJCWRtX291dHB1dF90b19jb25zb2xlKCJNb2RlIFZhbGlk
YXRpb24gRXJyb3I6ICVzIGZhaWxlZCB2YWxpZGF0aW9uLlxuIiwgZG1sX2dldF9zdGF0dXNfbWVz
c2FnZShzdGF0dXMpKTsKLQkJfQotCX0KKwltb2RlX2xpYi0+ZnVuY3MudmFsaWRhdGUobW9kZV9s
aWIpOwogCiAJcmV0dXJuIG1vZGVfbGliLT52YmEuVm9sdGFnZUxldmVsOwogfQotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
