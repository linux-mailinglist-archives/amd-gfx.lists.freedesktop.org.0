Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C99839B9F
	for <lists+amd-gfx@lfdr.de>; Sat,  8 Jun 2019 10:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C076F8926B;
	Sat,  8 Jun 2019 08:03:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1532689266;
 Sat,  8 Jun 2019 08:03:07 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a25so3276107lfg.2;
 Sat, 08 Jun 2019 01:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s7x26gCHQ5oTD/qce8eah2RsnVrxXmy+KSp3BN05E7Y=;
 b=EW+Ct85z0V3j8bH1rP+JGDAJmx+kH1HcQlruVK3PSxvb7tINQBPXkG0G01A5tC77CK
 vu2aZPjBJ5thdmJvTyE36wW14J/hAIVv+0Jzk+6GTEZ7jWZrdAmTXxHxhFoIpwhmu7oA
 lzYnhaU4XKa/R81MZ9AdSIIIIduTGfJquWk+KyfE4JqDtc7uzQcJ5yXo4HqCJcsuibEP
 56dEG5+Z0M4czuCYFoaZFnYIOKriiWx3hKYor7LR3YmhNJw505w7E84UB89OZVep/jLG
 mqiajX1KVki0VKVSlQkOoJ+MB6d7g2nhRaZ0yJYBbMbU39y3+tF3bTnzQN15uKtcLrQZ
 l5GA==
X-Gm-Message-State: APjAAAVSr6KZg0uINwsJlCDQg1AZM4GDoZJH/1/woLsxw8ZcIG5mfaSz
 Ydm+xbZPKkqkayEPYm1IlX2JNSG+dnY=
X-Google-Smtp-Source: APXvYqzdUevLVZ1G7A0XA1gqqTcANX1ikroC2gnl7A0Hh9J0kJD4oDw8p2DjUBkU6Yb7QdW6umvbtQ==
X-Received: by 2002:ac2:597c:: with SMTP id h28mr5023742lfp.90.1559980985216; 
 Sat, 08 Jun 2019 01:03:05 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 f4sm756851ljm.13.2019.06.08.01.03.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 01:03:04 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 3/7] drm/radeon: drop dependency on drm_os_linux.h
