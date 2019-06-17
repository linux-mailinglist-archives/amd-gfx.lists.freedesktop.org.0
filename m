Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D8C48FCC
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969F289322;
	Mon, 17 Jun 2019 19:45:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C0A89322
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:45:51 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d17so7334652qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vfsBZW4ijw+3QV9BI4t4C26vCrRavSnJcgEh2oMi5M4=;
 b=UDylrisGfzdGmV4Eq3NkLT/yUAsimmJMuipzz1MhDmCloTh+6CkgIvLPQiu8ENvvkM
 VFU5MnYlYxP0VYWBTVafkk7uqOBpPwzSLJRewpTwIL6UjFWvl4iNTAfLWkUgxxTd9ulG
 KbTlJQlbQZILUJ2PjE+QcAll9FrfVizGHcszD2ETYuChuhnboZPekMI4D5hY9n9mhAVN
 z9cf3cTeHd6iEE01p3l4MgS/C5QsXIKsE/ptpKuv+5xkLsdMncC+66ysWKGh2qsrorf/
 csQS7LUCdhfXF7wradzk6lB/x25LsU+7yBYkr0cDL33/nmxsGw81q1qF+t8iQAhT6Psb
 Q/zQ==
X-Gm-Message-State: APjAAAVSaGv844DEtqSQvi3OEQsGpUM4AmZuVi0KHlZ/GdcgkT/O9tic
 FeXoZUEfHdx36RxNGwlaHekeaKxjN20=
X-Google-Smtp-Source: APXvYqwOxmTBWmjzb72yUMP1lDsHy1XYXMchjxVP4oJFAUN8AgDL+GCKW3dZj1sbTrwvBlOdSuw57w==
X-Received: by 2002:ac8:2309:: with SMTP id a9mr33275172qta.103.1560800750935; 
 Mon, 17 Jun 2019 12:45:50 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.45.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:45:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 300/459] drm/amdgpu/VCN: implement indirect DPG SRAM mode
Date: Mon, 17 Jun 2019 14:44:01 -0500
Message-Id: <20190617194540.18497-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vfsBZW4ijw+3QV9BI4t4C26vCrRavSnJcgEh2oMi5M4=;
 b=sIC5SY5QYqSdKONr9CilfxGGwn910H0Tw+jwOAcAWyUlyDGi6cXY0fNGaBl/+ojtbX
 4tgrfe0ZaFDZpx5WN8skTJRmGTNlTHixp0agMm0CPK8qmRY5Oy8hruQj9TYWG5a0tjh6
 XaByNJq4FUniefuG06OgoHNP2kaJqufQq+950o2mmsvkySwrHP2V+1pSZ5749NvF3qsE
 4FnfhbWN+O5JUsMxiHjUShJWcZHnxAQcl7HuUCUMtS5fzfeiuO+YSTPByOz6TRtflR6W
 wNsoEun0x7kUIQVneL1CxnoqI3XrBkFlOX3f7mFGmGZrWokoKVukSr2MAgXIWX8hrUq0
 QvZw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKU1JBTSB3aWxsIGJlIHByb2dyYW1tZWQg
