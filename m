Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF0B4906D
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3E76E05F;
	Mon, 17 Jun 2019 19:50:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA926E059
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:21 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id i125so6995450qkd.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nqLmAMQbto1JpPtD7gpOEgwPOwNuyZcYiq4q3WawGHA=;
 b=ZxlCpSUcEu88aiXRMBaJ+NuoR9BGbkeNhmdUU95m73WGXdM1bTj8mA6TORR0f80xe+
 U0/p/1m28C+G9m/cSzDIikwWoZg3HnSHo8ictScb23YPe4bZgeuaxW/jSP6JojESpyfQ
 0CyNMawU3UnlMl+t1a5+MslLrdDaKrabUMP+vCx8DGABmnQFf/vnEfBe3sAH7fXYB8vd
 lbkkkcpB73cpfN+g8lBLxxyMpy17SqPbN1EpU4vv85tlfp6jLLwRJR6IISHF7w+cxE0l
 lluhikn5URdFZ763GokD18Sg6qi+n6N3Yr4Ye8k6/D+jAiBH3o7oCM3/Vjw6+MgAcBMO
 x0UQ==
X-Gm-Message-State: APjAAAV1X6CoWrDp9S3LJJUksdOe6E3QloJb+vpT1PU9KuHnxE1unKf2
 4PItX7ZmTfT3QY33QcIrmfZGwKrvKXigww==
X-Google-Smtp-Source: APXvYqy9NNelIExUJxsHW7g7ViIKBhhRoPvtcDUwr3XB3s0+UinKc8drIqR8yro7pwQki4pWy48rfg==
X-Received: by 2002:a05:620a:1519:: with SMTP id
 i25mr58114253qkk.331.1560801020811; 
 Mon, 17 Jun 2019 12:50:20 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 424/459] drm/amd/display: Integrate color transform3x4 with
 3dlut tm
Date: Mon, 17 Jun 2019 14:49:13 -0500
Message-Id: <20190617194948.18667-25-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nqLmAMQbto1JpPtD7gpOEgwPOwNuyZcYiq4q3WawGHA=;
 b=rhpPmIEu9rEF8IOyKq9R8BsaYGnc8Prhv3mgP1zfDHJ7OTBM2M2vsheiEogu262ZT8
 oncKUCxaL3vDAWfcvjX4/sDK9N2r+HTixgr9g/44hnDG8CPjodgKm9gMe8NMUgD+6XNQ
 P46RWrcdlNBtFtIU7W1iA5UvToad9bVtVsgUkpfjT1kv/L3jD1YwktNqCU1FQGF1/g2+
 qV5KwnCrTZ/E8zDa0xKfUFjp9ioE2I0ca1MGHJOH0O1IzZmNrRqK+1mWK23Pom02I6mr
 RTfh3apfX/xGL2WVS0LNe8uo3MAn2ex6E2ZLFE62luZvPFWMyZyuX4ES/1u2DCp7qpEH
 VhxQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Vitaly Prosyak <Vitaly.Prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVml0YWx5IFByb3N5YWsgPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+CgpbV2h5ICYgSG93