Date: Sat,  8 Jun 2019 10:02:37 +0200
Message-Id: <20190608080241.4958-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190608080241.4958-1-sam@ravnborg.org>
References: <20190608080241.4958-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s7x26gCHQ5oTD/qce8eah2RsnVrxXmy+KSp3BN05E7Y=;
 b=RVSWRgFQoWypobq33pIz/caG/5if6fgACdWzfQVKQx3pV8SMNOJtyuJ44xMMj7cFgi
 nYS2191rXfBulvHNMchbii+ekFRA1Asp5DkfNepvMA9baoYcLG/Es1piY27/X6g9hkQu
 I34zZsMsWpWDzPVD1F4YVH05SXSemeP77ZPNRgyRZEmjMDRBD5G6e/vdffAUzz3fdDj5
 Mp+UNIMruccoaN93R1rhWl0zKf2QQBHJJa9EZqxcZc+1vQIXi6gcfr99fCAn/Hd84lAW
 2Xq54yqnK8d05aCUFGNOiPGv9LFmFDuniklJBHt8unm9Qc1GYco7pRfkeY2zgzkN17BK
 59XA==
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
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGRybV9vc19saW51eC5oIGhlYWRlciBmaWxlIGlzIGRlcHJlY2F0ZWQuCkRyb3AgYWxsIHVz
ZXMgb2Ygc3ltYm9scyBmcm9tIHRoaXMgZmlsZS4KQWxsIG1hY3JvcyBhcmUganVzdCBvcGVuY29k
ZWQuCkEgZmV3IGFkanVzdG1lbnRzIHRvIGluY2x1ZGUgZmlsZXMgd2FzIHJlcXVpcmVkIGFzIHRo
ZSBvYnNvbGV0ZQpkcm1fb3NfbGludXguaCBpbmNsdWRlZCB0aGVzZSBoZWFkZXJzLgoKU2lnbmVk
LW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiAiRGF2aWQgKENodW5NaW5nKSBaaG91IiA8RGF2aWQx
Llpob3VAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2Npay5jICAgICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWtfc2Rt
YS5jICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjEwMC5jICAgICAgICAg
fCAxMCArKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IzMDAuYyAgICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjUyMC5jICAgICAgICAgfCAgMiArLQogZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcjYwMF9kbWEuYyAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9mZW5jZS5jIHwgMTAgKysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fdmNlLmMgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JzNDAwLmMg
ICAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yczYwMC5jICAgICAgICB8
ICAzICsrKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ydjUxNS5jICAgICAgICB8ICAyICstCiBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3V2ZF92MV8wLmMgICAgIHwgIDIgKy0KIDEzIGZpbGVzIGNo
YW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5j
CmluZGV4IGFiN2I0ZTJmZmNkMi4uZjIwYmNlZDhjYTk5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL2Npay5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMKQEAg
LTM0ODAsNyArMzQ4MCw3IEBAIGludCBjaWtfcmluZ190ZXN0KHN0cnVjdCByYWRlb25fZGV2aWNl
ICpyZGV2LCBzdHJ1Y3QgcmFkZW9uX3JpbmcgKnJpbmcpCiAJCXRtcCA9IFJSRUczMihzY3JhdGNo
KTsKIAkJaWYgKHRtcCA9PSAweERFQURCRUVGKQogCQkJYnJlYWs7Ci0JCURSTV9VREVMQVkoMSk7
CisJCXVkZWxheSgxKTsKIAl9CiAJaWYgKGkgPCByZGV2LT51c2VjX3RpbWVvdXQpIHsKIAkJRFJN
X0lORk8oInJpbmcgdGVzdCBvbiAlZCBzdWNjZWVkZWQgaW4gJWQgdXNlY3NcbiIsIHJpbmctPmlk
eCwgaSk7CkBAIC0zODI1LDcgKzM4MjUsNyBAQCBpbnQgY2lrX2liX3Rlc3Qoc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYsIHN0cnVjdCByYWRlb25fcmluZyAqcmluZykKIAkJdG1wID0gUlJFRzMy
KHNjcmF0Y2gpOwogCQlpZiAodG1wID09IDB4REVBREJFRUYpCiAJCQlicmVhazsKLQkJRFJNX1VE
RUxBWSgxKTsKKwkJdWRlbGF5KDEpOwogCX0KIAlpZiAoaSA8IHJkZXYtPnVzZWNfdGltZW91dCkg
ewogCQlEUk1fSU5GTygiaWIgdGVzdCBvbiByaW5nICVkIHN1Y2NlZWRlZCBpbiAldSB1c2Vjc1xu
IiwgaWIuZmVuY2UtPnJpbmcsIGkpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9jaWtfc2RtYS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWtfc2RtYS5jCmluZGV4IDlj
MzUxZGM4YTllMC4uYmJhYmFhODcxMTliIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL2Npa19zZG1hLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWtfc2RtYS5jCkBA
IC02NzcsNyArNjc3LDcgQEAgaW50IGNpa19zZG1hX3JpbmdfdGVzdChzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldiwKIAkJdG1wID0gbGUzMl90b19jcHUocmRldi0+d2Iud2JbaW5kZXgvNF0pOwog
CQlpZiAodG1wID09IDB4REVBREJFRUYpCiAJCQlicmVhazsKLQkJRFJNX1VERUxBWSgxKTsKKwkJ
dWRlbGF5KDEpOwogCX0KIAogCWlmIChpIDwgcmRldi0+dXNlY190aW1lb3V0KSB7CkBAIC03NTEs
NyArNzUxLDcgQEAgaW50IGNpa19zZG1hX2liX3Rlc3Qoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJk
ZXYsIHN0cnVjdCByYWRlb25fcmluZyAqcmluZykKIAkJdG1wID0gbGUzMl90b19jcHUocmRldi0+
d2Iud2JbaW5kZXgvNF0pOwogCQlpZiAodG1wID09IDB4REVBREJFRUYpCiAJCQlicmVhazsKLQkJ
RFJNX1VERUxBWSgxKTsKKwkJdWRlbGF5KDEpOwogCX0KIAlpZiAoaSA8IHJkZXYtPnVzZWNfdGlt
ZW91dCkgewogCQlEUk1fSU5GTygiaWIgdGVzdCBvbiByaW5nICVkIHN1Y2NlZWRlZCBpbiAldSB1
c2Vjc1xuIiwgaWIuZmVuY2UtPnJpbmcsIGkpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yMTAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IxMDAuYwppbmRleCA3ZDM5
ZWQ2M2U1YmUuLjkxMzkzODgwODUxMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yMTAwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMTAwLmMKQEAgLTI0NzAsNyAr
MjQ3MCw3IEBAIHN0YXRpYyBpbnQgcjEwMF9yYmJtX2ZpZm9fd2FpdF9mb3JfZW50cnkoc3RydWN0
IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHVuc2lnbmVkIG4pCiAJCWlmICh0bXAgPj0gbikgewogCQkJ
cmV0dXJuIDA7CiAJCX0KLQkJRFJNX1VERUxBWSgxKTsKKwkJdWRlbGF5KDEpOwogCX0KIAlyZXR1
cm4gLTE7CiB9CkBAIC0yNDg4LDcgKzI0ODgsNyBAQCBpbnQgcjEwMF9ndWlfd2FpdF9mb3JfaWRs
ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKIAkJaWYgKCEodG1wICYgUkFERU9OX1JCQk1f
QUNUSVZFKSkgewogCQkJcmV0dXJuIDA7CiAJCX0KLQkJRFJNX1VERUxBWSgxKTsKKwkJdWRlbGF5
KDEpOwogCX0KIAlyZXR1cm4gLTE7CiB9CkBAIC0yNTA0LDcgKzI1MDQsNyBAQCBpbnQgcjEwMF9t
Y193YWl0X2Zvcl9pZGxlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogCQlpZiAodG1wICYg
UkFERU9OX01DX0lETEUpIHsKIAkJCXJldHVybiAwOwogCQl9Ci0JCURSTV9VREVMQVkoMSk7CisJ
CXVkZWxheSgxKTsKIAl9CiAJcmV0dXJuIC0xOwogfQpAQCAtMzY2OSw3ICszNjY5LDcgQEAgaW50
IHIxMDBfcmluZ190ZXN0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcmFkZW9u
X3JpbmcgKnJpbmcpCiAJCWlmICh0bXAgPT0gMHhERUFEQkVFRikgewogCQkJYnJlYWs7CiAJCX0K
LQkJRFJNX1VERUxBWSgxKTsKKwkJdWRlbGF5KDEpOwogCX0KIAlpZiAoaSA8IHJkZXYtPnVzZWNf
dGltZW91dCkgewogCQlEUk1fSU5GTygicmluZyB0ZXN0IHN1Y2NlZWRlZCBpbiAlZCB1c2Vjc1xu
IiwgaSk7CkBAIC0zNzQ2LDcgKzM3NDYsNyBAQCBpbnQgcjEwMF9pYl90ZXN0KHN0cnVjdCByYWRl
b25fZGV2aWNlICpyZGV2LCBzdHJ1Y3QgcmFkZW9uX3JpbmcgKnJpbmcpCiAJCWlmICh0bXAgPT0g
MHhERUFEQkVFRikgewogCQkJYnJlYWs7CiAJCX0KLQkJRFJNX1VERUxBWSgxKTsKKwkJdWRlbGF5
KDEpOwogCX0KIAlpZiAoaSA8IHJkZXYtPnVzZWNfdGltZW91dCkgewogCQlEUk1fSU5GTygiaWIg
dGVzdCBzdWNjZWVkZWQgaW4gJXUgdXNlY3NcbiIsIGkpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yMzAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IzMDAuYwppbmRl
eCA2NTIxMjZmZDZkZDQuLjZkYjBhMmFhODdhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yMzAwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMzAwLmMKQEAgLTM1
MCw3ICszNTAsNyBAQCBpbnQgcjMwMF9tY193YWl0X2Zvcl9pZGxlKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KQogCQlpZiAodG1wICYgUjMwMF9NQ19JRExFKSB7CiAJCQlyZXR1cm4gMDsKIAkJ
fQotCQlEUk1fVURFTEFZKDEpOworCQl1ZGVsYXkoMSk7CiAJfQogCXJldHVybiAtMTsKIH0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjUyMC5jIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yNTIwLmMKaW5kZXggMDc0Y2Y3NTJmYWVmLi5mY2MyYmE1MjQwMDcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjUyMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcjUyMC5jCkBAIC00NCw3ICs0NCw3IEBAIGludCByNTIwX21jX3dhaXRfZm9yX2lkbGUo
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJCWlmICh0bXAgJiBSNTIwX01DX1NUQVRVU19J
RExFKSB7CiAJCQlyZXR1cm4gMDsKIAkJfQotCQlEUk1fVURFTEFZKDEpOworCQl1ZGVsYXkoMSk7
CiAJfQogCXJldHVybiAtMTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cjYwMC5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmMKaW5kZXggZTA2ZTJkOGZlYWIz
Li44OWFmY2U5OWI2MzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5jCkBAIC0yODQwLDcgKzI4NDAsNyBA
QCBpbnQgcjYwMF9yaW5nX3Rlc3Qoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHN0cnVjdCBy
YWRlb25fcmluZyAqcmluZykKIAkJdG1wID0gUlJFRzMyKHNjcmF0Y2gpOwogCQlpZiAodG1wID09
IDB4REVBREJFRUYpCiAJCQlicmVhazsKLQkJRFJNX1VERUxBWSgxKTsKKwkJdWRlbGF5KDEpOwog
CX0KIAlpZiAoaSA8IHJkZXYtPnVzZWNfdGltZW91dCkgewogCQlEUk1fSU5GTygicmluZyB0ZXN0
IG9uICVkIHN1Y2NlZWRlZCBpbiAlZCB1c2Vjc1xuIiwgcmluZy0+aWR4LCBpKTsKQEAgLTM0MzMs
NyArMzQzMyw3IEBAIGludCByNjAwX2liX3Rlc3Qoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYs
IHN0cnVjdCByYWRlb25fcmluZyAqcmluZykKIAkJdG1wID0gUlJFRzMyKHNjcmF0Y2gpOwogCQlp
ZiAodG1wID09IDB4REVBREJFRUYpCiAJCQlicmVhazsKLQkJRFJNX1VERUxBWSgxKTsKKwkJdWRl
bGF5KDEpOwogCX0KIAlpZiAoaSA8IHJkZXYtPnVzZWNfdGltZW91dCkgewogCQlEUk1fSU5GTygi
aWIgdGVzdCBvbiByaW5nICVkIHN1Y2NlZWRlZCBpbiAldSB1c2Vjc1xuIiwgaWIuZmVuY2UtPnJp
bmcsIGkpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2RtYS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2RtYS5jCmluZGV4IGZiNjVlNmZiNWM0Zi4uNDhk
NGMxNTg1MmNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfZG1hLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2RtYS5jCkBAIC0yNjEsNyArMjYxLDcg
QEAgaW50IHI2MDBfZG1hX3JpbmdfdGVzdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKIAkJ
dG1wID0gbGUzMl90b19jcHUocmRldi0+d2Iud2JbaW5kZXgvNF0pOwogCQlpZiAodG1wID09IDB4
REVBREJFRUYpCiAJCQlicmVhazsKLQkJRFJNX1VERUxBWSgxKTsKKwkJdWRlbGF5KDEpOwogCX0K
IAogCWlmIChpIDwgcmRldi0+dXNlY190aW1lb3V0KSB7CkBAIC0zODIsNyArMzgyLDcgQEAgaW50
IHI2MDBfZG1hX2liX3Rlc3Qoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHN0cnVjdCByYWRl
b25fcmluZyAqcmluZykKIAkJdG1wID0gbGUzMl90b19jcHUocmRldi0+d2Iud2JbaW5kZXgvNF0p
OwogCQlpZiAodG1wID09IDB4REVBREJFRUYpCiAJCQlicmVhazsKLQkJRFJNX1VERUxBWSgxKTsK
KwkJdWRlbGF5KDEpOwogCX0KIAlpZiAoaSA8IHJkZXYtPnVzZWNfdGltZW91dCkgewogCQlEUk1f
SU5GTygiaWIgdGVzdCBvbiByaW5nICVkIHN1Y2NlZWRlZCBpbiAldSB1c2Vjc1xuIiwgaWIuZmVu
Y2UtPnJpbmcsIGkpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
ZmVuY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ZlbmNlLmMKaW5kZXggZTg2
ZjJiZDM4NDEwLi40NWQyNGM3MWRiM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2ZlbmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZmVu
Y2UuYwpAQCAtMjgsMTMgKzI4LDE3IEBACiAgKiAgICBKZXJvbWUgR2xpc3NlIDxnbGlzc2VAZnJl
ZWRlc2t0b3Aub3JnPgogICogICAgRGF2ZSBBaXJsaWUKICAqLwotI2luY2x1ZGUgPGxpbnV4L3Nl
cV9maWxlLmg+CisKICNpbmNsdWRlIDxsaW51eC9hdG9taWMuaD4KLSNpbmNsdWRlIDxsaW51eC93
YWl0Lmg+CisjaW5jbHVkZSA8bGludXgvZmlybXdhcmUuaD4KICNpbmNsdWRlIDxsaW51eC9rcmVm
Lmg+CisjaW5jbHVkZSA8bGludXgvc2NoZWQvc2lnbmFsLmg+CisjaW5jbHVkZSA8bGludXgvc2Vx
X2ZpbGUuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Ci0jaW5jbHVkZSA8bGludXgvZmlybXdh
cmUuaD4KKyNpbmNsdWRlIDxsaW51eC93YWl0Lmg+CisKICNpbmNsdWRlIDxkcm0vZHJtUC5oPgor
CiAjaW5jbHVkZSAicmFkZW9uX3JlZy5oIgogI2luY2x1ZGUgInJhZGVvbi5oIgogI2luY2x1ZGUg
InJhZGVvbl90cmFjZS5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fdmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl92Y2UuYwppbmRleCBjMWM2
MTlmYWNiNDcuLjJlZjhlOWVjNjdhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fdmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdmNlLmMK
QEAgLTc3MSw3ICs3NzEsNyBAQCBpbnQgcmFkZW9uX3ZjZV9yaW5nX3Rlc3Qoc3RydWN0IHJhZGVv
bl9kZXZpY2UgKnJkZXYsIHN0cnVjdCByYWRlb25fcmluZyAqcmluZykKIAlmb3IgKGkgPSAwOyBp
IDwgcmRldi0+dXNlY190aW1lb3V0OyBpKyspIHsKIAkJaWYgKHZjZV92MV8wX2dldF9ycHRyKHJk
ZXYsIHJpbmcpICE9IHJwdHIpCiAJCQlicmVhazsKLQkJRFJNX1VERUxBWSgxKTsKKwkJdWRlbGF5
KDEpOwogCX0KIAogCWlmIChpIDwgcmRldi0+dXNlY190aW1lb3V0KSB7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JzNDAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jz
NDAwLmMKaW5kZXggNDEyMTIwOWMxODNlLi44NDJmNDkyNGFkNzcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcnM0MDAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jz
NDAwLmMKQEAgLTY3LDcgKzY3LDcgQEAgdm9pZCByczQwMF9nYXJ0X3RsYl9mbHVzaChzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldikKIAkJdG1wID0gUlJFRzMyX01DKFJTNDgwX0dBUlRfQ0FDSEVf
Q05UUkwpOwogCQlpZiAoKHRtcCAmIFJTNDgwX0dBUlRfQ0FDSEVfSU5WQUxJREFURSkgPT0gMCkK
IAkJCWJyZWFrOwotCQlEUk1fVURFTEFZKDEpOworCQl1ZGVsYXkoMSk7CiAJCXRpbWVvdXQtLTsK
IAl9IHdoaWxlICh0aW1lb3V0ID4gMCk7CiAJV1JFRzMyX01DKFJTNDgwX0dBUlRfQ0FDSEVfQ05U
UkwsIDApOwpAQCAtMjQ1LDcgKzI0NSw3IEBAIGludCByczQwMF9tY193YWl0X2Zvcl9pZGxlKHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogCQlpZiAodG1wICYgUkFERU9OX01DX0lETEUpIHsK
IAkJCXJldHVybiAwOwogCQl9Ci0JCURSTV9VREVMQVkoMSk7CisJCXVkZWxheSgxKTsKIAl9CiAJ
cmV0dXJuIC0xOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yczYwMC5j
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yczYwMC5jCmluZGV4IGYxNmFmMTE5YzY4OC4uZjNh
YTliN2U4YjFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JzNjAwLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yczYwMC5jCkBAIC0zNSw2ICszNSw5IEBACiAgKiBj
bG9zZSB0byB0aGUgb25lIG9mIHRoZSBSNjAwIGZhbWlseSAoUjYwMCBsaWtlbHkgYmVpbmcgYW4g
ZXZvbHV0aW9uCiAgKiBvZiB0aGUgUlM2MDAgR0FSVCBibG9jaykuCiAgKi8KKworI2luY2x1ZGUg
PGxpbnV4L2lvLTY0LW5vbmF0b21pYy1sby1oaS5oPgorCiAjaW5jbHVkZSA8ZHJtL2RybVAuaD4K
ICNpbmNsdWRlICJyYWRlb24uaCIKICNpbmNsdWRlICJyYWRlb25fYXNpYy5oIgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ydjUxNS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9ydjUxNS5jCmluZGV4IGZmYmQyYzAwNmY2MC4uMTg3MDMyZGVmZDdmIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3J2NTE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9ydjUxNS5jCkBAIC0xMzgsNyArMTM4LDcgQEAgaW50IHJ2NTE1X21jX3dhaXRfZm9yX2lkbGUo
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJCWlmICh0bXAgJiBNQ19TVEFUVVNfSURMRSkg
ewogCQkJcmV0dXJuIDA7CiAJCX0KLQkJRFJNX1VERUxBWSgxKTsKKwkJdWRlbGF5KDEpOwogCX0K
IAlyZXR1cm4gLTE7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3V2ZF92
MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3V2ZF92MV8wLmMKaW5kZXggMGRiZWI1MDRh
NDI5Li43OTBlYTViMjExMmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vdXZk
X3YxXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3V2ZF92MV8wLmMKQEAgLTQzOCw3
ICs0MzgsNyBAQCBpbnQgdXZkX3YxXzBfcmluZ190ZXN0KHN0cnVjdCByYWRlb25fZGV2aWNlICpy
ZGV2LCBzdHJ1Y3QgcmFkZW9uX3JpbmcgKnJpbmcpCiAJCXRtcCA9IFJSRUczMihVVkRfQ09OVEVY
VF9JRCk7CiAJCWlmICh0bXAgPT0gMHhERUFEQkVFRikKIAkJCWJyZWFrOwotCQlEUk1fVURFTEFZ
KDEpOworCQl1ZGVsYXkoMSk7CiAJfQogCiAJaWYgKGkgPCByZGV2LT51c2VjX3RpbWVvdXQpIHsK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
