Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAC169E35
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4717489F69;
	Mon, 15 Jul 2019 21:25:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE3289F75
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:44 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id w190so12867722qkc.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H0mXIg723bZnQiTg2xs7jGp/4iB8FCANgF/jg/+VzyM=;
 b=ihuowOe6BUazmYfg+Obm5LQZ1QQOJLdL7sok50c+Ptzx2iudy1AI7QGVt/dEHPRHfL
 PhGOnlYqmy1CckOaZ/h2qzOmblNFOEQaf2O0ROzyeIf5wq07eIjVf+4rA5FjGwy/5jXP
 I6nlsZqyJHk1Tq4T0bXkC8RTNNExx0VA5inVadfG51w3+EQub7RgzO43D9fzn023EW6+
 f+SIi+BtujvrWiup4FYX4MqTnHKDBU1ity6rA6mhW8leExw75+GtknzZtgf5+CklZFOD
 suuepn3MiRufuOJuoHgxB/ehqkzmi2qHCnnYyupz4O2yVxhMM9cczn5kanU35OkZ1OWZ
 jUSg==
X-Gm-Message-State: APjAAAUBYJjrYJlYKTB+L3bawyIsbDmuqzhNkXU5aIpYh3/NZCxMOVQg
 6rfxBWSs4S3/rnpb1NtcjfowQxQl
X-Google-Smtp-Source: APXvYqyVMoQB1SvIQp+RA9KNuHhhm3e0M3oqVmv6477/ZsLhU9O3aWVZzYKtjsuf0/VTIGfCUYoE9A==
X-Received: by 2002:ae9:e84b:: with SMTP id a72mr19184797qkg.355.1563225943659; 
 Mon, 15 Jul 2019 14:25:43 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 066/102] drm/amdgpu: add vcn doorbell range function to
 nbio7.4 (v2)
Date: Mon, 15 Jul 2019 16:24:01 -0500
Message-Id: <20190715212437.31793-64-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H0mXIg723bZnQiTg2xs7jGp/4iB8FCANgF/jg/+VzyM=;
 b=gVYFHs0Tt2l4KHGgluzo+opsq1C8ZB7uyw2ZFWYnnoP0Nhz1VjkMiWhPcnSGhRcYcX
 VvNXjOi1UNEkCjKum0JUGX4dpYkx/cx0HIcZFdkrTkk3AemwQJgKzD9BnTv/gVE2oY5a
 qdmuOaq5HZw3R+Wj8bvwx97iTYYxHH8Libig3xbKBG1qYs95DNxe9rnbRwd72Yi/nzPG
 SbPf8BYDFZ78/wi6nVBznZAkE9NrXKqJLkIt7baw+ppvNCFJkZEsVax6xDGzU2N+MSW3
 7dYtefk8a68heRWkbVLttCApJkNmkPRGnNmhdAN+xurlK7n5JGHtgS957qPhCxdNbmv1
 WbIA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKVG8gc2V0dXAgdGhlIGFwZXJ0dXJlIGZv
