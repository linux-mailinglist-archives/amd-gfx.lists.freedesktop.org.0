Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CE97997B
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4308289DD8;
	Mon, 29 Jul 2019 20:15:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63A06E237
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:33 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id o19so12343998vkb.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zX+eCOuqS+AptnxKtPX1ofBzD2HvpoNMysa851anIOA=;
 b=Ilt4RDUS1VFaNdj5y7WhFF82UWbfU/6PnYglHCzYcQ7JYG/wq7TNzhBuA09tgu9ozh
 oB6sbjEshdmoEZWZThvEMnR0FK7uEz5IC508EqcOgYMlN46zsTb4k3+Ngs5CM88AlZBw
 XU9Rg/0Ppizkbt7A/Ui+1SmLmwJ9AL9u/zZ1/j6Z8mRv3Way5/gWS/bTnd7PoLH7A2eX
 Us3mxYC0JGbA1E5fx/tCQT4ilusv2JIdsskMabxK3BPLJBfL/uRm8MNwjULYDuKoankb
 Vsrk9lBK4MhLcW85BeWtBvTMBbjGtllXHjsmZV/ailZ0+OlcSm21+eS/UBs/OwKuCKQw
 TKDQ==
X-Gm-Message-State: APjAAAXqR573sVpKljOXQSwWU17LOdEpniiiXbKa9FSbiikZHf/KEgac
 3/fBbjj6Tot/IqXTQjAOLJEXRtEZ
X-Google-Smtp-Source: APXvYqz+PjYSvMMimQWN14Eu6zXLy3+ZMPZaIFLIbYwU6JnBMh8SorvpvShvrg+sDeiCQC4CT6W12A==
X-Received: by 2002:a1f:9012:: with SMTP id s18mr42294195vkd.5.1564431332697; 
 Mon, 29 Jul 2019 13:15:32 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 14/30] drm/amd/powerplay: support VCN powergate status
 retrieval on Raven
Date: Mon, 29 Jul 2019 15:14:52 -0500
Message-Id: <20190729201508.16136-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zX+eCOuqS+AptnxKtPX1ofBzD2HvpoNMysa851anIOA=;
 b=rb9pMQgB8HV/Oflmnm6PsDXaLYoY5aNNYq/yLuIq/WhOZ/1zbZ3lw5AQEEt/M3eQOK
 D9+uYefycjl/HbbVn5I4+x7fUy59r5cBRbjXvOkJdmZ03E5G0XagvtRnHpc1XgLLBH67
 zBxfyY/LkqO7XaU/S2O9fQPgcS5LpqOTA2Ww+ZfgNeL9MRZ/X4MkN7pRfNWs9iA/x7vp
 KmZGyOXxAj0esRGc42aqvi3uqv0er9L/iF385TCskY0feGDzkaT2e72rjnISGHraKDUb
 n9AlnGGsg4BI9JJcKRcso7fM1ehVeEsM1mnn6cLnzo6ihUi1VSGqpNM5b8K3q0RefBxa
 +VBQ==
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
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCkVuYWJsZSBWQ04gcG93ZXJnYXRl
IHN0YXR1cyByZXBvcnQgb24gUmF2ZW4uCgpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4u
cXVhbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdy
LmMgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5jCmluZGV4
IGUzMmFlOWQzMzczYy4uMThlNzgwZjU2NmZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMKQEAgLTExMTEsNiArMTExMSw3IEBAIHN0
YXRpYyBpbnQgc211MTBfdGhlcm1hbF9nZXRfdGVtcGVyYXR1cmUoc3RydWN0IHBwX2h3bWdyICpo
d21ncikKIHN0YXRpYyBpbnQgc211MTBfcmVhZF9zZW5zb3Ioc3RydWN0IHBwX2h3bWdyICpod21n
ciwgaW50IGlkeCwKIAkJCSAgdm9pZCAqdmFsdWUsIGludCAqc2l6ZSkKIHsKKwlzdHJ1Y3Qgc211
MTBfaHdtZ3IgKnNtdTEwX2RhdGEgPSAoc3RydWN0IHNtdTEwX2h3bWdyICopKGh3bWdyLT5iYWNr
ZW5kKTsKIAl1aW50MzJfdCBzY2xrLCBtY2xrOwogCWludCByZXQgPSAwOwogCkBAIC0xMTMyLDYg
KzExMzMsMTAgQEAgc3RhdGljIGludCBzbXUxMF9yZWFkX3NlbnNvcihzdHJ1Y3QgcHBfaHdtZ3Ig
Kmh3bWdyLCBpbnQgaWR4LAogCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9HUFVfVEVNUDoKIAkJKigo
dWludDMyX3QgKil2YWx1ZSkgPSBzbXUxMF90aGVybWFsX2dldF90ZW1wZXJhdHVyZShod21ncik7
CiAJCWJyZWFrOworCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9WQ05fUE9XRVJfU1RBVEU6CisJCSoo
dWludDMyX3QgKil2YWx1ZSA9ICBzbXUxMF9kYXRhLT52Y25fcG93ZXJfZ2F0ZWQgPyAwIDogMTsK
KwkJKnNpemUgPSA0OworCQlicmVhazsKIAlkZWZhdWx0OgogCQlyZXQgPSAtRUlOVkFMOwogCQli
cmVhazsKQEAgLTExNzUsMTggKzExODAsMjIgQEAgc3RhdGljIGludCBzbXUxMF9wb3dlcmdhdGVf
c2RtYShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCBib29sIGdhdGUpCiAKIHN0YXRpYyB2b2lkIHNt
dTEwX3Bvd2VyZ2F0ZV92Y24oc3RydWN0IHBwX2h3bWdyICpod21nciwgYm9vbCBiZ2F0ZSkKIHsK
KwlzdHJ1Y3Qgc211MTBfaHdtZ3IgKnNtdTEwX2RhdGEgPSAoc3RydWN0IHNtdTEwX2h3bWdyICop
KGh3bWdyLT5iYWNrZW5kKTsKKwogCWlmIChiZ2F0ZSkgewogCQlhbWRncHVfZGV2aWNlX2lwX3Nl
dF9wb3dlcmdhdGluZ19zdGF0ZShod21nci0+YWRldiwKIAkJCQkJCUFNRF9JUF9CTE9DS19UWVBF
X1ZDTiwKIAkJCQkJCUFNRF9QR19TVEFURV9HQVRFKTsKIAkJc211bV9zZW5kX21zZ190b19zbWNf
d2l0aF9wYXJhbWV0ZXIoaHdtZ3IsCiAJCQkJCVBQU01DX01TR19Qb3dlckRvd25WY24sIDApOwor
CQlzbXUxMF9kYXRhLT52Y25fcG93ZXJfZ2F0ZWQgPSB0cnVlOwogCX0gZWxzZSB7CiAJCXNtdW1f
c2VuZF9tc2dfdG9fc21jX3dpdGhfcGFyYW1ldGVyKGh3bWdyLAogCQkJCQkJUFBTTUNfTVNHX1Bv
d2VyVXBWY24sIDApOwogCQlhbWRncHVfZGV2aWNlX2lwX3NldF9wb3dlcmdhdGluZ19zdGF0ZSho
d21nci0+YWRldiwKIAkJCQkJCUFNRF9JUF9CTE9DS19UWVBFX1ZDTiwKIAkJCQkJCUFNRF9QR19T
VEFURV9VTkdBVEUpOworCQlzbXUxMF9kYXRhLT52Y25fcG93ZXJfZ2F0ZWQgPSBmYWxzZTsKIAl9
CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
