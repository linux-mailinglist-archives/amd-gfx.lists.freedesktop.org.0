Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D05259A6E
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 14:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6E86E90E;
	Fri, 28 Jun 2019 12:18:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398346E90A
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 12:18:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s3so8898340wms.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 05:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RsXBkNi3Sdy+bbOMgyGeHHnRN4S4fx25CZPZwUaLceM=;
 b=kanvY9rS8Hn9/q9BmCcLx3hIxMOEIN/13X8fR873QOiPZ4Nc47x2onsuxvVsGA5B4g
 GFL/9c8gRbFE7MQ1yRTmIpFjXmu1rTVZuYz1GtMLwDnfJcmTWBYV8mXKynVn1g3fXXVK
 RylPN0ZvYnF+A2X4tPIky8n37BYLb0vJUdT8msw+qFoq8TIi7AKQjDzBfQkATJronfik
 04klKuBdyWoHtOezEliRm0OT4Rk9KQBh2WZDHIMrqlfuLyxbneeAsIgeUzi0HIguZNrT
 9Bo/hakVoIL1fNhuUSmdqkk8MnYIYdOlDlMNFW92UQsnD92SZXVVGSf//2bnAwE65UJJ
 cJzw==
X-Gm-Message-State: APjAAAVdIJkbODSNt4spC0IxNg3RTCcADbHN+8sqSwoQmPCnUyjrvDJp
 q1+THYLqxf62qqYQkRRGEyk1KD3T
X-Google-Smtp-Source: APXvYqyefHwhTzOfQvudoOaxtn9K2ylxpOgMufTEkpgc/ae/+Jnb7cuIju89FL7ct8v2Ek4afkaHOQ==
X-Received: by 2002:a05:600c:28d:: with SMTP id 13mr7172328wmk.5.1561724296708; 
 Fri, 28 Jun 2019 05:18:16 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6946:7a72:691a:cf7d])
 by smtp.gmail.com with ESMTPSA id a64sm7236740wmf.1.2019.06.28.05.18.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 05:18:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/amdgpu: allow direct submission of PTE updates
