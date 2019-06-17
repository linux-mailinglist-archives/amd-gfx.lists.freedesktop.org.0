Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B693A49072
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12286E062;
	Mon, 17 Jun 2019 19:50:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1A96E062
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:42 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n11so12307767qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+Xi4xqCrE5R+evDb1qg2psm86zgsp0HzcgJfrFrXcc=;
 b=dOgn/sf9vCG/7+bBt3O7l8mPKFUu63jccTluEBpUxvSDfKWivx3PB02jSsl0zw94/a
 xafshbrf1E+29DJhy2lVJ7CPJkG1WGlpmOHM9ldyb6VO2u6/t1apRDZx8hXwVmRQGUcw
 ggwhTsBH48UiPx2Bwjyhl2SfPKph941dQoYCKnfRZzNd81F2w9PaXuUMmhX8VLlyYJJz
 r1LzK3B5HqfFMT4fbrPaGW+VDhM2LA/2KNnt4ysB15Rt3MRTz/nG6qWjPXN7c6QMU7UQ
 3KfHc20z+pug+XjHUOYd+u8lHkS8qyFMVoNVrZgLA3bz8dL603i6IBp8cgCY/ZjA+Iwk
 X3Aw==
X-Gm-Message-State: APjAAAVFLmQ9CJPK1UiPWoTHSrT/kQ8hqZ2kWf/E77twmL65kD7iiStN
 9HG0ZCHFQKt7pjShzM4ir4GxEkla8NbBiA==
X-Google-Smtp-Source: APXvYqxGeyozBK/ZjYX8bsIgBDVT3p8IT4vJVngf6n2Ov8DWGpR+7OeKPrvjE+ZpqQQcEcMpKK+k4g==
X-Received: by 2002:a0c:96e7:: with SMTP id b36mr23181060qvd.155.1560801041031; 
 Mon, 17 Jun 2019 12:50:41 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 445/459] drm/amd/display: making DCN20 WM table non-overlapping
Date: Mon, 17 Jun 2019 14:49:34 -0500
Message-Id: <20190617194948.18667-46-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+Xi4xqCrE5R+evDb1qg2psm86zgsp0HzcgJfrFrXcc=;
 b=UBO00t+4KLjg1Y1Ep4gE+L06eG0hh+tXZnJLZOu4HsTd10V7NJmUGWLtsP0xNpaRba
 atirknZgVTZx6FOgjLv1stBj/MCblyvTDQSqvEECGUc3mB2Q8HVbP3wbXUcbxqFKsajh
 oHBbakkAwK357RyyOd9mwhEAtn6PGXcKuwFA8hJG78AZP1d83DtxJXPPL9bJzb8SxUO8
 UxLluvYL6MmRLkI5ibGP7PbWTSkifyPR7TzPqjwhqAVzgFnJ038UFdx5kARgmhBISBFI
 ZTY1qfOAggCZVWYQCC3t/ZAfFBHS9CpXH9JDBaNhI04Xe+NUibb+HfN4bWqxqZqtjqHW
 tcVA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Eric Yang <eric.yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KRXhpc3RpbmcgYmVoYXZpb3Ig
