Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB1D7999D
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7196E29A;
	Mon, 29 Jul 2019 20:15:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6D66E28B
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:40 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id m17so12343495vkl.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HNAaEfeT/6aQWjJsVmolq8Bp5KOA/e+bk+qlNSRGYcc=;
 b=qktwhyhFHJ4Vsl+Kgw4a0masfY8ihB7lqa54tXoPkdssf5Ksq3Q2bxBVuYMm+FLSNX
 B4mt/NP74xIwyQFA1fhNR8va/A/op0GrklCyyfgvwWHU/r/RybBHymRK8quZMLIIn/sg
 r2c+Q+qm8iUgJ09REQFDftTg3EhwTHxfNAh/8HeotHV91T0+FBZKt6vGuSLFWHuYx8t1
 s+5soGYJqIvKl4EYZDI8MgysT2WFK1Zzi0RRtMMgr9WV8fXb7VjdljwIKUqZkQVAXzs6
 kXDKZ1rEG/cZt9OWBavzf6OtttV58fw1wBiiEZd+5D7P4KbH9sbzYSyUC4E63L8kFWkm
 zNHg==
X-Gm-Message-State: APjAAAXvJjHdEANrm3gILefNMc42s2vkccu9Az9f8YRhRJ9gLMRn+y7A
 YfHvjfRiO4//YRw+E9aBfWH59Bin
X-Google-Smtp-Source: APXvYqwVfVzIA//L7PIMzgpmHEHFv6jgkxAxn2fpX+qaByTYnFm4V7VOR+tFC95bW3MRvDc6+VhzAg==
X-Received: by 2002:a1f:bd56:: with SMTP id n83mr43747580vkf.59.1564431339393; 
 Mon, 29 Jul 2019 13:15:39 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 21/30] drm/amd/powerplay: support fan speed retrieval on
 arcturus
Date: Mon, 29 Jul 2019 15:14:59 -0500
Message-Id: <20190729201508.16136-22-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HNAaEfeT/6aQWjJsVmolq8Bp5KOA/e+bk+qlNSRGYcc=;
 b=nJan9CZK+1ofuFSOescl6jLRAp3siqQRZTrThwy8j4ToMds+tw0KtwuVD5MSNXqdY5
 4vPdf544CCeaoicB8zsl2CGB6Wwa+/a+suTMyS301LtqPzz3I5lw9IJ0xceMZ00ItHHE
 Q97FUrCS3pAriafu+iRnHJfeAvCEsVoPI47xkcbX9ccXvo/wdYZv9IzrAj+ssJuEVhVf
 yyO9x7C5YeG6ZqDIoRFTyFJ20ajCGGGvH0xfzqksagbkDt4xhJWZ98Ovs/oBrYGXgAl8
 WUi6SI4vrE7NlcXyBf0RnfxTc/piZ5d7S13kwT9OnRo6SjGxoxqqF3ZMW3BdCN63hcex
 9EAA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KClN1cHBvcnQgYXJjdHVydXMgZmFu
IHNwZWVkIHJldHJpZXZhbC4KClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgpSZXZp
ZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgfCA0MCArKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCmluZGV4IDNhNzAyMTEwZDliYy4u
MmI2ZGZjN2NmZTFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
cmN0dXJ1c19wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1
c19wcHQuYwpAQCAtOTk0LDYgKzk5NCw0NCBAQCBzdGF0aWMgaW50IGFyY3R1cnVzX3JlYWRfc2Vu
c29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCXJldHVybiByZXQ7CiB9CiAKK3N0YXRpYyBp
bnQgYXJjdHVydXNfZ2V0X2Zhbl9zcGVlZF9ycG0oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCisJ
CQkJICAgICAgdWludDMyX3QgKnNwZWVkKQoreworCVNtdU1ldHJpY3NfdCBtZXRyaWNzOworCWlu
dCByZXQgPSAwOworCisJaWYgKCFzcGVlZCkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXQgPSBh
cmN0dXJ1c19nZXRfbWV0cmljc190YWJsZShzbXUsICZtZXRyaWNzKTsKKwlpZiAocmV0KQorCQly
ZXR1cm4gcmV0OworCisJKnNwZWVkID0gbWV0cmljcy5DdXJyRmFuU3BlZWQ7CisKKwlyZXR1cm4g
cmV0OworfQorCitzdGF0aWMgaW50IGFyY3R1cnVzX2dldF9mYW5fc3BlZWRfcGVyY2VudChzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwKKwkJCQkJICB1aW50MzJfdCAqc3BlZWQpCit7CisJUFBUYWJs
ZV90ICpwcHRhYmxlID0gc211LT5zbXVfdGFibGUuZHJpdmVyX3BwdGFibGU7CisJdWludDMyX3Qg
cGVyY2VudCwgY3VycmVudF9ycG07CisJaW50IHJldCA9IDA7CisKKwlpZiAoIXNwZWVkKQorCQly
ZXR1cm4gLUVJTlZBTDsKKworCXJldCA9IGFyY3R1cnVzX2dldF9mYW5fc3BlZWRfcnBtKHNtdSwg
JmN1cnJlbnRfcnBtKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJcGVyY2VudCA9IGN1
cnJlbnRfcnBtICogMTAwIC8gcHB0YWJsZS0+RmFuTWF4aW11bVJwbTsKKwkqc3BlZWQgPSBwZXJj
ZW50ID4gMTAwID8gMTAwIDogcGVyY2VudDsKKworCXJldHVybiByZXQ7Cit9CisKIHN0YXRpYyBp
bnQgYXJjdHVydXNfZ2V0X2N1cnJlbnRfY2xrX2ZyZXFfYnlfdGFibGUoc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsCiAJCQkJICAgICAgIGVudW0gc211X2Nsa190eXBlIGNsa190eXBlLAogCQkJCSAg
ICAgICB1aW50MzJfdCAqdmFsdWUpCkBAIC0xNDc1LDYgKzE1MTMsOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHBwdGFibGVfZnVuY3MgYXJjdHVydXNfcHB0X2Z1bmNzID0gewogCS5wcmludF9jbGtf
bGV2ZWxzID0gYXJjdHVydXNfcHJpbnRfY2xrX2xldmVscywKIAkuZm9yY2VfY2xrX2xldmVscyA9
IGFyY3R1cnVzX2ZvcmNlX2Nsa19sZXZlbHMsCiAJLnJlYWRfc2Vuc29yID0gYXJjdHVydXNfcmVh
ZF9zZW5zb3IsCisJLmdldF9mYW5fc3BlZWRfcGVyY2VudCA9IGFyY3R1cnVzX2dldF9mYW5fc3Bl
ZWRfcGVyY2VudCwKKwkuZ2V0X2Zhbl9zcGVlZF9ycG0gPSBhcmN0dXJ1c19nZXRfZmFuX3NwZWVk
X3JwbSwKIAkvKiBkZWJ1ZyAoaW50ZXJuYWwgdXNlZCkgKi8KIAkuZHVtcF9wcHRhYmxlID0gYXJj
dHVydXNfZHVtcF9wcHRhYmxlLAogfTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
