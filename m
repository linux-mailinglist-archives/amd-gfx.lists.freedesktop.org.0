Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4C48DFD
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0849892B0;
	Mon, 17 Jun 2019 19:18:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82BB894A7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:03 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id c11so6916239qkk.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUUq2N2DkEe2Vf1NQsuc4PbwPi2xs/p2zBySmZhVlT4=;
 b=h7/Drshq/fAS6lfNZhN2uPXlF49swJrsUlo4NXedoyVhjf+8kqYNsoiZpKFnvnvXFz
 7dSeWp5LHoYgWuV/vVq39KfF9oxPg5Vjzi7yL6Nz5dQ4wAN0iMuPjQPhmOEWqM8f5fSI
 0E/o4xmG9/7GYW7C8KzVYnySB8uRdcg2pavAjrp0tIH+KERwIzoQLSP70mGtVX0qYh20
 ifZvR8UTU2xbTCNizcCGGtmdatlRokC4Ma4tjdUWdpFcFjD68lykZGefA+Qbx489+TDT
 r5oQ1IeTAq92gtOA2e6a/YysBYkuvMjcYrqzCLA6sOADhgDxgU2kQKVLZg2oK81/1ilp
 LW3w==
X-Gm-Message-State: APjAAAWy6I+1fKXG9RTy/xG84LBV469G+lmzhsJ2aaUgmGblCTn008yw
 EdRzSzyxa1cb1yPFAtZ/j/CYAgv+yFc=
X-Google-Smtp-Source: APXvYqxUkMiTfo8flHKkqpGnFfPTcCk4R1SXnDVbzIGKR7Hq4F97G0Q7Wd+LgOGcFi+hTAG0AVoDow==
X-Received: by 2002:a05:620a:12ef:: with SMTP id
 f15mr46469027qkl.340.1560799082620; 
 Mon, 17 Jun 2019 12:18:02 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:02 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 061/459] drm/amdgpu: add navi10 ih ip block (v3)
Date: Mon, 17 Jun 2019 14:10:22 -0500
Message-Id: <20190617191700.17899-50-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lUUq2N2DkEe2Vf1NQsuc4PbwPi2xs/p2zBySmZhVlT4=;
 b=C6SEUNBScxFHM8A10UFwzn6uO+8N+MzXnAasJCEb25eouqfBt6resArC5aqeDIPNc2
 9SzwrYiSsd8v/wWKsTPRYUow29uKu/zcmqcZUzU+g7oNboI5lbfu1FEJygTQxXE7VfmX
 a60hqCHu7Z6OZtqhkulm3cdGc9BI+f4Js9gjmvaYSMEu8XSFTxICQ1krvkpD/Qgd2LYJ
 DjXgD/bdvI1NUhXQ1ZuWbIn769F9hFDL39GOXfzI1xQUZfJ22HIKLszvjSz5ykeaVwW8
 rCbRXjb8st6jwD4LAatfBk9con5M4aAMdnCi+WrmGVBFR1z7kM31IdDdS+FpemYkb1HD
 YsRw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKSUggaXMgdGhlIGlu
dGVycnVwdCBoYW5kbGVyIGJsb2NrLgoKdjE6IGFkZCBpbml0aWFsIGloIHN1cHBvcnQgKFJheSkK
djI6IGFkZCBkdW1teSBwcmVzY3JlZW4gaXYgZnVuY3Rpb24gZm9yIG5hdmkxMCAoSGF3a2luZykK
djM6IHNxdWFzaCBpbiBhZGRpdGlvbmFsIHVwZGF0ZXMgKEFsZXgpCgpTaWduZWQtb2ZmLWJ5OiBI
dWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZSAg
ICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX2loLmMgfCA0ODYg
KysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2
aTEwX2loLmggfCAgMjkgKysKIDMgZmlsZXMgY2hhbmdlZCwgNTE3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9uYXZpMTBfaWguYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L25hdmkxMF9paC5oCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
TWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZQppbmRleCA3Mjc2
ODJiNDUzZTguLmU0YWQzZmZiNzQ2YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUK
QEAgLTg1LDcgKzg1LDggQEAgYW1kZ3B1LXkgKz0gXAogCWljZWxhbmRfaWgubyBcCiAJdG9uZ2Ff
aWgubyBcCiAJY3pfaWgubyBcCi0JdmVnYTEwX2loLm8KKwl2ZWdhMTBfaWgubyBcCisJbmF2aTEw
X2loLm8KIAogIyBhZGQgUFNQIGJsb2NrCiBhbWRncHUteSArPSBcCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZpMTBfaWguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L25hdmkxMF9paC5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAw
MC4uZTk2Mzc0NmJlMTFjCi0tLSAvZGV2L251bGwKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbmF2aTEwX2loLmMKQEAgLTAsMCArMSw0ODYgQEAKKy8qCisgKiBDb3B5cmlnaHQgMjAx
OSBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCisgKgorICogUGVybWlzc2lvbiBpcyBoZXJl
YnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKKyAq
IGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVz
ICh0aGUgIlNvZnR3YXJlIiksCisgKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJl
c3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uCisgKiB0aGUgcmlnaHRzIHRv
IHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5z
ZSwKKyAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQg
cGVyc29ucyB0byB3aG9tIHRoZQorICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBz
dWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyAqCisgKiBUaGUgYWJvdmUgY29w
eXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRl
ZCBpbgorICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdh
cmUuCisgKgorICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FS
UkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyAqIElNUExJRUQsIElOQ0xVRElORyBCVVQg
Tk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAorICogRklU
TkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5P
IEVWRU5UIFNIQUxMCisgKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBPUiBBVVRIT1IoUykgQkUg
TElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IKKyAqIE9USEVSIExJQUJJTElUWSwgV0hF
VEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLAorICogQVJJ
U0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBU
SEUgVVNFIE9SCisgKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCisgKgorICovCisK
KyNpbmNsdWRlIDxkcm0vZHJtUC5oPgorI2luY2x1ZGUgImFtZGdwdS5oIgorI2luY2x1ZGUgImFt
ZGdwdV9paC5oIgorCisjaW5jbHVkZSAib3NzL29zc3N5c181XzBfMF9vZmZzZXQuaCIKKyNpbmNs
dWRlICJvc3Mvb3Nzc3lzXzVfMF8wX3NoX21hc2suaCIKKworI2luY2x1ZGUgInNvYzE1X2NvbW1v
bi5oIgorI2luY2x1ZGUgIm5hdmkxMF9paC5oIgorCisKK3N0YXRpYyB2b2lkIG5hdmkxMF9paF9z
ZXRfaW50ZXJydXB0X2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKKworLyoqCisg
KiBuYXZpMTBfaWhfZW5hYmxlX2ludGVycnVwdHMgLSBFbmFibGUgdGhlIGludGVycnVwdCByaW5n
IGJ1ZmZlcgorICoKKyAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqCisgKiBFbmFi
bGUgdGhlIGludGVycnVwdCByaW5nIGJ1ZmZlciAoTkFWSTEwKS4KKyAqLworc3RhdGljIHZvaWQg
bmF2aTEwX2loX2VuYWJsZV9pbnRlcnJ1cHRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQor
eworCXUzMiBpaF9yYl9jbnRsID0gUlJFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9SQl9DTlRM
KTsKKworCWloX3JiX2NudGwgPSBSRUdfU0VUX0ZJRUxEKGloX3JiX2NudGwsIElIX1JCX0NOVEws
IFJCX0VOQUJMRSwgMSk7CisJaWhfcmJfY250bCA9IFJFR19TRVRfRklFTEQoaWhfcmJfY250bCwg
SUhfUkJfQ05UTCwgRU5BQkxFX0lOVFIsIDEpOworCVdSRUczMl9TT0MxNShPU1NTWVMsIDAsIG1t
SUhfUkJfQ05UTCwgaWhfcmJfY250bCk7CisJYWRldi0+aXJxLmloLmVuYWJsZWQgPSB0cnVlOwor
fQorCisvKioKKyAqIG5hdmkxMF9paF9kaXNhYmxlX2ludGVycnVwdHMgLSBEaXNhYmxlIHRoZSBp
bnRlcnJ1cHQgcmluZyBidWZmZXIKKyAqCisgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVy
CisgKgorICogRGlzYWJsZSB0aGUgaW50ZXJydXB0IHJpbmcgYnVmZmVyIChOQVZJMTApLgorICov
CitzdGF0aWMgdm9pZCBuYXZpMTBfaWhfZGlzYWJsZV9pbnRlcnJ1cHRzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQoreworCXUzMiBpaF9yYl9jbnRsID0gUlJFRzMyX1NPQzE1KE9TU1NZUywg
MCwgbW1JSF9SQl9DTlRMKTsKKworCWloX3JiX2NudGwgPSBSRUdfU0VUX0ZJRUxEKGloX3JiX2Nu
dGwsIElIX1JCX0NOVEwsIFJCX0VOQUJMRSwgMCk7CisJaWhfcmJfY250bCA9IFJFR19TRVRfRklF
TEQoaWhfcmJfY250bCwgSUhfUkJfQ05UTCwgRU5BQkxFX0lOVFIsIDApOworCVdSRUczMl9TT0Mx
NShPU1NTWVMsIDAsIG1tSUhfUkJfQ05UTCwgaWhfcmJfY250bCk7CisJLyogc2V0IHJwdHIsIHdw
dHIgdG8gMCAqLworCVdSRUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfUlBUUiwgMCk7CisJ
V1JFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9SQl9XUFRSLCAwKTsKKwlhZGV2LT5pcnEuaWgu
ZW5hYmxlZCA9IGZhbHNlOworCWFkZXYtPmlycS5paC5ycHRyID0gMDsKK30KKworc3RhdGljIHVp
bnQzMl90IG5hdmkxMF9paF9yYl9jbnRsKHN0cnVjdCBhbWRncHVfaWhfcmluZyAqaWgsIHVpbnQz
Ml90IGloX3JiX2NudGwpCit7CisJaW50IHJiX2J1ZnN6ID0gb3JkZXJfYmFzZV8yKGloLT5yaW5n
X3NpemUgLyA0KTsKKworCWloX3JiX2NudGwgPSBSRUdfU0VUX0ZJRUxEKGloX3JiX2NudGwsIElI
X1JCX0NOVEwsCisJCQkJICAgTUNfU1BBQ0UsIGloLT51c2VfYnVzX2FkZHIgPyAxIDogNCk7CisJ
aWhfcmJfY250bCA9IFJFR19TRVRfRklFTEQoaWhfcmJfY250bCwgSUhfUkJfQ05UTCwKKwkJCQkg
ICBXUFRSX09WRVJGTE9XX0NMRUFSLCAxKTsKKwlpaF9yYl9jbnRsID0gUkVHX1NFVF9GSUVMRChp
aF9yYl9jbnRsLCBJSF9SQl9DTlRMLAorCQkJCSAgIFdQVFJfT1ZFUkZMT1dfRU5BQkxFLCAxKTsK
KwlpaF9yYl9jbnRsID0gUkVHX1NFVF9GSUVMRChpaF9yYl9jbnRsLCBJSF9SQl9DTlRMLCBSQl9T
SVpFLCByYl9idWZzeik7CisJLyogUmluZyBCdWZmZXIgd3JpdGUgcG9pbnRlciB3cml0ZWJhY2su
IElmIGVuYWJsZWQsIElIX1JCX1dQVFIgcmVnaXN0ZXIKKwkgKiB2YWx1ZSBpcyB3cml0dGVuIHRv
IG1lbW9yeQorCSAqLworCWloX3JiX2NudGwgPSBSRUdfU0VUX0ZJRUxEKGloX3JiX2NudGwsIElI
X1JCX0NOVEwsCisJCQkJICAgV1BUUl9XUklURUJBQ0tfRU5BQkxFLCAxKTsKKwlpaF9yYl9jbnRs
ID0gUkVHX1NFVF9GSUVMRChpaF9yYl9jbnRsLCBJSF9SQl9DTlRMLCBNQ19TTk9PUCwgMSk7CisJ
aWhfcmJfY250bCA9IFJFR19TRVRfRklFTEQoaWhfcmJfY250bCwgSUhfUkJfQ05UTCwgTUNfUk8s
IDApOworCWloX3JiX2NudGwgPSBSRUdfU0VUX0ZJRUxEKGloX3JiX2NudGwsIElIX1JCX0NOVEws
IE1DX1ZNSUQsIDApOworCisJcmV0dXJuIGloX3JiX2NudGw7Cit9CisKKy8qKgorICogbmF2aTEw
X2loX2lycV9pbml0IC0gaW5pdCBhbmQgZW5hYmxlIHRoZSBpbnRlcnJ1cHQgcmluZworICoKKyAq
IEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqCisgKiBBbGxvY2F0ZSBhIHJpbmcgYnVm
ZmVyIGZvciB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIsCisgKiBlbmFibGUgdGhlIFJMQywgZGlz
YWJsZSBpbnRlcnJ1cHRzLCBlbmFibGUgdGhlIElICisgKiByaW5nIGJ1ZmZlciBhbmQgZW5hYmxl
IGl0IChOQVZJKS4KKyAqIENhbGxlZCBhdCBkZXZpY2UgbG9hZCBhbmQgcmV1bWUuCisgKiBSZXR1
cm5zIDAgZm9yIHN1Y2Nlc3MsIGVycm9ycyBmb3IgZmFpbHVyZS4KKyAqLworc3RhdGljIGludCBu
YXZpMTBfaWhfaXJxX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJc3RydWN0
IGFtZGdwdV9paF9yaW5nICppaCA9ICZhZGV2LT5pcnEuaWg7CisJaW50IHJldCA9IDA7CisJdTMy
IGloX3JiX2NudGwsIGloX2Rvb3JiZWxsX3J0cHIsIGloX2NoaWNrZW47CisJdTMyIHRtcDsKKwor
CS8qIGRpc2FibGUgaXJxcyAqLworCW5hdmkxMF9paF9kaXNhYmxlX2ludGVycnVwdHMoYWRldik7
CisKKwlhZGV2LT5uYmlvX2Z1bmNzLT5paF9jb250cm9sKGFkZXYpOworCisJLyogUmluZyBCdWZm
ZXIgYmFzZS4gWzM5OjhdIG9mIDQwLWJpdCBhZGRyZXNzIG9mIHRoZSBiZWdpbm5pbmcgb2YgdGhl
IHJpbmcgYnVmZmVyKi8KKwlXUkVHMzJfU09DMTUoT1NTU1lTLCAwLCBtbUlIX1JCX0JBU0UsIGlo
LT5ncHVfYWRkciA+PiA4KTsKKwlXUkVHMzJfU09DMTUoT1NTU1lTLCAwLCBtbUlIX1JCX0JBU0Vf
SEksIChpaC0+Z3B1X2FkZHIgPj4gNDApICYgMHhmZik7CisKKwlpaF9yYl9jbnRsID0gUlJFRzMy
X1NPQzE1KE9TU1NZUywgMCwgbW1JSF9SQl9DTlRMKTsKKwlpaF9yYl9jbnRsID0gbmF2aTEwX2lo
X3JiX2NudGwoaWgsIGloX3JiX2NudGwpOworCWloX3JiX2NudGwgPSBSRUdfU0VUX0ZJRUxEKGlo
X3JiX2NudGwsIElIX1JCX0NOVEwsIFJQVFJfUkVBUk0sCisJCQkJICAgISFhZGV2LT5pcnEubXNp
X2VuYWJsZWQpOworCisJaWYgKHVubGlrZWx5KGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBB
TURHUFVfRldfTE9BRF9ESVJFQ1QpKSB7CisJCWlmIChpaC0+dXNlX2J1c19hZGRyKSB7CisJCQlp
aF9jaGlja2VuID0gUlJFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9DSElDS0VOKTsKKwkJCWlo
X2NoaWNrZW4gPSBSRUdfU0VUX0ZJRUxEKGloX2NoaWNrZW4sCisJCQkJCUlIX0NISUNLRU4sIE1D
X1NQQUNFX0dQQV9FTkFCTEUsIDEpOworCQkJV1JFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9D
SElDS0VOLCBpaF9jaGlja2VuKTsKKwkJfQorCX0KKworCVdSRUczMl9TT0MxNShPU1NTWVMsIDAs
IG1tSUhfUkJfQ05UTCwgaWhfcmJfY250bCk7CisKKwkvKiBzZXQgdGhlIHdyaXRlYmFjayBhZGRy
ZXNzIHdoZXRoZXIgaXQncyBlbmFibGVkIG9yIG5vdCAqLworCVdSRUczMl9TT0MxNShPU1NTWVMs
IDAsIG1tSUhfUkJfV1BUUl9BRERSX0xPLAorCQkgICAgIGxvd2VyXzMyX2JpdHMoaWgtPndwdHJf
YWRkcikpOworCVdSRUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfV1BUUl9BRERSX0hJLAor
CQkgICAgIHVwcGVyXzMyX2JpdHMoaWgtPndwdHJfYWRkcikgJiAweEZGRkYpOworCisJLyogc2V0
IHJwdHIsIHdwdHIgdG8gMCAqLworCVdSRUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfUlBU
UiwgMCk7CisJV1JFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9SQl9XUFRSLCAwKTsKKworCWlo
X2Rvb3JiZWxsX3J0cHIgPSBSUkVHMzJfU09DMTUoT1NTU1lTLCAwLCBtbUlIX0RPT1JCRUxMX1JQ
VFIpOworCWlmIChpaC0+dXNlX2Rvb3JiZWxsKSB7CisJCWloX2Rvb3JiZWxsX3J0cHIgPSBSRUdf
U0VUX0ZJRUxEKGloX2Rvb3JiZWxsX3J0cHIsCisJCQkJCQkgSUhfRE9PUkJFTExfUlBUUiwgT0ZG
U0VULAorCQkJCQkJIGloLT5kb29yYmVsbF9pbmRleCk7CisJCWloX2Rvb3JiZWxsX3J0cHIgPSBS
RUdfU0VUX0ZJRUxEKGloX2Rvb3JiZWxsX3J0cHIsCisJCQkJCQkgSUhfRE9PUkJFTExfUlBUUiwg
RU5BQkxFLCAxKTsKKwl9IGVsc2UgeworCQlpaF9kb29yYmVsbF9ydHByID0gUkVHX1NFVF9GSUVM
RChpaF9kb29yYmVsbF9ydHByLAorCQkJCQkJIElIX0RPT1JCRUxMX1JQVFIsIEVOQUJMRSwgMCk7
CisJfQorCVdSRUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfRE9PUkJFTExfUlBUUiwgaWhfZG9v
cmJlbGxfcnRwcik7CisKKwlhZGV2LT5uYmlvX2Z1bmNzLT5paF9kb29yYmVsbF9yYW5nZShhZGV2
LCBpaC0+dXNlX2Rvb3JiZWxsLAorCQkJCQkgICAgaWgtPmRvb3JiZWxsX2luZGV4KTsKKworCXRt
cCA9IFJSRUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfU1RPUk1fQ0xJRU5UX0xJU1RfQ05UTCk7
CisJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIElIX1NUT1JNX0NMSUVOVF9MSVNUX0NOVEwsCisJ
CQkgICAgQ0xJRU5UMThfSVNfU1RPUk1fQ0xJRU5ULCAxKTsKKwlXUkVHMzJfU09DMTUoT1NTU1lT
LCAwLCBtbUlIX1NUT1JNX0NMSUVOVF9MSVNUX0NOVEwsIHRtcCk7CisKKwl0bXAgPSBSUkVHMzJf
U09DMTUoT1NTU1lTLCAwLCBtbUlIX0lOVF9GTE9PRF9DTlRMKTsKKwl0bXAgPSBSRUdfU0VUX0ZJ
RUxEKHRtcCwgSUhfSU5UX0ZMT09EX0NOVEwsIEZMT09EX0NOVExfRU5BQkxFLCAxKTsKKwlXUkVH
MzJfU09DMTUoT1NTU1lTLCAwLCBtbUlIX0lOVF9GTE9PRF9DTlRMLCB0bXApOworCisJcGNpX3Nl
dF9tYXN0ZXIoYWRldi0+cGRldik7CisKKwkvKiBlbmFibGUgaW50ZXJydXB0cyAqLworCW5hdmkx
MF9paF9lbmFibGVfaW50ZXJydXB0cyhhZGV2KTsKKworCXJldHVybiByZXQ7Cit9CisKKy8qKgor
ICogbmF2aTEwX2loX2lycV9kaXNhYmxlIC0gZGlzYWJsZSBpbnRlcnJ1cHRzCisgKgorICogQGFk
ZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgorICoKKyAqIERpc2FibGUgaW50ZXJydXB0cyBvbiB0
aGUgaHcgKE5BVkkxMCkuCisgKi8KK3N0YXRpYyB2b2lkIG5hdmkxMF9paF9pcnFfZGlzYWJsZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwluYXZpMTBfaWhfZGlzYWJsZV9pbnRlcnJ1
cHRzKGFkZXYpOworCisJLyogV2FpdCBhbmQgYWNrbm93bGVkZ2UgaXJxICovCisJbWRlbGF5KDEp
OworfQorCisvKioKKyAqIG5hdmkxMF9paF9nZXRfd3B0ciAtIGdldCB0aGUgSUggcmluZyBidWZm
ZXIgd3B0cgorICoKKyAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKKyAqCisgKiBHZXQg
dGhlIElIIHJpbmcgYnVmZmVyIHdwdHIgZnJvbSBlaXRoZXIgdGhlIHJlZ2lzdGVyCisgKiBvciB0
aGUgd3JpdGViYWNrIG1lbW9yeSBidWZmZXIgKE5BVkkxMCkuICBBbHNvIGNoZWNrIGZvcgorICog
cmluZyBidWZmZXIgb3ZlcmZsb3cgYW5kIGRlYWwgd2l0aCBpdC4KKyAqIFJldHVybnMgdGhlIHZh
bHVlIG9mIHRoZSB3cHRyLgorICovCitzdGF0aWMgdTMyIG5hdmkxMF9paF9nZXRfd3B0cihzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwkJCSAgICAgIHN0cnVjdCBhbWRncHVfaWhfcmluZyAq
aWgpCit7CisJdTMyIHdwdHIsIHJlZywgdG1wOworCisJd3B0ciA9IGxlMzJfdG9fY3B1KCppaC0+
d3B0cl9jcHUpOworCisJaWYgKCFSRUdfR0VUX0ZJRUxEKHdwdHIsIElIX1JCX1dQVFIsIFJCX09W
RVJGTE9XKSkKKwkJZ290byBvdXQ7CisKKwlyZWcgPSBTT0MxNV9SRUdfT0ZGU0VUKE9TU1NZUywg
MCwgbW1JSF9SQl9XUFRSKTsKKwl3cHRyID0gUlJFRzMyX05PX0tJUShyZWcpOworCWlmICghUkVH
X0dFVF9GSUVMRCh3cHRyLCBJSF9SQl9XUFRSLCBSQl9PVkVSRkxPVykpCisJCWdvdG8gb3V0Owor
CXdwdHIgPSBSRUdfU0VUX0ZJRUxEKHdwdHIsIElIX1JCX1dQVFIsIFJCX09WRVJGTE9XLCAwKTsK
KworCS8qIFdoZW4gYSByaW5nIGJ1ZmZlciBvdmVyZmxvdyBoYXBwZW4gc3RhcnQgcGFyc2luZyBp
bnRlcnJ1cHQKKwkgKiBmcm9tIHRoZSBsYXN0IG5vdCBvdmVyd3JpdHRlbiB2ZWN0b3IgKHdwdHIg
KyAzMikuIEhvcGVmdWxseQorCSAqIHRoaXMgc2hvdWxkIGFsbG93IHVzIHRvIGNhdGNoIHVwLgor
CSAqLworCXRtcCA9ICh3cHRyICsgMzIpICYgaWgtPnB0cl9tYXNrOworCWRldl93YXJuKGFkZXYt
PmRldiwgIklIIHJpbmcgYnVmZmVyIG92ZXJmbG93ICIKKwkJICIoMHglMDhYLCAweCUwOFgsIDB4
JTA4WClcbiIsCisJCSB3cHRyLCBpaC0+cnB0ciwgdG1wKTsKKwlpaC0+cnB0ciA9IHRtcDsKKwor
CXJlZyA9IFNPQzE1X1JFR19PRkZTRVQoT1NTU1lTLCAwLCBtbUlIX1JCX0NOVEwpOworCXRtcCA9
IFJSRUczMl9OT19LSVEocmVnKTsKKwl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgSUhfUkJfQ05U
TCwgV1BUUl9PVkVSRkxPV19DTEVBUiwgMSk7CisJV1JFRzMyX05PX0tJUShyZWcsIHRtcCk7Citv
dXQ6CisJcmV0dXJuICh3cHRyICYgaWgtPnB0cl9tYXNrKTsKK30KKworLyoqCisgKiBuYXZpMTBf
aWhfZGVjb2RlX2l2IC0gZGVjb2RlIGFuIGludGVycnVwdCB2ZWN0b3IKKyAqCisgKiBAYWRldjog
YW1kZ3B1X2RldmljZSBwb2ludGVyCisgKgorICogRGVjb2RlcyB0aGUgaW50ZXJydXB0IHZlY3Rv
ciBhdCB0aGUgY3VycmVudCBycHRyCisgKiBwb3NpdGlvbiBhbmQgYWxzbyBhZHZhbmNlIHRoZSBw
b3NpdGlvbi4KKyAqLworc3RhdGljIHZvaWQgbmF2aTEwX2loX2RlY29kZV9pdihzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKKwkJCQlzdHJ1Y3QgYW1kZ3B1X2loX3JpbmcgKmloLAorCQkJCXN0
cnVjdCBhbWRncHVfaXZfZW50cnkgKmVudHJ5KQoreworCS8qIHdwdHIvcnB0ciBhcmUgaW4gYnl0
ZXMhICovCisJdTMyIHJpbmdfaW5kZXggPSBpaC0+cnB0ciA+PiAyOworCXVpbnQzMl90IGR3Wzhd
OworCisJZHdbMF0gPSBsZTMyX3RvX2NwdShpaC0+cmluZ1tyaW5nX2luZGV4ICsgMF0pOworCWR3
WzFdID0gbGUzMl90b19jcHUoaWgtPnJpbmdbcmluZ19pbmRleCArIDFdKTsKKwlkd1syXSA9IGxl
MzJfdG9fY3B1KGloLT5yaW5nW3JpbmdfaW5kZXggKyAyXSk7CisJZHdbM10gPSBsZTMyX3RvX2Nw
dShpaC0+cmluZ1tyaW5nX2luZGV4ICsgM10pOworCWR3WzRdID0gbGUzMl90b19jcHUoaWgtPnJp
bmdbcmluZ19pbmRleCArIDRdKTsKKwlkd1s1XSA9IGxlMzJfdG9fY3B1KGloLT5yaW5nW3Jpbmdf
aW5kZXggKyA1XSk7CisJZHdbNl0gPSBsZTMyX3RvX2NwdShpaC0+cmluZ1tyaW5nX2luZGV4ICsg
Nl0pOworCWR3WzddID0gbGUzMl90b19jcHUoaWgtPnJpbmdbcmluZ19pbmRleCArIDddKTsKKwor
CWVudHJ5LT5jbGllbnRfaWQgPSBkd1swXSAmIDB4ZmY7CisJZW50cnktPnNyY19pZCA9IChkd1sw
XSA+PiA4KSAmIDB4ZmY7CisJZW50cnktPnJpbmdfaWQgPSAoZHdbMF0gPj4gMTYpICYgMHhmZjsK
KwllbnRyeS0+dm1pZCA9IChkd1swXSA+PiAyNCkgJiAweGY7CisJZW50cnktPnZtaWRfc3JjID0g
KGR3WzBdID4+IDMxKTsKKwllbnRyeS0+dGltZXN0YW1wID0gZHdbMV0gfCAoKHU2NCkoZHdbMl0g
JiAweGZmZmYpIDw8IDMyKTsKKwllbnRyeS0+dGltZXN0YW1wX3NyYyA9IGR3WzJdID4+IDMxOwor
CWVudHJ5LT5wYXNpZCA9IGR3WzNdICYgMHhmZmZmOworCWVudHJ5LT5wYXNpZF9zcmMgPSBkd1sz
XSA+PiAzMTsKKwllbnRyeS0+c3JjX2RhdGFbMF0gPSBkd1s0XTsKKwllbnRyeS0+c3JjX2RhdGFb
MV0gPSBkd1s1XTsKKwllbnRyeS0+c3JjX2RhdGFbMl0gPSBkd1s2XTsKKwllbnRyeS0+c3JjX2Rh
dGFbM10gPSBkd1s3XTsKKworCS8qIHdwdHIvcnB0ciBhcmUgaW4gYnl0ZXMhICovCisJaWgtPnJw
dHIgKz0gMzI7Cit9CisKKy8qKgorICogbmF2aTEwX2loX3NldF9ycHRyIC0gc2V0IHRoZSBJSCBy
aW5nIGJ1ZmZlciBycHRyCisgKgorICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgorICoK
KyAqIFNldCB0aGUgSUggcmluZyBidWZmZXIgcnB0ci4KKyAqLworc3RhdGljIHZvaWQgbmF2aTEw
X2loX3NldF9ycHRyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJICAgICAgIHN0cnVj
dCBhbWRncHVfaWhfcmluZyAqaWgpCit7CisJaWYgKGloLT51c2VfZG9vcmJlbGwpIHsKKwkJLyog
WFhYIGNoZWNrIGlmIHN3YXBwaW5nIGlzIG5lY2Vzc2FyeSBvbiBCRSAqLworCQkqaWgtPnJwdHJf
Y3B1ID0gaWgtPnJwdHI7CisJCVdET09SQkVMTDMyKGloLT5kb29yYmVsbF9pbmRleCwgaWgtPnJw
dHIpOworCX0gZWxzZQorCQlXUkVHMzJfU09DMTUoT1NTU1lTLCAwLCBtbUlIX1JCX1JQVFIsIGlo
LT5ycHRyKTsKK30KKworc3RhdGljIGludCBuYXZpMTBfaWhfZWFybHlfaW5pdCh2b2lkICpoYW5k
bGUpCit7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKiloYW5kbGU7CisKKwluYXZpMTBfaWhfc2V0X2ludGVycnVwdF9mdW5jcyhhZGV2KTsKKwly
ZXR1cm4gMDsKK30KKworc3RhdGljIGludCBuYXZpMTBfaWhfc3dfaW5pdCh2b2lkICpoYW5kbGUp
Cit7CisJaW50IHI7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKiloYW5kbGU7CisJYm9vbCB1c2VfYnVzX2FkZHI7CisKKwkvKiB1c2UgZ3B1IHZp
cnR1YWwgYWRkcmVzcyBmb3IgaWggcmluZworCSAqIHVudGlsIGloX2NoZWNrZW4gaXMgcHJvZ3Jh
bW1lZCB0byBhbGxvdworCSAqIHVzZSBidXMgYWRkcmVzcyBmb3IgaWggcmluZyBieSBwc3AgYmwg
Ki8KKwl1c2VfYnVzX2FkZHIgPQorCQkoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQ
VV9GV19MT0FEX1BTUCkgPyBmYWxzZSA6IHRydWU7CisJciA9IGFtZGdwdV9paF9yaW5nX2luaXQo
YWRldiwgJmFkZXYtPmlycS5paCwgMjU2ICogMTAyNCwgdXNlX2J1c19hZGRyKTsKKwlpZiAocikK
KwkJcmV0dXJuIHI7CisKKwlhZGV2LT5pcnEuaWgudXNlX2Rvb3JiZWxsID0gdHJ1ZTsKKwlhZGV2
LT5pcnEuaWguZG9vcmJlbGxfaW5kZXggPSBhZGV2LT5kb29yYmVsbF9pbmRleC5paCA8PCAxOwor
CisJciA9IGFtZGdwdV9pcnFfaW5pdChhZGV2KTsKKworCXJldHVybiByOworfQorCitzdGF0aWMg
aW50IG5hdmkxMF9paF9zd19maW5pKHZvaWQgKmhhbmRsZSkKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKKworCWFtZGdwdV9p
cnFfZmluaShhZGV2KTsKKwlhbWRncHVfaWhfcmluZ19maW5pKGFkZXYsICZhZGV2LT5pcnEuaWgp
OworCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgbmF2aTEwX2loX2h3X2luaXQodm9pZCAq
aGFuZGxlKQoreworCWludCByOworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVj
dCBhbWRncHVfZGV2aWNlICopaGFuZGxlOworCisJciA9IG5hdmkxMF9paF9pcnFfaW5pdChhZGV2
KTsKKwlpZiAocikKKwkJcmV0dXJuIHI7CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGludCBu
YXZpMTBfaWhfaHdfZmluaSh2b2lkICpoYW5kbGUpCit7CisJc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CisKKwluYXZpMTBfaWhfaXJx
X2Rpc2FibGUoYWRldik7CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGludCBuYXZpMTBfaWhf
c3VzcGVuZCh2b2lkICpoYW5kbGUpCit7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CisKKwlyZXR1cm4gbmF2aTEwX2loX2h3X2Zp
bmkoYWRldik7Cit9CisKK3N0YXRpYyBpbnQgbmF2aTEwX2loX3Jlc3VtZSh2b2lkICpoYW5kbGUp
Cit7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KiloYW5kbGU7CisKKwlyZXR1cm4gbmF2aTEwX2loX2h3X2luaXQoYWRldik7Cit9CisKK3N0YXRp
YyBib29sIG5hdmkxMF9paF9pc19pZGxlKHZvaWQgKmhhbmRsZSkKK3sKKwkvKiB0b2RvICovCisJ
cmV0dXJuIHRydWU7Cit9CisKK3N0YXRpYyBpbnQgbmF2aTEwX2loX3dhaXRfZm9yX2lkbGUodm9p
ZCAqaGFuZGxlKQoreworCS8qIHRvZG8gKi8KKwlyZXR1cm4gLUVUSU1FRE9VVDsKK30KKworc3Rh
dGljIGludCBuYXZpMTBfaWhfc29mdF9yZXNldCh2b2lkICpoYW5kbGUpCit7CisJLyogdG9kbyAq
LworCXJldHVybiAwOworfQorCitzdGF0aWMgdm9pZCBuYXZpMTBfaWhfdXBkYXRlX2Nsb2NrZ2F0
aW5nX3N0YXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJCQkgICAgICAgYm9vbCBl
bmFibGUpCit7CisJdWludDMyX3QgZGF0YSwgZGVmLCBmaWVsZF92YWw7CisKKwlpZiAoYWRldi0+
Y2dfZmxhZ3MgJiBBTURfQ0dfU1VQUE9SVF9JSF9DRykgeworCQlkZWYgPSBkYXRhID0gUlJFRzMy
X1NPQzE1KE9TU1NZUywgMCwgbW1JSF9DTEtfQ1RSTCk7CisJCWZpZWxkX3ZhbCA9IGVuYWJsZSA/
IDAgOiAxOworCQlkYXRhID0gUkVHX1NFVF9GSUVMRChkYXRhLCBJSF9DTEtfQ1RSTCwKKwkJCQkg
ICAgIERCVVNfTVVYX0NMS19TT0ZUX09WRVJSSURFLCBmaWVsZF92YWwpOworCQlkYXRhID0gUkVH
X1NFVF9GSUVMRChkYXRhLCBJSF9DTEtfQ1RSTCwKKwkJCQkgICAgIE9TU1NZU19TSEFSRV9DTEtf
U09GVF9PVkVSUklERSwgZmllbGRfdmFsKTsKKwkJZGF0YSA9IFJFR19TRVRfRklFTEQoZGF0YSwg
SUhfQ0xLX0NUUkwsCisJCQkJICAgICBMSU1JVF9TTU5fQ0xLX1NPRlRfT1ZFUlJJREUsIGZpZWxk
X3ZhbCk7CisJCWRhdGEgPSBSRUdfU0VUX0ZJRUxEKGRhdGEsIElIX0NMS19DVFJMLAorCQkJCSAg
ICAgRFlOX0NMS19TT0ZUX09WRVJSSURFLCBmaWVsZF92YWwpOworCQlkYXRhID0gUkVHX1NFVF9G
SUVMRChkYXRhLCBJSF9DTEtfQ1RSTCwKKwkJCQkgICAgIFJFR19DTEtfU09GVF9PVkVSUklERSwg
ZmllbGRfdmFsKTsKKwkJaWYgKGRlZiAhPSBkYXRhKQorCQkJV1JFRzMyX1NPQzE1KE9TU1NZUywg
MCwgbW1JSF9DTEtfQ1RSTCwgZGF0YSk7CisJfQorCisJcmV0dXJuOworfQorCitzdGF0aWMgaW50
IG5hdmkxMF9paF9zZXRfY2xvY2tnYXRpbmdfc3RhdGUodm9pZCAqaGFuZGxlLAorCQkJCQkgICBl
bnVtIGFtZF9jbG9ja2dhdGluZ19zdGF0ZSBzdGF0ZSkKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKKworCW5hdmkxMF9paF91
cGRhdGVfY2xvY2tnYXRpbmdfc3RhdGUoYWRldiwKKwkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVf
R0FURSA/IHRydWUgOiBmYWxzZSk7CisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgbmF2aTEw
X2loX3NldF9wb3dlcmdhdGluZ19zdGF0ZSh2b2lkICpoYW5kbGUsCisJCQkJCSAgIGVudW0gYW1k
X3Bvd2VyZ2F0aW5nX3N0YXRlIHN0YXRlKQoreworCXJldHVybiAwOworfQorCitzdGF0aWMgdm9p
ZCBuYXZpMTBfaWhfZ2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKHZvaWQgKmhhbmRsZSwgdTMyICpmbGFn
cykKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqKWhhbmRsZTsKKworCWlmICghUlJFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9DTEtfQ1RS
TCkpCisJCSpmbGFncyB8PSBBTURfQ0dfU1VQUE9SVF9JSF9DRzsKKworCXJldHVybjsKK30KKwor
c3RhdGljIGNvbnN0IHN0cnVjdCBhbWRfaXBfZnVuY3MgbmF2aTEwX2loX2lwX2Z1bmNzID0gewor
CS5uYW1lID0gIm5hdmkxMF9paCIsCisJLmVhcmx5X2luaXQgPSBuYXZpMTBfaWhfZWFybHlfaW5p
dCwKKwkubGF0ZV9pbml0ID0gTlVMTCwKKwkuc3dfaW5pdCA9IG5hdmkxMF9paF9zd19pbml0LAor
CS5zd19maW5pID0gbmF2aTEwX2loX3N3X2ZpbmksCisJLmh3X2luaXQgPSBuYXZpMTBfaWhfaHdf
aW5pdCwKKwkuaHdfZmluaSA9IG5hdmkxMF9paF9od19maW5pLAorCS5zdXNwZW5kID0gbmF2aTEw
X2loX3N1c3BlbmQsCisJLnJlc3VtZSA9IG5hdmkxMF9paF9yZXN1bWUsCisJLmlzX2lkbGUgPSBu
YXZpMTBfaWhfaXNfaWRsZSwKKwkud2FpdF9mb3JfaWRsZSA9IG5hdmkxMF9paF93YWl0X2Zvcl9p
ZGxlLAorCS5zb2Z0X3Jlc2V0ID0gbmF2aTEwX2loX3NvZnRfcmVzZXQsCisJLnNldF9jbG9ja2dh
dGluZ19zdGF0ZSA9IG5hdmkxMF9paF9zZXRfY2xvY2tnYXRpbmdfc3RhdGUsCisJLnNldF9wb3dl
cmdhdGluZ19zdGF0ZSA9IG5hdmkxMF9paF9zZXRfcG93ZXJnYXRpbmdfc3RhdGUsCisJLmdldF9j
bG9ja2dhdGluZ19zdGF0ZSA9IG5hdmkxMF9paF9nZXRfY2xvY2tnYXRpbmdfc3RhdGUsCit9Owor
CitzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9paF9mdW5jcyBuYXZpMTBfaWhfZnVuY3MgPSB7
CisJLmdldF93cHRyID0gbmF2aTEwX2loX2dldF93cHRyLAorCS5kZWNvZGVfaXYgPSBuYXZpMTBf
aWhfZGVjb2RlX2l2LAorCS5zZXRfcnB0ciA9IG5hdmkxMF9paF9zZXRfcnB0cgorfTsKKworc3Rh
dGljIHZvaWQgbmF2aTEwX2loX3NldF9pbnRlcnJ1cHRfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCit7CisJaWYgKGFkZXYtPmlycS5paF9mdW5jcyA9PSBOVUxMKQorCQlhZGV2LT5p
cnEuaWhfZnVuY3MgPSAmbmF2aTEwX2loX2Z1bmNzOworfQorCitjb25zdCBzdHJ1Y3QgYW1kZ3B1
X2lwX2Jsb2NrX3ZlcnNpb24gbmF2aTEwX2loX2lwX2Jsb2NrID0KK3sKKwkudHlwZSA9IEFNRF9J
UF9CTE9DS19UWVBFX0lILAorCS5tYWpvciA9IDUsCisJLm1pbm9yID0gMCwKKwkucmV2ID0gMCwK
KwkuZnVuY3MgPSAmbmF2aTEwX2loX2lwX2Z1bmNzLAorfTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxMF9paC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbmF2aTEwX2loLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4x
NDBmYmRhYWVkMTcKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9uYXZpMTBfaWguaApAQCAtMCwwICsxLDI5IEBACisvKgorICogQ29weXJpZ2h0IDIwMTkgQWR2
YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgorICoKKyAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdy
YW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhCisgKiBjb3B5
IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhl
ICJTb2Z0d2FyZSIpLAorICogdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCByZXN0cmlj
dGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlvbgorICogdGhlIHJpZ2h0cyB0byB1c2Us
IGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsCisg
KiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNv
bnMgdG8gd2hvbSB0aGUKKyAqIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVj
dCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CisgKgorICogVGhlIGFib3ZlIGNvcHlyaWdo
dCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4K
KyAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlIFNvZnR3YXJlLgor
ICoKKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZ
IE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisgKiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBM
SU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSwKKyAqIEZJVE5FU1Mg
Rk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTyBFVkVO
VCBTSEFMTAorICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9SKFMpIEJFIExJQUJM
RSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SCisgKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIg
SU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwKKyAqIEFSSVNJTkcg
RlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVT
RSBPUgorICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgorICoKKyAqLworCisjaWZu
ZGVmIF9fTkFWSTEwX0lIX0hfXworI2RlZmluZSBfX05BVkkxMF9JSF9IX18KKworZXh0ZXJuIGNv
bnN0IHN0cnVjdCBhbWRncHVfaXBfYmxvY2tfdmVyc2lvbiBuYXZpMTBfaWhfaXBfYmxvY2s7CisK
KyNlbmRpZgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