aGFzIG92ZXJsYXBwaW5nIHJhbmdlcyByZXN1bHRpbmcgaW4gcGF0aApkZXBlbmRlbnQgU01VIHNl
bGVjdGlvbgoKW2hvd10KTWFrZSByYW5nZXMgbm9uLW92ZXJsYXBwaW5nLCByZXN1bHRpbmcgaW4g
bm9uLXBhdGggZGVwZW5kZW50CnNlbGVjdGlvbgoKU2lnbmVkLW9mZi1ieTogSnVuIExlaSA8SnVu
LkxlaUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRXJpYyBZYW5nIDxlcmljLnlhbmcyQGFtZC5jb20+
CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyAgIHwgMTcg
KysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCAzMTA2ODdlYzE2NmUuLjM2YmYxNDMzMmJmNSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291
cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jl
c291cmNlLmMKQEAgLTI2MzUsNyArMjYzNSw4IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9ib3VuZGlu
Z19ib3goc3RydWN0IGRjICpkYywgc3RydWN0IF92Y3NfZHBpX3NvY19ib3VuZGluZ19ib3hfCiAJ
CWNhbGN1bGF0ZWRfc3RhdGVzW2ldLnN0YXRlID0gaTsKIAkJY2FsY3VsYXRlZF9zdGF0ZXNbaV0u
ZHJhbV9zcGVlZF9tdHMgPSB1Y2xrX3N0YXRlc1tpXSAqIDE2IC8gMTAwMDsKIAotCQltaW5fZmNs
a19yZXF1aXJlZF9ieV91Y2xrID0gKCh1bnNpZ25lZCBsb25nIGxvbmcpdWNsa19zdGF0ZXNbaV0p
ICogMTAwOCAvIDEwMDAwMDA7CisJCS8vIEZDTEs6VUNMSyByYXRpbyBpcyAxLjA4CisJCW1pbl9m
Y2xrX3JlcXVpcmVkX2J5X3VjbGsgPSAoKHVuc2lnbmVkIGxvbmcgbG9uZyl1Y2xrX3N0YXRlc1tp
XSkgKiAxMDgwIC8gMTAwMDAwMDsKIAogCQljYWxjdWxhdGVkX3N0YXRlc1tpXS5mYWJyaWNjbGtf
bWh6ID0gKG1pbl9mY2xrX3JlcXVpcmVkX2J5X3VjbGsgPCBtaW5fZGNmY2xrKSA/CiAJCQkJbWlu
X2RjZmNsayA6IG1pbl9mY2xrX3JlcXVpcmVkX2J5X3VjbGs7CkBAIC0yOTg5LDIxICsyOTkwLDE5
IEBAIHN0YXRpYyBib29sIGNvbnN0cnVjdCgKIAogCQkJcmFuZ2VzLm51bV9yZWFkZXJfd21fc2V0
cyA9IDE7CiAJCX0gZWxzZSBpZiAoZGNuMl8wX3NvYy5udW1fc3RhdGVzID4gMSkgewotCQkJZm9y
IChpID0gMDsgaSA8IDQgJiYgaSA8IGRjbjJfMF9zb2MubnVtX3N0YXRlcyAtIDE7IGkrKykgewor
CQkJZm9yIChpID0gMDsgaSA8IDQgJiYgaSA8IGRjbjJfMF9zb2MubnVtX3N0YXRlczsgaSsrKSB7
CiAJCQkJcmFuZ2VzLnJlYWRlcl93bV9zZXRzW2ldLndtX2luc3QgPSBpOwogCQkJCXJhbmdlcy5y
ZWFkZXJfd21fc2V0c1tpXS5taW5fZHJhaW5fY2xrX21oeiA9IFBQX1NNVV9XTV9TRVRfUkFOR0Vf
Q0xLX1VOQ09OU1RSQUlORURfTUlOOwogCQkJCXJhbmdlcy5yZWFkZXJfd21fc2V0c1tpXS5tYXhf
ZHJhaW5fY2xrX21oeiA9IFBQX1NNVV9XTV9TRVRfUkFOR0VfQ0xLX1VOQ09OU1RSQUlORURfTUFY
OwotCQkJCXJhbmdlcy5yZWFkZXJfd21fc2V0c1tpXS5taW5fZmlsbF9jbGtfbWh6ID0gZGNuMl8w
X3NvYy5jbG9ja19saW1pdHNbaV0uZHJhbV9zcGVlZF9tdHMgLyAxNjsKLQkJCQlyYW5nZXMucmVh
ZGVyX3dtX3NldHNbaV0ubWF4X2ZpbGxfY2xrX21oeiA9IGRjbjJfMF9zb2MuY2xvY2tfbGltaXRz
W2kgKyAxXS5kcmFtX3NwZWVkX210cyAvIDE2OworCQkJCXJhbmdlcy5yZWFkZXJfd21fc2V0c1tp
XS5taW5fZmlsbF9jbGtfbWh6ID0gKGkgPiAwKSA/IChkY24yXzBfc29jLmNsb2NrX2xpbWl0c1tp
IC0gMV0uZHJhbV9zcGVlZF9tdHMgLyAxNikgKyAxIDogMDsKKwkJCQlyYW5nZXMucmVhZGVyX3dt
X3NldHNbaV0ubWF4X2ZpbGxfY2xrX21oeiA9IGRjbjJfMF9zb2MuY2xvY2tfbGltaXRzW2ldLmRy
YW1fc3BlZWRfbXRzIC8gMTY7CiAKIAkJCQlyYW5nZXMubnVtX3JlYWRlcl93bV9zZXRzID0gaSAr
IDE7CiAJCQl9Ci0JCX0KIAotCQlyYW5nZXMucmVhZGVyX3dtX3NldHNbMF0ubWluX2RyYWluX2Ns
a19taHogPSBQUF9TTVVfV01fU0VUX1JBTkdFX0NMS19VTkNPTlNUUkFJTkVEX01JTjsKLQkJcmFu
Z2VzLnJlYWRlcl93bV9zZXRzWzBdLm1pbl9maWxsX2Nsa19taHogPSBQUF9TTVVfV01fU0VUX1JB
TkdFX0NMS19VTkNPTlNUUkFJTkVEX01JTjsKLQkJcmFuZ2VzLnJlYWRlcl93bV9zZXRzW3Jhbmdl
cy5udW1fcmVhZGVyX3dtX3NldHMgLSAxXS5tYXhfZHJhaW5fY2xrX21oeiA9IFBQX1NNVV9XTV9T
RVRfUkFOR0VfQ0xLX1VOQ09OU1RSQUlORURfTUFYOwotCQlyYW5nZXMucmVhZGVyX3dtX3NldHNb
cmFuZ2VzLm51bV9yZWFkZXJfd21fc2V0cyAtIDFdLm1heF9maWxsX2Nsa19taHogPSBQUF9TTVVf
V01fU0VUX1JBTkdFX0NMS19VTkNPTlNUUkFJTkVEX01BWDsKKwkJCXJhbmdlcy5yZWFkZXJfd21f
c2V0c1swXS5taW5fZmlsbF9jbGtfbWh6ID0gUFBfU01VX1dNX1NFVF9SQU5HRV9DTEtfVU5DT05T
VFJBSU5FRF9NSU47CisJCQlyYW5nZXMucmVhZGVyX3dtX3NldHNbcmFuZ2VzLm51bV9yZWFkZXJf
d21fc2V0cyAtIDFdLm1heF9maWxsX2Nsa19taHogPSBQUF9TTVVfV01fU0VUX1JBTkdFX0NMS19V
TkNPTlNUUkFJTkVEX01BWDsKKwkJfQogCiAJCXJhbmdlcy5udW1fd3JpdGVyX3dtX3NldHMgPSAx
OwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
