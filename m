Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7783549058
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDA46E04E;
	Mon, 17 Jun 2019 19:50:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40116E043
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:06 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m29so12340287qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f4M/K0bhjde2/NjzjV6W+HGmQIlKinyNmv/bWNzx6yk=;
 b=trGF4ovvAY9IfOCDcjf18dp1C2lPMwivVnJcmLLKGOlci+3SGluFXRirP38qENeZzM
 DSZkq0JZjidtJ6AORyA64Kn4+VrQ9+RT9MJkOAl5dx0XGo5pZLe+u+84tOc0s+SoyqCn
 VODz6MQ1glWbZu9UEWCAJ8rn9r5lorTpSN6Tx0fY2UC/2DS30LL9X7yEFPcvBqjQa2H7
 5uCBdH1xJIblESwIj1JOJQcYc70YN8gUfpARErbYBvuFrM+AlewevLems6aMbfQCeF3R
 E0VGFEhAKD2WiaKJ6q+DTXqaFlt4dAZ9kXi1OC/N9mzFuuV3fYeIcksnTXmF0oSTq73B
 G6ng==
X-Gm-Message-State: APjAAAXc8KMY7jsLxdMKMRsfSHeUwfEGC+XfVCadXtJVYW2IRMUhHkVL
 WAPkmL6KzhfCNA5ekbf4IsAX5RHMRyKVMA==
X-Google-Smtp-Source: APXvYqwhCKFy9XP9RsfTBInU8RAKCNo+HxFctTDdtavH1DBnDw9Noe8ByCDqHiaDuZ29rxDHAW4qTA==
X-Received: by 2002:ac8:2410:: with SMTP id c16mr14154878qtc.108.1560801005772; 
 Mon, 17 Jun 2019 12:50:05 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 410/459] drm/amd/display: add flags for gamut map library
Date: Mon, 17 Jun 2019 14:48:59 -0500
Message-Id: <20190617194948.18667-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f4M/K0bhjde2/NjzjV6W+HGmQIlKinyNmv/bWNzx6yk=;
 b=kNheSubOd/dB+oLGRrjUm0jQE/i3/APLD1pyVkzqEluEjiGWJOZKPJa7CM0uk0TBV8
 wBPqIXBoowCFnTHT74u71xVNEjoyFi9Qljq9mDAnKvt3qs51eAqbqNTzv//jW9O+2UVT
 CcBu4OMfpfIJOf5OtfTO2A7+eFlO8waPECodRTNcxNH94PMaysMp/RRD+g4SzRzgfNXf
 B22E+YfyofK8zB8hvu6Kpurkm/MhBCpuv3FHPOlqW9GN0DlxDjuYxB7PrcFuqvtQRbL4
 Fqy9VMmdVfAsh/QEFkk9MigcVcicHBZzpLARWAh2RGBZgvN1xbAsV2RZ1dipG8oBIDlh
 bRVw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Vitaly Prosyak <Vitaly.Prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVml0YWx5IFByb3N5YWsgPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+CgpbV2h5ICYgSG93