XQpSZXVzZSBleGlzdGVudCBjb2RlIHBhdGggKGRjbjErKSBhbmQgaW4gb3JkZXIgdG8gZG8gdGhh
dCBhcHBseSBkZSBnYW1tYQppbiAxRCBibGVuZGVyIExVVCBhbmQgcmUgdXNlIE1QQyBPR0FNLgpG
b2xsb3cgdXAgaXMgcmVxdWlyZWQuCgpTaWduZWQtb2ZmLWJ5OiBWaXRhbHkgUHJvc3lhayA8dml0
YWx5LnByb3N5YWtAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQu
Y29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5j
b20+CkFja2VkLWJ5OiBLcnVub3NsYXYgS292YWMgPEtydW5vc2xhdi5Lb3ZhY0BhbWQuY29tPgpB
Y2tlZC1ieTogVml0YWx5IFByb3N5YWsgPFZpdGFseS5Qcm9zeWFrQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jICAgICAgICAgICAgIHwgIDcgKysr
KysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3VyZmFjZS5jICAg
ICB8IDEwICsrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oICAg
ICAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxl
cy9pbmMvbW9kX3NoYXJlZC5oIHwgIDcgKysrKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kYy5jCmluZGV4IDZhYmYyMmFhZjU3MS4uODY3YTg0YzJiZmJmIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKQEAgLTE2NjksNiArMTY2OSwxMyBAQCBzdGF0
aWMgdm9pZCBjb3B5X3N1cmZhY2VfdXBkYXRlX3RvX3BsYW5lKAogCQkJc3JmX3VwZGF0ZS0+bHV0
M2RfZnVuYykpCiAJCW1lbWNweShzdXJmYWNlLT5sdXQzZF9mdW5jLCBzcmZfdXBkYXRlLT5sdXQz
ZF9mdW5jLAogCQlzaXplb2YoKnN1cmZhY2UtPmx1dDNkX2Z1bmMpKTsKKworCWlmIChzcmZfdXBk
YXRlLT5ibGVuZF90ZiAmJgorCQkJKHN1cmZhY2UtPmJsZW5kX3RmICE9CisJCQlzcmZfdXBkYXRl
LT5ibGVuZF90ZikpCisJCW1lbWNweShzdXJmYWNlLT5ibGVuZF90Ziwgc3JmX3VwZGF0ZS0+Ymxl
bmRfdGYsCisJCXNpemVvZigqc3VyZmFjZS0+YmxlbmRfdGYpKTsKKwogI2VuZGlmCiAJaWYgKHNy
Zl91cGRhdGUtPmlucHV0X2NzY19jb2xvcl9tYXRyaXgpCiAJCXN1cmZhY2UtPmlucHV0X2NzY19j
b2xvcl9tYXRyaXggPQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGNfc3VyZmFjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfc3VyZmFjZS5jCmluZGV4IDYwZjIwZDk2ZjllMC4uMzk0YTg3OTgxNjE0IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdXJmYWNlLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfc3VyZmFjZS5jCkBAIC02MCw2
ICs2MCwxMSBAQCBzdGF0aWMgdm9pZCBjb25zdHJ1Y3Qoc3RydWN0IGRjX2NvbnRleHQgKmN0eCwg
c3RydWN0IGRjX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZQogCQlwbGFuZV9zdGF0ZS0+bHV0M2Rf
ZnVuYy0+Y3R4ID0gY3R4OwogCQlwbGFuZV9zdGF0ZS0+bHV0M2RfZnVuYy0+aW5pdGlhbGl6ZWQg
PSBmYWxzZTsKIAl9CisJcGxhbmVfc3RhdGUtPmJsZW5kX3RmID0gZGNfY3JlYXRlX3RyYW5zZmVy
X2Z1bmMoKTsKKwlpZiAocGxhbmVfc3RhdGUtPmJsZW5kX3RmICE9IE5VTEwpIHsKKwkJcGxhbmVf
c3RhdGUtPmJsZW5kX3RmLT50eXBlID0gVEZfVFlQRV9CWVBBU1M7CisJCXBsYW5lX3N0YXRlLT5i
bGVuZF90Zi0+Y3R4ID0gY3R4OworCX0KIAogI2VuZGlmCiB9CkBAIC04NSw2ICs5MCwxMSBAQCBz
dGF0aWMgdm9pZCBkZXN0cnVjdChzdHJ1Y3QgZGNfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlKQog
CQkJCXBsYW5lX3N0YXRlLT5sdXQzZF9mdW5jKTsKIAkJcGxhbmVfc3RhdGUtPmx1dDNkX2Z1bmMg
PSBOVUxMOwogCX0KKwlpZiAocGxhbmVfc3RhdGUtPmJsZW5kX3RmICE9IE5VTEwpIHsKKwkJZGNf
dHJhbnNmZXJfZnVuY19yZWxlYXNlKAorCQkJCXBsYW5lX3N0YXRlLT5ibGVuZF90Zik7CisJCXBs
YW5lX3N0YXRlLT5ibGVuZF90ZiA9IE5VTEw7CisJfQogCiAjZW5kaWYKIH0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjLmgKaW5kZXggMTM5ZWE3MzU0OTEwLi41M2EzODc2ODQxY2MgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC03NjEsNiArNzYxLDcgQEAgc3RydWN0IGRj
X3N1cmZhY2VfdXBkYXRlIHsKICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMCkK
IAljb25zdCBzdHJ1Y3QgZGNfdHJhbnNmZXJfZnVuYyAqZnVuY19zaGFwZXI7CiAJY29uc3Qgc3Ry
dWN0IGRjXzNkbHV0ICpsdXQzZF9mdW5jOworCWNvbnN0IHN0cnVjdCBkY190cmFuc2Zlcl9mdW5j
ICpibGVuZF90ZjsKICNlbmRpZgogfTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L21vZHVsZXMvaW5jL21vZF9zaGFyZWQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9tb2R1bGVzL2luYy9tb2Rfc2hhcmVkLmgKaW5kZXggNmM4NzdlZWJhNDI5Li5iNDVm
N2Q2NWU3NmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVz
L2luYy9tb2Rfc2hhcmVkLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVs
ZXMvaW5jL21vZF9zaGFyZWQuaApAQCAtNjQsNyArNjQsOCBAQCB1bmlvbiBsdXQzZF9jb250cm9s
X2ZsYWdzIHsKIAkJdW5zaWduZWQgaW50IHVzZV9nYW11dF9tYXBfbGliCQkJCQk6MTsKIAkJdW5z
aWduZWQgaW50IGNocm9tYXRpY19hZGFwdGF0aW9uX3NyYwkJCQk6MTsKIAkJdW5zaWduZWQgaW50
IGNocm9tYXRpY19hZGFwdGF0aW9uX2RzdAkJCQk6MTsKLQkJdW5zaWduZWQgaW50IHJlc2V2ZWQJ
CQkJCTo1OworCQl1bnNpZ25lZCBpbnQgZG9fYmxlbmRlcl9sdXRfZGVnYW1tYQkJOjE7CisJCXVu
c2lnbmVkIGludCByZXNldmVkCQkJCQk6NDsKIAl9IGJpdHM7CiB9OwogCkBAIC03OCw4ICs3OSw4
IEBAIGVudW0gbHV0M2RfY29udHJvbF9nYW11dF9tYXAgewogCWx1dDNkX2NvbnRyb2xfZ2FtdXRf
bWFwX25vbmUgPSAwLAogCWx1dDNkX2NvbnRyb2xfZ2FtdXRfbWFwX3RvbmVtYXAsCiAJbHV0M2Rf
Y29udHJvbF9nYW11dF9tYXBfY2h0bywKLQlsdXQzZF9jb250cm9sX2dhbXV0X21hcF9jaHRvX2No
c28sCi0JbHV0M2RfY29udHJvbF9nYW11dF9tYXBfY2h0b19jaGNpCisJbHV0M2RfY29udHJvbF9n
YW11dF9tYXBfY2hzbywKKwlsdXQzZF9jb250cm9sX2dhbXV0X21hcF9jaGNpCiB9OwogCiBlbnVt
IGx1dDNkX2NvbnRyb2xfcm90YXRpb25fbW9kZSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
