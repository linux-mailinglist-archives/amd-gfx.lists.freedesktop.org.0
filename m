Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724B1DB1B7
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 18:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BF689DC1;
	Thu, 17 Oct 2019 16:00:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B67B89DC1
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 16:00:38 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id 3so4367275qta.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 09:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rf5sCW1kFnrLnDFkAywc6zz6+bv88IAFdxESBtCEvXs=;
 b=hxKjoyN1A3J6gYYvJ+ANgyu+sniZ/fsmCdA3s+JROWytpR/bBtvM4IUIt9odT/bUJi
 8MQJGUab1Gv23UqgumqTZKNv4x1F8qcgDhCuTxpPmtejyStJq72GwQHGEeooIlRpZfN3
 cJIO1JoO98TdBVnP1LCuU7rkHahCvx/FXfOG9d1Ho/FXWXd1xw0yMWYnGJLakB6Vz3Ln
 PeKPhSb3828t3ChPPUqvyBYN2Cis4NBv53ZLU/PByJfjNcHnrxbkYvdC2iSL3eaEFdiV
 BG2uwq19VvcKjeEX/S3bTtlcwj6UeUWwkaavubex2ALCmbX5o1K3YfY5iUxaMa2kWw3x
 rUUA==
X-Gm-Message-State: APjAAAU4imrojPsU1Np1QAT9arm9RzPlryhthiPpVGnySZYx1fnq73CX
 KvnaZYbuach+c0Tv/imno5I8T71s
X-Google-Smtp-Source: APXvYqxymtFamxuLK7SJGUW0QioIesgJlgWYrA9iGGpUrvspiO8+J8zfYdh4YhoQvpcx00TdXD7RlA==
X-Received: by 2002:ac8:724f:: with SMTP id l15mr4592268qtp.61.1571328036084; 
 Thu, 17 Oct 2019 09:00:36 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id p56sm1858130qtp.81.2019.10.17.09.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 09:00:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/powerplay: use local renoir array sizes for clock
 fetching
Date: Thu, 17 Oct 2019 12:00:27 -0400
Message-Id: <20191017160027.355095-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rf5sCW1kFnrLnDFkAywc6zz6+bv88IAFdxESBtCEvXs=;
 b=Sb0C8X3vLlRK2tfrHaJ/7fYzLig2+rEm54ADS7/ByoKnbA2DUVHA2jABZMGAopEn64
 zrELEG6q/T5Gw/9l7M9hFC+GYGBg2H7POKtiMzM1DQfNuLqB2a4amyFG7lp9oqWuh6Vn
 np12AWH3nKrJ20NDpr+ykwKv5e2bc7alhWCgE2Nq/HgFxaDLWYvRtPWimrMUXMxBe5Vf
 2oOMXyRhLfePRZIM+X6o5JcZAciIl4L+uhJR4tVQicZU3pKWbOYnaJoAjLqSBbPYdX7L
 8SE4voV/iOCDH4plaoddVOSsgWJnjUDsNFZ4RhRJCj5ki3SbjaMLs7kKyTy/CD+D6Y8U
 gqAg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VG8gYXZvaWQgd2Fsa2luZyBwYXN0IHRoZSBlbmQgb2YgdGhlIGFycmF5cyBzaW5jZSB0aGUgUFBf
U01VCmRlZmluZXMgZG9uJ3QgbWF0Y2ggdGhlIHJlbm9pciBkZWZpbmVzLgoKU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCmluZGV4IGZhMzE0YzI3NWE4Mi4uZjBjOGQxYWQy
YTgwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCkBAIC00
MjcsMjIgKzQyNywyMiBAQCBzdGF0aWMgaW50IHJlbm9pcl9nZXRfZHBtX2Nsb2NrX3RhYmxlKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LCBzdHJ1Y3QgZHBtX2Nsb2NrcwogCWlmICghY2xvY2tfdGFi
bGUgfHwgIXRhYmxlKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCWZvciAoaSA9IDA7IGkgPCBQUF9T
TVVfTlVNX0RDRkNMS19EUE1fTEVWRUxTOyBpKyspIHsKKwlmb3IgKGkgPSAwOyBpIDwgTlVNX0RD
RkNMS19EUE1fTEVWRUxTOyBpKyspIHsKIAkJY2xvY2tfdGFibGUtPkRjZkNsb2Nrc1tpXS5GcmVx
ID0gdGFibGUtPkRjZkNsb2Nrc1tpXS5GcmVxOwogCQljbG9ja190YWJsZS0+RGNmQ2xvY2tzW2ld
LlZvbCA9IHRhYmxlLT5EY2ZDbG9ja3NbaV0uVm9sOwogCX0KIAotCWZvciAoaSA9IDA7IGkgPCBQ
UF9TTVVfTlVNX1NPQ0NMS19EUE1fTEVWRUxTOyBpKyspIHsKKwlmb3IgKGkgPSAwOyBpIDwgTlVN
X1NPQ0NMS19EUE1fTEVWRUxTOyBpKyspIHsKIAkJY2xvY2tfdGFibGUtPlNvY0Nsb2Nrc1tpXS5G
cmVxID0gdGFibGUtPlNvY0Nsb2Nrc1tpXS5GcmVxOwogCQljbG9ja190YWJsZS0+U29jQ2xvY2tz
W2ldLlZvbCA9IHRhYmxlLT5Tb2NDbG9ja3NbaV0uVm9sOwogCX0KIAotCWZvciAoaSA9IDA7IGkg
PCBQUF9TTVVfTlVNX0ZDTEtfRFBNX0xFVkVMUzsgaSsrKSB7CisJZm9yIChpID0gMDsgaSA8IE5V
TV9GQ0xLX0RQTV9MRVZFTFM7IGkrKykgewogCQljbG9ja190YWJsZS0+RkNsb2Nrc1tpXS5GcmVx
ID0gdGFibGUtPkZDbG9ja3NbaV0uRnJlcTsKIAkJY2xvY2tfdGFibGUtPkZDbG9ja3NbaV0uVm9s
ID0gdGFibGUtPkZDbG9ja3NbaV0uVm9sOwogCX0KIAotCWZvciAoaSA9IDA7IGk8ICBQUF9TTVVf
TlVNX01FTUNMS19EUE1fTEVWRUxTOyBpKyspIHsKKwlmb3IgKGkgPSAwOyBpPCAgTlVNX01FTUNM
S19EUE1fTEVWRUxTOyBpKyspIHsKIAkJY2xvY2tfdGFibGUtPk1lbUNsb2Nrc1tpXS5GcmVxID0g
dGFibGUtPk1lbUNsb2Nrc1tpXS5GcmVxOwogCQljbG9ja190YWJsZS0+TWVtQ2xvY2tzW2ldLlZv
bCA9IHRhYmxlLT5NZW1DbG9ja3NbaV0uVm9sOwogCX0KLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
