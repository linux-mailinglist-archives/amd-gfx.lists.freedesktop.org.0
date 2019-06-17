Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFE14907A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39B66E072;
	Mon, 17 Jun 2019 19:50:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8046E07F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:47 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id d23so12336339qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qBvMswcT+m9IRk+ei2tzDGgTjnQ9AJVVofFaytKikxw=;
 b=IWdi+y+KA5zPgMCz2rM6Cf+j/fL0PMm88ToLmb99/aYz9mmhJ631Jf92m23gRXp0WZ
 bSG9T5pn99LMG9wXkQxF8F6EGVjCktRKt0cxrw4oHh85fNym4CGOx+fZHHkDE087EwYS
 spj4Hv24X7nbsp3PmkYMoni+NWdOD4+SYl9LZyZcF3GQNAxCli23PgFywFtTs8rOM2yg
 1EnA9oqc/LZZZ+k3znbJDKzYK4hdpqr1BNRAG73c6V6lzbEeIB4s4oMEct6vjvP5EQ1n
 XwczWHwX1Bv9shg3MDQQbhWNiewWsfHL0k73Fvz6h/LDbUVTlth/3sK1rmxGG8+ZVmxO
 KCog==
X-Gm-Message-State: APjAAAXWJw27yCTtYkLwW48Zssj+WO4XzpI8Rw8cc/KC7jom01waIblc
 0sy0cTMxNqT2anIoIUf4HcJX2Dts2WCYQQ==
X-Google-Smtp-Source: APXvYqwyqFzuZ15OawOlvJ/QSSbHQwMTgtmRlhkfc2IO9v3W8+SIYKFMVumGL20ZHSZ5rybXy3Uemg==
X-Received: by 2002:ac8:3794:: with SMTP id d20mr45475181qtc.392.1560801045832; 
 Mon, 17 Jun 2019 12:50:45 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 449/459] drm/amd/display: Use macro for invalid OPP ID
Date: Mon, 17 Jun 2019 14:49:38 -0500
Message-Id: <20190617194948.18667-50-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qBvMswcT+m9IRk+ei2tzDGgTjnQ9AJVVofFaytKikxw=;
 b=p9A1puKPT9XzWU2r7wW06XSDpasVdPTvBUR+oVb3TgCmqT/ryA75J/3bTEfNsl5CAk
 30dkBWF4c+irauRCTYKYHiKtjsEQIHnFcBia9NehXcGG8mW21yEDi33uGZQCl+RJK4Xz
 YJ0OXQAfVg5Z/8sk6wtzluRrQZ90yHPjAv3Po/3SwqbclDEG43e0hiaXm3Q1o0WdPtMj
 Z/AQpK8RyJFVxpzc3R14xOtip/V4FCnFW8oc8i6A8n2uu94Vqp5/WAXmIUmq2nq3WFjA
 BzLvtxGjWnXL5jxV0ZUYu7dlj5YYngQckZp3UdY//fImLjzy4vfzOwqTZ/LA7rxxaUkO
 Dv4Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VzbGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KCltXSFldClRo