Date: Fri, 28 Jun 2019 14:18:10 +0200
Message-Id: <20190628121812.1400-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628121812.1400-1-christian.koenig@amd.com>
References: <20190628121812.1400-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RsXBkNi3Sdy+bbOMgyGeHHnRN4S4fx25CZPZwUaLceM=;
 b=W4o7t1A+m4PXU8N+mO/CtissaZHFRrTv6xDCAqYllLi808X2nESfo6YopiOoF4tFtO
 wy54+t8veChO1PPkSO1rX0GOrYh4uV3HY36oMWc+0uahyXXWAubOJsDDY26SVmnJWx8W
 cZn8sxQdGt+hyVaKuBCkRx7FcdT6RwEIWseCbs8bHGr/YM4oY9iuS0u1TFa2sNsVPHYQ
 ijm9xRDVHuNB30kwNcPR6Icd2zepEhzoQerRB/+Ub6vAgBCGVFYC9Qp0X0ZWzv5g3ZTp
 u92E4ECnbQ5Vfe+J9ViF8yem0DyhrB7fe0zS4qfH4MZm0C6222423c3ooeFge+JnxuhQ
 5+AA==
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
Cc: Felix.Kuehling@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIGhhbmRsaW5nIFBURSB1cGRhdGVzIGRpcmVjdGx5IGluIHRoZSBmYXVsdCBoYW5kbGVyLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMTggKysrKysr
KysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmluZGV4IDViZDA0MDhl
NGU1Ni4uYThlYTdiZjE4Y2Y2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
YwpAQCAtMTQ4NiwxMyArMTQ4NiwxNCBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV91cGRhdGVfcHRl
cyhzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnBhcmFtcywKICAqIGFtZGdwdV92bV9i
b191cGRhdGVfbWFwcGluZyAtIHVwZGF0ZSBhIG1hcHBpbmcgaW4gdGhlIHZtIHBhZ2UgdGFibGUK
ICAqCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCi0gKiBAZXhjbHVzaXZlOiBmZW5j
ZSB3ZSBuZWVkIHRvIHN5bmMgdG8KLSAqIEBwYWdlc19hZGRyOiBETUEgYWRkcmVzc2VzIHRvIHVz
ZSBmb3IgbWFwcGluZwogICogQHZtOiByZXF1ZXN0ZWQgdm0KKyAqIEBkaXJlY3Q6IGRpcmVjdCBz
dWJtaXNzaW9uIGluIGEgcGFnZSBmYXVsdAorICogQGV4Y2x1c2l2ZTogZmVuY2Ugd2UgbmVlZCB0
byBzeW5jIHRvCiAgKiBAc3RhcnQ6IHN0YXJ0IG9mIG1hcHBlZCByYW5nZQogICogQGxhc3Q6IGxh
c3QgbWFwcGVkIGVudHJ5CiAgKiBAZmxhZ3M6IGZsYWdzIGZvciB0aGUgZW50cmllcwogICogQGFk
ZHI6IGFkZHIgdG8gc2V0IHRoZSBhcmVhIHRvCisgKiBAcGFnZXNfYWRkcjogRE1BIGFkZHJlc3Nl
cyB0byB1c2UgZm9yIG1hcHBpbmcKICAqIEBmZW5jZTogb3B0aW9uYWwgcmVzdWx0aW5nIGZlbmNl
CiAgKgogICogRmlsbCBpbiB0aGUgcGFnZSB0YWJsZSBlbnRyaWVzIGJldHdlZW4gQHN0YXJ0IGFu
ZCBAbGFzdC4KQEAgLTE1MDEsMTEgKzE1MDIsMTEgQEAgc3RhdGljIGludCBhbWRncHVfdm1fdXBk
YXRlX3B0ZXMoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwYXJhbXMsCiAgKiAwIGZv
ciBzdWNjZXNzLCAtRUlOVkFMIGZvciBmYWlsdXJlLgogICovCiBzdGF0aWMgaW50IGFtZGdwdV92
bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCQkgICAg
ICAgc3RydWN0IGFtZGdwdV92bSAqdm0sIGJvb2wgZGlyZWN0LAogCQkJCSAgICAgICBzdHJ1Y3Qg
ZG1hX2ZlbmNlICpleGNsdXNpdmUsCi0JCQkJICAgICAgIGRtYV9hZGRyX3QgKnBhZ2VzX2FkZHIs
Ci0JCQkJICAgICAgIHN0cnVjdCBhbWRncHVfdm0gKnZtLAogCQkJCSAgICAgICB1aW50NjRfdCBz
dGFydCwgdWludDY0X3QgbGFzdCwKIAkJCQkgICAgICAgdWludDY0X3QgZmxhZ3MsIHVpbnQ2NF90
IGFkZHIsCisJCQkJICAgICAgIGRtYV9hZGRyX3QgKnBhZ2VzX2FkZHIsCiAJCQkJICAgICAgIHN0
cnVjdCBkbWFfZmVuY2UgKipmZW5jZSkKIHsKIAlzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJh
bXMgcGFyYW1zOwpAQCAtMTUxNSw2ICsxNTE2LDcgQEAgc3RhdGljIGludCBhbWRncHVfdm1fYm9f
dXBkYXRlX21hcHBpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJbWVtc2V0KCZwYXJh
bXMsIDAsIHNpemVvZihwYXJhbXMpKTsKIAlwYXJhbXMuYWRldiA9IGFkZXY7CiAJcGFyYW1zLnZt
ID0gdm07CisJcGFyYW1zLmRpcmVjdCA9IGRpcmVjdDsKIAlwYXJhbXMucGFnZXNfYWRkciA9IHBh
Z2VzX2FkZHI7CiAKIAkvKiBzeW5jIHRvIGV2ZXJ5dGhpbmcgZXhjZXB0IGV2aWN0aW9uIGZlbmNl
cyBvbiB1bm1hcHBpbmcgKi8KQEAgLTE2NDYsOSArMTY0OCw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X3ZtX2JvX3NwbGl0X21hcHBpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCX0KIAog
CQlsYXN0ID0gbWluKCh1aW50NjRfdCltYXBwaW5nLT5sYXN0LCBzdGFydCArIG1heF9lbnRyaWVz
IC0gMSk7Ci0JCXIgPSBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcoYWRldiwgZXhjbHVzaXZl
LCBkbWFfYWRkciwgdm0sCisJCXIgPSBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcoYWRldiwg
dm0sIGZhbHNlLCBleGNsdXNpdmUsCiAJCQkJCQlzdGFydCwgbGFzdCwgZmxhZ3MsIGFkZHIsCi0J
CQkJCQlmZW5jZSk7CisJCQkJCQlkbWFfYWRkciwgZmVuY2UpOwogCQlpZiAocikKIAkJCXJldHVy
biByOwogCkBAIC0xOTQyLDkgKzE5NDQsOSBAQCBpbnQgYW1kZ3B1X3ZtX2NsZWFyX2ZyZWVkKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkgICAgbWFwcGluZy0+c3RhcnQgPCBBTURHUFVf
R01DX0hPTEVfU1RBUlQpCiAJCQlpbml0X3B0ZV92YWx1ZSA9IEFNREdQVV9QVEVfREVGQVVMVF9B
VEM7CiAKLQkJciA9IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhhZGV2LCBOVUxMLCBOVUxM
LCB2bSwKKwkJciA9IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhhZGV2LCB2bSwgZmFsc2Us
IE5VTEwsCiAJCQkJCQltYXBwaW5nLT5zdGFydCwgbWFwcGluZy0+bGFzdCwKLQkJCQkJCWluaXRf
cHRlX3ZhbHVlLCAwLCAmZik7CisJCQkJCQlpbml0X3B0ZV92YWx1ZSwgMCwgTlVMTCwgJmYpOwog
CQlhbWRncHVfdm1fZnJlZV9tYXBwaW5nKGFkZXYsIHZtLCBtYXBwaW5nLCBmKTsKIAkJaWYgKHIp
IHsKIAkJCWRtYV9mZW5jZV9wdXQoZik7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
