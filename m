Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EBA48EF7
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4998289B11;
	Mon, 17 Jun 2019 19:28:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B0589A94
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:32 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id a15so12211144qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i9hmP9vjAfdMGUpa5L4U26ZPvZzRPGnrb3hm8h0aL4M=;
 b=j5IA+DxHlw7dcJYJhRZMm9BTg+uBzHAXdfd3TMijruVks5o5sG7idQyhpZLHE7/vjA
 Ss492REKaThClGsZNXy/PYdL1Eb3wd0XTcxJR5SczaE83are25ytWMwvvTI8ezTnNR2F
 3o/HNRJuYPLAtadPxPs/MhGdXg+Bw8uYV0FL1N+e2ZCJdOPzbnmXwnBJbMWbSgAVGm60
 YWXz9AOkVupTnFdGI4Vqpk9bykGhv4BnHyi7hK9bqNtyiFO1UBIVVZkB6RQlf5P8CCwF
 BpFY7z/MBvaPgEsv9Ag7O92Oqkvj+r54jukoCnQL9StKjdR/jOouzNm7ik4lVMrzj/E/
 QLRQ==
X-Gm-Message-State: APjAAAWwf2ogDu0Oq3SG+sYkHa/48mCLlkpPcgjBeU9TLzMVUz/UMO/J
 jnrRuLpx/2D4yXWTQ5yBSO6uz6UC2yI=
X-Google-Smtp-Source: APXvYqz7WRSfg3tTnRLJw41Cf/SPUQK91Vne4mqtSYb7iPcXciTpvSk5TYFoacsQxdYKV0JIRsnXyQ==
X-Received: by 2002:a0c:876e:: with SMTP id 43mr12091916qvi.61.1560799711329; 
 Mon, 17 Jun 2019 12:28:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 185/459] drm/amd/powerplay: don't include the smu11 driver if
 header in smu v11 (v2)
Date: Mon, 17 Jun 2019 14:26:50 -0500
Message-Id: <20190617192704.18038-86-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i9hmP9vjAfdMGUpa5L4U26ZPvZzRPGnrb3hm8h0aL4M=;
 b=o8CY62c2ZY0HYOgHFNW+DuHX1QPrJdBRuHn8SaUDzO7LEChz/3yh3Q1eDA0Y4SpvSi
 S3+kqxsu07zXSZguTM5gXHcCPNNHvnNAzpALXIVd5jsRbUfPoAw7CnIWjh+g0HzDewJk
 /XMAyU9MtDlUbdvoA+JgICVnWIqeuv6kNVxFXhzZN38YGNun0WRFqMZ6OuItkRzgoH9F
 0s5OsLYC5XW8oaRl0Lgw65O5Ud/Y5ViI4GiRHvMtMW5Y+Lg+gI7tDHCVO7bGudWh5eE/
 tEv4NdF9dEKeiFmxM+i/87U+RfvF9JzIsk9ir7OEOMBmUXKQrnB79J1Etj8X2ZUa4zhU
 KATw==
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
 Kevin Wang <kevin1.wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClRoaXMgaGVhZGVyIGlzIGFjdHVh