aXMgaXMgbWVhbnQgdG8gbWFrZSBpdCBjbGVhcmVyIHRoYXQgMHhmIGlzIG5vdCBhIHZhbGlkIE9Q
UCBJRCwgYW5kCnRoYXQgY29kZSBtYWtpbmcgdXNlIG9mIE9QUCBJRHMgc2hvdWxkIG5vdCBhY2Nl
cHQgdGhpcyB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IFdlc2xleSBDaGFsbWVycyA8V2VzbGV5LkNo
YWxtZXJzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaGFybGVuZSBMaXUgPENoYXJsZW5lLkxpdUBh
bWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVi
cC5jICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9od19zZXF1ZW5jZXIuYyB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX2h1YnAuYyAgICAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgICAgICAgIHwgNCArKy0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2h1YnAuaCAgICAgICAgICAgICAgfCAy
ICsrCiA1IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVi
cC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1YnAuYwpp
bmRleCAzZjlhZDA5NzY5YjEuLmE0OGQzMTQwMTFhOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1YnAuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5jCkBAIC02Myw3ICs2Myw3IEBAIHZv
aWQgaHVicDFfc2V0X2JsYW5rKHN0cnVjdCBodWJwICpodWJwLCBib29sIGJsYW5rKQogCQl9CiAK
IAkJaHVicC0+bXBjY19pZCA9IDB4ZjsKLQkJaHVicC0+b3BwX2lkID0gMHhmOworCQlodWJwLT5v
cHBfaWQgPSBPUFBfSURfSU5WQUxJRDsKIAl9CiB9CiAKQEAgLTEyNTMsNyArMTI1Myw3IEBAIHZv
aWQgZGNuMTBfaHVicF9jb25zdHJ1Y3QoCiAJaHVicDEtPmh1YnBfc2hpZnQgPSBodWJwX3NoaWZ0
OwogCWh1YnAxLT5odWJwX21hc2sgPSBodWJwX21hc2s7CiAJaHVicDEtPmJhc2UuaW5zdCA9IGlu
c3Q7Ci0JaHVicDEtPmJhc2Uub3BwX2lkID0gMHhmOworCWh1YnAxLT5iYXNlLm9wcF9pZCA9IE9Q
UF9JRF9JTlZBTElEOwogCWh1YnAxLT5iYXNlLm1wY2NfaWQgPSAweGY7CiB9CiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5j
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1
ZW5jZXIuYwppbmRleCBhMmQzYzRmZGM4MDUuLjBiMTUwM2RlMGY3YSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5j
ZXIuYwpAQCAtMTA4NSw3ICsxMDg1LDcgQEAgc3RhdGljIHZvaWQgZGNuMTBfaW5pdF9waXBlcyhz
dHJ1Y3QgZGMgKmRjLCBzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQpCiAJCXBpcGVfY3R4LT5wbGFu
ZV9yZXMuZHBwID0gZHBwOwogCQlwaXBlX2N0eC0+cGxhbmVfcmVzLm1wY2NfaW5zdCA9IGRwcC0+
aW5zdDsKIAkJaHVicC0+bXBjY19pZCA9IGRwcC0+aW5zdDsKLQkJaHVicC0+b3BwX2lkID0gMHhm
OworCQlodWJwLT5vcHBfaWQgPSBPUFBfSURfSU5WQUxJRDsKIAkJaHVicC0+cG93ZXJfZ2F0ZWQg
PSBmYWxzZTsKIAogCQlkYy0+cmVzX3Bvb2wtPm9wcHNbaV0tPm1wY190cmVlX3BhcmFtcy5vcHBf
aWQgPSBkYy0+cmVzX3Bvb2wtPm9wcHNbaV0tPmluc3Q7CkBAIC0yNDM2LDcgKzI0MzYsNyBAQCBz
dGF0aWMgdm9pZCBkY24xMF9hcHBseV9jdHhfZm9yX3N1cmZhY2UoCiAJCWlmIChwaXBlX2N0eC0+
cGxhbmVfc3RhdGUgJiYgIW9sZF9waXBlX2N0eC0+cGxhbmVfc3RhdGUpIHsKIAkJCWlmIChvbGRf
cGlwZV9jdHgtPnN0cmVhbV9yZXMudGcgPT0gdGcgJiYKIAkJCSAgICBvbGRfcGlwZV9jdHgtPnBs
YW5lX3Jlcy5odWJwICYmCi0JCQkgICAgb2xkX3BpcGVfY3R4LT5wbGFuZV9yZXMuaHVicC0+b3Bw
X2lkICE9IDB4ZikKKwkJCSAgICBvbGRfcGlwZV9jdHgtPnBsYW5lX3Jlcy5odWJwLT5vcHBfaWQg
IT0gT1BQX0lEX0lOVkFMSUQpCiAJCQkJZGNuMTBfZGlzYWJsZV9wbGFuZShkYywgb2xkX3BpcGVf
Y3R4KTsKIAkJfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfaHVicC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX2h1YnAuYwppbmRleCA4MjczOGYxMjY1MTcuLmRjYmEyYzUzMjZiMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YnAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHVicC5jCkBAIC02
OTQsNyArNjk0LDcgQEAgYm9vbCBodWJwMl9jb25zdHJ1Y3QoCiAJaHVicDItPmh1YnBfc2hpZnQg
PSBodWJwX3NoaWZ0OwogCWh1YnAyLT5odWJwX21hc2sgPSBodWJwX21hc2s7CiAJaHVicDItPmJh
c2UuaW5zdCA9IGluc3Q7Ci0JaHVicDItPmJhc2Uub3BwX2lkID0gMHhmOworCWh1YnAyLT5iYXNl
Lm9wcF9pZCA9IE9QUF9JRF9JTlZBTElEOwogCWh1YnAyLT5iYXNlLm1wY2NfaWQgPSAweGY7CiAK
IAlyZXR1cm4gdHJ1ZTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX2h3c2VxLmMKaW5kZXggMmNiZmZlMjgwOWI2Li5kNTViMTVmYmZlOTkgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5j
CkBAIC02MDUsNyArNjA1LDcgQEAgc3RhdGljIHZvaWQgZGNuMjBfaW5pdF9odyhzdHJ1Y3QgZGMg
KmRjKQogCQlwaXBlX2N0eC0+cGxhbmVfcmVzLmRwcCA9IGRwcDsKIAkJcGlwZV9jdHgtPnBsYW5l
X3Jlcy5tcGNjX2luc3QgPSBkcHAtPmluc3Q7CiAJCWh1YnAtPm1wY2NfaWQgPSBkcHAtPmluc3Q7
Ci0JCWh1YnAtPm9wcF9pZCA9IDB4ZjsKKwkJaHVicC0+b3BwX2lkID0gT1BQX0lEX0lOVkFMSUQ7
CiAJCWh1YnAtPnBvd2VyX2dhdGVkID0gZmFsc2U7CiAJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLm9w
cCA9IE5VTEw7CiAKQEAgLTEzMDcsNyArMTMwNyw3IEBAIHN0YXRpYyB2b2lkIGRjbjIwX2FwcGx5
X2N0eF9mb3Jfc3VyZmFjZSgKIAkJaWYgKHBpcGVfY3R4LT5wbGFuZV9zdGF0ZSAmJiAhb2xkX3Bp
cGVfY3R4LT5wbGFuZV9zdGF0ZSkgewogCQkJaWYgKG9sZF9waXBlX2N0eC0+c3RyZWFtX3Jlcy50
ZyA9PSB0ZyAmJgogCQkJICAgIG9sZF9waXBlX2N0eC0+cGxhbmVfcmVzLmh1YnAgJiYKLQkJCSAg
ICBvbGRfcGlwZV9jdHgtPnBsYW5lX3Jlcy5odWJwLT5vcHBfaWQgIT0gMHhmKQorCQkJICAgIG9s
ZF9waXBlX2N0eC0+cGxhbmVfcmVzLmh1YnAtPm9wcF9pZCAhPSBPUFBfSURfSU5WQUxJRCkKIAkJ
CQlkY24yMF9kaXNhYmxlX3BsYW5lKGRjLCBvbGRfcGlwZV9jdHgpOwogCQl9CiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvaHVicC5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9odWJwLmgKaW5kZXggZmE5OGM5NmQwMDQ2
Li4zNDI0Nzc4MjJkYzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9pbmMvaHcvaHVicC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMv
aHcvaHVicC5oCkBAIC0yOCw2ICsyOCw4IEBACiAKICNpbmNsdWRlICJtZW1faW5wdXQuaCIKIAor
I2RlZmluZSBPUFBfSURfSU5WQUxJRCAweGYKKwogCiBlbnVtIGN1cnNvcl9waXRjaCB7CiAJQ1VS
U09SX1BJVENIXzY0X1BJWEVMUyA9IDAsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
