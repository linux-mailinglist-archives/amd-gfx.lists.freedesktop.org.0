Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9EF4904D
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5629B6E040;
	Mon, 17 Jun 2019 19:50:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417AA6E040
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:01 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id s15so12288728qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DSHtlVyKr4FRql2diShJ0wq4nsgj02Vc69s8ert7Xo0=;
 b=NYXMY6o4wqSCIyux35IKnzgl8rmQrJYEg8WwmTMYxYYecx+ZUzaHdUWC0QGqU1TZec
 BudBc0Xt3IcukllDnl9zBcmHPchPlmlm17pjJVjiLaB+/6AxhGvmU6TpcRSy1CUZxLY2
 +TkBT4cTAKa2JXsRlEukkK68eBheQAVzUUhi+XLuIVVrcdK6A2XygyuAsVhlO7jzr6a9
 Y/570WWzirpX0WV6t+HLw/KoEMi6qsTIE3qiJw5upYGUVzddEPR/SRAWEzTc23yahBSb
 e06X7OPs1flITHpteU3Qh1f8JWC0WDoLj+T1WkRVelanWCERV3gmxx33C+PVg3yRUMH2
 V/hA==
X-Gm-Message-State: APjAAAXRVCpgc8L6zktwLkDSYAxmeeyqbwzXimSVdmnWh//Vae/H9wpi
 F5xOLqMwiEY2grK55WCZa+e/wjz0L94y0g==
X-Google-Smtp-Source: APXvYqwEN5ReS7WZTUKvDRQOvBQ6yNjJnZFWIUYG6VhMDCQS3/UrGhoYXOUlBGTdtkH2K00k9OKR6g==
X-Received: by 2002:ac8:7a73:: with SMTP id w19mr75362881qtt.292.1560800999909; 
 Mon, 17 Jun 2019 12:49:59 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.49.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:49:59 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 404/459] drm/amd/display: Change DCN2 vupdate start programming
Date: Mon, 17 Jun 2019 14:48:53 -0500
Message-Id: <20190617194948.18667-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DSHtlVyKr4FRql2diShJ0wq4nsgj02Vc69s8ert7Xo0=;
 b=FKxtYm91+2lpqQFO6k/KKj6IQeFFjf7zuHZIAJneeYIFY7U+bJmPkfaK4msA2pSSKz
 SXSg/36SKKxH+f9tRiASX+UI60lQLTBTuA6AjnY2xqzM+K6Yotg/q0lqWXugadFweeW6
 jRAqpytzLXiFgc1kTq56/Qvr3I4dazVOGetY5Z6SQdd5Z54A6ZD7gOcIbi1wt5LaxwDW
 Fci1OWh35WdKsTKljiUH9Q5KbwusOc2UM9e3Pe3gq+s3wadgLNQiQRBesNf5IrSafVcj
 9eQX4LdRUlqKTwn6lrZIKXVNYlqKDzgnih5xoe0gxXG+qcVlwXCYbRFSLI7nqKI5ShLY
 5Opg==
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
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Eryk Brol <eryk.brol@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJ5ayBCcm9sIDxlcnlrLmJyb2xAYW1kLmNvbT4KCltXaHldCkluIG9yZGVyIHRvIGVu
c3VyZSB0aGF0IGluY29taW5nIGZsaXBzIGFyZSBsYXRjaGVkIGFuZApjb21wbGV0ZSBpbW1lZGlh
dGVseSwgd2UgbmVlZCB0byBwcm9ncmFtIHRoZSB2dXBkYXRlCmludGVycnVwdCB0byBjb21lIGR1
cmluZyB0aGUgYmFjayBwb3JjaCBvZiBlYWNoIGZyYW1lLgoKW0hvd10KUHJvZ3JhbSB0aGUgdnVw
ZGF0ZSBzdGFydF9saW5lIHRvIGJlIGluIHRoZSBiYWNrIHBvcmNoCmxpa2UgaXQncyBkb25lIGZv
ciBEQ04xLgoKU2lnbmVkLW9mZi1ieTogRXJ5ayBCcm9sIDxlcnlrLmJyb2xAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJl
ZXQgTGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyB8IDkgKysrLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKaW5kZXggZTc1ODBl
NmUwZmI2Li5mOWVhZTQ3ZjdiZTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCkBAIC0xNzA0LDEzICsxNzA0LDEwIEBAIHZvaWQg
ZGNuMjBfdW5ibGFua19zdHJlYW0oc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCwKIHZvaWQgZGNu
MjBfc2V0dXBfdnVwZGF0ZV9pbnRlcnJ1cHQoc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCkKIHsK
IAlzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqdGcgPSBwaXBlX2N0eC0+c3RyZWFtX3Jlcy50ZzsK
LQlpbnQgc3RhcnRfcG9zaXRpb24gPSBnZXRfdnVwZGF0ZV9vZmZzZXRfZnJvbV92c3luYyhwaXBl
X2N0eCk7Ci0JdWludDMyX3Qgc3RhcnRfbGluZTsKKwlpbnQgc3RhcnRfbGluZSA9IGdldF92dXBk
YXRlX29mZnNldF9mcm9tX3ZzeW5jKHBpcGVfY3R4KTsKIAotCWlmIChzdGFydF9wb3NpdGlvbiA8
IDApCi0JCXN0YXJ0X2xpbmUgPSBwaXBlX2N0eC0+c3RyZWFtLT50aW1pbmcudl90b3RhbCArIHN0
YXJ0X3Bvc2l0aW9uIC0gMTsKLQllbHNlCi0JCXN0YXJ0X2xpbmUgPSBzdGFydF9wb3NpdGlvbjsK
KwlpZiAoc3RhcnRfbGluZSA8IDApCisJCXN0YXJ0X2xpbmUgPSAwOwogCiAJaWYgKHRnLT5mdW5j
cy0+c2V0dXBfdmVydGljYWxfaW50ZXJydXB0MikKIAkJdGctPmZ1bmNzLT5zZXR1cF92ZXJ0aWNh
bF9pbnRlcnJ1cHQyKHRnLCBzdGFydF9saW5lKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