XQpHYW11dCBtYXAgbGliIHByb3ZpZGVzIGEgd2lkZXIgZ2FtdXQgbWFwcGluZyBvcHRpb25zCnZz
IEJUMjM5MAoKU2lnbmVkLW9mZi1ieTogVml0YWx5IFByb3N5YWsgPHZpdGFseS5wcm9zeWFrQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBLcnVub3NsYXYgS292YWMgPEtydW5vc2xhdi5Lb3ZhY0BhbWQu
Y29tPgpBY2tlZC1ieTogQXJpYyBDeXIgPEFyaWMuQ3lyQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3
YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQgTGFraGFAYW1kLmNvbT4KQWNrZWQtYnk6IFZpdGFs
eSBQcm9zeWFrIDxWaXRhbHkuUHJvc3lha0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2RybS9hbWQvZGlzcGxh
eS9tb2R1bGVzL2luYy9tb2Rfc2hhcmVkLmggIHwgMjQgKysrKysrKysrKysrKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmMvbW9kX3NoYXJlZC5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21vZF9zaGFyZWQuaAppbmRl
eCA5NDA2ZDBhMTY3ZWUuLjZjODc3ZWViYTQyOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L21vZHVsZXMvaW5jL21vZF9zaGFyZWQuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmMvbW9kX3NoYXJlZC5oCkBAIC02MSw3ICs2MSwxMCBA
QCB1bmlvbiBsdXQzZF9jb250cm9sX2ZsYWdzIHsKIAkJdW5zaWduZWQgaW50IHVzZV8zZGx1dAkJ
CQkJOjE7CiAJCXVuc2lnbmVkIGludCBsZXNzX3RoYW5fZGNpcDMJCQkJOjE7CiAJCXVuc2lnbmVk
IGludCBvdmVycmlkZV9sdW0JCQkJOjE7Ci0JCXVuc2lnbmVkIGludCByZXNldmVkCQkJCQk6ODsK
KwkJdW5zaWduZWQgaW50IHVzZV9nYW11dF9tYXBfbGliCQkJCQk6MTsKKwkJdW5zaWduZWQgaW50
IGNocm9tYXRpY19hZGFwdGF0aW9uX3NyYwkJCQk6MTsKKwkJdW5zaWduZWQgaW50IGNocm9tYXRp
Y19hZGFwdGF0aW9uX2RzdAkJCQk6MTsKKwkJdW5zaWduZWQgaW50IHJlc2V2ZWQJCQkJCTo1Owog
CX0gYml0czsKIH07CiAKQEAgLTcxLDYgKzc0LDIxIEBAIGVudW0gdG1fc2hvd19vcHRpb25faW50
ZXJuYWwgewogCXRtX3Nob3dfb3B0aW9uX2ludGVybmFsX2R1cGxpY2F0ZV9zaWRlYnlzaWRlLyp1
c2UgZmxhZ3MyKi8KIH07CiAKK2VudW0gbHV0M2RfY29udHJvbF9nYW11dF9tYXAgeworCWx1dDNk
X2NvbnRyb2xfZ2FtdXRfbWFwX25vbmUgPSAwLAorCWx1dDNkX2NvbnRyb2xfZ2FtdXRfbWFwX3Rv
bmVtYXAsCisJbHV0M2RfY29udHJvbF9nYW11dF9tYXBfY2h0bywKKwlsdXQzZF9jb250cm9sX2dh
bXV0X21hcF9jaHRvX2Noc28sCisJbHV0M2RfY29udHJvbF9nYW11dF9tYXBfY2h0b19jaGNpCit9
OworCitlbnVtIGx1dDNkX2NvbnRyb2xfcm90YXRpb25fbW9kZSB7CisJbHV0M2RfY29udHJvbF9y
b3RhdGlvbl9tb2RlX25vbmUgPSAwLAorCWx1dDNkX2NvbnRyb2xfcm90YXRpb25fbW9kZV9odWUs
CisJbHV0M2RfY29udHJvbF9yb3RhdGlvbl9tb2RlX2NjLAorCWx1dDNkX2NvbnRyb2xfcm90YXRp
b25fbW9kZV9odWVfY2MKK307CisKIHN0cnVjdCBsdXQzZF9zZXR0aW5ncyB7CiAJdW5zaWduZWQg
Y2hhciB2ZXJzaW9uOwogCXVuaW9uIGx1dDNkX2NvbnRyb2xfZmxhZ3MgZmxhZ3M7CkBAIC04MCw2
ICs5OCwxMCBAQCBzdHJ1Y3QgbHV0M2Rfc2V0dGluZ3MgewogCXVuc2lnbmVkIGludCBtYXhfbHVt
OwogCXVuc2lnbmVkIGludCBtaW5fbHVtMjsKIAl1bnNpZ25lZCBpbnQgbWF4X2x1bTI7CisJZW51
bSBsdXQzZF9jb250cm9sX2dhbXV0X21hcCBtYXA7CisJZW51bSBsdXQzZF9jb250cm9sX3JvdGF0
aW9uX21vZGUgcm90YXRpb247CisJZW51bSBsdXQzZF9jb250cm9sX2dhbXV0X21hcCBtYXAyOwor
CWVudW0gbHV0M2RfY29udHJvbF9yb3RhdGlvbl9tb2RlIHJvdGF0aW9uMjsKIH07CiAjZW5kaWYK
IAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