ciBWQ04yLjUKCnYyOiBzZXR1cCB2Y24gZG9vcmJlbGxzIGluIHZjbjIuNSBod19pbml0IChBbGV4
KQoKU2lnbmVkLW9mZi1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMgIHwgIDMgKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9uYmlvX3Y3XzQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjdf
NC5jCmluZGV4IGZjNDVlYWVhYmE2ZS4uZDhjOTk3MmEzMTViIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9uYmlvX3Y3XzQuYwpAQCAtMTE0LDYgKzExNCwyNiBAQCBzdGF0aWMgdm9pZCBuYmlv
X3Y3XzRfc2RtYV9kb29yYmVsbF9yYW5nZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50
IGluc3RhbgogCVdSRUczMihyZWcsIGRvb3JiZWxsX3JhbmdlKTsKIH0KIAorc3RhdGljIHZvaWQg
bmJpb192N180X3Zjbl9kb29yYmVsbF9yYW5nZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwg
Ym9vbCB1c2VfZG9vcmJlbGwsCisJCQkJCSBpbnQgZG9vcmJlbGxfaW5kZXgpCit7CisJdTMyIHJl
ZyA9IFNPQzE1X1JFR19PRkZTRVQoTkJJTywgMCwgbW1CSUZfTU1TQ0gwX0RPT1JCRUxMX1JBTkdF
KTsKKworCXUzMiBkb29yYmVsbF9yYW5nZSA9IFJSRUczMihyZWcpOworCisJaWYgKHVzZV9kb29y
YmVsbCkgeworCQlkb29yYmVsbF9yYW5nZSA9IFJFR19TRVRfRklFTEQoZG9vcmJlbGxfcmFuZ2Us
CisJCQkJCSAgICAgICBCSUZfTU1TQ0gwX0RPT1JCRUxMX1JBTkdFLCBPRkZTRVQsCisJCQkJCSAg
ICAgICBkb29yYmVsbF9pbmRleCk7CisJCWRvb3JiZWxsX3JhbmdlID0gUkVHX1NFVF9GSUVMRChk
b29yYmVsbF9yYW5nZSwKKwkJCQkJICAgICAgIEJJRl9NTVNDSDBfRE9PUkJFTExfUkFOR0UsIFNJ
WkUsIDgpOworCX0gZWxzZQorCQlkb29yYmVsbF9yYW5nZSA9IFJFR19TRVRfRklFTEQoZG9vcmJl
bGxfcmFuZ2UsCisJCQkJCSAgICAgICBCSUZfTU1TQ0gwX0RPT1JCRUxMX1JBTkdFLCBTSVpFLCAw
KTsKKworCVdSRUczMihyZWcsIGRvb3JiZWxsX3JhbmdlKTsKK30KKwogc3RhdGljIHZvaWQgbmJp
b192N180X2VuYWJsZV9kb29yYmVsbF9hcGVydHVyZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKIAkJCQkJICAgICAgIGJvb2wgZW5hYmxlKQogewpAQCAtMjkyLDYgKzMxMiw3IEBAIGNvbnN0
IHN0cnVjdCBhbWRncHVfbmJpb19mdW5jcyBuYmlvX3Y3XzRfZnVuY3MgPSB7CiAJLmhkcF9mbHVz
aCA9IG5iaW9fdjdfNF9oZHBfZmx1c2gsCiAJLmdldF9tZW1zaXplID0gbmJpb192N180X2dldF9t
ZW1zaXplLAogCS5zZG1hX2Rvb3JiZWxsX3JhbmdlID0gbmJpb192N180X3NkbWFfZG9vcmJlbGxf
cmFuZ2UsCisJLnZjbl9kb29yYmVsbF9yYW5nZSA9IG5iaW9fdjdfNF92Y25fZG9vcmJlbGxfcmFu
Z2UsCiAJLmVuYWJsZV9kb29yYmVsbF9hcGVydHVyZSA9IG5iaW9fdjdfNF9lbmFibGVfZG9vcmJl
bGxfYXBlcnR1cmUsCiAJLmVuYWJsZV9kb29yYmVsbF9zZWxmcmluZ19hcGVydHVyZSA9IG5iaW9f
djdfNF9lbmFibGVfZG9vcmJlbGxfc2VsZnJpbmdfYXBlcnR1cmUsCiAJLmloX2Rvb3JiZWxsX3Jh
bmdlID0gbmJpb192N180X2loX2Rvb3JiZWxsX3JhbmdlLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3Zjbl92Ml81LmMKaW5kZXggMGZmYzBkNjBmYWQ4Li5mOWQ2ODE5ZjAyNjAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYwpAQCAtMjA1LDYgKzIwNSw5IEBAIHN0YXRpYyBpbnQg
dmNuX3YyXzVfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
ID0gJmFkZXYtPnZjbi5yaW5nX2RlYzsKIAlpbnQgaSwgcjsKIAorCWFkZXYtPm5iaW9fZnVuY3Mt
PnZjbl9kb29yYmVsbF9yYW5nZShhZGV2LCByaW5nLT51c2VfZG9vcmJlbGwsCisJCXJpbmctPmRv
b3JiZWxsX2luZGV4KTsKKwogCXIgPSBhbWRncHVfcmluZ190ZXN0X3JpbmcocmluZyk7CiAJaWYg
KHIpIHsKIAkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
