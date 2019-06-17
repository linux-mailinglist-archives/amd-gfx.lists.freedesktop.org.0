Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3594E48F6E
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9093089C80;
	Mon, 17 Jun 2019 19:32:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFAB89C6A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:03 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id b18so6936965qkc.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyP3jvhqFiFFpOAtMA98+uDI00q41PCCOvpEw6TNfzc=;
 b=kfNL/DIPtjk2zgBrZ3CDXLpmXpMD3mOtxD2OCUx4cKjz+jvpALBiJqgdJ2P7QPDAwy
 jXmxWmT6v0FXHngr2ncip6nsrGJGlHnwvl9sXVz6lIquyFhIAkVtE7NVVIZxObkJjdJC
 eBar5j7/nGxPU4qRat/8XgCZfZLQO0DXGKVRaCOjn08HCU4ppOvzBzvF0oYvFR2pSJ8C
 P7+dU6s+KRgWL9j04ZkTGaOdyEezzggHywiT33+YTXhkdkFhgQmLq18z0Pp6+sQS3nEe
 00ufuZmIUnWT/k/i58OL1H0PTrwp5OCN7KLyH2zzPidXLmQbCzHgSQ0/AmCZ3a+xb7aT
 XNUg==
X-Gm-Message-State: APjAAAWTAjXxPdWEwz50MEGaixkU9gbM/zqKWGc0KQQtB6UFfggBxel8
 4C/iyZy/M35Hd9koCVuavHSk2DyNMkU=
X-Google-Smtp-Source: APXvYqxbxZAir/MPUQgzHRoTuEA681ZUt9MNiVb5iZgJojdGDofdVqIc2cpk0nnV9EU1k+l++SYkaw==
X-Received: by 2002:a37:4d16:: with SMTP id a22mr88854337qkb.103.1560799921897; 
 Mon, 17 Jun 2019 12:32:01 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 253/459] drm/amd/powerplay: add function read_sensor for navi10
Date: Mon, 17 Jun 2019 14:30:20 -0500
Message-Id: <20190617193106.18231-54-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyP3jvhqFiFFpOAtMA98+uDI00q41PCCOvpEw6TNfzc=;
 b=TdxucYDNW4hCp3S8ZZ7rolTp7aOJB5mICF0nzQGSxxCZJaiRIBgYTBSN4hdQrJ2WyU
 ZiWSH2bvBYKNwUF2Z1Cqo7OM9Af/OnjIBCbB+YxaXOCIwuEw5yd+8LkBr8kosKnxEdAh
 6AfFvbY0iqxKwnv46Ub4924QnuqMCdaUZ4qYR4IvDyJHGf+a55Q/Ws3KZ33vlKL+4xTF
 7sPrVkWHbXOfFAZhBSd7eCu3WcFFi4+U7JsqS4QL+qN/3t7euD7HmTBm8BTiF2SZDXcL
 TNkwyHtvxKocJL2NcXksRbifswENSNRDwyofOSAPv+Mn+ASE21vn3Oyf6Z2qSlNIPAHE
 X3WQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCBjYWxsYmFjayBmdW5j
dGlvbiByZWFkX3NlbnNvciBmb3IgbmF2aTEwIGFzaWMKClNpZ25lZC1vZmYtYnk6IEtldmluIFdh
bmcgPGtldmluMS53YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFu
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
IHwgMjEgKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9w
cHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCBl
YWZkNmM2NTMxNjIuLjE4NmM1NzI2NTgwYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYwpAQCAtMTE3MCw2ICsxMTcwLDI2IEBAIHN0YXRpYyBpbnQgbmF2aTEw
X3NldF93YXRlcm1hcmtzX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCXJldHVybiAw
OwogfQogCitzdGF0aWMgaW50IG5hdmkxMF9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwKKwkJCQkgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsCisJCQkJIHZvaWQgKmRhdGEs
IHVpbnQzMl90ICpzaXplKQoreworCWludCByZXQgPSAwOworCXN0cnVjdCBzbXVfdGFibGVfY29u
dGV4dCAqdGFibGVfY29udGV4dCA9ICZzbXUtPnNtdV90YWJsZTsKKwlQUFRhYmxlX3QgKnBwdGFi
bGUgPSB0YWJsZV9jb250ZXh0LT5kcml2ZXJfcHB0YWJsZTsKKworCXN3aXRjaCAoc2Vuc29yKSB7
CisJY2FzZSBBTURHUFVfUFBfU0VOU09SX01BWF9GQU5fUlBNOgorCQkqKHVpbnQzMl90ICopZGF0
YSA9IHBwdGFibGUtPkZhbk1heGltdW1ScG07CisJCSpzaXplID0gNDsKKwkJYnJlYWs7CisJZGVm
YXVsdDoKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJcmV0dXJuIHJldDsKK30KKwogc3RhdGlj
IGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7CiAJLnRhYmxl
c19pbml0ID0gbmF2aTEwX3RhYmxlc19pbml0LAogCS5hbGxvY19kcG1fY29udGV4dCA9IG5hdmkx
MF9hbGxvY2F0ZV9kcG1fY29udGV4dCwKQEAgLTEyMDQsNiArMTIyNCw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewogCS5zZXRfcG93ZXJf
cHJvZmlsZV9tb2RlID0gbmF2aTEwX3NldF9wb3dlcl9wcm9maWxlX21vZGUsCiAJLmdldF9wcm9m
aWxpbmdfY2xrX21hc2sgPSBuYXZpMTBfZ2V0X3Byb2ZpbGluZ19jbGtfbWFzaywKIAkuc2V0X3dh
dGVybWFya3NfdGFibGUgPSBuYXZpMTBfc2V0X3dhdGVybWFya3NfdGFibGUsCisJLnJlYWRfc2Vu
c29yID0gbmF2aTEwX3JlYWRfc2Vuc29yLAogfTsKIAogdm9pZCBuYXZpMTBfc2V0X3BwdF9mdW5j
cyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
