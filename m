Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793E149020
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BAC89F8E;
	Mon, 17 Jun 2019 19:47:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEC389F53
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:06 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d23so12321545qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wrKpaPIWpZvSh6NoVzpNuujUqaFPTl/MheoCgk61IiM=;
 b=G2Kw3o98GUsE2huJ4LmIwO7NcaIZYRJVc3ZAXcepLIFtHiRI42zFTyY9t9o0tNF6WG
 JCssxE85RMF+xAXuxIaudy71s6/02rEcW8RbBTVu6X5Y3wLoOfPkJ8O86SbHhUouQX0A
 kQUAyilwgjw0MHzxkgvb7fQMgTzVg2jTbAOJB6ws9UspTyEbqGgCDUg2bqaWC/Q1NZX3
 CSYwY6ES82hEQN5G/eicFQXqIJTAtq19mWonQ8LRuvgM64sxXlXgpxQQ7mNjvFb4X1Hw
 rNXDfUfgqcE+tHfdVHOQijnogJTTBPcq2X0lgL1dTeFMKnboBl5kevJrjaf6o3dC33/f
 hXXg==
X-Gm-Message-State: APjAAAVsHRwmgz9C+G9ixuKWKRVNWvuOjgwJ5rZdznPeUL43T+o3Mzwh
 /jOWBZBb3DiSPoTwBTXFCjI0LIb5RE153w==
X-Google-Smtp-Source: APXvYqw574aX4XXQ9/VpmaWWBvcITsTxJFxIHBrzO2u+7ZglecVI3OWxqPeNtpVyXhXsJrAQcqx7Ww==
X-Received: by 2002:ac8:234a:: with SMTP id b10mr41111696qtb.261.1560800824732; 
 Mon, 17 Jun 2019 12:47:04 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 368/459] drm/amd/display: Properly set u clock
Date: Mon, 17 Jun 2019 14:45:09 -0500
Message-Id: <20190617194540.18497-69-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wrKpaPIWpZvSh6NoVzpNuujUqaFPTl/MheoCgk61IiM=;
 b=c49UwL98p5sbJp/8Kg0u9VeIE4WB65MMpwnfKU9uYb06jgEoaEpbfYfl33dwSPg2Vv
 SSgYTreYDOccWGKdncQk66rOAub4ndtZDDxqpET/UEz2Am+asXoF3mKQV/tpWAbAzVGx
 EUzISk2nRYO3aO6VPZJN1pqHkRktSbIdxxs5DEKiAYbLsBBFLyFAGVrfTzHblP0t8lB+
 prOAxpQ4cennB+M7NOkTf4BxSNvY8/Hq17XCuHU8LyzxiQZbaJZqIkrjQzs3hz7LlLyy
 X7tN97T6J/6PPTd1NCrMq0R1I42YdPGHoAKfvhxFMI9yX/LuJwoTKgKk49meX/dXVjKo
 dN9g==
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
Cc: Leo Li <sunpeng.li@amd.com>, Aidan Wood <Aidan.Wood@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWlkYW4gV29vZCA8QWlkYW4uV29vZEBhbWQuY29tPgoKW1doeV0KdSBjbGsgc2V0IHJl
cXVlc3Qgd2FzIGJlaW5nIHNlbnQgaW4gdW5pdHMgb2YgbXRzLCB3aGVuIGl0IG5lZWRlZCB0byBi
ZQppbiB1bml0cyBvZiBNaHoKCltIb3ddCmFkZCBhIGRpdmlzaW9uIGJ5IDE2IHRvIGNvbnZlcnQg
ZnJvbSBtdHMgdG8gTWh6CgpTaWduZWQtb2ZmLWJ5OiBBaWRhbiBXb29kIDxBaWRhbi5Xb29kQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBKdW4gTGVpIDxKdW4uTGVpQGFtZC5jb20+CkFja2VkLWJ5OiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCA2YmM0YjNmMzMwMWYuLjdh
YTI4NTliMzVmYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTIxMzIsNyArMjEzMiw3IEBAIGJvb2wgZGNuMjBf
dmFsaWRhdGVfYmFuZHdpZHRoKHN0cnVjdCBkYyAqZGMsCiAJY29udGV4dC0+YndfY3R4LmJ3LmRj
bi5jbGsuZGlzcGNsa19raHogPSBjb250ZXh0LT5id19jdHguZG1sLnZiYS5ESVNQQ0xLICogMTAw
MDsKIAljb250ZXh0LT5id19jdHguYncuZGNuLmNsay5kY2ZjbGtfa2h6ID0gY29udGV4dC0+Yndf
Y3R4LmRtbC52YmEuRENGQ0xLICogMTAwMDsKIAljb250ZXh0LT5id19jdHguYncuZGNuLmNsay5z
b2NjbGtfa2h6ID0gY29udGV4dC0+YndfY3R4LmRtbC52YmEuU09DQ0xLICogMTAwMDsKLQljb250
ZXh0LT5id19jdHguYncuZGNuLmNsay5kcmFtY2xrX2toeiA9IGNvbnRleHQtPmJ3X2N0eC5kbWwu
dmJhLkRSQU1TcGVlZCAqIDEwMDA7CisJY29udGV4dC0+YndfY3R4LmJ3LmRjbi5jbGsuZHJhbWNs
a19raHogPSBjb250ZXh0LT5id19jdHguZG1sLnZiYS5EUkFNU3BlZWQgKiAxMDAwIC8gMTY7CiAJ
Y29udGV4dC0+YndfY3R4LmJ3LmRjbi5jbGsuZGNmY2xrX2RlZXBfc2xlZXBfa2h6ID0gY29udGV4
dC0+YndfY3R4LmRtbC52YmEuRENGQ0xLRGVlcFNsZWVwICogMTAwMDsKIAljb250ZXh0LT5id19j
dHguYncuZGNuLmNsay5mY2xrX2toeiA9IGNvbnRleHQtPmJ3X2N0eC5kbWwudmJhLkZhYnJpY0Ns
b2NrICogMTAwMDsKIAljb250ZXh0LT5id19jdHguYncuZGNuLmNsay5wX3N0YXRlX2NoYW5nZV9z
dXBwb3J0ID0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