YnkgUFNQCgpTaWduZWQtb2ZmLWJ5OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBKYW1lcyBaaHUgPEphbWVzLlpodUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Zjbi5oIHwgIDMgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3Zjbl92Ml8wLmMgICB8IDY5ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Zjbi5oCmluZGV4IDc2MmNmZmVhZjMwMS4uOTlmMTRmY2MxNDYwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oCkBAIC0xMTEsNiArMTExLDkg
QEAKIAkJCQkoMHgxIDw8IFVWRF9EUEdfTE1BX0NUTF9fUkVBRF9XUklURV9fU0hJRlQgfCAJCQlc
CiAJCQkJIG1hc2tfZW4gPDwgVVZEX0RQR19MTUFfQ1RMX19NQVNLX0VOX19TSElGVCB8IAkJCVwK
IAkJCQkgb2Zmc2V0IDw8IFVWRF9EUEdfTE1BX0NUTF9fUkVBRF9XUklURV9BRERSX19TSElGVCkp
OyAJCVwKKwkJfSBlbHNlIHsgCQkJCQkJCQkJXAorCQkJKmFkZXYtPnZjbi5kcGdfc3JhbV9jdXJy
X2FkZHIrKyA9IG9mZnNldDsgCQkJCVwKKwkJCSphZGV2LT52Y24uZHBnX3NyYW1fY3Vycl9hZGRy
KysgPSB2YWx1ZTsgCQkJCVwKIAkJfSAJCQkJCQkJCQkJXAogCX0gd2hpbGUgKDApCiAKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCmluZGV4IGJlZjIwNzA0ZTJiOS4uNzdmNGM2MzFh
ZmEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKQEAgLTI4LDYgKzI4LDcg
QEAKICNpbmNsdWRlICJzb2MxNS5oIgogI2luY2x1ZGUgInNvYzE1ZC5oIgogI2luY2x1ZGUgImFt
ZGdwdV9wbS5oIgorI2luY2x1ZGUgImFtZGdwdV9wc3AuaCIKIAogI2luY2x1ZGUgInZjbi92Y25f
Ml8wXzBfb2Zmc2V0LmgiCiAjaW5jbHVkZSAidmNuL3Zjbl8yXzBfMF9zaF9tYXNrLmgiCkBAIC00
MDcsMTQgKzQwOCwyMyBAQCBzdGF0aWMgdm9pZCB2Y25fdjJfMF9tY19yZXN1bWVfZHBnX21vZGUo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgaW5kaXJlYwogCiAJLyogY2FjaGUgd2lu
ZG93IDA6IGZ3ICovCiAJaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldf
TE9BRF9QU1ApIHsKLQkJV1JFRzMyX1NPQzE1X0RQR19NT0RFXzJfMChTT0MxNV9EUEdfTU9ERV9P
RkZTRVRfMl8wKAotCQkJVVZELCAwLCBtbVVWRF9MTUlfVkNQVV9DQUNIRV82NEJJVF9CQVJfTE9X
KSwKLQkJCShhZGV2LT5maXJtd2FyZS51Y29kZVtBTURHUFVfVUNPREVfSURfVkNOXS50bXJfbWNf
YWRkcl9sbyksIDAsIGluZGlyZWN0KTsKLQkJV1JFRzMyX1NPQzE1X0RQR19NT0RFXzJfMChTT0Mx
NV9EUEdfTU9ERV9PRkZTRVRfMl8wKAotCQkJVVZELCAwLCBtbVVWRF9MTUlfVkNQVV9DQUNIRV82
NEJJVF9CQVJfSElHSCksCi0JCQkoYWRldi0+ZmlybXdhcmUudWNvZGVbQU1ER1BVX1VDT0RFX0lE
X1ZDTl0udG1yX21jX2FkZHJfaGkpLCAwLCBpbmRpcmVjdCk7Ci0JCVdSRUczMl9TT0MxNV9EUEdf
TU9ERV8yXzAoU09DMTVfRFBHX01PREVfT0ZGU0VUXzJfMCgKLQkJCVVWRCwgMCwgbW1VVkRfVkNQ
VV9DQUNIRV9PRkZTRVQwKSwgMCwgMCwgaW5kaXJlY3QpOworCQlpZiAoIWluZGlyZWN0KSB7CisJ
CQlXUkVHMzJfU09DMTVfRFBHX01PREVfMl8wKFNPQzE1X0RQR19NT0RFX09GRlNFVF8yXzAoCisJ
CQkJVVZELCAwLCBtbVVWRF9MTUlfVkNQVV9DQUNIRV82NEJJVF9CQVJfTE9XKSwKKwkJCQkoYWRl
di0+ZmlybXdhcmUudWNvZGVbQU1ER1BVX1VDT0RFX0lEX1ZDTl0udG1yX21jX2FkZHJfbG8pLCAw
LCBpbmRpcmVjdCk7CisJCQlXUkVHMzJfU09DMTVfRFBHX01PREVfMl8wKFNPQzE1X0RQR19NT0RF
X09GRlNFVF8yXzAoCisJCQkJVVZELCAwLCBtbVVWRF9MTUlfVkNQVV9DQUNIRV82NEJJVF9CQVJf
SElHSCksCisJCQkJKGFkZXYtPmZpcm13YXJlLnVjb2RlW0FNREdQVV9VQ09ERV9JRF9WQ05dLnRt
cl9tY19hZGRyX2hpKSwgMCwgaW5kaXJlY3QpOworCQkJV1JFRzMyX1NPQzE1X0RQR19NT0RFXzJf
MChTT0MxNV9EUEdfTU9ERV9PRkZTRVRfMl8wKAorCQkJCVVWRCwgMCwgbW1VVkRfVkNQVV9DQUNI
RV9PRkZTRVQwKSwgMCwgMCwgaW5kaXJlY3QpOworCQl9IGVsc2UgeworCQkJV1JFRzMyX1NPQzE1
X0RQR19NT0RFXzJfMChTT0MxNV9EUEdfTU9ERV9PRkZTRVRfMl8wKAorCQkJCVVWRCwgMCwgbW1V
VkRfTE1JX1ZDUFVfQ0FDSEVfNjRCSVRfQkFSX0xPVyksIDAsIDAsIGluZGlyZWN0KTsKKwkJCVdS
RUczMl9TT0MxNV9EUEdfTU9ERV8yXzAoU09DMTVfRFBHX01PREVfT0ZGU0VUXzJfMCgKKwkJCQlV
VkQsIDAsIG1tVVZEX0xNSV9WQ1BVX0NBQ0hFXzY0QklUX0JBUl9ISUdIKSwgMCwgMCwgaW5kaXJl
Y3QpOworCQkJV1JFRzMyX1NPQzE1X0RQR19NT0RFXzJfMChTT0MxNV9EUEdfTU9ERV9PRkZTRVRf
Ml8wKAorCQkJCVVWRCwgMCwgbW1VVkRfVkNQVV9DQUNIRV9PRkZTRVQwKSwgMCwgMCwgaW5kaXJl
Y3QpOworCQl9CiAJCW9mZnNldCA9IDA7CiAJfSBlbHNlIHsKIAkJV1JFRzMyX1NPQzE1X0RQR19N
T0RFXzJfMChTT0MxNV9EUEdfTU9ERV9PRkZTRVRfMl8wKApAQCAtNDI5LDE4ICs0MzksMzEgQEAg
c3RhdGljIHZvaWQgdmNuX3YyXzBfbWNfcmVzdW1lX2RwZ19tb2RlKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCBib29sIGluZGlyZWMKIAkJCUFNREdQVV9VVkRfRklSTVdBUkVfT0ZGU0VUID4+
IDMsIDAsIGluZGlyZWN0KTsKIAl9CiAKLQlXUkVHMzJfU09DMTVfRFBHX01PREVfMl8wKFNPQzE1
X0RQR19NT0RFX09GRlNFVF8yXzAoCi0JCVVWRCwgMCwgbW1VVkRfVkNQVV9DQUNIRV9TSVpFMCks
IHNpemUsIDAsIGluZGlyZWN0KTsKKwlpZiAoIWluZGlyZWN0KQorCQlXUkVHMzJfU09DMTVfRFBH
X01PREVfMl8wKFNPQzE1X0RQR19NT0RFX09GRlNFVF8yXzAoCisJCQlVVkQsIDAsIG1tVVZEX1ZD
UFVfQ0FDSEVfU0laRTApLCBzaXplLCAwLCBpbmRpcmVjdCk7CisJZWxzZQorCQlXUkVHMzJfU09D
MTVfRFBHX01PREVfMl8wKFNPQzE1X0RQR19NT0RFX09GRlNFVF8yXzAoCisJCQlVVkQsIDAsIG1t
VVZEX1ZDUFVfQ0FDSEVfU0laRTApLCAwLCAwLCBpbmRpcmVjdCk7CiAKIAkvKiBjYWNoZSB3aW5k
b3cgMTogc3RhY2sgKi8KLQlXUkVHMzJfU09DMTVfRFBHX01PREVfMl8wKFNPQzE1X0RQR19NT0RF
X09GRlNFVF8yXzAoCi0JCVVWRCwgMCwgbW1VVkRfTE1JX1ZDUFVfQ0FDSEUxXzY0QklUX0JBUl9M
T1cpLAotCQlsb3dlcl8zMl9iaXRzKGFkZXYtPnZjbi5ncHVfYWRkciArIG9mZnNldCksIDAsIGlu
ZGlyZWN0KTsKLQlXUkVHMzJfU09DMTVfRFBHX01PREVfMl8wKFNPQzE1X0RQR19NT0RFX09GRlNF
VF8yXzAoCi0JCVVWRCwgMCwgbW1VVkRfTE1JX1ZDUFVfQ0FDSEUxXzY0QklUX0JBUl9ISUdIKSwK
LQkJdXBwZXJfMzJfYml0cyhhZGV2LT52Y24uZ3B1X2FkZHIgKyBvZmZzZXQpLCAwLCBpbmRpcmVj
dCk7Ci0JV1JFRzMyX1NPQzE1X0RQR19NT0RFXzJfMChTT0MxNV9EUEdfTU9ERV9PRkZTRVRfMl8w
KAotCQlVVkQsIDAsIG1tVVZEX1ZDUFVfQ0FDSEVfT0ZGU0VUMSksIDAsIDAsIGluZGlyZWN0KTsK
KwlpZiAoIWluZGlyZWN0KSB7CisJCVdSRUczMl9TT0MxNV9EUEdfTU9ERV8yXzAoU09DMTVfRFBH
X01PREVfT0ZGU0VUXzJfMCgKKwkJCVVWRCwgMCwgbW1VVkRfTE1JX1ZDUFVfQ0FDSEUxXzY0QklU
X0JBUl9MT1cpLAorCQkJbG93ZXJfMzJfYml0cyhhZGV2LT52Y24uZ3B1X2FkZHIgKyBvZmZzZXQp
LCAwLCBpbmRpcmVjdCk7CisJCVdSRUczMl9TT0MxNV9EUEdfTU9ERV8yXzAoU09DMTVfRFBHX01P
REVfT0ZGU0VUXzJfMCgKKwkJCVVWRCwgMCwgbW1VVkRfTE1JX1ZDUFVfQ0FDSEUxXzY0QklUX0JB
Ul9ISUdIKSwKKwkJCXVwcGVyXzMyX2JpdHMoYWRldi0+dmNuLmdwdV9hZGRyICsgb2Zmc2V0KSwg
MCwgaW5kaXJlY3QpOworCQlXUkVHMzJfU09DMTVfRFBHX01PREVfMl8wKFNPQzE1X0RQR19NT0RF
X09GRlNFVF8yXzAoCisJCQlVVkQsIDAsIG1tVVZEX1ZDUFVfQ0FDSEVfT0ZGU0VUMSksIDAsIDAs
IGluZGlyZWN0KTsKKwl9IGVsc2UgeworCQlXUkVHMzJfU09DMTVfRFBHX01PREVfMl8wKFNPQzE1
X0RQR19NT0RFX09GRlNFVF8yXzAoCisJCQlVVkQsIDAsIG1tVVZEX0xNSV9WQ1BVX0NBQ0hFMV82
NEJJVF9CQVJfTE9XKSwgMCwgMCwgaW5kaXJlY3QpOworCQlXUkVHMzJfU09DMTVfRFBHX01PREVf
Ml8wKFNPQzE1X0RQR19NT0RFX09GRlNFVF8yXzAoCisJCQlVVkQsIDAsIG1tVVZEX0xNSV9WQ1BV
X0NBQ0hFMV82NEJJVF9CQVJfSElHSCksIDAsIDAsIGluZGlyZWN0KTsKKwkJV1JFRzMyX1NPQzE1
X0RQR19NT0RFXzJfMChTT0MxNV9EUEdfTU9ERV9PRkZTRVRfMl8wKAorCQkJVVZELCAwLCBtbVVW
RF9WQ1BVX0NBQ0hFX09GRlNFVDEpLCAwLCAwLCBpbmRpcmVjdCk7CisJfQogCVdSRUczMl9TT0Mx
NV9EUEdfTU9ERV8yXzAoU09DMTVfRFBHX01PREVfT0ZGU0VUXzJfMCgKIAkJVVZELCAwLCBtbVVW
RF9WQ1BVX0NBQ0hFX1NJWkUxKSwgQU1ER1BVX1ZDTl9TVEFDS19TSVpFLCAwLCBpbmRpcmVjdCk7
CiAKQEAgLTkxMSw2ICs5MzQsOSBAQCBzdGF0aWMgaW50IHZjbl92Ml8wX3N0YXJ0X2RwZ19tb2Rl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBib29sIGluZGlyZWN0KQogCXRtcCB8PSBVVkRf
UE9XRVJfU1RBVFVTX19VVkRfUEdfRU5fTUFTSzsKIAlXUkVHMzJfU09DMTUoVVZELCAwLCBtbVVW
RF9QT1dFUl9TVEFUVVMsIHRtcCk7CiAKKwlpZiAoaW5kaXJlY3QpCisJCWFkZXYtPnZjbi5kcGdf
c3JhbV9jdXJyX2FkZHIgPSAodWludDMyX3QqKWFkZXYtPnZjbi5kcGdfc3JhbV9jcHVfYWRkcjsK
KwogCS8qIGVuYWJsZSBjbG9jayBnYXRpbmcgKi8KIAl2Y25fdjJfMF9jbG9ja19nYXRpbmdfZHBn
X21vZGUoYWRldiwgMCwgaW5kaXJlY3QpOwogCkBAIC05ODIsNiArMTAwOCwxMSBAQCBzdGF0aWMg
aW50IHZjbl92Ml8wX3N0YXJ0X2RwZ19tb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBi
b29sIGluZGlyZWN0KQogCQlVVkQsIDAsIG1tVVZEX01BU1RJTlRfRU4pLAogCQlVVkRfTUFTVElO
VF9FTl9fVkNQVV9FTl9NQVNLLCAwLCBpbmRpcmVjdCk7CiAKKwlpZiAoaW5kaXJlY3QpCisJCXBz
cF91cGRhdGVfdmNuX3NyYW0oYWRldiwgMCwgYWRldi0+dmNuLmRwZ19zcmFtX2dwdV9hZGRyLAor
CQkJKHVpbnQzMl90KSgodWludDY0X3QpYWRldi0+dmNuLmRwZ19zcmFtX2N1cnJfYWRkciAtCisJ
CQkodWludDY0X3QpYWRldi0+dmNuLmRwZ19zcmFtX2NwdV9hZGRyKSk7CisKIAkvKiBmb3JjZSBS
QkMgaW50byBpZGxlIHN0YXRlICovCiAJcmJfYnVmc3ogPSBvcmRlcl9iYXNlXzIocmluZy0+cmlu
Z19zaXplKTsKIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKDAsIFVWRF9SQkNfUkJfQ05UTCwgUkJfQlVG
U1osIHJiX2J1ZnN6KTsKQEAgLTEwMjcsNyArMTA1OCw3IEBAIHN0YXRpYyBpbnQgdmNuX3YyXzBf
c3RhcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWFtZGdwdV9kcG1fZW5hYmxlX3V2
ZChhZGV2LCB0cnVlKTsKIAogCWlmIChhZGV2LT5wZ19mbGFncyAmIEFNRF9QR19TVVBQT1JUX1ZD
Tl9EUEcpIHsKLQkJciA9IHZjbl92Ml8wX3N0YXJ0X2RwZ19tb2RlKGFkZXYsIDApOworCQlyID0g
dmNuX3YyXzBfc3RhcnRfZHBnX21vZGUoYWRldiwgYWRldi0+dmNuLmluZGlyZWN0X3NyYW0pOwog
CQlpZiAocikKIAkJCXJldHVybiByOwogCQlnb3RvIGpwZWc7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