bGx5IGZvciBlYWNoIGFzaWMsIHNvIHdlIHNob3VsZCBub3QgaW5jbHVkZSBpbiBzbXVfdjExXzAu
Yy4KQW5kIHJlbmFtZSB0aGUgb25lIGZvciBuYXZpMTAuCgp2MjogYWRkIGhhY2sgZm9yIFhHTUkg
KEFsZXgpCgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpSZXZp
ZXdlZC1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tp
bmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIC4uLi9pbmMve3NtdV8xMV8wX2Ry
aXZlcl9pZi5oID0+IHNtdTExX2RyaXZlcl9pZl9uYXZpMTAuaH0gICAgfCA0ICsrLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyAgICAgICAgICAgICAgICAgICAg
fCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyAgICAgICAg
ICAgICAgICAgICAgIHwgNCArKystCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKIHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
e3NtdV8xMV8wX2RyaXZlcl9pZi5oID0+IHNtdTExX2RyaXZlcl9pZl9uYXZpMTAuaH0gKDk5JSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211XzExXzBf
ZHJpdmVyX2lmLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJp
dmVyX2lmX25hdmkxMC5oCnNpbWlsYXJpdHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXVfMTFfMF9kcml2ZXJfaWYuaApyZW5hbWUgdG8g
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZl9uYXZpMTAu
aAppbmRleCAxYWI2ZTRlY2EwOWYuLjI1YjdjOGM0OTZmNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV8xMV8wX2RyaXZlcl9pZi5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9zbXUxMV9kcml2ZXJfaWZfbmF2aTEwLmgKQEAg
LTEsNSArMSw1IEBACi0jaWZuZGVmIF9fU01VMTFfRFJJVkVSX0lGX0hfXwotI2RlZmluZSBfX1NN
VTExX0RSSVZFUl9JRl9IX18KKyNpZm5kZWYgX19TTVUxMV9EUklWRVJfSUZfTkFWSTEwX0hfXwor
I2RlZmluZSBfX1NNVTExX0RSSVZFUl9JRl9OQVZJMTBfSF9fCiAKIC8vICoqKiBJTVBPUlRBTlQg
KioqCiAvLyBTTVUgVEVBTTogQWx3YXlzIGluY3JlbWVudCB0aGUgaW50ZXJmYWNlIHZlcnNpb24g
aWYgCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggOThj
MTc5OGU1OWQxLi42ZDFiMDFhNTIyOGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9uYXZpMTBfcHB0LmMKQEAgLTI4LDcgKzI4LDcgQEAKICNpbmNsdWRlICJhdG9tZmlybXdhcmUu
aCIKICNpbmNsdWRlICJhbWRncHVfYXRvbWZpcm13YXJlLmgiCiAjaW5jbHVkZSAic211X3YxMV8w
LmgiCi0jaW5jbHVkZSAic211XzExXzBfZHJpdmVyX2lmLmgiCisjaW5jbHVkZSAic211MTFfZHJp
dmVyX2lmX25hdmkxMC5oIgogI2luY2x1ZGUgInNvYzE1X2NvbW1vbi5oIgogI2luY2x1ZGUgImF0
b20uaCIKICNpbmNsdWRlICJuYXZpMTBfcHB0LmgiCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L3NtdV92MTFfMC5jCmluZGV4IGU0ZmJmOGRkNTdiMi4uNTY0YjYxYWY2YzMwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwpAQCAtMjcsNyArMjcsNiBAQAog
I2luY2x1ZGUgImF0b21maXJtd2FyZS5oIgogI2luY2x1ZGUgImFtZGdwdV9hdG9tZmlybXdhcmUu
aCIKICNpbmNsdWRlICJzbXVfdjExXzAuaCIKLSNpbmNsdWRlICJzbXVfMTFfMF9kcml2ZXJfaWYu
aCIKICNpbmNsdWRlICJzb2MxNV9jb21tb24uaCIKICNpbmNsdWRlICJhdG9tLmgiCiAjaW5jbHVk
ZSAidmVnYTIwX3BwdC5oIgpAQCAtMTczOSw2ICsxNzM4LDkgQEAgc3RhdGljIGludCBzbXVfdjEx
XzBfc2V0X2Zhbl9zcGVlZF9ycG0oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJcmV0dXJuIHJl
dDsKIH0KIAorI2RlZmluZSBYR01JX1NUQVRFX0QwIDEKKyNkZWZpbmUgWEdNSV9TVEFURV9EMyAw
CisKIHN0YXRpYyBpbnQgc211X3YxMV8wX3NldF94Z21pX3BzdGF0ZShzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwKIAkJCQkgICAgIHVpbnQzMl90IHBzdGF0ZSkKIHsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
