Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8F948EAC
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A539B898C2;
	Mon, 17 Jun 2019 19:27:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D914F8989E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:30 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n11so12212375qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YzKH/+y9vphe1l6gkoOfLNx4cD153eRQ3m9cH6IR/HA=;
 b=sZgI7mM74POHbrTNg3y5qHqCuwMU5fqhQDFtnMZEg4P/eLfyXQBild2bO2i7sXu1kh
 GNIbTHEmsAYgeS5bEHCngp1b9J95pZl2Q9qpMOlZuiGclt7Ys075QuzO5GBBBtL6uyZk
 lwdeJk9ygFWMIQJrL334Xx01PpAIlGzzNJTwCW5IiihZHDEZuyBNBziAyYC3a4Se70Kq
 ETEaBVIUkikiEvx43UfmLqrjftWMw2MSLxUG505D6cqSWFYsDIRzSscfSJGSt6rm+Rnz
 snlySJYC9d7JP9+cqlO5btEcSV+h8xCy/uyQsbD3W3NQvPRD+YFKY2pOFcXjud2/gAan
 7kag==
X-Gm-Message-State: APjAAAXGYXR8lgJi4Bh17aKh5a8mu2cAXtNx7u6GC9N5MKCAktAYALw6
 EZjtaTuVOwXRK5lwMYqtagI6TSse12c=
X-Google-Smtp-Source: APXvYqxRyGWgyaVvqfzv7nDsIVxw+jFxbLGKVaGdEDydAzFLUZM9JNevwRpixymt2CHhzlt8+3LdKA==
X-Received: by 2002:a0c:9274:: with SMTP id 49mr7692501qvz.119.1560799649868; 
 Mon, 17 Jun 2019 12:27:29 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 119/459] drm/amdgpu/mes: add mes header file and definition
Date: Mon, 17 Jun 2019 14:25:44 -0500
Message-Id: <20190617192704.18038-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YzKH/+y9vphe1l6gkoOfLNx4cD153eRQ3m9cH6IR/HA=;
 b=n+u//tqonbqB5Z3/gFooEKYn8lhwqrEpkuqGVVx+st0Z+3AqmQSD6Omw+lrPDQ0Mo2
 YvVLY045LWdhsCv7dFe4fRI/a8rNls9a7yKwnwA2r93EsDVU5f1FHR8qhnrlEUUOfVw2
 t/Zf1JhHfruXOpnwEv43edYCG5mgHv5LMxIYvpnTMDGsH4urp2Zay5ZQBS4sZTMbbR5F
 GB0q7LXFJH7Zvdd2JAlffEvaomwRsIt3tlETTZJNaljM6J6dDtSAhF6PY84V2K58IWrL
 DGADyJ5Qu4Fzjdqfvv+uh8CAgKGZi2cRkCQz6aFVJ18aoF+VgH3VbQYfU0EcOFL7P2il
 Yzpg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkFkZCBkdW1teSBoZWFkZXIgZmls
ZSBhbmQgZGVmaW5pdGlvbnMgb2YgbWVzLgoKQWNrZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tp
bmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICB8ICA1ICsr
KysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaCB8IDMxICsrKysrKysr
KysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaAoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXggYTRlMmNlNDhiZDYzLi5mNTlhN2Zi
ZjU0NGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCkBAIC04NSw2ICs4NSw3IEBA
CiAjaW5jbHVkZSAiYW1kZ3B1X2FtZGtmZC5oIgogI2luY2x1ZGUgImFtZGdwdV9zbXUuaCIKICNp
bmNsdWRlICJhbWRncHVfZGlzY292ZXJ5LmgiCisjaW5jbHVkZSAiYW1kZ3B1X21lcy5oIgogCiAj
ZGVmaW5lIE1BWF9HUFVfSU5TVEFOQ0UJCTE2CiAKQEAgLTkyMCw2ICs5MjEsMTAgQEAgc3RydWN0
IGFtZGdwdV9kZXZpY2UgewogCS8qIGRpc2NvdmVyeSAqLwogCXVpbnQ4X3QJCQkJKmRpc2NvdmVy
eTsKIAorCS8qIG1lcyAqLworCWJvb2wgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW5hYmxl
X21lczsKKwlzdHJ1Y3QgYW1kZ3B1X21lcyAgICAgICAgICAgICAgIG1lczsKKwogCXN0cnVjdCBh
bWRncHVfaXBfYmxvY2sgICAgICAgICAgaXBfYmxvY2tzW0FNREdQVV9NQVhfSVBfTlVNXTsKIAlp
bnQJCQkJbnVtX2lwX2Jsb2NrczsKIAlzdHJ1Y3QgbXV0ZXgJbW5fbG9jazsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwMDAuLjYyMWVmOGE3ZjA3NAotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaApAQCAtMCwwICsxLDMxIEBACisvKgorICogQ29weXJp
Z2h0IDIwMTkgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgorICoKKyAqIFBlcm1pc3Npb24g
aXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmlu
ZyBhCisgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlv
biBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAorICogdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0
aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbgorICogdGhlIHJp
Z2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1
YmxpY2Vuc2UsCisgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8g
cGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKKyAqIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBk
byBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisgKgorICogVGhlIGFi
b3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUg
aW5jbHVkZWQgaW4KKyAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhl
IFNvZnR3YXJlLgorICoKKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRI
T1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisgKiBJTVBMSUVELCBJTkNMVURJ
TkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwK
KyAqIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQu
ICBJTiBOTyBFVkVOVCBTSEFMTAorICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9S
KFMpIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SCisgKiBPVEhFUiBMSUFCSUxJ
VFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwK
KyAqIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdB
UkUgT1IgVEhFIFVTRSBPUgorICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorICoK
KyAqLworCisjaWZuZGVmIF9fQU1ER1BVX01FU19IX18KKyNkZWZpbmUgX19BTURHUFVfTUVTX0hf
XworCitzdHJ1Y3QgYW1kZ3B1X21lcyB7CisKK307CisKKyNlbmRpZiAvKiBfX0FNREdQVV9NRVNf
SF9fICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
