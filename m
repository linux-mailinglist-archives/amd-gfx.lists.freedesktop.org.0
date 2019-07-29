Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301A779987
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623706E28F;
	Mon, 29 Jul 2019 20:15:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC30C6E237
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:39 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id v6so41905208vsq.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3dxjQx2C6H/WVRvuv172UKYHYP40WtVTG+IQNlFmF0Y=;
 b=lDkWAnz9SasHlgNWMBQCIGYacwS5BJ4j1ND/WcWhBNWeunkX4Tjdi69/p+PsLJkpy2
 T/I7y83UX9VADDNiucY8QNjxbuw4ZkxH9E/xwFnXzxW6f2HnWcoWLnUvTtk53F9GsExx
 0qlAwfHUln2TKgi4kAe693/Bcghrjd2RjijuWt8NCUd6wClTMmIaGGDoHnrSZpZTOt9t
 jjXiBQoK9cSZMF2VCcIRTqDRJEskmLMNqcGrS5D7+i43xEGK71BKEYb7NddSXtoEgEc5
 /vrGin6t0A+WlkFyBuGZtl2t+rdPwpd5aN3S5TQgcdwPyz7Sv8haDjFpk3fdbaLZ19rh
 FiKw==
X-Gm-Message-State: APjAAAVjebMzxejFeFB4nj2QqQHyb29+3ijybQdZXayOUAWyaiI879N0
 sblvkSVCyFdPfVDXG0mGi0iUPTfu
X-Google-Smtp-Source: APXvYqyqdOJDDx5EqMNArLNjvyegOjkMeiGWNglGFCBoZwTPj0lYWPKtdlj9Lb8pgLRlbZv9T5Lh+w==
X-Received: by 2002:a67:fd13:: with SMTP id f19mr69298432vsr.25.1564431338562; 
 Mon, 29 Jul 2019 13:15:38 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 20/30] drm/amd/powerplay: support real-time clock retrieval on
 arcturus
Date: Mon, 29 Jul 2019 15:14:58 -0500
Message-Id: <20190729201508.16136-21-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3dxjQx2C6H/WVRvuv172UKYHYP40WtVTG+IQNlFmF0Y=;
 b=Ek35c6ym/SVbD48cLF8PihJe2bwtMIiepFVDqI8wnH4vlG1F9N3v2VV30oraBX3MmS
 LgZeQ5wiOFtfqGGbmStRo8Yl5iHgp4nUkSVPTFdGzAio8HwGHagqR11BmC2gxSVpsQ0H
 858ZsGyj1Al0Kc19J6WGRaPT/1tlp4DRmrGaT39Jb9aVCpfqZd5x/magSf+ygTBvEb+5
 CjRdmalHnCrFXuJwv7x6rSrbqrrzv8PT1LI5qAXKrY8KmsaQm0q/JQevLyf/PdJC4Itn
 kI3xeUbohiAYMhH5MpsxFkEzsM04xx+iC31AiIp56ZawmQ+4HONWuu/N5MYut74F0mvU
 rfSA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCkVuYWJsZSBhcmN0dXJ1cyByZWFs
LXRpbWUgY2xvY2sgcmV0cmlldmFsLgoKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1
YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyB8IDI0ICsrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKaW5kZXggMWRiYjkxN2Zi
OTE2Li4zYTcwMjExMGQ5YmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FyY3R1cnVzX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Fy
Y3R1cnVzX3BwdC5jCkBAIC05OTQsNiArOTk0LDI5IEBAIHN0YXRpYyBpbnQgYXJjdHVydXNfcmVh
ZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJcmV0dXJuIHJldDsKIH0KIAorc3Rh
dGljIGludCBhcmN0dXJ1c19nZXRfY3VycmVudF9jbGtfZnJlcV9ieV90YWJsZShzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwKKwkJCQkgICAgICAgZW51bSBzbXVfY2xrX3R5cGUgY2xrX3R5cGUsCisJ
CQkJICAgICAgIHVpbnQzMl90ICp2YWx1ZSkKK3sKKwlzdGF0aWMgU211TWV0cmljc190IG1ldHJp
Y3M7CisJaW50IHJldCA9IDAsIGNsa19pZCA9IDA7CisKKwlpZiAoIXZhbHVlKQorCQlyZXR1cm4g
LUVJTlZBTDsKKworCWNsa19pZCA9IHNtdV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX3R5cGUpOwor
CWlmIChjbGtfaWQgPCAwKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXJldCA9IGFyY3R1cnVzX2dl
dF9tZXRyaWNzX3RhYmxlKHNtdSwgJm1ldHJpY3MpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7
CisKKwkqdmFsdWUgPSBtZXRyaWNzLkN1cnJDbG9ja1tjbGtfaWRdOworCisJcmV0dXJuIHJldDsK
K30KKwogc3RhdGljIHZvaWQgYXJjdHVydXNfZHVtcF9wcHRhYmxlKHN0cnVjdCBzbXVfY29udGV4
dCAqc211KQogewogCXN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqdGFibGVfY29udGV4dCA9ICZz
bXUtPnNtdV90YWJsZTsKQEAgLTE0NDgsNiArMTQ3MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cHB0YWJsZV9mdW5jcyBhcmN0dXJ1c19wcHRfZnVuY3MgPSB7CiAJLnNldF9kZWZhdWx0X2RwbV90
YWJsZSA9IGFyY3R1cnVzX3NldF9kZWZhdWx0X2RwbV90YWJsZSwKIAkucG9wdWxhdGVfdW1kX3N0
YXRlX2NsayA9IGFyY3R1cnVzX3BvcHVsYXRlX3VtZF9zdGF0ZV9jbGssCiAJLmdldF90aGVybWFs
X3RlbXBlcmF0dXJlX3JhbmdlID0gYXJjdHVydXNfZ2V0X3RoZXJtYWxfdGVtcGVyYXR1cmVfcmFu
Z2UsCisJLmdldF9jdXJyZW50X2Nsa19mcmVxX2J5X3RhYmxlID0gYXJjdHVydXNfZ2V0X2N1cnJl
bnRfY2xrX2ZyZXFfYnlfdGFibGUsCiAJLnByaW50X2Nsa19sZXZlbHMgPSBhcmN0dXJ1c19wcmlu
dF9jbGtfbGV2ZWxzLAogCS5mb3JjZV9jbGtfbGV2ZWxzID0gYXJjdHVydXNfZm9yY2VfY2xrX2xl
dmVscywKIAkucmVhZF9zZW5zb3IgPSBhcmN0dXJ1c19yZWFkX3NlbnNvciwKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
